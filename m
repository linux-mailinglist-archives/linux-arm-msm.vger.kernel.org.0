Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0932C1A24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 01:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729399AbgKXAjD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 19:39:03 -0500
Received: from z5.mailgun.us ([104.130.96.5]:41546 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728093AbgKXAjD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 19:39:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606178341; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hs8EW7bPfuYiy2WlNq9IsOrwvJXuF+szh5J2TAIP5RM=;
 b=b44BGUWtspTMcKiqWnb+AioKPvCplUut03LPFL+E4HpZ40bYPbe0NEk+ju3zyNMw3iEhIhrM
 Ghrm1W3mqhXc4jvRso9d3jxdJIqwhJuIxoYtaOZtOgMT7RmvorqiqKLYr+rq6FfmjnDgcvh2
 +vYk98mufi6TbgZdGjgMVnCnbD4=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fbc561722377520ee256f0b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 00:38:47
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 458FAC433ED; Tue, 24 Nov 2020 00:38:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BE2BDC433C6;
        Tue, 24 Nov 2020 00:38:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Nov 2020 16:38:44 -0800
From:   abhinavk@codeaurora.org
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, nganji@codeaurora.org,
        aravindh@codeaurora.org, Tanmay Shah <tanmay@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dpu: update the qos remap only if the client type
 changes
In-Reply-To: <CAF6AEGsWVKCAE3CetZagbvRNZAU00FaoWSvaDxxOafNRY5dz1g@mail.gmail.com>
References: <20201119214145.10182-1-abhinavk@codeaurora.org>
 <CAF6AEGsWVKCAE3CetZagbvRNZAU00FaoWSvaDxxOafNRY5dz1g@mail.gmail.com>
Message-ID: <71e2d86b935fe043eb1203045783439d@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob

On 2020-11-23 15:18, Rob Clark wrote:
> On Thu, Nov 19, 2020 at 1:41 PM Abhinav Kumar <abhinavk@codeaurora.org> 
> wrote:
>> 
>> Update the qos remap only if the client type changes for the plane.
>> This will avoid unnecessary register programming and also avoid log
>> spam from the dpu_vbif_set_qos_remap() function.
>> 
>> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 17 +++++++++++++++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  7 +++++++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 ++
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 12 ++++++++++--
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  5 +++++
>>  5 files changed, 41 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index d4662e8184cc..3867da47c683 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1037,6 +1037,23 @@ static int dpu_crtc_atomic_check(struct 
>> drm_crtc *crtc,
>>         return rc;
>>  }
>> 
>> +void dpu_crtc_set_qos_dirty(struct drm_crtc *crtc)
>> +{
>> +       struct drm_plane *plane;
>> +       struct drm_plane_state *state;
>> +       struct dpu_plane_state *pstate;
>> +
>> +       drm_atomic_crtc_for_each_plane(plane, crtc) {
>> +               state = plane->state;
>> +               if (!state)
>> +                       continue;
>> +
>> +               pstate = to_dpu_plane_state(state);
>> +
>> +               pstate->dirty |= DPU_PLANE_DIRTY_QOS;
>> +       }
>> +}
>> +
>>  int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
>>  {
>>         struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>> index cec3474340e8..8ba11de605bc 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>> @@ -231,6 +231,13 @@ static inline int dpu_crtc_frame_pending(struct 
>> drm_crtc *crtc)
>>   */
>>  int dpu_crtc_vblank(struct drm_crtc *crtc, bool en);
>> 
>> +/**
>> + * dpu_crtc_set_qos_dirty - update plane dirty flag to include
>> + * QoS reprogramming
>> + * @crtc: Pointer to drm crtc structure
>> + */
>> +void dpu_crtc_set_qos_dirty(struct drm_crtc *crtc);
>> +
>>  /**
>>   * dpu_crtc_vblank_callback - called on vblank irq, issues completion 
>> events
>>   * @crtc: Pointer to drm crtc object
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index f7f5c258b553..c2db9dd6ec67 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1001,6 +1001,8 @@ static void dpu_encoder_virt_mode_set(struct 
>> drm_encoder *drm_enc,
>> 
>>         trace_dpu_enc_mode_set(DRMID(drm_enc));
>> 
>> +       dpu_crtc_set_qos_dirty(drm_enc->crtc);
>> +
>>         if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && 
>> priv->dp)
>>                 msm_dp_display_mode_set(priv->dp, drm_enc, mode, 
>> adj_mode);
>> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 7ea90d25a3b6..f91d31a31e14 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -1066,6 +1066,7 @@ static void dpu_plane_sspp_atomic_update(struct 
>> drm_plane *plane)
>>         struct dpu_plane_state *pstate = to_dpu_plane_state(state);
>>         struct drm_crtc *crtc = state->crtc;
>>         struct drm_framebuffer *fb = state->fb;
>> +       bool is_rt_pipe;
>>         const struct dpu_format *fmt =
>>                 to_dpu_format(msm_framebuffer_format(fb));
>> 
>> @@ -1075,7 +1076,7 @@ static void dpu_plane_sspp_atomic_update(struct 
>> drm_plane *plane)
>> 
>>         pstate->pending = true;
>> 
>> -       pdpu->is_rt_pipe = (dpu_crtc_get_client_type(crtc) != 
>> NRT_CLIENT);
>> +       is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
>>         _dpu_plane_set_qos_ctrl(plane, false, 
>> DPU_PLANE_QOS_PANIC_CTRL);
>> 
>>         DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " 
>> DRM_RECT_FMT
>> @@ -1181,8 +1182,15 @@ static void dpu_plane_sspp_atomic_update(struct 
>> drm_plane *plane)
>>                 _dpu_plane_set_ot_limit(plane, crtc);
>>         }
>> 
>> -       _dpu_plane_set_qos_remap(plane);
>> +       if (is_rt_pipe != pdpu->is_rt_pipe) {
>> +               pdpu->is_rt_pipe = is_rt_pipe;
>> +               pstate->dirty |= DPU_PLANE_DIRTY_QOS;
>> +       }
>> 
>> +       if (pstate->dirty & DPU_PLANE_DIRTY_QOS) {
>> +               _dpu_plane_set_qos_remap(plane);
>> +               pstate->dirty = 0x0;
>> +       }
> 
> So in the end, this looks roughly like "set qos remap on modesets or
> switching between right/left pipe"?  Couldn't this be simpler if in
> plane->atomic_check() you do something like:
> 
>    dpu_plane_state->needs_qos_remap = atomic_state->allow_modeset;
> 
> and then in plane->atomic_update:
> 
>     if (pstate->needs_qos_remap || (is_rt_pipe != pdpu->is_rt_pipe) {
>          pdpu->is_rt_pipe = is_rt_pipe;
>          _dpu_plane_set_qos_remap(plane)
>     }
> 
> ?
> 
> BR,
> -R
Thanks for the suggestion, Yes this will make it much simpler. Let me 
update it.

Just one clarification, I believe you meant that
dpu_plane_state->needs_qos_remap = 
drm_atomic_crtc_needs_modeset(crtc_state)

and then the rest of it looks fine to me.

> 
> 
>>         _dpu_plane_calc_bw(plane, fb);
>> 
>>         _dpu_plane_calc_clk(plane);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>> index ca83b8753d59..47abd3686a86 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>> @@ -14,11 +14,15 @@
>>  #include "dpu_hw_mdss.h"
>>  #include "dpu_hw_sspp.h"
>> 
>> +/* dirty bits to update QOS */
>> +#define DPU_PLANE_DIRTY_QOS 0x1
>> +
>>  /**
>>   * struct dpu_plane_state: Define dpu extension of drm plane state 
>> object
>>   * @base:      base drm plane state object
>>   * @aspace:    pointer to address space for input/output buffers
>>   * @stage:     assigned by crtc blender
>> + * @dirty:     bitmask for which pipe h/w config functions need to be 
>> updated
>>   * @multirect_index: index of the rectangle of SSPP
>>   * @multirect_mode: parallel or time multiplex multirect mode
>>   * @pending:   whether the current update is still pending
>> @@ -32,6 +36,7 @@ struct dpu_plane_state {
>>         struct drm_plane_state base;
>>         struct msm_gem_address_space *aspace;
>>         enum dpu_stage stage;
>> +       uint32_t dirty;
>>         uint32_t multirect_index;
>>         uint32_t multirect_mode;
>>         bool pending;
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
