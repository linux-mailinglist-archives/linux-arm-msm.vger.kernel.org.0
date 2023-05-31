Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39BA6717C37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 11:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232588AbjEaJll (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 05:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235599AbjEaJlV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 05:41:21 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37E11B0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:41:07 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f3b9c88af8so6582765e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685526066; x=1688118066;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vYNMOWYbKNw0yXvHcDT9nnr9py/t5MpCsmiViSrTxk8=;
        b=bEM2J9vZkSqihNaIAQa0T8IH4y9POLxGbCo9i4jYzP+Xd6ft2iw+qB4ev3xcLAfx/G
         9kcFCetl0I2xEcqr2jcTPve5CPj/mczpC7AAiC1qkH+2pZt1E8VDr71ZW+4EpDMmvIIx
         L0BoKSL2hdk1Qcs96B49gY5ofCota4TEi4DVZbk0aIwNpVCpts2QNSLO+OokA1IK7XGQ
         bFXd18uf5PDXTjeOxSoi1emeb0fELQBd2mdYrJHkXx3XnBw9SJBarLQb1wQnc4+vazIW
         700K69Wn3gQrly4IAw5DAlMqxqBd6fctBXmwOCKubx9DiPDKD9Hao5BRUkB7qQEvuSIn
         qNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685526066; x=1688118066;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vYNMOWYbKNw0yXvHcDT9nnr9py/t5MpCsmiViSrTxk8=;
        b=FpMmdffIiJnac8564FFfBZHDh2hY+v3oYqB7Jvhr9AX0P11VShc+GXwL3z5TBemR5y
         UZThyDOXB2jKDRGJ7gaBDovGCPXkqgfzWrEARPNJ6SzUc++Hb4ISUpx5kSZaCiC1a8rd
         Vf0AJhlaFxQyHPMGkpLhPi0kHIqT5YGEg0/liGK8L4Sl865nVtfvkUJDQWVy0c6UOCJq
         twU12f/SpInMZx9MdSkkUSPVSFS5liQcIp6u//mVZmgpm6OHajIj+a10XGKW7GdjHynQ
         m1k9hEC1/vz4Yoxis+L9hzaVuqwjRAAzPKHu0TYGFYjGS8zOIu8oKgE9qxQbQN01R1aS
         ugTA==
X-Gm-Message-State: AC+VfDxEBRlff+9/wmRY/wOKTRe9l9vW/U6o23BJJ3f1Y/x3t/lp5XFk
        y/oo15XTX1G74PEEAIXLJJI7yw==
X-Google-Smtp-Source: ACHHUZ5J7PKy9yfHuT7Y19Hh9cipsNrjMR0axD0ThildBVPM9JuypUgwB00RFTO9JoXWMlcJoxD+3Q==
X-Received: by 2002:ac2:4c27:0:b0:4f2:53f6:d4bf with SMTP id u7-20020ac24c27000000b004f253f6d4bfmr2290430lfq.48.1685526065878;
        Wed, 31 May 2023 02:41:05 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id d27-20020ac24c9b000000b004f14dbc8989sm645470lfl.192.2023.05.31.02.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:41:05 -0700 (PDT)
Message-ID: <9afc0124-cb38-5621-7de3-0d8c51e70ce4@linaro.org>
Date:   Wed, 31 May 2023 11:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 06/14] arm64: dts: qcom: msm8996: rename labels for DSI
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
 <20230531011623.3808538-7-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531011623.3808538-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 31.05.2023 03:16, Dmitry Baryshkov wrote:
