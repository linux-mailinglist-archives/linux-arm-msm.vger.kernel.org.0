Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9E745C3C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 21:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfGATtm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 15:49:42 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38878 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfGATtm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 15:49:42 -0400
Received: by mail-ed1-f66.google.com with SMTP id r12so24957324edo.5;
        Mon, 01 Jul 2019 12:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YRhvmoa+Oy4clWnpyPs9dVidY7HOSkLeqggg/V87Tuc=;
        b=fKuyOYw9lSz0tNn0LbaZHVZWeaM7pv4JWWOOjsBjyTsQIkiI5kMB3MVyreN/xWy/1a
         xDF+EGskfgy3uAaWp/uczs2x29Nr3liAY2aVXmZSXRdS8/46tfksInlgPSrQ9IqmJBiy
         MCIMcKwJd76v6KSaPTYFv/EPA8XObiXAEe7BxQrjDDHkVbiFSvACp0cteT0jAq6JfLvO
         F96zu0rc0lakuvlmFUevaUcPBJB8LIv25BWEvWHm7iEsMZ+JetKa8qwZiQ0IRu8yIpsZ
         Au6IIYxydOqS/0F+cE3uk6NFDdmMs4hEehjsG3jjLggm1dF+fNXu7b/LvXEhf8Yhn6hH
         YWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YRhvmoa+Oy4clWnpyPs9dVidY7HOSkLeqggg/V87Tuc=;
        b=mCQjG8N5qsgXWh1xmaGFaRsdkqU+NJPo4FTaa+M1Zy5svCqkz+kGs9accOi2mAO+XA
         O7ituPptFBWlvxZosbklcs45vR2W57j//Gp8Tox/x8LzuQYpAL4CmlPKgxoC2yxdICsA
         Ugyn5jds4UXAvEH+8NA53mCTAO8S75AFzfRTTAlavfq4xbi4tG8eMm1cYqCiNjkiGdgC
         rdR8XWSCQj+CzOl/VqOKcmiqllK9nyaseCBrRS6ssc7AjTEFai4l3VuhSt7wzWasCsH4
         AGPbjg3D0L4xA4Ez6/gsKAruWJLaaKD5Eig4lIzlxvcHesGZF5UmeacvmacWhDdjPavm
         dQvQ==
X-Gm-Message-State: APjAAAUAZVrmT6Libe9y/nQhLRFX/QxIQxG1w0dzANJda+pfAf5fI9le
        nJhz0lSQfsyWUqAAx9YMZrli4Df2FC+csm6oN0c=
X-Google-Smtp-Source: APXvYqwqKH0scD9sHXpSfVcQP0xH7IncHT9TlGCaw3TocU70cA+8GfMyM9QiX+Lr5RtQXuEAIvd1ZPeCIj+APELoECI=
X-Received: by 2002:a50:9203:: with SMTP id i3mr31845841eda.302.1562010580198;
 Mon, 01 Jul 2019 12:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190701174506.15625-1-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20190701174506.15625-1-jeffrey.l.hugo@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 1 Jul 2019 12:49:24 -0700
Message-ID: <CAF6AEGs5wgi8Y11ghYR5cmP2YS5YTJhH9uz8Lu7buG+cVmzLYw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Add msm8998 support
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 1, 2019 at 10:45 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> Add support for MDP5 version v3.0 found on msm8998.
>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>
> 8998 support could probably be MDP5 or DPU.  This MDP5 support works,
> but may not support all of the features that 8998 supports.  However,
> DPU seems to only support 845 (MDP v4.0) with fundamental assumptions
> about the base level a features supported, some of which 8998 does not
> infact support, so DPU would likely need significant re-writes to
> support 8998.  I'm not sure the effort is worth it since MDP5 needs so
> little effort to support 8998.

yeah, the dividing line between mdp5 and dpu is not bright.. it has
changed significantly since the first mdp5 things to the point where a
break was probably justified, but the evolution has been spread over
time.  I think it's fine to go w/ the easy route

