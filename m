Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 849CC717C57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 11:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbjEaJq5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 05:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231981AbjEaJq4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 05:46:56 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E594E8
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:46:54 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f3baf04f0cso6322473e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685526413; x=1688118413;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iTEV1/JYGgrvuGZhmjMKnGLK6FtjMyR0jXXOjESNrZQ=;
        b=Dgu9yIwkQSujqK3cSEfA0ahs75nmxrD3xtu6wGT5H6XaHY5Bt5zH/qls/WA2Xe9N/I
         OgeA4WO0a1riCvQQxEdNVK2v5aMz0tPMYdYOBMapY78J5IpFsAy2VVslNd8jM2lVSvkd
         AnkSEWYBzzs3ran37mt4QLmWQLszVvcPfYXXvUOXCSY/hut0b6k5Lsqxz/85TYTxXJ78
         fVKVWLgydgaV2Oo3Wy33YkIFps4kl2DSaGYl0jDf9btFvPlyyP6xoJdpRxIFuHRir37i
         cYR4JjHQ3LZyDVozT8J/CzZjy+EoIoAT8RV18/hXdlwz3Yyb8jUvLAKEnqFZUBX/Reg/
         zqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685526413; x=1688118413;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iTEV1/JYGgrvuGZhmjMKnGLK6FtjMyR0jXXOjESNrZQ=;
        b=TqQdGVAF5lWgiDGigHkhtpUv/oyW/p/p1n6Cot4ofz8VMlOeKXRMIYpicMoc8fTD5z
         VCZ4ZSJTREUt91XtraxIuFeUIF/cV6ekmb6JhYnLP7RnbRe5oQ1Ka159dD7WPcnELYF/
         9PGFFtnQuMf2tOUr83N9ITuN1pbvvnKlf6UPbep/zzGJv84fvbE0E86em0uoyq8ESJ67
         wxMmjnoMynS/uWriRuXZHh/QJetLHvFEYp4R34ebvBIEdRoDFcFBus2Buf8/Fmsjs5Ce
         b2JUOgbHWutrIPrw0/FmKxzgZFBvWj2rJ0KW97EmZMLXNkicbGXi+1ndAetXahFdP5cj
         O4BA==
X-Gm-Message-State: AC+VfDxBachOTahtfDpSs46wgN89xdiJlTUEpG0+uVy3Mj0FfECZBCIs
        S7VYVODJgjQw/UGLgf8AU8EmbA==
X-Google-Smtp-Source: ACHHUZ5Hk6eMKLlLd8nDgdT1MeeWeDEoMiW8vkzeHnRBare346zvCLG0gH9OdV8dTvPNnvPQl4zdcA==
X-Received: by 2002:a19:c216:0:b0:4f1:4f26:738f with SMTP id l22-20020a19c216000000b004f14f26738fmr2249189lfc.19.1685526412851;
        Wed, 31 May 2023 02:46:52 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id v17-20020a056512049100b004f382ae9892sm647764lfq.247.2023.05.31.02.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:46:52 -0700 (PDT)
Message-ID: <26df196e-4960-353d-7449-57432d31dad2@linaro.org>
Date:   Wed, 31 May 2023 11:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 14/14] ARM: dts: qcom: msm8974: rename labels for DSI
 nodes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
 <20230531011623.3808538-15-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531011623.3808538-15-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 31.05.2023 03:16, Dmitry Baryshkov wrote:
