Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C532651912C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 00:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236265AbiECWPc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 18:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235790AbiECWPb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 18:15:31 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C61242DD76
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 15:11:57 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id p10so32557992lfa.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 15:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4luej/Z8AZU4tL8sA3TFYmosE5DMCQUGp1FA8G3vxe4=;
        b=iG0BpmDFTJsUOoGuK59AQs5dJOKEDqJT9YsL8f0AJOL+7kClhKX14lfQ0xLMGCsqdE
         CDqrPiwKeytlkW+CYpmR/ooBkYoxq5zHZLj4gQ2uJdq0TKSVYUTmoSVgOfZ6C0Qo0KtO
         6ZGpzgfAbQ7ukasGtM0E4u3YaVXbuF9hmr00wswDULemlQ48JMjXOAYcWj3j4eZu+TCP
         q+vGpBzGmjiZvUGgGGON/h5d3wOe/KkL/P618sOBJmjOmlBX/FC173gFR2SMc+lRkq5d
         kkP5+b4OpAOe7T49l4Nq/He6AhktDlKl0K6/6O8JYmHTLPAS1U8VZINYWLk47nxd8ZtB
         kd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4luej/Z8AZU4tL8sA3TFYmosE5DMCQUGp1FA8G3vxe4=;
        b=sVItReQAs25bsBXY8ltpGm2Bpf0XJ8tAYON1PpSNLd6DYLgOGpquT4kWumoXbWDP5l
         +wdoslDlW62zITT/MRJmpPQX4ey9WG61WoqhUIjfg8TAI428DcyCuBVeqBIsB1o++tjL
         eETZHYsLZNWoN5UFByxU5QfLIdbNHpdgAEFrGetL1MeySncvKjDlSfntTmaTYO5c0QqF
         6pZU96X5W4KqWrBx6jABE9/lR0rJocVx80yGjOowZE5fxmUHERu+gzdRnmej39lXGQ1f
         xHwLYQAaNM2jFuy5S+INSWrfpLe1mn73uk3fqCN6yqgnB+eGOoILJw7DFnz1VgkgBcGf
         CHBA==
X-Gm-Message-State: AOAM530ATV/tg/GmxPMYCP81R5QhI9KdrKEYsRMg6ocuOYq3h2PoHmLF
        db23b56RkqMtJa5edXJ6zZcCKw==
X-Google-Smtp-Source: ABdhPJwo6dcYwp9JX4CI1tKN30hRUet0O0vg+CWvjYB+/jgxEwtrX0t3YII9qGYhKMNKvYsxtBUDxw==
X-Received: by 2002:a05:6512:2097:b0:472:127:35c1 with SMTP id t23-20020a056512209700b00472012735c1mr12064927lfr.578.1651615916162;
        Tue, 03 May 2022 15:11:56 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r4-20020ac252a4000000b0047255d211a1sm1042797lfm.208.2022.05.03.15.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 15:11:55 -0700 (PDT)
Message-ID: <5935ae15-2497-1c74-5b51-5baef7f78851@linaro.org>
Date:   Wed, 4 May 2022 01:11:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 04/25] drm/msm/dpu: move SSPP debugfs creation to
 dpu_kms.c
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-5-dmitry.baryshkov@linaro.org>
 <df93e33b-fa5a-af29-1be5-76262a17ce0a@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <df93e33b-fa5a-af29-1be5-76262a17ce0a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/05/2022 00:34, Abhinav Kumar wrote:
> 
> 
> On 2/9/2022 9:24 AM, Dmitry Baryshkov wrote:
>> As SSPP blocks are now visible through dpu_kms->rm.sspp_blocks, move
>> SSPP debugfs creation from dpu_plane to dpu_kms.
>>
> 
> Change is fine by itself, but is it really needed?
> Wouldnt it be better to keep dpu_debugfs_sspp_init in dpu_plane.c?

No. We are going to break the dependency between planes and SSPPs at 
some point. Let's move the debugfs functions to the generic location.

> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 19 +++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 16 ----------------
>>   3 files changed, 19 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> index f805c30643b1..674f311f99b4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
>> @@ -415,7 +415,6 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp 
>> idx,
>>    */
>>   void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx);
>> -void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry 
>> *debugfs_root);
>>   int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct 
>> dpu_kms *kms, struct dentry *entry);
>>   #endif /*_DPU_HW_SSPP_H */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 4d2b75f3bc89..8196b11fe2f3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -259,6 +259,25 @@ void dpu_debugfs_create_regset32(const char 
>> *name, umode_t mode,
>>       debugfs_create_file(name, mode, parent, regset, 
>> &dpu_fops_regset32);
>>   }
>> +static void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct 
>> dentry *debugfs_root)
>> +{
>> +    struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
>> +    int i;
>> +
>> +    if (IS_ERR(entry))
>> +        return;
>> +
>> +    for (i = SSPP_NONE; i < SSPP_MAX; i++) {
>> +        struct dpu_hw_pipe *pipe_hw;
>> +
>> +        if (!dpu_kms->rm.sspp_blks[i - SSPP_NONE])
>> +            continue;
>> +
>> +        pipe_hw = to_dpu_hw_pipe(dpu_kms->rm.sspp_blks[i - SSPP_NONE]);
>> +        _dpu_hw_sspp_init_debugfs(pipe_hw, dpu_kms, entry);
>> +    }
>> +}
>> +
>>   static int dpu_kms_debugfs_init(struct msm_kms *kms, struct 
>> drm_minor *minor)
>>   {
>>       struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 146dbccd79cd..37742f74a7bf 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -1359,22 +1359,6 @@ void dpu_plane_danger_signal_ctrl(struct 
>> drm_plane *plane, bool enable)
>>       _dpu_plane_set_qos_ctrl(plane, enable, DPU_PLANE_QOS_PANIC_CTRL);
>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>   }
>> -
>> -/* SSPP live inside dpu_plane private data only. Enumerate them here. */
>> -void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry 
>> *debugfs_root)
>> -{
>> -    struct drm_plane *plane;
>> -    struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
>> -
>> -    if (IS_ERR(entry))
>> -        return;
>> -
>> -    drm_for_each_plane(plane, dpu_kms->dev) {
>> -        struct dpu_plane *pdpu = to_dpu_plane(plane);
>> -
>> -        _dpu_hw_sspp_init_debugfs(pdpu->pipe_hw, dpu_kms, entry);
>> -    }
>> -}
>>   #endif
>>   static bool dpu_plane_format_mod_supported(struct drm_plane *plane,


-- 
With best wishes
Dmitry
