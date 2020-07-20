Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4D3226324
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 17:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgGTPWf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 11:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgGTPWf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 11:22:35 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25578C061794;
        Mon, 20 Jul 2020 08:22:35 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id a11so13652473ilk.0;
        Mon, 20 Jul 2020 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YTvVo/WqRmwmKrp+4IJv8WZy6Bskg7m6aPJC4k+BRDo=;
        b=BRX1Lw8H+UIhc3+TlKDeISox3Kgztn9uZQ0A8XreA52NJLvF5T0eOBXN5ED6Lbt92+
         adJHhY3Qtv4SrOQhoBvIJU5qo+mKk78+KWXpNlhEAm6epvd3dYIXpnYovILuYLmbaxQA
         ByFFxlHmQ0ROpgGlGw/hHFXQnQijn6oK7ojFm5ux9ifdhoM4Si9nTLJR45LUzig5m/wu
         veTAKx5CCbLOxX8DXLsH4oik2EVVVZdqSxsE3ZG0zJstqA77FYCjV+SPQPGCilk91OYV
         k8iH8FYq0PNf7PdlxjWF7fQFjm5iBISfEtRVyJ3JZnNHel1I5bdiCmdJUw3XKHFAx6TE
         3/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YTvVo/WqRmwmKrp+4IJv8WZy6Bskg7m6aPJC4k+BRDo=;
        b=CBAFJ9cCbqsoVprtD4tPMIdI3zMoKDwTpYsxALxoycFc6iRN3TDqgODMUmAkJgTEKT
         ge5m6QiLY4u/EXHczqIHjCXgrBOYpqTrxqR9yI7KpLyOxviWNC1TQ8XFO6KJMVmrCLPO
         Z9eTCgqK6djsMqzxuzBP1u6jim9Q3tw0keq1t0/WEf/qEODavnEgcY/g4Vf+B0lq/f5H
         /lSPi/FzDsDZAiJ3tuhE4Ynply6YN15KjnP/xzVpNy29eiTCiGboZtMva5O86akpQzSO
         M07s/GvcXQlbj2WhCcfsBnn2RdNUuz4bed/W9PdZJnsYx+r2hsJvqhmMZJjUUEJgjYWb
         DchQ==
X-Gm-Message-State: AOAM532+xqjHfuZTnz5voAfz7spFW9IOjEZbGcTi05+35t0osn061PXB
        Klv3gcxvIOVqi2VvTN80oLS8837W3AOAYL30O1w=
X-Google-Smtp-Source: ABdhPJwo46IUG9Uvw1AF5fAEN6qBNZnifgUkqvyITHYxBM8kiaMFkhqqRK/O272Hmjm6K1DZOjzT09uiNq1omiRtZP4=
X-Received: by 2002:a05:6e02:8a8:: with SMTP id a8mr24502403ilt.52.1595258554196;
 Mon, 20 Jul 2020 08:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200715221955.3209856-1-robdclark@gmail.com> <92c9e9d08dfa014f1589186a68902de7@codeaurora.org>
In-Reply-To: <92c9e9d08dfa014f1589186a68902de7@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 20 Jul 2020 08:23:09 -0700
Message-ID: <CAF6AEGuV7vTseh5KmCremhhfR1E4sAY1oPAwtCOCtYb1vx=A0g@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: fix/enable 6bpc dither with split-lm
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Steev Klimaszewski <steev@gentoo.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Zheng Bin <zhengbin13@huawei.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Drew Davenport <ddavenport@chromium.org>,
        Sean Paul <sean@poorly.run>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 20, 2020 at 5:53 AM <kalyan_t@codeaurora.org> wrote:
>
> On 2020-07-16 03:49, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > If split-lm is used (for ex, on sdm845), we can have multiple ping-
> > pongs, but only a single phys encoder.  We need to configure dithering
> > on each of them.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 22 ++++++++++---------
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  3 +--
> >  2 files changed, 13 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 46df0ff75b85..9b98b63c77fb 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -212,14 +212,14 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
> >       15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
> >  };
> >
> > -static void _dpu_encoder_setup_dither(struct dpu_encoder_phys *phys)
> > +static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp,
> > unsigned bpc)
> >  {
> >       struct dpu_hw_dither_cfg dither_cfg = { 0 };
> >
> > -     if (!phys->hw_pp || !phys->hw_pp->ops.setup_dither)
> > +     if (!hw_pp->ops.setup_dither)
> >               return;
> >
> > -     switch (phys->connector->display_info.bpc) {
> > +     switch (bpc) {
> >       case 6:
> >               dither_cfg.c0_bitdepth = 6;
> >               dither_cfg.c1_bitdepth = 6;
> > @@ -228,14 +228,14 @@ static void _dpu_encoder_setup_dither(struct
> > dpu_encoder_phys *phys)
> >               dither_cfg.temporal_en = 0;
> >               break;
> >       default:
> > -             phys->hw_pp->ops.setup_dither(phys->hw_pp, NULL);
> > +             hw_pp->ops.setup_dither(hw_pp, NULL);
> >               return;
> >       }
> >
> >       memcpy(&dither_cfg.matrix, dither_matrix,
> >                       sizeof(u32) * DITHER_MATRIX_SZ);
> >
> > -     phys->hw_pp->ops.setup_dither(phys->hw_pp, &dither_cfg);
> > +     hw_pp->ops.setup_dither(hw_pp, &dither_cfg);
> >  }
> >
> >  void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys
> > *phys_enc,
> > @@ -1132,11 +1132,13 @@ static void
> > _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
> >
> >       _dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
> >
> > -     if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> > -             for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> > -                     struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> > -
> > -                     _dpu_encoder_setup_dither(phys);
> > +     if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
> > +                     !WARN_ON(dpu_enc->num_phys_encs == 0)) {
> > +             unsigned bpc = dpu_enc->phys_encs[0]->connector->display_info.bpc;
> > +             for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> > +                     if (!dpu_enc->hw_pp[i])
> > +                             continue;
> > +                     _dpu_encoder_setup_dither(dpu_enc->hw_pp[i], bpc);
> >               }
> >       }
> >  }
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > index 7411ab6bf6af..bea4ab5c58c5 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> > @@ -231,8 +231,7 @@ static void _setup_pingpong_ops(struct
> > dpu_hw_pingpong *c,
> >       c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
> >       c->ops.get_line_count = dpu_hw_pp_get_line_count;
> >
> > -     if (test_bit(DPU_PINGPONG_DITHER, &features) &&
> > -             IS_SC7180_TARGET(c->hw.hwversion))
> > +     if (test_bit(DPU_PINGPONG_DITHER, &features))
> >               c->ops.setup_dither = dpu_hw_pp_setup_dither;
> >  };
>
> Change looks good to me

Does that count as a Reviewed-by?

BR,
-R

>
> - Kalyan
