Return-Path: <linux-arm-msm+bounces-58863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2386DABEE1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 10:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 798EA3B3FA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 08:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A272367B9;
	Wed, 21 May 2025 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTPRg/21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011FC1799F;
	Wed, 21 May 2025 08:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747816814; cv=none; b=mDlvxcun5POJ+DS7N8P89zJ5pj94oNgQjDpUi9luhY5QljLVCSQSRJctKW715kwfHYnFAUp8jbyIACexBktABtrcYJ3nPOvkwIfJQNmYvdactSvHO4zDofcNKjXe1XyIceSWXvxhf/w1f0/v8mX0QV8t6f8mcT33LUrW6iKky5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747816814; c=relaxed/simple;
	bh=prPuohwI+Mx1qO9jheq0v68uTEiCGdKQtjR4A2uzvkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B4JWtk7uM+yvJIl6AhkU+0QHZ2pXJ4Zj9okl2jAlY+/vPxT+LFTvWsKy2jm+5ihPX6DIsdbEexsL3d1yHrqgHccS8MknFsKck2VGXAfSysWK7zzwsNEbYSZPlTmYD3DAIBQVSIGYqgOkSgRohdau5NH2/5ZdQuYT4vfQkU6nXys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTPRg/21; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-231bf5851b7so50700625ad.0;
        Wed, 21 May 2025 01:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747816811; x=1748421611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TJUBt0PQT/0MqXl3YQcZJaW2RHiYQHMpm5oG/g8io0=;
        b=fTPRg/21LMB+lr6TgZ1eXLFl5MBlK8sOnWutM7ycA1cJaMIkoWPKnVzUy6NEaCqu18
         eHgUlmK3zMz02zUaIaeaDSB40Ee62LCfGHlVex6LJlNwNOu6Mpo+B32bBmOMzA7+D4Ly
         Sncn9Ga8RBk48d/AkUhPk9XfumgumEA8AvINPZhH7pwDvtzgbriISviego2Q9FXbmWnG
         gChZJ7gwU4uaI/DS2lUBPDVb/5+VxrpW0Brak0HvgwkUivQWuWtxlEHRhCQBqfjmsYZ7
         6h124stg6yetStDKOXNshtXqoUOWC/awWHzNuct5O+GRqwMum3t1qowAUBAEBvgGFwlZ
         hh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747816811; x=1748421611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TJUBt0PQT/0MqXl3YQcZJaW2RHiYQHMpm5oG/g8io0=;
        b=r7WHIW449B95dhnJ4SyC/nn5gA2qHUsX9u/sOyLLGlgRsEkcDz34NyofRQTX5n3MFm
         keyTm+nb5eM4hyXC4YfWik3PWSSvOFGI5u6F+I1wt2eEQFA6DIyPkgNYZipEs2H71KFs
         rhqGX6x8Ebg70M8W7HsHYrTTF6DjgdDVjfS3On0s1y6ECRnwwO9T/cWWvFJppuzpfmYP
         pyir3s6BI9nCwXIYV0QZ1wyNiEdg87Qw9GwjVP9xjB7zFuppWdeWVsVmx0/foMF+z2jR
         ZsVwt37qzfsQMk1BukxrKzBx5nSEYBiFxen7hJgH4rAK+msZGSiY2B5zY1z2NPdtKaiu
         a57g==
X-Forwarded-Encrypted: i=1; AJvYcCUM8D83JtBswQ/dL/Sk3YC/N1+eGZQ8wxrJZhYg5B0Ka4hIP/dmGYOjyqxPdAjl/9WWfLjPN3A+3JdTkHK8@vger.kernel.org, AJvYcCUW0347vKvM5hfsfHjhsiHrpg+S1GY6b++zK/KODWKzFVZE+QcuRkx4gwnHbbAlYvophrSi+gPdaJa6@vger.kernel.org, AJvYcCXlidaIShYGBs6eJqmEgMVbPrssA5VsP7B7VetwnDS5IhEubBlVBa10b82xzsVu7SevBzK18mBtxPIfO3dtDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHl/IeeP5DaDBHrfuZNP1LLSRsq1aNpDqeeoOY3l8FjMx4OlQm
	zlZ9w4UFlZbC5dbeRDZhdDYE1fR3Wl+nwbnLQj//Ytoo4Fnps93gRhNv
