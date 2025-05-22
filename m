Return-Path: <linux-arm-msm+bounces-59032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47239AC0961
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 12:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1E9017B51D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 10:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D535288CA1;
	Thu, 22 May 2025 10:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjYSAFc+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374BD28851A;
	Thu, 22 May 2025 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908373; cv=none; b=VvhMBbGdSRaDvXc2cdhu+PqaWJqozZvD6QYH0datmcQliMmh45IzAXVUV8IMVcfWwwhPe1naV4pmtQbbb//tm0zItwXwfRtq5VqLet3NyulTviz4U8w9Re1KB3ZUMNzWxzOq+FywQpamVn18PCjltA3wUaA8k2KHR3CSIJxfhTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908373; c=relaxed/simple;
	bh=ChSZSu7hmIuT7effoaPAWyOvfP3O7T3z0s6eqm+Yze0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SGw6E2osore00jDi9ApV09RXEGGkQPCWOGvFTSJ3syCVei1t9ZGsWBI/2xwDg8332zms2wV6uCZkX7jkMkd/SVbOX5HP7cQHluBee69/SpxFf1LA3OvD9GoqJliUZPj19jvnbsOezznnL43VaT0YGTRw4rn/JmtlVrTOfxoM+xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjYSAFc+; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-742c46611b6so6271424b3a.1;
        Thu, 22 May 2025 03:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747908371; x=1748513171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQDwXIeyZllCDvqZjDm6jpgTiDgSBksJI+A8OE2se5o=;
        b=GjYSAFc+UZo6tOk8cbbTtCKHbgKtH0r9LmBiWcNvgklo/MMSlBKOTM8hv2QdqbTRGv
         UOsqBc/8vNT9V3lRBmAhA+9L/ox+xyiQ+UKgGef+imHAdCj9nyYeD+AZcVBjcVEYu58O
         yNzTUd+lzfylCyJvI0+5Lfod08tGofXAE1UL57iyXbvPRxImmyciGLykmHfLiA+mLl8d
         V7e9tF2z78S8qrRkjXhovt7QcW8M293e37ScXx8tfFCLe1RXTtMqBYYlb1PbFVdjw2fR
         RhEDLia3jNBCrqw9WRgqijqagfsXoOh02zvvWdQuyl0aC0xmP8dmXVOqpmeZhiRpUMCX
         ZpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747908371; x=1748513171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQDwXIeyZllCDvqZjDm6jpgTiDgSBksJI+A8OE2se5o=;
        b=Mph3rwI94WTAke8wcTvgQ5bmTatjQM43EkxdUk/q5bXQNWFFDPMWqnH+kbBOVRSVcV
         wtUHlPMhJn2HFFgZNgR5p5TPQ1hzgrxiwJQcO5/rJh4ZZGqCFNZiREIu7qEEwBFuyR6J
         suoStiwS04hjEeZz67nswhviDafo4nR6uX1GFSQD71E1k6wTMkmmbDMnPi3MRVHfa1ND
         pEe3NSsefQ0IrNbuGsglu+fP33865nkIwMiU0pW8yrRdAxnWSDjU11Zog3bfsBWBiTKh
         hTSt6g6/uMGDolqzVwZ7KUk2n8UnoypQw8O8LVSlwK7rIfbK86DE57pi8OmJYOOnKaZl
         GlTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMaDC9sKk4AzoNWl7eeUGsRrAOym2omYhT6e1xsaT9HkWWOuR7PWV2wmtx8CujfGJpKFNgVx410m9v@vger.kernel.org, AJvYcCW6boSxdZWfkpd20woLG0deA7BUWNwq6K/UXDLepnNpPoP2rm2Rpu9HNvUzlQWZITmLvpy/kP6fz+GdUKRk@vger.kernel.org, AJvYcCWjU4pI1IzCkmsmcLasa1tiqB4x2xpIM2FG0liDTOTKG92AA7MupgHajVXEfIdihAnEvxsmQNEBEPb2vaUoYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRWNZz0Yqwrc4j28mdIzIMluY5yvxWjna6N2k9lessysVHG3wH
	5O8X+UQTcmM8GOX25h/iBtBNvHktwaRsj+7jbwhiXfpPo1KYFh6gnx41
