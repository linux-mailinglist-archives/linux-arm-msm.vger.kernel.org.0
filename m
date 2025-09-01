Return-Path: <linux-arm-msm+bounces-71405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1136B3E5F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 15:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7B9E1707E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 13:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C456C335BB7;
	Mon,  1 Sep 2025 13:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="nVNNDkIt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="duothTBD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A99930F538;
	Mon,  1 Sep 2025 13:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756734546; cv=none; b=bqOTt6W4A01owv9wO5C3gDxGiEm3P01o+naegAFOv9oWQd6ZmMrZ1P44+RmMt8jcLSCa0c9kc4AMNTRmLhTdM6Ub2DuS+fBH1g83rKPxKbl3zZ4Tp+eW1dKHSvXp1bSUHNu6m/yCAXvxMPEmiPWg9BnU//Hq3tWM4YQxqKUDeR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756734546; c=relaxed/simple;
	bh=GjHwcFbhQOoSjLeqxuvwNsWmuu+imwRL3vcpoTfPcqo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ONfGP4BEC6+pYnTis0MCwjBdzD4uHhfWp3niH/d4yD/hj968rf8IOXVjYgKJlQVX4p8zd6CGuFsb9y3UUrfGHhDyHBWhXnGJg3A8DO39Yrh0cTIdFtPt3CESA6QKasqwszAv6viQVtiT/Oswrzm+hRZgVogmHWgmTzesH++veCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=nVNNDkIt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=duothTBD; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 34DC31D001E3;
	Mon,  1 Sep 2025 09:49:01 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Mon, 01 Sep 2025 09:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1756734541;
	 x=1756820941; bh=MSgK5Bbl46zuv9522YyBNxV9C2dwsGNN6OqU8F+FZAw=; b=
	nVNNDkIt4ttklGvwGRB8X0whHiCPxroBoqWwhsumibSSvTeea82QjxpznuveSZ4e
	Mqmu/PpfldgI83NKsR6zCzSPPg2sPEBX9yg+6klK39I7/ByHAbXt1dwbU9tMsWqy
	X4VUq+SPJnWtiBRZqGDnfbpt6XM9qkZ6rmGvCQgf7Ee7jj0DFCURc8T1xLN3mntA
	5IaGHpql3E+YXjBRH4sfsl++gG1f9lqc6gy9uEq/PiWv1dHzr8IzPeroUy473RSx
	ZRQ15Ej/ALFBMBbOFpNCTgGu18RMjDqT7dE5oYctcvcdQNclWn9hILSXwbEd1oWP
	n9jdjzjgFt/xayJ2sPXOfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756734541; x=
	1756820941; bh=MSgK5Bbl46zuv9522YyBNxV9C2dwsGNN6OqU8F+FZAw=; b=d
	uothTBDT8zhjaRNm8ujT6xTR4vk5X9SjH9M7Frei7LyvUJH1iZYU1KWkWtT+NWog
	bUBRCXznNQXTyAHGExGHKVDWegFkXtsKGMUbih37u4DJv6IY3YgkaY9tpb3Gr+eg
	GcTZhginljuvr9cGMff/o/Noz/+37ZCfDzL+ZWrDX2AKNashEVbGHQv41mIGrzfp
	qQT6SY3VHPJVR3CVkfHmlb99RI83kCQ/jmw0ROyQg3Z/ETrVqqNUpjzvds3pzVYS
	OQ/gw3BthX9V+XT5N8pB/IeEicDUARZdHsKLV5f6aJ2/wR9S853yIFrI1cNaZqc5
	zpIxZ0nYhECQKjSZsZGUA==
