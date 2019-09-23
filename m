Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5F0BB9FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2019 18:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502094AbfIWQxz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Sep 2019 12:53:55 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44842 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390877AbfIWQxy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Sep 2019 12:53:54 -0400
Received: by mail-ed1-f68.google.com with SMTP id r16so13520024edq.11;
        Mon, 23 Sep 2019 09:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Vx10m/Lm/wy8maAuBSI7giwMG2Vidy5dikUf4oqhTM=;
        b=YqGv8Br482S2VTJcI04+h9KF8ITUDIpyq75eXpGc9nitcFdXrIUzkdfRWKyIQ8Mn/b
         ckFPQIxMfRtjvnCf1+iVD0bkS7xSFQ7cF1v7p2BCcPbmj7B8SqpR/AYqYk3bmR1jjcE1
         fK/5wbGy+CcaeeaurWFJnZpdRXR9KFIonubI4XN4zRvgLv6pDY9yQjnSNzUja0fqNsVn
         bDH0LQOKOZ+ocjqUSxtMDZdGOxcKAc5E1T6vb5wypCUFyktOeYTEoX1WBzeXXZF3S1MX
         drfoRsQiM0IQAcaB9UT1oZx4cSZT/DJmdQBK3GIIXAxHcl11YpqfT3ofaCDMWW0dktPC
         ePVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Vx10m/Lm/wy8maAuBSI7giwMG2Vidy5dikUf4oqhTM=;
        b=ufvgm+CbKRIK3UDpFuyGj50Ed0lnq32W8dyOBP2bqhmCdqe5vTLHlUU0t3sV5roFjE
         ICYWBjPEdk+6SQpFRtK/2oKJvUeAPDXkYXd9J0UTenMHb7Qm1IP5Q9zaploqrYks6J6s
         e81mVaeQXtT+3VhTQnnuLWpBdP2onUUCWZhKw83u3OSD04YxJnivUVYN/0tlcN7b5nts
         IEKqZJMJXaRPHvuUb2Cj7/ERwJLr/mJbzvfCPN4Cc0ZruJQvdexdsB1jA54RBaLY1TRq
         L1lfJofVGwI26tPMS5SewYsIJHQuWotUBj0HcbAIX2z4bKx6f0LX5FZXLvHKFMm5YsXk
         7dsg==
X-Gm-Message-State: APjAAAVL7hNI4xDz0fGTPtRSygAm0CXmTd4WSRO3cC5wTMZ0Nfpd6Lx2
        nnAIesxqi3fcLEpkCGqgH+56KRsLybh4XWTaxv4=
X-Google-Smtp-Source: APXvYqxbBOuu3hw0QIpTFiEv+Mi/YVA/FXFTAT3e/DBdocyEZ+BEQIdCppRPGcSakXQ32XfSXojTeY9Vl6bzMHjEzk8=
X-Received: by 2002:a17:906:2542:: with SMTP id j2mr775950ejb.278.1569257632256;
 Mon, 23 Sep 2019 09:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <1569242500-182337-7-git-send-email-hjc@rock-chips.com> <1569242500-182337-9-git-send-email-hjc@rock-chips.com>
In-Reply-To: <1569242500-182337-9-git-send-email-hjc@rock-chips.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 23 Sep 2019 09:53:40 -0700
Message-ID: <CAF6AEGvsE_hxYYA123=55uvXVsDMkhfwvXW+gBMQJksE1WoQeg@mail.gmail.com>
Subject: Re: [PATCH 08/36] drm/msm: use bpp instead of cpp for drm_format_info
To:     Sandy Huang <hjc@rock-chips.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Shayenne Moura <shayenneluzmoura@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Emil Velikov <emil.velikov@collabora.com>,
        Allison Randal <allison@lohutok.net>,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 23, 2019 at 5:44 AM Sandy Huang <hjc@rock-chips.com> wrote:
>
> cpp[BytePerPlane] can't describe the 10bit data format correctly,
> So we use bpp[BitPerPlane] to instead cpp.
>
> Signed-off-by: Sandy Huang <hjc@rock-chips.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 4 ++--
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 2 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c  | 2 +-
>  drivers/gpu/drm/msm/msm_fb.c              | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index b3417d5..c57731c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1148,8 +1148,8 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>                                 fb->base.id, (char *) &fb->format->format,
>                                 fb->width, fb->height);
>                         for (i = 0; i < ARRAY_SIZE(fb->format->cpp); ++i)
> -                               seq_printf(s, "cpp[%d]:%u ",
> -                                               i, fb->format->cpp[i]);
> +                               seq_printf(s, "bpp[%d]:%u ",
> +                                               i, fb->format->bpp[i]);
>                         seq_puts(s, "\n\t");
>
>                         seq_printf(s, "modifier:%8llu ", fb->modifier);
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> index ff14555..61ab4dc 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -790,7 +790,7 @@ static void mdp5_crtc_restore_cursor(struct drm_crtc *crtc)
>         width = mdp5_crtc->cursor.width;
>         height = mdp5_crtc->cursor.height;
>
> -       stride = width * info->cpp[0];
> +       stride = width * info->bpp[0] / 8;
>
>         get_roi(crtc, &roi_w, &roi_h);
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
> index 776337f..992477d 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
> @@ -147,7 +147,7 @@ uint32_t mdp5_smp_calculate(struct mdp5_smp *smp,
>         for (i = 0; i < nplanes; i++) {
>                 int n, fetch_stride, cpp;
>
> -               cpp = info->cpp[i];
> +               cpp = info->bpp[i] / 8;

Unless I missed something in your first patch, I don't think this
series is bisectable, ie. replacing cpp w/ bpp would cause everything
else not to compile.  Looks like there was an alternative proposal on
the first patch, but if we do end up going this route, I think you
should add bpp in the first patch, and remove cpp in the last patch.
(And also probably sprinkle around WARN_ON(info->bpp[n] % 8) in places
were it is expected to be a multiple of 8)

BR,
-R


>                 fetch_stride = width * cpp / (i ? hsub : 1);
>
>                 n = DIV_ROUND_UP(fetch_stride * nlines, smp->blk_size);
> diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> index 5bcd5e5..4545fa1 100644
> --- a/drivers/gpu/drm/msm/msm_fb.c
> +++ b/drivers/gpu/drm/msm/msm_fb.c
> @@ -172,7 +172,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
>                 unsigned int min_size;
>
>                 min_size = (height - 1) * mode_cmd->pitches[i]
> -                        + width * info->cpp[i]
> +                        + width * info->bpp[i] / 8
>                          + mode_cmd->offsets[i];
>
>                 if (bos[i]->size < min_size) {
> --
> 2.7.4
>
>
>
