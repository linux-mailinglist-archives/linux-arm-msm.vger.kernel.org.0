Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7783F717C45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 11:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235264AbjEaJni (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 05:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234454AbjEaJnh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 05:43:37 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C6DAD9
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:43:35 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2af1ae3a21fso60541771fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685526213; x=1688118213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cn2/3d22hfTJ2Ng6UionkIse0o+m+9T9vxOcYzMtQas=;
        b=aBFcFItYU9ptCtPvOtJzfhG1kEjQ0J++b3FafqvGxyfreNk6UXyU/yB33yIlbP60AT
         PYbVW0fbTvL/dwXzRD01Zp2AMeFhXOrUuAlWC1cZWAMgIt6wK/t2NlGRrwccw5C1I6FS
         CV4DDin5ARGjLUohVGM9mpTUv574GHArLX9ZJKeFFvgxTixo4IcPqWXcXB7NMACd/uQ/
         xMqBEzsu0aZk7WDi1AuaM7ZRwoHc0972ZGzNvoCFn97cWOfTXGKzDTj29kM1AMUGaQMk
         TopKakfqYn+JP5l93bymzk3z7UKTOTgAqdjKlBowMxIy/MCWBxSTG2qz7mi0WLYcWpPG
         +9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685526213; x=1688118213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cn2/3d22hfTJ2Ng6UionkIse0o+m+9T9vxOcYzMtQas=;
        b=gxaP60hDt/G+nr7GmyyG1/1VVhWjl2QXC0E2EO9EHToiEDiz9CSeWP3NE2qXAv3AuL
         6C9yH0b5zRbvs9SjgFk46TEF9/wgvnEFKkDCJORU89t5OQ8s2FD0Lc/njy8OHFzDQedd
         inCe+nixrYUcpCU9+egz3Djzqyry0R4e+R9rqwjNYcqZVEQkgvjcSx13Q/dsWystc3XO
         AwFf5fNwABSdDnK5TNqo6BzZVGnKFLdIUSNoCrSc0bykD0lLltPh5ShuQSohn8x16Iww
         TdqaGFFCh9QhhqgVydkW3SnitEUAjR95gnyNnO/VZOTuEbXjcyGL2LvlZ9sAdbbSaQ9S
         mfig==
X-Gm-Message-State: AC+VfDyJaowQAtWknOQE3wpU4wsCZFIXZTq4f1y95uxErNZzTxj5xLQk
        d1vOChHgEQjuUBP7fpq3IPsRIg==
X-Google-Smtp-Source: ACHHUZ663hQ61QGK8c361yT0zp5qh6WkLOD2zN3eHG1HUeUzHTJU8/ad4srRN1+30hIuObWgrL0mDw==
X-Received: by 2002:a2e:9f02:0:b0:2a7:653d:166c with SMTP id u2-20020a2e9f02000000b002a7653d166cmr2478947ljk.3.1685526213533;
        Wed, 31 May 2023 02:43:33 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id n10-20020a2e878a000000b002afd30401b0sm3234383lji.138.2023.05.31.02.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:43:33 -0700 (PDT)
Message-ID: <82a5aa82-835e-d22c-7a37-2673284252db@linaro.org>
Date:   Wed, 31 May 2023 11:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 10/14] arm64: dts: qcom: sdm630: rename labels for DSI
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
 <20230531011623.3808538-11-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531011623.3808538-11-dmitry.baryshkov@linaro.org>
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
>  .../boot/dts/qcom/sda660-inforce-ifc6560.dts  | 16 ++++++-------
>  arch/arm64/boot/dts/qcom/sdm630.dtsi          | 20 ++++++++--------
>  arch/arm64/boot/dts/qcom/sdm660.dtsi          | 24 +++++++++----------
>  3 files changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> index 7459525d9982..0b23d5bb3f26 100644
> --- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> +++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> @@ -134,7 +134,7 @@ port@0 {
>  				reg = <0>;
>  
>  				adv7533_in: endpoint {
> -					remote-endpoint = <&dsi0_out>;
> +					remote-endpoint = <&mdss_dsi0_out>;
>  				};
>  			};
>  
> @@ -183,25 +183,25 @@ bluetooth {
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
>  	vdda-supply = <&vreg_l1a_1p225>;
>  };
>  
> -&dsi0_out {
> +&mdss_dsi0_out {
>  	remote-endpoint = <&adv7533_in>;
>  	data-lanes = <0 1 2 3>;
>  };
>  
> -&dsi0_phy {
> +&mdss_dsi0_phy {
>  	status = "okay";
>  	vcca-supply = <&vreg_l1b_0p925>;
>  };
>  
> -&mdss {
> -	status = "okay";
> -};
> -
>  &mmss_smmu {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 897f2440c9c8..bba0f366ef03 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -1463,8 +1463,8 @@ mmcc: clock-controller@c8c0000 {
>  					<&sleep_clk>,
>  					<&gcc GCC_MMSS_GPLL0_CLK>,
>  					<&gcc GCC_MMSS_GPLL0_DIV_CLK>,
> -					<&dsi0_phy 1>,
> -					<&dsi0_phy 0>,
> +					<&mdss_dsi0_phy 1>,
> +					<&mdss_dsi0_phy 0>,
>  					<0>,
>  					<0>,
>  					<0>,
> @@ -1536,7 +1536,7 @@ ports {
>  					port@0 {
>  						reg = <0>;
>  						mdp5_intf1_out: endpoint {
> -							remote-endpoint = <&dsi0_in>;
> +							remote-endpoint = <&mdss_dsi0_in>;
>  						};
>  					};
>  				};
> @@ -1572,7 +1572,7 @@ opp-412500000 {
>  				};
>  			};
>  
> -			dsi0: dsi@c994000 {
> +			mdss_dsi0: dsi@c994000 {
>  				compatible = "qcom,sdm660-dsi-ctrl",
>  					     "qcom,mdss-dsi-ctrl";
>  				reg = <0x0c994000 0x400>;
> @@ -1586,8 +1586,8 @@ dsi0: dsi@c994000 {
>  
>  				assigned-clocks = <&mmcc BYTE0_CLK_SRC>,
>  						  <&mmcc PCLK0_CLK_SRC>;
> -				assigned-clock-parents = <&dsi0_phy 0>,
> -							 <&dsi0_phy 1>;
> +				assigned-clock-parents = <&mdss_dsi0_phy 0>,
> +							 <&mdss_dsi0_phy 1>;
>  
>  				clocks = <&mmcc MDSS_MDP_CLK>,
>  					 <&mmcc MDSS_BYTE0_CLK>,
> @@ -1608,7 +1608,7 @@ dsi0: dsi@c994000 {
>  					      "pixel",
>  					      "core";
>  
> -				phys = <&dsi0_phy>;
> +				phys = <&mdss_dsi0_phy>;
>  
>  				status = "disabled";
>  
> @@ -1618,20 +1618,20 @@ ports {
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
> -			dsi0_phy: phy@c994400 {
> +			mdss_dsi0_phy: phy@c994400 {
>  				compatible = "qcom,dsi-phy-14nm-660";
>  				reg = <0x0c994400 0x100>,
>  				      <0x0c994500 0x300>,
> diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> index f0f27fc12c18..f89b27c99f40 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> @@ -148,14 +148,14 @@ ports {
>  		port@1 {
>  			reg = <1>;
>  			mdp5_intf2_out: endpoint {
> -				remote-endpoint = <&dsi1_in>;
> +				remote-endpoint = <&mdss_dsi1_in>;
>  			};
>  		};
>  	};
>  };
>  
>  &mdss {
> -	dsi1: dsi@c996000 {
> +	mdss_dsi1: dsi@c996000 {
>  		compatible = "qcom,sdm660-dsi-ctrl",
>  			     "qcom,mdss-dsi-ctrl";
>  		reg = <0x0c996000 0x400>;
> @@ -170,8 +170,8 @@ dsi1: dsi@c996000 {
>  
>  		assigned-clocks = <&mmcc BYTE1_CLK_SRC>,
>  					<&mmcc PCLK1_CLK_SRC>;
> -		assigned-clock-parents = <&dsi1_phy 0>,
> -						<&dsi1_phy 1>;
> +		assigned-clock-parents = <&mdss_dsi1_phy 0>,
> +						<&mdss_dsi1_phy 1>;
>  
>  		clocks = <&mmcc MDSS_MDP_CLK>,
>  				<&mmcc MDSS_BYTE1_CLK>,
> @@ -192,7 +192,7 @@ dsi1: dsi@c996000 {
>  					"pixel",
>  					"core";
>  
> -		phys = <&dsi1_phy>;
> +		phys = <&mdss_dsi1_phy>;
>  
>  		status = "disabled";
>  
> @@ -202,20 +202,20 @@ ports {
>  
>  			port@0 {
>  				reg = <0>;
> -				dsi1_in: endpoint {
> +				mdss_dsi1_in: endpoint {
>  					remote-endpoint = <&mdp5_intf2_out>;
>  				};
>  			};
>  
>  			port@1 {
>  				reg = <1>;
> -				dsi1_out: endpoint {
> +				mdss_dsi1_out: endpoint {
>  				};
>  			};
>  		};
>  	};
>  
> -	dsi1_phy: phy@c996400 {
> +	mdss_dsi1_phy: phy@c996400 {
>  		compatible = "qcom,dsi-phy-14nm-660";
>  		reg = <0x0c996400 0x100>,
>  				<0x0c996500 0x300>,
> @@ -239,10 +239,10 @@ &mmcc {
>  			<&sleep_clk>,
>  			<&gcc GCC_MMSS_GPLL0_CLK>,
>  			<&gcc GCC_MMSS_GPLL0_DIV_CLK>,
> -			<&dsi0_phy 1>,
> -			<&dsi0_phy 0>,
> -			<&dsi1_phy 1>,
> -			<&dsi1_phy 0>,
> +			<&mdss_dsi0_phy 1>,
> +			<&mdss_dsi0_phy 0>,
> +			<&mdss_dsi1_phy 1>,
> +			<&mdss_dsi1_phy 0>,
>  			<0>,
>  			<0>;
>  };
