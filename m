Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7BDD1B92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 00:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731763AbfJIWVJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 18:21:09 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46456 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731158AbfJIWVI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 18:21:08 -0400
Received: by mail-oi1-f195.google.com with SMTP id k25so3143537oiw.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 15:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dE2a4Z4lXPuGGmpfVMZQR36XbB7tSgoxGtELVA7jbxI=;
        b=Re1yOGYe6pPM8HE/LlFTxrSDK2/zgXd0OIeCnpEpEZdLx22d/fC4wfAmETSAcCsaxG
         Q2CznxPJLfKj0UJ8rnu5QjZgmIuvTFiVMy4bctrd3vdkYeWq20CcZiZGKSO/5Qp4Cmmn
         v0amAw8IpzLiXymgE7aGFIB74nQkOil/Cqpck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dE2a4Z4lXPuGGmpfVMZQR36XbB7tSgoxGtELVA7jbxI=;
        b=Kgqr7Q9XyfBY6bqlnroqCBRZnsvu2ZZmgQ8BjXQbox4lxJWjflUXUE0LBz8k+4xARm
         OxnJ2xm1zsnDaIzs/4ozZq0yaTlugRnbSqXZ2IuLSPB1wbQezAsdjtsophaD3sAOs/Xd
         dKjL30edCNOIDoDmZV/kZfINAotJPyMDMyQ0aaPiOjEPhgTy5cOG3/FRjJn8MSgvc7KS
         3+PNg1pkPkmWVHS8gmTSiDa5CKUVxMwIEaeJb48WUWvzBsm8nd74iS/pdeha+2LAaaNw
         YF8K9bAHv5fHMz7c2piQS8rxF+jsxuBorKBvjgKSvI4TBJrIQbCDkd0ED7TgMjmxAt64
         GmSg==
X-Gm-Message-State: APjAAAURkxyHdjamYMeMd/34taVqAJCxfF8uR2P4vtiSv897QA946PoG
        7ucUP8Oij0g8r9WDikBhTraMrElxgUIGDpccnJCt1MrZ
X-Google-Smtp-Source: APXvYqxZ8tmU1al9WeQDUSkxISPtGig+OBzBdxC+nV+lPvUajS7ItruLNHqHHF/s6KsQ3cjo8125dbwbpNeUimnrJQ4=
X-Received: by 2002:aca:e046:: with SMTP id x67mr4268077oig.101.1570659667984;
 Wed, 09 Oct 2019 15:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20181116184238.170034-1-sean@poorly.run> <20181116184238.170034-17-sean@poorly.run>
In-Reply-To: <20181116184238.170034-17-sean@poorly.run>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 10 Oct 2019 00:20:56 +0200
Message-ID: <CAKMK7uEx2fL69jPGXVpQhhcj8Q8zEzb3ogCv-uVyGrX3QYFeWQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/24] drm/msm: dpu: Add modeset lock checks where applicable
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 16, 2018 at 7:44 PM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Add modeset lock checks to functions that could be called outside the
> core atomic stack.
>
> Changes in v2:
> - None
>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index a008a87a8113..cd0a0bea4335 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -284,6 +284,8 @@ enum dpu_intf_mode dpu_crtc_get_intf_mode(struct drm_crtc *crtc)
>                 return INTF_MODE_NONE;
>         }
>
> +       WARN_ON(!drm_modeset_is_locked(&crtc->mutex));
> +
>         /* TODO: Returns the first INTF_MODE, could there be multiple values? */
>         drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
>                 return dpu_encoder_get_intf_mode(encoder);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 64134d619748..5104fc01147e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -358,6 +358,7 @@ void dpu_kms_encoder_enable(struct drm_encoder *encoder)
>         if (funcs && funcs->commit)
>                 funcs->commit(encoder);
>
> +       WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
>         drm_for_each_crtc(crtc, dev) {
>                 if (!(crtc->state->encoder_mask & drm_encoder_mask(encoder)))
>                         continue;

I'm fairly sure this is called in the atomic_commit path, and in there
you might not actually hold these locks (if you do a nonblocking
modeset).

The locking rules for ->state are pretty fun: Either hold the lock, or
be in atomic commit. In the later case atomic helpers' commit ordering
guarantees that you can safely access ->state (but read-only only)
without hodling any locks. You might want to revert.

Don't ask why I stumbled over this.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
