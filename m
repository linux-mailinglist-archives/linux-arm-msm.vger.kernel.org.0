Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22AA15D1C72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 20:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbiIUSGC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 14:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbiIUSGB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 14:06:01 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CAAF80EB5
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 11:05:59 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id y5so11351959wrh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 11:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=c/1ZTI/JqD0DxpOU+Jn7OqD7FPGryOOpO8thonVZ3AY=;
        b=KkeAmqj8PGjVxuILsheKSbIvIEF6OeiTOhU0mrL2EVTxIdOBELzH9G2uQJa28ugxmX
         jtrFhvg8JeJRI7gfbY4vJ4MG3wZ6H1Nwch8ujJnpVCiyFo/LH5HMr01e8srzNcIRg8tQ
         mgNKNta5/yMVJFexzgk83fgOT3MDUvCRLP9R+VztUusBJQoRnh++Sk8hIuhhtEGubzQN
         EgQc/2/LI4fpjZqXikS63ghPhgU0Kh3b9LN4s/OZJaNALUioH1SituwyN3W+nxcW17Io
         y+gMxyP9idryOPqZSgfknIyKtMVoSgW5c1855VevsWtFl0pShiFaaZo38YmjAWh1kvOg
         mbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=c/1ZTI/JqD0DxpOU+Jn7OqD7FPGryOOpO8thonVZ3AY=;
        b=kxDKvvCxy5qDorsrM6EwLSa5sYM0vHkrdmF5SO36dIfpTS+Eu2mEU3mYuwAecIN/4f
         zBEiDiV6nb4kGGDI6uHvSqqVgBAYocMyZoGdhbu1B+jIvSLl7kAEXz8c3fLa8eLTeoWL
         J6CxFrTaJT3KC5Lku8hJNSfUnNra8lH2OnQvGWcapqfdqaEGE2nNtRS2iJEF95fIZjF1
         qZZxEn3fajY0zXYLmclZUC0F0a9gOVYh32gKrBHIkYyv5xebraU4jbolUROPB3Mwv30x
         E+fxcSSIu/Hp+TZdjXlon7MgYUNAh6vREv20ltOhyPigNvV+WGJizwQA2QkrZ4pRcCi2
         ZQcg==
X-Gm-Message-State: ACrzQf3ICsqSgv6zXamPOp+ABRc7TAscGoeZHnhRyasNq6B6zoOyMLSN
        HcRAWXLQYrp/aQeBfXzoJYiySw==
X-Google-Smtp-Source: AMsMyM6rJM460HHXhJwaPA2mVegk2iBFHBUP27phO8l7hBX97WOIM5KVroTTwxhQVcrcskQiYFv5bg==
X-Received: by 2002:adf:d1ca:0:b0:22a:cb10:450d with SMTP id b10-20020adfd1ca000000b0022acb10450dmr17369474wrd.120.1663783558380;
        Wed, 21 Sep 2022 11:05:58 -0700 (PDT)
Received: from [192.168.0.11] (cpc76482-cwma10-2-0-cust629.7-3.cable.virginm.net. [86.14.22.118])
        by smtp.gmail.com with ESMTPSA id f15-20020a1cc90f000000b003b2878b9e0dsm3499836wmb.20.2022.09.21.11.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 11:05:57 -0700 (PDT)
Message-ID: <b7551b18-887a-c895-b347-776bb537ae9f@linaro.org>
Date:   Wed, 21 Sep 2022 19:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/2] mfd: qcom-spmi-pmic: convert hex numbers lowercase
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>
References: <20220915113523.44074-1-luca.weiss@fairphone.com>
 <YylwxQSulh7C48T7@google.com> <CN1UV8GZPKW8.3KT1X7WYEM4K5@otso>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <CN1UV8GZPKW8.3KT1X7WYEM4K5@otso>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21/09/2022 07:12, Luca Weiss wrote:
> Hi Lee, hi Caleb
> 
> On Tue Sep 20, 2022 at 9:50 AM CEST, Lee Jones wrote:
>> On Thu, 15 Sep 2022, Luca Weiss wrote:
>>
>>> There are some IDs that are written in uppercase. For consistency
>>> convert them to lowercase.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>> Changes since v2:
>>> * Split out to separate patch
>>>
>>>   include/soc/qcom/qcom-spmi-pmic.h | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> These aren't MFD patches.  Please reword the subject.
> 
> Do you have any suggestion what subject to use then? The most I can
> think of is "soc: qcom: " which is sometimes used for other files in
> this include directory.
> I've used the current subject because the previous two patches touching
> this file had this subject also.

This file just contains platform data which used to be in the qcom SPMI
PMIC driver. In hindsight, maybe it would have been better suited in
include/linux/mfd but I don't think it matters too much. I guess it makes
sense to follow convention for the directory and treat it like the other
platform headers, maybe something like:

soc: qcom: spmi-pmic: convert hex numbers to lowercase
> 
> Regards
> Luca
> 
>>
>> -- 
>> DEPRECATED: Please use lee@kernel.org
> 

-- 
Kind Regards,
Caleb (they/them)
