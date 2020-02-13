Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA4A15CD20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 22:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728569AbgBMVUM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 16:20:12 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:46727 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728323AbgBMVUL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 16:20:11 -0500
Received: by mail-io1-f68.google.com with SMTP id t26so8142898ioi.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2020 13:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XdJ6+t4v4gVXqPsGTcbuSZf1Op16CguWcTM5QAh4j/U=;
        b=G8gmToLcQ2GFr3Y2iihCmtCqN880870+huCEXmbYkzc4kqMgx0DFgLVf5owrVKSJdq
         T3sspw4dUH7dRtfq9qK3Qtdzlr+Nb0VYW7gEpcEfpIt8Gd+hdNvImZiiLO8JBTuO5YSL
         sreEu0f5mc5VYvgSHI+8Ev87E0/UEmAAPbAkPYxidgPRv004E2tMNAjyhda7MAgYCXT1
         2aZVYqkV9bX95wSXGhBaPQGklVhYvTs8xDjAQysaq2BiTprcXDrAzcZRPNAfTdznNcUL
         4fMWBQSb7pJOAG/mGsA1C0PCEItW30l/7m6RmU9E6fipvpS1pL2Aq2QkeWwu939nvHov
         LDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XdJ6+t4v4gVXqPsGTcbuSZf1Op16CguWcTM5QAh4j/U=;
        b=oZxmnBWvAyFefr3MJWUwcR8SOoGt3+EtQUauPUBLM49nrPTmKFIUzS3kQVKBRkQGuW
         0rLZ4gX3ZXVAewiqNvjl6isPhilwIV/s/ChZz2ny+6o2bvpqeCu1JXRZnyLy2q9HI1Rp
         xxHSZKfKV8agy9z5hHSTL5exqoOZXpwrTtJewZPDlYgfRlACqFbvIHf4f3R++cv6R1qi
         dWuYUEX8KkkMaaaQIQtjXWhyl6VwWgwqMPy20nuvyREh+iMXzBU+mGtU+EqSPOSgfAs9
         VLotY8tM9bSIIIZS6UwxWp0lGLtJg8DmG9Trt8wfRQzob9DwOOO3Ez3yEjC44s2ZCXWS
         AYRg==
X-Gm-Message-State: APjAAAW+6XNl4aQ2Pq36zVJGwoMM/2bhxF8ARMgP4SXMa3WVD42es80/
        0nub0D6Q9ThZWF61Vl9xJndDKKdGTyf31FzlDjMEvA==
X-Google-Smtp-Source: APXvYqyAYEUq6eh8DqbFibK/wL7zPASyagcfAHQ0v8tMT+756eMpAPKA3VbtFHzpcWobjF8F0ZqDqoo+BtMlz0XOUZk=
X-Received: by 2002:a5d:8cc4:: with SMTP id k4mr21678723iot.2.1581628810752;
 Thu, 13 Feb 2020 13:20:10 -0800 (PST)
MIME-Version: 1.0
References: <20200213200137.745029-1-robdclark@gmail.com>
In-Reply-To: <20200213200137.745029-1-robdclark@gmail.com>
From:   Sean Paul <sean@poorly.run>
Date:   Thu, 13 Feb 2020 16:19:35 -0500
Message-ID: <CAMavQK+8un0eD1X2n+ej3oViqCP1q0bLPAV=B9XqNd906MXkSA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: fix BGR565 vs RGB565 confusion
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Fritz Koenig <frkoenig@google.com>,
        Nathan Huckleberry <nhuck@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 13, 2020 at 3:03 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The component order between the two was swapped, resulting in incorrect
> color when games with 565 visual hit the overlay path instead of GPU
> composition.
>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index 24ab6249083a..6f420cc73dbd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -255,13 +255,13 @@ static const struct dpu_format dpu_format_map[] = {
>
>         INTERLEAVED_RGB_FMT(RGB565,
>                 0, COLOR_5BIT, COLOR_6BIT, COLOR_5BIT,
> -               C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
> +               C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
>                 false, 2, 0,
>                 DPU_FETCH_LINEAR, 1),
>
>         INTERLEAVED_RGB_FMT(BGR565,
>                 0, COLOR_5BIT, COLOR_6BIT, COLOR_5BIT,
> -               C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
> +               C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
>                 false, 2, 0,
>                 DPU_FETCH_LINEAR, 1),
>
> --
> 2.24.1
>
