Return-Path: <linux-arm-msm+bounces-105618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ev7HJe992m5lgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 23:26:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF8D4B7844
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 23:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0797A3001451
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 21:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C49C3A75A4;
	Sun,  3 May 2026 21:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="slCTYAT0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1BF2FC01B;
	Sun,  3 May 2026 21:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777843605; cv=none; b=P0oAYT98o7K+N6eVULiZ5aDW9ji/xHcyf83sIJ/Cr+uIoZ57OuUymPMjRmrNcN7kCJDAXa1PQJYG11IUwuU2YTUn7EheiOSeaan8Ywx3Uk11qrxaw9r3VX0e2Qaslk1bxKW2m7w14tU7Dl/DOCuMpQ29FEFCmb8k2H5FC0YpctY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777843605; c=relaxed/simple;
	bh=mGxxx5rlEhYX6aDxhTmIWHmXSLYSRuk9+RfNi8lZj4g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i2+wR8Pn0y03nXISw7cEgajycKMbqR5dqj7H7aNdrRJcYl34rxwoqpoFnXTOP6m1P8wPpFRXyJQSHV0ht6vQaY/k+1UwwROx0BagUhEdwlJk1M2esYN4aqf+3eFwORDionJPRnqqozb1EbJ4Vj0oeR7TsQnEzWynLxX62u5Rruw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=slCTYAT0; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1777843590; x=1778102790;
	bh=30dNlaMovERfG6QbXHKtJXgPMrRc3asfKTDDTA6W6jo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=slCTYAT0OIB3lXVKq3iIIfmjfgYXKxR04jwhPMUf+36jhDecpdzeAZWnSwm43wOBC
	 1xmlNflth5AJKmopjFa9STofSsfxtn2cE3VM//gMdDl1SH7M+Uzbmj3wMziHZlpfMu
	 h8iMeIqlFMoNoGnD3VNEOJ98PJiFCCRMB6XGeglMdMmIBzR5M77ZT1z8ceuxfWszHQ
	 zxkir8x2fUfWg8c92k+CGZOcEvSh/thlPSHCEnM+a0QoSIoPo1fM8vcsqco/O125Bq
	 EGQz8TF6M3Tf7dfi83VAU1aASZyXS+cJjIf40qvZr/+G20iOczMwhHecssC2ub56na
	 czVMHlekf9nrg==
Date: Sun, 03 May 2026 21:26:25 +0000
To: Bjorn Andersson <andersson@kernel.org>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>
Subject: Re: [PATCH v2 2/4] platform: arm64: dell-xps-ec: new driver
Message-ID: <KbbY1g4ZwssZspNynghCTLTJ6chMmbGnJKkgOwy-s3HHZVyNSXFIjBZDavMnLuLU1izAa4yhZ2ZSinaCP2covvLrF6D8_CV9vUJV9UbqDbk=@vinarskis.com>
In-Reply-To: <adOl-iVGAyiA-QSx@baldur>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com> <20260404-dell-xps-9345-ec-v2-2-c977c3caa81f@vinarskis.com> <6be0cefb-72e4-4a8a-8668-45994db6c5d8@linaro.org> <P9IQ5Penud7CH3Yfn0bw0RXJfIhFhFGksRjP-aZwLoAxmajMfeOtLEItrcWOXwVjHE_zObIA8SYjcPVR9dkAk9KgDYLun0DJJ6dBIU-IRDI=@vinarskis.com> <adOl-iVGAyiA-QSx@baldur>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 73840918c208c2d61ca9fb4196b833e53b51837d
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0FF8D4B7844
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105618-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bewilderbeest.net:email,vinarskis.com:email,vinarskis.com:dkim,vinarskis.com:mid]





On Monday, April 6th, 2026 at 14:32, Bjorn Andersson <andersson@kernel.org>=
 wrote:

> On Sun, Apr 05, 2026 at 08:48:25PM +0000, Aleksandrs Vinarskis wrote:
> > On Sunday, April 5th, 2026 at 02:29, Bryan O'Donoghue <bryan.odonoghue@=
linaro.org> wrote:
> >
> > > On 04/04/2026 13:55, Aleksandrs Vinarskis wrote:
> > > > Introduce EC driver for Dell XPS 13 9345 (codename 'tributo') which=
 may
