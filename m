Return-Path: <linux-arm-msm+bounces-105631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOMRNt3D92ndlwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 23:53:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F84B79EB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 23:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC5F5301ABBD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 21:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3903AC0EB;
	Sun,  3 May 2026 21:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="HwM1qQPl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10626.protonmail.ch (mail-10626.protonmail.ch [79.135.106.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81EF3A9624
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 May 2026 21:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777845182; cv=none; b=ZggweCWlEcr9oRu9VH9/vlfVuUMQFmo7rmLSDHg/vC1vuUMGmHtZQqycx3+3hzsjJndLpgyLlnjS71qzM14Yhsz8H2IoQHtwW3443KcarAg5UkRLqHtjVHImoIs3/j0CwE1AU2nvfEHdZ0P/flzRZIv3ysbDKEwKYyLoNebo1GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777845182; c=relaxed/simple;
	bh=yIPW8EnPPPmSA/fcXjITEng3yL91n38zf/ynciKlXDc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e8xvXhFfVzVVzrgnE1Y2aQJhVpo4LVQUb9vZk8pFgOLmFnORX62AhZ/qLYmXPtG32nQm8lmuWCSwUNYvejtOclqFevw6DZreW/J/2vwlbJ0Hnqvrk3oT2VC8iVtkXPw9S0HWILZqI3y80PbOAAOQZ9ISq27OKsU0SqrtbpRFByA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=HwM1qQPl; arc=none smtp.client-ip=79.135.106.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1777845167; x=1778104367;
	bh=xoT756fpkhUl3HZvfPl1tHFzaA9YLioD5nZ2Wl0kHqM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HwM1qQPlPFCar9gl8FV10J5Eod9gC5zMrGzycNDImEDfrHREkPdV7OHGzvxIkCwrB
	 KdVlxg/3o/jHYSbxxFHy1X36Bk1WrSWG7Kyq99zDwT3WX544KN38EtwzAA4ZwCqyB3
	 uWf09XvPAffU/aa0cvkGyR58//18oEMzPdZybp5vMbxvNObdeeTz6zXtlWB3jywv7D
	 e5i4qP16D4xoqu3O54Szzm2C32hSWPvGhpJgQPIK6nDQM1+SirGFoVcRyxlIjclkjA
	 MRcpVOEIPpOn9zen/+WzFKGODHm196UxTbq2A0JVe0TYrXOelU3Z/N5FCL6XAU8gMG
	 VALxZbR4ozg6A==
Date: Sun, 03 May 2026 21:52:41 +0000
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>
Subject: Re: [PATCH v2 2/4] platform: arm64: dell-xps-ec: new driver
Message-ID: <9t4GfFGt_zV_notuCE-J1M9Tqsfbfe6-gsAUVs374e4ZXYQhOzK-A87OnBeTfU97NxBXD9hhTsjyV8_hhiJIDNuntCDYONeD-AiSQAivOpk=@vinarskis.com>
In-Reply-To: <02f5a943-bfbd-46d8-a7f1-7f3a5d54ac65@linaro.org>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com> <20260404-dell-xps-9345-ec-v2-2-c977c3caa81f@vinarskis.com> <6be0cefb-72e4-4a8a-8668-45994db6c5d8@linaro.org> <P9IQ5Penud7CH3Yfn0bw0RXJfIhFhFGksRjP-aZwLoAxmajMfeOtLEItrcWOXwVjHE_zObIA8SYjcPVR9dkAk9KgDYLun0DJJ6dBIU-IRDI=@vinarskis.com> <02f5a943-bfbd-46d8-a7f1-7f3a5d54ac65@linaro.org>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 8adf4b301af2a72ea13826392cb8f4ba47ddeed7
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2B8F84B79EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105631-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bewilderbeest.net:email,vinarskis.com:email,vinarskis.com:dkim,vinarskis.com:mid]





On Monday, April 6th, 2026 at 10:30, Bryan O'Donoghue <bryan.odonoghue@lina=
ro.org> wrote:

