Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7A3A66E3CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 17:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbjAQQkc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 11:40:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233033AbjAQQkP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 11:40:15 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 497154346F
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 08:40:14 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id w14so28558559edi.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 08:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T1bbrLy++qcWOt6lSo1aW2xXQtthkN26YgghLI/c6PY=;
        b=YZWptJC2T2Lt68fnk5iaS35Tt5NiBfTpWDPvoZ6YNp63K3/OpJqlWyZT9j6KW7jL+Y
         R2u99ksNtXzgJJfcKEb8tk3Q8XTu5JPV0ZoB94hofer3jjhOTHZ0EQ7Y4zl+fVQBhgbf
         xoOe2dgoLRZqgJXMrHtynQZnr5g5DUqAbnBZ6C5nVp8CrRvqEB/uaaQ+Yy3Xiq+BPQ7p
         uzJvop6v4S2b68/OrliCjG4bx0NwzotqRxAXtx0gq5sUPvGmuj/JcowQw1cRn8O8Ohvl
         cnRY58wyvX5NuCJe9A8wnxrZ+nWebym9vLkLEHPjNihs+RJJJZtYNngEeNbuCcaNCHMt
         mjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1bbrLy++qcWOt6lSo1aW2xXQtthkN26YgghLI/c6PY=;
        b=tA7rK0iwXUM6NihBIg3a4WzLjTNwuntw3Bl/M2DnikVrbJVfftRKJFbWiTkrGOjWoo
         4eNGWPh7bZYbzR0d57MCcJzS2FI1lKFKf9pxeK/QTcB+0EtKdunLigmwlILycMoDfYAO
         36cm4y+szPKOXJUBH2UU5V3E5AUHo7fgzpJDo8k6irRrWpPwUz6keykLn+002RgOlIOT
         YyTeyWQ86MqXu46nbprRPRa4Qbgq9qOnvdaCERu14xq941VZ+SeUk8gWWE8iA9NBhqHp
         NQH1hGfFtchl9ADlHqax7S0EE1oY7RlqZ+wUBzY/pnz7rP5nKYW7Z0t9vEv5Bhsh7GHj
         fM+g==
X-Gm-Message-State: AFqh2kpqX86BJVmK/tpksHkAKxurosMvXRjYvw4+FBNYk+pIsGwaT9yW
        bpb40pQYzi1cMYTF5WDDaRGTkg==
X-Google-Smtp-Source: AMrXdXvx8GfSw4jqnYWyRNx+AEyQ5TPSGpqwX8eUMCgA3tmTmVxZPkFx+gDCWDdS4uOV+AcLTLvMPw==
X-Received: by 2002:a05:6402:2b92:b0:45a:7d2:9b35 with SMTP id fj18-20020a0564022b9200b0045a07d29b35mr3870633edb.0.1673973612880;
        Tue, 17 Jan 2023 08:40:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id dk1-20020a0564021d8100b0049be07c9ff5sm5820820edb.4.2023.01.17.08.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 08:40:12 -0800 (PST)
Message-ID: <84849b99-93ab-bc10-39ff-ac46328ede47@linaro.org>
Date:   Tue, 17 Jan 2023 18:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] drm/msm/disp/dpu1: allow reservation even if dspps
 are not available.
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Kalyan Thota <quic_kalyant@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, quic_abhinavk@quicinc.com
References: <1673972488-30140-1-git-send-email-quic_kalyant@quicinc.com>
 <1673972488-30140-2-git-send-email-quic_kalyant@quicinc.com>
 <0a845c24-b1a5-a961-103f-0d8840a8f17d@linaro.org>
In-Reply-To: <0a845c24-b1a5-a961-103f-0d8840a8f17d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/01/2023 18:35, Dmitry Baryshkov wrote:
> On 17/01/2023 18:21, Kalyan Thota wrote:
>> if any topology requests for dspps and catalogue doesn't have the
>> allocation, avoid failing the reservation.
>>
>> This can pave way to build logic allowing composer fallbacks
>> for all the color features that are handled in dspp.
>>
>> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index 73b3442..c8899ae 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -343,7 +343,13 @@ static bool 
>> _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>>           return true;
>>       idx = lm_cfg->dspp - DSPP_0;
>> -    if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
>> +
>> +    if (idx < 0) {
> 
> The change doesn't correspond to commit message.
> 
>> +        DPU_DEBUG("lm doesn't have dspp, ignoring the request %d\n", 
>> lm_cfg->dspp);
>> +        return true;
>> +    }
>> +
>> +    if (idx >= ARRAY_SIZE(rm->dspp_blks)) {
>>           DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
>>           return false;
>>       }
> 
> If you'd like to remove duplicate for the (idx >= ARRAY_SIZE) check, I'd 
> suggest dropping the second one
> 

I've misread the patch. However I don't see, why would one request 
DSPP_NONE while specifying topology->num_dspp. I think that you are 
trying to put additional logic into a function that should just check 
for the available resources.

-- 
With best wishes
Dmitry

