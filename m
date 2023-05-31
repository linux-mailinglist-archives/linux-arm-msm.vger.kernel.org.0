Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC1E1717C35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 11:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235596AbjEaJk7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 05:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235637AbjEaJki (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 05:40:38 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACCA1B5
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:40:29 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f4db9987f8so911494e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685526028; x=1688118028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7Iy/KBojBh14VYZt/7qS18IlDGSfG4NeXwkjul8LJ4=;
        b=icfOKIqDZQFwDO599JKupx5TKqnjn3n7PR9vwnFa1vQL0lhpZw6n/DdJlTgAhNQDKH
         biVczXTxp/BB3P57wAAO+608t331e/Ma0pdSr4XtJH56JSQjCuzWS+pKGQhc7s+f6dVl
         0MMjpNNEJur9A0bdCi59PYxztZHNaryXdrc/bnAghLBj0s7uOw+yylQMHIJJy2wBgnqx
         JH3BPvJV3Jhxu6pIeyWjl3oVi1S7t3lSRb0rkD/6nROHGoQisiogCGSPTYMzloGWk3iP
         H4tRMRAGSk9iH/a0H40xjuiCVBvOBHP3muTm2OaY2ceatZ/gRyWLoCXTyve55exM0Fxz
         UzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685526028; x=1688118028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7Iy/KBojBh14VYZt/7qS18IlDGSfG4NeXwkjul8LJ4=;
        b=DqmZiBPXs/00LchwJGvtn717lptsbQFyHE44UEWi5VLe2FM6X3SO3QrIhaPgslt1/K
         vnF8UgBgiRNJvoghcq4r42cBetbtGZsf5Qe0pCUNcbil7ZmRgKhU1/8sKVgpMWbGqpNR
         qAJjQAon4p6oUehry4MRikY+WInA0lLyYGwPE/IiqZtVFjkvFp8vSq5RTJxHgRRk0p8W
         wdWMs3jKI5lBHsKyNEYV1rSVo5uzYUhemZUqusol4ga06QVS2n6HYPgyKwnj9X27b6ga
         8l/WgCa9gx1xFw/nb8H9GUJSU9jFwwL+17TSDapiMVavchgSwnn7xDcP5KkYYqsY5sla
         hrYA==
X-Gm-Message-State: AC+VfDyZqNfEqIhu/PCiwd/rPQBZLvzRIzdHsJYWGwv5QIrbk3x86VCb
        IV43X3w6RwmoEwaIiyntwyt+qg==
X-Google-Smtp-Source: ACHHUZ7eHQXFp5p32DDvpvE+TeXsGE9Q6NpdoeOwc5ddRTh0Y588xNHMKimz0W7Dr4s00iU4zpFTTg==
X-Received: by 2002:ac2:4c32:0:b0:4f4:f4f3:5485 with SMTP id u18-20020ac24c32000000b004f4f4f35485mr1623286lfq.0.1685526028159;
        Wed, 31 May 2023 02:40:28 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id m3-20020a056512014300b004f517c21ef0sm285980lfo.82.2023.05.31.02.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:40:27 -0700 (PDT)
Message-ID: <54e83325-30ca-1373-cfeb-a876d0b6252c@linaro.org>
Date:   Wed, 31 May 2023 11:40:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 05/14] arm64: dts: qcom: msm8953: rename labels for DSI
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
 <20230531011623.3808538-6-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531011623.3808538-6-dmitry.baryshkov@linaro.org>
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
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 40 +++++++++++++--------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index 7d193a467819..b711cf9a6dc0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -766,10 +766,10 @@ gcc: clock-controller@1800000 {
>  			#power-domain-cells = <1>;
>  			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>  				 <&sleep_clk>,
> -				 <&dsi0_phy 1>,
> -				 <&dsi0_phy 0>,
> -				 <&dsi1_phy 1>,
> -				 <&dsi1_phy 0>;
> +				 <&mdss_dsi0_phy 1>,
> +				 <&mdss_dsi0_phy 0>,
> +				 <&mdss_dsi1_phy 1>,
> +				 <&mdss_dsi1_phy 0>;
>  			clock-names = "xo",
>  				      "sleep",
>  				      "dsi0pll",
> @@ -851,20 +851,20 @@ ports {
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
> -			dsi0: dsi@1a94000 {
> +			mdss_dsi0: dsi@1a94000 {
>  				compatible = "qcom,msm8953-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>  				reg = <0x01a94000 0x400>;
>  				reg-names = "dsi_ctrl";
> @@ -874,8 +874,8 @@ dsi0: dsi@1a94000 {
>  
>  				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
>  						  <&gcc PCLK0_CLK_SRC>;
> -				assigned-clock-parents = <&dsi0_phy 0>,
> -							 <&dsi0_phy 1>;
> +				assigned-clock-parents = <&mdss_dsi0_phy 0>,
> +							 <&mdss_dsi0_phy 1>;
>  
>  				clocks = <&gcc GCC_MDSS_MDP_CLK>,
>  					 <&gcc GCC_MDSS_AHB_CLK>,
> @@ -890,7 +890,7 @@ dsi0: dsi@1a94000 {
>  					      "pixel",
>  					      "core";
>  
> -				phys = <&dsi0_phy>;
> +				phys = <&mdss_dsi0_phy>;
>  
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> @@ -903,20 +903,20 @@ ports {
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
> -			dsi0_phy: phy@1a94400 {
> +			mdss_dsi0_phy: phy@1a94400 {
>  				compatible = "qcom,dsi-phy-14nm-8953";
>  				reg = <0x01a94400 0x100>,
>  				      <0x01a94500 0x300>,
> @@ -934,7 +934,7 @@ dsi0_phy: phy@1a94400 {
>  				status = "disabled";
>  			};
>  
> -			dsi1: dsi@1a96000 {
> +			mdss_dsi1: dsi@1a96000 {
>  				compatible = "qcom,msm8953-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>  				reg = <0x01a96000 0x400>;
>  				reg-names = "dsi_ctrl";
> @@ -944,8 +944,8 @@ dsi1: dsi@1a96000 {
>  
>  				assigned-clocks = <&gcc BYTE1_CLK_SRC>,
>  						  <&gcc PCLK1_CLK_SRC>;
> -				assigned-clock-parents = <&dsi1_phy 0>,
> -							 <&dsi1_phy 1>;
> +				assigned-clock-parents = <&mdss_dsi1_phy 0>,
> +							 <&mdss_dsi1_phy 1>;
>  
>  				clocks = <&gcc GCC_MDSS_MDP_CLK>,
>  					 <&gcc GCC_MDSS_AHB_CLK>,
> @@ -960,7 +960,7 @@ dsi1: dsi@1a96000 {
>  					      "pixel",
>  					      "core";
>  
> -				phys = <&dsi1_phy>;
> +				phys = <&mdss_dsi1_phy>;
>  
>  				status = "disabled";
>  
> @@ -970,20 +970,20 @@ ports {
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
> -			dsi1_phy: phy@1a96400 {
> +			mdss_dsi1_phy: phy@1a96400 {
>  				compatible = "qcom,dsi-phy-14nm-8953";
>  				reg = <0x01a96400 0x100>,
>  				      <0x01a96500 0x300>,
