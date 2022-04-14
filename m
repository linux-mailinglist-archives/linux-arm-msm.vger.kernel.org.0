Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09D1C50078D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 09:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238430AbiDNHwB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 03:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237388AbiDNHwA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 03:52:00 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3080FD2B
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 00:49:35 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id u19so7674123lff.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 00:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=olsqjnfTW1Sapn7IlWji5fIBaB42c1CouCJ9BQCXslw=;
        b=pGwrytT8OWlmqDi7DCgWX76E/vuXFMW+0bGki7yD/NtDJYbt1y9CgBM8HD9ZitvBGh
         mNpUcXt/g6ymKqKdm62uqpGdzj1zHtVLEJymPhWe2pl8j1F6x6PFOdRMX9p1/XYrnI38
         MSKQ9NBD4DW9JRmnpyIPYwz7VMOWtaf0DIzTUcay07FhMqEY+HubSpWShNxLJBUKSVEL
         ansgT/AaNlL5JOeOLRoAMxvi8zLyPTBK7/5+Q4oO2mHzeTX9Lke8+4rF7DTommLoHTmg
         giqEaN6K9WPRvT03DjEWmu6p/dnCnbuTLdIn0n4smOxPk7zZ/OPYzdBl8BiHMax8djeC
         QJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=olsqjnfTW1Sapn7IlWji5fIBaB42c1CouCJ9BQCXslw=;
        b=3ssxeW+eDPTiKj72uxGDhwQgOkFKzuZS9bo4+oT2ck8USxECHps9C6jfG6i42LAGld
         s4Dh6bOKRp+MrU/qvsw7AHnFtdmUnBQT2XM4Fvr2dHAxwP67wsteueY1aEDV1d61KOy4
         /rcy2/XIBo8j9E3kdRaywIAKh8GpYniKbvz40MKU02kGjTOsScy+8cXHI4xXC8vTSuP/
         4MUrnyo6PqGgMzdZ8Pj+xmo0hUuVoHkrHvbhABlrV2fsIqpmVVo9j0rVSE/6JoGMlOCX
         PLqAld6UGIakyOP+XYCv7tnXLh80LmqcS4cGjmnSgYHSFbap3KbRPH2FVpel7Px/4Glu
         jTdw==
X-Gm-Message-State: AOAM531huIW8qJBGzzlbClVMli65JzwCjJsgxe3W7GzLNef91zKAm8I8
        w3a4Xakp8JFckpsoHwdR7UPAuw==
X-Google-Smtp-Source: ABdhPJz1d7r5W2/bnuL98bp+994FEgPdnuMBcjh1vqKEgavft7oGZ9DkOT94ljJL59tC7BZkqttzCg==
X-Received: by 2002:a05:6512:3995:b0:44a:e5c8:e696 with SMTP id j21-20020a056512399500b0044ae5c8e696mr1111511lfu.539.1649922574202;
        Thu, 14 Apr 2022 00:49:34 -0700 (PDT)
