Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADD3A6569DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 12:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbiL0LWc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 06:22:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbiL0LWY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 06:22:24 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4130F2DD3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 03:22:20 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id i19so562533ljg.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 03:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e5EFgYQntWNk0XeqnPs3OnLgENTqm+gZt7nu2kRdcTA=;
        b=DGiZSNV4OPpGVlQpParhlgaY49UGFCc3KdFDS8fD1BQcppfv54C3QOcjPS1B1zhUJv
         df3pGzJ3HI/3nGOAgH+IDAxmgCSm0g65v13U719KYuhvTfZGpM6VTxUC5Fr0SGdHIgVC
         2ywoCYNWdY8MPUwS0FDAYyorMrARxZM47qZPicsk/cNiABeaQyE26lNNxlHPb3Bt5KMJ
         rFpaLcQSpmG29yYgrdJ7r9ovhLsX2yYqwaEqdu5AG2lSdh366CUaUQznS0/rtQ97cU6U
         UwCupR9W+mwR0NSlFBdIh1CME9Q1+PMslyD1ojlqlhFcKMMxnc6QZdQg+lXDUjCmCz+s
         RF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e5EFgYQntWNk0XeqnPs3OnLgENTqm+gZt7nu2kRdcTA=;
        b=uN32iWAaJ0x3v8dVifGo5atuxI8Fi5CvWMeGaJy+OTmQAbmgccBnIDYoTLWICxhls4
         C6JMaZWwZor0n8ug6vAM39SsYaa/oW4jo6hCvBNT1Gt3MNSfD60ujiTXuKhIRoQmbSxP
         LwJWfHJ/WKNYbFrbUPf7qVYrSrh4uvEtKtExurVpMU9Lco1DKv5uYy+FI22KI7sg8j+q
         u+4lZiRL/LaylSQUQFmoZbOfmsorvVVm3zFezuFoQmgBWHxel6bkvZxZVmj6uELKOC0D
         9FGjrsC1zZUQ7X5m017Vb2wlDHWVB+5HscQPZ12s4vv9avw23rRguv7T7RXvXGietxrO
         fxZw==
X-Gm-Message-State: AFqh2kpxgiJDnSbyz9SgpR7VN/etup3/A1yrw+4uTSsfzLZFwFC1LEMI
        s5fvhKkRUmKkvog0P30JBbvl5A==
X-Google-Smtp-Source: AMrXdXs8D64HdRDszzjxWUfiS/tIjTaA7q/YbbZPLRp+mrkjB/y4RmPv0aIZHNfZJbz7lli16oqC8w==
X-Received: by 2002:a2e:9007:0:b0:27f:c11c:315e with SMTP id h7-20020a2e9007000000b0027fc11c315emr1536534ljg.31.1672140138622;
        Tue, 27 Dec 2022 03:22:18 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id i5-20020a2e8085000000b0027fcc99d7dfsm2660ljg.55.2022.12.27.03.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 03:22:18 -0800 (PST)
Message-ID: <c8f9d608-6fa6-48d0-5dc9-3daba9d96d66@linaro.org>
Date:   Tue, 27 Dec 2022 12:22:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 5/5] arm64: dts: qcom: use generic node name for CS35L41
 speaker
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221224154255.43499-1-krzysztof.kozlowski@linaro.org>
 <20221224154255.43499-5-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221224154255.43499-5-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 24.12.2022 16:42, Krzysztof Kozlowski wrote:
> Node names should be generic so use consistently speaker-amp for CS35L41
> speaker amplifier.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi    | 4 ++--
>  arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> index 09a31f707639..25c3e02f224b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> @@ -454,7 +454,7 @@ &i2c2 {
>  	status = "okay";
>  	clock-frequency = <1000000>;
>  
> -	cs35l41_l: cs35l41@40 {
> +	cs35l41_l: speaker-amp@40 {
>  		compatible = "cirrus,cs35l41";
>  		reg = <0x40>;
>  		interrupt-parent = <&tlmm>;
> @@ -469,7 +469,7 @@ cs35l41_l: cs35l41@40 {
>  		#sound-dai-cells = <1>;
>  	};
>  
> -	cs35l41_r: cs35l41@41 {
> +	cs35l41_r: speaker-amp@41 {
>  		compatible = "cirrus,cs35l41";
>  		reg = <0x41>;
>  		interrupt-parent = <&tlmm>;
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> index 1f2d660f8f86..4862fd69413e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
> @@ -461,7 +461,7 @@ &i2c11 {
>  	status = "okay";
>  	clock-frequency = <1000000>;
>  
> -	cs35l41_l: cs35l41@40 {
> +	cs35l41_l: speaker-amp@40 {
>  		compatible = "cirrus,cs35l41";
>  		reg = <0x40>;
>  		interrupt-parent = <&tlmm>;
> @@ -476,7 +476,7 @@ cs35l41_l: cs35l41@40 {
>  		#sound-dai-cells = <1>;
>  	};
>  
> -	cs35l41_r: cs35l41@41 {
> +	cs35l41_r: speaker-amp@41 {
>  		compatible = "cirrus,cs35l41";
>  		reg = <0x41>;
>  		interrupt-parent = <&tlmm>;
