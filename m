Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1FFC73582A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 15:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbjFSNNY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 09:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbjFSNNT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 09:13:19 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F32E77
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 06:13:05 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f122ff663eso4352354e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687180383; x=1689772383;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9sxDSIL7GZ9OAaoOVzyS31RHHnvOcIEGTS2bA8kguuo=;
        b=zAqpB28y0ixaxjr+HA704nSnj6BTfULpOJdBaS+U9De9KtopTPfK0CIqnnX9WQfAaz
         uvn9nOuRrMOPQSoH0jQfR2k9VcEmhKmz0XvpJmS2BW3pEMhB5tYN9XnCg1DUD7HNsqdd
         +hCijSVqEfK+O8nS6VvDh8IWN0d604EWQ7pOL9lJr3QKjErc4Mv0pV2cRICzindGsNwN
         bJ/dYymC4zZb9YKKQqQbncuXhC5D5Sx6oCq7zSIEdAOHPsSEoarAmk6wQFFqGcbvVNYN
         s6UDdceqFypK8ZO6pnfy9K85cvueg8/6XRYBxwWvslgnq5zTng/ov3J+JZHsJ+AYAmea
         W+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180383; x=1689772383;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9sxDSIL7GZ9OAaoOVzyS31RHHnvOcIEGTS2bA8kguuo=;
        b=ataL0KaKlwrcrvLWa60aWqP1nLfynAlfQ+iVOS5ME1oUlISLvOUYz3t2IzS2MaZ6O8
         HYR6O4DtR435ILSG2yk5dQJ5/9KceB1WHjv/5Igq0TwdeteWX0R6uutp+UEGOWCRbo1R
         n3ZjYBkYZUR73ybbnThi4w7TYAGdwNicKWHZmSNmhpxtyNkSD0+aC8x9B5CxOT0qgbo1
         M0N/cJK0c3KG+o4dI261OKd4z3GAtVT8g0StV5WO0hIZdFPFWLExBw6Ai9QgPmK9fu4B
         jK8val8qm2/Zmj5xuseDwJwc9LruQzWidip9RRMyTW8s3znP2SYmvHJZx9HGgoEdyFtq
         JJ2A==
X-Gm-Message-State: AC+VfDybbeZEjCbVFYjbkcXEYyiyInsu90u9F4CFAl+BqpeiV5+JCdvp
        C5wx2TGqQc4g2FX9KWNELLoLCw==
X-Google-Smtp-Source: ACHHUZ6l4LFrEdTvnvsy6EDCAKifP6jzTi5tASLKjjmfW6h6bc4rypGf8AKJLP2RaFmERwdb80wbLQ==
X-Received: by 2002:a05:6512:60e:b0:4f8:67d7:8712 with SMTP id b14-20020a056512060e00b004f867d78712mr2549811lfe.54.1687180383696;
        Mon, 19 Jun 2023 06:13:03 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id b6-20020ac25e86000000b004f842e58d08sm1952901lfq.84.2023.06.19.06.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 06:13:03 -0700 (PDT)
Message-ID: <41cfcaea-e03f-6abc-6cb5-194eeefc12bd@linaro.org>
Date:   Mon, 19 Jun 2023 15:13:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 06/15] arm64: dts: qcom: msm8996-xiaomi: drop label from
 I2C
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
 <20230617171541.286957-6-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230617171541.286957-6-krzysztof.kozlowski@linaro.org>
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
> I2C controller bindings do not allow label property:
> 
>   msm8996-xiaomi-gemini.dtb: i2c@75b6000: Unevaluated properties are not allowed ('label' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
> index 47f55c7311e9..8c2d6e9e851b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
> @@ -187,7 +187,6 @@ &adsp_pil {
>  
>  &blsp2_i2c2 {
>  	status = "okay";
> -	label = "NFC_I2C";
>  	clock-frequency = <400000>;
>  
>  	nfc: pn548@28 {
> @@ -208,7 +207,6 @@ nfc: pn548@28 {
>  
>  &blsp2_i2c3 {
>  	status = "okay";
> -	label = "TYPEC_I2C";
>  
>  	typec: tusb320l@47 {
>  		compatible = "ti,tusb320l";
> @@ -220,7 +218,7 @@ typec: tusb320l@47 {
>  
>  &blsp2_i2c6 {
>  	status = "okay";
> -	label = "MSM_TS_I2C";
> +	/* MSM_TS */
>  };
>  
>  &blsp1_uart2 {