X-ME-Sender: <xms:TKS1aIHzNI7NjzYC2Iga14Bp7UVvd59l5GjsNx6f4i-6nmCxTLj_Tg>
    <xme:TKS1aBWwM8CHQAkzpCBnKR82Rjy2Cd9Q0chGVUPSPM1bHzx77u_NRZTSaIvc6ekwc
    DjaO0JuQRgBzJjc5W0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduledvfeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpeehtdeuvdeuueeuudektdefhfevuefguddtffejveel
    jeehvefhtdelkeffjeetjeenucffohhmrghinhepthhhihhnkhifihhkihdrohhrghdpoh
    hrrdgtiienucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtth
    hopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvrhgvkhhjohhhnhdr
    tghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehhmhhhsehhmhhhrdgvnhhgrd
    gsrhdprhgtphhtthhopegrnhguvghrshhsohhnsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhgrnhhsgh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhonhhrrgguhigstghioheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrhgvsehkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:TKS1aHsjRYHuSOQ18Kbh8nJZBY679M24gNMLTdFFxFsBM3wIb-AJzg>
    <xmx:TKS1aDW5sP18MeS_SICsljSHLl939vSuwKbeXH1ib9LWqBA-_aK2UQ>
    <xmx:TKS1aE_F5k7m0KzJtHhH_UbAXs-cC_d-2omlz7Ls3GTqm9RliXTsaQ>
    <xmx:TKS1aH46WiRCGZBO4GIfvexKzNQBsguny3ee0Q-qRwjrMbywmBKwSA>
    <xmx:TaS1aBRsghu70jOEhNNcGsWHQ5z4Mcv0Oi3fqxXDFzBsnWAAvRTqYuGl>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7833F2CE0071; Mon,  1 Sep 2025 09:49:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A0cV_uEw7IB3
Date: Mon, 01 Sep 2025 09:48:39 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Sebastian Reichel" <sre@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org
Message-Id: <ea0b329e-ab3e-4655-8f27-e7a74784302a@app.fastmail.com>
In-Reply-To: <20250831-thinkpad-t14s-ec-v1-2-6e06a07afe0f@collabora.com>
References: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
 <20250831-thinkpad-t14s-ec-v1-2-6e06a07afe0f@collabora.com>
Subject: Re: [PATCH 2/3] platform: arm64: thinkpad-t14s-ec: new driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Sebastian,

On Sun, Aug 31, 2025, at 5:28 PM, Sebastian Reichel wrote:
> Introduce EC driver for the ThinkPad T14s Gen6 Snapdragon, which
> is in theory compatible with ThinkPad ACPI. On Linux the system
> is booted with device tree, which is not supported by the ThinkPad
> ACPI driver. Also most of the hardware compatibility is handled
> via ACPI tables, which are obviously not used when booting via
> device tree. Thus adding DT compatibility to the existing driver
> is not worth it (almost no code sharing).
>
> The driver currently exposes features, which are not available
> via other means:
>
>  * Extra Keys
>  * System LEDs
>  * Keyboard Backlight Control
>
> The driver has been developed by reading the ACPI DSDT. There
> are some more features around thermal control, which are not
> yet supported by the driver.
>

Thanks for working on this - it's great.

I'll see if I can get the EC spec so I can do some checking on the values (I thought I had it already, but I can't find it). If this file can be used for other platforms then it might be good to rename the file to not be specific to the t14s? I'm curious if it can be used on the X13s or the Yoga platform.

Couple of notes
 - I do agree it doesn't make sense to add this to thinkpad_acpi. That file is too big anyway.
 - If there are other pieces like this where some detail of the platform is needed, please do let me know. I never got enough time to work on this platform directly, and it wasn't in our Linux program, but I do have access and support from the platform team for getting details on it. If I can help, so not too much reverse engineering is needed, I'm happy to.

Mark

