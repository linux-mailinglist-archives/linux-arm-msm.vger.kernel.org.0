Return-Path: <linux-arm-msm+bounces-75000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C26B9DF6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 910DB172DE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E176A26B96A;
	Thu, 25 Sep 2025 08:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UrjFwGpB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767E12638BC
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758787414; cv=none; b=dvsWoLe7jlMNE3VFRhkph8IAfKZ/exc3ItDDZGV7KC00Id+I3OFCt8t/53dlm3T/XgRS1aUhk2gUknTtmCF7QeoosMsrIN9W/hc6/Hc7YgOOiFT22ey+yzM3k1poOwEdrW6ptCCkiiqLG/VoEyNMoq4df1CNtSimqZkylMz9JOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758787414; c=relaxed/simple;
	bh=jEltFQ42JR5Tiw11SguWlT73xUCWlEeKZtlF/9z3KVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lieEUhUufgetYbItcJk3iOX8hm4AXeLQeFEK5jzVbbNlNmaeBcKoFB3I/ma8Oua9pLgh3EVJ36PX4vsSlR5RrCNQJ69yLZqjNeTAS2+gH3Rcotwgce2pLUE6JGiJ1tAC3E5Hel7pSDWeOzJ0aDjlVgw6Ey9bvozJEWRvA9XFxgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UrjFwGpB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3f2ae6fadb4so648847f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758787411; x=1759392211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yWIHF3DU27gvkMl3/FezhSEgHbB77on/ODMohejV3z0=;
        b=UrjFwGpBBPvTUnjgcRHYClwltHBNEmwsKlrca6OEAUlY8b5g44KTJL93I4Zd9lert2
         XG9rHSbya6ut3gYSR17WS0UUy8a0DokBCh8GUg8OIJ6lKaWIQvXhsT56bAXzLVF3X0sy
         V08njdg5XE6K/m/Hq9EvA+TQuuSHNFppq4edIYXZUtPWMXn7V+FrwCp3ytJEpbZf+zkW
         iTt9t0PHfrW2WR5eH1zBYjVRnY7x8VAnj9RL2LNky8TedxAgrtffyjNvCr9TMk3EWd7z
         yXu56XDmao/G725XmPsuqxEvcx6cneXix36pzJht4LUSMJyLf9N8Jqgm8xNjn3VZcB4T
         1rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758787411; x=1759392211;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yWIHF3DU27gvkMl3/FezhSEgHbB77on/ODMohejV3z0=;
        b=p6aBlFgx6yJ0cZPTr1Iq4FWv/mK1ippWxwWp2PhWtOYAFQH1fHZDaOH7N2koiZZ5jq
         4SA6wjN47P/dsBluS6F13QZzyj7UIQIJ/5sgj3rvJOtZH8YQSGslK2ZUp1+cGewaoOd4
         ZEjCMvQNcqXxEg9PqKdCBBZ3O0BiXohaGZ1FJV3cJRlx7TO2C3V4xWsTlXyvWdT/E0Kl
         T31c7C5ZxQ4NYUOilVp/Rm+wFxnBO4YHnUT1QIaqd9Hk9wVQvOjQkCtbCJkGP7scpYY8
         dNT46wzZl9Nm2k/tx5xuYKG5YS0HvhU5G/sWXjs3xC4oil9fLtlM4Ou8LmwUBgpc7g1J
         5qPA==
X-Gm-Message-State: AOJu0YzG1f4SjORs0xKZkZ0aGX7hV5g0yo6IbL5DdOSrAGShAx/VBJt6
	exegFN3ahHgX/mb2BPvLIOSYM1mzLD/pTerLqwdHWA7CcLGoftECN66zV5g4ph7ilAw=
X-Gm-Gg: ASbGncvvp9MrFOEh+BLe+oRn1J6XNPTCk+/oh8pLArX16Th1MCyxTyujKzGBIh3afxI
	/+pgOlz0tX/8/eeYupgz01QOEj+nRRUCaTJKdYE/snycMUcuMoKe8O4Fb+BCpPjrAmklgy3wWRV
	ysrT+gqcO4m730AysdcFSriksQAkNnx6/dnDl9wN9CRehStzPXeZ4gjhjyrcntkuO/f3tdUBAua
	/4O2KU3GbpfzYsPY8i/rbF8BeKY9GNnuDvLq51TA4PHUlb6Lux6e33vGL28y7EjFB9fK9nh6lAR
	kdLs8Zntzr6ZhoBz0FEpitBRoDCjbQNask/u1XYw22r069MAEtNNXpVmkI4czdCZsjDSpWI2Bkr
	y+1e675WIfW6ZLKDfIu8VlrOLut1L2Q==
X-Google-Smtp-Source: AGHT+IH7N0jdPd7FO1HjdmzREHhH0KvQufHfLlEkoa0bxYsRk5Zadh8sLeM7rRl98VvKhBFLaV1KzA==
X-Received: by 2002:a05:6000:400b:b0:3f9:7a96:5dc3 with SMTP id ffacd0b85a97d-40e451f9a3emr2633659f8f.24.1758787410695;
        Thu, 25 Sep 2025 01:03:30 -0700 (PDT)
