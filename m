Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 476D1527123
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 15:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbiENNJn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 09:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbiENNJm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 09:09:42 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE9B237FB
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 06:09:40 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id i10so18711395lfg.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 06:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VRUUkYE+NnnW3bXVQlxC1IBZYZQXsm582x4i1iqCaio=;
        b=ToCVNbDYJIHQxFU96p1QSzDgZahHoe3PyN0h+nksbCwqfVt3svpBPfU2qX2nYinVTr
         qaZiC9tZCpC3v9+Dx8H2waoiueDX4VpfB83NT4/KDbY0K51SW1B9rxg8eZiJ2UYsLxp7
         UsKCuvsmV4TeMpkgThErEnKoAIL01cKMIjXCmgUnuEm72yG7Sm9KUacxqTjGEL5BixvE
         cZM5iRBH9WRwCiI6VWj5DDNET5s2BZUoH97TltVMN1LgwMzd/B3iRxaAwNfQymVR5fQn
         zgDgAqeW8DRYdZk9OI1A9oNB5UASfOfIypuYtaNNbEDlUkHETpfZreXvjMbimYfoOlRY
         SeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VRUUkYE+NnnW3bXVQlxC1IBZYZQXsm582x4i1iqCaio=;
        b=zfA8FZzff4ioFpo9f8wo9Gnw+q424s292vKjci8CKLpeIUF+b13RSXsrwoCAIOVeKv
         7aplNwVAqbJH9vT3rtUrFOkLzsxXQU91v/RoF4MMouW4VPhyf5znGiCbq4Kra+RgEylv
         Rx3eOJdo2Z1t4yZAzYwkhYC2Eyg6kbkA4hBZeEc5WjpoA31g1wLWN3CfWNXa8Wcu/VaO
         VqHzZySS8CpApesM/tNlZZPmxgCduK+i/dSB3Nj3zSgSoX0m4wlZECjdJVtR2HE1aPFy
         xii1E8HE5mp+HZ4C2bj3PigE3sek9C2rncvnnWiq7XKsHOPD7yWBQk4icYYjFLcJIZ6i
         Liew==
X-Gm-Message-State: AOAM533rGV8kZT6jIDpdKE7i3agcDNILCU+JcWeuPOox6GA1M4kuRfT0
        Bheq3cHVWjq+Wx1Y+t1vIIB+iA==
X-Google-Smtp-Source: ABdhPJz3zOyMRELT+U044ceuUWYDvb7ZyHSV/YjKUPALtxUv0R6Yu/80n8DFQZ9kbltjTAA7MN+EXg==
X-Received: by 2002:a05:6512:1516:b0:448:39b8:d603 with SMTP id bq22-20020a056512151600b0044839b8d603mr6638101lfb.599.1652533779054;
        Sat, 14 May 2022 06:09:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f19-20020ac25093000000b0047255d211f3sm701410lfm.290.2022.05.14.06.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 May 2022 06:09:38 -0700 (PDT)
Message-ID: <a664ff12-ba6c-0ecc-3dee-0ab1671d559b@linaro.org>
Date:   Sat, 14 May 2022 16:09:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: sdm660: Add initial Inforce
 IFC6560 board support
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
 <20220513234518.3068480-8-dmitry.baryshkov@linaro.org>
 <20220514103159.es3iqyu5a5fokgar@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220514103159.es3iqyu5a5fokgar@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/05/2022 13:31, Marijn Suijten wrote:
