# Cargo Link

A phone-first web app (PWA) that connects customers with truck, canter and pickup drivers in Uganda and East Africa. Works on phones, tablets and computers. It can be installed on the home screen and opens fast.

## Contacts set in the app
- WhatsApp Business (customer requests, payments, photos): **0766 791 805**
- Support phone (Call support button, FAQ page): **0700 275758**
- Driver listing fee: **UGX 30,000 per month**, first month free for new drivers

## Files in this folder
| File | What it is |
|---|---|
| `index.html` | The whole app (customer side and driver side) |
| `drivers.json` | Drivers, settings and optional prices. The admin page creates this file |
| `m-4d248d1dd414b958d4229b14.html` | Locked admin page (open it from the hidden gate, see below) |
| `tracking.sql` | Run once in Supabase to switch on live tracking |
| `sw.js` | Offline and speed support |
| `manifest.webmanifest`, `icon-*.png` | Home-screen install details and icons |
| `README.md` | This guide |

## Put it online
1. Upload **every file** in this folder to your website host (Netlify, Cloudflare Pages, GitHub Pages or any host). It must be `https://`.
2. Open your address on a phone. Choose "Add to Home screen".
3. After each update, upload all files again and refresh twice (the app updates itself in the background).

## Admin page
1. Open your app, open the menu (three lines) and choose **Help, contact and terms**. Tap the "Help and contact" panel text 7 times quickly.
2. Type your **access code**, then your **password** on the next screen.
3. Inside you can: add and edit drivers, tick their vehicles, set Paid until (+30 days button), mark Verified, add photos, hide a driver, record who invited whom, give the inviter 30 free days, send one message to all drivers, edit price estimates, see renewals due, see the report, make the QR poster.
4. After any change tap **Download drivers.json** and upload that file to your website. Changes reach customers only after this upload.
5. Keep your access code and password private. After 5 wrong tries the page locks for 15 minutes.

## Drivers: how they join
1. Driver messages you on WhatsApp (0766 791 805) and pays UGX 30,000 by mobile money (first month free for new drivers).
2. You add the driver in the admin page, set Paid until, add his photos, tick vehicles, Download drivers.json and upload it.
3. In the admin page the Driver accounts section gives each driver an activation PIN. With the PIN the driver logs in on the Drivers tab (needs Supabase).
4. A logged-in driver has: **I am free now**, **Returning empty** (shown to all customers), **Live tracking**, **Send photos to admin** and **Invite a driver** (get 1 month free).

## Switch on the online features (Supabase)
Needed for jobs and quotes, driver login, free-today status and live tracking.
1. Create a free project at supabase.com.
2. In the admin page Settings paste the **Project URL** and the **anon / publishable key**. Never use the secret key.
3. In the admin page open Driver accounts and tap **Copy Supabase SQL**. Paste it in Supabase SQL Editor and Run.
4. Open `tracking.sql`, paste it in the SQL Editor and Run (live tracking).
5. Download drivers.json and upload it.

## Live tracking
- Driver: Hub, Live tracking, Start. Allow location. Keep the page open. Send the tracking link or code to the customer.
- Customer: Drivers tab, Track a delivery, type the code. The map refreshes every 10 seconds.
- Without Supabase the driver can still tap Send my location on WhatsApp.

## Customer features
Book a truck (match drivers by vehicle, route, express and cross-border), Prices guide, Business requests (Get drivers who match), Maps, Drivers directory with filters (Free today, Returning empty, Town, Cross-border and every vehicle), Loading helpers request, Track a delivery, Share on WhatsApp, Terms, privacy and FAQ.

## Vehicles supported
Small pickup, Large pickup, Canter, Box body, Fuso, Large truck, Tipper, Flatbed, Water bowser, Boda boda cargo, Cargo tricycle, Van, Double cabin pickup, Isuzu/Hino/FAW truck, Sinotruk (HOWO), Trailer or tractor head, Container truck, Fuel tanker, Refrigerated truck, Livestock truck, Car carrier, Concrete mixer, Crane lorry, Low-bed trailer.

