Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5388F677B03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 13:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbjAWMdS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 07:33:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbjAWMdR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 07:33:17 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF98227AA
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:33:02 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id v6so30054808ejg.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OCd1S33ovW28wBSWBBfDm/MR3AJYFTT6NuAlOcVahx8=;
        b=VXtmIVHOYbxri3qpXiRLlYbTdJgjyTQgibMqoA2VWrwa/ZspAsL8KinbVkdpop35sa
         FLKj6peC+zlyV7aBavGt8DoPJGg8mCCFKWCm4azI3CU2OjzTtf1DZHNEOSgSAwMKF+2l
         CJeZ7l0uJRmtQV9wBGEAl8MHL7yZJSs5f3YEpWZGDpo3MoSDTJuNJLzG+kxqBEVnlAYt
         IDp2PyBRZjcuYpwHXLzTNwSbpxTsuPGNlhENZM+M4vKitA1l1sFXe4pTNu1I76NXdxy3
         Xu9HBbXQ4+VL1Nsl59llPOhMFmcGAZSItUlWG+Qp37IMDgARXW7RrW9AaxmmU8JCL2KO
         +aWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OCd1S33ovW28wBSWBBfDm/MR3AJYFTT6NuAlOcVahx8=;
        b=37WJw/vwjiNhW/DFaMECZLvqSiJklcUqojk9lIovgq1pj/ZrPCEDURRPqPIdMl5ak5
         LqPgcYokuu1Tw9p6SYcGyuJpywJRUo+peXDC3vO2t66Qk1ypIUsaHsyfuLpDgucvHqw8
         4Jwx0mLCkjilYAZet0XYYDLcPZPbfkXHuSY4ZatkOsoM/r/qzo9LgSGAD19s+3ekdGcO
         UIh7tZMixvMFqVbGpecm8Ycumfzib7chh7Gb93ZjajtOgg2DzlUxI+LjEr5smR+ngoQu
         t+TIiGLykG2E/m7D+myHMdaAVsevYAe7VESjsvR6JzLaJhbAbfwvXPv3iYeuyCAEJcIE
         y+fw==
X-Gm-Message-State: AFqh2kpUVuerdvJb72KLdqrbok5SWWXgylm0FRHvn+ahwrLUHpB5Sm+n
        Uy3EfMROapDy2Tk1CLoRrrwpBg==
X-Google-Smtp-Source: AMrXdXsWHBJ3tRyq25v2aWPtcq8Kdisi39ywd65Hhrb3Xf9D4nniiD4rw2KL+IUGf70LmsnhP3P3RQ==
X-Received: by 2002:a17:906:48cb:b0:86d:d334:b90b with SMTP id d11-20020a17090648cb00b0086dd334b90bmr25875846ejt.67.1674477181520;
        Mon, 23 Jan 2023 04:33:01 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id c23-20020a170906155700b0084c7f96d023sm22425847ejd.147.2023.01.23.04.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 04:33:01 -0800 (PST)
Message-ID: <e6de32cf-04f0-2d69-a725-3cd8991c4836@linaro.org>
Date:   Mon, 23 Jan 2023 13:32:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: fix USB-DP PHY resets
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230123101607.2413-1-johan+linaro@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230123101607.2413-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.01.2023 11:16, Johan Hovold wrote:
> The USB-DP PHY resets have been switched.
> 
> Fixes: 7f7e5c1b037f ("arm64: dts: qcom: sm8550: Add USB PHYs and controller nodes")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 6ff135191ee0..2f453dc00852 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2395,8 +2395,8 @@ usb_dp_qmpphy: phy@88e8000 {
>  
>  			power-domains = <&gcc USB3_PHY_GDSC>;
>  
> -			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
> -				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
>  			reset-names = "phy", "common";
>  
>  			#clock-cells = <1>;
