-- Run once in Supabase > SQL Editor to switch on live tracking
create table if not exists public.tracks (
  code text primary key,
  lat double precision,
  lng double precision,
  updated_at timestamptz default now()
);
alter table public.tracks enable row level security;

create or replace function public.track_update(p_code text, p_lat double precision, p_lng double precision)
returns void language sql security definer set search_path = public as $$
  insert into tracks(code, lat, lng, updated_at) values (left(p_code,16), p_lat, p_lng, now())
  on conflict (code) do update set lat = excluded.lat, lng = excluded.lng, updated_at = now();
$$;

create or replace function public.track_get(p_code text)
returns table(lat double precision, lng double precision, updated_at timestamptz)
language sql security definer set search_path = public as $$
  select lat, lng, updated_at from tracks where code = left(p_code,16);
$$;

grant execute on function public.track_update(text, double precision, double precision) to anon, authenticated;
grant execute on function public.track_get(text) to anon, authenticated;
