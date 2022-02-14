Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 099704B5B76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 21:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbiBNUq3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 15:46:29 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbiBNUp7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 15:45:59 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D50B1245FDF
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 12:44:01 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b11so8308911lfb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 12:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2X3kZbX+r2skgh31n7jW6xhk6e9XDlkUbEJcNaWJ+ok=;
        b=nJ/iv1ylRHCewgW3kX7nTwKriL4gG+aGFWMVjaQkCuEvYHFRquxbkW2FHqWayJTraJ
         rXODxi1LPc1lt/tleCav4RDJZ1IiqPhrQq5wMGZfkzqYQddNGLh148eIcLU1ff9YnsNV
         dJaf16l/WN0J5zA26yxW3t5XV0YodiR75nIzuRvhuxn51tTuKLSY+/S2+1GlwVinpXlq
         wnI9Ppd5HrvirRU/otTSRZGpydlUhIg9RzJKCM4Pj2zit3R9e9hURW+DnsdlUBx2MX7Y
         0h3qdcDDp5Nm7Tay33zdzHurJeXNjUpEYsiAiilMEDV08D5T3hXBEA9HkBPfzcFnzjF5
         cynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2X3kZbX+r2skgh31n7jW6xhk6e9XDlkUbEJcNaWJ+ok=;
        b=Lpm+FwjVfun9/qz1YiJKC5nOpXJfmKRGrn7Wp0rcDZpc10S6L8dBhxmfvAQipQzzps
         F5bhplAv5b0PHAGASwctYyqq7Bet9wqR7Cv6xkpVxHnANyAzekZohrlTipn+/W7q6r2e
         wQQ/z4Ibl4ipqMY8unEMYOLkb9nU8s3Q32WqZNVG7jOD6eO2Ka4MrN7/sAtGd7Snd3QA
         TRscj8YwRVGTV2mvygNwXhiaVlAbsbPo00FmkgBFRfkAJVKp/SywQEsFtX/iNPY5y9PS
         FJJxKpM/RhdUx0iecGKZ0IKXbTYU4FTFWCyvjmd1lnbtC777iUWJZSDyMGfV+nAcgNE0
         kMHQ==
X-Gm-Message-State: AOAM533xky6H2sd4FBNtn2h5X3wz3x94v8e1xYGQlxYL/S0klKnXpMaK
        CW/Xd2GLo5nUOQY2+pDYfTjGEg==
X-Google-Smtp-Source: ABdhPJzmq2rehfCSH3NsOJEjg3U/3L/c1dDAYZBLrw88w45OYI6UpA8++OFJu8ymh3U5ryuFxjDPxg==
X-Received: by 2002:a05:6512:ea8:: with SMTP id bi40mr628876lfb.258.1644871431323;
        Mon, 14 Feb 2022 12:43:51 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bi1sm4246363lfb.87.2022.02.14.12.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 12:43:50 -0800 (PST)
Message-ID: <2246d195-c3dc-e093-f456-55c00fe23c71@linaro.org>
Date:   Mon, 14 Feb 2022 23:43:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 5/6] drm/msm/dpu: fix error handling in dpu_rm_init
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
 <20220121210618.3482550-6-dmitry.baryshkov@linaro.org>
 <5b517150-ae78-98c6-b9a8-d84905f38f56@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5b517150-ae78-98c6-b9a8-d84905f38f56@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/02/2022 22:15, Abhinav Kumar wrote:
> 
> 
> On 1/21/2022 1:06 PM, Dmitry Baryshkov wrote:
>> Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
>> the value is NULL, then the function will return 0 instead of a proper
>> return code. Moreover none of dpu_hw_*_init() functions can return NULL.
>> So, replace all dpu_rm_init()'s IS_ERR_OR_NULL() calls with IS_ERR().
>>
> Can you please give an example of a case where dpu_hw_*_init() can 
> return NULL?
> 
> All dpu_hw_*_init() functions are only called if the corresponding
> hw*_counts are valid. So I would like to understand this.
> 
> Now, if NULL is treated as a non-error case, should we atleast print
> a message indicating so?

- No dpu_hw_*init() can return NULL

- If at some point any of these functions returns NULL, it will cause a 
premature dpu_rm_init() termination with the success (=0) status, 
leaving parts of RM uninitialized.

Thus I'm replacing IS_ERR_OR_NULL with IS_ERR()

> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index 96554e962e38..7497538adae1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -109,7 +109,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>>               continue;
>>           }
>>           hw = dpu_hw_lm_init(lm->id, mmio, cat);
>> -        if (IS_ERR_OR_NULL(hw)) {
>> +        if (IS_ERR(hw)) {
>>               rc = PTR_ERR(hw);
>>               DPU_ERROR("failed lm object creation: err %d\n", rc);
>>               goto fail;
>> @@ -126,7 +126,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>>               continue;
>>           }
>>           hw = dpu_hw_merge_3d_init(merge_3d->id, mmio, cat);
>> -        if (IS_ERR_OR_NULL(hw)) {
>> +        if (IS_ERR(hw)) {
>>               rc = PTR_ERR(hw);
>>               DPU_ERROR("failed merge_3d object creation: err %d\n",
>>                   rc);
>> @@ -144,7 +144,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>>               continue;
>>           }
>>           hw = dpu_hw_pingpong_init(pp->id, mmio, cat);
>> -        if (IS_ERR_OR_NULL(hw)) {
>> +        if (IS_ERR(hw)) {
>>               rc = PTR_ERR(hw);
>>               DPU_ERROR("failed pingpong object creation: err %d\n",
>>                   rc);
>> @@ -168,7 +168,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>>               continue;
>>           }
>>           hw = dpu_hw_intf_init(intf->id, mmio, cat);
>> -        if (IS_ERR_OR_NULL(hw)) {
>> +        if (IS_ERR(hw)) {
>>               rc = PTR_ERR(hw);
>>               DPU_ERROR("failed intf object creation: err %d\n", rc);
>>               goto fail;
>> @@ -185,7 +185,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>>               continue;
>>           }
>>           hw = dpu_hw_ctl_init(ctl->id, mmio, cat);
>> -        if (IS_ERR_OR_NULL(hw)) {
>> +        if (IS_ERR(hw)) {
>>               rc = PTR_ERR(hw);
>>               DPU_ERROR("failed ctl object creation: err %d\n", rc);
>>               goto fail;
>> @@ -202,7 +202,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>>               continue;
>>           }
>>           hw = dpu_hw_dspp_init(dspp->id, mmio, cat);
>> -        if (IS_ERR_OR_NULL(hw)) {
>> +        if (IS_ERR(hw)) {
>>               rc = PTR_ERR(hw);
>>               DPU_ERROR("failed dspp object creation: err %d\n", rc);
>>               goto fail;


-- 
With best wishes
Dmitry
