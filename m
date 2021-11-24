Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63C845C94C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 16:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242285AbhKXQA0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 11:00:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbhKXQA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 11:00:26 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98BF9C061714
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 07:57:16 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id jo22so2052772qvb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 07:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CdYuE5QrzefFebInJI5P2GSiXpBChfo3witrC7Aylm0=;
        b=QkgHoKqmttx5bs5HGXCc/nhxHhXWnZm164rRR9UjzErZl7fFK+l2AOo3mnk3Vw2d0j
         BEIApYijTv8xAfl9c0orPE8u0lNVDf89U49Zj1hC2ITYGYDYpKM/47d2Z5KnU7ZiYuxv
         qpZFu16WmaTjEnrqzU8Lj/NZdvDyFijgS5jQUPziD/8gTTxs4gqmZcC1p4oe3szMCXxB
         aSrfYuVSOTmZGOQvFRgpuTfB7aQ6hPdzQHHT9ONypNKr6uFWO54dRKXOhOdmko+OR7WY
         OT7kh0kCxkHENvkIEK5MNXLgsZQR0OhhKvvijgMvgQ2DzBGGWgS7gXRGjjt0aOuoFcML
         4iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CdYuE5QrzefFebInJI5P2GSiXpBChfo3witrC7Aylm0=;
        b=X34SOe/bbANxQb1cAy2BgHkYpTcyeO7g1FIujRxeC3Dj+xM5r57J4XbhsBxq94RxAt
         C/KGqiXJYHwhtu3Tz3rPW1zCMOI3luaBuvbnLmr86fENYPtJHifGTeKgIPCeI6m1nmKT
         g6na7uyizUkFdVi+M6k9x0U12+9ZlM4bl3MEJjgDgpUM7acdE81PW8iyPrYOhBsWvsVf
         aIEftGAIxJ4RT8/r9kl1/R2U5ndIwm0jt6vZAQ/QQbA0jGge5Yn1QeTTU48JXrnVQabv
         8xqftJkpuj26D8mTGSncIK2SazMcXZy1FJjDk3kzO8Z/0uOrUa4ijS/Y11gRLPy56ePu
         FRXQ==
X-Gm-Message-State: AOAM532hdBQ+T038WFYYiSxZ2i+iesHf+dRuJK47+3EQyUc+jzjSUzsO
        7i5iwFEF0lRk8JRC10bjAUxKlXSQFTjI6eS21nk4qw==
X-Google-Smtp-Source: ABdhPJzpHrcqPyGNonYh3XomO+R25xpkIROfGgGQcbfXK1J5XppVZWGg/B8uKyraD16CqXyUy4KFVQW3Yhk7evbo5HY=
X-Received: by 2002:ad4:5bc4:: with SMTP id t4mr8674092qvt.3.1637769435711;
 Wed, 24 Nov 2021 07:57:15 -0800 (PST)
MIME-Version: 1.0
References: <20211116062256.2417186-1-vkoul@kernel.org> <20211116062256.2417186-6-vkoul@kernel.org>
 <20269960-a753-72d4-5a1d-430af00cf562@linaro.org>
In-Reply-To: <20269960-a753-72d4-5a1d-430af00cf562@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 24 Nov 2021 18:57:04 +0300
Message-ID: <CAA8EJppA+cxySCFtqyihMjE0MPgioNcK8BtBS+HqUD9E141HBQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] drm/msm/disp/dpu1: Don't use DSC with mode_3d
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 24 Nov 2021 at 18:40, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 16/11/2021 09:22, Vinod Koul wrote:
> > We cannot enable mode_3d when we are using the DSC. So pass
> > configuration to detect DSC is enabled and not enable mode_3d
> > when we are using DSC
> >
> > We add a helper dpu_encoder_helper_get_dsc() to detect dsc
> > enabled and pass this to .setup_intf_cfg()
> >
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     | 11 +++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  2 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           |  3 ++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h           |  2 ++
> >   4 files changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > index e7270eb6b84b..efb85d595598 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > @@ -332,6 +332,17 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
> >       return BLEND_3D_NONE;
> >   }
> >
> > +static inline bool dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)

Here you are returning the mask, so it should not be bool.

> > +{
> > +     struct drm_encoder *drm_enc = phys_enc->parent;
> > +     struct msm_drm_private *priv = drm_enc->dev->dev_private;
> > +
> > +     if (priv->dsc)
> > +             return priv->dsc->dsc_mask;
>
> dsc_mask doesn't exist at this point, so the patch should be moved later
> in the series.

Please ignore this comment, dsc mask already exists.

>
> > +
> > +     return 0;
> > +}
> > +
> >   /**
> >    * dpu_encoder_helper_split_config - split display configuration helper function
> >    *  This helper function may be used by physical encoders to configure
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index 34a6940d12c5..f3f00f4d0193 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -70,6 +70,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> >       intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
> >       intf_cfg.stream_sel = cmd_enc->stream_sel;
> >       intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> > +     intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
> > +
> >       ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
> >   }
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > index 64740ddb983e..36831457a91b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > @@ -519,7 +519,8 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> >
> >       intf_cfg |= (cfg->intf & 0xF) << 4;
> >
> > -     if (cfg->mode_3d) {
> > +     /* In DSC we can't set merge, so check for dsc too */
> > +     if (cfg->mode_3d && !cfg->dsc) {
> >               intf_cfg |= BIT(19);
> >               intf_cfg |= (cfg->mode_3d - 0x1) << 20;
> >       }
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > index 806c171e5df2..9847c9c46d6f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > @@ -40,6 +40,7 @@ struct dpu_hw_stage_cfg {
> >    * @merge_3d:              3d merge block used
> >    * @intf_mode_sel:         Interface mode, cmd / vid
> >    * @stream_sel:            Stream selection for multi-stream interfaces
> > + * @dsc:                   DSC BIT masks
> >    */
> >   struct dpu_hw_intf_cfg {
> >       enum dpu_intf intf;
> > @@ -47,6 +48,7 @@ struct dpu_hw_intf_cfg {
> >       enum dpu_merge_3d merge_3d;
> >       enum dpu_ctl_mode_sel intf_mode_sel;
> >       int stream_sel;
> > +     unsigned int dsc;
> >   };
> >


-- 
With best wishes
Dmitry