> On 05/04/2026 21:48, Aleksandrs Vinarskis wrote:
> > On Sunday, April 5th, 2026 at 02:29, Bryan O'Donoghue <bryan.odonoghue@=
linaro.org> wrote:
> >
> >> On 04/04/2026 13:55, Aleksandrs Vinarskis wrote:
> >>> Introduce EC driver for Dell XPS 13 9345 (codename 'tributo') which m=
ay
> >>> partially of fully compatible with Snapdragon-based Dell Latitude,
> >>> Inspiron ('thena'). Primary function of this driver is unblock EC's
> >>> thermal management, specifically to provide it with necessary
> >>> information to control device fans, peripherals power.
> >>>
> >>> The driver was developed primarily by analyzing ACPI DSDT's _DSM and
> >>> i2c dumps of communication between SoC and EC. Changes to Windows
> >>> driver's behavior include increasing temperature feed loop from ~50ms
> >>> to 100ms here.
> >>>
> >>> While Xps's EC is rather complex and controls practically all device
> >>> peripherals including touch row's brightness and special keys such as
> >>> mic mute, these do not go over this particular i2c interface.
> >>>
> >>> Not yet implemented features:
> >>> - On lid-close IRQ event is registered. Windows performs what to
> >>>     appears to be thermistor constants readout, though its not obviou=
s
> >>>     what it used for.
> >>> - According to ACPI's _DSM there is a method to readout fans' RPM.
> >>> - Initial thermistor constants were sniffed from Windows, these can b=
e
> >>>     likely fine tuned for better cooling performance.
> >>> - There is additional temperature reading that Windows sents to EC bu=
t
> >>>     more rare than others, likely SoC T_j / TZ98 or TZ4. This is the =
only
> >>>     thermal zone who's reading can exceed 115C without triggering the=
rmal
> >>>     shutdown.
> >>> - Given similarities between 'tributo' and 'thena' platforms, includi=
ng
> >>>     EC i2c address, driver can be potentially extended to support bot=
h.
> >>>
> >>> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> >>> ---
> >>>    MAINTAINERS                          |   1 +
> >>>    drivers/platform/arm64/Kconfig       |  12 ++
> >>>    drivers/platform/arm64/Makefile      |   1 +
> >>>    drivers/platform/arm64/dell-xps-ec.c | 267 +++++++++++++++++++++++=
++++++++++++
> >>>    4 files changed, 281 insertions(+)
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index a5d175559f4468dfe363b319a1b08d3425f4d712..c150f57b60706224e5b24=
b0dfb3d8a9b81f36398 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -7240,6 +7240,7 @@ DELL XPS EMBEDDED CONTROLLER DRIVER
> >>>    M:=09Aleksandrs Vinarskis <alex@vinarskis.com>
> >>>    S:=09Maintained
> >>>    F:=09Documentation/devicetree/bindings/embedded-controller/dell,xp=
s13-9345-ec.yaml
> >>> +F:=09drivers/platform/arm64/dell-xps-ec.c
> >>>
> >>>    DELTA AHE-50DC FAN CONTROL MODULE DRIVER
> >>>    M:=09Zev Weiss <zev@bewilderbeest.net>
> >>> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/=
Kconfig
> >>> index 10f905d7d6bfa5fad30a0689d3a20481268c781e..0bc8f016032bb05cb3a7c=
c50bdf1092da04153bc 100644
> >>> --- a/drivers/platform/arm64/Kconfig
> >>> +++ b/drivers/platform/arm64/Kconfig
> >>> @@ -33,6 +33,18 @@ config EC_ACER_ASPIRE1
> >>>    =09  laptop where this information is not properly exposed via the
> >>>    =09  standard ACPI devices.
> >>>
> >>> +config EC_DELL_XPS
> >>> +=09tristate "Dell XPS 9345 Embedded Controller driver"
> >>> +=09depends on ARCH_QCOM || COMPILE_TEST
> >>> +=09depends on I2C
> >>> +=09depends on IIO
> >>> +=09help
> >>> +=09  Driver for the Embedded Controller in the Qualcomm Snapdragon-b=
ased
> >>> +=09  Dell XPS 13 9345, which handles thermal management and fan spee=
d
> >>> +=09  control.
> >>> +
> >>> +=09  Say M or Y here to include this support.
> >>> +
> >>>    config EC_HUAWEI_GAOKUN
> >>>    =09tristate "Huawei Matebook E Go Embedded Controller driver"
> >>>    =09depends on ARCH_QCOM || COMPILE_TEST
> >>> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64=
/Makefile
> >>> index 60c131cff6a15bb51a49c9edab95badf513ee0f6..6768dc6c2310837374e67=
381cfc729bed1fdaaef 100644
> >>> --- a/drivers/platform/arm64/Makefile
> >>> +++ b/drivers/platform/arm64/Makefile
> >>> @@ -6,6 +6,7 @@
> >>>    #
> >>>
> >>>    obj-$(CONFIG_EC_ACER_ASPIRE1)=09+=3D acer-aspire1-ec.o
> >>> +obj-$(CONFIG_EC_DELL_XPS)=09+=3D dell-xps-ec.o
> >>>    obj-$(CONFIG_EC_HUAWEI_GAOKUN)=09+=3D huawei-gaokun-ec.o
> >>>    obj-$(CONFIG_EC_LENOVO_YOGA_C630) +=3D lenovo-yoga-c630.o
> >>>    obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) +=3D lenovo-thinkpad-t14s.o
> >>> diff --git a/drivers/platform/arm64/dell-xps-ec.c b/drivers/platform/=
arm64/dell-xps-ec.c
> >>> new file mode 100644
> >>> index 0000000000000000000000000000000000000000..bf1495fbe473ccdb82b95=
a66b56e8525f782cc8e
> >>> --- /dev/null
> >>> +++ b/drivers/platform/arm64/dell-xps-ec.c
> >>> @@ -0,0 +1,267 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-only
> >>> +/*
> >>> + * Copyright (c) 2026, Aleksandrs Vinarskis <alex@vinarskis.com>
> >>> + */
> >>> +
> >>> +#include <linux/array_size.h>
> >>> +#include <linux/dev_printk.h>
> >>> +#include <linux/device.h>
> >>> +#include <linux/devm-helpers.h>
> >>> +#include <linux/err.h>
> >>> +#include <linux/i2c.h>
> >>> +#include <linux/iio/consumer.h>
> >>> +#include <linux/interrupt.h>
> >>> +#include <linux/jiffies.h>
> >>> +#include <linux/module.h>
> >>> +#include <linux/pm.h>
> >>> +#include <linux/unaligned.h>
> >>> +#include <linux/workqueue.h>
> >>> +
> >>> +#define DELL_XPS_EC_SUSPEND_CMD=09=090xb9
> >>> +#define DELL_XPS_EC_SUSPEND_MSG_LEN=0964
> >>> +
> >>> +#define DELL_XPS_EC_TEMP_CMD0=09=090xfb
> >>> +#define DELL_XPS_EC_TEMP_CMD1=09=090x20
> >>> +#define DELL_XPS_EC_TEMP_CMD3=09=090x02
> >>> +#define DELL_XPS_EC_TEMP_MSG_LEN=096
> >>> +#define DELL_XPS_EC_TEMP_POLL_JIFFIES=09msecs_to_jiffies(100)
> >>> +
> >>> +/*
> >>> + * Format:
> >>> + * - header/unknown (2 bytes)
> >>> + * - per-thermistor entries (3 bytes): thermistor_id, param1, param2
> >>> + */
> >>> +static const u8 dell_xps_ec_thermistor_profile[] =3D {
> >>> +=090xff, 0x54,
> >>> +=090x01, 0x00, 0x2b,=09/* sys_therm0 */
> >>> +=090x02, 0x44, 0x2a,=09/* sys_therm1 */
> >>> +=090x03, 0x44, 0x2b,=09/* sys_therm2 */
> >>> +=090x04, 0x44, 0x28,=09/* sys_therm3 */
> >>> +=090x05, 0x55, 0x2a,=09/* sys_therm4 */
> >>> +=090x06, 0x44, 0x26,=09/* sys_therm5 */
> >>> +=090x07, 0x44, 0x2b,=09/* sys_therm6 */
> >>> +};
> >>> +
> >>> +/*
> >>> + * Mapping from IIO channel name to EC command byte
> >>> + */
> >>> +static const struct {
> >>> +=09const char *name;
> >>> +=09u8 cmd;
> >>> +} dell_xps_ec_therms[] =3D {
> >>> +=09/* TODO: 0x01 is sent only occasionally, likely TZ98 or TZ4 */
> >>> +=09{ "sys_therm0", 0x02 },
> >>> +=09{ "sys_therm1", 0x03 },
> >>> +=09{ "sys_therm2", 0x04 },
> >>> +=09{ "sys_therm3", 0x05 },
> >>> +=09{ "sys_therm4", 0x06 },
> >>> +=09{ "sys_therm5", 0x07 },
> >>> +=09{ "sys_therm6", 0x08 },
> >>> +};
> >>
> >> You could probably retrieve these strings from the dt if you really ne=
ed
> >> them.
> >>
> >> I don't think you need static consts in your driver though you could
> >> just as easily do `sprintf("sys_therm%d\n", i) where you use
> >> ec_therms[i].name - the name is only used to print errors and you have
> >> the index of the channel when you do.
> >>
> >> It would be nicer to get the strings from DT - certainly make the stri=
ng
> >> names mandatory but, then let the DT specify those names.
> >>
> >> Either that or just do the sprintf("sys_therm%d\n", i); for the index,
> >> whichever you wish yourself.
> >
> > Hi Bryan,
> >
> > Will answer here to all three comments about `sys_thermX`.
> >
> > The reason I have added them as static consts here, and defined them in
> > the schema is because the order of the channels matters:
>=20

Apologies for the late reply;

> Two different things.
>=20
> You have an array of strings here which you only use to print two error
> messages, you always know the index, so you don't need those strings.
>=20
> At the same time, you could read the assigned names in the DT if you
> _really_ care to print the names.

No, like I said, printing name is secondary/irrelevant functionality.

>=20
> You don't match the static names in the .c file to the .dts so the
> consts here serve no purpose.

I absolutely do. EC expects thermistors inputs in specific order. In case
of XPS/'tributo', its 'SYS_THERM0'...'SYS_THERM6'. .dts therefore must
somehow propagate to .c that in case of 'tributo', the first value to
send corresponds to 'SYS_THERM0' which is on PMIC GPIO3, not any other
input.

>=20
> Ideally you'd read the names out of DT - which is what I recommend. You
> then print the name you read from the DT via an index.
>=20
> > 1. On my XPS (UEFI v2.11.0) changes in sys_therm2 immediately result in
> >     changes in fan speeds. Other channels seemingly have no affect, at
> >     least when spoofed one by one, implying that EC cares which value
> >     is which.
> > 2. As I do not know internals of the EC firmware, even if today the oth=
er
> >     thermistor channels ordering is seemingly not relevant, we cannot b=
e
> >     sure it will not change with EC firmware upgrade.
>=20
> But the PCB maps certain ADC channels to certain thermistors the lpddr5
> thermistor always maps to the lpddr5 thermistor and adc input 0 on the
> EC, that won't change with a firmware upgrade, the PCB is the PCB.

That is correct, assuming this driver will only be every used for
'Dell XPS 9345'. If similar platform, including 'thena' is used, there is
no guarantee that channel mapping is the same. Hence, whoever would be
working with the driver would repeat the exercise i did - either reference
schematics to find exact mapping of thermistor vs PMIC input, or:
* Under windows run stress tests
* Monitor temperature in software
* Monitor temperature send to EC via i2c dumps
* Monitor raw ADC readouts in linux
* Cross match these together to get mapping thermistor vs PMIC input

Does 'thena' also map SYS_THERM0 to PMIC GPIO3, which corresponds to LPDDR5=
?
I don't have the schematics to confirm it. Will other platforms have it?
I don't think we can make that assumption. IMHO instead of introducing
ambiguity for the device-tree binding, I would rather force user to do
correct 1:1 mapping.

>=20
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
> > knowing whether "lpddr5-therm" or "ssd-therm" goes first.
>=20
> But there is, by looking at the schematics. You have the correct order
> now and it maps to what the schematics say, I checked.
>=20
> By forcing
> > "sys_thermX" convention, one would need to figure which one is which,
> > for example by referring to laptop schematics. I assume, "thena"'s
> > schematics has thermistors labeled as "sys_thermX"?
> >
> > I do agree that labels of the ADC nodes could be more useful for the
> > user. So far I followed the example of sc8280xp platforms that define
> > ADC channels with "sys_thermX". Perhaps, we could separate the
> > io-channel-names and ADC node labels then? eg:
>=20
> I mean it doesn't matter a whole lot to me how the source and the sink
> connect in DT.
>=20
> BTW if we denoted the source and the sink lpddr5 today and the firmware
> was changed the name of the mapping would be wrong but the functional
> conneciton would still be correct.
>=20
> So I'm not very concerned about source/sink names, its a bike shed
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
> I mean the important thing is what user-space "sees" right ? I believe
> the label here is that but, please check.
>=20
> A list of sys_therm0 entries in the dropdown from waybar is 100% meh,
> but if I can see "CPU temp" spike I suddenly have useful information.
>=20

Sounds like proposed approach would make everyone happy - io-channel-names
require schematics-like naming convention, while userspace would show
actually meaningful labels - I would go with this approach for the re-spin.

Alex
=20
>=20
> >
> > Alex
> >
> >>
> >>> +
> >>> +struct dell_xps_ec {
> >>> +=09struct device *dev;
> >>> +=09struct i2c_client *client;
> >>> +=09struct iio_channel *therm_channels[ARRAY_SIZE(dell_xps_ec_therms)=
];
> >>> +=09struct delayed_work temp_work;
> >>> +};
> >>> +
> >>> +static int dell_xps_ec_suspend_cmd(struct dell_xps_ec *ec, bool susp=
end)
> >>> +{
> >>> +=09u8 buf[DELL_XPS_EC_SUSPEND_MSG_LEN] =3D {};
> >>> +=09int ret;
> >>> +
> >>> +=09buf[0] =3D DELL_XPS_EC_SUSPEND_CMD;
> >>> +=09buf[1] =3D suspend ? 0x01 : 0x00;
> >>> +=09/* bytes 2..63 remain zero */
> >>> +
> >>> +=09ret =3D i2c_master_send(ec->client, buf, sizeof(buf));
> >>> +=09if (ret < 0)
> >>> +=09=09return ret;
> >>> +
> >>> +=09return 0;
> >>> +}
> >>> +
> >>> +static int dell_xps_ec_send_temp(struct dell_xps_ec *ec, u8 cmd_byte=
,
> >>> +=09=09=09=09 int milli_celsius)
> >>> +{
> >>> +=09u8 buf[DELL_XPS_EC_TEMP_MSG_LEN];
> >>> +=09u16 deci_celsius;
> >>> +=09int ret;
> >>> +
> >>> +=09/* Convert milli-Celsius to deci-Celsius (Celsius * 10) */
> >>> +=09deci_celsius =3D milli_celsius / 100;
> >>> +
> >>> +=09buf[0] =3D DELL_XPS_EC_TEMP_CMD0;
> >>> +=09buf[1] =3D DELL_XPS_EC_TEMP_CMD1;
> >>> +=09buf[2] =3D cmd_byte;
> >>> +=09buf[3] =3D DELL_XPS_EC_TEMP_CMD3;
> >>> +=09put_unaligned_le16(deci_celsius, &buf[4]);
> >>> +
> >>> +=09ret =3D i2c_master_send(ec->client, buf, sizeof(buf));
> >>> +=09if (ret < 0)
> >>> +=09=09return ret;
> >>> +
> >>> +=09return 0;
> >>> +}
> >>> +
> >>> +static void dell_xps_ec_temp_work_fn(struct work_struct *work)
> >>> +{
> >>> +=09struct dell_xps_ec *ec =3D container_of(work, struct dell_xps_ec,
> >>> +=09=09=09=09=09      temp_work.work);
> >>> +=09int val, ret, i;
> >>> +
> >>> +=09for (i =3D 0; i < ARRAY_SIZE(dell_xps_ec_therms); i++) {
> >>> +=09=09if (!ec->therm_channels[i])
> >>> +=09=09=09continue;
> >>> +
> >>> +=09=09ret =3D iio_read_channel_processed(ec->therm_channels[i], &val=
);
> >>> +=09=09if (ret < 0) {
> >>> +=09=09=09dev_err_ratelimited(ec->dev,
> >>> +=09=09=09=09=09    "Failed to read thermistor %s: %d\n",
> >>> +=09=09=09=09=09    dell_xps_ec_therms[i].name, ret);
> >>> +=09=09=09continue;
> >>> +=09=09}
> >>> +
> >>> +=09=09ret =3D dell_xps_ec_send_temp(ec, dell_xps_ec_therms[i].cmd, v=
al);
> >>> +=09=09if (ret < 0) {
> >>> +=09=09=09dev_err_ratelimited(ec->dev,
> >>> +=09=09=09=09=09    "Failed to send temp for %s: %d\n",
> >>> +=09=09=09=09=09    dell_xps_ec_therms[i].name, ret);
> >>> +=09=09}
> >>> +=09}
> >>> +
> >>> +=09schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFI=
ES);
> >>> +}
> >>> +
> >>> +static irqreturn_t dell_xps_ec_irq_handler(int irq, void *data)
> >>> +{
> >>> +=09struct dell_xps_ec *ec =3D data;
> >>> +
> >>> +=09/*
> >>> +=09 * TODO: IRQ is fired on lid-close. Follow Windows example to rea=
d out
> >>> +=09 *       the thermistor thresholds and potentially fan speeds.
> >>> +=09 */
> >>> +=09dev_info_ratelimited(ec->dev, "IRQ triggered! (irq=3D%d)\n", irq)=
;
> >>> +
> >>> +=09return IRQ_HANDLED;
> >>> +}
> >>> +
> >>> +static int dell_xps_ec_probe(struct i2c_client *client)
> >>> +{
> >>> +=09struct device *dev =3D &client->dev;
> >>> +=09struct dell_xps_ec *ec;
> >>> +=09int ret, i;
> >>> +
> >>> +=09ec =3D devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> >>> +=09if (!ec)
> >>> +=09=09return -ENOMEM;
> >>> +
> >>> +=09ec->dev =3D dev;
> >>> +=09ec->client =3D client;
> >>> +=09i2c_set_clientdata(client, ec);
> >>> +
> >>> +=09/* Set default thermistor profile */
> >>> +=09ret =3D i2c_master_send(client, dell_xps_ec_thermistor_profile,
> >>> +=09=09=09      sizeof(dell_xps_ec_thermistor_profile));
> >>> +=09if (ret < 0)
> >>> +=09=09return dev_err_probe(dev, ret, "Failed to set thermistor profi=
le\n");
> >>> +
> >>> +=09/* Get IIO channels for thermistors */
> >>> +=09for (i =3D 0; i < ARRAY_SIZE(dell_xps_ec_therms); i++) {
> >>> +=09=09ec->therm_channels[i] =3D
> >>> +=09=09=09devm_iio_channel_get(dev, dell_xps_ec_therms[i].name);
> >>> +=09=09if (IS_ERR(ec->therm_channels[i])) {
> >>> +=09=09=09ret =3D PTR_ERR(ec->therm_channels[i]);
> >>> +=09=09=09ec->therm_channels[i] =3D NULL;
> >>> +=09=09=09if (ret =3D=3D -EPROBE_DEFER)
> >>> +=09=09=09=09return ret;
> >>> +=09=09=09dev_warn(dev, "Thermistor %s not available: %d\n",
> >>> +=09=09=09=09 dell_xps_ec_therms[i].name, ret);
> >>> +=09=09}
> >>> +=09}
> >>> +
> >>> +=09/* Start periodic temperature reporting */
> >>> +=09ret =3D devm_delayed_work_autocancel(dev, &ec->temp_work,
> >>> +=09=09=09=09=09   dell_xps_ec_temp_work_fn);
> >>> +=09if (ret)
> >>> +=09=09return ret;
> >> \n
> >>> +=09schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFI=
ES);
> >>> +=09dev_dbg(dev, "Started periodic temperature reporting to EC every =
%d ms\n",
> >>> +=09=09jiffies_to_msecs(DELL_XPS_EC_TEMP_POLL_JIFFIES));
> >>> +
> >>> +=09/* Request IRQ for EC events */
> >>> +=09ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> >>> +=09=09=09=09=09dell_xps_ec_irq_handler,
> >>> +=09=09=09=09=09IRQF_ONESHOT, dev_name(dev), ec);
> >>> +=09if (ret < 0)
> >>> +=09=09return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> >>> +
> >>> +=09return 0;
> >>> +}
> >>> +
> >>> +/*
> >>> + * Notify EC of suspend
> >>> + *
> >>> + * This will:
> >>> + * - Cut power to display/trackpad/keyboard/touchrow, wake-up source=
 still works
> >>> + */
> >>> +static int dell_xps_ec_suspend(struct device *dev)
> >>> +{
> >>> +=09struct dell_xps_ec *ec =3D dev_get_drvdata(dev);
> >>> +
> >>> +=09cancel_delayed_work_sync(&ec->temp_work);
> >>> +
> >>> +=09return dell_xps_ec_suspend_cmd(ec, true);
> >>> +}
> >>> +
> >>> +/*
> >>> + * Notify EC of resume
> >>> + *
> >>> + * This will undo the suspend actions
> >>> + * Without the resume signal, device would wake up but be forced bac=
k into
> >>> + * suspend by EC within seconds
> >>> + */
> >>> +static int dell_xps_ec_resume(struct device *dev)
> >>> +{
> >>> +=09struct dell_xps_ec *ec =3D dev_get_drvdata(dev);
> >>> +=09int ret;
> >>> +
> >>> +=09ret =3D dell_xps_ec_suspend_cmd(ec, false);
> >>> +=09if (ret)
> >>> +=09=09return ret;
> >>> +
> >>> +=09schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFI=
ES);
> >>> +=09return 0;
> >>> +}
> >>> +
> >>> +static const struct of_device_id dell_xps_ec_of_match[] =3D {
> >>> +=09{ .compatible =3D "dell,xps13-9345-ec" },
> >>> +=09{}
> >>> +};
> >>> +MODULE_DEVICE_TABLE(of, dell_xps_ec_of_match);
> >>> +
> >>> +static const struct i2c_device_id dell_xps_ec_i2c_id[] =3D {
> >>> +=09{ "dell-xps-ec" },
> >>> +=09{}
> >>> +};
> >>> +MODULE_DEVICE_TABLE(i2c, dell_xps_ec_i2c_id);
> >>> +
> >>> +static const struct dev_pm_ops dell_xps_ec_pm_ops =3D {
> >>> +=09SYSTEM_SLEEP_PM_OPS(dell_xps_ec_suspend, dell_xps_ec_resume)
> >>> +};
> >>> +
> >>> +static struct i2c_driver dell_xps_ec_driver =3D {
> >>> +=09.driver =3D {
> >>> +=09=09.name =3D "dell-xps-ec",
> >>> +=09=09.of_match_table =3D dell_xps_ec_of_match,
> >>> +=09=09.pm =3D &dell_xps_ec_pm_ops,
> >>> +=09},
> >>> +=09.probe =3D dell_xps_ec_probe,
> >>> +=09.id_table =3D dell_xps_ec_i2c_id,
> >>> +};
> >>> +module_i2c_driver(dell_xps_ec_driver);
> >>> +
> >>> +MODULE_AUTHOR("Aleksandrs Vinarskis <alex@vinarskis.com>");
> >>> +MODULE_DESCRIPTION("Dell XPS 13 9345 Embedded Controller");
> >>> +MODULE_LICENSE("GPL");
> >>>
> >>
> >>
>=20
> 