X-Gm-Gg: ASbGncsqE1WdeP3E1uGd9WPFLLIoljVxfkP7liOjbG66AGRbT21R91nePWR6lvjBmY/
	HNjd2SOhU+cOBq9i2xb0aAoWoRW6E6zTiUdbSozhW1ZK8z4eJ1N44hrsChh/20CO7tCCj84tFe+
	tHX54VH6at4kNkMWmBysWVQVInPCiILxazz5eCOnA8IFByoJb42IVG2JXmuzoDqRYQN2EtS+joN
	Cq+pqJKfpEV6NZeAwmRT7R3jEpPNuvyRs8Bq4KDDmIEw1WzEscG1qcq3Pj5w/lWHKWYvK5U+2bM
	iVS9TpP0LnZSWyk8XTA0M+9/BS6pxgqcUtqNXua3zi7bi7xmbw==
X-Google-Smtp-Source: AGHT+IFp5E/M6ee6WS/dW7TR2m3N73IUBx2OG6ikeo265Pnb0nvBVnRojA/WpBa5iCi45szOmeU6KA==
X-Received: by 2002:a05:6a20:9c97:b0:1f5:5614:18d3 with SMTP id adf61e73a8af0-216fb192731mr37651346637.8.1747908371349;
        Thu, 22 May 2025 03:06:11 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a986d8d7sm11237888b3a.130.2025.05.22.03.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 03:06:10 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: neil.armstrong@linaro.org
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
Date: Thu, 22 May 2025 18:05:53 +0800
Message-ID: <20250522100605.914443-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <11329f37-e410-4912-84cc-d5bcc01e6715@linaro.org>
References: <11329f37-e410-4912-84cc-d5bcc01e6715@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, May 21, 2025 at 8:49 PM <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 20/05/2025 18:42, Pengyu Luo wrote:
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
>
> Are you sure the QMP PHY and the dwc3 probes ? if one is missing, UCSI PPM init will timeout because it doesn't find the connectors muxes & otg devices.
>

I am pretty sure.
ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: PPM init failed, stop trying

> >
> > [1]: The panel is a dual-DSI, dual-DSC display that requires setting
> >       'slice_per_pkt = 2' in the DPU configuration. The panel driver
> >       will be submitted separately later.
> > [2]: Touchscreen/stylus driver available at:
> >       https://github.com/OnePlusOSS/android_kernel_modules_and_devicetree_oneplus_sm8650/blob/oneplus/sm8650_v_15.0.0_pad_pro/vendor/oplus/kernel/touchpanel/oplus_touchscreen_v2/Novatek/NT36532_noflash/nvt_drivers_nt36532_noflash.c
> >       The downstream driver has been ported and tested locally, but
> >       requires cleanup, it may be submitted separately later.
> >
> > To test this device tree, follow these minimal steps:
> >
> > 1. Build the kernel. Ensure that all `compatible` strings used in
> > this device tree (or any included dtsi files) have corresponding
> > drivers enabled in the kernel configuration.
> >
> > 2. Creating boot image
> >
> > Merge the kernel and device tree blob:
> >
> > cat arch/arm64/boot/Image.gz arch/arm64/boot/dts/qcom/sm8650-oneplus-\
> > caihong.dtb > kernel-dtb
> >
> > Then create a boot.img:
> >
> > mkbootimg \
> > --base 0x00000000 \
> > --kernel_offset 0x00008000 \
> > --ramdisk_offset 0x01000000 \
> > --second_offset 0x00f00000 \
> > --tags_offset 0x00000100 \
> > --pagesize 4096 \
> > --header_version 4 \
> > --kernel kernel-dtb \
> > --ramdisk some_ramdisk \
> > --cmdline "some comeline" \
> > -o mainline-boot.img
>
> Isn't image version 2 working ?
>

Yes, '--header_version 2' works, I followed the version of stock boot
image. If there is a rule to follow?

