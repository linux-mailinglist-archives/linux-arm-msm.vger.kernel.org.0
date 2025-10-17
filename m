Return-Path: <linux-arm-msm+bounces-77842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D693BEBEAC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 00:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 322AB3BC02B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 22:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71102D77EA;
	Fri, 17 Oct 2025 22:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="E3T2gVK1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8832D6623;
	Fri, 17 Oct 2025 22:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760739838; cv=none; b=uqQCbxR/Em7fJriHdvNv0nwkqqPwdQdiNwMTLB1YOmTDmFqPAPFPl4xZc9Fwu8kGn8KA/QXTEpMsE+o+vs05tCqA4R/lWXo4eysE+w4R/xPnTfcROcPr4q1m32Zu8ULJtlAI5EGBYNFDUWscENcVc7qhDH50RuaMkxNqU1E0RXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760739838; c=relaxed/simple;
	bh=k57UuCSMmRlVgop265bhkHiUpcn0On7JMC1T9TCwVVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FwLEYlz9RHDKVFQoPYqI3LvTortAmszQfk50t5qgF7SUwx8ehw0/+48MxrsUP1cVOp4EpNKi07m3rzvZ+bHO02RqY1pKmLwZ3f6Ho/NBiJz3cd1AnT3BFEEv3eEPwHVtSHTyrmcbmRDdGUqh8AlO0vrTKzyfsxpsrmU1/jaMVXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=E3T2gVK1; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.0.200] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 43BAC534114A;
	Sat, 18 Oct 2025 00:23:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1760739830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jD5F/N0KEuXEiVnf+3dquFNXLJT066nqOZL5j3p2oYM=;
	b=E3T2gVK1YsvGbXnDN5lh57W6h0ytPJAod18QH6IEBIaYvUAQ71uVlARL0IYisb5nffMaMd
	k1Rrolf2LvYR0jhDO9Q04HPszuH1aQaC1Ygh/Hqo26dBUxTsZ3vTS4Tnd4C8SmsGzSbwtR
	0VILGHodwl9BnveR8CXmNYDgHd/96Gs=
Message-ID: <73975160-05db-494c-a7ad-d67422edd69b@ixit.cz>
Date: Sat, 18 Oct 2025 00:23:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for Pixel 3 and Pixel 3
 XL
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>,
 Joel Selvaraj <foss@joelselvaraj.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20251005-pixel-3-v1-0-ab8b85f6133f@ixit.cz>
 <20251005-pixel-3-v1-2-ab8b85f6133f@ixit.cz>
 <n4xims4y5sssqxkchg2tikc7idkzds5ru7ayidcgxdfx77je2d@qo34qucbebnn>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <n4xims4y5sssqxkchg2tikc7idkzds5ru7ayidcgxdfx77je2d@qo34qucbebnn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 06/10/2025 00:03, Dmitry Baryshkov wrote:
> On Sun, Oct 05, 2025 at 03:16:29PM +0200, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> This adds initial device tree support for the following phones:
>>
>>   - Google Pixel 3 (blueline)
>>   - Google Pixel 3 XL (crosshatch)
> 
> Great to finally see it being submitted!
> 
>>
>> Both phone boards use the same identifiers and differ only slightly
>> in their connected peripherals.
>>
>> Supported functionality includes:
>>   - Debug UART
>>   - UFS
>>   - Charger
>>   - USB-C (peripheral mode)
>>   - Display (Pixel 3 only)
> 
> No remoteprocs / IPA / GPU / Venus / WiFi / BT? The firmware is
> accessible to download from Google and it can be further repackaged (but
> not redistributed). See [1], [2].
> 
> The phones share all firmware except for the bdwlan, so hopefully you
> can add 'Google/blueline/foo.mbn' to the common file.
> 
> [1] https://github.com/linux-msm/meta-qcom-extras/blob/master/recipes-bsp/firmware-nexus/firmware-qcom-pixel3.bb
> [2] https://github.com/linux-msm/meta-qcom-extras/blob/master/recipes-bsp/firmware-nexus/firmware-qcom-pixel.inc
> 
>>
>> GPIOs 0–3 and 81–84 are not accessible from the application CPUs,
>> so they are marked as reserved to allow the Pixel 3 to boot.
>>
>> The rmtfs region is allocated using UIO, making it technically "dynamic."
>>
>> Its address and size can be read from sysfs:
>>
>> $ cat /sys/class/uio/uio0/name
>> /sys/class/uio/uio0/maps/map0/addr
>> 0x00000000f2701000
>>
>> $ cat /sys/class/uio/uio0/maps/map0/size
>> 0x0000000000200000
>>
>> Like the OnePlus 6, the Pixel 3 requires 1 kB of reserved memory on either
>> side of the rmtfs region to work around an XPU bug that would otherwise
>> cause erroneous violations when accessing the rmtfs_mem region.
>>
>> Co-developed-by: Amit Pundir <amit.pundir@linaro.org>
>> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
>> Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Co-developed-by: Casey Connolly <casey@connolly.tech>
>> Signed-off-by: Casey Connolly <casey@connolly.tech>
>> Co-developed-by: Joel Selvaraj <foss@joelselvaraj.com>
>> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
>> Co-developed-by: Sumit Semwal <sumit.semwal@linaro.org>
>> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
>> Co-developed-by: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile                  |   2 +
>>   .../arm64/boot/dts/qcom/sdm845-google-blueline.dts | 128 ++++++
>>   arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 467 +++++++++++++++++++++
>>   .../boot/dts/qcom/sdm845-google-crosshatch.dts     | 137 ++++++
>>   4 files changed, 734 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 4bfa926b6a085..ba05dc935dc7c 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -239,6 +239,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
>>   sdm845-db845c-navigation-mezzanine-dtbs	:= sdm845-db845c.dtb sdm845-db845c-navigation-mezzanine.dtbo
>>   
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-crosshatch.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-blueline.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
>> new file mode 100644
>> index 0000000000000..df88982018b9e
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
>> @@ -0,0 +1,128 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/dts-v1/;
>> +
>> +#include "sdm845-google-common.dtsi"
>> +
>> +/ {
>> +	model = "Google Pixel 3";
>> +	compatible = "google,blueline", "qcom,sdm845";
>> +
>> +	battery: battery {
>> +		compatible = "simple-battery";
>> +
>> +		charge-full-design-microamp-hours = <2970000>;
>> +		voltage-min-design-microvolt = <3600000>;
>> +		voltage-max-design-microvolt = <4400000>;
>> +	};
>> +
>> +	chosen {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		/* for u-boot */
>> +		framebuffer: framebuffer@9d400000 {
>> +			compatible = "simple-framebuffer";
>> +			reg = <0 0x9d400000 0 (2160 * 1080 * 4)>;
>> +			width = <1080>;
>> +			height = <2160>;
>> +			stride = <(1080 * 4)>;
>> +			format = "a8r8g8b8";
>> +		};
>> +	};
>> +
>> +	reserved-memory {
>> +		framebuffer_region@9d400000 {
> 
> Can't we use cont_splash_mem and let bootloader set it?
> 
>> +			no-map;
>> +			reg = <0 0x9d400000 0 0x02400000>; // FIXME
>> +		};
>> +	};
>> +};
>> +
>> +&gmu {
>> +	status = "okay";
>> +};
> 
> No need to, it's enabled by default.
> 
>> +
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dsi0 {
>> +	status = "okay";
>> +	vdda-supply = <&vdda_mipi_dsi0_1p2>;
>> +
>> +	ports {
>> +		port@1 {
>> +			endpoint {
>> +				remote-endpoint = <&panel_in>;
>> +				data-lanes = <0 1 2 3>;
>> +				qcom,te-source = "mdp_vsync_e";
> 
> &mdss_dsi1_out {
> 	remote-endpoint = <&panel_in>;
> 	.....
> };
> 
> 
>> +			};
>> +		};
>> +	};
>> +
>> +	panel@0 {
>> +		compatible = "lg,sw43408";
>> +		reg = <0>;
>> +
>> +		vddi-supply = <&vreg_l14a_1p88>;
>> +		vpnl-supply = <&vreg_l28a_3p0>;
>> +
>> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&panel_reset_pins &panel_te_pin &panel_pmgpio_pins>;
>> +
>> +		port {
>> +			panel_in: endpoint {
>> +				remote-endpoint = <&mdss_dsi0_out>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&mdss_dsi0_out {
>> +	remote-endpoint = <&panel_in>;
>> +	data-lanes = <0 1 2 3>;
>> +};
>> +
>> +&mdss_dsi0_phy {
>> +	vdds-supply = <&vdda_mipi_dsi0_pll>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pm8998_gpios {
>> +	panel_pmgpio_pins: panel-pmgpio-active-state {
> 
> Are these two actually used by the panel? I think they were only used
> for sw43402, but not for sw43408.

Yes, I tested and it seems the display behaves same way.>
>> +		pins = "gpio2", "gpio5";
>> +		function = "normal";
>> +		input-enable;
>> +		bias-disable;
>> +		power-source = <0>;
>> +	};
>> +};
>> +
>> +
>> +	volume-keys {
> 
> gpio-keys ?
> 
>> +		compatible = "gpio-keys";
>> +		label = "Volume keys";
>> +		autorepeat;
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&volume_up_gpio>;
>> +
>> +		key-vol-up {
>> +			label = "Volume Up";
>> +			linux,code = <KEY_VOLUMEUP>;
>> +			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
>> +			debounce-interval = <15>;
>> +		};
>> +	};
>> +
>> +	vph_pwr: vph-pwr-regulator {
> 
> Nit: BCP is regulator-foo-bar

Can you clarify, all other device-tree use this format, do you mean 
regulator-pwr-vph?

Thank you
David

> 
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vph_pwr";
>> +		regulator-min-microvolt = <3700000>;
>> +		regulator-max-microvolt = <3700000>;
>> +	};
>> +
>> +	vreg_s4a_1p8: vreg-s4a-1p8-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_s4a_1p8";
>> +
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +
>> +		vin-supply = <&vph_pwr>;
>> +	};
>> +};
>> +
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts b/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
>> new file mode 100644
>> index 0000000000000..dc9938ffc0ab8
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
>> @@ -0,0 +1,137 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/dts-v1/;
>> +
>> +#include "sdm845-google-common.dtsi"
>> +
>> +/ {
>> +	model = "Google Pixel 3 XL";
>> +	compatible = "google,crosshatch", "qcom,sdm845";
>> +
>> +	battery: battery {
>> +		compatible = "simple-battery";
>> +
>> +		charge-full-design-microamp-hours = <3480000>;
>> +		voltage-min-design-microvolt = <3600000>;
>> +		voltage-max-design-microvolt = <4400000>;
>> +	};
>> +
>> +	chosen {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
> 
> These are all the same as the -blueline. Please move common options to
> the -common.dtsi
> 
>> +
>> +		/* for u-boot */
>> +		framebuffer: framebuffer@9d400000 {
>> +			compatible = "simple-framebuffer";
>> +			reg = <0 0x9d400000 0 (2960 * 1440 * 4)>;
>> +			width = <1440>;
>> +			height = <2960>;
>> +			stride = <(1440 * 4)>;
>> +			format = "a8r8g8b8";
>> +		};
>> +	};
>> +
>> +	reserved-memory {
>> +		framebuffer_region@9d400000 {
>> +			no-map;
>> +			reg = <0 0x9d400000 0 0x02400000>;
>> +		};
>> +	};
>> +};
>> +
>> +&gmu {
>> +	status = "okay";
>> +};
>> +
>> +&mdss {
> 
> More and more common properties. Please move them to the common file.
> 
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dsi0 {
>> +	vdda-supply = <&vdda_mipi_dsi0_1p2>;
>> +
>> +	status = "okay";
>> +
>> +	ports {
>> +		port@1 {
>> +			endpoint {
>> +				remote-endpoint = <&panel_in>;
>> +				data-lanes = <0 1 2 3>;
>> +				qcom,te-source = "mdp_vsync_e";
>> +			};
>> +		};
>> +	};
>> +
>> +	panel@0 {
>> +		compatible = "samsung,s6e3ha8";
>> +		reg = <0>;
>> +
>> +		vci-supply = <&vreg_l28a_3p0>; // downstream
>> +		vdd3-supply = <&vreg_l28a_3p0>;
>> +		vddr-supply = <&vreg_l14a_1p88>;
>> +
>> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&panel_reset_pins &panel_te_pin &se8_spiflash &panel_pmgpio_pins>;
> 
> - Why do you need spiflash here?
> - I don't think this uses pmgpios too.
> 
>> +
>> +		port {
>> +			panel_in: endpoint {
>> +				remote-endpoint = <&mdss_dsi0_out>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&mdss_dsi0_out {
>> +	data-lanes = <0 1 2 3>;
>> +	remote-endpoint = <&panel_in>;
>> +};
>> +
>> +&mdss_dsi0_phy {
>> +	vdds-supply = <&vdda_mipi_dsi0_pll>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pm8998_gpios {
>> +	panel_pmgpio_pins: panel-pmgpio-active-state {
>> +		pins = "gpio2", "gpio5";
>> +		function = "normal";
>> +		input-enable;
>> +		bias-disable;
>> +		power-source = <0>;
>> +	};
>> +};
>> +
>> +&tlmm {
>> +	se8_spiflash: se8-spiflash-state {
>> +		pins = "gpio65", "gpio66", "gpio67", "gpio68";
>> +		function = "gpio";
>> +		input-enable;
>> +		bias-disable;
>> +	};
>> +
>> +	panel_te_pin: panel-te-state {
>> +		pins = "gpio12";
>> +		function = "mdp_vsync";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +	};
>> +
>> +	panel_reset_pins: panel-active-state {
>> +		pins = "gpio6";
>> +		function = "gpio";
>> +		drive-strength = <8>;
>> +		bias-disable;
>> +	};
>> +
>> +	panel_suspend: panel-suspend-state {
>> +		pins = "gpio6";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +	};
>> +
>> +};
>>
>> -- 
>> 2.51.0
>>
>>
> 

-- 
David Heidelberg