> The speaker mute and mic mute LEDs need some additional changes
> in the ALSA UCM to be set automatically.
>
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
>  MAINTAINERS                                   |   6 +
>  drivers/platform/arm64/Kconfig                |  20 +
>  drivers/platform/arm64/Makefile               |   1 +
>  drivers/platform/arm64/lenovo-thinkpad-t14s.c | 597 ++++++++++++++++++++++++++
>  4 files changed, 624 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 
> e94d68c980c5f8bef2e1caf26b1a775df6aa1d84..589466169c222b2e088c6112a1e724c95e948f72 
> 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25092,6 +25092,12 @@ W:	http://thinkwiki.org/wiki/Ibm-acpi
>  T:	git git://repo.or.cz/linux-2.6/linux-acpi-2.6/ibm-acpi-2.6.git
>  F:	drivers/platform/x86/lenovo/thinkpad_acpi.c
> 
> +THINKPAD T14S EMBEDDED CONTROLLER DRIVER
> +M:	Sebastian Reichel <sre@kernel.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/platform/lenovo,thinkpad-t14s-ec.yaml
> +F:	drivers/platform/arm64/lenovo-thinkpad-t14s.c
> +
>  THINKPAD LMI DRIVER
>  M:	Mark Pearson <mpearson-lenovo@squebb.ca>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/platform/arm64/Kconfig 
> b/drivers/platform/arm64/Kconfig
> index 
> 06288aebc5599435065a37f8dacd046b5def80bd..10f905d7d6bfa5fad30a0689d3a20481268c781e 
> 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -70,4 +70,24 @@ config EC_LENOVO_YOGA_C630
> 
>  	  Say M or Y here to include this support.
> 
> +config EC_LENOVO_THINKPAD_T14S
> +	tristate "Lenovo Thinkpad T14s Embedded Controller driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	depends on INPUT
> +	select INPUT_SPARSEKMAP
> +	select LEDS_CLASS
> +	select NEW_LEDS
> +	select SND_CTL_LED if SND
> +	help
> +	  Driver for the Embedded Controller in the Qualcomm Snapdragon-based
> +	  Lenovo Thinkpad T14s, which provides access to keyboard backlight
> +	  and status LEDs.
> +
> +	  This driver provides support for the mentioned laptop where this
> +	  information is not properly exposed via the standard Qualcomm
> +	  devices.
> +
> +	  Say M or Y here to include this support.
> +
>  endif # ARM64_PLATFORM_DEVICES
> diff --git a/drivers/platform/arm64/Makefile 
> b/drivers/platform/arm64/Makefile
> index 
> 46a99eba3264cc40e812567d1533bb86031a6af3..60c131cff6a15bb51a49c9edab95badf513ee0f6 
> 100644
> --- a/drivers/platform/arm64/Makefile
> +++ b/drivers/platform/arm64/Makefile
> @@ -8,3 +8,4 @@
>  obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
>  obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
> +obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c 
> b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> new file mode 100644
> index 
> 0000000000000000000000000000000000000000..ab783870e8eadfe13d83500c7f39440291e42cc9
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> @@ -0,0 +1,597 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025, Sebastian Reichel
> + */
> +
> +#define DEBUG
> +
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/leds.h>
> +#include <linux/lockdep.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#define THINKPAD_T14S_EC_CMD_ECRD 0x02
> +#define THINKPAD_T14S_EC_CMD_ECWR 0x03
> +#define THINKPAD_T14S_EC_CMD_EVT 0xf0
> +
> +#define THINKPAD_T14S_EC_REG_LED	0x0c
> +#define THINKPAD_T14S_EC_REG_KBD_BL1	0x0d
> +#define THINKPAD_T14S_EC_REG_KBD_BL2	0xe1
> +#define THINKPAD_T14S_EC_KBD_BL1_MASK	GENMASK_U8(7, 6)
> +#define THINKPAD_T14S_EC_KBD_BL1_SHIFT	6
> +#define THINKPAD_T14S_EC_KBD_BL2_MASK	GENMASK_U8(3, 2)
> +#define THINKPAD_T14S_EC_KBD_BL2_SHIFT	2
> +#define THINKPAD_T14S_EC_REG_AUD	0x30
> +#define THINKPAD_T14S_EC_MIC_MUTE_LED	BIT(5)
> +#define THINKPAD_T14S_EC_SPK_MUTE_LED	BIT(6)
> +
> +#define THINKPAD_T14S_EC_EVT_NONE			0x00
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_4			0x13
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_F7			0x16
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_SPACE		0x1F
> +#define THINKPAD_T14S_EC_EVT_KEY_TP_DOUBLE_TAP		0x20
> +#define THINKPAD_T14S_EC_EVT_AC_CONNECTED		0x26
> +#define THINKPAD_T14S_EC_EVT_AC_DISCONNECTED		0x27
> +#define THINKPAD_T14S_EC_EVT_KEY_POWER			0x28
> +#define THINKPAD_T14S_EC_EVT_LID_OPEN			0x2A
> +#define THINKPAD_T14S_EC_EVT_LID_CLOSED			0x2B
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_F12			0x62
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_TAB			0x63
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_F8			0x64
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_F10			0x65
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_F4			0x6A
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_D			0x6B
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_T			0x6C
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_H			0x6D
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_M			0x6E
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_L			0x6F
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_RIGHT_SHIFT		0x71
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_ESC			0x74
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_N			0x79
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_F11			0x7A
> +#define THINKPAD_T14S_EC_EVT_KEY_FN_G			0x7E
> +
> +enum thinkpad_t14s_ec_led_status_t {
> +	THINKPAD_EC_LED_OFF = 0x00,
> +	THINKPAD_EC_LED_ON = 0x80,
> +	THINKPAD_EC_LED_BLINK = 0xc0,
> +};
> +
> +struct thinkpad_t14s_ec_led_classdev {
> +	struct led_classdev led_classdev;
> +	int led;
> +	enum thinkpad_t14s_ec_led_status_t cache;
> +	struct thinkpad_t14s_ec *ec;
> +};
> +
> +struct thinkpad_t14s_ec {
> +	struct regmap *regmap;
> +	struct device *dev;
> +	struct thinkpad_t14s_ec_led_classdev led_pwr_btn;
> +	struct thinkpad_t14s_ec_led_classdev led_chrg_orange;
> +	struct thinkpad_t14s_ec_led_classdev led_chrg_white;
> +	struct thinkpad_t14s_ec_led_classdev led_lid_logo_dot;
> +	struct led_classdev kbd_backlight;
> +	struct led_classdev led_mic_mute;
> +	struct led_classdev led_spk_mute;
> +	struct input_dev *inputdev;
> +};
> +
> +static const struct regmap_config thinkpad_t14s_ec_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xff,
> +};
> +
> +static int thinkpad_t14s_ec_write(void *context, unsigned int reg,
> +				  unsigned int val)
> +{
> +	char buf[5] = {THINKPAD_T14S_EC_CMD_ECWR, reg, 0x00, 0x01, val};
> +	struct thinkpad_t14s_ec *ec = context;
> +	struct i2c_client *client = to_i2c_client(ec->dev);
> +	int ret;
> +
> +	ret = i2c_master_send(client, buf, sizeof(buf));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int thinkpad_t14s_ec_read(void *context, unsigned int reg,
> +				 unsigned int *val)
> +{
> +	char buf[4] = {THINKPAD_T14S_EC_CMD_ECRD, reg, 0x00, 0x01};
> +	struct thinkpad_t14s_ec *ec = context;
> +	struct i2c_client *client = to_i2c_client(ec->dev);
> +	struct i2c_msg request, response;
> +	u8 result;
> +	int ret;
> +
> +	request.addr = client->addr;
> +	request.flags = I2C_M_STOP;
> +	request.len = sizeof(buf);
> +	request.buf = buf;
> +	response.addr = client->addr;
> +	response.flags = I2C_M_RD;
> +	response.len = 1;
> +	response.buf = &result;
> +
> +	i2c_lock_bus(client->adapter, I2C_LOCK_SEGMENT);
> +
> +	ret = __i2c_transfer(client->adapter, &request, 1);
> +	if (ret < 0)
> +		goto out;
> +	ret = __i2c_transfer(client->adapter, &response, 1);
> +	if (ret < 0)
> +		goto out;
> +
> +	*val = result;
> +	ret = 0;
> +
> +out:
> +	i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
> +	return ret;
> +}
> +
> +static const struct regmap_bus thinkpad_t14s_ec_regmap_bus = {
> +	.reg_write = thinkpad_t14s_ec_write,
> +	.reg_read = thinkpad_t14s_ec_read,
> +};
> +
> +static int thinkpad_t14s_ec_read_evt(struct thinkpad_t14s_ec *ec, u8 
> *val)
> +{
> +	char buf[4] = {THINKPAD_T14S_EC_CMD_EVT, 0x00, 0x00, 0x01};
> +	struct i2c_client *client = to_i2c_client(ec->dev);
> +	struct i2c_msg request, response;
> +	int ret;
> +
> +	request.addr = client->addr;
> +	request.flags = I2C_M_STOP;
> +	request.len = sizeof(buf);
> +	request.buf = buf;
> +	response.addr = client->addr;
> +	response.flags = I2C_M_RD;
> +	response.len = 1;
> +	response.buf = val;
> +
> +	i2c_lock_bus(client->adapter, I2C_LOCK_SEGMENT);
> +
> +	ret = __i2c_transfer(client->adapter, &request, 1);
> +	if (ret < 0)
> +		goto out;
> +	ret = __i2c_transfer(client->adapter, &response, 1);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = 0;
> +
> +out:
> +	i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
> +	return ret;
> +}
> +
> +static int thinkpad_t14s_led_set_status(struct thinkpad_t14s_ec *ec,
> +			struct thinkpad_t14s_ec_led_classdev *led,
> +			const enum thinkpad_t14s_ec_led_status_t ledstatus)
> +{
> +	int ret;
> +
> +	ret = regmap_write(ec->regmap, THINKPAD_T14S_EC_REG_LED,
> +			   led->led | ledstatus);
> +	if (ret < 0)
> +		return ret;
> +
> +	led->cache = ledstatus;
> +	return 0;
> +}
> +
> +static int thinkpad_t14s_led_set(struct led_classdev *led_cdev,
> +				 enum led_brightness brightness)
> +{
> +	struct thinkpad_t14s_ec_led_classdev *led = container_of(led_cdev,
> +			struct thinkpad_t14s_ec_led_classdev, led_classdev);
> +	enum thinkpad_t14s_ec_led_status_t new_state;
> +
> +	if (brightness == LED_OFF)
> +		new_state = THINKPAD_EC_LED_OFF;
> +	else if (led->cache != THINKPAD_EC_LED_BLINK)
> +		new_state = THINKPAD_EC_LED_ON;
> +	else
> +		new_state = THINKPAD_EC_LED_BLINK;
> +
> +	return thinkpad_t14s_led_set_status(led->ec, led, new_state);
> +}
> +
> +static int thinkpad_t14s_led_blink_set(struct led_classdev *led_cdev,
> +				       unsigned long *delay_on,
> +				       unsigned long *delay_off)
> +{
> +	struct thinkpad_t14s_ec_led_classdev *led = container_of(led_cdev,
> +			struct thinkpad_t14s_ec_led_classdev, led_classdev);
> +
> +	/* Can we choose the flash rate? */
> +	if (*delay_on == 0 && *delay_off == 0) {
> +		/* yes. set them to the hardware blink rate (1 Hz) */
> +		*delay_on = 500; /* ms */
> +		*delay_off = 500; /* ms */
> +	} else if ((*delay_on != 500) || (*delay_off != 500))
> +		return -EINVAL;
> +
> +	return thinkpad_t14s_led_set_status(led->ec, led, 
> THINKPAD_EC_LED_BLINK);
> +}
> +
> +static int thinkpad_t14s_init_led(struct thinkpad_t14s_ec *ec,
> +				  struct thinkpad_t14s_ec_led_classdev *led,
> +				  u8 id, const char *name)
> +{
> +	led->led_classdev.name = name;
> +	led->led_classdev.flags = LED_RETAIN_AT_SHUTDOWN;
> +	led->led_classdev.max_brightness = 1;
> +	led->led_classdev.brightness_set_blocking = thinkpad_t14s_led_set;
> +	led->led_classdev.blink_set = thinkpad_t14s_led_blink_set;
> +	led->ec = ec;
> +	led->led = id;
> +
> +	return devm_led_classdev_register(ec->dev, &led->led_classdev);
> +}
> +
> +static int thinkpad_t14s_leds_probe(struct thinkpad_t14s_ec *ec)
> +{
> +	int ret;
> +
> +	ret = thinkpad_t14s_init_led(ec, &ec->led_pwr_btn, 0,
> +				     "platform::power");
> +	if (ret)
> +		return ret;
> +	ret = thinkpad_t14s_init_led(ec, &ec->led_chrg_orange, 1,
> +				     "platform:amber:battery-charging");
> +	if (ret)
> +		return ret;
> +	ret = thinkpad_t14s_init_led(ec, &ec->led_chrg_white, 2,
> +				     "platform:white:battery-full");
> +	if (ret)
> +		return ret;
> +	ret = thinkpad_t14s_init_led(ec, &ec->led_lid_logo_dot, 10,
> +				     "platform::lid_logo_dot");
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int thinkpad_t14s_kbd_bl_set(struct led_classdev *led_cdev,
> +				    enum led_brightness brightness)
> +{
> +	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
> +					struct thinkpad_t14s_ec, kbd_backlight);
> +	int ret;
> +
> +	ret = regmap_update_bits(ec->regmap, THINKPAD_T14S_EC_REG_KBD_BL1,
> +				 THINKPAD_T14S_EC_KBD_BL1_MASK,
> +				 brightness << THINKPAD_T14S_EC_KBD_BL1_SHIFT);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_update_bits(ec->regmap, THINKPAD_T14S_EC_REG_KBD_BL2,
> +				 THINKPAD_T14S_EC_KBD_BL2_MASK,
> +				 brightness << THINKPAD_T14S_EC_KBD_BL2_SHIFT);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static enum led_brightness thinkpad_t14s_kbd_bl_get(struct 
> led_classdev *led_cdev)
> +{
> +	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
> +					struct thinkpad_t14s_ec, kbd_backlight);
> +	int ret, val;
> +
> +	ret = regmap_read(ec->regmap, THINKPAD_T14S_EC_REG_KBD_BL1, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	val &= THINKPAD_T14S_EC_KBD_BL1_MASK;
> +
> +	return val >> THINKPAD_T14S_EC_KBD_BL1_SHIFT;
> +}
> +
> +static void thinkpad_t14s_kbd_bl_update(struct thinkpad_t14s_ec *ec)
> +{
> +	enum led_brightness brightness = 
> thinkpad_t14s_kbd_bl_get(&ec->kbd_backlight);
> +
> +	led_classdev_notify_brightness_hw_changed(&ec->kbd_backlight, 
> brightness);
> +}
> +
> +static int thinkpad_t14s_kbd_backlight_probe(struct thinkpad_t14s_ec 
> *ec)
> +{
> +	ec->kbd_backlight.name = "platform::kbd_backlight";
> +	ec->kbd_backlight.flags = LED_BRIGHT_HW_CHANGED;
> +	ec->kbd_backlight.max_brightness = 2;
> +	ec->kbd_backlight.brightness_set_blocking = thinkpad_t14s_kbd_bl_set;
> +	ec->kbd_backlight.brightness_get = thinkpad_t14s_kbd_bl_get;
> +
> +	return devm_led_classdev_register(ec->dev, &ec->kbd_backlight);
> +}
> +
> +static enum led_brightness thinkpad_t14s_audio_led_get(struct 
> thinkpad_t14s_ec *ec,
> +						       u8 led_bit)
> +{
> +	int ret, val;
> +
> +	ret = regmap_read(ec->regmap, THINKPAD_T14S_EC_REG_AUD, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return !!(val && led_bit);
> +}
> +
> +static enum led_brightness thinkpad_t14s_audio_led_set(struct 
> thinkpad_t14s_ec *ec,
> +						       u8 led_bit,
> +						       enum led_brightness brightness)
> +{
> +	u8 val = brightness ? led_bit : 0;
> +
> +	return regmap_update_bits(ec->regmap, THINKPAD_T14S_EC_REG_AUD, 
> led_bit, val);
> +}
> +
> +static enum led_brightness thinkpad_t14s_mic_mute_led_get(struct 
> led_classdev *led_cdev)
> +{
> +	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
> +					struct thinkpad_t14s_ec, led_mic_mute);
> +
> +	return thinkpad_t14s_audio_led_get(ec, THINKPAD_T14S_EC_MIC_MUTE_LED);
> +}
> +
> +static int thinkpad_t14s_mic_mute_led_set(struct led_classdev 
> *led_cdev,
> +					  enum led_brightness brightness)
> +{
> +	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
> +					struct thinkpad_t14s_ec, led_mic_mute);
> +
> +	return thinkpad_t14s_audio_led_set(ec, THINKPAD_T14S_EC_MIC_MUTE_LED, 
> brightness);
> +}
> +
> +static enum led_brightness thinkpad_t14s_spk_mute_led_get(struct 
> led_classdev *led_cdev)
> +{
> +	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
> +					struct thinkpad_t14s_ec, led_spk_mute);
> +
> +	return thinkpad_t14s_audio_led_get(ec, THINKPAD_T14S_EC_SPK_MUTE_LED);
> +}
> +
> +static int thinkpad_t14s_spk_mute_led_set(struct led_classdev 
> *led_cdev,
> +					  enum led_brightness brightness)
> +{
> +	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
> +					struct thinkpad_t14s_ec, led_spk_mute);
> +
> +	return thinkpad_t14s_audio_led_set(ec, THINKPAD_T14S_EC_SPK_MUTE_LED, 
> brightness);
> +}
> +
> +static int thinkpad_t14s_kbd_audio_led_probe(struct thinkpad_t14s_ec 
> *ec)
> +{
> +	int ret;
> +
> +	ec->led_mic_mute.name = "platform::micmute";
> +	ec->led_mic_mute.max_brightness = 1,
> +	ec->led_mic_mute.default_trigger = "audio-micmute",
> +	ec->led_mic_mute.brightness_set_blocking = 
> thinkpad_t14s_mic_mute_led_set;
> +	ec->led_mic_mute.brightness_get = thinkpad_t14s_mic_mute_led_get;
> +
> +	ec->led_spk_mute.name = "platform::mute";
> +	ec->led_spk_mute.max_brightness = 1,
> +	ec->led_spk_mute.default_trigger = "audio-mute",
> +	ec->led_spk_mute.brightness_set_blocking = 
> thinkpad_t14s_spk_mute_led_set;
> +	ec->led_spk_mute.brightness_get = thinkpad_t14s_spk_mute_led_get;
> +
> +	ret = devm_led_classdev_register(ec->dev, &ec->led_mic_mute);
> +	if (ret)
> +		return ret;
> +
> +	return devm_led_classdev_register(ec->dev, &ec->led_spk_mute);
> +}
> +
> +/*
> + * using code 0x16 ignores the provided KEY code and use KEY_MUTE,
> + * so all codes have a 0x1000 offset
> + */
> +static const struct key_entry thinkpad_t14s_keymap[] = {
> +	{ KE_KEY, 0x1000 + THINKPAD_T14S_EC_EVT_KEY_FN_4, { KEY_SLEEP } },
> +	{ KE_KEY, 0x1000 + THINKPAD_T14S_EC_EVT_KEY_FN_N, { KEY_VENDOR } },
> +	{ KE_KEY, 0x1000 + THINKPAD_T14S_EC_EVT_KEY_FN_F4, { KEY_MICMUTE } },
> +	{ KE_KEY, 0x1000 + THINKPAD_T14S_EC_EVT_KEY_FN_F7, { 
> KEY_SWITCHVIDEOMODE } },
> +	{ KE_KEY, 0x1000 + THINKPAD_T14S_EC_EVT_KEY_FN_F8, { KEY_MODE } },
> +	{ KE_KEY, 0x1000 + THINKPAD_T14S_EC_EVT_KEY_FN_F10, { 
> KEY_SELECTIVE_SCREENSHOT } },
> +	{ KE_KEY, 0x1000 + THINKPAD_T14S_EC_EVT_KEY_FN_F11, { KEY_LINK_PHONE 
> } },
> +	{ KE_KEY, 0x1000 + THINKPAD_T14S_EC_EVT_KEY_FN_F12, { KEY_BOOKMARKS } 
> },
> +	{ KE_KEY, 0x1000 + THINKPAD_T14S_EC_EVT_KEY_FN_SPACE, { 
> KEY_KBDILLUMTOGGLE } },
> +	{ KE_KEY, 0x1000 + THINKPAD_T14S_EC_EVT_KEY_FN_ESC, { KEY_FN_ESC } },
> +	{ KE_KEY, 0x1000 + THINKPAD_T14S_EC_EVT_KEY_FN_TAB, { KEY_ZOOM } },
> +	{ KE_KEY, 0x1000 + THINKPAD_T14S_EC_EVT_KEY_FN_RIGHT_SHIFT, { 
> KEY_FN_RIGHT_SHIFT } },
> +	{ KE_KEY, 0x1000 + THINKPAD_T14S_EC_EVT_KEY_TP_DOUBLE_TAP, { 
> KEY_PROG4 } },
> +	{ KE_END }
> +};
> +
> +static int thinkpad_t14s_input_probe(struct thinkpad_t14s_ec *ec)
> +{
> +	int ret;
> +
> +	ec->inputdev = devm_input_allocate_device(ec->dev);
> +	if (!ec->inputdev)
> +		return -ENOMEM;
> +
> +	ec->inputdev->name = "ThinkPad Extra Buttons";
> +	ec->inputdev->phys = "thinkpad/input0";
> +	ec->inputdev->id.bustype = BUS_HOST;
> +	ec->inputdev->dev.parent = ec->dev;
> +
> +	ret = sparse_keymap_setup(ec->inputdev, thinkpad_t14s_keymap, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret = input_register_device(ec->inputdev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static irqreturn_t thinkpad_t14s_ec_irq_handler(int irq, void *data)
> +{
> +	struct thinkpad_t14s_ec *ec = data;
> +	int ret;
> +	u8 val;
> +
> +	ret = thinkpad_t14s_ec_read_evt(ec, &val);
> +	if (ret < 0) {
> +		dev_err(ec->dev, "Failed to read event\n");
> +		return IRQ_HANDLED;
> +	}
> +
> +	switch (val) {
> +	case THINKPAD_T14S_EC_EVT_NONE:
> +		break;
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_SPACE:
> +		thinkpad_t14s_kbd_bl_update(ec);
> +		fallthrough;
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_F4:
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_F7:
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_4:
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_F8:
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_F12:
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_TAB:
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_F10:
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_N:
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_F11:
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_ESC:
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_RIGHT_SHIFT:
> +	case THINKPAD_T14S_EC_EVT_KEY_TP_DOUBLE_TAP:
> +		sparse_keymap_report_event(ec->inputdev, 0x1000 + val, 1, true);
> +		break;
> +	case THINKPAD_T14S_EC_EVT_AC_CONNECTED:
> +		dev_dbg(ec->dev, "AC connected\n");
> +		break;
> +	case THINKPAD_T14S_EC_EVT_AC_DISCONNECTED:
> +		dev_dbg(ec->dev, "AC disconnected\n");
> +		break;
> +	case THINKPAD_T14S_EC_EVT_KEY_POWER:
> +		dev_dbg(ec->dev, "power button\n");
> +		break;
> +	case THINKPAD_T14S_EC_EVT_LID_OPEN:
> +		dev_dbg(ec->dev, "LID open\n");
> +		break;
> +	case THINKPAD_T14S_EC_EVT_LID_CLOSED:
> +		dev_dbg(ec->dev, "LID closed\n");
> +		break;
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_G:
> +		dev_dbg(ec->dev, "FN + G - toggle double-tapping\n");
> +		break;
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_L:
> +		dev_dbg(ec->dev, "FN + L - low performance mode\n");
> +		break;
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_M:
> +		dev_dbg(ec->dev, "FN + M - medium performance mode\n");
> +		break;
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_H:
> +		dev_dbg(ec->dev, "FN + H - high performance mode\n");
> +		break;
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_T:
> +		dev_dbg(ec->dev, "FN + T - toggle intelligent cooling mode\n");
> +		break;
> +	case THINKPAD_T14S_EC_EVT_KEY_FN_D:
> +		dev_dbg(ec->dev, "FN + D - toggle privacy guard mode\n");
> +		break;
> +	default:
> +		dev_info(ec->dev, "Unknown EC event: 0x%02x\n", val);
> +		break;
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int thinkpad_t14s_ec_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct thinkpad_t14s_ec *ec;
> +	int ret;
> +
> +	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> +	if (!ec)
> +		return -ENOMEM;
> +
> +	ec->dev = dev;
> +
> +	ec->regmap = devm_regmap_init(dev, &thinkpad_t14s_ec_regmap_bus,
> +				      ec, &thinkpad_t14s_ec_regmap_config);
> +	if (IS_ERR(ec->regmap))
> +		return dev_err_probe(dev, PTR_ERR(ec->regmap),
> +				     "Failed to init regmap\n");
> +
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +					thinkpad_t14s_ec_irq_handler,
> +					IRQF_ONESHOT, dev_name(dev), ec);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get IRQ\n");
> +
> +	ret = thinkpad_t14s_leds_probe(ec);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = thinkpad_t14s_kbd_backlight_probe(ec);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = thinkpad_t14s_kbd_audio_led_probe(ec);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = thinkpad_t14s_input_probe(ec);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * Disable wakeup support by default, because the driver currently 
> does
> +	 * not support masking any events and the laptop should not wake up 
> when
> +	 * the LID is closed.
> +	 */
> +	device_wakeup_disable(dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id thinkpad_t14s_ec_of_match[] = {
> +	{ .compatible = "lenovo,thinkpad-t14s-ec" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, thinkpad_t14s_ec_of_match);
> +
> +static const struct i2c_device_id thinkpad_t14s_ec_i2c_id_table[] = {
> +	{ "thinkpad-t14s-ec", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, thinkpad_t14s_ec_i2c_id_table);
> +
> +static struct i2c_driver thinkpad_t14s_ec_i2c_driver = {
> +	.driver = {
> +		.name = "thinkpad-t14s-ec",
> +		.of_match_table = thinkpad_t14s_ec_of_match
> +	},
> +	.probe = thinkpad_t14s_ec_probe,
> +	.id_table = thinkpad_t14s_ec_i2c_id_table,
> +};
> +module_i2c_driver(thinkpad_t14s_ec_i2c_driver);
> +
> +MODULE_AUTHOR("Sebastian Reichel <sre@kernel.org>");
> +MODULE_DESCRIPTION("Lenovo Thinkpad T14s Embedded Controller");
> +MODULE_LICENSE("GPL");
>
> -- 
> 2.50.1

