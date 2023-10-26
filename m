Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3CCD7D88E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 21:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjJZT0a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 15:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjJZT03 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 15:26:29 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FC7187
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:26:27 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso17742471fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 12:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698348385; x=1698953185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7cjXfkkkCl3s1zBhz3qj8DHb0D3ngX7M03neCeWeD+0=;
        b=BJNI2MON63PJV4D/zyQBMDXi2/BK78mzDsrpuEKVeKDHAjdF0t6GfnLqUyoqdoTsNr
         hOvvsGzLqWl2RvqxtNGJYKkbvnVGm43vQRzZMzOqfYXhM7g4vJgdZQR5XCDCz2a0Ennn
         lcfbvou1XU62XpvfmxiOj3i/VZ3aXgimjH9sUOmQd/TwZE87s/Kr0w3v9OvoFFIehA4J
         Iaai8Q5t2KuZ33nHEdaGt6mOPw9dgfP7wRqew32gYbYVzUhJh/3m1RbQn36PYHc0Yzbo
         /7Sl7w6WtboMajRRcoDC2QmQjAMpJSpKHFD5c1kY+cSBbKV2dCR6Q2/r3ay4WHIMzfjU
         C6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698348385; x=1698953185;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7cjXfkkkCl3s1zBhz3qj8DHb0D3ngX7M03neCeWeD+0=;
        b=DUGgOCqLul10+SRF5O5Pn5lHRFamAa/WhM0SxXt6eZnISSf5/p68k8tNMMzGVEr/Dx
         LqYUThLl0OUzMQN5ZjNDKBNWYmyQvAV2g/9+lO7T0MityDf7jV9cP9diaLERie6QiFwU
         BuaET60+TlCnZ7KJmMQ7uMAfwKCwV3sUvUvI0ywOdhgk1Oy+7JVNZLWFrscAg3G0Hqxj
         /e9l7fE11lxhieVeOOkrHID1bgT4V9823vuWTJuUJA2DFzBP/gh6LY3vuYJd8x5XnIYy
         RDRwEUZgctYnpawXgVwlRax5NKRi5ESzooJ3z1Z4TcNX3cJvRRsOSMYdgaHHjljTCZiF
         QQ8g==
X-Gm-Message-State: AOJu0Yx6vJN2olPQw8D41hR5sVzcPzz9x3G+FPV99prDWIOde2Bogw6s
        7VnmRI5uVBmBZpjkCAenrhtJXg==
X-Google-Smtp-Source: AGHT+IEXgc8T300bKYED2kMH96v9+ujZxBr8Js9yL/0eEdNxFUeYLKxp6QsAg+IUBTU9bUpe7WGd3Q==
X-Received: by 2002:a2e:9a91:0:b0:2c0:a99:68e7 with SMTP id p17-20020a2e9a91000000b002c00a9968e7mr471878lji.19.1698348385238;
        Thu, 26 Oct 2023 12:26:25 -0700 (PDT)
Received: from [172.30.204.229] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id j10-20020a2e3c0a000000b002b657f10b78sm2958829lja.58.2023.10.26.12.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 12:26:24 -0700 (PDT)
Message-ID: <af9f75e3-0b64-41b5-9854-c7edf544c9a0@linaro.org>
Date:   Thu, 26 Oct 2023 21:26:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: starqltechn: enable more
 features
Content-Language: en-US
To:     Dzmitry Sankouski <dsankouski@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20231024154338.407191-1-dsankouski@gmail.com>
 <20231024154338.407191-5-dsankouski@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231024154338.407191-5-dsankouski@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/24/23 17:43, Dzmitry Sankouski wrote:
