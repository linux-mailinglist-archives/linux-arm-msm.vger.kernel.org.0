Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8C0828EF47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 11:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727652AbgJOJSD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 05:18:03 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:47209 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729251AbgJOJSD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 05:18:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602753482; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=iog80H5kgzzCUzTz3Y3JE52VmzSpGS6n8ZielLfUYZM=;
 b=qebK3yS4UPO+3hZdzaly41kL4QGgVQgSt+8eT87xDPc9cOr7LBQJxEyrLDsRFbdPyisqdE/6
 y4gS9/MfI0mOSlgmoXWax7syLC0oEf+oa+vTc/oVKlVYCGxO1vzt2BOMvAN1dKzHOSU/7X+L
 OWjQmC4oYB9CNTpseEGNwPvL4h0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f8813c957b88ccb565517b2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 15 Oct 2020 09:18:01
 GMT
Sender: mkrishn=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 90AEDC43385; Thu, 15 Oct 2020 09:18:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mkrishn)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D71AC433C9;
        Thu, 15 Oct 2020 09:18:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 15 Oct 2020 14:48:00 +0530
From:   mkrishn@codeaurora.org
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [v1] drm/msm: Fix race condition in msm driver with async layer
 updates
In-Reply-To: <CAF6AEGtQEbGVQdNPSaHy41gqsiLV19X8kxMVCRUy8y1SzjTZGw@mail.gmail.com>
References: <1602680296-8965-1-git-send-email-mkrishn@codeaurora.org>
 <CAF6AEGtQEbGVQdNPSaHy41gqsiLV19X8kxMVCRUy8y1SzjTZGw@mail.gmail.com>
Message-ID: <dda1ec958f188216b067fd40a36eb41d@codeaurora.org>
X-Sender: mkrishn@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-14 20:55, Rob Clark wrote:
> On Wed, Oct 14, 2020 at 5:58 AM Krishna Manikandan
> <mkrishn@codeaurora.org> wrote:
>> 
>> When there are back to back commits with async cursor update,
>> there is a case where second commit can program the DPU hw
>> blocks while first didn't complete flushing config to HW.
>> 
>> Synchronize the compositions such that second commit waits
>> until first commit flushes the composition.
>> 
>> This change also introduces per crtc commit lock, such that
>> commits on different crtcs are not blocked by each other.
>> 
>> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  1 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  1 +
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 26 
>> ++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/msm_atomic.c         | 35 
>> ++++++++++++++++++++++----------
>>  drivers/gpu/drm/msm/msm_kms.h            |  5 +++++
>>  5 files changed, 57 insertions(+), 11 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index c2729f7..9024719 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1383,6 +1383,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device 
>> *dev, struct drm_plane *plane,
>> 
>>         /* initialize event handling */
>>         spin_lock_init(&dpu_crtc->event_lock);
>> +       mutex_init(&dpu_crtc->commit_lock);
>> 
>>         DPU_DEBUG("%s: successfully initialized crtc\n", 
>> dpu_crtc->name);
>>         return crtc;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>> index cec3474..1eeb73d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
>> @@ -169,6 +169,7 @@ struct dpu_crtc {
>> 
>>         /* for handling internal event thread */
>>         spinlock_t event_lock;
>> +       struct mutex commit_lock;
>> 
>>         struct dpu_core_perf_params cur_perf;
>> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index c0a4d4e..f99ae7a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -445,6 +445,30 @@ static void dpu_kms_wait_flush(struct msm_kms 
>> *kms, unsigned crtc_mask)
>>                 dpu_kms_wait_for_commit_done(kms, crtc);
>>  }
>> 
>> +static void dpu_kms_commit_lock(struct msm_kms *kms, unsigned int 
>> crtc_mask)
>> +{
>> +       struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>> +       struct drm_crtc *crtc;
>> +       struct dpu_crtc *dpu_crtc;
>> +
>> +       for_each_crtc_mask(dpu_kms->dev, crtc, crtc_mask) {
>> +               dpu_crtc = to_dpu_crtc(crtc);
>> +               mutex_lock(&dpu_crtc->commit_lock);
>> +       }
>> +}
>> +
>> +static void dpu_kms_commit_unlock(struct msm_kms *kms, unsigned int 
>> crtc_mask)
>> +{
>> +       struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>> +       struct drm_crtc *crtc;
>> +       struct dpu_crtc *dpu_crtc;
>> +
>> +       for_each_crtc_mask(dpu_kms->dev, crtc, crtc_mask) {
>> +               dpu_crtc = to_dpu_crtc(crtc);
>> +               mutex_unlock(&dpu_crtc->commit_lock);
>> +       }
>> +}
>> +
>>  static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>>                                     struct msm_drm_private *priv,
>>                                     struct dpu_kms *dpu_kms)
>> @@ -738,6 +762,8 @@ static const struct msm_kms_funcs kms_funcs = {
>>  #ifdef CONFIG_DEBUG_FS
>>         .debugfs_init    = dpu_kms_debugfs_init,
>>  #endif
>> +       .commit_lock     = dpu_kms_commit_lock,
>> +       .commit_unlock   = dpu_kms_commit_unlock,
>>  };
>> 
>>  static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
>> diff --git a/drivers/gpu/drm/msm/msm_atomic.c 
>> b/drivers/gpu/drm/msm/msm_atomic.c
>> index 561bfa4..d33253f 100644
>> --- a/drivers/gpu/drm/msm/msm_atomic.c
>> +++ b/drivers/gpu/drm/msm/msm_atomic.c
>> @@ -55,16 +55,32 @@ static void vblank_put(struct msm_kms *kms, 
>> unsigned crtc_mask)
>>         }
>>  }
>> 
>> +static void msm_commit_lock(struct msm_kms *kms, unsigned int 
>> crtc_mask)
>> +{
>> +       if (kms->funcs->commit_lock)
>> +               kms->funcs->commit_lock(kms, crtc_mask);
>> +       else
>> +               mutex_lock(&kms->commit_lock);
>> +}
>> +
>> +static void msm_commit_unlock(struct msm_kms *kms, unsigned int 
>> crtc_mask)
>> +{
>> +       if (kms->funcs->commit_unlock)
>> +               kms->funcs->commit_unlock(kms, crtc_mask);
>> +       else
>> +               mutex_unlock(&kms->commit_lock);
>> +}
> 
> Hi, I think the per-crtc commit-lock, and the updated
> locking/unlocking points are the right thing to do, but I don't think
> we need to touch dpu for this.  Just change kms->commit_lock to an
> array of mutexes, and drop the vfunc indirection.  All the same
> locking logic applies to mdp4/mdp5 as well (ie. don't touch the hw
> until it has flushed)
> 
> BR,
> -R
> 

