Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0AA5B3464
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 11:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231674AbiIIJqD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 05:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbiIIJp6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 05:45:58 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F396B6024
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 02:45:56 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id c11so1778074wrp.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 02:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=VpThbe8guKkTwpHrdYNBDJk5GWCovHFUSJ8RnnMnk6g=;
        b=Tn08c/5JrTkDYxf9JP+BQRqJAKtzTBpuTTVsrsWIfFmY3BKIup/asMRrLQSoChOYHp
         tNhuNH1d0f3+4ufoQZ/irHZNIpXh18tmWUHTRuV8lR7Hqb2BuTPDMM6+lpEQGxaxqt9j
         PIc0kk+FesFhVgmL091Fkdz4NQROCzjXAdHxdAJExzgjO21FFUwmSkHzysyhIXRyxOwR
         cwoSbhj2S74bTWf6SLGSMEWOHaTgLEDJKUDYLgmDWdwZXsdcc3PfB7iejktrwWceAf9f
         xyZ0l/7/sHQuIQvNk7rT78nRUAMWyV9M4xlwhnOax4HGvUpB46cCRWcck9Tb493iNgDz
         LsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=VpThbe8guKkTwpHrdYNBDJk5GWCovHFUSJ8RnnMnk6g=;
        b=FHdPsK9o7uvJMz3JM552TZt92ixFNwVTcmLuKm1K8Xmbu9UQeCoz8m/l/6i8r+Xj0X
         qjD7q75pGOHPowOzoK8i8668qU2gLkKvEt2Duin8mkoZgfDIXdLCrl5XnYQoeGSYdktm
         AnZ0E/ht0aVTuXIZ0Jgxxc6zzRXp2+kmCLbI3weFOIHYvSfKp4phTPQR8pZp+e2OxkS3
         lUzJy9jr75T8nrATN0zK/kvs7xcSB7kiL/yKeMRJaQHnCReBLJJ2+LfwHheEkCMECdD6
         7HNhykvMe91pgacAok2aEuDOVa2/dOWvzHVHdhY5sne6qagsIGcM9XVK5bdJL7tH1jKG
         mNRQ==
X-Gm-Message-State: ACgBeo27ZxYaaAzLQn9bayXXkS68To5OHIeSxWsSA/WoCk7l2aozHSTC
        qhDRsXMP9At0cG4+acfXEkkocw==
X-Google-Smtp-Source: AA6agR5w63EZsxEPD4It3zid2cpGCTqxvsFLMwsJC8Y+tyuxAZb7LkaKpwpIWBOYGI+L0ngJVJME7w==
X-Received: by 2002:a05:6000:10d2:b0:228:d60b:6d5a with SMTP id b18-20020a05600010d200b00228d60b6d5amr7168864wrx.146.1662716754958;
        Fri, 09 Sep 2022 02:45:54 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id k4-20020a5d4284000000b002286670bafasm82563wrq.48.2022.09.09.02.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 02:45:53 -0700 (PDT)
Message-ID: <1b4084bc-2ec6-e2fe-5a0c-40a3409b7b9b@linaro.org>
Date:   Fri, 9 Sep 2022 10:45:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/9] dt-bindings: nvmem: Add SoC compatible for sm6115
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20220903174150.3566935-1-iskren.chernev@gmail.com>
 <20220903174150.3566935-4-iskren.chernev@gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220903174150.3566935-4-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 03/09/2022 18:41, Iskren Chernev wrote:
> Document SoC compatible for sm6115.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---

Applied thanks,

--srini
>   Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index dede8892ee01..54053e16b8fd 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -26,6 +26,7 @@ properties:
>             - qcom,sc7180-qfprom
>             - qcom,sc7280-qfprom
>             - qcom,sdm845-qfprom
> +          - qcom,sm6115-qfprom
>         - const: qcom,qfprom
>   
>     reg:
