Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3744D735846
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 15:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbjFSNPl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 09:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbjFSNPi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 09:15:38 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE1AC10C6
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 06:15:25 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f7677a94d1so4417829e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 06:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687180524; x=1689772524;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+YPJOJ5L3MWjtCB52xk5eS93Th4XSUqSOIlj2WHBEhg=;
        b=iq8sowFVSy4KDw6h3muRTfFSZ3z1+ra1L9/ZoTYlF0Vk96QkWs2ZsmMXxmCLhWBDze
         +Oqu7YyGYHQEEVG/2BqhcrsZTOBxoCqr63OIBkrHSsFfeIc/EcxolgsMt012Io+3m4rO
         GINuLtNT/DdU0nbCztjvYc3ZVpxNWm5o6r45GO00tq2eCISt9+Ivbjw1iEgTdm70hDvt
         w9qdmHMr2wrjdZYKkZPZX+rFeagaXT74c7ZHJJeatWJzuwLZ/vlqHz3z69wQtu/GQfS4
         vGluoA7o6AZytjEH2UCB7hhBzWWBmd+kpnih7bZz8cLFl3MjQSqC204SEXIqH/0lVHLJ
         ACgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180524; x=1689772524;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+YPJOJ5L3MWjtCB52xk5eS93Th4XSUqSOIlj2WHBEhg=;
        b=kZqPDz9uDjeTMZXA1/TVtP7Ptv2Z6ZLUGRuKcjxNkbfl7vFa7QsxsdS+8EHpREHTFt
         UBUbS7MWCMr2Iy04MjXp5/jYg5xGRJfE2KFkao2TqDrry+I4VSXZdUcm7sPdJNUZsmbR
         tBs9swvlCbOheeTyIsbzXwwUOh4ra16k/ZkzUGCITc8CCGTaVM4j6CAxq+yucAYkUVCs
         6hUIK4x+2QjiAT6nOxHvrfxVS0XlrHveDItdAlAqpWnFulav9YVYYQa9IRNX2hj79jFC
         21SigfQdvR11qRtRgUn6BqJ7tZXK8m0wclWT2yDtuFiMEHuTxYIRyBowFNvkq7CWGzm5
         MitA==
X-Gm-Message-State: AC+VfDw6+bx1Ez4Y0gAdKgP/o+1TxBrQKhTc1Kul6Ij0MQ1gjP2OqMsx
        +cK4WkM1aW1vaoKJajB7i6hL4A==
X-Google-Smtp-Source: ACHHUZ5utYoup+Ru3jxjbU/d1HgktZx87yg0OGve+z9YKM8N7sciJtL0xT+3X6T8Y+h3ndNEw0MXng==
X-Received: by 2002:a19:6904:0:b0:4f8:5d0f:c779 with SMTP id e4-20020a196904000000b004f85d0fc779mr3007552lfc.40.1687180524080;
        Mon, 19 Jun 2023 06:15:24 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id r23-20020ac252b7000000b004f86d8a9320sm624246lfm.215.2023.06.19.06.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 06:15:23 -0700 (PDT)
Message-ID: <42be3b5f-3067-45f3-9487-1f81742a6607@linaro.org>
Date:   Mon, 19 Jun 2023 15:15:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 14/15] arm64: dts: qcom: sc8180x-flex-5g: align gpio-keys
 node name with bindings
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
 <20230617171541.286957-14-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230617171541.286957-14-krzysztof.kozlowski@linaro.org>
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
> Bindings except certain pattern for gpio-keys children:
> 
>   sc8180x-lenovo-flex-5g.dtb: gpio-keys: 'lid' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
> index 39c6ef0802aa..fca08db89769 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
> @@ -36,7 +36,7 @@ gpio-keys {
>  		pinctrl-0 = <&hall_int_active_state>;
>  		pinctrl-names = "default";
>  
> -		lid {
> +		lid-switch {
>  			gpios = <&tlmm 121 GPIO_ACTIVE_LOW>;
>  			linux,input-type = <EV_SW>;
>  			linux,code = <SW_LID>;
