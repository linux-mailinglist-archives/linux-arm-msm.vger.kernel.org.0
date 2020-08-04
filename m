Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4869023BFFD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 21:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgHDTbt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Aug 2020 15:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgHDTbr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Aug 2020 15:31:47 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B68B7C06174A;
        Tue,  4 Aug 2020 12:31:46 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id q4so27510778edv.13;
        Tue, 04 Aug 2020 12:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lPQhi2EGIWphqgXXS6/LgcuZPutzCILAsqJJu6qo/8w=;
        b=b22tYC6z9W/pbIRO7pJWfs9ARLlciURv3Ksmck7YruC7f5u3NH1DKq5lVFgz/t3qqV
         W/JlYe5Bl2+t9oCR8Sm1qfSKQzMujgg9Wg2C7ZkGJaLqh6A5jLqskKrWqViCYnmNo2L+
         nv8/HgDn0+cqpExXpEniNbSJ6qBDHGZm0HQQZQT3fdWO9PhLxX8N/ASz+EutLp3lgAfl
         ZaJExNIczPugzHIw3Mr9HKcuQzQduUi6thP4zEXv05vIbEYRCHykgfBC2e9kebRjQJfh
         UtetO4nSPpY1RhZbbDpNiLPTTrmkAqr6t4wGjJV1NHzPoWjmNP1koKNIZD7ta2+c2X/X
         ssQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lPQhi2EGIWphqgXXS6/LgcuZPutzCILAsqJJu6qo/8w=;
        b=G6wZe8UNHVApQ5lwizhuL/8Bws9Zniz3zUiprdS8fNhJha/PE0+Eh+vIl6WqaklvAt
         P8Ec6t9/Z18SCRsfDNmqgvK+ErwT9NV9JYGMBNkEsuVJ2TueAF5Jd4fcGpzJGDvSBz1U
         7YY3ahax4t/Nfz6d95nrr7ak1YF1v+8mUZW2kmC8yQ2iS/eMRhkBJj3efJr36tktIIA+
         NC/fFzfmtNdgkWIMxH9OcYQ/1cOzCnpv3A6colUH7aWlAdTdplYkWPkR+4KJf4YB5G/+
         j6y0E6hBrgvAbOJaVI2gYrEq8CINFm2BYR9jGc3SCfBlyBJNXMwyx+eAYU8T4XzzELEc
         WoNA==
X-Gm-Message-State: AOAM533c/IBhMYXapF6XCJdcCXQvGKxKUpv45up+V4UkMC3v8h11vuZR
        H1K0zo0Go5849YML+AKE6cz1cT1zSEVsCuY6Cyc=
X-Google-Smtp-Source: ABdhPJyWzQIa1aqdPHfKxqQQpi7/uDtf+blsHcQxkD1HTdQTfhXqWmSKU5IaGYgFNsjgBZf8SpKdcLXhi7nHsJkqAV4=
X-Received: by 2002:a50:fd16:: with SMTP id i22mr21981071eds.281.1596569505319;
 Tue, 04 Aug 2020 12:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <1596540744-6902-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1596540744-6902-1-git-send-email-kalyan_t@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 4 Aug 2020 12:32:29 -0700
Message-ID: <CAF6AEGtpPU+ALcpQMuy-MpLF_ZwjD+k=aN7gkoBFjJPq1++9qQ@mail.gmail.com>
Subject: Re: [v1] drm/msm/dpu: update reservations in commit path
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        nganji@codeaurora.org, Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Drew Davenport <ddavenport@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 4, 2020 at 4:32 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> DPU resources reserved in the atomic_check path gets unwinded
> during modeset operation before commit happens in a non seamless
> transition.
>
> Update the reservations in the commit path to avoid resource
> failures. Secondly have dummy reservations in atomic_check path
> so that we can gracefully fail the composition if resources are
> not available.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 63976dc..c6b8254 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -565,7 +565,7 @@ static int dpu_encoder_virt_atomic_check(
>         const struct drm_display_mode *mode;
>         struct drm_display_mode *adj_mode;
>         struct msm_display_topology topology;
> -       struct dpu_global_state *global_state;
> +       struct dpu_global_state tmp_resv_state;
>         int i = 0;
>         int ret = 0;
>
> @@ -582,7 +582,7 @@ static int dpu_encoder_virt_atomic_check(
>         dpu_kms = to_dpu_kms(priv->kms);
>         mode = &crtc_state->mode;
>         adj_mode = &crtc_state->adjusted_mode;
> -       global_state = dpu_kms_get_existing_global_state(dpu_kms);
> +       memset(&tmp_resv_state, 0, sizeof(tmp_resv_state));

I think what you want to do is dpu_kms_get_global_state().. that will
clone/duplicate the existing global state (or return the already
duplicated global state if it is called multiple times).

It is safe to modify this global state in the atomic_check() path.. in
fact that is the intention.  For a TEST_ONLY atomic commit, or if any
of the atomic_check()'s fail, this new duplicated global state is
discarded.  If all the checks succeed and the atomic update is
committed to hw, this new global state replaces the existing global
state.

BR,
-R

>         trace_dpu_enc_atomic_check(DRMID(drm_enc));
>
>         /*
> @@ -621,7 +621,7 @@ static int dpu_encoder_virt_atomic_check(
>                  * info may not be available to complete reservation.
>                  */
>                 if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> -                       ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> +                       ret = dpu_rm_reserve(&dpu_kms->rm, &tmp_resv_state,
>                                         drm_enc, crtc_state, topology);
>                 }
>         }
> @@ -966,7 +966,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>         struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>         struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
>         int num_lm, num_ctl, num_pp, num_dspp;
> -       int i, j;
> +       int i, j, rc;
>
>         if (!drm_enc) {
>                 DPU_ERROR("invalid encoder\n");
> @@ -1006,6 +1006,13 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>
>         topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
>
> +       rc = dpu_rm_reserve(&dpu_kms->rm, global_state, drm_enc,
> +               drm_crtc->state, topology);
> +       if (rc) {
> +               DPU_ERROR_ENC(dpu_enc, "Failed to reserve resources\n");
> +               return;
> +       }
> +
>         /* Query resource that have been reserved in atomic check step. */
>         num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>                 drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
> --
> 1.9.1
>