X-Gm-Gg: ASbGncs+pJhcLa+Gi+caNeu9KvZg8zFdPw3LwgQprzu030aeuwIbeWDejwgEiNZ3ILd
	rbFtAf2qg32BleOdyi99qHNNkc03bWNeNO6frLbuW8lYuFR7NwMZfS9ynmf0iiyIwg8ZAm3mkPK
	KGimSXVlY6MtN+yxhPmk5i1fOoWb69234+njlq+GFZhFt0fRUqsdHuQ9wWO2JMomTcQn1lpZd/b
	qe/67Yr/Vf1xTYGtPLCLRr7qe+7GTJC/D+7hHbBHXAAPYjkGMHsVxayJtHXdpGuAiDu2b6dEMhf
	+CK3GjdStKSwu/01LEuKwN49c+d+igbZYlVSBnVNhVQBeoYKJXXQoB6D5gvo
X-Google-Smtp-Source: AGHT+IHor/Q3irw/xtS9W76V6U/4pYcQFpOGtCJAgsOcZxnFuGJ0xvRl2F09RuZWoUs+d6mOC9dQFg==
X-Received: by 2002:a17:903:1b2d:b0:224:1943:c5c with SMTP id d9443c01a7336-231d44e66b1mr262377695ad.15.1747816811014;
        Wed, 21 May 2025 01:40:11 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97fa6sm87974975ad.135.2025.05.21.01.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 01:40:10 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mitltlatltl@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: Add support for Oneplus Pad Pro (caihong)
Date: Wed, 21 May 2025 16:37:45 +0800
Message-ID: <20250521083746.666228-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <e4d65994-89dd-4068-a8db-050e698f9bb3@oss.qualcomm.com>
References: <e4d65994-89dd-4068-a8db-050e698f9bb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, May 21, 2025 at 5:54 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> On 5/20/25 6:42 PM, Pengyu Luo wrote:
> > The OnePlus Pad Pro is an Android tablet based on the Qualcomm SM8650
> > platform. Its device codename is "caihong". This patch adds an initial
> > devicetree for basic functionality.
> >
> > Currently working components include:
> > - Backlight
> > - Bluetooth
> > - Battery charging (up to 5v 0.5a) & reporting via pmic-glink (There
> > are many unknown notifications)
> > - Display panel ([1])
> > - Keyboard (via BT)
> > - Power key & volume keys
> > - Touchscreen & stylus ([2])
> > - USB Type-c port
> > - UFS storage
> > - Wi-Fi
> >
> > The following components are currently non-functional:
> > - Audio
> > - Cameras
> > - Charging pump (dual sc8547)
> > - Keyboard (via pogo pin)
> > - Stylus wireless charger (cps8601)
> > - UCSI over GLINK (PPM init fails)
> >
> > [1]: The panel is a dual-DSI, dual-DSC display that requires setting
> >      'slice_per_pkt = 2' in the DPU configuration. The panel driver
> >      will be submitted separately later.
> > [2]: Touchscreen/stylus driver available at:
> >      https://github.com/OnePlusOSS/android_kernel_modules_and_devicetree_oneplus_sm8650/blob/oneplus/sm8650_v_15.0.0_pad_pro/vendor/oplus/kernel/touchpanel/oplus_touchscreen_v2/Novatek/NT36532_noflash/nvt_drivers_nt36532_noflash.c
> >      The downstream driver has been ported and tested locally, but
> >      requires cleanup, it may be submitted separately later.
>
> I have a Lenovo Tab P11 with a nt36523w (-23, not -32) for which I have once
> poked at the driver for.. I see the driver you posted mentions -23 as well,
> please keep me in the loop if you're going to upstream it
>

