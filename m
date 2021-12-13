Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 534C9473292
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 17:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237619AbhLMQ6D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 11:58:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237233AbhLMQ6C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 11:58:02 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D8E8C061748
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 08:58:02 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id be32so23904004oib.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 08:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J+nedtdcLR++WJxBvny7mXCrzpGMYhJDkeejVaXULEs=;
        b=kSefkk75L4mRSQ+0lX86dDfDuAUoaptSeRStEhIEJhWcdn/HEw9bBJrlrPDni8ADmI
         OhTR6+Mz98vUP2Gc74kQ2JpLBSjMJiIPY1ehwnly6eYNT5ikKIq6K5Pb7Ejh+bKB6rtg
         N9dFa6aXsBPhhGVMoJiSzDFq379Urb1mYd5tXOiUmgRZ2T8CJ5Z+3ovadeIWF4VYO7JO
         4VcfJCPpnfUFLUenavOV90spizqDoC9h61gJjSUEPASfbMoMOtTSnETjvHvNKMTk0Cve
         PcX0E8dBlFSOJrE16SciOBh3EvBNrixSMHWBAi7g4QDQJabMqCcFB1mA8TRf2Q0+0mny
         iObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J+nedtdcLR++WJxBvny7mXCrzpGMYhJDkeejVaXULEs=;
        b=FDvzwbz8YhKsUEPtUT210Dj9Lp38dFMUfqR0tZ1lzsnDJC5UCXmKAIL5RPJZ90eWA8
         7JTjd2WHfp+moLxJBV9T3Hxx/EPt77HhRaNhS0BVh3JyUlXWGD91B28NQP8Z2HzOpBww
         bj3vn2LCNDN6U73JfjyLzX8XTxIrlHhS+cuDmPMoiJsepwHmsLyFHPEB6na775tjDpEw
         AQ24R7LiFismrZe7ZaWN8d8Lq77VuVH4yiCiqJr60KMbmQ2tZ4vxZgxpO8TH6AIb87sr
         lxDgJVXyc4tTrjEnOTniZe08tAU2t4NQXOXpA8W3DpgwQsBKY6oOJxF4UM5OZLl83LQR
         WBCQ==
X-Gm-Message-State: AOAM530wM4x6gqHmKSALQYRWe7ZqKXKIYJu9FfuNMMnLZqQ6b4UIKKLZ
        Wacouani0fWNiRGDBYEqkDjVmw==
X-Google-Smtp-Source: ABdhPJxkXq2zp/Uf5aLQMyip7F8P1T/T4CvcJySJDm6dnu7SMsac71xEHAiF+bnktV3vqW7DWFZqLw==
X-Received: by 2002:a05:6808:682:: with SMTP id k2mr29770741oig.63.1639414681547;
        Mon, 13 Dec 2021 08:58:01 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 186sm2678813oig.28.2021.12.13.08.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 08:58:01 -0800 (PST)
Date:   Mon, 13 Dec 2021 10:57:56 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Julian Ribbeck <julian.ribbeck@gmx.de>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] arm64: dts: qcom: Add device tree for Samsung J5 2015
 (samsung-j5)
Message-ID: <Ybd7lGatbtJMxwEw@builder.lan>
References: <20211116200734.73920-1-julian.ribbeck@gmx.de>
 <YZcam/pnh0CBjMIx@builder.lan>
 <YZd0zzzuxgk2+x2b@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZd0zzzuxgk2+x2b@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 19 Nov 03:56 CST 2021, Stephan Gerhold wrote:

