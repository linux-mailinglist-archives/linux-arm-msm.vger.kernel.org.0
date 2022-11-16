Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBCEF62BCA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbiKPLyB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:54:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232359AbiKPLx0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:53:26 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565E14387E
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:44:19 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id r12so29074706lfp.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rhkxa1BnRWWj45GOqN+hYkfIBY5C7zyuz6t5kZ6f2Eo=;
        b=MWW9HBXCHSPxeFAKGGxXleYbVa+tx8EcDs6ot7AklMwf69S2CJOHR/ZdTAcUolFRzQ
         cp/bb2fDvECLT0O99HvpNnUOi77FtFDxq27r5qPW7E3EIPvVI1HKm7OL67E//jsPtfIl
         vvQA1Piyb/l25nrNJLAAWmcFjUXVqllKZSM6Qk8Z8qcQuEdx6hngPJI3YtQukf54GJGo
         GbM2LmXap8ThHKxHr4aIgGosstmZH/sinLrFk5N+BJDvKJIc9o6gjz51szrGYt+jnZzr
         sK7c6RzSR+jXU0wJNVLLPb9yobXFdvRkv6UGTSYUZIFTk1hBfoofnF43TqlsgC19yFEe
         x1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhkxa1BnRWWj45GOqN+hYkfIBY5C7zyuz6t5kZ6f2Eo=;
        b=WLvrygHK3nYbuxpPEff80cJHkiksn0yeT2O8Ck/d9gOMUKczAp7C6YJNt+Va9EKgR6
         uJfb/csduBDBEqPHprKpfiE+J8IuUeptQ4VAnxmPCgpqb4EOsjq92uH8z6kGr5XcC8fV
         +EcLVIbfjmtb5JfrYh60rrmG9am3xcgOmIoNm4l0DKxXiB0ttv1ZOhQtyVkVh1LBAffY
         rtStFEn/Q7cLhHP9U8v8GE0Se9xzw060b61xqsmW1GxKV3hNs9ddgdmlGnOPpY1+pHWE
         gSwWul3PmJRRQrY+12jXaDYFZRsAPWbGdaMHLAFgvWzjlerPuXkBEMZ78386jhb0sCR+
         IXsA==
X-Gm-Message-State: ANoB5plyXZsEOVOqYS1X7oJv3Ar5EMTRc4206TtigroLUeKiYtokyWmR
        xo9/eH6clHjVJ1qwefmMADQlSQ==
X-Google-Smtp-Source: AA0mqf5FqZaeA5gMVK8IMJXojfeD1ykEZMAdHNylNYCrDuMgO8lLQS5s66dCO7D+o2bX/dDJjXB9pw==
X-Received: by 2002:a05:6512:e9a:b0:4b4:11c0:f572 with SMTP id bi26-20020a0565120e9a00b004b411c0f572mr6855777lfb.583.1668599057711;
        Wed, 16 Nov 2022 03:44:17 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v26-20020ac258fa000000b004a8b9c68728sm2566110lfo.105.2022.11.16.03.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 03:44:17 -0800 (PST)
Message-ID: <9c86ba22-fac8-ff9b-b0cc-86b48d4bcfe5@linaro.org>
Date:   Wed, 16 Nov 2022 12:44:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Add compatible for
 SM8550
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20221116113457.2660792-1-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116113457.2660792-1-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2022 12:34, Abel Vesa wrote:
> Document the compatible for SM8550 mailbox.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

