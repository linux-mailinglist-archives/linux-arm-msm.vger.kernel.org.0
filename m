Return-Path: <linux-arm-msm+bounces-101950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI8ZJeOn02k4kAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 14:32:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6743A34A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 14:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90F9E300D6AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 12:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF85533262F;
	Mon,  6 Apr 2026 12:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lhA2M99E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA48023183C;
	Mon,  6 Apr 2026 12:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478752; cv=none; b=TzontE2fjJfdHhHRtPpTdMXNF1jv0h8JKYJwxqBBli3JsG54bM8T8iuSWgqa4slSQ0yE6p33mbZASSnx75Uh31H4JXipU+73MtTcWHYZNLlHr0ei449TOEM8PCkXczD8Q8scjpC0YrfbT2RO7OqRHfvelFNeOyJyzw6b9qm2yEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478752; c=relaxed/simple;
	bh=93nmLJJXcQ6fbQNQAA8dv7doCKMICW/nB+1lRWqwYHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8T7fU5mjT1cqVIvVNCldAvkW4ui+CVxZuk4uHyfUdOxko0GuAeB8w6jkSkwepLcU2rLtOgngA2va5STbhvzsklK+v4KqZ5WUX11K/MfUH/eO+IRvMzKhzB3VMUjhSM8wQIikNtWzX+0oTOxLkWkVArkWJfq4F60v3GqyLnvkuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lhA2M99E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04476C4CEF7;
	Mon,  6 Apr 2026 12:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775478752;
	bh=93nmLJJXcQ6fbQNQAA8dv7doCKMICW/nB+1lRWqwYHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhA2M99EkjAwe+FN/1VCsNK9m24alwkE/NK/wPHgYL6t+G0DaaJXpKwu40r/r/soj
	 5HQ7O1JXwC0jsj3nd3QsIe+b4ST0d3mbwoe2EWvqyHiTFFVID1eIw1a8VXY3c5R+RQ
	 Wxgb+F2IcMCgNb84sx/QI5X+XnVGFBPc6eCUZa2NJE9P6MolHOW7rbgtaL9UFXAqYX
	 DQpnIYJfSc0wtVOSnoI5Yf+puNm79LwU/XRHJcF5S0u/R53+ZUtpAL2O3cMQl0M1OM
	 NSU3hKVKZI8/EJPCRUHc354L4tXGQUb4nDVzRFy7PRGYpj6MqmYBgXqUJJsLYQxITY
	 XAwKLeZtWs3Yw==
Date: Mon, 6 Apr 2026 07:32:27 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, laurentiu.tudor1@dell.com, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Tobias Heider <tobias.heider@canonical.com>, 
	Val Packett <val@packett.cool>
Subject: Re: [PATCH v2 2/4] platform: arm64: dell-xps-ec: new driver
Message-ID: <adOl-iVGAyiA-QSx@baldur>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-2-c977c3caa81f@vinarskis.com>
 <6be0cefb-72e4-4a8a-8668-45994db6c5d8@linaro.org>
 <P9IQ5Penud7CH3Yfn0bw0RXJfIhFhFGksRjP-aZwLoAxmajMfeOtLEItrcWOXwVjHE_zObIA8SYjcPVR9dkAk9KgDYLun0DJJ6dBIU-IRDI=@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <P9IQ5Penud7CH3Yfn0bw0RXJfIhFhFGksRjP-aZwLoAxmajMfeOtLEItrcWOXwVjHE_zObIA8SYjcPVR9dkAk9KgDYLun0DJJ6dBIU-IRDI=@vinarskis.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101950-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,bewilderbeest.net:email]
X-Rspamd-Queue-Id: DD6743A34A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 08:48:25PM +0000, Aleksandrs Vinarskis wrote:
> On Sunday, April 5th, 2026 at 02:29, Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
> 
> > On 04/04/2026 13:55, Aleksandrs Vinarskis wrote:
> > > Introduce EC driver for Dell XPS 13 9345 (codename 'tributo') which may
> > > partially of fully compatible with Snapdragon-based Dell Latitude,
> > > Inspiron ('thena'). Primary function of this driver is unblock EC's
> > > thermal management, specifically to provide it with necessary
> > > information to control device fans, peripherals power.
> > >
> > > The driver was developed primarily by analyzing ACPI DSDT's _DSM and
> > > i2c dumps of communication between SoC and EC. Changes to Windows
> > > driver's behavior include increasing temperature feed loop from ~50ms
> > > to 100ms here.
> > >
> > > While Xps's EC is rather complex and controls practically all device
> > > peripherals including touch row's brightness and special keys such as
> > > mic mute, these do not go over this particular i2c interface.
> > >
> > > Not yet implemented features:
> > > - On lid-close IRQ event is registered. Windows performs what to
> > >    appears to be thermistor constants readout, though its not obvious
> > >    what it used for.
> > > - According to ACPI's _DSM there is a method to readout fans' RPM.
> > > - Initial thermistor constants were sniffed from Windows, these can be
> > >    likely fine tuned for better cooling performance.
> > > - There is additional temperature reading that Windows sents to EC but
> > >    more rare than others, likely SoC T_j / TZ98 or TZ4. This is the only
> > >    thermal zone who's reading can exceed 115C without triggering thermal
> > >    shutdown.
> > > - Given similarities between 'tributo' and 'thena' platforms, including
> > >    EC i2c address, driver can be potentially extended to support both.
> > >
> > > Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> > > ---
> > >   MAINTAINERS                          |   1 +
> > >   drivers/platform/arm64/Kconfig       |  12 ++
> > >   drivers/platform/arm64/Makefile      |   1 +
> > >   drivers/platform/arm64/dell-xps-ec.c | 267 +++++++++++++++++++++++++++++++++++
> > >   4 files changed, 281 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index a5d175559f4468dfe363b319a1b08d3425f4d712..c150f57b60706224e5b24b0dfb3d8a9b81f36398 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -7240,6 +7240,7 @@ DELL XPS EMBEDDED CONTROLLER DRIVER
> > >   M:	Aleksandrs Vinarskis <alex@vinarskis.com>
> > >   S:	Maintained
> > >   F:	Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
> > > +F:	drivers/platform/arm64/dell-xps-ec.c
> > >
> > >   DELTA AHE-50DC FAN CONTROL MODULE DRIVER
> > >   M:	Zev Weiss <zev@bewilderbeest.net>
> > > diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> > > index 10f905d7d6bfa5fad30a0689d3a20481268c781e..0bc8f016032bb05cb3a7cc50bdf1092da04153bc 100644
> > > --- a/drivers/platform/arm64/Kconfig
> > > +++ b/drivers/platform/arm64/Kconfig
> > > @@ -33,6 +33,18 @@ config EC_ACER_ASPIRE1
> > >   	  laptop where this information is not properly exposed via the
> > >   	  standard ACPI devices.
> > >
> > > +config EC_DELL_XPS
> > > +	tristate "Dell XPS 9345 Embedded Controller driver"
> > > +	depends on ARCH_QCOM || COMPILE_TEST
> > > +	depends on I2C
> > > +	depends on IIO
> > > +	help
> > > +	  Driver for the Embedded Controller in the Qualcomm Snapdragon-based
> > > +	  Dell XPS 13 9345, which handles thermal management and fan speed
> > > +	  control.
> > > +
> > > +	  Say M or Y here to include this support.
> > > +
> > >   config EC_HUAWEI_GAOKUN
> > >   	tristate "Huawei Matebook E Go Embedded Controller driver"
> > >   	depends on ARCH_QCOM || COMPILE_TEST
> > > diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
> > > index 60c131cff6a15bb51a49c9edab95badf513ee0f6..6768dc6c2310837374e67381cfc729bed1fdaaef 100644
> > > --- a/drivers/platform/arm64/Makefile
> > > +++ b/drivers/platform/arm64/Makefile
> > > @@ -6,6 +6,7 @@
> > >   #
> > >
> > >   obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
> > > +obj-$(CONFIG_EC_DELL_XPS)	+= dell-xps-ec.o
> > >   obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
> > >   obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
> > >   obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
> > > diff --git a/drivers/platform/arm64/dell-xps-ec.c b/drivers/platform/arm64/dell-xps-ec.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..bf1495fbe473ccdb82b95a66b56e8525f782cc8e
> > > --- /dev/null
> > > +++ b/drivers/platform/arm64/dell-xps-ec.c
> > > @@ -0,0 +1,267 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2026, Aleksandrs Vinarskis <alex@vinarskis.com>
> > > + */
> > > +
> > > +#include <linux/array_size.h>
> > > +#include <linux/dev_printk.h>
> > > +#include <linux/device.h>
> > > +#include <linux/devm-helpers.h>
> > > +#include <linux/err.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/iio/consumer.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/jiffies.h>
> > > +#include <linux/module.h>
> > > +#include <linux/pm.h>
> > > +#include <linux/unaligned.h>
> > > +#include <linux/workqueue.h>
> > > +
> > > +#define DELL_XPS_EC_SUSPEND_CMD		0xb9
> > > +#define DELL_XPS_EC_SUSPEND_MSG_LEN	64
> > > +
> > > +#define DELL_XPS_EC_TEMP_CMD0		0xfb
> > > +#define DELL_XPS_EC_TEMP_CMD1		0x20
> > > +#define DELL_XPS_EC_TEMP_CMD3		0x02
> > > +#define DELL_XPS_EC_TEMP_MSG_LEN	6
> > > +#define DELL_XPS_EC_TEMP_POLL_JIFFIES	msecs_to_jiffies(100)
> > > +
> > > +/*
> > > + * Format:
> > > + * - header/unknown (2 bytes)
> > > + * - per-thermistor entries (3 bytes): thermistor_id, param1, param2
> > > + */
> > > +static const u8 dell_xps_ec_thermistor_profile[] = {
> > > +	0xff, 0x54,
> > > +	0x01, 0x00, 0x2b,	/* sys_therm0 */
> > > +	0x02, 0x44, 0x2a,	/* sys_therm1 */
> > > +	0x03, 0x44, 0x2b,	/* sys_therm2 */
> > > +	0x04, 0x44, 0x28,	/* sys_therm3 */
> > > +	0x05, 0x55, 0x2a,	/* sys_therm4 */
> > > +	0x06, 0x44, 0x26,	/* sys_therm5 */
> > > +	0x07, 0x44, 0x2b,	/* sys_therm6 */
> > > +};
> > > +
> > > +/*
> > > + * Mapping from IIO channel name to EC command byte
> > > + */
> > > +static const struct {
> > > +	const char *name;
> > > +	u8 cmd;
> > > +} dell_xps_ec_therms[] = {
> > > +	/* TODO: 0x01 is sent only occasionally, likely TZ98 or TZ4 */
> > > +	{ "sys_therm0", 0x02 },
> > > +	{ "sys_therm1", 0x03 },
> > > +	{ "sys_therm2", 0x04 },
> > > +	{ "sys_therm3", 0x05 },
> > > +	{ "sys_therm4", 0x06 },
> > > +	{ "sys_therm5", 0x07 },
> > > +	{ "sys_therm6", 0x08 },
> > > +};
> >
> > You could probably retrieve these strings from the dt if you really need
> > them.
> >
> > I don't think you need static consts in your driver though you could
> > just as easily do `sprintf("sys_therm%d\n", i) where you use
> > ec_therms[i].name - the name is only used to print errors and you have
> > the index of the channel when you do.
> >
> > It would be nicer to get the strings from DT - certainly make the string
> > names mandatory but, then let the DT specify those names.
> >
> > Either that or just do the sprintf("sys_therm%d\n", i); for the index,
> > whichever you wish yourself.
> 
> Hi Bryan,
> 
> Will answer here to all three comments about `sys_thermX`.
> 
> The reason I have added them as static consts here, and defined them in
> the schema is because the order of the channels matters:
> 1. On my XPS (UEFI v2.11.0) changes in sys_therm2 immediately result in
>    changes in fan speeds. Other channels seemingly have no affect, at
>    least when spoofed one by one, implying that EC cares which value
>    is which.
> 2. As I do not know internals of the EC firmware, even if today the other
>    thermistor channels ordering is seemingly not relevant, we cannot be
>    sure it will not change with EC firmware upgrade.
> 
> I have reconstructed the order of channels by comparing i2c data dumps
> and real-time temps on Windows, eg. sys_therm0 is sent to EC under id 0x02
> and represents the TZ71 (around dram on XPS). There is no other reason to
> have the names of the channels in this driver except for enforcing the
> channel mapping, so `sprintf("sys_therm%d\n", i)` wouldn't be useful.
> 
> By allowing source and sink to define the names and not enforcing it in
> schema we lose ability to force the correct order, there is no way of
> knowing whether "lpddr5-therm" or "ssd-therm" goes first. By forcing
> "sys_thermX" convention, one would need to figure which one is which,
> for example by referring to laptop schematics. I assume, "thena"'s
> schematics has thermistors labeled as "sys_thermX"?
> 
> I do agree that labels of the ADC nodes could be more useful for the
> user. So far I followed the example of sc8280xp platforms that define
> ADC channels with "sys_thermX". Perhaps, we could separate the
> io-channel-names and ADC node labels then? eg:
> 

The general guidance for such naming questions is to follow naming from
the schematics, whenever available.

> + io-channel-names = "sys_therm0",
> + 		     "sys_therm1",
> ...
> 
> + &pmk8550_vadc {
> +	sys_therm0: channel@14c {
> + 		reg = <PM8350_ADC7_GPIO3_100K_PU(1)>;
> + 		qcom,hw-settle-time = <200>;
> + 		qcom,ratiometric;
> + 		label = "lpddr5x-therm";
> 
> Though not sure if such approach is 'legal'?

I might be missing something, but that does look legal. Your node's
label follows (what I assume to be) the naming in the schematics and you
provide a human-friendly label.


PS. Once we have these adc channels in place, I presume there's also a
TM that would allow us to wire them up as cooling-maps, to throttle the
CPUs? Similar to "skin-temp-thermal" in x13s.

Regards,
Bjorn