> > > > partially of fully compatible with Snapdragon-based Dell Latitude,
> > > > Inspiron ('thena'). Primary function of this driver is unblock EC's
> > > > thermal management, specifically to provide it with necessary
> > > > information to control device fans, peripherals power.
> > > >
> > > > The driver was developed primarily by analyzing ACPI DSDT's _DSM an=
d
> > > > i2c dumps of communication between SoC and EC. Changes to Windows
> > > > driver's behavior include increasing temperature feed loop from ~50=
ms
> > > > to 100ms here.
> > > >
> > > > While Xps's EC is rather complex and controls practically all devic=
e
> > > > peripherals including touch row's brightness and special keys such =
as
> > > > mic mute, these do not go over this particular i2c interface.
> > > >
> > > > Not yet implemented features:
> > > > - On lid-close IRQ event is registered. Windows performs what to
> > > >    appears to be thermistor constants readout, though its not obvio=
us
> > > >    what it used for.
> > > > - According to ACPI's _DSM there is a method to readout fans' RPM.
> > > > - Initial thermistor constants were sniffed from Windows, these can=
 be
> > > >    likely fine tuned for better cooling performance.
> > > > - There is additional temperature reading that Windows sents to EC =
but
> > > >    more rare than others, likely SoC T_j / TZ98 or TZ4. This is the=
 only
