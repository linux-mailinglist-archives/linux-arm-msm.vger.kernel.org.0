Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A3C3E97C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 20:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbhHKSjT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 14:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhHKSjS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 14:39:18 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2638C061765
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 11:38:54 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id g138so2584070wmg.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 11:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eQhLP2HpYl3mxTssveBjr1kKyZxliJO4Ylz3sYBifvQ=;
        b=gLXLq97An/NSHIdiFRGjpYHcahaLAOeMqlOjQ0lTs/Oy4mVwecGF13c0K9Z4sEDDMF
         leSrj6Wpzj/UoirgeM7fbSLqOJuOI4oXLfEGbFGOfLANd/M8F7/35YJQeqYF/GqDcj9q
         HD2u/UIT8+K+A/p/EsAVN3tncwWLRQEw7BVTZ3zGtZ6ssxgU1ugKQzF10LMHDs13Rwm4
         SvVMB1p89BRdfLyNcG94XAzKjs+JtwQgQKpjDKtPm4+3FI4nXmPCgG5Eh56vEwzx12Fz
         fn+LUSshcWrwiRl9TDTfctF72r/GFuIZ/TdPnTg7SqlSp2IhStANjvcqF4AFY3m8iT2s
         MCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eQhLP2HpYl3mxTssveBjr1kKyZxliJO4Ylz3sYBifvQ=;
        b=Ey+8Ays9lV094CNn3OWxN8AQF+TRoUG5O6ZJAYXqQXmYUMkRSQFUG8oYldnZ8EqO2m
         OjRskjyZNkj2VmppHowuodeAbe1yqL7H7Akl4wp+DuQaI2d73h9Uze/1WS2AEYmr4BP8
         HMR4+RH+Mn1y8jFaooiYthtzEmzf+cMFDQz9fvSaXekzxFTz5BRreZC/HyebDTRt6eY0
         c3cmy2Y9rX0/bfffShmuMevGPROU0PD6Hw0A1quHvbGMivv1Ps7jkhR2qPeJcdeidd/V
         fCSiE8r85lb0jAT85bOpq3dnn09JbBffL9j0+5LEiuA1XuMtGnwBmMMBKbW2tIj5sP+9
         eACg==
X-Gm-Message-State: AOAM532LB4ikKwlq7gW79pnJN+gBVk6wOtTbAxLDcASXfA2Z7wr/pTxT
        ic5mjXW0Uwan0OSkbH+BMzLN9gkvI1m55whvwgc=
X-Google-Smtp-Source: ABdhPJxp/OJghjYG77CWEM0BOC7nX2DHfOVMFK6FSsbOPvoPAsWIZPqN5jxhG9kBOsxFLJVVBylnYEgwmGBfWPkcw2Q=
X-Received: by 2002:a05:600c:2046:: with SMTP id p6mr11477927wmg.164.1628707133341;
 Wed, 11 Aug 2021 11:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210811180844.2130484-1-markyacoub@chromium.org>
In-Reply-To: <20210811180844.2130484-1-markyacoub@chromium.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 11 Aug 2021 11:43:09 -0700
Message-ID: <CAF6AEGveSFBOQkP=NXeRZAuAeL_yQc5Sq6LO+huf4bJO6c2yKA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Read frame_count and line_count even when disabled.
To:     Mark Yacoub <markyacoub@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Yacoub <markyacoub@google.com>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 11, 2021 at 11:12 AM Mark Yacoub <markyacoub@chromium.org> wrote:
>
> From: Mark Yacoub <markyacoub@google.com>
>
> [why]
> Reading frame count register used to get the vblank counter, which calls
> dpu_encoder_phys to get the frame count. Even when it's disabled, the
> vblank counter (through frame count) should return a valid value for the
> count. An invalid value of 0, when compared to vblank->last (in
> drm_vblank.c::drm_update_vblank_count()) returns an invalid number that
> throws off the vblank counter for the lifetime of the process.
>
> Rationale:
> In drm_vblank.c::drm_update_vblank_count(), the new diff is calculated
> through:
> diff = (cur_vblank - vblank->last) & max_vblank_count;
> cur_vblank comes from: cur_vblank = __get_vblank_counter(dev, pipe);
> When the value is 0, diff results in a negative number (a very large
> number as it's unsigned), which inflates the vblank count when the diff
> is added to the current vblank->count.
>
> [How]
> Read frame_count register whether interface timing engine is enabled or
> not.
>
> Fixes: IGT:kms_flip::modeset-vs-vblank-race-interruptible
> Tested on ChromeOS Trogdor(msm)
>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

Reviewed-by: Rob Clark <robdclark@chromium.org>

But I suspect we may have a bit more work for the display-off case..
or at least I'm not seeing anything obviously doing a pm_runtime_get()
in this call path.

I'm also not sure if the line/frame-count registers loose state across
a suspend->resume cycle, it might be that we need to save/restore
these registers in the suspend/resume path?  Abhinav?

BR,
-R

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 9 ++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 2 +-
>  2 files changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 116e2b5b1a90f..c436d901629f3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -266,13 +266,8 @@ static void dpu_hw_intf_get_status(
>
>         s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);
>         s->is_prog_fetch_en = !!(DPU_REG_READ(c, INTF_CONFIG) & BIT(31));
> -       if (s->is_en) {
> -               s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);
> -               s->line_count = DPU_REG_READ(c, INTF_LINE_COUNT);
> -       } else {
> -               s->line_count = 0;
> -               s->frame_count = 0;
> -       }
> +       s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);
> +       s->line_count = DPU_REG_READ(c, INTF_LINE_COUNT);
>  }
>
>  static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 3568be80dab51..877ff48bfef04 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -41,7 +41,7 @@ struct intf_prog_fetch {
>  struct intf_status {
>         u8 is_en;               /* interface timing engine is enabled or not */
>         u8 is_prog_fetch_en;    /* interface prog fetch counter is enabled or not */
> -       u32 frame_count;        /* frame count since timing engine enabled */
> +       u32 frame_count; /* frame count since timing engine first enabled */
>         u32 line_count;         /* current line count including blanking */
>  };
>
> --
> 2.33.0.rc1.237.g0d66db33f3-goog
>