> - enable usb 2.0
> - enable debug uart (uart9)
> - enable touchscreen
> - enable ipa so that we can bring up mobile data
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> 
> ---
> 
> Changes in v2:
> - hex to decimal in regulator values
> - fix dtb_check warnings
> 
>   .../dts/qcom/sdm845-samsung-starqltechn.dts   | 173 +++++++++++++++++-
>   1 file changed, 171 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index 6fc30fd1262b..f2bc3c412a2f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -11,11 +11,17 @@
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   #include "sdm845.dtsi"
>   
> +/delete-node/ &rmtfs_mem;
> +
>   / {
>   	chassis-type = "handset";
>   	model = "Samsung Galaxy S9 SM-G9600";
>   	compatible = "samsung,starqltechn", "qcom,sdm845";
>   
> +	aliases {
> +		serial0 = &uart9;
> +	};
> +
>   	chosen {
>   		#address-cells = <2>;
>   		#size-cells = <2>;
> @@ -68,6 +74,93 @@ memory@a1300000 {
>   			ftrace-size = <0x40000>;
>   			pmsg-size = <0x40000>;
>   		};
> +
> +		/* The rmtfs_mem needs to be guarded due to "XPU limitations"
> +		 * it is otherwise possible for an allocation adjacent to the
> +		 * rmtfs_mem region to trigger an XPU violation, causing a crash.
> +		 */
> +		rmtfs_lower_guard: memory@fde00000 {
> +			no-map;
> +			reg = <0 0xfde00000 0 0x1000>;
> +		};
> +
> +		rmtfs_mem: rmtfs-mem@fde01000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0 0xfde01000 0 0x200000>;
> +			no-map;
> +
> +			qcom,client-id = <1>;
> +			qcom,vmid = <15>;
> +		};
> +
> +		rmtfs_upper_guard: rmtfs-upper-guard@fe001000 {
> +			no-map;
> +			reg = <0 0xfe001000 0 0x1000>;
> +		};
> +
> +		/*
> +		 * It seems like reserving the old rmtfs_mem region is also needed to prevent
> +		 * random crashes which are most likely modem related, more testing needed.
> +		 */
> +		removed_region: removed-region@88f00000 {
> +			no-map;
> +			reg = <0 0x88f00000 0 0x1c00000>;
> +		};
> +	};
> +
> +	i2c@21 {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm 127 0x0>;
GPIO_ACTIVE_HIGH
> +		scl-gpios = <&tlmm 128 0x0>;
GPIO_ACTIVE_HIGH

> +		i2c-gpio,delay-us = <0x2>;
> +		#address-cells = <0x1>;
1

> +		#size-cells = <0x0>;
0

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&i2c21_sda_state &i2c21_scl_state>;
pinctrl-n
pinctrl-names

is prefered

and address/size-cells usually come as the last pair of properties

> +
> +		regulator@60 {
> +			compatible = "samsung,s2dos05";
> +			reg = <0x60>;
> +
> +			regulators {
> +				s2dos05_ldo1: s2dos05-ldo1 {
> +					regulator-name = "s2dos05-ldo1";
> +					regulator-min-microvolt = <1500000>;
> +					regulator-max-microvolt = <2000000>;
> +					regulator-active-discharge = <0x1>;
1

> +				};
> +
> +				s2dos05_ldo2: s2dos05-ldo2 {
> +					regulator-name = "s2dos05-ldo2";
> +					regulator-min-microvolt = <1800000>;
> +					regulator-max-microvolt = <1800000>;
> +					regulator-active-discharge = <0x1>;
1

> +					regulator-boot-on;
> +				};
> +
> +				s2dos05_ldo3: s2dos05-ldo3 {
> +					regulator-name = "s2dos05-ldo3";
> +					regulator-min-microvolt = <3000000>;
> +					regulator-max-microvolt = <3000000>;
> +					regulator-active-discharge = <0x1>;
1

> +					regulator-boot-on;
> +				};
> +
> +				s2dos05_ldo4: s2dos05-ldo4 {
> +					regulator-name = "s2dos05-ldo4";
> +					regulator-min-microvolt = <2700000>;
> +					regulator-max-microvolt = <3775000>;
> +					regulator-active-discharge = <0x1>;
1

> +				};
> +
> +				s2dos05_buck1: s2dos05-buck1 {
> +					regulator-name = "s2dos05-buck1";
> +					regulator-min-microvolt = <850000>;
> +					regulator-max-microvolt = <2100000>;
> +					regulator-active-discharge = <0x1>;
1

> +				};
> +			};
> +		};
>   	};
>   };
>   
> @@ -135,8 +228,6 @@ vdda_pll_cc_ebi23:
>   		vdda_sp_sensor:
>   		vdda_ufs1_core:
>   		vdda_ufs2_core:
> -		vdda_usb1_ss_core:
> -		vdda_usb2_ss_core:
>   		vreg_l1a_0p875: ldo1 {
>   			regulator-min-microvolt = <880000>;
>   			regulator-max-microvolt = <880000>;
> @@ -157,6 +248,7 @@ vreg_l3a_1p0: ldo3 {
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> +		vdda_usb1_ss_core:
>   		vdd_wcss_cx:
>   		vdd_wcss_mx:
>   		vdda_wcss_pll:
> @@ -365,6 +457,10 @@ &qupv3_id_1 {
>   	status = "okay";
>   };
>   
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
>   &uart9 {
>   	status = "okay";
>   };
> @@ -391,13 +487,50 @@ &sdhc_2 {
>   	status = "okay";
>   };
>   
> +&i2c11 {
> +	status = "okay";
> +	clock-frequency = <400000>;
status is preferred to come last

> +
> +	touchscreen@48 {
> +		compatible = "samsung,s6sy761";
> +		reg = <0x48>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <120 0x0>;
interrupts-extended with a fixed irq type (not _NONE)

> +		vdd-supply = <&s2dos05_ldo2>;
> +		avdd-supply = <&s2dos05_ldo3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&touch_irq_state>;
ditto

> +	};
> +};
> +
> +/* Modem/wifi*/
missing space before */

> +&mss_pil {
> +	status = "okay";
> +	firmware-name = "qcom/sdm845/starqltechn/mba.mbn", "qcom/sdm845/starqltechn/modem.mbn";
Can you split these into two lines?

> +};
> +
> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;
> +	firmware-name = "qcom/sdm845/starqltechn/ipa_fws.mbn";
> +	status = "okay";
> +};
> +
>   &usb_1 {
>   	status = "okay";
> +	/*
> +	 * disable USB3 clock requirement as the device only supports
> +	 * USB2.
> +	 */
Can this comment fit into a /* single line */?
> +	qcom,select-utmi-as-pipe-clk;
status is supposed to be last

>   };
>   
>   &usb_1_dwc3 {
>   	/* Until we have Type C hooked up we'll force this as peripheral. */
>   	dr_mode = "peripheral";
> +
> +	maximum-speed = "high-speed";
>   };
>   
>   &usb_1_hsphy {
> @@ -449,4 +582,40 @@ sd_card_det_n_state: sd-card-det-n-state {
>   		function = "gpio";
>   		bias-pull-up;
>   	};
> +
> +	i2c21_sda_state: i2c-sda-state {
> +		pins = "gpio127";
> +		function = "gpio";
> +		drive-strength = <0x2>;
2

> +		bias-disable;
> +	};
> +
> +	i2c21_scl_state: i2c-scl-state {
> +		pins = "gpio128";
> +		function = "gpio";
> +		drive-strength = <0x2>;
2

> +		bias-disable;
> +	};
> +
> +	touch_irq_state: touch-irq-state {
> +		pins = "gpio120";
> +		function = "gpio";
> +		bias-disable;
> +		output-disable;
> +	};
> +};
> +
> +&qup_uart9_tx {
> +	drive-strength = <0x2>;
2

> +	bias-pull-up;
> +};
> +
> +&qup_uart9_rx {
> +	drive-strength = <0x2>;
2

> +	bias-pull-up;
> +};
> +
> +&qup_i2c11_default {
> +	drive-strength = <2>;
like here

Konrad
