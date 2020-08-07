Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0ED523EDC9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 15:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgHGNNP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 09:13:15 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:16348 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726067AbgHGNNN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 09:13:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596805991; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1VgVkuCTjpRCi5kVKzU4GCa2g/ve+RIbwEZSuSegBn0=;
 b=NaWoDowqg+UEqYlBfdLmQVafRM6PXjnSzICsrulmGA7tUW0Uw/IOOJICAzK2i3xJB+OyUbW8
 zhmXIVDYowVJn87OQnzXkLKKMc2RQRdqIKs3IVLzhLchkKJyUWTa77jJl5OwZItWDjxvNxDc
 Ktr7Rl9MuRZWnCXE1Wz9FJmnSb8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-west-2.postgun.com with SMTP id
 5f2d536703528d4024a6e53b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 07 Aug 2020 13:13:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 06CE2C43391; Fri,  7 Aug 2020 13:13:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kalyan_t)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 239C3C433C9;
        Fri,  7 Aug 2020 13:13:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 07 Aug 2020 18:43:10 +0530
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
Subject: Re: [Freedreno] [v1] drm/msm/dpu: Fix reservation failures in modeset
In-Reply-To: <CAF6AEGu2Lfb94kjnd7+GU_c93z0Zw2SgQ==UcrjPg3Wah=24ng@mail.gmail.com>
References: <1596634446-1413-1-git-send-email-kalyan_t@codeaurora.org>
 <CAF6AEGtWNDGDsUBVk-Ud5OpretHA4qKDKtE+3mS=C8DAa=+Heg@mail.gmail.com>
 <1101abba0c8082da196f36636ef07a84@codeaurora.org>
 <CAF6AEGu2Lfb94kjnd7+GU_c93z0Zw2SgQ==UcrjPg3Wah=24ng@mail.gmail.com>
Message-ID: <0414fe65f9e3c21f64b13158eef653ee@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-08-06 22:15, Rob Clark wrote:
> On Thu, Aug 6, 2020 at 7:46 AM <kalyan_t@codeaurora.org> wrote:
>> 
>> On 2020-08-05 21:18, Rob Clark wrote:
>> > On Wed, Aug 5, 2020 at 6:34 AM Kalyan Thota <kalyan_t@codeaurora.org>
>> > wrote:
>> >>
>> >> In TEST_ONLY commit, rm global_state will duplicate the
>> >> object and request for new reservations, once they pass
>> >> then the new state will be swapped with the old and will
>> >> be available for the Atomic Commit.
>> >>
>> >> This patch fixes some of missing links in the resource
>> >> reservation sequence mentioned above.
>> >>
>> >> 1) Creation of a duplicate state in test_only commit (Rob)
>> >> 2) Allow resource release only during crtc_active false.
>> >>
>> >> For #2
>> >> In a modeset operation, swap state happens well before disable.
>> >> Hence clearing reservations in disable will cause failures
>> >> in modeset enable.
>> >>
>> >> Sequence:
>> >>     Swap state --> old, new
>> >>     modeset disables --> virt disable
>> >>     modeset enable --> virt modeset
>> >>
>> >> Allow reservations to be cleared only when crtc active is false
>> >> as in that case there wont be any modeset enable after disable.
>> >>
>> >> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>> >> ---
>> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 +++++--
>> >>  1 file changed, 5 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> >> index 63976dc..b85a576 100644
>> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> >> @@ -582,7 +582,7 @@ static int dpu_encoder_virt_atomic_check(
>> >>         dpu_kms = to_dpu_kms(priv->kms);
>> >>         mode = &crtc_state->mode;
>> >>         adj_mode = &crtc_state->adjusted_mode;
>> >> -       global_state = dpu_kms_get_existing_global_state(dpu_kms);
>> >> +       global_state = dpu_kms_get_global_state(crtc_state->state);
>> >>         trace_dpu_enc_atomic_check(DRMID(drm_enc));
>> >>
>> >>         /*
>> >> @@ -1172,6 +1172,7 @@ static void dpu_encoder_virt_disable(struct
>> >> drm_encoder *drm_enc)
>> >>         struct msm_drm_private *priv;
>> >>         struct dpu_kms *dpu_kms;
>> >>         struct dpu_global_state *global_state;
>> >> +       struct drm_crtc_state *crtc_state;
>> >>         int i = 0;
>> >>
>> >>         if (!drm_enc) {
>> >> @@ -1191,6 +1192,7 @@ static void dpu_encoder_virt_disable(struct
>> >> drm_encoder *drm_enc)
>> >>         priv = drm_enc->dev->dev_private;
>> >>         dpu_kms = to_dpu_kms(priv->kms);
>> >>         global_state = dpu_kms_get_existing_global_state(dpu_kms);
>> >> +       crtc_state = drm_enc->crtc->state;
>> >>
>> >>         trace_dpu_enc_disable(DRMID(drm_enc));
>> >>
>> >> @@ -1220,7 +1222,8 @@ static void dpu_encoder_virt_disable(struct
>> >> drm_encoder *drm_enc)
>> >>
>> >>         DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
>> >>
>> >> -       dpu_rm_release(global_state, drm_enc);
>> >> +       if (crtc_state->active_changed && !crtc_state->active)
>> >> +               dpu_rm_release(global_state, drm_enc);
>> >
>> > I still think releasing the state in the atomic_commit() path is the
>> > wrong thing to do.  In the commit path, the various state objects
>> > should be immutable.. ie. in the atomic_test() path you derive the new
>> > hw state (including assignment/release of resources), and
>> > atomic_commit() is simply pushing the state down to the hw.
>> >
>> > Otherwise, this looks better than v1.
>> >
>> > BR,
>> > -R
>> >
>> okay. Should we avoid reservation all together if active=0 on that 
>> crtc
>> and trigger rm_release on the enc during atomic_check ?
>> how do you see the approach ?
> 
> Yeah, I suppose something like:
> 
>    if (drm_atomic_crtc_needs_modeset()) {
>       reserve()
>    } else if (active_changed && !active) {
>       release()
>    }
> 
> I think it could happen (at least with atomic api) that you get a
> modeset without active_changed, so we might need to release() and then
> reserve() in that case?  (This is probably where starting to run more
> IGT tests would be useful)
> 
> BR,
> -R
> Thanks Rob, please review the v2 version.
>> -Kalyan
>> >>
>> >>         mutex_unlock(&dpu_enc->enc_lock);
>> >>  }
>> >> --
>> >> 1.9.1
>> >>
>> > _______________________________________________
>> > Freedreno mailing list
>> > Freedreno@lists.freedesktop.org
>> > https://lists.freedesktop.org/mailman/listinfo/freedreno