> >
> > 3. Flashing the boot image
> >
> > fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img
> > fastboot erase dtbo
> > fastboot flash boot mainline-boot.img
> >
> > See also https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=39c5963
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> >   .../boot/dts/qcom/sm8650-oneplus-caihong.dts  | 960 ++++++++++++++++++
> >   1 file changed, 960 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/qcom/sm8650-oneplus-caihong.dts
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8650-oneplus-caihong.dts b/arch/arm64/boot/dts/qcom/sm8650-oneplus-caihong.dts
> > new file mode 100644
> > index 0000000000..93aed47e10
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sm8650-oneplus-caihong.dts
> > @@ -0,0 +1,960 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Based on Qualcomm Reference Device DeviceTree
> > + *
> > + * Copyright (c) 2023, Linaro Limited
> > + * Copyright (c) 2025, Pengyu Luo <mitltlatltl@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > +#include "sm8650.dtsi"
> > +#include "pm8550.dtsi"
> > +#include "pm8550b.dtsi"
> > +#define PMK8550VE_SID 8
> > +#include "pm8550ve.dtsi"
> > +#include "pm8550vs.dtsi"
> > +#include "pmk8550.dtsi"
> > +
> > +/delete-node/ &adspslpi_mem;
> > +/delete-node/ &hwfence_shbuf;
> > +
> > +/* No Modem */
> > +/delete-node/ &mpss_mem;
> > +/delete-node/ &q6_mpss_dtb_mem;
> > +/delete-node/ &mpss_dsm_mem;
> > +/delete-node/ &mpss_dsm_mem_2;
> > +/delete-node/ &qlink_logging_mem;
> > +/delete-node/ &remoteproc_mpss;
> > +
> > +/* Unused now, and reusable, taking 144 MiB back */
> > +/delete-node/ &trust_ui_vm_mem;
> > +/delete-node/ &oem_vm_mem;
> > +/delete-node/ &qdss_mem;
>
> Are you sure QTEE won't use this ?
>

I am not sure, but these two VM nodes are never referred by any device
in the downstream DT. QDSS and coresight things are unnecessary on the
retail devices.

> > +
> > +/ {
> > +     model = "Oneplus Pad Pro";
> > +     compatible = "oneplus,caihong", "qcom,sm8650";
> > +     chassis-type = "tablet";
> > +
> > +     aliases {
> > +             serial0 = &uart14;
> > +     };
> > +
> > +     bl_avdd_5p9: bl-avdd-regulator {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "bl_avdd_5p9";
> > +             regulator-min-microvolt = <5900000>;
> > +             regulator-max-microvolt = <5900000>;
> > +             gpio = <&tlmm 90 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> > +     bl_avee_5p9: bl-avee-regulator {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "bl_avee_5p9";
> > +             regulator-min-microvolt = <5900000>;
> > +             regulator-max-microvolt = <5900000>;
> > +             gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> > +     gpio-keys {
> > +             compatible = "gpio-keys";
> > +
> > +             pinctrl-0 = <&volume_up_n>;
> > +             pinctrl-names = "default";
> > +
> > +             key-volume-up {
> > +                     label = "Volume Up";
> > +                     linux,code = <KEY_VOLUMEDOWN>;
> > +                     gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
> > +                     debounce-interval = <15>;
> > +                     linux,can-disable;
> > +                     wakeup-source;
> > +             };
> > +     };
> > +
> > +     pmic-glink {
> > +             compatible = "qcom,sm8650-pmic-glink",
> > +                          "qcom,sm8550-pmic-glink",
> > +                          "qcom,pmic-glink";
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +             orientation-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;
> > +
> > +             connector@0 {
> > +                     compatible = "usb-c-connector";
> > +                     reg = <0>;
> > +
> > +                     power-role = "dual";
> > +                     data-role = "dual";
> > +
> > +                     ports {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             port@0 {
> > +                                     reg = <0>;
> > +
> > +                                     pmic_glink_hs_in: endpoint {
> > +                                             remote-endpoint = <&usb_1_dwc3_hs>;
> > +                                     };
> > +                             };
> > +
> > +                             port@1 {
> > +                                     reg = <1>;
> > +
> > +                                     pmic_glink_ss_in: endpoint {
> > +                                             remote-endpoint = <&usb_dp_qmpphy_out>;
> > +                                     };
> > +                             };
>
> No Altmode display ? no SBU mux nor redrivers ?
>

There should be a wcd939x_i2c@e, it will be added after I figure out
sound things. Actually, I added it locally, it does not work. Since
its name is wcd939x, it made me feel it is for usb dac handling only.
I never checked it carefully. But you mentioned this, I just checked
downstream bindings, it says

QTI WCD9395 Device

This device is used for switching orientation of USB-C analog
and for display. It uses I2C communication to set the registers
to configure the switches inside the WCD9395 chip to change
orientation and also to set SBU1/SBU2 connections of USB-C.

Thanks. I will check it again.

Best wishes,
Pengyu

