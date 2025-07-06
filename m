Return-Path: <linux-arm-msm+bounces-63841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 657F1AFA2E1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 05:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7FF817BD73
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 03:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FBA1922C0;
	Sun,  6 Jul 2025 03:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWTzKb6t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0312E3717;
	Sun,  6 Jul 2025 03:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751773421; cv=none; b=FHUcVQrxPO4TqydEZF32JqT+KI5vOgOFiXIxkFVCybUPJ3PIKmb8q1h55WnkykriTWne031iaESenI/I1wLdE9y9KbNAMv1HSLIcCnrPPPZTWNb6N+i9zqb698eOdrH0Lu7cbMLiIXZL4K/aZnef6WRwF8lYXd2q9nWB8SfAMhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751773421; c=relaxed/simple;
	bh=3AMMnlHd1U6wIG7D7DIX4qEiRdedgR7xMDzzdt7Pa2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sY4llNp19srQM81kM+B8NwsW71OI56pXmPnJ3JeIRk7XIZhTcJLsfyD/SYtNHQlNhcfUt9OQHSNtKvEuw6HAFzCDJD1Brd5SL/QhulyyEQoBtoDp3F1JA9y6GfKBV7Kz4AdjXE0CjS2rHCap/RfpoSh0Qq9udk/cMcbq3pnc60M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWTzKb6t; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235ef62066eso32178655ad.3;
        Sat, 05 Jul 2025 20:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751773419; x=1752378219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=692z2j5JqybfGJs3QP4P1sOhZFmW1Px0hlvoTc305Gc=;
        b=AWTzKb6tQFAg98mGjMPXTABq0yFgpDvD/ryI1Js1NiFt6xvC6s32tvR3S5WVw4rWdz
         c5riqHOeu+IT3ioU6mokEexgvOQYI+EvFLqqqnxWhued/dtaFIDJEIT4/+CKY0v40bxT
         Vmv4vvt101PViPnrs8VwqjNbH5jV9fvy9N18CuZez/qK1VTn2WL8rZe7epdLkb4tERqz
         lGE8kx7p1qMgMQGffQnkqYrdZGy6hqcjeWriaUtuna8vogRFyy3AtYMBOJTygCL90yUj
         wgXb6ZMtnMF2iSAkBCIFQqSThWmVy/OaVHhodWRXTLvrOUq68lr5KUWTpRF+JqoaHuk2
         OqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751773419; x=1752378219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=692z2j5JqybfGJs3QP4P1sOhZFmW1Px0hlvoTc305Gc=;
        b=G9J+51l7U+2+qJD54bch/u75I49G+4zrutMzs5KmGKi/Aweo71f3vR3uMAQjjgesTC
         sWcM1hvv0GjkDV/nKUG8Ow0WhYl+LnGj3G3P1YQkjU6ckzhEHEbj6HJqirL3idxS14+/
         RRl4eDoNtVO7UDjOWduRURszCNUuyHIwcjAVE9gSQv5/fWBpxHANGMDcj77TIttl1gdq
         V0yHbRZ3LJB/8tC25zOv1+bgEWK9kS9C6lFmjRg87x7r4/q0u0dk2AUDvIvYaQSDXCZO
         GXf/NTEM02Jk064bkOovBeJitgo3j5J+b8VdJVlyvNTL5GHRfocaKqhPYEWNFuf4QRkr
         Mcpg==
X-Forwarded-Encrypted: i=1; AJvYcCU8ML0qjls1jUj2Fl7tnDqpJygjz2Q1KSTkAhh7l13VLDb6MPUUoSLCvZVZxWMbsy0NmhUbPyDgI9Jt+dYX@vger.kernel.org, AJvYcCUsrI1weJo/YLmxK9IPYMxpQ/AeE1IH6w0jTyIcnFMEnbvrkoRXm8JMEhDbe1FCl2XNuxJjGGmMU3T04y2O/w==@vger.kernel.org, AJvYcCV6cpVzPenSMjyM1shrpVGAvvjPgIaQ3b6Om4KbR/yCd1NwfMSM0JVRoppJw9dmfBkzuuwXudpQ4oLL@vger.kernel.org
X-Gm-Message-State: AOJu0YwDqaYoiDVsLZy86nr8j6N5fM4lgtQlYgyMUs3g1QKr8Uu4BVky
	wFVZLGpJXCc+5ed0bJaoV9HF1YFkl+emucNDI3FEeJA5Bog03DAJKp0WidoVMg==
