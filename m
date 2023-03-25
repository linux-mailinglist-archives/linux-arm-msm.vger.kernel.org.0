Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09B656C8DBE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Mar 2023 13:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbjCYMDX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Mar 2023 08:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjCYMDW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Mar 2023 08:03:22 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42CE244B5
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 05:03:17 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id x20so4251679ljq.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 05:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679745795;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sHtrB6ODLvt68eh9gSE/iYNIvI2QI55H+clMuzIW/l4=;
        b=mP5dHu/1WDXSrlSN0caG1pcakHjBWqhyeyRcSBuTopUpQuE2Pjs8IMW2PpCfWA3i7F
         z+eIbyvT5PapDovcC+LDCevxrV8M7KPyFWVWLDBYjpc3ESi0Bkocouujd9DBHy3l8DkW
         cbvyXWlE4QaIPtlXM3VKLpiRZQI+0vgzyT1RWhen8mha7A5qRbtFKUIbSHAdpA+RZSmm
         GPTTLPhbuFwQ0ZhCNwgSXdrA4btRQ4gdkqsf7H6oUAQ6yhFN+ciWCsNZaWJhoqmpFXGf
         8ciQ5t75mGHcuskD8Ujr4Ov5sqvS84Yc+rlbND0zRHejt+oOJruWwhwVDY5LQI4Gug0U
         TkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679745795;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sHtrB6ODLvt68eh9gSE/iYNIvI2QI55H+clMuzIW/l4=;
        b=h12mDCzsCeeS0OgxewjmOO/6Dg1iBVzV/zipugNgHRIspaIkWAPyw0D03aX1Ol22Ej
         Dg7qavNv97RUBnkB/py0PjDklvB0Nvhl4SAXgPNE/bo6wy/Ix8PHLQSsj1L1dNr/8UBQ
         HOR1byBzTeZ/3DTSxtu/qxBhy78ubHQKce8pLMdm+yK4srkvL5CxN9rzsacgpkp8sTxt
         9++b5fLvVlq3Hz0sBlpTBQiQn+CitVre1Lr35pOUOowEJ3QXP5TGv7CKVLPYnmvgT95d
         UUsNFN3MKxMvZ2u/a2Zl0MynZ+xXf/yuUzIiyRgETBgUV1kut6aJowQuGcmk4p69oH8A
         bNRg==
X-Gm-Message-State: AAQBX9eb3hEobtUDuxvbU3YkwcwedojuxiRUs6FclzX1wJlgy0XHEE7y
        7Dc638aZ8oq8INt5xzVPlUy/cw==
X-Google-Smtp-Source: AKy350YDeHJ/F2M92otvKoJsM6r5peSUP/AF1DoC8ZKa+KRtDwiIuwY7wWdZ3cEHgUk0NlitnuSmCg==
X-Received: by 2002:a2e:90d4:0:b0:29e:896a:5cec with SMTP id o20-20020a2e90d4000000b0029e896a5cecmr1682308ljg.40.1679745795501;
        Sat, 25 Mar 2023 05:03:15 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id l6-20020a2ea306000000b002983bdf7d71sm3691800lje.106.2023.03.25.05.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 05:03:15 -0700 (PDT)
Message-ID: <7551a3f9-590d-0de7-a209-5a4d6bf3a2bd@linaro.org>
Date:   Sat, 25 Mar 2023 13:03:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/5] arm64: dts: qcom: apq8096-db820c: drop simple-bus
 from clocks
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230324202244.744271-1-krzysztof.kozlowski@linaro.org>
 <20230324202244.744271-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230324202244.744271-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 24.03.2023 21:22, Krzysztof Kozlowski wrote:
> 'clocks' node is not a bus, but just a placeholder for clocks:
> 
>   apq8096-db820c.dtb: clocks: $nodename:0: 'clocks' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>     From schema: dtschema/schemas/simple-bus.yaml
>   apq8096-db820c.dtb: clocks: xo-board: {'compatible': ['fixed-clock'], '#clock-cells': [[0]],  ...
>     From schema: dtschema/schemas/simple-bus.yaml
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> index 4476e2e22816..b599909c4463 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> @@ -63,7 +63,6 @@ chosen {
>  	};
>  
>  	clocks {
> -		compatible = "simple-bus";
>  		divclk4: divclk4 {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
