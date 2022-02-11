Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7794B3197
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Feb 2022 00:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354294AbiBKX7p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 18:59:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242360AbiBKX7p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 18:59:45 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5E0D62
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 15:59:42 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id i34so19524240lfv.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 15:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vpNONhqeGYvRyAk5B98TvIafw9aLNrTGGYlU1pguBBE=;
        b=sFSXFyaPh9OInz4QyTMWUB3xXKj5A9m+fgnRly9VT450eqeefrHXljmO3bLdYHT3lb
         FRPlToYa0e7A5jIKJOC8zrp5+60KpE4YLTKDf5OHKYXSVmkh2aiMnwTOuRpt6S8lz5HC
         ZPswzu78KqkLxD12Eq0+1+ZOXv6+Vn497R2nY6s452sIY/imTRzAMrdo+0Bd87aQMhYH
         Z09AyK9jXULQKns95SCf83uAM1EbxcM/ve8ohYJHCzVhjNqFl5eRvGqjzNUkwM52E9f3
         ClOPxlWvjVppZgCHjsG/ewDz3qwKf1M+QgHDDlluRoZ2u0+wN7YInzXe5z9d9b6azJVa
         iBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vpNONhqeGYvRyAk5B98TvIafw9aLNrTGGYlU1pguBBE=;
        b=qDC2qo5SjMhV7z0M9Mk+CgVUckV4oPWgFxOSr5LaFRofEQ5MkVAzTzaEbTTrYTPeaE
         uYNOG86dpljYiUIX+P00iJjhXqQOCxIHGbk+270bLnZHxEQYRQ78IoeJO8toYXpCinOR
         umlt2n6LBvjzBuk4TrFD7+jmMJx9lzs7TkMaNdf5p+lFflWvqUTH3fjqW5jqyRG3JqXz
         GILZlYxO40Dupp0jQX8J71L4ScTD5nKqIvpFX1DLdvG5YCPnMFVrL40Ruwzzd6WzWJf3
         3ZetOmUNn9o4WxKjra8bqJa5fi3/a9MkJ4E1ATxcLrNZ997wM6vigDQUjhL0bft9tQzS
         jz8g==
X-Gm-Message-State: AOAM532aSC2ROJKu0wCS8ZahIluFPAHYkx4GE2ixTWDTZv+KlPicDa46
        L1sHeh65qZ6uVd+XeCFSuYq+Bg==
X-Google-Smtp-Source: ABdhPJwmPO1kr4ZkvUha4hL2jeQBmOJ1nyfUtdeJ5n3oHu8QVXlIxp5epFCmraEJA+52tPb+4aQuTQ==
X-Received: by 2002:a05:6512:2629:: with SMTP id bt41mr2746782lfb.49.1644623980799;
        Fri, 11 Feb 2022 15:59:40 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z23sm3283679lfu.84.2022.02.11.15.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 15:59:40 -0800 (PST)
Message-ID: <d9f3e63b-b78b-615c-aa75-d688875ee898@linaro.org>
Date:   Sat, 12 Feb 2022 02:59:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 5/7] drm/msm/dpu: encoder: drop unused callbacks
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
 <20220203082611.2654810-6-dmitry.baryshkov@linaro.org>
 <cf8c49e0-5656-69b2-c35e-8df3cfaffb40@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <cf8c49e0-5656-69b2-c35e-8df3cfaffb40@quicinc.com>
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

On 12/02/2022 02:53, Abhinav Kumar wrote:
> 
> 
> On 2/3/2022 12:26 AM, Dmitry Baryshkov wrote:
>> Both cmd and vid backends provide no atomic_check() callbacks and
>> useless mode_fixup() callbacks. Drop support for both of them.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> We can drop mode_fixup() but I am using atomic_check() for WB to 
> validate whether the programmed FB exceeds WB limits OR
> the programmed mode. Hence without an alternative for that we cannot 
> drop that

Ack, will change in v2, thanks for catching this!

Just as a remark: as I think more and more about the WB/CMD/VID, I have 
an impression that at some point we should turn drm_encoder inside out. 
Let drm_encoder_phys/vid/wb be a first class citizens and call helpers 
from dpu_encoder.c rather than making dpu_encoder.c calling out 
functions from respective backend. For now it's quick rough idea, but 
your thoughts are welcomed.