Received: from [192.168.1.102] (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id 6-20020ac24d46000000b0046bb728b873sm151672lfp.252.2022.04.14.00.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 00:49:33 -0700 (PDT)
Message-ID: <d6d49398-2b9e-863c-f343-d95580540151@linaro.org>
Date:   Thu, 14 Apr 2022 10:49:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8250: camss: Add CCI
 definitions
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, jonathan@marek.ca, hfink@snap.com,
        jgrahsl@snap.com
References: <20220413231736.991368-1-bryan.odonoghue@linaro.org>
 <20220413231736.991368-4-bryan.odonoghue@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220413231736.991368-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bryan,

On 4/14/22 02:17, Bryan O'Donoghue wrote:
> sm8250 has two CCI busses with two I2C busses apiece.
> 
> Co-developed-by: Julian Grahsl <jgrahsl@snap.com>
> Signed-off-by: Julian Grahsl <jgrahsl@snap.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 162 +++++++++++++++++++++++++++
>   1 file changed, 162 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index c69a8a88657a..a05ad923bcab 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3150,6 +3150,88 @@ videocc: clock-controller@abf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		cci0: cci@ac4f000 {
> +			compatible = "qcom,sm8250-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			reg = <0 0x0ac4f000 0 0x1000>;
> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc TITAN_TOP_GDSC>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK_SRC>;
> +			clock-names = "camnoc_axi",
> +				      "slow_ahb_src",
> +				      "cpas_ahb",
> +				      "cci",
> +				      "cci_src";
> +
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&cci0_default>;
> +			pinctrl-1 = <&cci0_sleep>;
> +

like as anywhere else it might be better to place 'pinctrl-names' after the
'pinctrl-*' properties.

> +			status = "disabled";
> +
> +			cci0_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci0_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		cci1: cci@ac50000 {
> +			compatible = "qcom,sm8250-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			reg = <0 0x0ac50000 0 0x1000>;
> +			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc TITAN_TOP_GDSC>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_1_CLK>,
> +				 <&camcc CAM_CC_CCI_1_CLK_SRC>;
> +			clock-names = "camnoc_axi",
> +				      "slow_ahb_src",
> +				      "cpas_ahb",
> +				      "cci",
> +				      "cci_src";
> +
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&cci1_default>;
> +			pinctrl-1 = <&cci1_sleep>;
> +
> +			status = "disabled";
> +
> +			cci1_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci1_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>   		camss: camss@ac6a000 {
>   			compatible = "qcom,sm8250-camss";
>   			status = "disabled";
> @@ -3687,6 +3769,86 @@ tlmm: pinctrl@f100000 {
>   			gpio-ranges = <&tlmm 0 0 181>;
>   			wakeup-parent = <&pdc>;
>   
> +			cci0_default: cci0-default {
> +				cci0_i2c0_default: cci0-i2c0-default {
> +					/* SDA, SCL */
> +					pins = "gpio101", "gpio102";
> +					function = "cci_i2c";
> +
> +					bias-pull-up;
> +					drive-strength = <2>; /* 2 mA */
> +				};
> +
> +				cci0_i2c1_default: cci0-i2c1-default {
> +					/* SDA, SCL */
> +					pins = "gpio103", "gpio104";
> +					function = "cci_i2c";
> +
> +					bias-pull-up;
> +					drive-strength = <2>; /* 2 mA */
> +				};
> +			};
> +
> +			cci0_sleep: cci0-sleep {
> +				cci0_i2c0_sleep: cci0-i2c0-sleep {
> +					/* SDA, SCL */
> +					pins = "gpio101", "gpio102";
> +					function = "cci_i2c";
> +
> +					drive-strength = <2>; /* 2 mA */
> +					bias-pull-down;
> +				};
> +
> +				cci0_i2c1_sleep: cci0-i2c1-sleep {
> +					/* SDA, SCL */
> +					pins = "gpio103", "gpio104";
> +					function = "cci_i2c";
> +
> +					drive-strength = <2>; /* 2 mA */
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci1_default: cci1-default {
> +				cci1_i2c0_default: cci1-i2c0-default {
> +					/* SDA, SCL */
> +					pins = "gpio105","gpio106";
> +					function = "cci_i2c";
> +
> +					bias-pull-up;
> +					drive-strength = <2>; /* 2 mA */
> +				};
> +
> +				cci1_i2c1_default: cci1-i2c1-default {
> +					/* SDA, SCL */
> +					pins = "gpio107","gpio108";
> +					function = "cci_i2c";
> +
> +					bias-pull-up;
> +					drive-strength = <2>; /* 2 mA */
> +				};
> +			};
> +
> +			cci1_sleep: cci1-sleep {
> +				cci1_i2c0_sleep: cci1-i2c0-sleep {
> +					/* SDA, SCL */
> +					pins = "gpio105","gpio106";
> +					function = "cci_i2c";
> +
> +					bias-pull-down;
> +					drive-strength = <2>; /* 2 mA */
> +				};
> +
> +				cci1_i2c1_sleep: cci1-i2c1-sleep {
> +					/* SDA, SCL */
> +					pins = "gpio107","gpio108";
> +					function = "cci_i2c";
> +
> +					bias-pull-down;
> +					drive-strength = <2>; /* 2 mA */
> +				};
> +			};
> +
>   			pri_mi2s_active: pri-mi2s-active {
>   				sclk {
>   					pins = "gpio138";

Please feel free to add my

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