I see. Actually, they share the most part of nt36xxx, but with
different memory maps. See
https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/elish-r-oss/drivers/input/touchscreen/nt36xxx/nt36xxx_mem_map.h

> [...]
>
> > +             /*
> > +              * This memory region is required to initialize the backlight
> > +              * and display for bootloader. Normally, this region is not
> > +              * needed. However, due to limitations in the current mainline
> > +              * KTZ8866 driver, dual backlight ICs cannot be properly
> > +              * initialized.
> > +              *
> > +              * A workaround involving secondary registration was proposed,
> > +              * but rejected by reviewers. This reserved region is kept as
> > +              * a temporary solution until a proper initialization method
> > +              * that satisfies upstream requirements is found.
> > +              */
> > +             splash_region {
> > +                     reg = <0 0xd5100000 0 0x2b00000>;
> > +                     no-map;
> > +             };
>
> I assume this means "if the bootloader sees /reserved-memory/splash_region,
> it keeps the display online" - let's not do that, as underscores are not
> allowed in node names (kernel coding style, not dt syntax)
>

Right, without it, BL won't initialize backlight and display. We need
it to initialize backlight here since mainline ktz8866 won't program
partial registers properly. If there is no other workaround, I will
remove it to keep kernel coding style.

> > +     };
> > +
> > +     /* No Modem */
> > +     smp2p-modem {
> > +             status = "disabled";
> > +     };
>
> There shouldn't be any harm in keeping this node enabled
>

Ack

> [...]
>
> > +
> > +     vph_pwr: vph-pwr-regulator {
> > +             compatible = "regulator-fixed";
> > +
> > +             regulator-name = "vph_pwr";
> > +             regulator-min-microvolt = <3700000>;
> > +             regulator-max-microvolt = <3700000>;
> > +
> > +             regulator-always-on;
> > +             regulator-boot-on;
> > +     };
> > +
> > +     wcn7850-pmu {
> > +             compatible = "qcom,wcn7850-pmu";
> > +
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&wlan_en>, <&bt_default>;
>
> property-n
> property-names
>
> please
>

Ack

> [...]
>
> > +&i2c_hub_0 {
> > +     clock-frequency = <400000>;
> > +
> > +     status = "okay";
> > +
> > +     /* sc8547-charger-secondary@6F */
> > +};
> > +
> > +&i2c_hub_2 {
> > +     clock-frequency = <400000>;
> > +
> > +     status = "okay";
> > +
> > +     /* sc8547-charger-primary@6F */
> > +};
> > +
> > +&i2c_hub_3 {
> > +     status = "okay";
> > +
> > +     /* pencil-wireless-charger-cps8601@41 */
> > +};
> > +
> > +&i2c_hub_4 {
> > +     clock-frequency = <400000>;
> > +
> > +     status = "okay";
> > +
> > +     /* awinic,aw88261_smartpa @34,35,37 */
>
> We have drivers for these!
>
> sound/soc/codecs/aw88261.c
>

I noticed that. But I have not looked into the sound yet. I may add
the nodes after test. BTW the mainline one is quite simple compared
to the downstream, doubting if it is really working
https://github.com/OnePlusOSS/android_kernel_modules_and_devicetree_oneplus_sm8650/tree/oneplus/sm8650_v_15.0.0_pad_pro/vendor/oplus/kernel/audio/codecs/aw882xx

> > +};
> > +
> > +&i2c_hub_7 {
> > +     clock-frequency = <400000>;
> > +
> > +     status = "okay";
> > +
> > +     /* awinic,aw88261_smartpa @34,35,37 */
> > +};
> > +
> > +&i2c2 {
> > +     status = "okay";
> > +
> > +     /* secondary kinetic,ktz8866@11 */
>
> You can describe it, the driver sets some nonzero default brightness
>

But the backlight framework won't index them, which causes sysfs
collision when the second instance is registering.

Best wishes,
Pengyu