> > > >    thermal zone who's reading can exceed 115C without triggering th=
ermal
> > > >    shutdown.
> > > > - Given similarities between 'tributo' and 'thena' platforms, inclu=
ding
> > > >    EC i2c address, driver can be potentially extended to support bo=
th.
> > > >
> > > > Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> > > > ---
> > > >   MAINTAINERS                          |   1 +
> > > >   drivers/platform/arm64/Kconfig       |  12 ++
> > > >   drivers/platform/arm64/Makefile      |   1 +
> > > >   drivers/platform/arm64/dell-xps-ec.c | 267 ++++++++++++++++++++++=
+++++++++++++
> > > >   4 files changed, 281 insertions(+)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index a5d175559f4468dfe363b319a1b08d3425f4d712..c150f57b60706224e5b=
24b0dfb3d8a9b81f36398 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -7240,6 +7240,7 @@ DELL XPS EMBEDDED CONTROLLER DRIVER
> > > >   M:=09Aleksandrs Vinarskis <alex@vinarskis.com>
> > > >   S:=09Maintained
> > > >   F:=09Documentation/devicetree/bindings/embedded-controller/dell,x=
ps13-9345-ec.yaml
> > > > +F:=09drivers/platform/arm64/dell-xps-ec.c
> > > >
> > > >   DELTA AHE-50DC FAN CONTROL MODULE DRIVER
> > > >   M:=09Zev Weiss <zev@bewilderbeest.net>
> > > > diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm6=
4/Kconfig
> > > > index 10f905d7d6bfa5fad30a0689d3a20481268c781e..0bc8f016032bb05cb3a=
7cc50bdf1092da04153bc 100644
> > > > --- a/drivers/platform/arm64/Kconfig
> > > > +++ b/drivers/platform/arm64/Kconfig
> > > > @@ -33,6 +33,18 @@ config EC_ACER_ASPIRE1
> > > >   =09  laptop where this information is not properly exposed via th=
e
> > > >   =09  standard ACPI devices.
> > > >
> > > > +config EC_DELL_XPS
> > > > +=09tristate "Dell XPS 9345 Embedded Controller driver"
> > > > +=09depends on ARCH_QCOM || COMPILE_TEST
> > > > +=09depends on I2C
> > > > +=09depends on IIO
> > > > +=09help
> > > > +=09  Driver for the Embedded Controller in the Qualcomm Snapdragon=
-based
> > > > +=09  Dell XPS 13 9345, which handles thermal management and fan sp=
eed
> > > > +=09  control.
> > > > +
> > > > +=09  Say M or Y here to include this support.
> > > > +
> > > >   config EC_HUAWEI_GAOKUN
> > > >   =09tristate "Huawei Matebook E Go Embedded Controller driver"
> > > >   =09depends on ARCH_QCOM || COMPILE_TEST
> > > > diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm=
64/Makefile
> > > > index 60c131cff6a15bb51a49c9edab95badf513ee0f6..6768dc6c2310837374e=
67381cfc729bed1fdaaef 100644
> > > > --- a/drivers/platform/arm64/Makefile
> > > > +++ b/drivers/platform/arm64/Makefile
> > > > @@ -6,6 +6,7 @@
> > > >   #
> > > >
> > > >   obj-$(CONFIG_EC_ACER_ASPIRE1)=09+=3D acer-aspire1-ec.o
> > > > +obj-$(CONFIG_EC_DELL_XPS)=09+=3D dell-xps-ec.o
> > > >   obj-$(CONFIG_EC_HUAWEI_GAOKUN)=09+=3D huawei-gaokun-ec.o
> > > >   obj-$(CONFIG_EC_LENOVO_YOGA_C630) +=3D lenovo-yoga-c630.o
> > > >   obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) +=3D lenovo-thinkpad-t14s.o
> > > > diff --git a/drivers/platform/arm64/dell-xps-ec.c b/drivers/platfor=
m/arm64/dell-xps-ec.c
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..bf1495fbe473ccdb82b=
95a66b56e8525f782cc8e
> > > > --- /dev/null
> > > > +++ b/drivers/platform/arm64/dell-xps-ec.c
> > > > @@ -0,0 +1,267 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Copyright (c) 2026, Aleksandrs Vinarskis <alex@vinarskis.com>
> > > > + */
> > > > +
> > > > +#include <linux/array_size.h>
> > > > +#include <linux/dev_printk.h>
> > > > +#include <linux/device.h>
> > > > +#include <linux/devm-helpers.h>
> > > > +#include <linux/err.h>
> > > > +#include <linux/i2c.h>
> > > > +#include <linux/iio/consumer.h>
> > > > +#include <linux/interrupt.h>
> > > > +#include <linux/jiffies.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/pm.h>
> > > > +#include <linux/unaligned.h>
> > > > +#include <linux/workqueue.h>
> > > > +
> > > > +#define DELL_XPS_EC_SUSPEND_CMD=09=090xb9
> > > > +#define DELL_XPS_EC_SUSPEND_MSG_LEN=0964
> > > > +
> > > > +#define DELL_XPS_EC_TEMP_CMD0=09=090xfb
> > > > +#define DELL_XPS_EC_TEMP_CMD1=09=090x20
> > > > +#define DELL_XPS_EC_TEMP_CMD3=09=090x02
> > > > +#define DELL_XPS_EC_TEMP_MSG_LEN=096
> > > > +#define DELL_XPS_EC_TEMP_POLL_JIFFIES=09msecs_to_jiffies(100)
> > > > +
> > > > +/*
> > > > + * Format:
> > > > + * - header/unknown (2 bytes)
> > > > + * - per-thermistor entries (3 bytes): thermistor_id, param1, para=
m2
> > > > + */
> > > > +static const u8 dell_xps_ec_thermistor_profile[] =3D {
> > > > +=090xff, 0x54,
> > > > +=090x01, 0x00, 0x2b,=09/* sys_therm0 */
> > > > +=090x02, 0x44, 0x2a,=09/* sys_therm1 */
> > > > +=090x03, 0x44, 0x2b,=09/* sys_therm2 */
> > > > +=090x04, 0x44, 0x28,=09/* sys_therm3 */
> > > > +=090x05, 0x55, 0x2a,=09/* sys_therm4 */
> > > > +=090x06, 0x44, 0x26,=09/* sys_therm5 */
> > > > +=090x07, 0x44, 0x2b,=09/* sys_therm6 */
> > > > +};
> > > > +
> > > > +/*
> > > > + * Mapping from IIO channel name to EC command byte
> > > > + */
> > > > +static const struct {
> > > > +=09const char *name;
> > > > +=09u8 cmd;
> > > > +} dell_xps_ec_therms[] =3D {
> > > > +=09/* TODO: 0x01 is sent only occasionally, likely TZ98 or TZ4 */
> > > > +=09{ "sys_therm0", 0x02 },
> > > > +=09{ "sys_therm1", 0x03 },
> > > > +=09{ "sys_therm2", 0x04 },
> > > > +=09{ "sys_therm3", 0x05 },
> > > > +=09{ "sys_therm4", 0x06 },
> > > > +=09{ "sys_therm5", 0x07 },
> > > > +=09{ "sys_therm6", 0x08 },
> > > > +};
> > >
> > > You could probably retrieve these strings from the dt if you really n=
eed
> > > them.
> > >
> > > I don't think you need static consts in your driver though you could
> > > just as easily do `sprintf("sys_therm%d\n", i) where you use
> > > ec_therms[i].name - the name is only used to print errors and you hav=
e
> > > the index of the channel when you do.
> > >
> > > It would be nicer to get the strings from DT - certainly make the str=
ing
> > > names mandatory but, then let the DT specify those names.
> > >
> > > Either that or just do the sprintf("sys_therm%d\n", i); for the index=
,
> > > whichever you wish yourself.
> >
> > Hi Bryan,
> >
> > Will answer here to all three comments about `sys_thermX`.
> >
> > The reason I have added them as static consts here, and defined them in
> > the schema is because the order of the channels matters:
> > 1. On my XPS (UEFI v2.11.0) changes in sys_therm2 immediately result in
> >    changes in fan speeds. Other channels seemingly have no affect, at
> >    least when spoofed one by one, implying that EC cares which value
> >    is which.
> > 2. As I do not know internals of the EC firmware, even if today the oth=
er
> >    thermistor channels ordering is seemingly not relevant, we cannot be
> >    sure it will not change with EC firmware upgrade.
> >
> > I have reconstructed the order of channels by comparing i2c data dumps
> > and real-time temps on Windows, eg. sys_therm0 is sent to EC under id 0=
x02
> > and represents the TZ71 (around dram on XPS). There is no other reason =
to
> > have the names of the channels in this driver except for enforcing the
> > channel mapping, so `sprintf("sys_therm%d\n", i)` wouldn't be useful.
> >
> > By allowing source and sink to define the names and not enforcing it in
> > schema we lose ability to force the correct order, there is no way of
> > knowing whether "lpddr5-therm" or "ssd-therm" goes first. By forcing
> > "sys_thermX" convention, one would need to figure which one is which,
> > for example by referring to laptop schematics. I assume, "thena"'s
> > schematics has thermistors labeled as "sys_thermX"?
> >
> > I do agree that labels of the ADC nodes could be more useful for the
> > user. So far I followed the example of sc8280xp platforms that define
> > ADC channels with "sys_thermX". Perhaps, we could separate the
> > io-channel-names and ADC node labels then? eg:
> >
>=20
> The general guidance for such naming questions is to follow naming from
> the schematics, whenever available.

Apologies for the late reply;
In case of XPS /'tributo', schematics calls them SYS_THERM0...SYS_THERM6.
Not sure about 'thena'.

>=20
> > + io-channel-names =3D "sys_therm0",
> > + =09=09     "sys_therm1",
> > ...
> >
> > + &pmk8550_vadc {
> > +=09sys_therm0: channel@14c {
> > + =09=09reg =3D <PM8350_ADC7_GPIO3_100K_PU(1)>;
> > + =09=09qcom,hw-settle-time =3D <200>;
> > + =09=09qcom,ratiometric;
> > + =09=09label =3D "lpddr5x-therm";
> >
> > Though not sure if such approach is 'legal'?
>=20
> I might be missing something, but that does look legal. Your node's
> label follows (what I assume to be) the naming in the schematics and you
> provide a human-friendly label.

Thanks for confirmation. I was mostly worried about the fact that 'label =
=3D'
provides 'irrelevant' user friendly name, while 'io-channel-names =3D' refe=
rs
to schematics naming convention.

>=20
>=20
> PS. Once we have these adc channels in place, I presume there's also a
> TM that would allow us to wire them up as cooling-maps, to throttle the
> CPUs? Similar to "skin-temp-thermal" in x13s.

Yes that would make sense. I did not add it, as per x13s and other examples
TM requires a dedicated node for TM in pmics, as least for the pmk8280. Now
looking at the new series from Neil [1] it seems on pmk8550 it may be
different.. I will CC him when re-spinnig, a bit confused on how to make th=
at
part work. Neil also added proper macros for pmk8550, so I would likely nee=
d
to drop part of my change to combine it with his new definitions.

[1] https://lore.kernel.org/all/20260427-topic-sm8x50-adc5-gen3-v1-3-8a70f7=
b90a75@linaro.org/

Alex

>=20
> Regards,
> Bjorn
> 

