Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D489373582E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 15:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbjFSNNi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 09:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbjFSNNY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 09:13:24 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0154D1712
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 06:13:13 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f86dbce369so1590453e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 06:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687180392; x=1689772392;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SBWCfFqNDKGVg94HXJT6gSxqKNoD/Te1pkBAZcRL/Cs=;
        b=tePHlu1fWyIDnoIPusTm/f8MnPriVjgCzzcT2SnEW1WPgOxnquJaSkhGOdT8URzYg8
         YjWSpuxc3QT4iPArwACm+NYzRs7b1wgKWZVNjWjE7UYu+P4EyvB/sVM9gijBQlSRF0qn
         AD2wnPpjXobDTdSFIliQ7B2RjLt9D0GJC51RlSJxVwM5YPVZ/xoMAhBRIxgBhbNFani3
         Vb5Tw+9Ia3R6xu3S/EgikJsCwqb5IF7fb2drdtiVth0MM8hs5zhkkgiVVoMCntLziOlc
         MWe4ipV0RYmZG4Q+jZXGddrT8fKr9TlOJHVGLKQ6XUP9gMcycG4V1cIBgUA10M+iNiBM
         jZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180392; x=1689772392;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SBWCfFqNDKGVg94HXJT6gSxqKNoD/Te1pkBAZcRL/Cs=;
        b=kobO4hjAOfwHn//+l8PXNmlkgrFpDve4DkaZRj0aifocMqp4paCy6Dpht0pQpYhph+
         FByATUtCFIZ8kE1xvXwbSwK7jHDQtdKwgXFdJv2qpX2FEbEge7cleQ5gtXDUYH2of2d9
         Xciy7DvGDWKyOw6bCnwMwtlWFx0VEm5RN5FYNDXynyD8iXeH6jjunJD7l68e3HL4565h
         T4/ASl5duDC6DrTfjBB4KYjz8c/BFoWRgbquE/mKVQXNL5v/dtomXTnfcdXS/qIIgBOx
         i3iYDpXzFyhOa/ekDv0cveSMkfGhZF3VpjDmf1O8jgDLy7HxYEx8+1krZ2yshag3o0mU
         mvAg==
X-Gm-Message-State: AC+VfDwyMs2k/PKZ95bVfvQgMDmL6bCV/x66UP4uQYEWJ29MufYJooAF
        Zx9VVlphh/kSCN7q98J69Gz2Sg==
X-Google-Smtp-Source: ACHHUZ7Brilr3tDLzkHrOAuNNw9ro2evfuJBsEXGMTuvCDgySoH9QYx1Ebq2bRMWOGNzdXvqVbNoNQ==
X-Received: by 2002:a19:7111:0:b0:4f3:9136:9cd0 with SMTP id m17-20020a197111000000b004f391369cd0mr5117423lfc.44.1687180391778;
        Mon, 19 Jun 2023 06:13:11 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id c11-20020ac2530b000000b004b4cbc942a3sm4273829lfh.127.2023.06.19.06.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 06:13:11 -0700 (PDT)
Message-ID: <c552c12a-7be3-3435-4513-1fc31f40e054@linaro.org>
Date:   Mon, 19 Jun 2023 15:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 07/15] arm64: dts: qcom: msm8996-xiaomi: use generic node
 names
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Nikita Travkin <nikita@trvn.ru>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230617171541.286957-1-krzysztof.kozlowski@linaro.org>
 <20230617171541.286957-7-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230617171541.286957-7-krzysztof.kozlowski@linaro.org>
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

On 17.06.2023 19:15, Krzysztof Kozlowski wrote:
> Use generic node names for I2C devices.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
> index 8c2d6e9e851b..bcd2397eb373 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
> @@ -189,7 +189,7 @@ &blsp2_i2c2 {
>  	status = "okay";
>  	clock-frequency = <400000>;
>  
> -	nfc: pn548@28 {
> +	nfc: nfc@28 {
>  		compatible = "nxp,nxp-nci-i2c";
>  
>  		reg = <0x28>;
> @@ -208,7 +208,7 @@ nfc: pn548@28 {
>  &blsp2_i2c3 {
>  	status = "okay";
>  
> -	typec: tusb320l@47 {
> +	typec: typec@47 {
>  		compatible = "ti,tusb320l";
>  		reg = <0x47>;
>  		interrupt-parent = <&tlmm>;