> 
> Please refer to dpu_encoder_phys_wb_atomic_check in 
> https://patchwork.freedesktop.org/patch/472324/
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 39 +++++--------------
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  8 ----
>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 10 -----
>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 14 -------
>>   4 files changed, 9 insertions(+), 62 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 4530549850f0..e1c43a0c0643 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -573,7 +573,6 @@ static int dpu_encoder_virt_atomic_check(
>>       struct drm_display_mode *adj_mode;
>>       struct msm_display_topology topology;
>>       struct dpu_global_state *global_state;
>> -    int i = 0;
>>       int ret = 0;
>>       if (!drm_enc || !crtc_state || !conn_state) {
>> @@ -595,39 +594,19 @@ static int dpu_encoder_virt_atomic_check(
>>       trace_dpu_enc_atomic_check(DRMID(drm_enc));
>> -    /* perform atomic check on the first physical encoder (master) */
>> -    for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>> -        struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>> -
>> -        if (phys->ops.atomic_check)
>> -            ret = phys->ops.atomic_check(phys, crtc_state,
>> -                    conn_state);
>> -        else if (phys->ops.mode_fixup)
>> -            if (!phys->ops.mode_fixup(phys, mode, adj_mode))
>> -                ret = -EINVAL;
>> -
>> -        if (ret) {
>> -            DPU_ERROR_ENC(dpu_enc,
>> -                    "mode unsupported, phys idx %d\n", i);
>> -            break;
>> -        }
>> -    }
>> -
>>       topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
>>       /* Reserve dynamic resources now. */
>> -    if (!ret) {
>> -        /*
>> -         * Release and Allocate resources on every modeset
>> -         * Dont allocate when active is false.
>> -         */
>> -        if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>> -            dpu_rm_release(global_state, drm_enc);
>> +    /*
>> +     * Release and Allocate resources on every modeset
>> +     * Dont allocate when active is false.
>> +     */
>> +    if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>> +        dpu_rm_release(global_state, drm_enc);
>> -            if (!crtc_state->active_changed || crtc_state->active)
>> -                ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>> -                        drm_enc, crtc_state, topology);
>> -        }
>> +        if (!crtc_state->active_changed || crtc_state->active)
>> +            ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>> +                    drm_enc, crtc_state, topology);
>>       }
>>       trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> index e7270eb6b84b..159deb8ed7fb 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> @@ -84,12 +84,10 @@ struct dpu_encoder_virt_ops {
>>    * @is_master:            Whether this phys_enc is the current master
>>    *                encoder. Can be switched at enable time. Based
>>    *                on split_role and current mode (CMD/VID).
>> - * @mode_fixup:            DRM Call. Fixup a DRM mode.
>>    * @mode_set:            DRM Call. Set a DRM mode.
>>    *                This likely caches the mode, for use at enable.
>>    * @enable:            DRM Call. Enable a DRM mode.
>>    * @disable:            DRM Call. Disable mode.
>> - * @atomic_check:        DRM Call. Atomic check new DRM state.
>>    * @destroy:            DRM Call. Destroy and release resources.
>>    * @get_hw_resources:        Populate the structure with the hardware
>>    *                resources that this phys_enc is using.
>> @@ -117,17 +115,11 @@ struct dpu_encoder_phys_ops {
>>               struct dentry *debugfs_root);
>>       void (*prepare_commit)(struct dpu_encoder_phys *encoder);
>>       bool (*is_master)(struct dpu_encoder_phys *encoder);
>> -    bool (*mode_fixup)(struct dpu_encoder_phys *encoder,
>> -            const struct drm_display_mode *mode,
>> -            struct drm_display_mode *adjusted_mode);
>>       void (*mode_set)(struct dpu_encoder_phys *encoder,
>>               struct drm_display_mode *mode,
>>               struct drm_display_mode *adjusted_mode);
>>       void (*enable)(struct dpu_encoder_phys *encoder);
>>       void (*disable)(struct dpu_encoder_phys *encoder);
>> -    int (*atomic_check)(struct dpu_encoder_phys *encoder,
>> -                struct drm_crtc_state *crtc_state,
>> -                struct drm_connector_state *conn_state);
>>       void (*destroy)(struct dpu_encoder_phys *encoder);
>>       void (*get_hw_resources)(struct dpu_encoder_phys *encoder,
>>                    struct dpu_encoder_hw_resources *hw_res);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> index 34a6940d12c5..45fe97fb612d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> @@ -45,15 +45,6 @@ static bool dpu_encoder_phys_cmd_is_master(struct 
>> dpu_encoder_phys *phys_enc)
>>       return (phys_enc->split_role != ENC_ROLE_SLAVE);
>>   }
>> -static bool dpu_encoder_phys_cmd_mode_fixup(
>> -        struct dpu_encoder_phys *phys_enc,
>> -        const struct drm_display_mode *mode,
>> -        struct drm_display_mode *adj_mode)
>> -{
>> -    DPU_DEBUG_CMDENC(to_dpu_encoder_phys_cmd(phys_enc), "\n");
>> -    return true;
>> -}
>> -
>>   static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>           struct dpu_encoder_phys *phys_enc)
>>   {
>> @@ -732,7 +723,6 @@ static void dpu_encoder_phys_cmd_init_ops(
>>       ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;
>>       ops->is_master = dpu_encoder_phys_cmd_is_master;
>>       ops->mode_set = dpu_encoder_phys_cmd_mode_set;
>> -    ops->mode_fixup = dpu_encoder_phys_cmd_mode_fixup;
>>       ops->enable = dpu_encoder_phys_cmd_enable;
>>       ops->disable = dpu_encoder_phys_cmd_disable;
>>       ops->destroy = dpu_encoder_phys_cmd_destroy;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> index ddd9d89cd456..1831fe37c88c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> @@ -225,19 +225,6 @@ static void programmable_fetch_config(struct 
>> dpu_encoder_phys *phys_enc,
>>       spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
>>   }
>> -static bool dpu_encoder_phys_vid_mode_fixup(
>> -        struct dpu_encoder_phys *phys_enc,
>> -        const struct drm_display_mode *mode,
>> -        struct drm_display_mode *adj_mode)
>> -{
>> -    DPU_DEBUG_VIDENC(phys_enc, "\n");
>> -
>> -    /*
>> -     * Modifying mode has consequences when the mode comes back to us
>> -     */
>> -    return true;
>> -}
>> -
>>   static void dpu_encoder_phys_vid_setup_timing_engine(
>>           struct dpu_encoder_phys *phys_enc)
>>   {
>> @@ -676,7 +663,6 @@ static void dpu_encoder_phys_vid_init_ops(struct 
>> dpu_encoder_phys_ops *ops)
>>   {
>>       ops->is_master = dpu_encoder_phys_vid_is_master;
>>       ops->mode_set = dpu_encoder_phys_vid_mode_set;
>> -    ops->mode_fixup = dpu_encoder_phys_vid_mode_fixup;
>>       ops->enable = dpu_encoder_phys_vid_enable;
>>       ops->disable = dpu_encoder_phys_vid_disable;
>>       ops->destroy = dpu_encoder_phys_vid_destroy;


-- 
With best wishes
Dmitry
