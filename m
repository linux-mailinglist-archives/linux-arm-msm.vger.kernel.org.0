Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3B346CF3FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 22:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbjC2UBJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 16:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjC2UBI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 16:01:08 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655EC126
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 13:01:04 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id c9so11294236lfb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 13:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680120062;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QOz2LnBeoR0UsX1ajFY+JsP7ZZvmsV9hCjLXu958Cw4=;
        b=bvnD+S2+ONOEkOKYd9Sua4486Us6nUvXP1T7Av/0SNOnmG5sC9rX7LYqJQH4aFbIIk
         d16Igh19Bdy1nRd8FXa7wbVzZIHgH0efIYEa55zZOI1lubyzPRv0SYYv/irQsNR9P35R
         PU5x23FQMlg2MCg+1WsA3JdRBa3sgcSivfFTuSBXOb+ktYK8TplB0tG3pq6E1Pyfk/8n
         /FS9JII8RSU3T3+BL7K9tkXYiYWwJDjJJHlyatB1TRYbis9K51clA5Ayr0FSwev9wtAa
         lTJ0G9zwkQ4a80pZg4bDROA6+wNOwGxUEolcG+HhVkY+DFsDkXLtaDfLgj4ya8H8vGqT
         phyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680120062;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOz2LnBeoR0UsX1ajFY+JsP7ZZvmsV9hCjLXu958Cw4=;
        b=NMkoxcLsBePmqS9MoCkyL0nfUDF2Ife7hJRLsOvvVUzxDmHSmZY+54JSI4MtGx+0Ya
         q3jfxwo6MGTZrrGUvKfKZEsflfWs0UVOTwvacHVL73v/Xt2lGnBZxRbmDOuj59jhk0En
         08MHz4Kc7LlsXQOl1n7YKKgU8UtWLZhng1jU6JWQAKsUuJ1BgCXhP9QmYzYkiaWOXJ5K
         WETnDnKnvgL+e3LpylBFm5TM125WNyAkxF1EtficrhCIjBpCA+DUjzhfmKROzzZfbBbX
         AaTgE0dY+/8aGmJEKj37smO6RbykTFtVpH1AWhR5J1Xcf0Hz/ZEHYPvKWJPuW5SMMiz8
         KB+w==
X-Gm-Message-State: AAQBX9d5dFCfdP9FQw8iqtpXFbAw2gkNPJcyvO9lpPID4hmXcOTP2kPg
        Rfoc+4zutOhgrw/pi5M2cy4A7g==
X-Google-Smtp-Source: AKy350bhm+8M87yTF9xXkPrCxrIC+ScPXmtLGPFwZX0Q9oEVNcpmxE6UwcLGLVfQlyHI7IY27XqsUw==
X-Received: by 2002:ac2:5969:0:b0:4b5:2cf4:cc1d with SMTP id h9-20020ac25969000000b004b52cf4cc1dmr6002100lfp.68.1680120062582;
        Wed, 29 Mar 2023 13:01:02 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l17-20020ac25551000000b004cc9042c9cfsm5545322lfk.158.2023.03.29.13.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 13:01:02 -0700 (PDT)
Message-ID: <9fbda2ac-d611-ed3a-bbd5-4fa58f39c713@linaro.org>
Date:   Wed, 29 Mar 2023 23:01:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 14/50] drm/msm/dpu: Allow variable SSPP/INTF_BLK size
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-15-dmitry.baryshkov@linaro.org>
 <f0cc19ec-83ee-151d-e4d2-83a2cd5dc7f7@linaro.org>
 <526734f4-d2a6-b8b3-d300-dbf0bcfde91f@linaro.org>
In-Reply-To: <526734f4-d2a6-b8b3-d300-dbf0bcfde91f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 13/02/2023 13:18, Dmitry Baryshkov wrote:
> On 13/02/2023 13:01, Konrad Dybcio wrote:
>>
>>
>> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>
>>> These blocks are of variable length on different SoCs. Set the
>>> correct values where I was able to retrieve it from downstream
>>> DTs and leave the old defaults (0x1c8 for sspp and 0x280 for
>>> intf) otherwise.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> [DB: fixed some of lengths]
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> Oh you fixed it quicker than I could respond!
> 
> Yes, I wanted to include it into this patchset, so I had to fix it.
> 
>>
>> Still, I think the 8280 sspp size should not be
>> 2x the norm..
> 
> Let's doublecheck this with somebody having access to docs.

The additional research shows that all of us were wrong here. I'll 
update it to 0x2ac for the next revision of the patchset.

-- 
With best wishes
Dmitry