> Currently in board files MDSS and HDMI nodes stay apart, because labels
> for HDMI nodes do not have the mdss_ prefix. It was found that grouping
> all display-related notes is more useful.
> 
> To keep all display-related nodes close in the board files, change DSI
> node aliases from dsi_* to mdss_dsi_*.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 24 ++++++-------
>  .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 16 ++++-----
>  arch/arm/boot/dts/qcom-msm8974.dtsi           | 36 +++++++++----------
>  .../boot/dts/qcom-msm8974pro-samsung-klte.dts | 24 ++++++-------
>  4 files changed, 50 insertions(+), 50 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> index 72f7e09a5bbf..72f6611bbe49 100644
> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> @@ -48,7 +48,15 @@ eeprom: eeprom@52 {
>  	};
>  };
>  
> -&dsi0 {
> +&gpu {
> +	status = "okay";
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
>  	vdda-supply = <&pm8941_l2>;
>  	vdd-supply = <&pm8941_l22>;
>  	vddio-supply = <&pm8941_l12>;
> @@ -65,31 +73,23 @@ panel: panel@0 {
>  
>  		port {
>  			panel_in: endpoint {
> -				remote-endpoint = <&dsi0_out>;
> +				remote-endpoint = <&mdss_dsi0_out>;
>  			};
>  		};
>  	};
>  };
>  
> -&dsi0_out {
> +&mdss_dsi0_out {
>  	remote-endpoint = <&panel_in>;
>  	data-lanes = <0 1 2 3>;
>  };
>  
> -&dsi0_phy {
> +&mdss_dsi0_phy {
>  	status = "okay";
>  
>  	vddio-supply = <&pm8941_l12>;
>  };
>  
> -&gpu {
> -	status = "okay";
> -};
> -
> -&mdss {
> -	status = "okay";
> -};
> -
>  &pm8941_wled {
>  	qcom,cs-out;
>  	qcom,switching-freq = <3200>;
> diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> index 205907c8670a..60bdfddeae69 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> @@ -230,7 +230,11 @@ bluetooth {
>  	};
>  };
>  
> -&dsi0 {
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
>  	status = "okay";
>  
>  	vdda-supply = <&pm8941_l2>;
> @@ -246,27 +250,23 @@ panel: panel@0 {
>  
>  		port {
>  			panel_in: endpoint {
> -				remote-endpoint = <&dsi0_out>;
> +				remote-endpoint = <&mdss_dsi0_out>;
>  			};
>  		};
>  	};
>  };
>  
> -&dsi0_out {
> +&mdss_dsi0_out {
>  	remote-endpoint = <&panel_in>;
>  	data-lanes = <0 1 2 3>;
>  };
>  
> -&dsi0_phy {
> +&mdss_dsi0_phy {
>  	status = "okay";
>  
>  	vddio-supply = <&pm8941_l12>;
>  };
>  
> -&mdss {
> -	status = "okay";
> -};
> -
>  &pm8941_gpios {
>  	gpio_keys_pin_a: gpio-keys-active-state {
>  		pins = "gpio2", "gpio3";
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 58e144957c5d..aeca504918a0 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1837,10 +1837,10 @@ mmcc: clock-controller@fd8c0000 {
>  				 <&gcc GPLL0_VOTE>,
>  				 <&gcc GPLL1_VOTE>,
>  				 <&rpmcc RPM_SMD_GFX3D_CLK_SRC>,
> -				 <&dsi0_phy 1>,
> -				 <&dsi0_phy 0>,
> -				 <&dsi1_phy 1>,
> -				 <&dsi1_phy 0>,
> +				 <&mdss_dsi0_phy 1>,
> +				 <&mdss_dsi0_phy 0>,
> +				 <&mdss_dsi1_phy 1>,
> +				 <&mdss_dsi1_phy 0>,
>  				 <0>,
>  				 <0>,
>  				 <0>;
> @@ -1905,20 +1905,20 @@ ports {
>  					port@0 {
>  						reg = <0>;
>  						mdp5_intf1_out: endpoint {
> -							remote-endpoint = <&dsi0_in>;
> +							remote-endpoint = <&mdss_dsi0_in>;
>  						};
>  					};
>  
>  					port@1 {
>  						reg = <1>;
>  						mdp5_intf2_out: endpoint {
> -							remote-endpoint = <&dsi1_in>;
> +							remote-endpoint = <&mdss_dsi1_in>;
>  						};
>  					};
>  				};
>  			};
>  
> -			dsi0: dsi@fd922800 {
> +			mdss_dsi0: dsi@fd922800 {
>  				compatible = "qcom,msm8974-dsi-ctrl",
>  					     "qcom,mdss-dsi-ctrl";
>  				reg = <0xfd922800 0x1f8>;
> @@ -1928,7 +1928,7 @@ dsi0: dsi@fd922800 {
>  				interrupts = <4>;
>  
>  				assigned-clocks = <&mmcc BYTE0_CLK_SRC>, <&mmcc PCLK0_CLK_SRC>;
> -				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> +				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
>  
>  				clocks = <&mmcc MDSS_MDP_CLK>,
>  					 <&mmcc MDSS_AHB_CLK>,
> @@ -1945,7 +1945,7 @@ dsi0: dsi@fd922800 {
>  					      "core",
>  					      "core_mmss";
>  
> -				phys = <&dsi0_phy>;
> +				phys = <&mdss_dsi0_phy>;
>  
>  				status = "disabled";
>  
> @@ -1958,20 +1958,20 @@ ports {
>  
>  					port@0 {
>  						reg = <0>;
> -						dsi0_in: endpoint {
> +						mdss_dsi0_in: endpoint {
>  							remote-endpoint = <&mdp5_intf1_out>;
>  						};
>  					};
>  
>  					port@1 {
>  						reg = <1>;
> -						dsi0_out: endpoint {
> +						mdss_dsi0_out: endpoint {
>  						};
>  					};
>  				};
>  			};
>  
> -			dsi0_phy: phy@fd922a00 {
> +			mdss_dsi0_phy: phy@fd922a00 {
>  				compatible = "qcom,dsi-phy-28nm-hpm";
>  				reg = <0xfd922a00 0xd4>,
>  				      <0xfd922b00 0x280>,
> @@ -1989,7 +1989,7 @@ dsi0_phy: phy@fd922a00 {
>  				status = "disabled";
>  			};
>  
> -			dsi1: dsi@fd922e00 {
> +			mdss_dsi1: dsi@fd922e00 {
>  				compatible = "qcom,msm8974-dsi-ctrl",
>  					     "qcom,mdss-dsi-ctrl";
>  				reg = <0xfd922e00 0x1f8>;
> @@ -1999,7 +1999,7 @@ dsi1: dsi@fd922e00 {
>  				interrupts = <4>;
>  
>  				assigned-clocks = <&mmcc BYTE1_CLK_SRC>, <&mmcc PCLK1_CLK_SRC>;
> -				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
> +				assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
>  
>  				clocks = <&mmcc MDSS_MDP_CLK>,
>  					 <&mmcc MDSS_AHB_CLK>,
> @@ -2016,7 +2016,7 @@ dsi1: dsi@fd922e00 {
>  					      "core",
>  					      "core_mmss";
>  
> -				phys = <&dsi1_phy>;
> +				phys = <&mdss_dsi1_phy>;
>  
>  				status = "disabled";
>  
> @@ -2029,20 +2029,20 @@ ports {
>  
>  					port@0 {
>  						reg = <0>;
> -						dsi1_in: endpoint {
> +						mdss_dsi1_in: endpoint {
>  							remote-endpoint = <&mdp5_intf2_out>;
>  						};
>  					};
>  
>  					port@1 {
>  						reg = <1>;
> -						dsi1_out: endpoint {
> +						mdss_dsi1_out: endpoint {
>  						};
>  					};
>  				};
>  			};
>  
> -			dsi1_phy: phy@fd923000 {
> +			mdss_dsi1_phy: phy@fd923000 {
>  				compatible = "qcom,dsi-phy-28nm-hpm";
>  				reg = <0xfd923000 0xd4>,
>  				      <0xfd923100 0x280>,
> diff --git a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
> index eb505d6d7f31..3e2c86591ee2 100644
> --- a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
> @@ -329,7 +329,15 @@ bluetooth {
>  	};
>  };
>  
> -&dsi0 {
> +&gpu {
> +	status = "okay";
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
>  	status = "okay";
>  
>  	vdda-supply = <&pma8084_l2>;
> @@ -351,31 +359,23 @@ panel: panel@0 {
>  
>  		port {
>  			panel_in: endpoint {
> -				remote-endpoint = <&dsi0_out>;
> +				remote-endpoint = <&mdss_dsi0_out>;
>  			};
>  		};
>  	};
>  };
>  
> -&dsi0_out {
> +&mdss_dsi0_out {
>  	remote-endpoint = <&panel_in>;
>  	data-lanes = <0 1 2 3>;
>  };
>  
> -&dsi0_phy {
> +&mdss_dsi0_phy {
>  	status = "okay";
>  
>  	vddio-supply = <&pma8084_l12>;
>  };
>  
> -&gpu {
> -	status = "okay";
> -};
> -
> -&mdss {
> -	status = "okay";
> -};
> -
>  &pma8084_gpios {
>  	gpio_keys_pin_a: gpio-keys-active-state {
>  		pins = "gpio2", "gpio3", "gpio5";
