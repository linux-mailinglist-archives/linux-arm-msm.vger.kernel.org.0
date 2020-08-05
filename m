Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F9F23D073
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Aug 2020 21:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgHETsx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 15:48:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:62418 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728144AbgHETs1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 15:48:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596656907; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=S5hJFYd7MMSkEoR3CdrZ7jrWlq63SZiOAFEvmVnWV/Q=;
 b=hor2rACTywoxo1RQS+ifvGukah2C0b/GAH9CrMqmwY6PnXzk4B+uvNhJwKUBtSIhLcJAeKrK
 9BRytAvRNumlpicNut8Ea6Cx78hAmGGcbCh2CxP/KAk+bAI/YKwl2nc3I689RZxInG62sejE
 IDbiMjeJdVrcFIePuJyLnHJTuzU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-east-1.postgun.com with SMTP id
 5f2abfa7eecfc978d337cfbe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 05 Aug 2020 14:18:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C623EC433C6; Wed,  5 Aug 2020 14:18:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kalyan_t)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EE057C433C9;
        Wed,  5 Aug 2020 14:18:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 05 Aug 2020 19:48:13 +0530
From:   kalyan_t@codeaurora.org
To:     Rob Clark <robdclark@gmail.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Douglas Anderson <dianders@chromium.org>,
        nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Drew Davenport <ddavenport@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [Freedreno] [v1] drm/msm/dpu: update reservations in commit path
In-Reply-To: <CAF6AEGtpPU+ALcpQMuy-MpLF_ZwjD+k=aN7gkoBFjJPq1++9qQ@mail.gmail.com>
References: <1596540744-6902-1-git-send-email-kalyan_t@codeaurora.org>
 <CAF6AEGtpPU+ALcpQMuy-MpLF_ZwjD+k=aN7gkoBFjJPq1++9qQ@mail.gmail.com>
Message-ID: <37bbf6e41a844f681e263bc13bd6e7ef@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-05 01:02, Rob Clark wrote:
> On Tue, Aug 4, 2020 at 4:32 AM Kalyan Thota <kalyan_t@codeaurora.org> 
> wrote:
>> 
>> DPU resources reserved in the atomic_check path gets unwinded
>> during modeset operation before commit happens in a non seamless
>> transition.
>> 
>> Update the reservations in the commit path to avoid resource
>> failures. Secondly have dummy reservations in atomic_check path
>> so that we can gracefully fail the composition if resources are
>> not available.
>> 
>> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 +++++++++++----
>>  1 file changed, 11 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 63976dc..c6b8254 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -565,7 +565,7 @@ static int dpu_encoder_virt_atomic_check(
>>         const struct drm_display_mode *mode;
>>         struct drm_display_mode *adj_mode;
>>         struct msm_display_topology topology;
>> -       struct dpu_global_state *global_state;
>> +       struct dpu_global_state tmp_resv_state;
>>         int i = 0;
>>         int ret = 0;
>> 
>> @@ -582,7 +582,7 @@ static int dpu_encoder_virt_atomic_check(
>>         dpu_kms = to_dpu_kms(priv->kms);
>>         mode = &crtc_state->mode;
>>         adj_mode = &crtc_state->adjusted_mode;
>> -       global_state = dpu_kms_get_existing_global_state(dpu_kms);
>> +       memset(&tmp_resv_state, 0, sizeof(tmp_resv_state));
> 
> I think what you want to do is dpu_kms_get_global_state().. that will
> clone/duplicate the existing global state (or return the already
> duplicated global state if it is called multiple times).
> 
Thanks Rob, realized the same after posting patch. Made changes in the 
new patch
accordingly.

> It is safe to modify this global state in the atomic_check() path.. in
> fact that is the intention.  For a TEST_ONLY atomic commit, or if any
> of the atomic_check()'s fail, this new duplicated global state is
> discarded.  If all the checks succeed and the atomic update is
> committed to hw, this new global state replaces the existing global
> state.
> 
Posted a new change kindly review.

> BR,
> -R
> 
>>         trace_dpu_enc_atomic_check(DRMID(drm_enc));
>> 
>>         /*
>> @@ -621,7 +621,7 @@ static int dpu_encoder_virt_atomic_check(
>>                  * info may not be available to complete reservation.
>>                  */
>>                 if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>> -                       ret = dpu_rm_reserve(&dpu_kms->rm, 
>> global_state,
>> +                       ret = dpu_rm_reserve(&dpu_kms->rm, 
>> &tmp_resv_state,
>>                                         drm_enc, crtc_state, 
>> topology);
>>                 }
>>         }
>> @@ -966,7 +966,7 @@ static void dpu_encoder_virt_mode_set(struct 
>> drm_encoder *drm_enc,
>>         struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>>         struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
>>         int num_lm, num_ctl, num_pp, num_dspp;
>> -       int i, j;
>> +       int i, j, rc;
>> 
>>         if (!drm_enc) {
>>                 DPU_ERROR("invalid encoder\n");
>> @@ -1006,6 +1006,13 @@ static void dpu_encoder_virt_mode_set(struct 
>> drm_encoder *drm_enc,
>> 
>>         topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, 
>> adj_mode);
>> 
>> +       rc = dpu_rm_reserve(&dpu_kms->rm, global_state, drm_enc,
>> +               drm_crtc->state, topology);
>> +       if (rc) {
>> +               DPU_ERROR_ENC(dpu_enc, "Failed to reserve 
>> resources\n");
>> +               return;
>> +       }
>> +
>>         /* Query resource that have been reserved in atomic check 
>> step. */
>>         num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, 
>> global_state,
>>                 drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
>> --
>> 1.9.1
>> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