> Hi Bjorn,
> 
> Thanks a lot for your review!
> 
> On Thu, Nov 18, 2021 at 09:31:39PM -0600, Bjorn Andersson wrote:
> > On Tue 16 Nov 14:07 CST 2021, Julian Ribbeck wrote:
> > 
> > > Samsung J5 2015 is a MSM8916 based Smartphone. It is similar to some of the
> > > other MSM8916 devices, especially the Samsung ones.
> > > 
> > > With this patch initial support for the following is added:
> > >   - eMMC/SD card
> > >   - Buttons
> > >   - USB (although no suiting MUIC driver currently)
> > >   - UART (untested for lack of equipment)
> > >   - WiFi/Bluetooth (WCNSS)
> > > 
> > > It is worth noting that Samsung J5 with MSM8916 exists in different
> > > generations (e.g Samsung J5 2015 and Samsung J5 2016) which each have
> > > different models (e.g. samsung-j5nlte, samsung-j5xnlte, etc). This patch
> > > is only regarding the 2015 generation, but should work with all of it's
> > > models, as far as we could test.
> > > 
> > > Co-developed-by: Stephan Gerhold <stephan@gerhold.net>
> > > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > > Signed-off-by: Julian Ribbeck <julian.ribbeck@gmx.de>
> > > ---
> > >  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> > >  .../boot/dts/qcom/msm8916-samsung-j5.dts      | 209 ++++++++++++++++++
> > >  2 files changed, 210 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > index 6b816eb33309..08bfccb0daeb 100644
> > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > @@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8910.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
> > > +dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-j5.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-serranove.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
> > > new file mode 100644
> > > index 000000000000..687bea438a57
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
> > > @@ -0,0 +1,209 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > 
> > If you authored this, could we please get it under BSD license?
> > 
> 
> I'm afraid the same problem applies to all MSM8916-related device trees:
> https://lore.kernel.org/linux-arm-msm/YMIznk4scPv1qOzP@gerhold.net/
> 
> Given the similarities between the devices it's easiest to take portions
> from existing device trees and just change some properties. But this
> means that many people were involved and I'm not sure if it is
> appropriate to apply a different license without asking all of them.
> 
> It's an unfortunate situation that will likely also apply to more
> MSM8916 device trees submitted in the future. I hope it's still
> acceptable even with the GPL-2.0-only license. :)
> 

Unfortunate indeed, but now I've asked at least...

> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "msm8916-pm8916.dtsi"
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +
> > > +/ {
> > > +	model = "Samsung Galaxy J5 (2015)";
> > > +	compatible = "samsung,j5", "qcom,msm8916";
> > > +	chassis-type = "handset";
> > > +
> > > +	aliases {
> > > +		serial0 = &blsp1_uart2;
> > > +	};
> > > +
> > > +	chosen {
> > > +		stdout-path = "serial0";
> > > +	};
> > > +
> > > +	reserved-memory {
> > > +		/* Additional memory used by Samsung firmware modifications */
> > > +		tz-apps@85500000 {
> > > +			reg = <0x0 0x85500000 0x0 0xb00000>;
> > > +			no-map;
> > > +		};
> > > +	};
> > > +
> > > +	gpio-keys {
> > > +		compatible = "gpio-keys";
> > > +
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&gpio_keys_default>;
> > > +
> > > +		label = "GPIO Buttons";
> > > +
> > > +		volume-up {
> > > +			label = "Volume Up";
> > > +			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
> > > +			linux,code = <KEY_VOLUMEUP>;
> > > +		};
> > > +
> > > +		home-key {
> > > +			lable = "Home Key";
> > > +			gpios = <&msmgpio 109 GPIO_ACTIVE_LOW>;
> > > +			linux,code = <KEY_HOMEPAGE>;
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&blsp1_uart2 {
> > 
> > Can you please sort these nodes alphabetically?
> > 
> 
> It looks mostly alphabetically ordered to me, could you clarify which
> nodes you are referring to exactly?
> 
> The exceptions are &smd_rpm_regulators and &msmgpio, which are explicitly
> at the end of the file (consistent with all other MSM8916 device trees).
> I think it's easier to focus on the main interesting part of the device
> tree that way (the device definitions). If you prefer to have strict
> alphebtical order I can prepare a bulk patch that changes the order in
> all the existing MSM8916 device trees. The most important thing for me
> is that they are consistent.
> 

You're right, I had forgotten that we put the &smd_rpm_regulators at the
end on these related devices. Should probably make this consistent
across all platforms, but let's merge this for now.

Thanks,
Bjorn

> Thanks,
> Stephan
> 
> > 
> > > +	status = "okay";
> > > +};
> > > +
> > > +&pm8916_resin {
> > > +	status = "okay";
> > > +	linux,code = <KEY_VOLUMEDOWN>;
> > > +};
> > > +
> > > +/* FIXME: Replace with SM5703 MUIC when driver is available */
> > > +&pm8916_usbin {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&pronto {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&sdhc_1 {
> > > +	status = "okay";
> > > +
> > > +	pinctrl-names = "default", "sleep";
> > > +	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
> > > +	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
> > > +};
> > > +
> > > +&sdhc_2 {
> > > +	status = "okay";
> > > +
> > > +	pinctrl-names = "default", "sleep";
> > > +	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
> > > +	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
> > > +
> > > +	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
> > > +};
> > > +
> > > +&usb {
> > > +	status = "okay";
> > > +	dr_mode = "peripheral";
> > > +	extcon = <&pm8916_usbin>;
> > > +};
> > > +
> > > +&usb_hs_phy {
> > > +	extcon = <&pm8916_usbin>;
> > > +	qcom,init-seq = /bits/ 8 <0x1 0x19 0x2 0x0b>;
> > > +};
> > > +
> > > +&smd_rpm_regulators {
> > > +	vdd_l1_l2_l3-supply = <&pm8916_s3>;
> > > +	vdd_l4_l5_l6-supply = <&pm8916_s4>;
> > > +	vdd_l7-supply = <&pm8916_s4>;
> > > +
> > > +	s3 {
> > > +		regulator-min-microvolt = <1200000>;
> > > +		regulator-max-microvolt = <1300000>;
> > > +	};
> > > +
> > > +	s4 {
> > > +		regulator-min-microvolt = <1800000>;
> > > +		regulator-max-microvolt = <2100000>;
> > > +	};
> > > +
> > > +	l1 {
> > > +		regulator-min-microvolt = <1225000>;
> > > +		regulator-max-microvolt = <1225000>;
> > > +	};
> > > +
> > > +	l2 {
> > > +		regulator-min-microvolt = <1200000>;
> > > +		regulator-max-microvolt = <1200000>;
> > > +	};
> > > +
> > > +	l4 {
> > > +		regulator-min-microvolt = <2050000>;
> > > +		regulator-max-microvolt = <2050000>;
> > > +	};
> > > +
> > > +	l5 {
> > > +		regulator-min-microvolt = <1800000>;
> > > +		regulator-max-microvolt = <1800000>;
> > > +	};
> > > +
> > > +	l6 {
> > > +		regulator-min-microvolt = <1800000>;
> > > +		regulator-max-microvolt = <1800000>;
> > > +	};
> > > +
> > > +	l7 {
> > > +		regulator-min-microvolt = <1800000>;
> > > +		regulator-max-microvolt = <1800000>;
> > > +	};
> > > +
> > > +	l8 {
> > > +		regulator-min-microvolt = <2850000>;
> > > +		regulator-max-microvolt = <2900000>;
> > > +	};
> > > +
> > > +	l9 {
> > > +		regulator-min-microvolt = <3300000>;
> > > +		regulator-max-microvolt = <3300000>;
> > > +	};
> > > +
> > > +	l10 {
> > > +		regulator-min-microvolt = <2700000>;
> > > +		regulator-max-microvolt = <2800000>;
> > > +	};
> > > +
> > > +	l11 {
> > > +		regulator-min-microvolt = <1800000>;
> > > +		regulator-max-microvolt = <2950000>;
> > > +		regulator-allow-set-load;
> > > +		regulator-system-load = <200000>;
> > > +	};
> > > +
> > > +	l12 {
> > > +		regulator-min-microvolt = <1800000>;
> > > +		regulator-max-microvolt = <2950000>;
> > > +	};
> > > +
> > > +	l13 {
> > > +		regulator-min-microvolt = <3075000>;
> > > +		regulator-max-microvolt = <3075000>;
> > > +	};
> > > +
> > > +	l14 {
> > > +		regulator-min-microvolt = <1800000>;
> > > +		regulator-max-microvolt = <3300000>;
> > > +	};
> > > +
> > > +	l15 {
> > > +		regulator-min-microvolt = <1800000>;
> > > +		regulator-max-microvolt = <3300000>;
> > > +	};
> > > +
> > > +	l16 {
> > > +		regulator-min-microvolt = <1800000>;
> > > +		regulator-max-microvolt = <3300000>;
> > > +	};
> > > +
> > > +	l17 {
> > > +		regulator-min-microvolt = <3000000>;
> > > +		regulator-max-microvolt = <3000000>;
> > > +	};
> > > +
> > > +	l18 {
> > > +		regulator-min-microvolt = <2700000>;
> > > +		regulator-max-microvolt = <2700000>;
> > > +	};
> > > +};
> > > +
> > > +&msmgpio {
> > > +	gpio_keys_default: gpio-keys-default {
> > > +		pins = "gpio107", "gpio109";
> > > +		function = "gpio";
> > > +
> > > +		drive-strength = <2>;
> > > +		bias-pull-up;
> > > +	};
> > > +};
> > > --
> > > 2.33.1
> > > 
