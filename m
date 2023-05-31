Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98889718807
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 19:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbjEaRFi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 13:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbjEaRFe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 13:05:34 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 258F019B
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 10:05:14 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2af2e1725bdso15974101fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 10:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685552708; x=1688144708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjHfNn96o09ujq49twnbOyS7k4yu4ycZG77+8eeKj3w=;
        b=BUbJeARTDHVcNqtk4Mk4rNIiLV1ECybQfKHTZ3clfEdZ3j2vELQLf7bEWqbay2M2zh
         y5S2amxX2y0tsjb6XQxNPlaXW9jR/1N8/6WI3wQ1Mg7oSX42/Rm9UUbtzaQurHFkNnqB
         /kfjBa8lY3IOBen+s6am3G93I3OMgmpIc00tiH/7/GBv96HtSgm4AKLLp2BfhJrIq17/
         wwNh/iCPTUqzdPhLREl7SqaGsDC22rITFzaEM+R1p2NRefF3fZyH9rNfjq7pfIZW2JKe
         RMY+CHRFsgrhBNz/LhgPeHkUNQMPyYLbQYyPpszgJaWuE8OZc0YB05ma21mAD7tv3N3+
         cwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685552708; x=1688144708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjHfNn96o09ujq49twnbOyS7k4yu4ycZG77+8eeKj3w=;
        b=T8ytyHQjZQD8Z+XfOvVFNq2zHPrndh51Jr59MqER6OnLiDTXrDSJox9hFSlBQrHbRj
         /3KWteXoFcMhxwkAVQec7AFtLCCxLVnkzo0S1sivvzATkqkJGKyEyDHfFt1NL/2Exke/
         i6V1dvj8gJ5Uo/MwuhGHX7mwy8BwVAZJXmtGyxoWGs/sZ4CFiILh5BeYiXzGvHY4ZATt
         moDzNRTGRfFTJDpKHoI6UydGXRfQIowbMt5eRv/dZajXGCeWDVlUecWk+iFsU6zWCbrs
         421eiYp+nXHWg2wIq8g9NxTuIZFy6Ans+naSW1Xf+QyQ+28FmahJqLPJx1kpHGUu0IEk
         mxDw==
X-Gm-Message-State: AC+VfDx5dJ9F8zziI9DDu2+pVEBcj5bqWFjACTbEXGC6fqMXfasYDHeL
        9GJN9XBYUDC/kD8vU58HlgYQyw==
X-Google-Smtp-Source: ACHHUZ7h+3mDDncWqXQw7osyAc9nTDp6PuIgnOVnqhDyhT9b+CMRpgeHZpqxRRCr7w38UY2ZG7RYKA==
X-Received: by 2002:a05:651c:2044:b0:2af:222d:9695 with SMTP id t4-20020a05651c204400b002af222d9695mr4734651ljo.9.1685552707751;
        Wed, 31 May 2023 10:05:07 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id w6-20020a05651c102600b002ac833114besm3376606ljm.47.2023.05.31.10.05.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 10:05:07 -0700 (PDT)
Message-ID: <89faee17-7858-194e-8af7-953a2631eb8d@linaro.org>
Date:   Wed, 31 May 2023 19:05:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Fix MSM8998 count unit
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230531-topic-msm8998-bwmon-v1-1-454f9d550ee5@linaro.org>
 <693a36cf-e9d5-a6f1-3953-3a7c7567a754@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <693a36cf-e9d5-a6f1-3953-3a7c7567a754@linaro.org>
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



On 31.05.2023 19:03, Krzysztof Kozlowski wrote:
> On 31/05/2023 18:33, Konrad Dybcio wrote:
>> MSM8998's BWMON counts in megabytes. Fix it.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/soc/qcom/icc-bwmon.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> If this is
> https://lore.kernel.org/all/33c61f23-6442-6d9b-492f-dd6e9c64a8c1@quicinc.com/
> (and QLT 1872) then add reported-by tag.
It's not, I fired up 8998, added debug prints and ran mybw.

> 
> Change seems logical, although not really documented (a bit
> contradictory information for sdm845), so assuming this was really tested:
It's not for sdm845, after the last cleanup both BWMONs on that
one got its own driver data struct.

Konrad
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 
