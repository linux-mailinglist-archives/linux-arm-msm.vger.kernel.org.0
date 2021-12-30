Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF6C248203B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Dec 2021 21:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242028AbhL3UUp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Dec 2021 15:20:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240824AbhL3UUo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Dec 2021 15:20:44 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F760C061574;
        Thu, 30 Dec 2021 12:20:44 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id l5so67308674edj.13;
        Thu, 30 Dec 2021 12:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=qwNpxhda3s98GO+0vdfXMwN46RfAkNWmRpAUFZnAvNo=;
        b=qqWmT+MO4zLNBQ4J9TaRAZOfhh6e1wv/sB7ey5b2isq20ZwmfSmjy4DWsNR6oPTwax
         Vkr9MYvT1u5ooOBeOCzV0J4uYr0tbgGj9PuB3vG00kbJbEDvZl53YWO1FpowoXX+U2P0
         2ZjqNGXIBaADuzmQyO3wtEyqAelnA0lNlL2Nqn5YLEl3C0kUq6dsEZMwX50vV7YXVcVp
         A/5oV5SX1eCQLqsACfxbm6w8ZE0nbupD1v6z4apdg1dNSwUO+iyVy9Rlw+3BP1qgimH0
         bvV8Mpp6eVNzcbO6C2Du6IyDNQDSxdyjvKpRAE5nWiSEYoK5I4lufLs3IZRAVBoWR6/m
         Yi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=qwNpxhda3s98GO+0vdfXMwN46RfAkNWmRpAUFZnAvNo=;
        b=HEfOmsBS7LI459qQO+RxM1AcJs7lbqzPWIUsee7HnbxIIOhTsogH1Gt7feUBGKQrlF
         xWG197zgbe5PmtxzPIGoFiHovcjABmk0KaptKwn8ltgqi7lhjF6RJ2RDEGyo/ngMDmVa
         z7dLJUYNjeK0K9OLp1zB7ttqUlLjJW9sXhZIHN8Lwseao2QTAbmzbuqLdrwmngw5Ewr2
         lVK0srTIB97m/FI+ks5DbJsiXZU0kkWz1y8XOaqOL7RbJ0z+pk0stAD7yNEJTCFbK2/C
         aUUYcAjWTIkRj/YRCMW9ZtI0kD7dUET/4uRkytZbMv7JZWRQF4Ens0q/5I4IgNjc/8bp
         cDSw==
X-Gm-Message-State: AOAM533gFEWO7kp2zfJFdQyFHhirsAGiFEpdQ6nLreW23s/DAfmJM9j+
        LTq0KUyuLnhXJ44qcv7e6wePk0TD+DE=
X-Google-Smtp-Source: ABdhPJyVrwN6JAyEx7FjNd6ljAkOtPPzhrQaDeyqPCq4lXr6d1q4KKOKALjdVBip97qWfri+R+mxxw==
X-Received: by 2002:a17:907:248c:: with SMTP id zg12mr26260242ejb.368.1640895642696;
        Thu, 30 Dec 2021 12:20:42 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id f6sm1837111ejf.69.2021.12.30.12.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 12:20:42 -0800 (PST)
Date:   Thu, 30 Dec 2021 21:20:39 +0100
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        newbyte@disroot.org, linux-mmc@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [RFC PATCH 1/1] arm64: dts: qcom: msm8994-angler: Add sdhc{1,2}
 definitions
Message-ID: <Yc4Ul4XmD+PPGGLv@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20211105004336.29913-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105004336.29913-1-petr.vorel@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[ Cc linux-mmc, Ulf, Andy and Bjorn ]

Hi,

I wonder what is the reason for getting -EPROBE_DEFER.
I suppose mmc sdhci-msm.c driver supports also msm8994 angler and sdhc dts
section is just improperly configured. Any hint what could be wrong?