Thanks for the comments Rob. I have addressed them in v2 patch.

Regards,
Krishna
>> +
>>  static void msm_atomic_async_commit(struct msm_kms *kms, int 
>> crtc_idx)
>>  {
>>         unsigned crtc_mask = BIT(crtc_idx);
>> 
>>         trace_msm_atomic_async_commit_start(crtc_mask);
>> 
>> -       mutex_lock(&kms->commit_lock);
>> +       msm_commit_lock(kms, crtc_mask);
>> 
>>         if (!(kms->pending_crtc_mask & crtc_mask)) {
>> -               mutex_unlock(&kms->commit_lock);
>> +               msm_commit_unlock(kms, crtc_mask);
>>                 goto out;
>>         }
>> 
>> @@ -79,7 +95,6 @@ static void msm_atomic_async_commit(struct msm_kms 
>> *kms, int crtc_idx)
>>          */
>>         trace_msm_atomic_flush_commit(crtc_mask);
>>         kms->funcs->flush_commit(kms, crtc_mask);
>> -       mutex_unlock(&kms->commit_lock);
>> 
>>         /*
>>          * Wait for flush to complete:
>> @@ -90,9 +105,8 @@ static void msm_atomic_async_commit(struct msm_kms 
>> *kms, int crtc_idx)
>> 
>>         vblank_put(kms, crtc_mask);
>> 
>> -       mutex_lock(&kms->commit_lock);
>>         kms->funcs->complete_commit(kms, crtc_mask);
>> -       mutex_unlock(&kms->commit_lock);
>> +       msm_commit_unlock(kms, crtc_mask);
>>         kms->funcs->disable_commit(kms);
>> 
>>  out:
>> @@ -189,12 +203,11 @@ void msm_atomic_commit_tail(struct 
>> drm_atomic_state *state)
>>          * Ensure any previous (potentially async) commit has
>>          * completed:
>>          */
>> +       msm_commit_lock(kms, crtc_mask);
>>         trace_msm_atomic_wait_flush_start(crtc_mask);
>>         kms->funcs->wait_flush(kms, crtc_mask);
>>         trace_msm_atomic_wait_flush_finish(crtc_mask);
>> 
>> -       mutex_lock(&kms->commit_lock);
>> -
>>         /*
>>          * Now that there is no in-progress flush, prepare the
>>          * current update:
>> @@ -232,7 +245,7 @@ void msm_atomic_commit_tail(struct 
>> drm_atomic_state *state)
>>                 }
>> 
>>                 kms->funcs->disable_commit(kms);
>> -               mutex_unlock(&kms->commit_lock);
>> +               msm_commit_unlock(kms, crtc_mask);
>> 
>>                 /*
>>                  * At this point, from drm core's perspective, we
>> @@ -260,7 +273,7 @@ void msm_atomic_commit_tail(struct 
>> drm_atomic_state *state)
>>          */
>>         trace_msm_atomic_flush_commit(crtc_mask);
>>         kms->funcs->flush_commit(kms, crtc_mask);
>> -       mutex_unlock(&kms->commit_lock);
>> +       msm_commit_unlock(kms, crtc_mask);
>> 
>>         /*
>>          * Wait for flush to complete:
>> @@ -271,9 +284,9 @@ void msm_atomic_commit_tail(struct 
>> drm_atomic_state *state)
>> 
>>         vblank_put(kms, crtc_mask);
>> 
>> -       mutex_lock(&kms->commit_lock);
>> +       msm_commit_lock(kms, crtc_mask);
>>         kms->funcs->complete_commit(kms, crtc_mask);
>> -       mutex_unlock(&kms->commit_lock);
>> +       msm_commit_unlock(kms, crtc_mask);
>>         kms->funcs->disable_commit(kms);
>> 
>>         drm_atomic_helper_commit_hw_done(state);
>> diff --git a/drivers/gpu/drm/msm/msm_kms.h 
>> b/drivers/gpu/drm/msm/msm_kms.h
>> index 1cbef6b..f02e73e 100644
>> --- a/drivers/gpu/drm/msm/msm_kms.h
>> +++ b/drivers/gpu/drm/msm/msm_kms.h
>> @@ -126,6 +126,11 @@ struct msm_kms_funcs {
>>         /* debugfs: */
>>         int (*debugfs_init)(struct msm_kms *kms, struct drm_minor 
>> *minor);
>>  #endif
>> +       /* commit lock for crtc */
>> +       void (*commit_lock)(struct msm_kms *kms, unsigned int 
>> crtc_mask);
>> +
>> +       /* commit unlock for crtc */
>> +       void (*commit_unlock)(struct msm_kms *kms, unsigned int 
>> crtc_mask);
>>  };
>> 
>>  struct msm_kms;
>> --
>> 2.7.4
>> 