> Currently in board files MDSS and DSI nodes stay apart, because labels
> for DSI nodes do not have the mdss_ prefix. It was found that grouping
> all display-related notes is more useful.
> 
> To keep all display-related nodes close in the board files, change DSI
> node labels from dsi_* to mdss_dsi_*.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../boot/dts/qcom/msm8996-oneplus-common.dtsi | 30 ++++++++--------
>  .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  | 22 ++++++------
>  .../boot/dts/qcom/msm8996-xiaomi-gemini.dts   | 18 +++++-----
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         | 36 +++++++++----------
>  .../dts/qcom/msm8996pro-xiaomi-natrium.dts    | 18 +++++-----
>  5 files changed, 62 insertions(+), 62 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> index 2adadc1e5b7c..ec5457508fe6 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> @@ -164,21 +164,6 @@ &camss {
>  	vdda-supply = <&vreg_l2a_1p25>;
>  };
>  
> -&dsi0 {
> -	vdda-supply = <&vreg_l2a_1p25>;
> -	vcca-supply = <&vreg_l22a_3p0>;
> -	status = "okay";
> -};
> -
> -&dsi0_out {
> -	data-lanes = <0 1 2 3>;
> -};
> -
> -&dsi0_phy {
> -	vcca-supply = <&vreg_l28a_0p925>;
> -	status = "okay";
> -};
> -
>  &hsusb_phy1 {
>  	vdd-supply = <&vreg_l28a_0p925>;
>  	vdda-pll-supply = <&vreg_l12a_1p8>;
> @@ -201,6 +186,21 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l2a_1p25>;
> +	vcca-supply = <&vreg_l22a_3p0>;
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_out {
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vcca-supply = <&vreg_l28a_0p925>;
> +	status = "okay";
> +};
> +
>  &mmcc {
>  	vdd-gfx-supply = <&vdd_gfx>;
>  };
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
> index 1ce5df0a3405..47f55c7311e9 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
> @@ -235,7 +235,15 @@ bluetooth: bluetooth {
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
>  	vdd-supply = <&vreg_l2a_1p25>;
> @@ -246,26 +254,18 @@ &dsi0 {
>  	pinctrl-1 = <&mdss_dsi_sleep &mdss_te_sleep>;
>  };
>  
> -&dsi0_out {
> +&mdss_dsi0_out {
>  	status = "okay";
>  
>  	data-lanes = <0 1 2 3>;
>  };
>  
> -&dsi0_phy {
> +&mdss_dsi0_phy {
>  	status = "okay";
>  
>  	vcca-supply = <&vreg_l28a_0p925>;
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
>  &mmcc {
>  	vdd-gfx-supply = <&vdd_gfx>;
>  };
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
> index 100123d51494..bdedcf9dff03 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
> @@ -93,7 +93,13 @@ synaptics@20 {
>  
>  };
>  
> -&dsi0 {
> +&gpu {
> +	zap-shader {
> +		firmware-name = "qcom/msm8996/gemini/a530_zap.mbn";
> +	};
> +};
> +
> +&mdss_dsi0 {
>  	status = "okay";
>  
>  	vdd-supply = <&vreg_l2a_1p25>;
> @@ -112,22 +118,16 @@ panel: panel@0 {
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
>  };
>  
> -&gpu {
> -	zap-shader {
> -		firmware-name = "qcom/msm8996/gemini/a530_zap.mbn";
> -	};
> -};
> -
>  &pmi8994_wled {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index f75932cc2a30..3855366ca89f 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -891,10 +891,10 @@ mmcc: clock-controller@8c0000 {
>  			clocks = <&xo_board>,
>  				 <&gcc GPLL0>,
>  				 <&gcc GCC_MMSS_NOC_CFG_AHB_CLK>,
> -				 <&dsi0_phy 1>,
> -				 <&dsi0_phy 0>,
> -				 <&dsi1_phy 1>,
> -				 <&dsi1_phy 0>,
> +				 <&mdss_dsi0_phy 1>,
> +				 <&mdss_dsi0_phy 0>,
> +				 <&mdss_dsi1_phy 1>,
> +				 <&mdss_dsi1_phy 0>,
>  				 <&hdmi_phy>;
>  			clock-names = "xo",
>  				      "gpll0",
> @@ -987,20 +987,20 @@ mdp5_intf3_out: endpoint {
>  					port@1 {
>  						reg = <1>;
>  						mdp5_intf1_out: endpoint {
> -							remote-endpoint = <&dsi0_in>;
> +							remote-endpoint = <&mdss_dsi0_in>;
>  						};
>  					};
>  
>  					port@2 {
>  						reg = <2>;
>  						mdp5_intf2_out: endpoint {
> -							remote-endpoint = <&dsi1_in>;
> +							remote-endpoint = <&mdss_dsi1_in>;
>  						};
>  					};
>  				};
>  			};
>  
> -			dsi0: dsi@994000 {
> +			mdss_dsi0: dsi@994000 {
>  				compatible = "qcom,msm8996-dsi-ctrl",
>  					     "qcom,mdss-dsi-ctrl";
>  				reg = <0x00994000 0x400>;
> @@ -1024,9 +1024,9 @@ dsi0: dsi@994000 {
>  					      "pixel",
>  					      "core";
>  				assigned-clocks = <&mmcc BYTE0_CLK_SRC>, <&mmcc PCLK0_CLK_SRC>;
> -				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> +				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
>  
> -				phys = <&dsi0_phy>;
> +				phys = <&mdss_dsi0_phy>;
>  				status = "disabled";
>  
>  				#address-cells = <1>;
> @@ -1038,20 +1038,20 @@ ports {
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
> -			dsi0_phy: phy@994400 {
> +			mdss_dsi0_phy: phy@994400 {
>  				compatible = "qcom,dsi-phy-14nm";
>  				reg = <0x00994400 0x100>,
>  				      <0x00994500 0x300>,
> @@ -1068,7 +1068,7 @@ dsi0_phy: phy@994400 {
>  				status = "disabled";
>  			};
>  
> -			dsi1: dsi@996000 {
> +			mdss_dsi1: dsi@996000 {
>  				compatible = "qcom,msm8996-dsi-ctrl",
>  					     "qcom,mdss-dsi-ctrl";
>  				reg = <0x00996000 0x400>;
> @@ -1092,9 +1092,9 @@ dsi1: dsi@996000 {
>  					      "pixel",
>  					      "core";
>  				assigned-clocks = <&mmcc BYTE1_CLK_SRC>, <&mmcc PCLK1_CLK_SRC>;
> -				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
> +				assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
>  
> -				phys = <&dsi1_phy>;
> +				phys = <&mdss_dsi1_phy>;
>  				status = "disabled";
>  
>  				#address-cells = <1>;
> @@ -1106,20 +1106,20 @@ ports {
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
> -			dsi1_phy: phy@996400 {
> +			mdss_dsi1_phy: phy@996400 {
>  				compatible = "qcom,dsi-phy-14nm";
>  				reg = <0x00996400 0x100>,
>  				      <0x00996500 0x300>,
> diff --git a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
> index d18d0b0eda95..7957c8823f0d 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
> @@ -39,7 +39,13 @@ touchscreen@20 {
>  	};
>  };
>  
> -&dsi0 {
> +&gpu {
> +	zap-shader {
> +		firmware-name = "qcom/msm8996/natrium/a530_zap.mbn";
> +	};
> +};
> +
> +&mdss_dsi0 {
>  	status = "okay";
>  
>  	vdda-supply = <&vreg_l2a_1p25>;
> @@ -57,22 +63,16 @@ panel: panel@0 {
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
>  };
>  
> -&gpu {
> -	zap-shader {
> -		firmware-name = "qcom/msm8996/natrium/a530_zap.mbn";
> -	};
> -};
> -
>  &mss_pil {
>  	firmware-name = "qcom/msm8996/natrium/mba.mbn",
>  			"qcom/msm8996/natrium/modem.mbn";