BTW Documentation/devicetree/bindings/mmc/sdhci-msm.txt in mainline is quite
different from downstream, e.g. there should be just pinctrl-0 (code copied from
downstream in msm8994.dtsi has also "sleep"). Is it mainline doc outdated?
Because at least msm8994-msft-lumia-octagon.dtsi is using sdhc with also
pinctrl-1.

Thanks for any hint.

Kind regards,
Petr

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,


> this is should *not* be applied as it does not working (yet).

> I'm trying to enable sdhc for msm8994 angler, but setup is obviously
> wrong as device is not enabled. 

> I get just: sdhci_msm f98a4900.sdhci: Got CD GPIO

> Debugging with printing in the code I see problem in drivers/mmc/host/sdhci-msm.c:

> static int sdhci_msm_probe(struct platform_device *pdev)
> {
> 	...
> 	if (!msm_host->mci_removed) {
> 		msm_host->core_mem = devm_platform_ioremap_resource(pdev, 1);
> 		if (IS_ERR(msm_host->core_mem)) {
> 			ret = PTR_ERR(msm_host->core_mem);
> 			/* vorel: ret == -517 (-EPROBE_DEFER) several times till giving up */
> 			goto clk_disable;
> 		}
> 	}

> Triggered in drivers/mmc/core/regulator.c

> /**
>  * mmc_regulator_get_supply - try to get VMMC and VQMMC regulators for a host
>  * @mmc: the host to regulate
>  *
>  * Returns 0 or errno. errno should be handled, it is either a critical error
>  * or -EPROBE_DEFER. 0 means no critical error but it does not mean all
>  * regulators have been found because they all are optional. If you require
>  * certain regulators, you need to check separately in your driver if they got
>  * populated after calling this function.
>  */
> int mmc_regulator_get_supply(struct mmc_host *mmc)
> {
> 	struct device *dev = mmc_dev(mmc);
> 	int ret;

> 	mmc->supply.vmmc = devm_regulator_get_optional(dev, "vmmc");
> 	mmc->supply.vqmmc = devm_regulator_get_optional(dev, "vqmmc");

> 	if (IS_ERR(mmc->supply.vmmc)) {
> 		if (PTR_ERR(mmc->supply.vmmc) == -EPROBE_DEFER) {
> 			return -EPROBE_DEFER; /* vorel: error here */
> 		}
> 		dev_dbg(dev, "No vmmc regulator found\n");
> 		...

> Obviously it's something wrong with
> sdhc1
> +	vmmc-supply = <&pm8994_l20>;
> +	vqmmc-supply = <&pm8994_s4>;

> and/or sdhc2
> +	vmmc-supply = <&pm8994_l21>;
> +	vqmmc-supply = <&pm8994_l13>;

> Any idea what to check?

> Downstream kernel has msm8994.dtsi [1] (ignoring sdhc_3 which is
> disabled):

> 	sdhc_1: sdhci@f9824900 {
> 		compatible = "qcom,sdhci-msm";
> 		reg = <0xf9824900 0x1a0>, <0xf9824000 0x800>;
> 		reg-names = "hc_mem", "core_mem";

> 		interrupts = <0 123 0>, <0 138 0>;
> 		interrupt-names = "hc_irq", "pwr_irq";

> 		qcom,bus-width = <8>;
> 		qcom,cpu-dma-latency-us = <301 70>;
> 		qcom,cpu-affinity = "affine_cores";
> 		qcom,cpu-affinity-mask = <0x0f 0xf0>;
> 		qcom,wakeup-on-idle;

> 		qcom,msm-bus,name = "sdhc1";
> 		qcom,msm-bus,num-cases = <9>;
> 		qcom,msm-bus,num-paths = <1>;
> 		qcom,msm-bus,vectors-KBps = <78 512 0 0>, /* No vote */
> 			<78 512 1600 3200>,       /* 400 KB/s*/
> 			<78 512 80000 160000>,    /* 20 MB/s */
> 			<78 512 100000 200000>,   /* 25 MB/s */
> 			<78 512 200000 400000>,   /* 50 MB/s */
> 			<78 512 400000 800000>,   /* 100 MB/s */
> 			<78 512 400000 800000>,   /* 200 MB/s */
> 			<78 512 400000 800000>,   /* 400 MB/s */
> 			<78 512 2048000 4096000>; /* Max. bandwidth */
> 		qcom,bus-bw-vectors-bps = <0 400000 20000000 25000000 50000000
> 			100000000 200000000 400000000 4294967295>;

> 		clock-names = "iface_clk", "core_clk";
> 		clocks = <&clock_gcc clk_gcc_sdcc1_ahb_clk>,
> 			 <&clock_gcc clk_gcc_sdcc1_apps_clk>;

> 		status = "disabled";
> 	};

> 	sdhc_2: sdhci@f98a4900 {
> 		compatible = "qcom,sdhci-msm";
> 		reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
> 		reg-names = "hc_mem", "core_mem";

> 		interrupts = <0 125 0>, <0 221 0>;
> 		interrupt-names = "hc_irq", "pwr_irq";

> 		clock-names = "iface_clk", "core_clk";
> 		clocks = <&clock_gcc clk_gcc_sdcc2_ahb_clk>,
> 			 <&clock_gcc clk_gcc_sdcc2_apps_clk>;

> 		qcom,bus-width = <4>;
> 		qcom,cpu-dma-latency-us = <301 70>;
> 		qcom,cpu-affinity = "affine_cores";
> 		qcom,cpu-affinity-mask = <0x0f 0xf0>;
> 		qcom,wakeup-on-idle;

> 		qcom,msm-bus,name = "sdhc2";
> 		qcom,msm-bus,num-cases = <8>;
> 		qcom,msm-bus,num-paths = <1>;
> 		qcom,msm-bus,vectors-KBps = <81 512 0 0>, /* No vote */
> 				<81 512 1600 3200>,    /* 400 KB/s*/
> 				<81 512 80000 160000>, /* 20 MB/s */
> 				<81 512 100000 200000>, /* 25 MB/s */
> 				<81 512 200000 400000>, /* 50 MB/s */
> 				<81 512 400000 800000>, /* 100 MB/s */
> 				<81 512 800000 800000>, /* 200 MB/s */
> 				<81 512 2048000 4096000>; /* Max. bandwidth */
> 		qcom,bus-bw-vectors-bps = <0 400000 20000000 25000000 50000000
> 						100000000 200000000 4294967295>;

> 		status = "disabled";
> 	};

> With specific values for angler in msm8994-mtp.dtsi [2]:

> &sdhc_1 {
> 	vdd-supply = <&pm8994_l20>;
> 	qcom,vdd-always-on;
> 	qcom,vdd-voltage-level = <2950000 2950000>;
> 	qcom,vdd-current-level = <200 570000>;

> 	vdd-io-supply = <&pm8994_s4>;
> 	qcom,vdd-io-always-on;
> 	qcom,vdd-io-voltage-level = <1800000 1800000>;
> 	qcom,vdd-io-current-level = <200 325000>;

> 	pinctrl-names = "active", "sleep";
> 	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on &sdc1_rclk_on>;
> 	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off &sdc1_rclk_off>;

> 	qcom,nonremovable;

> 	qcom,clk-rates = <400000 20000000 25000000 50000000 100000000 192000000 384000000>;
> 	qcom,bus-speed-mode = "HS400_1p8v", "HS200_1p8v", "DDR_1p8v";
> 	status = "ok";
> };

> &sdhc_2 {
> 	vdd-supply = <&pm8994_l21>;
> 	qcom,vdd-voltage-level = <2950000 2950000>;
> 	qcom,vdd-current-level = <200 800000>;

> 	vdd-io-supply = <&pm8994_l13>;
> 	qcom,vdd-io-voltage-level = <1800000 2950000>;
> 	qcom,vdd-io-current-level = <200 22000>;

> 	#address-cells = <0>;
> 	interrupt-parent = <&sdhc_2>;
> 	interrupts = <0 1 2>;
> 	#interrupt-cells = <1>;
> 	interrupt-map-mask = <0xffffffff>;
> 	interrupt-map = <0 &intc 0 125 0
> 			1 &intc 0 221 0
> 			2 &pm8994_gpios 8 0x3>;
> 	interrupt-names = "hc_irq", "pwr_irq", "status_irq";
> 	cd-gpios = <&pm8994_gpios 8 0x1>;

> 	pinctrl-names = "active", "sleep";
> 	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on>;
> 	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;

> 	qcom,clk-rates = <400000 20000000 25000000 50000000 100000000 200000000>;
> 	qcom,bus-speed-mode = "SDR12", "SDR25", "SDR50", "DDR50", "SDR104";
> 	status = "ok";
> };

> Current mainline msm8994.dtsi defines sdhc* as:

> 		sdhc1: sdhci@f9824900 {
> 			compatible = "qcom,sdhci-msm-v4";
> 			reg = <0xf9824900 0x1a0>, <0xf9824000 0x800>;
> 			reg-names = "hc_mem", "core_mem";

> 			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> 				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> 			interrupt-names = "hc_irq", "pwr_irq";

> 			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
> 			         <&gcc GCC_SDCC1_AHB_CLK>,
> 				 <&xo_board>;
> 			clock-names = "core", "iface", "xo";

> 			pinctrl-names = "default", "sleep";
> 			pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on &sdc1_rclk_on>;
> 			pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off &sdc1_rclk_off>;

> 			bus-width = <8>;
> 			non-removable;
> 			status = "disabled";
> 		};

> 		sdhc2: sdhci@f98a4900 {
> 			compatible = "qcom,sdhci-msm-v4";
> 			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
> 			reg-names = "hc_mem", "core_mem";

> 			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> 				<GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
> 			interrupt-names = "hc_irq", "pwr_irq";

> 			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
> 				<&gcc GCC_SDCC2_AHB_CLK>,
> 				<&xo_board>;
> 			clock-names = "core", "iface", "xo";

> 			pinctrl-names = "default", "sleep";
> 			pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on>;
> 			pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;

> 			cd-gpios = <&tlmm 100 0>;
> 			bus-width = <4>;
> 			status = "disabled";
> 		};

> => reg values are the same as in downstream, cd-gpios is defined only
> for sdhc_2 (redefined for angler in downstream).

> I supppose qcom,vdd-io-voltage-level from downstream is mapped to
> regulator-min-microvolt and regulator-max-microvolt from correspondent regulator pm8994_*.
> How to map qcom,vdd-current-level (load levels for supply in low/high power mode)? I don't see it in
> bindings/regulator/regulator.yaml in mainline.

> Also, how to interpred (check) regulator-{min,max}-microvolt values?
> xxd /proc/device-tree/soc/qcom,rpm-smd/rpm-regulator-smpa3/regulator-s3/regulator-min-microvolt
> 00000000: 0013 d620                                ...

> xxd /proc/device-tree/soc/sdhci@f9824900/vdd-io-supply
> 00000000: 0000 003d                                ...=

> &sdhc_1 {
> 	...
> 	vdd-io-supply = <&pm8994_s4>;
> }

> pm8994_s3: regulator-s3 {
> 	regulator-min-microvolt = <1300000>;
> 	...
> }

> Thanks for any tip.

> Kind regards,
> Petr

> [1] https://android.googlesource.com/kernel/msm/+/android-msm-bullhead-3.10-marshmallow-dr/arch/arm/boot/dts/qcom/msm8994.dtsi#1096
> [2] https://android.googlesource.com/kernel/msm/+/android-msm-bullhead-3.10-marshmallow-dr/arch/arm/boot/dts/qcom/msm8994-mtp.dtsi#28

>  .../boot/dts/qcom/msm8994-angler-rev-101.dts  | 283 ++++++++++++++++++
>  1 file changed, 283 insertions(+)

> diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> index 0e3dd48f0dbf..c7de0dafe913 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> @@ -7,6 +7,9 @@
>  /dts-v1/;

>  #include "msm8994.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>

>  /* Angler's firmware does not report where the memory is allocated */
>  /delete-node/ &cont_splash_mem;
> @@ -41,3 +44,283 @@ serial@f991e000 {
>  &tlmm {
>  	gpio-reserved-ranges = <85 4>;
>  };
> +
> +/*
> + * TODO remove duplicity with msm8992-bullhead-rev-101.dts
> + * There are some todo inherited from it.
> +
> + * FIXME: verify differences from msm8992-bullhead-rev-101.dts :
> +
> +   pm8994_l20: regulator-l20 {
> +   unique values:
> +	   qcom,init-current = <750>;
> +	   regulator-boot-on;
> +
> +   pm8994_l28: regulator-l28 {
> +   unique values:
> +   qcom,init-current = <45>;
> +   regulator-boot-on;
> + */
> +&rpm_requests {
> +	pm8994_regulators: pm8994-regulators {
> +		compatible = "qcom,rpm-pm8994-regulators";
> +
> +		vdd_l1-supply = <&pm8994_s1>;
> +		vdd_l2_26_28-supply = <&pm8994_s3>;
> +		vdd_l3_11-supply = <&pm8994_s3>;
> +		vdd_l4_27_31-supply = <&pm8994_s3>;
> +		vdd_l5_7-supply = <&pm8994_s3>;
> +		vdd_l6_12_32-supply = <&pm8994_s5>;
> +		vdd_l8_16_30-supply = <&vph_pwr>;
> +		vdd_l9_10_18_22-supply = <&vph_pwr>;
> +		vdd_l13_19_23_24-supply = <&vph_pwr>;
> +		vdd_l14_15-supply = <&pm8994_s5>;
> +		vdd_l17_29-supply = <&vph_pwr>;
> +		vdd_l20_21-supply = <&vph_pwr>;
> +		vdd_l25-supply = <&pm8994_s5>;
> +		vdd_lvs1_2 = <&pm8994_s4>;
> +
> +		/* S1, S2, S6 and S12 are managed by RPMPD */
> +
> +		pm8994_s1: s1 {
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <800000>;
> +		};
> +
> +		pm8994_s2: s2 {
> +			/* TODO */
> +		};
> +
> +		pm8994_s3: s3 {
> +			regulator-min-microvolt = <1300000>;
> +			regulator-max-microvolt = <1300000>;
> +		};
> +
> +		pm8994_s4: s4 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-allow-set-load;
> +			regulator-system-load = <325000>;
> +		};
> +
> +		pm8994_s5: s5 {
> +			regulator-min-microvolt = <2150000>;
> +			regulator-max-microvolt = <2150000>;
> +		};
> +
> +		pm8994_s7: s7 {
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1000000>;
> +		};
> +
> +		/* S8, S9, S10 and S11 - SPMI-managed VDD_APC */
> +
> +		pm8994_l1: l1 {
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1000000>;
> +		};
> +
> +		pm8994_l2: l2 {
> +			regulator-min-microvolt = <1250000>;
> +			regulator-max-microvolt = <1250000>;
> +		};
> +
> +		pm8994_l3: l3 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +		};
> +
> +		pm8994_l4: l4 {
> +			regulator-min-microvolt = <1225000>;
> +			regulator-max-microvolt = <1225000>;
> +		};
> +
> +		/* L5 is inaccessible from RPM */
> +
> +		pm8994_l6: l6 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		/* L7 is inaccessible from RPM */
> +
> +		pm8994_l8: l8 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		pm8994_l9: l9 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		pm8994_l10: l10 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		pm8994_l11: l11 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +		};
> +
> +		pm8994_l12: l12 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		pm8994_l13: l13 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2950000>;
> +		};
> +
> +		pm8994_l14: l14 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +		};
> +
> +		pm8994_l15: l15 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		pm8994_l16: l16 {
> +			regulator-min-microvolt = <2700000>;
> +			regulator-max-microvolt = <2700000>;
> +		};
> +
> +		pm8994_l17: l17 {
> +			regulator-min-microvolt = <2700000>;
> +			regulator-max-microvolt = <2700000>;
> +		};
> +
> +		pm8994_l18: l18 {
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3000000>;
> +		};
> +
> +		pm8994_l19: l19 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		pm8994_l20: l20 {
> +			regulator-min-microvolt = <2950000>;
> +			regulator-max-microvolt = <2950000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			regulator-allow-set-load;
> +			regulator-system-load = <570000>;
> +		};
> +
> +		pm8994_l21: l21 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-always-on;
> +		};
> +
> +		pm8994_l22: l22 {
> +			regulator-min-microvolt = <3100000>;
> +			regulator-max-microvolt = <3100000>;
> +		};
> +
> +		pm8994_l23: l23 {
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +		};
> +
> +		pm8994_l24: l24 {
> +			regulator-min-microvolt = <3075000>;
> +			regulator-max-microvolt = <3150000>;
> +		};
> +
> +		pm8994_l25: l25 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		pm8994_l26: l26 {
> +			/* TODO from msm8992-bullhead-rev-101.dts: value from downstream
> +			regulator-min-microvolt = <987500>;
> +			fails to apply */
> +		};
> +
> +		pm8994_l27: l27 {
> +			regulator-min-microvolt = <1050000>;
> +			regulator-max-microvolt = <1050000>;
> +		};
> +
> +		pm8994_l28: l28 {
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1000000>;
> +		};
> +
> +		pm8994_l29: l29 {
> +			/* TODO from msm8992-bullhead-rev-101.dts: Unsupported voltage range.
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			qcom,init-voltage = <2800000>;
> +			*/
> +		};
> +
> +		pm8994_l30: l30 {
> +			/* TODO from msm8992-bullhead-rev-101.dts: get this verified
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			qcom,init-voltage = <1800000>;
> +			*/
> +		};
> +
> +		pm8994_l31: l31 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			qcom,init-voltage = <1200000>;
> +			/* FIXME: verify
> +			qcom,init-current = <50>;
> +			regulator-boot-on;
> +			*/
> +		};
> +
> +		pm8994_l32: l32 {
> +			/* TODO from msm8992-bullhead-rev-101.dts: get this verified
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			qcom,init-voltage = <1800000>;
> +			*/
> +		};
> +	};
> +
> +	pmi8994_regulators: pmi8994-regulators {
> +		compatible = "qcom,rpm-pmi8994-regulators";
> +
> +		vdd_s1-supply = <&vph_pwr>;
> +		vdd_bst_byp-supply = <&vph_pwr>;
> +
> +		pmi8994_s1: s1 {};
> +
> +		/* S2 & S3 - VDD_GFX */
> +
> +		pmi8994_bby: boost-bypass {};
> +	};
> +};
> +
> +&sdhc1 {
> +	status = "okay";
> +
> +
> +	/* downstream: qcom,bus-speed-mode = "HS400_1p8v", "HS200_1p8v", "DDR_1p8v"; */
> +	mmc-hs400-1_8v;
> +
> +	vmmc-supply = <&pm8994_l20>;
> +	vqmmc-supply = <&pm8994_s4>;
> +};
> +
> +&sdhc2 {
> +	status = "okay";
> +
> +	/* downstream: cd-gpios = <&pm8994_gpios 8 0x1>; */
> +	cd-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
> +
> +	vmmc-supply = <&pm8994_l21>;
> +	vqmmc-supply = <&pm8994_l13>;
> +};
