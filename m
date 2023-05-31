Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5C6717C54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 11:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235646AbjEaJqR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 05:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235640AbjEaJqG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 05:46:06 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3CC21A7
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:46:00 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f4f3ac389eso4997247e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685526359; x=1688118359;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KeKMgXql7ql60sDKHTqvKSs3ebCHMhojzfVGAX2K8GE=;
        b=FoVmTOAgp6T5gkATPaRJyRNOSadAhe/MdIXvljzX4RtAMH33yLiaP54nrXkiu0y+AY
         MGG2G1pKNcfkz5NZxCk1+1AAsf4Idxa9SkY1Hlu7MaJeYvbSmNWkZ8QR5llB7t0hQW3s
         fReyuwVt3bFjVGJA5g6RqFLh4WRixObyOLyXbbMi5iAOkFffzTDkiMoEESPAgiU0JnCu
         7ziDiEEUfK2b77ij+KYjrb/AQcvQNgrbRW1jQ1WQ4DJCinS/d1t/VlVNC8MCpEQrJZmI
         YW12Q3HZJgt1A4bn0iz2uXAQ1qW2AkQdOB+H5OPypQBaBRMuXoDyBPieRDFDseDVjMkX
         OrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685526359; x=1688118359;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KeKMgXql7ql60sDKHTqvKSs3ebCHMhojzfVGAX2K8GE=;
        b=YbPU9mUywyU0Vj93+sJL92S0WlMarseh4bi9mbhsQjtY0vV6Z5PSleIcOSQyLtUMGN
         LMkymYy0nMM14oE9givM/ZbYeWfCiSiHU4nUxcD99S9vk04OrvXJT26NtorQYqtJpnXb
         ptpQc/FEf8syeSHjtPCVgH0+8/jxKJwmsIhEn6Fc2glnnj08RL1yRu13ekEKOLwiUUQV
         rsCcR6yqSmswMyW21P2OSMscdZ5t0M8QoDo6OULc10lZst5hTNCHGQyjnl030T4RNr3u
         QTs8xxeG7HUOp3vZpFoVH3e08BAut7x26xeAwmLXwSqyVOXQnSoucLnhFnUwXilc/t73
         wKqg==
X-Gm-Message-State: AC+VfDw5+xxg62f5REjWVTsBBf/wlVz9fmJs4v19mBwZfLAfngZj3fxn
        KUneatZabKKz8SR0LK0DsX8omkb81tWsAO35F48=
X-Google-Smtp-Source: ACHHUZ7FOfl4NC7L1HNGisfimYqbvdbFlM6jtR+fZN/VcPWJOo6mPNK+YTuAeiuH+iBPaMFSsxQnIQ==
X-Received: by 2002:a19:f608:0:b0:4dd:9f86:859d with SMTP id x8-20020a19f608000000b004dd9f86859dmr2412784lfe.13.1685526358975;
        Wed, 31 May 2023 02:45:58 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id r10-20020a19ac4a000000b004f00c854d34sm648849lfc.204.2023.05.31.02.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:45:58 -0700 (PDT)
Message-ID: <cec5923a-d18d-0b07-604e-4468b23d8c13@linaro.org>
Date:   Wed, 31 May 2023 11:45:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 13/14] arm64: dts: qcom: msm8996: rename labels for HDMI
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
 <20230531011623.3808538-14-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531011623.3808538-14-dmitry.baryshkov@linaro.org>
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
> To keep all display-related nodes close in the board files, change HDMI
> node labels from hdmi_* to mdss_hdmi_*.
> 
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
> index b599909c4463..537547b97459 100644
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
> +	pinctrl-0 = <&mdss_hdmi_hpd_active &mdss_hdmi_ddc_active>;
> +	pinctrl-1 = <&mdss_hdmi_hpd_suspend &mdss_hdmi_ddc_suspend>;
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
> @@ -433,28 +433,28 @@ sdc2_cd_off: sdc2-cd-off-state {
>  		drive-strength = <2>;
>  	};
>  
> -	hdmi_hpd_active: hdmi-hpd-active-state {
> +	mdss_hdmi_hpd_active: mdss_hdmi-hpd-active-state {
>  		pins = "gpio34";
>  		function = "hdmi_hot";
>  		bias-pull-down;
>  		drive-strength = <16>;
>  	};
>  
> -	hdmi_hpd_suspend: hdmi-hpd-suspend-state {
> +	mdss_hdmi_hpd_suspend: mdss_hdmi-hpd-suspend-state {
>  		pins = "gpio34";
>  		function = "hdmi_hot";
>  		bias-pull-down;
>  		drive-strength = <2>;
>  	};
>  
> -	hdmi_ddc_active: hdmi-ddc-active-state {
> +	mdss_hdmi_ddc_active: mdss_hdmi-ddc-active-state {
>  		pins = "gpio32", "gpio33";
>  		function = "hdmi_ddc";
>  		drive-strength = <2>;
>  		bias-pull-up;
>  	};
>  
> -	hdmi_ddc_suspend: hdmi-ddc-suspend-state {
> +	mdss_hdmi_ddc_suspend: mdss_hdmi-ddc-suspend-state {
>  		pins = "gpio32", "gpio33";
>  		function = "hdmi_ddc";
>  		drive-strength = <2>;
> @@ -1043,7 +1043,7 @@ cpu {
>  		};
>  	};
>  
> -	hdmi-dai-link {
> +	mdss_hdmi-dai-link {
>  		link-name = "HDMI";
>  		cpu {
>  			sound-dai = <&q6afedai HDMI_RX>;
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
> index 3855366ca89f..0cb2d4f08c3a 100644
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
> @@ -1136,8 +1136,8 @@ mdss_dsi1_phy: phy@996400 {
>  				status = "disabled";
>  			};
>  
> -			hdmi: hdmi-tx@9a0000 {
> -				compatible = "qcom,hdmi-tx-8996";
> +			mdss_hdmi: mdss_hdmi-tx@9a0000 {
> +				compatible = "qcom,mdss_hdmi-tx-8996";
>  				reg =	<0x009a0000 0x50c>,
>  					<0x00070000 0x6158>,
>  					<0x009e0000 0xfff>;
> @@ -1160,7 +1160,7 @@ hdmi: hdmi-tx@9a0000 {
>  					"alt_iface",
>  					"extp";
>  
> -				phys = <&hdmi_phy>;
> +				phys = <&mdss_hdmi_phy>;
>  				#sound-dai-cells = <1>;
>  
>  				status = "disabled";
> @@ -1171,16 +1171,16 @@ ports {
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
> -				compatible = "qcom,hdmi-phy-8996";
> +				compatible = "qcom,mdss_hdmi-phy-8996";
>  				reg = <0x009a0600 0x1c4>,
>  				      <0x009a0a00 0x124>,
>  				      <0x009a0c00 0x124>,