> On 2022-05-14 02:45:17, Dmitry Baryshkov wrote:
>> The IFC6560 is a board from Inforce Computing, built around the SDA660
>> SoC. This patch describes core clocks, some regulators from the two
>> PMICs, debug uart, storage, bluetooth and audio DSP remoteproc.
>>
>> The regulator settings are inherited from prior work by Konrad Dybcio
>> and AngeloGioacchino Del Regno.
>>
>> Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>   .../boot/dts/qcom/sda660-inforce-ifc6560.dts  | 455 ++++++++++++++++++
>>   2 files changed, 456 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index f9e6343acd03..5f717fe0e8d0 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -88,6 +88,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-herobrine-r1.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp2.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-crd.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= sda660-inforce-ifc6560.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-ganges-kirin.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-discovery.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-pioneer.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
>> new file mode 100644
>> index 000000000000..ade5c27dafcf
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
>> @@ -0,0 +1,455 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2021, Linaro Ltd.
>> + * Copyright (c) 2020, Konrad Dybcio <konrad.dybcio@somainline.org>
>> + * Copyright (c) 2020, AngeloGioacchino Del Regno
>> + *                     <angelogioacchino.delregno@somainline.org>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "sdm660.dtsi"
>> +#include "pm660.dtsi"
>> +#include "pm660l.dtsi"
>> +
>> +/ {
>> +	model = "Inforce 6560 Single Board Computer";
>> +	compatible = "inforce,ifc6560", "qcom,sda660";
>> +	chassis-type = "embedded"; /* SBC */
>> +
>> +	aliases {
>> +		serial0 = &blsp1_uart2;
>> +		serial1 = &blsp2_uart1;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +
>> +		volup {
>> +			label = "Volume Up";
>> +			gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
>> +			linux,code = <KEY_VOLUMEUP>;
>> +			debounce-interval = <15>;
>> +		};
>> +	};
>> +
>> +	/*
>> +	 * Until we hook up type-c detection, we
>> +	 * have to stick with this. But it works.
>> +	 */
>> +	extcon_usb: extcon-usb {
>> +		compatible = "linux,extcon-usb-gpio";
>> +		id-gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
>> +	};
>> +
>> +	hdmi-out {
>> +		compatible = "hdmi-connector";
>> +		type = "a";
>> +
>> +		port {
>> +			hdmi_con: endpoint {
>> +				remote-endpoint = <&adv7533_out>;
>> +			};
>> +		};
>> +	};
>> +
>> +	vph_pwr: vph-pwr-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vph_pwr";
>> +		regulator-min-microvolt = <3800000>;
>> +		regulator-max-microvolt = <3800000>;
>> +
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>> +
>> +	v3p3_bck_bst: v3p3-bck-bst-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "v3p3_bck_bst";
>> +
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		vin-supply = <&vph_pwr>;
>> +	};
>> +
>> +	v1p2_ldo: v1p2-ldo-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "v1p2_ldo";
>> +
>> +		regulator-min-microvolt = <1200000>;
>> +		regulator-max-microvolt = <1200000>;
>> +
>> +		vin-supply = <&vph_pwr>;
>> +	};
>> +
>> +	v5p0_boost: v5p0-boost-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "v5p0_boost";
>> +
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +
>> +		vin-supply = <&vph_pwr>;
>> +	};
>> +};
>> +
>> +&adsp_pil {
>> +	firmware-name = "qcom/ifc6560/adsp.mbn";
>> +};
>> +
>> +&blsp1_dma {
>> +	/*
>> +	 * The board will lock up if we toggle the BLSP clock, unless the
>> +	 * BAM DMA interconnects support is in place.
>> +	 */
>> +	/delete-property/ clocks;
>> +};
>> +
>> +&blsp_i2c6 {
>> +	status = "okay";
>> +
>> +	adv7533: hdmi@39 {
>> +		compatible = "adi,adv7535";
>> +		reg = <0x39>, <0x66>;
>> +		reg-names = "main", "edid";
>> +
>> +		interrupt-parent = <&pm660l_gpios>;
>> +		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
>> +
>> +		clocks = <&rpmcc RPM_SMD_BB_CLK2>;
>> +		clock-names = "cec";
>> +		/*
>> +		 * Limit to 3 lanes to prevent the bridge from changing amount
>> +		 * of lanes in the fly. MSM DSI host doesn't like that.
>> +		 */
>> +		adi,dsi-lanes = <3>;
>> +		avdd-supply = <&vreg_l13a_1p8>;
>> +		dvdd-supply = <&vreg_l13a_1p8>;
>> +		pvdd-supply = <&vreg_l13a_1p8>;
>> +		a2vdd-supply = <&vreg_l13a_1p8>;
>> +		v3p3-supply = <&v3p3_bck_bst>;
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				adv7533_in: endpoint {
>> +					remote-endpoint = <&dsi0_out>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				adv7533_out: endpoint {
>> +					remote-endpoint = <&hdmi_con>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&blsp1_uart2 {
>> +	status = "okay";
>> +};
>> +
>> +&blsp2_dma {
>> +	/*
>> +	 * The board will lock up if we toggle the BLSP clock, unless the
>> +	 * BAM DMA interconnects support is in place.
>> +	 */
>> +	/delete-property/ clocks;
>> +};
>> +
>> +&blsp2_uart1 {
>> +	status = "okay";
>> +
>> +	bluetooth {
>> +		compatible = "qcom,wcn3990-bt";
>> +
>> +		vddio-supply = <&vreg_l13a_1p8>;
>> +		vddxo-supply = <&vreg_l9a_1p8>;
>> +		vddrf-supply = <&vreg_l6a_1p3>;
>> +		vddch0-supply = <&vreg_l19a_3p3>;
>> +		max-speed = <3200000>;
>> +	};
>> +};
>> +
>> +&dsi0 {
>> +	status = "okay";
>> +	vdda-supply = <&vreg_l1a_1p225>;
>> +};
>> +
>> +&dsi0_out {
>> +	remote-endpoint = <&adv7533_in>;
>> +	data-lanes = <0 1 2 3>;
>> +};
>> +
>> +&dsi0_phy {
>> +	status = "okay";
>> +	vcca-supply = <&vreg_l1b_0p925>;
> 
> @Konrad: It looks like we have this regulator downstream in mdss_dsi but
> not in the upstream DT, is it missing by accident?
> 
>> +};
>> +
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&mmss_smmu {
>> +	status = "okay";
>> +};
>> +
>> +&pon_pwrkey {
>> +	status = "okay";
>> +};
>> +
>> +&pon_resin {
>> +	status = "okay";
>> +
>> +	linux,code = <KEY_VOLUMEUP>;
>> +};
>> +
>> +&qusb2phy {
>> +	status = "okay";
>> +
>> +	vdd-supply = <&vreg_l1b_0p925>;
>> +	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
>> +};
>> +
>> +&qusb2phy1 {
>> +	status = "okay";
>> +
>> +	vdd-supply = <&vreg_l1b_0p925>;
>> +	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
>> +};
>> +
>> +&rpm_requests {
>> +	pm660-regulators {
>> +		compatible = "qcom,rpm-pm660-regulators";
>> +
>> +		vdd_s1-supply = <&vph_pwr>;
>> +		vdd_s2-supply = <&vph_pwr>;
>> +		vdd_s3-supply = <&vph_pwr>;
>> +		vdd_s4-supply = <&vph_pwr>;
>> +		vdd_s5-supply = <&vph_pwr>;
>> +		vdd_s6-supply = <&vph_pwr>;
>> +
>> +		vdd_l1_l6_l7-supply = <&vreg_s5a_1p35>;
>> +		vdd_l2_l3-supply = <&vreg_s2b_1p05>;
>> +		vdd_l5-supply = <&vreg_s2b_1p05>;
>> +		vdd_l8_l9_l10_l11_l12_l13_l14-supply = <&vreg_s4a_2p04>;
>> +		vdd_l15_l16_l17_l18_l19-supply = <&vreg_bob>;
>> +
>> +		vreg_s4a_2p04: s4 {
>> +			regulator-min-microvolt = <1805000>;
>> +			regulator-max-microvolt = <2040000>;
>> +			regulator-enable-ramp-delay = <200>;
>> +			regulator-ramp-delay = <0>;
>> +			regulator-always-on;
>> +		};
>> +
>> +		vreg_s5a_1p35: s5 {
>> +			regulator-min-microvolt = <1224000>;
>> +			regulator-max-microvolt = <1350000>;
>> +			regulator-enable-ramp-delay = <200>;
>> +			regulator-ramp-delay = <0>;
>> +		};
>> +
>> +		vreg_l1a_1p225: l1 {
>> +			regulator-min-microvolt = <1150000>;
>> +			regulator-max-microvolt = <1250000>;
>> +			regulator-enable-ramp-delay = <250>;
>> +			regulator-allow-set-load;
>> +		};
>> +
>> +		vreg_l6a_1p3: l6 {
>> +			regulator-min-microvolt = <1304000>;
>> +			regulator-max-microvolt = <1368000>;
>> +			regulator-enable-ramp-delay = <250>;
>> +			regulator-ramp-delay = <0>;
>> +			regulator-allow-set-load;
>> +		};
>> +
>> +		vreg_l8a_1p8: l8 {
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1800000>;
>> +			regulator-enable-ramp-delay = <250>;
>> +			regulator-ramp-delay = <0>;
>> +			regulator-system-load = <325000>;
>> +			regulator-allow-set-load;
>> +		};
>> +
>> +		vreg_l9a_1p8: l9 {
>> +			regulator-min-microvolt = <1804000>;
>> +			regulator-max-microvolt = <1896000>;
>> +			regulator-enable-ramp-delay = <250>;
>> +			regulator-ramp-delay = <0>;
>> +			regulator-allow-set-load;
>> +		};
>> +
>> +		vreg_l13a_1p8: l13 {
>> +			/* This gives power to the LPDDR4: never turn it off! */
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1944000>;
>> +			regulator-enable-ramp-delay = <250>;
>> +			regulator-ramp-delay = <0>;
>> +			regulator-always-on;
>> +			regulator-boot-on;
>> +		};
>> +
>> +		vreg_l19a_3p3: l19 {
>> +			regulator-min-microvolt = <3312000>;
>> +			regulator-max-microvolt = <3400000>;
>> +			regulator-enable-ramp-delay = <250>;
>> +			regulator-ramp-delay = <0>;
>> +			regulator-allow-set-load;
>> +		};
>> +	};
>> +
>> +	pm660l-regulators {
>> +		compatible = "qcom,rpm-pm660l-regulators";
>> +
>> +		vdd_s1-supply = <&vph_pwr>;
>> +		vdd_s2-supply = <&vph_pwr>;
>> +		vdd_s3_s4-supply = <&vph_pwr>;
>> +		vdd_s5-supply = <&vph_pwr>;
>> +		vdd_s6-supply = <&vph_pwr>;
>> +
>> +		vdd_l1_l9_l10-supply = <&vreg_s2b_1p05>;
>> +		vdd_l2-supply = <&vreg_bob>;
>> +		vdd_l3_l5_l7_l8-supply = <&vreg_bob>;
>> +		vdd_l4_l6-supply = <&vreg_bob>;
>> +		vdd_bob-supply = <&vph_pwr>;
>> +
>> +		vreg_s2b_1p05: s2 {
>> +			regulator-min-microvolt = <1050000>;
>> +			regulator-max-microvolt = <1050000>;
>> +			regulator-enable-ramp-delay = <200>;
>> +			regulator-ramp-delay = <0>;
>> +		};
>> +
>> +		vreg_l1b_0p925: l1 {
>> +			regulator-min-microvolt = <800000>;
>> +			regulator-max-microvolt = <925000>;
>> +			regulator-enable-ramp-delay = <250>;
>> +			regulator-allow-set-load;
>> +		};
>> +
>> +		vreg_l2b_2p95: l2 {
>> +			regulator-min-microvolt = <1648000>;
>> +			regulator-max-microvolt = <3100000>;
>> +			regulator-enable-ramp-delay = <250>;
>> +			regulator-ramp-delay = <0>;
>> +			regulator-allow-set-load;
>> +		};
>> +
>> +		vreg_l4b_2p95: l4 {
>> +			regulator-min-microvolt = <2944000>;
>> +			regulator-max-microvolt = <2952000>;
>> +			regulator-enable-ramp-delay = <250>;
>> +			regulator-ramp-delay = <0>;
>> +
>> +			regulator-min-microamp = <200>;
>> +			regulator-max-microamp = <600000>;
>> +			regulator-system-load = <570000>;
>> +			regulator-allow-set-load;
>> +		};
>> +
>> +		/*
>> +		 * Downstream specifies a range of 1721-3600mV,
>> +		 * but the only assigned consumers are SDHCI2 VMMC
>> +		 * and Coresight QPDI that both request pinned 2.95V.
>> +		 * Tighten the range to 1.8-3.328 (closest to 3.3) to
>> +		 * make the mmc driver happy.
>> +		 */
>> +		vreg_l5b_2p95: l5 {
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <3328000>;
>> +			regulator-enable-ramp-delay = <250>;
>> +			regulator-system-load = <800000>;
>> +			regulator-ramp-delay = <0>;
>> +			regulator-allow-set-load;
>> +		};
>> +
>> +		vreg_l7b_3p125: l7 {
>> +			regulator-min-microvolt = <2700000>;
>> +			regulator-max-microvolt = <3125000>;
>> +			regulator-enable-ramp-delay = <250>;
>> +		};
>> +
>> +		vreg_l8b_3p3: l8 {
>> +			regulator-min-microvolt = <2800000>;
>> +			regulator-max-microvolt = <3400000>;
>> +			regulator-enable-ramp-delay = <250>;
>> +			regulator-ramp-delay = <0>;
>> +		};
>> +
>> +		vreg_bob: bob {
>> +			regulator-min-microvolt = <3300000>;
>> +			regulator-max-microvolt = <3624000>;
>> +			regulator-enable-ramp-delay = <500>;
>> +			regulator-ramp-delay = <0>;
>> +		};
>> +	};
>> +};
>> +
>> +&sdhc_1 {
>> +	status = "okay";
>> +	supports-cqe;
>> +
>> +	vmmc-supply = <&vreg_l4b_2p95>;
>> +	vqmmc-supply = <&vreg_l8a_1p8>;
>> +
>> +	mmc-ddr-1_8v;
>> +	mmc-hs400-1_8v;
>> +	mmc-hs400-enhanced-strobe;
>> +};
>> +
>> +&sdhc_2 {
>> +	status = "okay";
>> +
>> +	pinctrl-names = "default";
> 
> Missing , "sleep".
> 
>> +	pinctrl-0 = <&sdc2_state_on &sdc2_card_det_n>;
>> +	pinctrl1 = <&sdc2_state_off &sdc2_card_det_n>;
> 
> Missing hyphen.

Thanks.

> 
>> +
>> +	vmmc-supply = <&vreg_l5b_2p95>;
>> +	vqmmc-supply = <&vreg_l2b_2p95>;
>> +
>> +	cd-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
>> +	no-sdio;
>> +	no-emmc;
>> +};
>> +
>> +&tlmm {
>> +	gpio-reserved-ranges = <0 4>, <8 4>;
>> +
>> +	sdc2_card_det_n: sd-card-det-n {
>> +		pins = "gpio54";
>> +		function = "gpio";
>> +		bias-pull-up;
>> +	};
> 
> It seems this pin is also already declared in sdc2-on/off in
> sdm630.dtsi, with the same bias-pull-up in the -on case.  However, the
> -off case sets bias-disable, won't that conflict?  (not in this moment,
> because the clashing pinctrl pairs are "unused" with the typos above).

Ugh. Yes, there should be just one of them

> 
> I have always been under the impression this GPIO is board-specific and
> should be moved out of sdm630.dtsi into board-specific DTs, is that
> true?

Yes, it is true. That's why I didn't expect that it is already defined.
Also the bias and the drive-strength are also expected to go to the 
board files. Let me take a glance and fix that.

> 
> - Marijn
> 
>> +};
>> +
>> +&usb2 {
>> +	status = "okay";
>> +};
>> +
>> +&usb2_dwc3 {
>> +	dr_mode = "host";
>> +};
>> +
>> +&usb3 {
>> +	status = "okay";
>> +};
>> +
>> +&usb3_dwc3 {
>> +	dr_mode = "peripheral";
>> +	extcon = <&extcon_usb>;
>> +};
>> -- 
>> 2.35.1
>>


-- 
With best wishes
Dmitry