X-Gm-Gg: ASbGncvESZRnBXtiwl1RmID+9a6SCeJAHwEobemLnjDX73+MvIRxITahkifxoJmOvoN
	hpxPH+XRhU5i6FAcVBrtUpzsCxM2sFC1hy1s7jAVfoIq1iP/pi1aiLa4nWmpcbes7TY4EU1JbKU
	hpOwgmwVpqqdfEuR8jXa4OETNUpGyj3nHh61JthOJcyeDmeRnLuvTgH72o1pErvjGDw6JVl0Z0G
	unFqMQi87IBxXBNEiUdPCdNFbINg6D4pRHmGzTPCGYdrfDLjTYQPSmVKR1kaIUlhD/X+XYd63EQ
	wdVEIkVIO/KbRSbsGkGJZJFF3HeG2B1Q3qk99t9TouVKKtovZejTD7Tlg7uuit1Jc3JFQZKNuA=
	=
X-Google-Smtp-Source: AGHT+IHx+IYrXKr3xB977sY51qAuIeSph3F9p1dTKzgWZE2kmv8QVjP1JAIdDGrLhfrOpI54EvpjOw==
X-Received: by 2002:a17:902:fc8e:b0:234:c5c1:9b84 with SMTP id d9443c01a7336-23c90fd83c1mr54275325ad.37.1751773419007;
        Sat, 05 Jul 2025 20:43:39 -0700 (PDT)
Received: from nuvole.lan ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8457e4d2sm57092205ad.148.2025.07.05.20.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 20:43:38 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: aliceryhl@google.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	ebiggers@google.com,
	ilpo.jarvinen@linux.intel.com,
	joel.granados@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	len.brown@intel.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	mingo@kernel.org,
	mitltlatltl@gmail.com,
	ojeda@kernel.org,
	robh@kernel.org,
	sfr@canb.auug.org.au,
	vanyang@smail.nju.edu.cn,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: Add initial support for Ntmer TW220
Date: Sun,  6 Jul 2025 11:43:02 +0800
Message-ID: <20250706034303.5404-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <de111b27-9126-4c03-a7bb-8cce9ea2780e@oss.qualcomm.com>
References: <de111b27-9126-4c03-a7bb-8cce9ea2780e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Jun 28, 2025 at 3:48 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> On 6/17/25 11:29 AM, Pengyu Luo wrote:
> > The Ntmer TW220 is a WOS tablet based on the Qualcomm SC8280XP platform,
> > also known as the Robo&Kala 2-in-1 Laptop. Thanks to Hong for providing
> > the unlocked device and early development work. This patch adds an
> > initial device tree to enable basic functionality.
> >
> > Currently supported components include:
> > - Bluetooth & Wi-Fi (board file regeneration required)
> > - Battery charging (up to 15V/3A fixed PDO) and reporting via pmic-glink
> > - Flash LEDs (front and rear)
> > - Hall sensor (lid detection)
> > - Keyboard (via Bluetooth or USB)
> > - NVMe SSD
> > - Power and volume keys
> > - Simple-framebuffer
> > - Sound (playback and capture; top-left DMIC only, top-right works only
> >   on Windows)
> > - Touchscreen and stylus (requires GPI DMA support [1] and stylus support [2])
> > - USB Type-C ports
> >
> > The following components are currently non-functional:
> > - Cameras (GalaxyCore GC5035; only sensor ID is detectable, no frames in libcamera;
> >   partial driver can be found on LKML archives)
> > - DSI display (blank screen with `dsi_err_worker: status=4`; primary DSI register
> >   dump included below)
> > - Stylus wireless charger (CPS4035)
> > - UCSI over GLINK
> >
> > [1]: https://lore.kernel.org/linux-arm-msm/20250617090032.1487382-3-mitltlatltl@gmail.com
> > [2]: https://lore.kernel.org/linux-input/20250605054855.403487-2-mitltlatltl@gmail.com
> >
> > Note: This series does **not** include any confidential material. Those
> > who wish to run Linux on this device should contact Ntmer, as the
> > bootloader is locked via secure boot.
> >
> > Co-developed-by: Hong Zhu <vanyang@smail.nju.edu.cn>
> > Signed-off-by: Hong Zhu <vanyang@smail.nju.edu.cn>
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >
> > dsi_ctrl, reg = <0 0x0ae94000 0 0x400>;
> > 0xae94000 20050001 000001f3 0000000b dddd1011
>
> This is not something we want in the commit log
>

