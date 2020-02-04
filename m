Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE56915202C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 19:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727369AbgBDSDs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 13:03:48 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41332 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbgBDSDs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 13:03:48 -0500
Received: by mail-ed1-f68.google.com with SMTP id c26so20698906eds.8;
        Tue, 04 Feb 2020 10:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dWvde0WuuXX7CPS5xkAIWw6infFPw3FSlM3GIfSoQP8=;
        b=qKHIX6A6NSCUgZK7iuUx14Hz4eEJffzhloZxzvaPkj73uFGKOcMsR7Lbx9EdLwuS+w
         mk+NMv4zxNZv9OD2EKTVjZUaI7L14261YFIlV66/UAPnOkkD6aNeKRhXzGDzB2KS9+zZ
         LtgOHFRMmK5nPWgMSnuZtwgEbpasAuYtyWQZe7avTOjQ/wxVlAiwJyK8Ga3UcmpzmTnX
         g50JKCjVVWSG0Qls4Ua9LdkgPQiF+JEkNidZM2mrC24y11ghR3tOeWtNU08xFeiLFNrs
         nAoi1zb4eYt25HOMLPiDlipN4QPbhqPUNo1ntHfAlgHzjdPoycijorar+vCTvRgQY7Fd
         49kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dWvde0WuuXX7CPS5xkAIWw6infFPw3FSlM3GIfSoQP8=;
        b=oyl0Ik6i5kZT5pCXo1X5+h+d4dtnlxI7rFh+MOA4vXbIpjEg9WFADD7yZbLsO95o6w
         BfDIobACiwlZrg3idfb2i9MoErSkGClH7pTGN0P7xIqtdbreq1DVDfnUKExqwtOCMX4i
         WSM1+zja69K9NMxDUDYBG5VpZ0q+AhgZGfrQmJnbvzemvrS/3JGEgX4aNyTSjb5d8IeX
         ATd/wuJdUW8m/rOlq+HR1QdPVQ1ZxiSuXOw7rzy0TCkYDvMC62wKllRtsl59twdV48yb
         3RXVWPObD3VCxnrWDG1mNQV7wTqKbyvcMNeBwBrtBGF3cFx98JBL1t3R5ZHOHj61GI28
         lhjg==
X-Gm-Message-State: APjAAAXvv+jB8dZb9unUaP33EmS7MWYgvzfI37/cbvxC2MplYt7dx/ly
        qHS+IYgVR7OR6TQx26Fmaj31zakAkRCQtlQ+Sbg=
X-Google-Smtp-Source: APXvYqyWPgr+XP7Kc61q5ucd7+66soDxza7EDsiQJiHhZinA/4dQPsj7r9MgjJM5zWCOKF/CMt37Ed1nd54+McUf1Pk=
X-Received: by 2002:aa7:c6c5:: with SMTP id b5mr1389168eds.281.1580839425205;
 Tue, 04 Feb 2020 10:03:45 -0800 (PST)
MIME-Version: 1.0
References: <1580838148-2981-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1580838148-2981-1-git-send-email-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 4 Feb 2020 10:03:34 -0800
Message-ID: <CAF6AEGt+aKC-pZZNK34mcjiYrtVuNvzQ_Qc5GwWvJ3NRkHbnWg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Remove unneeded GBIF unhalt
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+jstultz

On Tue, Feb 4, 2020 at 9:42 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Commit e812744c5f95 ("drm: msm: a6xx: Add support for A618") added a
> universal GBIF un-halt into a6xx_start(). This can cause problems for
> a630 targets which do not use GBIF and might have access protection
> enabled on the region now occupied by the GBIF registers.
>
> But it turns out that we didn't need to unhalt the GBIF in this path
> since the stop function already takes care of that after executing a flush
> but before turning off the headswitch. We should be confident that the
> GBIF is open for business when we restart the hardware.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index daf0780..e51c723 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -378,18 +378,6 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>         int ret;
>
> -       /*
> -        * During a previous slumber, GBIF halt is asserted to ensure
> -        * no further transaction can go through GPU before GPU
> -        * headswitch is turned off.
> -        *
> -        * This halt is deasserted once headswitch goes off but
> -        * incase headswitch doesn't goes off clear GBIF halt
> -        * here to ensure GPU wake-up doesn't fail because of
> -        * halted GPU transactions.
> -        */
> -       gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> -
>         /* Make sure the GMU keeps the GPU on while we set it up */
>         a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
>
> --
> 2.7.4
