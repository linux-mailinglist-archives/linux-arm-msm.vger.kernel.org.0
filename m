Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8448123F48C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 23:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgHGVpj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 17:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgHGVpj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 17:45:39 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36F0C061756;
        Fri,  7 Aug 2020 14:45:38 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k8so3124180wma.2;
        Fri, 07 Aug 2020 14:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gSc3WQ+g0bVD00tftXx475OyaG+MO1Rw6PTdZ2MSKss=;
        b=FEWJCMbk5AFlc069+ExQrG8l1jxFukCak7ElgUpHyVLEw4kEH+1RKYn1OWWQK8Qw52
         Po3jwqb82+6HPsar2ubPm31bJncsy2zL2b00voh4MH1vE/yvAgEq9e3Ufv3R1WvWYlix
         Bt3jVZv8bX4VyG1h5KsMQxWXA5ajVDr2jI5n1vh2bTv4BRMABmF734swqLcdKPJp1ygD
         lEk47KyeYAKELUw3eedqJnGRv0e/COTOACxJe/WII23QQWz8FY3c0evz9h1w6E1NgDmT
         oP62EAOgAaDCcpZgShRFAE+1Mnk39WobaNjkw1GnOVPgrRyWKX9KTzz3/T5AzfjT439t
         nStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gSc3WQ+g0bVD00tftXx475OyaG+MO1Rw6PTdZ2MSKss=;
        b=R/RvjLIbZvDCS3qc+PC7WiIVy+nW7OszzGDsVhOLekFQOsTzu8Px/Mk0cndkuVZpt8
         rGhnCwSSu0WSe36YjcrtGo3oo3cwAOYmE+bcnKupPJY7avuzCYwqvZaZX3vnc/TnHCp9
         fQYnsvWyyKmqiowk28o/VKX54WmRokJu9vjOdJHXrqlEQuVZ3odPUf4BfcGdV/ZauYKL
         i2l4DAcqvRB3xRzjA3/Tfn4H6D9806M+D/NX6xS/DSeSwVMvgIOVsMPd0Zd6TsOnmiQW
         ENoMh3rMe6VMrcw9zVjsZ/tyb4H7iHilIUomLM8/8b1Yp7iIwXCYm6MRROqlU/PHY4Vu
         mzWg==
X-Gm-Message-State: AOAM5326yIJ0rWH6hwk1FUF2KhRHhT0ayRnm7V140BvmQuTcCApcQFS2
        jH0Qxrc10l3JKKoOdXOXbUYEOilRL4Op23nAMBw=
X-Google-Smtp-Source: ABdhPJzkWuT3I3RweXfRYj4H3ZeNNpnhnAHZolkWqzpzdvL94gruFh4MON21DFocNq4h4AaLmbesJ5AsfYYMHDlXDAM=
X-Received: by 2002:a7b:c257:: with SMTP id b23mr13997836wmj.164.1596836736069;
 Fri, 07 Aug 2020 14:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <1596805767-29339-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1596805767-29339-1-git-send-email-kalyan_t@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 7 Aug 2020 14:46:20 -0700
Message-ID: <CAF6AEGtY8xdy=KoJVWr1hMOdduv5b0EwENL1Txcs7R_2AFEK3Q@mail.gmail.com>
Subject: Re: [v2] drm/msm/dpu: Fix reservation failures in modeset
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
        Drew Davenport <ddavenport@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 7, 2020 at 6:10 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> In TEST_ONLY commit, rm global_state will duplicate the
> object and request for new reservations, once they pass
> then the new state will be swapped with the old and will
> be available for the Atomic Commit.
>
> This patch fixes some of missing links in the resource
> reservation sequence mentioned above.
>
> 1) Creation of duplicate state in test_only commit (Rob)
> 2) Allocate and release the resources on every modeset.
> 3) Avoid allocation only when active is false.
>
> In a modeset operation, swap state happens well before
> disable. Hence clearing reservations in disable will
> cause failures in modeset enable.
>
> Allow reservations to be cleared/allocated before swap,
> such that only newly committed resources are pushed to HW.
>
> Changes in v1:
>  - Move the rm release to atomic_check.
>  - Ensure resource allocation and free happens when active
>    is not changed i.e only when mode is changed.(Rob)
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 63976dc..50a98d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -582,7 +582,7 @@ static int dpu_encoder_virt_atomic_check(
>         dpu_kms = to_dpu_kms(priv->kms);
>         mode = &crtc_state->mode;
>         adj_mode = &crtc_state->adjusted_mode;
> -       global_state = dpu_kms_get_existing_global_state(dpu_kms);
> +       global_state = dpu_kms_get_global_state(crtc_state->state);

sboyd noticed with lock debug enabled, that you are missing:

   if (IS_ERR(global_state))
     return PTR_ERR(global_state);

since drm_modeset_lock() can fail (and if you have
CONFIG_DEBUG_WW_MUTEX_SLOWPATH enabled, it frequently does return
-EDEADLK, to test the backoff path)

BR,
-R

>         trace_dpu_enc_atomic_check(DRMID(drm_enc));
>
>         /*
> @@ -617,12 +617,15 @@ static int dpu_encoder_virt_atomic_check(
>         /* Reserve dynamic resources now. */
>         if (!ret) {
>                 /*
> -                * Avoid reserving resources when mode set is pending. Topology
> -                * info may not be available to complete reservation.
> +                * Release and Allocate resources on every modeset
> +                * Dont allocate when active is false.
>                  */
>                 if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> -                       ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> -                                       drm_enc, crtc_state, topology);
> +                       dpu_rm_release(global_state, drm_enc);
> +
> +                       if (!crtc_state->active_changed || crtc_state->active)
> +                               ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> +                                               drm_enc, crtc_state, topology);
>                 }
>         }
>
> @@ -1171,7 +1174,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>         struct dpu_encoder_virt *dpu_enc = NULL;
>         struct msm_drm_private *priv;
>         struct dpu_kms *dpu_kms;
> -       struct dpu_global_state *global_state;
>         int i = 0;
>
>         if (!drm_enc) {
> @@ -1190,7 +1192,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>
>         priv = drm_enc->dev->dev_private;
>         dpu_kms = to_dpu_kms(priv->kms);
> -       global_state = dpu_kms_get_existing_global_state(dpu_kms);
>
>         trace_dpu_enc_disable(DRMID(drm_enc));
>
> @@ -1220,8 +1221,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>
>         DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
>
> -       dpu_rm_release(global_state, drm_enc);
> -
>         mutex_unlock(&dpu_enc->enc_lock);
>  }
>
> --
> 1.9.1
>