I will remove it. I need help, then I attached it, two of my sc8280xp
devices require dsi to work. Reversing and guessing wasted a lot of
time. I will appreciate it if qcom could support it.

> [...]
>
> > +     gpio-leds {
> > +             compatible = "gpio-leds";
> > +
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&camf_indicator_en>, <&camr_indicator_en>;
>
> property-n
> property-names
>
> in that order, across the file, please
>

Ack

> [...]
>
> > +             wsa-dai-link {
> > +                     link-name = "WSA Playback";
> > +
> > +                     cpu {
> > +                             sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> > +                     };
> > +
> > +                     codec {
>
> 'co'dec < 'cp'u
>

Ack

> [...]
>
> > +/*
> > + * cci0_i2c1
> > + * sda: gpio115, scl: gpio116
> > + *
> > + * CAMI ov9234 @36 @48
> > + *
> > + * power on sequence
> > + * gpio7 out low
> > + * l3q 1p8
> > + * l6q 2p8
> > + * l2q 1p2
> > + * gpio7 out high
> > + * msleep 5
> > + * cam_cc_mclk4_clk 2.4MHz (gpio6)
> > + */
>
> It would be useful to enable these buses and set up what we can,
> otherwise this is quite a lot of text for comments..
>

Ack

> [...]
>
> > +&spi22 {
> > +     status = "okay";
> > +     pinctrl-0 = <&spi22_default>;
> > +     pinctrl-names = "default";
>
> status should be the last property (before subnodes), preferably
> with a newline before it, so:
>
> pinctrl-0 = <&spi22_default>;
> pinctrl-names = "default";
>
> status = "okay";
>

Ack

>
> > +
> > +     touchscreen@0 {
> > +             /*
> > +              * The ACPI device ID is GXTS7986, its exact suffix is unknown.
> > +              * The Windows driver suggests it is a GTBerlinB variant and
> > +              * communicates via HID over SPI, which aligns with the Linux
> > +              * driver `drivers/hid/hid-goodix-spi.c`.
> > +              *
> > +              * However, the HID descriptor read from the device appears
> > +              * garbled, preventing proper probe with the HID driver. In
> > +              * contrast, the driver at
> > +              * `drivers/input/touchscreen/goodix_berlin_spi.c` shares many
> > +              * similarities and functions correctly with this hardware.
> > +              *
> > +              * Therefore, we choose to use the goodix_berlin_spi driver
> > +              * instead.
>
> Is this something you could work out with the aforementioned drivers'
> maintainers?
>

Since the ts device works well, I am still occupied with dsi things,
I may contact them later.

BTW, could you please review the gpi dma patches, touchscreen depends
on it, it is still hanging there, thanks in advance.
https://lore.kernel.org/linux-arm-msm/20250617090032.1487382-3-mitltlatltl@gmail.com

> [...]
>
> > +&pcie4_port0 {
> > +     wifi@0 {
> > +             compatible = "pci17cb,1103";
> > +             reg = <0x10000 0x0 0x0 0x0 0x0>;
> > +
> > +             vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
> > +             vddaon-supply = <&vreg_pmu_aon_0p8>;
> > +             vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> > +             vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
> > +             vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> > +             vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> > +             vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> > +             vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> > +             vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
> > +
> > +             /*
> > +              * bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,
> > +              * subsystem-device=0108,qmi-chip-id=18,qmi-board-id=255
> > +              *
> > +              * Regenerate board file, x13s one works well
>
> Please post on the ath11k mailing list and propose and ask for
> that variant to be included
>

Ack

Best wishes,
Pengyu

