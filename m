Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 843CF7312AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 10:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239191AbjFOIuP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 04:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245398AbjFOIt1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 04:49:27 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B84032D47
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 01:48:52 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f841b7a697so847016e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 01:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686818931; x=1689410931;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i9RJcABEiqajm9VBwozxve8SX5lbpsVso0TV0ojwUBo=;
        b=SxbBKTBRtao5kvylhzMo4LLcFiyJBC8GGFvggpw8pZ9KYa7Z2291haSPLTtnBcPgb/
         uI2gcUDRC2SHPHmP4mb+IsLSo8xZnCn8lFiCAgsn+xtadcxHg7R9ZhgQhv1Z3AMkA3KX
         Vg2FNxvB/nCkwO6NpB/4tp/lVZsl9lumeMX7zP+rOIB7NTQPnYhwHmnVpisAoskHf5Jz
         Aux4NeNG3NoKltD6nVuTXIpHlAoTGg7pp4rxRi47nh4jsOo6sI0mQc5KodJU12LrHiiZ
         KmLbfA2CS7UmkcB5PXqArHozH146jUEa9OWbmxxidRVaug/jXYwJ4l322R/GyfXoiO7A
         RGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686818931; x=1689410931;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i9RJcABEiqajm9VBwozxve8SX5lbpsVso0TV0ojwUBo=;
        b=RI77ZVBZGU1Q3Uwzbdw+/HDH4DOLbEXKLK+xR5/E0OI3Gakjgmn2Wd1UYYLkVlNp37
         ZdY/pZLKRGoFaoV75sR0AIIkXZvCwsLDdBJ3EYrBFSRdaGf1KQO/PYPzr6BAyUJGD+ty
         raTL5x6wtMQYA/TEzufwFLVCl0SQePeiphrmyzDbyBAgTkWxEHRxDACD5mx/edrQLLyD
         kwJLQkotk9baJoAxLh1jA6M2kSEsVpgGOJ1MdlE4xZ0r0OMO+4Otms7ku0Plg12Dephn
         R24cmEOvfJqAL23oRHB2ecyzkTWxJpU1t8GHgN9p2JcuxDKNTuMZQOvFufohOeZNVlvw
         Mm6A==
X-Gm-Message-State: AC+VfDxZ63zy2lFhTE287PhsdoJDCxBGADd8hu6AaKmCMwPBVALbOpQd
        x3kufxe+2DkLgJDZ3iATO9VcN57TbWmkU4wx+Wc=
X-Google-Smtp-Source: ACHHUZ7VDdM4Xjh/drtknXKeZ53Z7X7RZ+yBhHDUNKAVGxGX3ZDAgHBLH/FRg7s/emy5325fRv30kA==
X-Received: by 2002:a19:e04a:0:b0:4f3:ab1b:f765 with SMTP id g10-20020a19e04a000000b004f3ab1bf765mr8901693lfj.18.1686818930950;
        Thu, 15 Jun 2023 01:48:50 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id p9-20020ac246c9000000b004f3880f900dsm2466499lfo.196.2023.06.15.01.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 01:48:50 -0700 (PDT)
Message-ID: <823af258-81a2-266b-010a-afdaddffb7e3@linaro.org>
Date:   Thu, 15 Jun 2023 10:48:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/2] Revert "arm64: dts: qcom: msm8996: rename labels for
 HDMI nodes"
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230615083422.350297-1-dmitry.baryshkov@linaro.org>
 <20230615083422.350297-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230615083422.350297-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15.06.2023 10:34, Dmitry Baryshkov wrote:
> The commit f43b6dc7d56e ("arm64: dts: qcom: msm8996: rename labels for
> HDMI nodes") is broken, it changes all the HDMI node names,
> compatible strings instead of changing just node aliases. Revert the
> commit in order to land a proper clean version.
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Fixes: f43b6dc7d56e ("arm64: dts: qcom: msm8996: rename labels for HDMI nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dts  | 50 ++++++++++----------
>  arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts |  6 +--
>  arch/arm64/boot/dts/qcom/msm8996-mtp.dts     |  4 +-
>  arch/arm64/boot/dts/qcom/msm8996.dtsi        | 16 +++----
>  4 files changed, 38 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> index 537547b97459..b599909c4463 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> @@ -208,6 +208,25 @@ &gpu {
>  	status = "okay";
>  };
>  
> +&hdmi {
> +	status = "okay";
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&hdmi_hpd_active &hdmi_ddc_active>;
> +	pinctrl-1 = <&hdmi_hpd_suspend &hdmi_ddc_suspend>;
> +
> +	core-vdda-supply = <&vreg_l12a_1p8>;
> +	core-vcc-supply = <&vreg_s4a_1p8>;
> +};
> +
> +&hdmi_phy {
> +	status = "okay";
> +
> +	vddio-supply = <&vreg_l12a_1p8>;
> +	vcca-supply = <&vreg_l28a_0p925>;
> +	#phy-cells = <0>;
> +};
> +
>  &hsusb_phy1 {
>  	status = "okay";
>  
> @@ -232,25 +251,6 @@ &mdss {
>  	status = "okay";
>  };
>  
> -&mdss_hdmi {
> -	status = "okay";
> -
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&mdss_hdmi_hpd_active &mdss_hdmi_ddc_active>;
> -	pinctrl-1 = <&mdss_hdmi_hpd_suspend &mdss_hdmi_ddc_suspend>;
> -
> -	core-vdda-supply = <&vreg_l12a_1p8>;
> -	core-vcc-supply = <&vreg_s4a_1p8>;
> -};
> -
> -&mdss_hdmi_phy {
> -	status = "okay";
> -
> -	vddio-supply = <&vreg_l12a_1p8>;
> -	vcca-supply = <&vreg_l28a_0p925>;
> -	#phy-cells = <0>;
> -};
> -
>  &mmcc {
>  	vdd-gfx-supply = <&vdd_gfx>;
>  };
> @@ -433,28 +433,28 @@ sdc2_cd_off: sdc2-cd-off-state {
>  		drive-strength = <2>;
>  	};
>  
> -	mdss_hdmi_hpd_active: mdss_hdmi-hpd-active-state {
> +	hdmi_hpd_active: hdmi-hpd-active-state {
>  		pins = "gpio34";
>  		function = "hdmi_hot";
>  		bias-pull-down;
>  		drive-strength = <16>;
>  	};
>  
> -	mdss_hdmi_hpd_suspend: mdss_hdmi-hpd-suspend-state {
> +	hdmi_hpd_suspend: hdmi-hpd-suspend-state {
>  		pins = "gpio34";
>  		function = "hdmi_hot";
>  		bias-pull-down;
>  		drive-strength = <2>;
>  	};
>  
> -	mdss_hdmi_ddc_active: mdss_hdmi-ddc-active-state {
> +	hdmi_ddc_active: hdmi-ddc-active-state {
>  		pins = "gpio32", "gpio33";
>  		function = "hdmi_ddc";
>  		drive-strength = <2>;
>  		bias-pull-up;
>  	};
>  
> -	mdss_hdmi_ddc_suspend: mdss_hdmi-ddc-suspend-state {
> +	hdmi_ddc_suspend: hdmi-ddc-suspend-state {
>  		pins = "gpio32", "gpio33";
>  		function = "hdmi_ddc";
>  		drive-strength = <2>;
> @@ -1043,7 +1043,7 @@ cpu {
>  		};
>  	};
>  
> -	mdss_hdmi-dai-link {
> +	hdmi-dai-link {
>  		link-name = "HDMI";
>  		cpu {
>  			sound-dai = <&q6afedai HDMI_RX>;
> @@ -1054,7 +1054,7 @@ platform {
>  		};
>  
>  		codec {
> -			sound-dai = <&mdss_hdmi 0>;
> +			sound-dai = <&hdmi 0>;
>  		};
>  	};
>  
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
> index ac6471d1db1f..ed2e2f6c6775 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
> @@ -92,15 +92,15 @@ &gpu {
>  	status = "okay";
>  };
>  
> -&mdss {
> +&hdmi {
>  	status = "okay";
>  };
>  
> -&mdss_hdmi {
> +&hdmi_phy {
>  	status = "okay";
>  };
>  
> -&mdss_hdmi_phy {
> +&mdss {
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-mtp.dts b/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
> index 495d45a16e63..596ad4c896f5 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
> @@ -24,10 +24,10 @@ &blsp2_uart2 {
>  	status = "okay";
>  };
>  
> -&mdss_hdmi {
> +&hdmi {
>  	status = "okay";
>  };
>  
> -&mdss_hdmi_phy {
> +&hdmi_phy {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 0cb2d4f08c3a..3855366ca89f 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -895,7 +895,7 @@ mmcc: clock-controller@8c0000 {
>  				 <&mdss_dsi0_phy 0>,
>  				 <&mdss_dsi1_phy 1>,
>  				 <&mdss_dsi1_phy 0>,
> -				 <&mdss_hdmi_phy>;
> +				 <&hdmi_phy>;
>  			clock-names = "xo",
>  				      "gpll0",
>  				      "gcc_mmss_noc_cfg_ahb_clk",
> @@ -980,7 +980,7 @@ ports {
>  					port@0 {
>  						reg = <0>;
>  						mdp5_intf3_out: endpoint {
> -							remote-endpoint = <&mdss_hdmi_in>;
> +							remote-endpoint = <&hdmi_in>;
>  						};
>  					};
>  
> @@ -1136,8 +1136,8 @@ mdss_dsi1_phy: phy@996400 {
>  				status = "disabled";
>  			};
>  
> -			mdss_hdmi: mdss_hdmi-tx@9a0000 {
> -				compatible = "qcom,mdss_hdmi-tx-8996";
> +			hdmi: hdmi-tx@9a0000 {
> +				compatible = "qcom,hdmi-tx-8996";
>  				reg =	<0x009a0000 0x50c>,
>  					<0x00070000 0x6158>,
>  					<0x009e0000 0xfff>;
> @@ -1160,7 +1160,7 @@ mdss_hdmi: mdss_hdmi-tx@9a0000 {
>  					"alt_iface",
>  					"extp";
>  
> -				phys = <&mdss_hdmi_phy>;
> +				phys = <&hdmi_phy>;
>  				#sound-dai-cells = <1>;
>  
>  				status = "disabled";
> @@ -1171,16 +1171,16 @@ ports {
>  
>  					port@0 {
>  						reg = <0>;
> -						mdss_hdmi_in: endpoint {
> +						hdmi_in: endpoint {
>  							remote-endpoint = <&mdp5_intf3_out>;
>  						};
>  					};
>  				};
>  			};
>  
> -			mdss_hdmi_phy: phy@9a0600 {
> +			hdmi_phy: phy@9a0600 {
>  				#phy-cells = <0>;
> -				compatible = "qcom,mdss_hdmi-phy-8996";
> +				compatible = "qcom,hdmi-phy-8996";
>  				reg = <0x009a0600 0x1c4>,
>  				      <0x009a0a00 0x124>,
>  				      <0x009a0c00 0x124>,
