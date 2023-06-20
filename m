Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5756737637
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 22:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbjFTUmR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 16:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbjFTUmQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 16:42:16 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33151125
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 13:42:15 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b4769a2ee5so43345311fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 13:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687293733; x=1689885733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1SlNItgKMhxIdAJOyMCl7jBbGZ0tV9Ya6lDxNumxzlQ=;
        b=Y6AWHH0TkQ75vfiwY0rg/MSSYtxn7ib7YMZcD99L3albtELrMpDTam2dD23cNyByht
         45i3DbjCMBuv74OkCr6LmkzYYnffllxo4V+ensnvdSlZBJDeyDaN+gh0ha3tA6PogyN+
         DUlK8IocoTO5eh1Bg79jQZJ3M44w9h8mkNHsQ505bcn8K7gQvSb4mliyqwcV6xqWTSHL
         VpfFx12nDQcSqiApPzDzVMsPULA/REIu9Q013cJ4WtVa/al0U4rGLXf4JoJyqazTnjk9
         WoMAajf/M7NlMoS9/18ZxieFfYzkBqpm98dLrl7gpzG9EpEqzTp9iGDZxE4+eZjgucTj
         axSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687293733; x=1689885733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1SlNItgKMhxIdAJOyMCl7jBbGZ0tV9Ya6lDxNumxzlQ=;
        b=SbqdBoyJa97bO2GLUQmeA4ROhibEMtolSvrYDoVgXU4kF9mPqER4ePlu5w3W/hDqEq
         F2Cz4hgJZeRBJGout2uls0KE0oux/Djng4J8zPyX8VeCiYsGhmWXf/Y0r4wsRYZ/eWtm
         VSH90MHeM+HrylRmy2heLplKkeM5eApwM9X3LfF9bIXpvWM8Dl9GzxQqgU4Wook4zVs4
         cPRmeQX/IOHuj6Tw42O+X2n8Yb8ryuVzDp48Wsa+Ggte70uuFdiZdXb7ujICesSGUI05
         L3wAa8Aexy6Phwr9uzUDjNQwj7//XfFIEs1GjNbVPnidZVASe03eUYOgv/80tmf0+skZ
         dnow==
X-Gm-Message-State: AC+VfDzUE5DijgUcSCNca6ftK0V1gtpgOT0mfaC+ijYayYvQJoGZvtvV
        uY+/4AhIGM+OkV8pYA+ACMcJPw==
X-Google-Smtp-Source: ACHHUZ6OR2bE6aOh0tQ6O8bGGdQg3XbqttHOm2XmDVyaVqQ4iYMwYBHZlLiNoaFlmGkOdraxczsxMw==
X-Received: by 2002:a2e:9cd1:0:b0:2b4:70c1:b484 with SMTP id g17-20020a2e9cd1000000b002b470c1b484mr5688644ljj.38.1687293733589;
        Tue, 20 Jun 2023 13:42:13 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id v20-20020a2e9254000000b002b46c473d0bsm573976ljg.20.2023.06.20.13.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 13:42:13 -0700 (PDT)
Message-ID: <8b8c35ba-e495-6363-e8fd-65e60bc6e879@linaro.org>
Date:   Tue, 20 Jun 2023 22:42:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp-crd: Fix naming of
 regulators
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230620203915.141337-1-quic_bjorande@quicinc.com>
 <20230620203915.141337-2-quic_bjorande@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230620203915.141337-2-quic_bjorande@quicinc.com>
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

On 20.06.2023 22:39, Bjorn Andersson wrote:
> The external regulators in the CRD seems to have inherited their names
> from the X13s DeviceTree, correct them.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
Please also update the node names to match.

Konrad
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> index b21b41a066b6..678cdf253f2e 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> @@ -133,7 +133,7 @@ vreg_edp_3p3: regulator-edp-3p3 {
>  	vreg_edp_bl: regulator-edp-bl {
>  		compatible = "regulator-fixed";
>  
> -		regulator-name = "VBL9";
> +		regulator-name = "VREG_EDP_BL";
>  		regulator-min-microvolt = <3600000>;
>  		regulator-max-microvolt = <3600000>;
>  
> @@ -149,7 +149,7 @@ vreg_edp_bl: regulator-edp-bl {
>  	vreg_nvme: regulator-nvme {
>  		compatible = "regulator-fixed";
>  
> -		regulator-name = "VCC3_SSD";
> +		regulator-name = "VREG_NVME_3P3";
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  
> @@ -163,7 +163,7 @@ vreg_nvme: regulator-nvme {
>  	vreg_misc_3p3: regulator-misc-3p3 {
>  		compatible = "regulator-fixed";
>  
> -		regulator-name = "VCC3B";
> +		regulator-name = "VREG_MISC_3P3";
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  
> @@ -180,7 +180,7 @@ vreg_misc_3p3: regulator-misc-3p3 {
>  	vreg_wlan: regulator-wlan {
>  		compatible = "regulator-fixed";
>  
> -		regulator-name = "VCC_WLAN_3R9";
> +		regulator-name = "VPH_PWR_WLAN";
>  		regulator-min-microvolt = <3900000>;
>  		regulator-max-microvolt = <3900000>;
>  
> @@ -196,7 +196,7 @@ vreg_wlan: regulator-wlan {
>  	vreg_wwan: regulator-wwan {
>  		compatible = "regulator-fixed";
>  
> -		regulator-name = "VCC3B_WAN";
> +		regulator-name = "SDX_VPH_PWR";
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  
