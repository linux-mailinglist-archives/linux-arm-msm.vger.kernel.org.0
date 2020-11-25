Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586B82C3F0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 12:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbgKYLYu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 06:24:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgKYLYu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 06:24:50 -0500
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4601DC061A4D
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 03:24:50 -0800 (PST)
Received: by mail-qk1-x741.google.com with SMTP id u4so3678176qkk.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 03:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=agmpj2HBmWrLN3MVuSVDvn8VNwMgC/NxRRqXNQElq+c=;
        b=Xek41XwpQigUAOEeTJBGHWL790+lASvVIv15zxh3iAJ1zijkjfVfs9eVex27OfCuXA
         kJdW59wrQn1P9fA1QwhwcZG8R3hzDh9VApTT6RicMbfuwQCmYi2DVJmFpe27824jWafL
         Z+HcAq9jhCmUjGVHK+2nF2Y/jqCEFBtWVYC3vbbXALj0NjPLbNx1snXzCd9TOUOPyQPa
         TsvhSX5+VzpEoHmFpb834YUk/5gmOhFG8ZSqrIOfyJ2NHQ/nf0TtsQsaTxmrSe24nIZS
         OyTVn5zFIQ+IEXvHDeNaqtrmH18lXKQrB6Xafri4msJHpPoeH8lbmXm1OqF8yFBOBMB+
         hrlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=agmpj2HBmWrLN3MVuSVDvn8VNwMgC/NxRRqXNQElq+c=;
        b=JpzMk42Yhzzw+YPAj1F7O5JiN7OC77x9r5Dv+mpXGd63iwK96r6iZME8ajrjFkJiNH
         99FV8hfIBLZjeE+9NGDPcgvR0fjXB8HAS9EVnlv5AoeMaiUh04jcjq6fKhwgyhUIEL46
         rpzaOj3xzMcDMkNq0/dgzqrGUs4z5VHvjTBX5VO2PbKnfaQuZLJXjzm0+dqf3FekA3/V
         x3qY7EzFUbavH2sKFIwZakFe4VLYsT9BLI1VBGxKPaNEL1p+mfeQ/uVr+qFD8NbBTTql
         G6ulwD7fEI6je3BO8HZ16muDbZ2EfKM97EjehBJJ7x3cXIMSCq7A6j9O7WNIuYvB8Hoa
         kPyQ==
X-Gm-Message-State: AOAM532x1dLAdIcRogJQslU9ZXtDTICSoIjn9q5jMwkM4lLaU8uBrP0R
        3VzvaPkOwZJxxcUwpnQkRDj8jjpBeParIj+n5v4rXQ==
X-Google-Smtp-Source: ABdhPJwWhnzD0lDZFoqtnfER27VsEtm05heWcR/zUGhYgUn6H9hWU74Sr5XzjkLVg9dn0GVTJoyr0OxmFzYOq0n5cUA=
X-Received: by 2002:a25:7481:: with SMTP id p123mr3005268ybc.167.1606303489272;
 Wed, 25 Nov 2020 03:24:49 -0800 (PST)
MIME-Version: 1.0
References: <1606298560-3003-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1606298560-3003-1-git-send-email-kalyan_t@codeaurora.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Wed, 25 Nov 2020 16:54:13 +0530
Message-ID: <CAMi1Hd3fjrJXJ1puZ6SCn0FXPNZdoJh19GALcVr_R93tZnxW_w@mail.gmail.com>
Subject: Re: [v1] drm/msm/dpu: consider vertical front porch in the prefill bw calculation
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     y@qualcomm.com, dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        nganji@codeaurora.org, Stephen Boyd <swboyd@chromium.org>,
        abhinavk@codeaurora.org, ddavenport@chromium.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 25 Nov 2020 at 15:33, Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> In case of panels with low vertical back porch, the prefill bw
> requirement will be high as we will have less time(vbp+pw) to
> fetch and fill the hw latency buffers before start of first line
> in active period.
>
> For ex:
> Say hw_latency_line_buffers = 24, and if blanking vbp+pw = 10
> Here we need to fetch 24 lines of data in 10 line times.
> This will increase the bw to the ratio of linebuffers to blanking.
>
> DPU hw can also fetch data during vertical front porch provided
> interface prefetch is enabled. Use vfp in the prefill calculation
> as dpu driver enables prefetch if the blanking is not sufficient
> to fill the latency lines.

Tested on Xiaomi Poco F1 (sdm845).

Tested-by: Amit Pundir <amit.pundir@linaro.org>

>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 7ea90d2..315b999 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -151,7 +151,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
>         u64 plane_bw;
>         u32 hw_latency_lines;
>         u64 scale_factor;
> -       int vbp, vpw;
> +       int vbp, vpw, vfp;
>
>         pstate = to_dpu_plane_state(plane->state);
>         mode = &plane->state->crtc->mode;
> @@ -164,6 +164,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
>         fps = drm_mode_vrefresh(mode);
>         vbp = mode->vtotal - mode->vsync_end;
>         vpw = mode->vsync_end - mode->vsync_start;
> +       vfp = mode->vsync_start - mode->vdisplay;
>         hw_latency_lines =  dpu_kms->catalog->perf.min_prefill_lines;
>         scale_factor = src_height > dst_height ?
>                 mult_frac(src_height, 1, dst_height) : 1;
> @@ -176,7 +177,13 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
>                 src_width * hw_latency_lines * fps * fmt->bpp *
>                 scale_factor * mode->vtotal;
>
> -       do_div(plane_prefill_bw, (vbp+vpw));
> +       if ((vbp+vpw) > hw_latency_lines)
> +               do_div(plane_prefill_bw, (vbp+vpw));
> +       else if ((vbp+vpw+vfp) < hw_latency_lines)
> +               do_div(plane_prefill_bw, (vbp+vpw+vfp));
> +       else
> +               do_div(plane_prefill_bw, hw_latency_lines);
> +
>
>         pstate->plane_fetch_bw = max(plane_bw, plane_prefill_bw);
>  }
> --
> 2.7.4
>
