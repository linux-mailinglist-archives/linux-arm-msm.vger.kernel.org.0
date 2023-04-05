Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 355A76D7157
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 02:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236671AbjDEAdw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 20:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235003AbjDEAdv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 20:33:51 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A924C0C
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 17:33:48 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y15so44521512lfa.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 17:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680654826;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w63JRY8tbcBhqvTZv7o6qB1aZCRvTTAvd6xKqzxt8kc=;
        b=o+ucd5r9cGIEgqGw59Rpb7Ge4TrucQaen+CoIWrWoUAVVU95cCUtCssjP/jFKlXY6Y
         qkjTFzpyCCUwM+jfNmVlI5qd4YnGCTmI+f2r3rPfGDmDQwX7VApS5w/vVJC4QUflq+gz
         SK1759j4ZeQXrS2qYgkpSJ03JXqlKmACVT7+xvZH3THQDpV6r971+itS+ufKZ8c9lS3N
         +WmhtDwxipYpapRDXO0uz519nQueSJn9aNveF9mpjbo7hT+qxxLQixI6Dj3mU27mVoVH
         fL91cWqZ5TonUUtnkupCikNRueNoaPEIDbNhA07Oa16TrgO4h7gQLqfEc6tOSVp9cm7z
         mgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680654826;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w63JRY8tbcBhqvTZv7o6qB1aZCRvTTAvd6xKqzxt8kc=;
        b=m7OID4ubJgkvmu1YNH456nwI0gW7/++HWvr082MnHK+JAid4gLBOPMKZ1zEe33AP2H
         3C+Y1e+LJOdLmzFF8Hp3HTJqEQ/CX4MGdO+Ir/uIuaITaj2hP6eVxQCrZSjpaKV+8Z/3
         KfGoVDx4DqXfRV8CmtnqoG+9LUG6IvkXTGaodVzOwLr2Cg/8YRLSzhYR+ahd3GkI2L4w
         Gp+ivTI31yc+Uh6ZwePe5sIyKoGKwtwcN2i60VpV3IWP+eKdyabxWdWLOKNay4mvV0RM
         7i2tC7UFIeyC0IihQcyv8a6XvcCb0Pd6MljQEujXjSceVPy+fDfjP32muk3SEXbeS5Ak
         B8Ag==
X-Gm-Message-State: AAQBX9cyePkTlgRXr0sQ4CH/UKLVveyE2q6k6YrHBOgHOT0R676X8O4A
        A14IX4z3/60D8uIz67+D58ZrOA==
X-Google-Smtp-Source: AKy350ZnKLDX5DKSAjAjahYtlmQeRhgeyCrOnVe0cRNLRQrNkzzQh+O2/0RySYfE+ZTT290uhkHgPQ==
X-Received: by 2002:ac2:494e:0:b0:4e9:85e5:23ff with SMTP id o14-20020ac2494e000000b004e985e523ffmr1105691lfi.40.1680654826246;
        Tue, 04 Apr 2023 17:33:46 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id l10-20020ac24a8a000000b004db3e445f1fsm2579191lfp.97.2023.04.04.17.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 17:33:45 -0700 (PDT)
Message-ID: <6948fe29-af08-9164-4cec-a6564dbb1e1a@linaro.org>
Date:   Wed, 5 Apr 2023 03:33:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 01/42] drm/msm/dpu: use CTL_SC7280_MASK for sm8450's
 ctl_0
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
 <20230404130622.509628-2-dmitry.baryshkov@linaro.org>
 <aa3175ec-e381-7211-3bf1-ca8bb9ef696b@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <aa3175ec-e381-7211-3bf1-ca8bb9ef696b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/04/2023 01:12, Abhinav Kumar wrote:
> 
> 
> On 4/4/2023 6:05 AM, Dmitry Baryshkov wrote:
>> On sm8450 platform the CTL_0 doesn't differ from the rest of CTL blocks,
>> so switch it to CTL_SC7280_MASK too.
>>
>> Some background: original commit 100d7ef6995d ("drm/msm/dpu: add support
>> for SM8450") had all (relevant at that time) bit spelled individually.
>> Then commit 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog"),
>> despite being a mismerge, correctly changed all other CTL entries to use
>> CTL_SC7280_MASK, except CTL_0.
>>
> 
> I think having it spelled individually is better. If we start using one 
> chipset's mask for another, we are again going down the same path of 
> this becoming one confused file.
> 
> So, even though I agree that 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to 
> hw catalog") corrected the mask to re-use sc7280, with the individual 
> catalog file, its better to have it separate and spelled individually.
> 
> This change is not heading in the direction of the rest of the series.

I didn't create duplicates of all the defines. This is done well in the 
style of patch37. I'm not going to add all per-SoC feature masks.

> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 6840b22a4159..83f8f83e2b29 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -975,7 +975,7 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
>>       {
>>       .name = "ctl_0", .id = CTL_0,
>>       .base = 0x15000, .len = 0x204,
>> -    .features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) 
>> | BIT(DPU_CTL_FETCH_ACTIVE),
>> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>>       .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>       },
>>       {

-- 
With best wishes
Dmitry

