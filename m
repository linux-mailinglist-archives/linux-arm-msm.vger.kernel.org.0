Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8C5F5FFA16
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Oct 2022 15:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiJONAZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Oct 2022 09:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbiJONAY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Oct 2022 09:00:24 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA582D74D
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 06:00:21 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id r19so5292144qtx.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 06:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YzVFvoqPA8otoKfTTkSzo5O42ejeTslaNX3VpWD2aaU=;
        b=mLJCU69JHPINYeqEIAPtNr/qK1R54Q8SlRSUn7VGflw6i+u0BIdsTyCfyaaPMWvAL4
         ZA9xcVjh1/MUMBfXirJeSbVlbfBrsOUR0W7Ohv1jOLDMSlR6+vKp2JnMZTYAT0ZOuxNl
         akI5RcgwyxC8YloMc5rr40LYJDgbrxYkvAzk5GY7S8GVK3hkOy3wD6Udep/e12hapyDi
         Gvk+OB4yx3gDLxsgBFybo9WIbktw0O1EGYZwtocop6tI7MxRG61AP8QfSjBVegi/x5h+
         POKPUaYAjp78Iy6dDzRuPJhsUSLavftefrqrMypVFqIegE6wrbukKVrpuoXH2KcEmJwL
         9ujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzVFvoqPA8otoKfTTkSzo5O42ejeTslaNX3VpWD2aaU=;
        b=1ylMcJrS7V30OeMBh27ZVdAyvncOw+zXeTaeeQeKIlyY78oa+5IWD4AX47ozJMozEQ
         ENpVOJbME8o5Y1y3O4JeO+G/j+7YaTvGKQt15zBrQcH6nqKAcG0wT+Z3PcbUkVte+PQi
         4a6ie+7ogbVjobcpKBwWRgyAVLUaZ4xMXnZX9HBL8fiutaoSK8QAO2Bqdc2zrieAzfnM
         5QXx+WNEsRuKQ1VwK+ssa1a7rvrk02qCeP5d2YDBnGCaMpY37LXrzmToUYdLHj/2ahqk
         DkcRe+qSOJNkSFbp0zRDrKE2Q2scbind2CkxfjaU7uzccsQP/bJy8ZVvPh250Au43sn6
         +KDA==
X-Gm-Message-State: ACrzQf0WhwxB1gLQUJpvTODFNki3Ci3gVl1OToS8Zq2gCjFzC/tNFEnG
        7SIa/2OROodhd7aVOuSEPJYpiw==
X-Google-Smtp-Source: AMsMyM4MtkHVxQ/H6J+XcEyuC7jT+IeuyzzKHfpCjoFk7oA3Kb0GQocOfHKfvZta4G6dPITaxdmWqA==
X-Received: by 2002:a05:622a:1829:b0:35b:b542:b593 with SMTP id t41-20020a05622a182900b0035bb542b593mr1779181qtc.471.1665838820432;
        Sat, 15 Oct 2022 06:00:20 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:161:5720:79e9:9739? ([2601:42:0:3450:161:5720:79e9:9739])
        by smtp.gmail.com with ESMTPSA id u18-20020a05620a085200b006ce580c2663sm4609123qku.35.2022.10.15.06.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 06:00:19 -0700 (PDT)
Message-ID: <cd5fdffa-3408-3270-59d2-728fd67891ad@linaro.org>
Date:   Sat, 15 Oct 2022 09:00:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: arm,pl18x: Document
 interrupt-names is ignored
To:     Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Cc:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yann Gautier <yann.gautier@foss.st.com>,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20221013221242.218808-1-marex@denx.de>
 <cc7289ac-b75a-62e3-4b58-fc018715c068@linaro.org>
 <09cb3000-14c4-e94f-70e8-36e0ef8ce3fc@denx.de>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <09cb3000-14c4-e94f-70e8-36e0ef8ce3fc@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/10/2022 12:02, Marek Vasut wrote:
>>> ---
>>>   Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>>> index 1e69a5a42439b..1c96da04f0e53 100644
>>> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>>> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>>> @@ -95,7 +95,9 @@ properties:
>>>         PIO (polled I/O) interrupt and occurs when the FIFO needs to be
>>>         emptied as part of a bulk read from the card. Some variants have these
>>>         two interrupts wired into the same line (logic OR) and in that case
>>> -      only one interrupt may be provided.
>>> +      only one interrupt may be provided. The interrupt-names property is
>>> +      not used due to inconsistency of existing DTs regarding its content.
>>> +    deprecated: false
>>
>> Why do you add deprecated false? All properties are not deprecated by
>> default. Did any other referenced schema make it deprecated?
> 
> Rob asked me to add it in V1 .

Indeed, thanks.

Best regards,
Krzysztof