Received: from [192.168.0.24] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc6921b7dsm1820146f8f.42.2025.09.25.01.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:03:30 -0700 (PDT)
Message-ID: <588a7b68-2e2e-4e65-9249-fe8b18b67927@linaro.org>
Date: Thu, 25 Sep 2025 11:03:28 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/20] arm64: dts: qcom: kaanapali-mtp: Enable more
 features
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-14-3fdbc4b9e1b1@oss.qualcomm.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-dts-v1-14-3fdbc4b9e1b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/25/25 03:17, Jingyi Wang wrote:
> Enable more features on Kaanapali MTP boards including PMIC peripherals,
> bus, SDHCI, remoteprocs, USB, PCIE, WLAN and Bluetooth.
> 
> Written with help from Jyothi Kumar Seerapu(added bus), Ronak Raheja
> (added USB), Manish Pandey(added SDHCI), Jishnu Prakash(added PMIC),
> Qiang Yu(added PCIE), Yijie Yang(Added WLAN) and Zijun Hu(Added Bluetooth).
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 663 +++++++++++++++++++++++++++++
>  1 file changed, 663 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index 9cf3158e2712..2949579481a9 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> @@ -5,9 +5,23 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "kaanapali.dtsi"
>  
> +#define PMH0110_D_E0_SID 3
> +#define PMH0110_F_E0_SID 5
> +#define PMH0110_G_E0_SID 6
> +#define PMH0110_I_E0_SID 8
> +#define PMH0104_J_E1_SID 9
> +
> +#include "pmk8850.dtsi"
> +#include "pmh0101.dtsi"
> +#include "pmh0110.dtsi"
> +#include "pmh0104.dtsi"
> +
>  / {
>  	model = "Qualcomm Technologies, Inc. Kaanapali MTP";
>  	compatible = "qcom,kaanapali-mtp", "qcom,kaanapali";
> @@ -15,6 +29,7 @@ / {
>  
>  	aliases {
>  		serial0 = &uart7;
> +		serial1 = &uart18;
>  	};
>  
>  	chosen {
> @@ -52,6 +67,304 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
>  			clock-div = <2>;
>  		};
>  	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&key_vol_up_default>;
> +		pinctrl-names = "default";
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};
> +
> +	thermal-zones {
> +		pmh0101-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmh0101_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pmh0104-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmh0104_j_e1_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pmh0110-d-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmh0110_d_e0_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pmh0110-f-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmh0110_f_e0_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pmh0110-g-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmh0110_g_e0_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pmh0110-i-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmh0110_i_e0_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pmd8028-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmd8028_temp_alarm>;
> +
> +			trips {
> +				pmd8028_trip0: trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				pmd8028_trip1: trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pmih0108-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmih0108_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pmr735d-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pmr735d_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pm8010-m-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pm8010_m_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +
> +		pm8010-n-thermal {
> +			polling-delay-passive = <100>;
> +
> +			thermal-sensors = <&pm8010_n_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";
> +				};
> +			};
> +		};
> +	};
> +
> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
> +		pinctrl-names = "default";
> +
> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&vreg_s2j_0p8>;
> +		vddio-supply = <&vreg_l2g_1p8>;
> +		vddio1p2-supply = <&vreg_l3g_1p2>;
> +		vddaon-supply = <&vreg_s7g_0p9>;
> +		vdddig-supply = <&vreg_s1j_0p8>;
> +		vddrfa1p2-supply = <&vreg_s7f_1p2>;
> +		vddrfa1p8-supply = <&vreg_s8f_1p8>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK1>;
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name = "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name = "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name = "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name = "vreg_pmu_btcmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name = "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name = "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p8: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p8";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name = "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name = "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
>  };
>  
>  &apps_rsc {
> @@ -674,6 +987,304 @@ vreg_l7n_3p3: ldo7 {
>  	};
>  };
>  
> +&pmh0110_d_e0 {
> +	status = "okay";
> +};
> +
> +&pmh0110_f_e0 {
> +	status = "okay";
> +};
> +
> +&pmh0110_g_e0 {
> +	status = "okay";
> +};
> +
> +&pmh0110_i_e0 {
> +	status = "okay";
> +};
> +
> +&spmi_bus1 {
> +	pmd8028: pmic@4 {
> +		compatible = "qcom,pmd8028", "qcom,spmi-pmic";
> +		reg = <0x4 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmd8028_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pmd8028_gpios: gpio@8800 {
> +			compatible = "qcom,pmd8028-gpio", "qcom,spmi-gpio";
> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pmd8028_gpios 0 0 4>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	pmih0108: pmic@7 {
> +		compatible = "qcom,pmih0108", "qcom,spmi-pmic";
> +		reg = <0x7 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmih0108_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x7 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pmih0108_gpios: gpio@8800 {
> +			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pmih0108_gpios 0 0 18>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		pmih0108_eusb2_repeater: phy@fd00 {
> +			compatible = "qcom,pm8550b-eusb2-repeater";
> +			reg = <0xfd00>;
> +			#phy-cells = <0>;
> +			vdd18-supply = <&vreg_l15b_1p8>;
> +			vdd3-supply = <&vreg_l5b_3p1>;
> +		};
> +	};
> +
> +	pmr735d: pmic@a {

Hi,

The PMR735D is available in pmr735d_a.dtsi

Can we find a way to reuse that include file instead of duplicating it
here ?

> +		compatible = "qcom,pmr735d", "qcom,spmi-pmic";
> +		reg = <0xa SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmr735d_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0xa 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pmr735d_gpios: gpio@8800 {
> +			compatible = "qcom,pmr735d-gpio", "qcom,spmi-gpio";
> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pmr735d_gpios 0 0 2>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +


[...]