Reviewed-by: Rob Clark <robdclark@gmail.com>

>
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 132 ++++++++++++++++++++++-
>  1 file changed, 128 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index dd1daf0e305a..fb4762cec4f1 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -630,7 +630,115 @@ const struct mdp5_cfg_hw msm8917_config = {
>         .max_clk = 320000000,
>  };
>
> -static const struct mdp5_cfg_handler cfg_handlers[] = {
> +const struct mdp5_cfg_hw msm8998_config = {
> +       .name = "msm8998",
> +       .mdp = {
> +               .count = 1,
> +               .caps = MDP_CAP_DSC |
> +                       MDP_CAP_CDM |
> +                       MDP_CAP_SRC_SPLIT |
> +                       0,
> +       },
> +       .ctl = {
> +               .count = 5,
> +               .base = { 0x01000, 0x01200, 0x01400, 0x01600, 0x01800 },
> +               .flush_hw_mask = 0xf7ffffff,
> +       },
> +       .pipe_vig = {
> +               .count = 4,
> +               .base = { 0x04000, 0x06000, 0x08000, 0x0a000 },
> +               .caps = MDP_PIPE_CAP_HFLIP      |
> +                       MDP_PIPE_CAP_VFLIP      |
> +                       MDP_PIPE_CAP_SCALE      |
> +                       MDP_PIPE_CAP_CSC        |
> +                       MDP_PIPE_CAP_DECIMATION |
> +                       MDP_PIPE_CAP_SW_PIX_EXT |
> +                       0,
> +       },
> +       .pipe_rgb = {
> +               .count = 4,
> +               .base = { 0x14000, 0x16000, 0x18000, 0x1a000 },
> +               .caps = MDP_PIPE_CAP_HFLIP      |
> +                       MDP_PIPE_CAP_VFLIP      |
> +                       MDP_PIPE_CAP_SCALE      |
> +                       MDP_PIPE_CAP_DECIMATION |
> +                       MDP_PIPE_CAP_SW_PIX_EXT |
> +                       0,
> +       },
> +       .pipe_dma = {
> +               .count = 2, /* driver supports max of 2 currently */
> +               .base = { 0x24000, 0x26000, 0x28000, 0x2a000 },
> +               .caps = MDP_PIPE_CAP_HFLIP      |
> +                       MDP_PIPE_CAP_VFLIP      |
> +                       MDP_PIPE_CAP_SW_PIX_EXT |
> +                       0,
> +       },
> +       .pipe_cursor = {
> +               .count = 2,
> +               .base = { 0x34000, 0x36000 },
> +               .caps = MDP_PIPE_CAP_HFLIP      |
> +                       MDP_PIPE_CAP_VFLIP      |
> +                       MDP_PIPE_CAP_SW_PIX_EXT |
> +                       MDP_PIPE_CAP_CURSOR     |
> +                       0,
> +       },
> +
> +       .lm = {
> +               .count = 6,
> +               .base = { 0x44000, 0x45000, 0x46000, 0x47000, 0x48000, 0x49000 },
> +               .instances = {
> +                               { .id = 0, .pp = 0, .dspp = 0,
> +                                 .caps = MDP_LM_CAP_DISPLAY |
> +                                         MDP_LM_CAP_PAIR, },
> +                               { .id = 1, .pp = 1, .dspp = 1,
> +                                 .caps = MDP_LM_CAP_DISPLAY, },
> +                               { .id = 2, .pp = 2, .dspp = -1,
> +                                 .caps = MDP_LM_CAP_DISPLAY |
> +                                         MDP_LM_CAP_PAIR, },
> +                               { .id = 3, .pp = -1, .dspp = -1,
> +                                 .caps = MDP_LM_CAP_WB, },
> +                               { .id = 4, .pp = -1, .dspp = -1,
> +                                 .caps = MDP_LM_CAP_WB, },
> +                               { .id = 5, .pp = 3, .dspp = -1,
> +                                 .caps = MDP_LM_CAP_DISPLAY, },
> +                            },
> +               .nb_stages = 8,
> +               .max_width = 2560,
> +               .max_height = 0xFFFF,
> +       },
> +       .dspp = {
> +               .count = 2,
> +               .base = { 0x54000, 0x56000 },
> +       },
> +       .ad = {
> +               .count = 3,
> +               .base = { 0x78000, 0x78800, 0x79000 },
> +       },
> +       .pp = {
> +               .count = 4,
> +               .base = { 0x70000, 0x70800, 0x71000, 0x71800 },
> +       },
> +       .cdm = {
> +               .count = 1,
> +               .base = { 0x79200 },
> +       },
> +       .dsc = {
> +               .count = 2,
> +               .base = { 0x80000, 0x80400 },
> +       },
> +       .intf = {
> +               .base = { 0x6a000, 0x6a800, 0x6b000, 0x6b800, 0x6c000 },
> +               .connect = {
> +                       [0] = INTF_eDP,
> +                       [1] = INTF_DSI,
> +                       [2] = INTF_DSI,
> +                       [3] = INTF_HDMI,
> +               },
> +       },
> +       .max_clk = 412500000,
> +};
> +
> +static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
>         { .revision = 0, .config = { .hw = &msm8x74v1_config } },
>         { .revision = 2, .config = { .hw = &msm8x74v2_config } },
>         { .revision = 3, .config = { .hw = &apq8084_config } },
> @@ -640,6 +748,10 @@ static const struct mdp5_cfg_handler cfg_handlers[] = {
>         { .revision = 15, .config = { .hw = &msm8917_config } },
>  };
>
> +static const struct mdp5_cfg_handler cfg_handlers_v3[] = {
> +       { .revision = 0, .config = { .hw = &msm8998_config } },
> +};
> +
>  static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev);
>
>  const struct mdp5_cfg_hw *mdp5_cfg_get_hw_config(struct mdp5_cfg_handler *cfg_handler)
> @@ -668,8 +780,9 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
>         struct drm_device *dev = mdp5_kms->dev;
>         struct platform_device *pdev = to_platform_device(dev->dev);
>         struct mdp5_cfg_handler *cfg_handler;
> +       const struct mdp5_cfg_handler *cfg_handlers;
>         struct mdp5_cfg_platform *pconfig;
> -       int i, ret = 0;
> +       int i, ret = 0, num_handlers;
>
>         cfg_handler = kzalloc(sizeof(*cfg_handler), GFP_KERNEL);
>         if (unlikely(!cfg_handler)) {
> @@ -677,15 +790,26 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
>                 goto fail;
>         }
>
> -       if (major != 1) {
> +       if (major != 1 && major != 3) {
>                 DRM_DEV_ERROR(dev->dev, "unexpected MDP major version: v%d.%d\n",
>                                 major, minor);
>                 ret = -ENXIO;
>                 goto fail;
>         }
>
> +       switch (major) {
> +       case 1:
> +               cfg_handlers = cfg_handlers_v1;
> +               num_handlers = ARRAY_SIZE(cfg_handlers_v1);
> +               break;
> +       case 3:
> +               cfg_handlers = cfg_handlers_v3;
> +               num_handlers = ARRAY_SIZE(cfg_handlers_v3);
> +               break;
> +       };
> +
>         /* only after mdp5_cfg global pointer's init can we access the hw */
> -       for (i = 0; i < ARRAY_SIZE(cfg_handlers); i++) {
> +       for (i = 0; i < num_handlers; i++) {
>                 if (cfg_handlers[i].revision != minor)
>                         continue;
>                 mdp5_cfg = cfg_handlers[i].config.hw;
> --
> 2.17.1
>
