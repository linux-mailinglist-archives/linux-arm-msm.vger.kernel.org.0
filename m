Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF0D7312AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 10:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbjFOIuO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 04:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244824AbjFOIst (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 04:48:49 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47CE7213B
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 01:48:16 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b3424edd5fso23467421fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 01:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686818894; x=1689410894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mBJWWNfx3xej/MJ3DqUPuNzPsz1tH1F7iu3ScckwPzM=;
        b=iC/ceWUTSNdszGI7cJGxkGh8wT4APpus7ow8/++6qNhYXVgynN/3pWLN3Gt8ho+b/U
         r11rzuow4OAW0nhOQFscgGe+aYQYtL72CluJ0sOxpfMJRS6q49XzRMGqVLaCdA7ezWuo
         3V8CI92jbRjOg257TwXeIFLA8PAaCLuH+nHIThA8Dd89r596j1UkPiHHFUIINptMENeN
         ft+i4++imFj4FxF+b0cCY0y6WlPF3xgsiZa7ohwU3HaLOc04A1k7o3uw61JKPB11alDw
         RzGGkZxPgxMQk2SKbiU/+7E78GvonVSui5M8jDzXITtXvIfaRLbgeRfWqoIAdJneycpx
         ILxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686818894; x=1689410894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mBJWWNfx3xej/MJ3DqUPuNzPsz1tH1F7iu3ScckwPzM=;
        b=kEveDaOg7ZJ04yzIP8iJtoV0eukhcl6kEtrZN+tqMA40lgMrMgFTAXdiM1zMBhG2Sx
         UIV+gZwqTnwzvpgh7RxVtVRcPLQ+P6SsT72ENkb7Q2J2ac0ClY3s4QOaZLMTqlt18ovR
         ZC4sk/RSjXV+TbA4Tp3qlkzv66R2MAr6nxYJ+cN9OD6CXUZbF/Jbc+0Unwf4OpC02pY9
         hjWJ3VJ44MzRZrrwdRlT4Uo0Sd41diwwJfr85S0q5OZu5GBbxfgw3uii1PhLlvDycmbL
         4toeWEzDXUOKo15OgoSUkioc8BGM1IWX5T6Y1SroCTSbDH4C/o3YDmMA51KPmZEt+g7H
         HEfA==
X-Gm-Message-State: AC+VfDwx3UwhCocc1yHQJ/hwSyy8T7Lwx32UfaEwzey2pD6y0C58s1Lc
        UMt8Jq1GHraIUSNGJacKxbsC/Ew2z5sY646584s=
X-Google-Smtp-Source: ACHHUZ5JPVIhZ8cN1+ebbTISVtTjMskh1PISNVgpTsV2facOjMi7jCVYOGlRLPRc49gANtzP6wxFKA==
X-Received: by 2002:a2e:7203:0:b0:2aa:cb6c:d0dc with SMTP id n3-20020a2e7203000000b002aacb6cd0dcmr8322293ljc.29.1686818894438;
        Thu, 15 Jun 2023 01:48:14 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id w18-20020a2e9bd2000000b002a8a5afb87csm2990597ljj.20.2023.06.15.01.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 01:48:14 -0700 (PDT)
Message-ID: <383b6e03-c8f1-09ba-b6f4-da310ce5abe0@linaro.org>
Date:   Thu, 15 Jun 2023 10:48:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8996: rename labels for HDMI
 nodes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230615083422.350297-1-dmitry.baryshkov@linaro.org>
 <20230615083422.350297-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230615083422.350297-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15.06.2023 10:34, Dmitry Baryshkov wrote:
> In board files MDSS and HDMI nodes do not come next to each other,
> because labels for HDMI nodes do not have the common mdss_ prefix.
> 
> Follow the DSI example and enable such grouping by changing the prefix
> for HDMI labels to mdss_hdmi_*.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dts  | 40 ++++++++++----------
>  arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts |  6 +--
>  arch/arm64/boot/dts/qcom/msm8996-mtp.dts     |  4 +-
>  arch/arm64/boot/dts/qcom/msm8996.dtsi        | 12 +++---
>  4 files changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> index b599909c4463..39170c18c693 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> @@ -208,25 +208,6 @@ &gpu {
>  	status = "okay";
>  };
>  
> -&hdmi {
> -	status = "okay";
> -
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&hdmi_hpd_active &hdmi_ddc_active>;
> -	pinctrl-1 = <&hdmi_hpd_suspend &hdmi_ddc_suspend>;
> -
> -	core-vdda-supply = <&vreg_l12a_1p8>;
> -	core-vcc-supply = <&vreg_s4a_1p8>;
> -};
> -
> -&hdmi_phy {
> -	status = "okay";
> -
> -	vddio-supply = <&vreg_l12a_1p8>;
> -	vcca-supply = <&vreg_l28a_0p925>;
> -	#phy-cells = <0>;
> -};
> -
>  &hsusb_phy1 {
>  	status = "okay";
>  
> @@ -251,6 +232,25 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_hdmi {
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
> +&mdss_hdmi_phy {
> +	status = "okay";
> +
> +	vddio-supply = <&vreg_l12a_1p8>;
> +	vcca-supply = <&vreg_l28a_0p925>;
> +	#phy-cells = <0>;
> +};
> +
>  &mmcc {
>  	vdd-gfx-supply = <&vdd_gfx>;
>  };
> @@ -1054,7 +1054,7 @@ platform {
>  		};
>  
>  		codec {
> -			sound-dai = <&hdmi 0>;
> +			sound-dai = <&mdss_hdmi 0>;
>  		};
>  	};
>  
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
> index ed2e2f6c6775..ac6471d1db1f 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
> @@ -92,15 +92,15 @@ &gpu {
>  	status = "okay";
>  };
>  
> -&hdmi {
> +&mdss {
>  	status = "okay";
>  };
>  
> -&hdmi_phy {
> +&mdss_hdmi {
>  	status = "okay";
>  };
>  
> -&mdss {
> +&mdss_hdmi_phy {
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-mtp.dts b/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
> index 596ad4c896f5..495d45a16e63 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
> @@ -24,10 +24,10 @@ &blsp2_uart2 {
>  	status = "okay";
>  };
>  
> -&hdmi {
> +&mdss_hdmi {
>  	status = "okay";
>  };
>  
> -&hdmi_phy {
> +&mdss_hdmi_phy {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 3855366ca89f..40ac0a784a4a 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -895,7 +895,7 @@ mmcc: clock-controller@8c0000 {
>  				 <&mdss_dsi0_phy 0>,
>  				 <&mdss_dsi1_phy 1>,
>  				 <&mdss_dsi1_phy 0>,
> -				 <&hdmi_phy>;
> +				 <&mdss_hdmi_phy>;
>  			clock-names = "xo",
>  				      "gpll0",
>  				      "gcc_mmss_noc_cfg_ahb_clk",
> @@ -980,7 +980,7 @@ ports {
>  					port@0 {
>  						reg = <0>;
>  						mdp5_intf3_out: endpoint {
> -							remote-endpoint = <&hdmi_in>;
> +							remote-endpoint = <&mdss_hdmi_in>;
>  						};
>  					};
>  
> @@ -1136,7 +1136,7 @@ mdss_dsi1_phy: phy@996400 {
>  				status = "disabled";
>  			};
>  
> -			hdmi: hdmi-tx@9a0000 {
> +			mdss_hdmi: hdmi-tx@9a0000 {
>  				compatible = "qcom,hdmi-tx-8996";
>  				reg =	<0x009a0000 0x50c>,
>  					<0x00070000 0x6158>,
> @@ -1160,7 +1160,7 @@ hdmi: hdmi-tx@9a0000 {
>  					"alt_iface",
>  					"extp";
>  
> -				phys = <&hdmi_phy>;
> +				phys = <&mdss_hdmi_phy>;
>  				#sound-dai-cells = <1>;
>  
>  				status = "disabled";
> @@ -1171,14 +1171,14 @@ ports {
>  
>  					port@0 {
>  						reg = <0>;
> -						hdmi_in: endpoint {
> +						mdss_hdmi_in: endpoint {
>  							remote-endpoint = <&mdp5_intf3_out>;
>  						};
>  					};
>  				};
>  			};
>  
> -			hdmi_phy: phy@9a0600 {
> +			mdss_hdmi_phy: phy@9a0600 {
>  				#phy-cells = <0>;
>  				compatible = "qcom,hdmi-phy-8996";
>  				reg = <0x009a0600 0x1c4>,