## Test checklist before you launch
- Open on a phone and a computer; move through every bottom tab.
- Business tab: fill the form, press Get drivers who match.
- Drivers tab: try each filter; press Track a delivery.
- Footer: press Call support and Share.
- Admin page: add a test driver, Download drivers.json, upload, refresh the app.
- Log in as a test driver and press Start live tracking.

## Known limits
- Customer reviews were removed on purpose.
- Price estimates are guides only; edit them in the admin page.
- Cross-border filter reads the routes and towns written for each driver.
- Changing the admin code or password needs a new locked admin file.

## Language, theme and text size
Tap the globe button at the top right.
- Languages: English, Luganda, Kiswahili, French, Arabic (right-to-left). The app remembers the choice and uses the phone language the first time. French and Arabic translate the main screens, buttons, menus and vehicle names; longer help text stays in English until translated.
- Theme: Auto, Light or Dark (Dark is the default).
- Text size: A, A+ or A++ for bigger writing.
- Runyankole, Luo and Acholi are not added yet because they need a native speaker to check the words.

## Business plan and adverts
- **Business plan:** shown at the top of the Business tab. Default price UGX 15,000 per month (cheaper than the UGX 30,000 driver listing). Change the price in the admin page under Settings, "Business plan fee". Companies tap the button and message you on WhatsApp; you collect payment by mobile money and give them the benefits listed on the card (same-day driver finding, a regular driver, priority help, monthly trip summary on request).
- **Adverts:** only the admin can post adverts. In the admin page open "Adverts", fill the title, message, button (WhatsApp, call or website), where to show it, optional dates and picture, then Add advert. Download drivers.json and upload it. Adverts appear marked "Sponsored" on the Home, Book and Business pages. Pause, resume or remove them any time. Each slot also shows "Advertise here" so businesses can ask you.

## Areas, nearby drivers and customers
- **Customers:** the Home page has "Your area" (Kampala, Entebbe, Wakiso, Mukono, Jinja, Mbale, Soroti, Lira, Gulu, Arua, Hoima, Fort Portal, Masaka, Mbarara, Kabale). A customer picks an area or taps "Use my location". Drivers whose base, towns or routes match that area show first, with a count of drivers and free trucks. The list refreshes by itself every minute. The Book page also puts drivers in the pickup area first.
- **Drivers:** the area comes from the **Base town** you write on the driver card in the admin page (for example "Kampala" or "Entebbe"). In the driver page, the requests list shows customers whose pickup or delivery is in his area first, with a button to see all areas, and refreshes every 45 seconds. This needs Supabase to be switched on.
- Write base towns, towns and routes clearly on each driver card, because that is what the app matches on.

## Trust and activity tools
- **Report a driver:** every driver profile has a Report box that sends the reason and the driver details to your WhatsApp. Use Hide in the admin page for drivers with real complaints.
- **Trips completed:** type the number on the driver card in the admin page. It shows on his card.
- **Phone checked:** in the admin page, send the check code on WhatsApp, and tick "Phone checked" when the driver replies with the same code. A real SMS code needs a paid SMS service, so this uses WhatsApp instead.
- **Share my driver card:** drivers get a button to post their card on WhatsApp status and groups.
- **Loads waiting for drivers:** post this week's loads in the admin page. They show on the Home page and drivers tap "I can take it" to message you. Each load disappears after its date.

## Help page, more vehicles, rider fee
- **One Help page:** Terms, privacy, FAQ, Call support, WhatsApp chat, Share, Report a problem and the copyright line are now only on the Help page (menu, "Help, contact and terms"). A short, modern footer (quick links, WhatsApp, call, share, report) now shows at the bottom of every page.
- **More vehicles:** Isuzu Elf, Toyota Town Ace, Toyota Dyna or Hino Dutro, Tata, Iveco Daily/Foton/JAC light trucks, Suzuki Carry or Daihatsu Hijet mini trucks, Isuzu Forward, Hino Ranger, Scania/Actros/Volvo/DAF and Shacman/Dongfeng/Foton heavy trucks. Tick them on driver cards in the admin page.
- **Rider fee:** drivers whose only vehicles are Boda boda cargo and/or Cargo tricycle pay half: UGX 15,000 per month. Change it in the admin page Settings ("Monthly fee for boda boda and tricycle riders"). Reminder messages and the income report use the right fee for each driver.
