Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2A8717C40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 11:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235017AbjEaJnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 05:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234563AbjEaJnI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 05:43:08 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADCA2A0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:43:06 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f4f3ac389eso4993592e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685526185; x=1688118185;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NnqJ/1rjnZxah5wssNC0R+j2hgEZQJ6TEbYVEnfaT/E=;
        b=SGKfmsdNRUQsSQwkV09mPDovX/M7oNJIEJ57jjna5May0YhjSDOEGffmEOhA3QRXzT
         r+oErTU+FSDh5rvkHOxYIjup3+3cGRJ9zLZo/kQcYLj4T6eLbd0esbHcUcxEXO1eyMUr
         A8kR2N3hlvQ5FzWynvSLCxrlD+l/nITdMlr0KcXZmNj3DW/0rEyoLrrc3BoPwtf2z1On
         F8KeLDIftiHJC09hYHrmfx7p2WMUlV0u40KVUp+KfOIHOEpl6RS0EBIilLLKJ029tv3q
         vbXFL76RuZTCjv0PowsT//t/eFvAoQlmhOhsc+Ve+fgtTmusponHK38JLcDlwVVaeBdT
         bKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685526185; x=1688118185;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NnqJ/1rjnZxah5wssNC0R+j2hgEZQJ6TEbYVEnfaT/E=;
        b=ZQufVsNtQt+ORS0MBACB+QvJOYZ3QlCJS9f5G6+dORdq2vcGxgBpwbQuUzWQJV8qXO
         4MbUPQiowH41vQoNR89zL1LKlBmz8X06gJXiAkTwzNPEj8VCtBTNocu+KZ+nDopj/Kjn
         lOR2fyD8VMq9faZJzscko9HYe60m85y9OCQuELfr/FVeDGLXue2BAB7AoBnLQOrzdoPp
         FlMclQA6K4btWKhixB3j8VSb+cXFyF56a6ReuLiw0suNhZhQe8Ur0j57EL1eeW7SZXfR
         xXeznEpPAHY8R2WI8L+LmIKpVU58cj7nsP94BtWyl50KmKGiJcWgoGg695H1XBSE0/eR
         G+Yw==
X-Gm-Message-State: AC+VfDxlt7fO8StGcxYB3+nvuRKYQrFVNS9jsG1Vn/3UIJd5boEjcSDV
        qCvA1p7nMeI22UAM9NaSQ/cu/A==
X-Google-Smtp-Source: ACHHUZ4nnjfastYA/0yJRRlu1sKQDi6McEe6VfFKHQ01vBJu2Wu55ICmwdKdkyzJEy1lPsjHii/TQA==
X-Received: by 2002:a05:6512:3741:b0:4ec:8a12:9e70 with SMTP id a1-20020a056512374100b004ec8a129e70mr1914637lfs.46.1685526185043;
        Wed, 31 May 2023 02:43:05 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id o14-20020a056512050e00b004eff10511besm645404lfb.146.2023.05.31.02.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:43:04 -0700 (PDT)
Message-ID: <3d3f1b01-6ab8-d609-263f-38db8c3ea853@linaro.org>
Date:   Wed, 31 May 2023 11:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 09/14] arm64: dts: qcom: sc8180x: rename labels for DSI
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
 <20230531011623.3808538-10-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531011623.3808538-10-dmitry.baryshkov@linaro.org>
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
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> index e8613a00fcab..ef970c3479ca 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> @@ -2732,14 +2732,14 @@ dpu_intf0_out: endpoint {
>  					port@1 {
>  						reg = <1>;
>  						dpu_intf1_out: endpoint {
> -							remote-endpoint = <&dsi0_in>;
> +							remote-endpoint = <&mdss_dsi0_in>;
>  						};
>  					};
>  
>  					port@2 {
>  						reg = <2>;
>  						dpu_intf2_out: endpoint {
> -							remote-endpoint = <&dsi1_in>;
> +							remote-endpoint = <&mdss_dsi1_in>;
>  						};
>  					};
>  
> @@ -2783,7 +2783,7 @@ opp-460000000 {
>  				};
>  			};
>  
> -			dsi0: dsi@ae94000 {
> +			mdss_dsi0: dsi@ae94000 {
>  				compatible = "qcom,mdss-dsi-ctrl";
>  				reg = <0 0x0ae94000 0 0x400>;
>  				reg-names = "dsi_ctrl";
> @@ -2807,7 +2807,7 @@ dsi0: dsi@ae94000 {
>  				operating-points-v2 = <&dsi_opp_table>;
>  				power-domains = <&rpmhpd SC8180X_MMCX>;
>  
> -				phys = <&dsi0_phy>;
> +				phys = <&mdss_dsi0_phy>;
>  				phy-names = "dsi";
>  
>  				status = "disabled";
> @@ -2818,14 +2818,14 @@ ports {
>  
>  					port@0 {
>  						reg = <0>;
> -						dsi0_in: endpoint {
> +						mdss_dsi0_in: endpoint {
>  							remote-endpoint = <&dpu_intf1_out>;
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
> @@ -2850,7 +2850,7 @@ opp-358000000 {
>  				};
>  			};
>  
> -			dsi0_phy: dsi-phy@ae94400 {
> +			mdss_dsi0_phy: dsi-phy@ae94400 {
>  				compatible = "qcom,dsi-phy-7nm";
>  				reg = <0 0x0ae94400 0 0x200>,
>  				      <0 0x0ae94600 0 0x280>,
> @@ -2869,7 +2869,7 @@ dsi0_phy: dsi-phy@ae94400 {
>  				status = "disabled";
>  			};
>  
> -			dsi1: dsi@ae96000 {
> +			mdss_dsi1: dsi@ae96000 {
>  				compatible = "qcom,mdss-dsi-ctrl";
>  				reg = <0 0x0ae96000 0 0x400>;
>  				reg-names = "dsi_ctrl";
> @@ -2893,7 +2893,7 @@ dsi1: dsi@ae96000 {
>  				operating-points-v2 = <&dsi_opp_table>;
>  				power-domains = <&rpmhpd SC8180X_MMCX>;
>  
> -				phys = <&dsi1_phy>;
> +				phys = <&mdss_dsi1_phy>;
>  				phy-names = "dsi";
>  
>  				status = "disabled";
> @@ -2904,20 +2904,20 @@ ports {
>  
>  					port@0 {
>  						reg = <0>;
> -						dsi1_in: endpoint {
> +						mdss_dsi1_in: endpoint {
>  							remote-endpoint = <&dpu_intf2_out>;
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
> -			dsi1_phy: dsi-phy@ae96400 {
> +			mdss_dsi1_phy: dsi-phy@ae96400 {
>  				compatible = "qcom,dsi-phy-7nm";
>  				reg = <0 0x0ae96400 0 0x200>,
>  				      <0 0x0ae96600 0 0x280>,
