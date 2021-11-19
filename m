Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B5D4568A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 04:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbhKSDep (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 22:34:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232417AbhKSDen (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 22:34:43 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F248BC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 19:31:42 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id o4so19049273oia.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 19:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jaCx9Td/fmXqtX4FzW9/z+Xdum8GaYtuAsZ2KaSjB2o=;
        b=XUU0KyloJCmswvhQ+besLtw4y9SDwq1iHY0gG1Mv1pq9khL2YH+rZJDEjp89qWD01m
         cGSuYOU+nzou8m97AnnMvLXszELXk+h84uSEdG23hUyBkMutNJIf/THGnfE9O7W94DxF
         2NQPVNyNI2sWRbFxwM9JE4B282Q06i8EGw2/Q1j8XJRwgddA8Z/mssVcyF1zRrswRii4
         U5yJDzUrKhr/N/UXvmnsrNhm/PutKmgB4Sdyst45cuXb2sUU2mPnmDE8kooZtGr0320U
         DcGG6rhcOsCJKpwObbW0FvLC/90zF8/7k37Ly5V2PuYFYKVCyQ+n5zYQju3+1q9XdncJ
         eOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jaCx9Td/fmXqtX4FzW9/z+Xdum8GaYtuAsZ2KaSjB2o=;
        b=cMVLGb3GJ7zcp1gosMhuWxyMqcgvsN4V7wzH51ACavkBoHK7lD4dR9AvbtWsGG25CR
         SIoxC6adZCoUI5cefFxCtU4fZzBUKE2nb2p50vLdvUtmhmn9wVqHm8aPDW+w2LDUhRYt
         jx1WayDU4/JdGgJ2lyhCcmrL3cNyboUJxd0vMa3j5jmHysw4QLyGzUeEjh4KHcktBagz
         fCSpxIX+8u5bLf6wwzhvduMDVdQ2a+hNYUTw8x6myOxPJupyVU81vAj5ImSyTyxQk4jh
         Q3hdrifmmGH7dTq2AbiNpd/IevkisDProE4yiyVJVNCI8JdLi8/i/nUed5Q6akKwz+hy
         HI5g==
X-Gm-Message-State: AOAM5323BnrRmBSYEpxDBw0nTjafRnUDDumwURhpAk77NbbTXO9MG7j+
        uCjYGWqugNqQCappXsLgA3j+Vg==
X-Google-Smtp-Source: ABdhPJwzJ/4BCC0YyO/VdrgYWBwaLNxgzIa++9JZtwC7de3z/237BPdUBynV2vEMJzZcoZPvHAUo3g==
X-Received: by 2002:a54:4102:: with SMTP id l2mr2019891oic.87.1637292702190;
        Thu, 18 Nov 2021 19:31:42 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o26sm328445otj.14.2021.11.18.19.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 19:31:41 -0800 (PST)
Date:   Thu, 18 Nov 2021 21:31:39 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Julian Ribbeck <julian.ribbeck@gmx.de>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH] arm64: dts: qcom: Add device tree for Samsung J5 2015
 (samsung-j5)
Message-ID: <YZcam/pnh0CBjMIx@builder.lan>
References: <20211116200734.73920-1-julian.ribbeck@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116200734.73920-1-julian.ribbeck@gmx.de>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 16 Nov 14:07 CST 2021, Julian Ribbeck wrote:

> Samsung J5 2015 is a MSM8916 based Smartphone. It is similar to some of the
> other MSM8916 devices, especially the Samsung ones.
> 
> With this patch initial support for the following is added:
>   - eMMC/SD card
>   - Buttons
>   - USB (although no suiting MUIC driver currently)
>   - UART (untested for lack of equipment)
>   - WiFi/Bluetooth (WCNSS)
> 
> It is worth noting that Samsung J5 with MSM8916 exists in different
> generations (e.g Samsung J5 2015 and Samsung J5 2016) which each have
> different models (e.g. samsung-j5nlte, samsung-j5xnlte, etc). This patch
> is only regarding the 2015 generation, but should work with all of it's
> models, as far as we could test.
> 
> Co-developed-by: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Julian Ribbeck <julian.ribbeck@gmx.de>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/msm8916-samsung-j5.dts      | 209 ++++++++++++++++++
>  2 files changed, 210 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6b816eb33309..08bfccb0daeb 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8910.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-j5.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-serranove.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
> new file mode 100644
> index 000000000000..687bea438a57
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: GPL-2.0-only

If you authored this, could we please get it under BSD license?

> +
> +/dts-v1/;
> +
> +#include "msm8916-pm8916.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "Samsung Galaxy J5 (2015)";
> +	compatible = "samsung,j5", "qcom,msm8916";
> +	chassis-type = "handset";
> +
> +	aliases {
> +		serial0 = &blsp1_uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +
> +	reserved-memory {
> +		/* Additional memory used by Samsung firmware modifications */
> +		tz-apps@85500000 {
> +			reg = <0x0 0x85500000 0x0 0xb00000>;
> +			no-map;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys_default>;
> +
> +		label = "GPIO Buttons";
> +
> +		volume-up {
> +			label = "Volume Up";
> +			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +
> +		home-key {
> +			lable = "Home Key";
> +			gpios = <&msmgpio 109 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_HOMEPAGE>;
> +		};
> +	};
> +};
> +
> +&blsp1_uart2 {

Can you please sort these nodes alphabetically?

Regards,
Bjorn

> +	status = "okay";
> +};
> +
> +&pm8916_resin {
> +	status = "okay";
> +	linux,code = <KEY_VOLUMEDOWN>;
> +};
> +
> +/* FIXME: Replace with SM5703 MUIC when driver is available */
> +&pm8916_usbin {
> +	status = "okay";
> +};
> +
> +&pronto {
> +	status = "okay";
> +};
> +
> +&sdhc_1 {
> +	status = "okay";
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
> +	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
> +};
> +
> +&sdhc_2 {
> +	status = "okay";
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
> +	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
> +
> +	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
> +};
> +
> +&usb {
> +	status = "okay";
> +	dr_mode = "peripheral";
> +	extcon = <&pm8916_usbin>;
> +};
> +
> +&usb_hs_phy {
> +	extcon = <&pm8916_usbin>;
> +	qcom,init-seq = /bits/ 8 <0x1 0x19 0x2 0x0b>;
> +};
> +
> +&smd_rpm_regulators {
> +	vdd_l1_l2_l3-supply = <&pm8916_s3>;
> +	vdd_l4_l5_l6-supply = <&pm8916_s4>;
> +	vdd_l7-supply = <&pm8916_s4>;
> +
> +	s3 {
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1300000>;
> +	};
> +
> +	s4 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <2100000>;
> +	};
> +
> +	l1 {
> +		regulator-min-microvolt = <1225000>;
> +		regulator-max-microvolt = <1225000>;
> +	};
> +
> +	l2 {
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +	};
> +
> +	l4 {
> +		regulator-min-microvolt = <2050000>;
> +		regulator-max-microvolt = <2050000>;
> +	};
> +
> +	l5 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	l6 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	l7 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	l8 {
> +		regulator-min-microvolt = <2850000>;
> +		regulator-max-microvolt = <2900000>;
> +	};
> +
> +	l9 {
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	l10 {
> +		regulator-min-microvolt = <2700000>;
> +		regulator-max-microvolt = <2800000>;
> +	};
> +
> +	l11 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <2950000>;
> +		regulator-allow-set-load;
> +		regulator-system-load = <200000>;
> +	};
> +
> +	l12 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <2950000>;
> +	};
> +
> +	l13 {
> +		regulator-min-microvolt = <3075000>;
> +		regulator-max-microvolt = <3075000>;
> +	};
> +
> +	l14 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	l15 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	l16 {
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	l17 {
> +		regulator-min-microvolt = <3000000>;
> +		regulator-max-microvolt = <3000000>;
> +	};
> +
> +	l18 {
> +		regulator-min-microvolt = <2700000>;
> +		regulator-max-microvolt = <2700000>;
> +	};
> +};
> +
> +&msmgpio {
> +	gpio_keys_default: gpio-keys-default {
> +		pins = "gpio107", "gpio109";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +};
> --
> 2.33.1
> 
