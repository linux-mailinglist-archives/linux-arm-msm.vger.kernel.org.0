Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046713BF92A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 13:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbhGHLl1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 07:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231660AbhGHLl1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 07:41:27 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7545C061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 04:38:44 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id e14so5272690qkl.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 04:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pdT67ZAjjxOqbY6V2cjTYgIg9rCc8phajEZLUlLXgeg=;
        b=rjNG93BPgj9AGSiSqrEBFuzyaSBTjTCuK3WnOo8zwYfI6rDja3Eh+Mhq+EX6MfPcro
         /05SilWpB1W4XI9XGWMLeMC9JEg2Bh8QwSadSyZlRtaaDo7vKFZxmW/KLmuArZUzbl1J
         4swV1pk3QIwZZDg+YYZarB1yyFMOExptk+kZlttoBvLgyinGj1h9yJKbowe0Ap0qS5+k
         iuFyrecEG7JaV4nq/TQoGtj2+qzL9Pr8h95Q8gDee6uRST6hEnyQcgJadbGZiDJETDd3
         svh3LGi+NKFIEr5DbZnizmH49PF40IGsian6KUOOnStKd6vzmFkIyCi4La97PmUao4N2
         Yx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pdT67ZAjjxOqbY6V2cjTYgIg9rCc8phajEZLUlLXgeg=;
        b=p4Wq5uXpCT/dFgQPO1hMb83HCP0LQiIEDTbnQu9gppC4gyf1ITWbMOfUUhNRBq4nEa
         YePhuULA9vupipP68ubpXdDbae9zlTZlvSTWzbo2R7zxc88rc+Hge6/ZmRY/xY7Y6dA5
         Sbg0GTuGpArlfh0uhtWF+jClwj01DZlFwoF6TazJCPrmokQtbEmst8iSV+NjW88Rqb++
         vAVmLxpvZZx9nWx/OVA5ASGvmkCcvFu2KQwrHXUEuF4FhrVLJVDp9Wj1pGbBByHqrMBw
         t7FI7BtlrKguBn0sfqq50KIwRK/z4GqKn35293sqoxkOAlatpDdVAM/b05Z3YG3J6z2v
         jGpg==
X-Gm-Message-State: AOAM533IFRegth/wixU/4+NRWNKg8ZV22Z6FjKg4qqe/oyIRLHozyu3x
        Zr4XzpCXfnnRIziwOQhmngHWPTKZDm/pNkx6c50drQ==
X-Google-Smtp-Source: ABdhPJzYWdG8T+IBKuhBvIPzgfm/PnzWBGXAmU22UIEFseDKn9jaTlFmZpw5V/xP7DM++zadOmnW6ApXNlK441So3jQ=
X-Received: by 2002:a05:620a:651:: with SMTP id a17mr7019470qka.434.1625744323877;
 Thu, 08 Jul 2021 04:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210708065619.999199-1-swboyd@chromium.org>
In-Reply-To: <20210708065619.999199-1-swboyd@chromium.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 8 Jul 2021 14:38:33 +0300
Message-ID: <CAA8EJppvcnQmJJ-TfMQTvdJwSN-F0A4nREShGHwMqOOAj=4X1w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Add newlines to printks
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 8 Jul 2021 at 09:56, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Add some missing newlines to the various DRM printks in this file.
> Noticed while looking at logs. While we're here unbreak quoted
> strings so grepping them is easier.
>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1c04b7cce43e..0e9d3fa1544b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -274,20 +274,20 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>
>         /* return EWOULDBLOCK since we know the wait isn't necessary */
>         if (phys_enc->enable_state == DPU_ENC_DISABLED) {
> -               DRM_ERROR("encoder is disabled id=%u, intr=%d, irq=%d",
> +               DRM_ERROR("encoder is disabled id=%u, intr=%d, irq=%d\n",
>                           DRMID(phys_enc->parent), intr_idx,
>                           irq->irq_idx);
>                 return -EWOULDBLOCK;
>         }
>
>         if (irq->irq_idx < 0) {
> -               DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d, irq=%s",
> +               DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d, irq=%s\n",
>                               DRMID(phys_enc->parent), intr_idx,
>                               irq->name);
>                 return 0;
>         }
>
> -       DRM_DEBUG_KMS("id=%u, intr=%d, irq=%d, pp=%d, pending_cnt=%d",
> +       DRM_DEBUG_KMS("id=%u, intr=%d, irq=%d, pp=%d, pending_cnt=%d\n",
>                       DRMID(phys_enc->parent), intr_idx,
>                       irq->irq_idx, phys_enc->hw_pp->idx - PINGPONG_0,
>                       atomic_read(wait_info->atomic_cnt));
> @@ -303,8 +303,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>                 if (irq_status) {
>                         unsigned long flags;
>
> -                       DRM_DEBUG_KMS("irq not triggered id=%u, intr=%d, "
> -                                     "irq=%d, pp=%d, atomic_cnt=%d",
> +                       DRM_DEBUG_KMS("irq not triggered id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d\n",
>                                       DRMID(phys_enc->parent), intr_idx,
>                                       irq->irq_idx,
>                                       phys_enc->hw_pp->idx - PINGPONG_0,
> @@ -315,8 +314,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>                         ret = 0;
>                 } else {
>                         ret = -ETIMEDOUT;
> -                       DRM_DEBUG_KMS("irq timeout id=%u, intr=%d, "
> -                                     "irq=%d, pp=%d, atomic_cnt=%d",
> +                       DRM_DEBUG_KMS("irq timeout id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d\n",
>                                       DRMID(phys_enc->parent), intr_idx,
>                                       irq->irq_idx,
>                                       phys_enc->hw_pp->idx - PINGPONG_0,
>
> base-commit: e9f1cbc0c4114880090c7a578117d3b9cf184ad4
> --
> https://chromeos.dev
>


-- 
With best wishes
Dmitry
