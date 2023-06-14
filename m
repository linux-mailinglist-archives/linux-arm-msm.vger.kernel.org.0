Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A16273048F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 18:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjFNQGA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 12:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbjFNQF7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 12:05:59 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC5611FCA
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 09:05:57 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51496f57e59so9617142a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 09:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686758756; x=1689350756;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tBboY0bdYrdeQOHKC09XaZuxefgFR2fXkH5uFS/N1UM=;
        b=T9YRgaE3TfN/AeQZJiFg6Yuvsr5a9iZoRVG51qhPhFGE0a7pV4BoLDSY205XjZgpo9
         WSW1sBJJnHCzDV2YDNdzeFtfEdqfHNUlEKVSRcYOrv+LjRwAwI/Z8fcvi6Sqo4KktxE6
         ZslN1klEOjK2WilOFUtS63YxPYY5PXpqmM7UHsAcMEguGCeZxQUpJFwmjwQ5fnXIZwzx
         MKX1B0EP+dBt5S0B3v4eN32/aqaBOhW9YoO2ZtQF3GmiG0aY0NMjP9k3oyiuw6hfzX9K
         TXn4tlXSsg+F/jnBLJDerXWyh1mIlMefS64HJU1G93r2UxWo/LX3PMrGkI0wnbSfFRUC
         +whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686758756; x=1689350756;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tBboY0bdYrdeQOHKC09XaZuxefgFR2fXkH5uFS/N1UM=;
        b=goOg46rLoNA1IvJ46nO1YDaosZ42leCVrb+L2698LkTMrden3E7y542nq3CCA7iI5E
         Xs0pHYeJ+sxrVeq9PycfCrQJRaEZgHNkUBrK9QeygYvMADlWaiNAFwBVHOjboUT2u05h
         /ZrRvNIaM4yt8Jp9+FqxWehcmvdVB3f7aS3QPiyKftZ4ZBq5FKTzZVGy4opKZI3bclIb
         TZGMh8SePaZsvqneHrUPisuQ1orYBzjFXJA1it8K+EMZcYNKTXmdfw/pPcmOWIVvQvHF
         8jJOsFNfXMmJyZ2bKHBQcOBjTZ3wevUVa4iscs99SVgL+NMTpI8eGvnFWwlaMTkH3xto
         DXiA==
X-Gm-Message-State: AC+VfDyDItRYAtoBcS+ZoBe1uPywb5j9Uer9tqSWdnhdlaG0jU3reReK
        N/uiJxGuZWX/ZnsKRp59szpP6g==
X-Google-Smtp-Source: ACHHUZ6xxmoCev7+3moOInDw8sUm78Icrrw6bYb9TBUSDdgK8VTZNEi6AcPSCY8OEDpi+iU+SjvFqg==
X-Received: by 2002:a05:6402:1147:b0:50b:c085:1991 with SMTP id g7-20020a056402114700b0050bc0851991mr9018172edw.19.1686758756213;
        Wed, 14 Jun 2023 09:05:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id z4-20020aa7cf84000000b005187a57fba1sm1964383edx.77.2023.06.14.09.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 09:05:55 -0700 (PDT)
Message-ID: <e48f6153-0485-9fb9-5fe0-145251a8b367@linaro.org>
Date:   Wed, 14 Jun 2023 18:05:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/18] dt-bindings: soc: qcom: qcom,saw2: define optional
 regulator node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
References: <20230612053922.3284394-1-dmitry.baryshkov@linaro.org>
 <20230612053922.3284394-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230612053922.3284394-4-dmitry.baryshkov@linaro.org>
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

On 12/06/2023 07:39, Dmitry Baryshkov wrote:
> The SAW2 device can optionally provide a voltage regulator supplying the
> CPU core, cluster or L2 cache. Describe it in the device bindings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,saw2.yaml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
> index a016242367b9..b809a9cc0916 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
> @@ -47,6 +47,10 @@ properties:
>        - description: Base address and size of the alias register region
>      minItems: 1
>  
> +  regulator:
> +    $ref: /schemas/regulator/regulator.yaml#

There was such property in the binding (and DTS!) but a bool. Previous
patch silently dropped it, so re-introducing it with different type is
confusing.

Best regards,
Krzysztof

