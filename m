Return-Path: <linux-arm-msm+bounces-8682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AE183F42F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 06:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9A081C2181A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 05:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09926FB8;
	Sun, 28 Jan 2024 05:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mTHIrdsj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283726FAF
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 05:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706420544; cv=none; b=ONh4sWkVssJI5rj4KONfm01rUQH7j8sOuqkXqIAy+6PajM222vtKmCuVF151CYzPT38/gv7b4GdlercwDuYCmrLKFIsYYELr4IKCxvwwOHJ6kmUQlWN/k29/BKLTxihHD/BgfcrDq8+AjzMf1ekPJMw4iH1ob/ZHPW1ip5vMJc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706420544; c=relaxed/simple;
	bh=1ftiuzFdv0MNtt3YYdozAimEFiNYFZaRBvgCDdI3hKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PltlhzSbhz0MSlcNEnnKrrb3D424x9s9ntyzC0WGj2DCZVWhs9sK0vSb5UDuH97Z3Awy2nVgMHluQ+Qty38aBQ+CyJfDnm4ICMCbN0oqN/KwdQ4WAZVLFJBTFSJCHRBIPzlUL0KTavDApaC0ErdrC+6oMYl9o+Alqn07GxE9gvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mTHIrdsj; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5ffdf06e009so15250947b3.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jan 2024 21:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706420542; x=1707025342; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=egHYO2YboJTsBslYYNSSEBp/RtFeA3wC7dXrTQ5aJHw=;
        b=mTHIrdsjZg3KjkEo3IzBbX5H1q40USq+mo5ozsRvi18jn4EMHupQxyhOS2h/UHjykU
         yTv2JCyF9uM5x/XNSmX1bcWo3gsRZHTzD+G4JLJ89lZAXs8ewzxo09pgbeu8ZjmxxdFv
         C89XnE3zMXeFaKy+OKiXmwR21MrJY212eLcRYjHbRIV8ycFnTmJi5YXfYnaRhC+FGv4l
         Gk33DO3SIyDPuWkS54PbH/TgzNNT6yOUi6TdoioRQRqjeR5VfB4pysShz0q5Ar8dfu3o
         yd234hWVxbJbJeL0h5C0KzCNzF+Hpi8eQfcj13G4DdV95EAE7uqGp8UFk7J9452rYEWW
         wJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706420542; x=1707025342;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egHYO2YboJTsBslYYNSSEBp/RtFeA3wC7dXrTQ5aJHw=;
        b=dHKP25fpRlnioW259fQWjVWttYVzVAwUBLn6fCrXEXyCGxApzugdTtAuArmPKRYrFc
         8kp50tSnyvHYQXLuKCuq2wQODYS7ofZTRUYGwyl8lIRar4UEWNfXmS+qgi+8BdOkDkEh
         fov0AmNOSv90UhKXqoCYeQ1hBW9ZpJkDHXTo3lNXQONI+aZrweI39ouZXumPJpLLnz0c
         H5OxOIdsDSEv4y4Dy8t1aU5fgoSMZlO+DmXwcP3P/7GgPQhQyR3nLyd0MJChBPHP1TYs
         tNlhNDNJ5k3fJ5Y3H81tUv2yO1smi6e1ShE+vXT+kHa3AZk116A64T01p98ve+x1/vMb
         jDzw==
X-Gm-Message-State: AOJu0YyHkGeX3gO6jSm7hjIRD5brENPc4rhO97X2gGEN9aDuRqykAqtf
	/wvQ6ALZ0/m30MqQfFjRQ5FbKEomXY7Sje0Yfhb5f4c2iafZPSVuGcZF+WXhghpAJVNxOZ42J0F
	5ciwo8fgd8rN43JJwmGiZ6vKJl8hSIHMS0yF8Kg==
X-Google-Smtp-Source: AGHT+IHEXKEoNmK/xZGYiIM4abiTi/0eqdVBwVt8tDOs1rt3NYunlgaVXkKWnfWdNbsRqahjtMQaokOFcAXlTA7vMP4=
X-Received: by 2002:a81:b665:0:b0:5ff:483d:d155 with SMTP id
 h37-20020a81b665000000b005ff483dd155mr1827621ywk.99.1706420541796; Sat, 27
 Jan 2024 21:42:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-13-quic_parellan@quicinc.com> <96cf7370-b825-4ee9-ae17-8a6d72cb02d4@linaro.org>
 <4301fb48-7ed2-9cb4-1280-20524d15266d@quicinc.com>
In-Reply-To: <4301fb48-7ed2-9cb4-1280-20524d15266d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 28 Jan 2024 07:42:10 +0200
Message-ID: <CAA8EJpoJosKpG+BjeyZrpJGReaWiwg=qFGnv+8aCP3VWX4WxzQ@mail.gmail.com>
Subject: Re: [PATCH 12/17] drm/msm/dpu: add support of new peripheral flush mechanism
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Jan 2024 at 07:41, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 1/25/2024 1:49 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>
> >> Introduce a peripheral flushing mechanism to decouple peripheral
> >> metadata flushing from timing engine related flush.
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    |  3 +++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c      | 17 +++++++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h      | 10 ++++++++++
> >>   3 files changed, 30 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> index d0f56c5c4cce9..e284bf448bdda 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >> @@ -437,6 +437,9 @@ static void dpu_encoder_phys_vid_enable(struct
> >> dpu_encoder_phys *phys_enc)
> >>       if (ctl->ops.update_pending_flush_merge_3d &&
> >> phys_enc->hw_pp->merge_3d)
> >>           ctl->ops.update_pending_flush_merge_3d(ctl,
> >> phys_enc->hw_pp->merge_3d->idx);
> >>   +    if (ctl->ops.update_pending_flush_periph &&
> >> phys_enc->hw_intf->cap->type == INTF_DP)
> >> +        ctl->ops.update_pending_flush_periph(ctl,
> >> phys_enc->hw_intf->idx);
> >> +
> >>   skip_flush:
> >>       DPU_DEBUG_VIDENC(phys_enc,
> >>           "update pending flush ctl %d intf %d\n",
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> >> index e76565c3e6a43..bf45afeb616d3 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> >> @@ -39,6 +39,7 @@
> >>   #define   CTL_WB_FLUSH                  0x108
> >>   #define   CTL_INTF_FLUSH                0x110
> >>   #define   CTL_CDM_FLUSH                0x114
> >> +#define   CTL_PERIPH_FLUSH              0x128
> >>   #define   CTL_INTF_MASTER               0x134
> >>   #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
> >>   @@ -49,6 +50,7 @@
> >>   #define  MERGE_3D_IDX   23
> >>   #define  DSC_IDX        22
> >>   #define CDM_IDX         26
> >> +#define  PERIPH_IDX     30
> >>   #define  INTF_IDX       31
> >>   #define WB_IDX          16
> >>   #define  DSPP_IDX       29  /* From DPU hw rev 7.x.x */
> >> @@ -151,6 +153,10 @@ static inline void
> >> dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
> >>                   ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
> >>           }
> >>   +    if (ctx->pending_flush_mask & BIT(PERIPH_IDX))
> >> +        DPU_REG_WRITE(&ctx->hw, CTL_PERIPH_FLUSH,
> >> +                  ctx->pending_periph_flush_mask);
> >> +
> >>       if (ctx->pending_flush_mask & BIT(DSC_IDX))
> >>           DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
> >>                     ctx->pending_dsc_flush_mask);
> >> @@ -311,6 +317,13 @@ static void
> >> dpu_hw_ctl_update_pending_flush_intf_v1(struct dpu_hw_ctl *ctx,
> >>       ctx->pending_flush_mask |= BIT(INTF_IDX);
> >>   }
> >>   +static void dpu_hw_ctl_update_pending_flush_periph(struct
> >> dpu_hw_ctl *ctx,
> >> +        enum dpu_intf intf)
> >
> > I assume this is _v1.
> > Also the argument is misaligned.
> Ack.
> >
> >> +{
> >> +    ctx->pending_periph_flush_mask |= BIT(intf - INTF_0);
> >> +    ctx->pending_flush_mask |= BIT(PERIPH_IDX);
> >> +}
> >> +
> >>   static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct
> >> dpu_hw_ctl *ctx,
> >>           enum dpu_merge_3d merge_3d)
> >>   {
> >> @@ -680,6 +693,10 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops
> >> *ops,
> >>           ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
> >>           ops->update_pending_flush_intf =
> >>               dpu_hw_ctl_update_pending_flush_intf_v1;
> >> +
> >> +        ops->update_pending_flush_periph =
> >> +            dpu_hw_ctl_update_pending_flush_periph;
> >> +
> >>           ops->update_pending_flush_merge_3d =
> >>               dpu_hw_ctl_update_pending_flush_merge_3d_v1;
> >>           ops->update_pending_flush_wb =
> >> dpu_hw_ctl_update_pending_flush_wb_v1;
> >
> > What about the pre-active platforms?
> Pre-active does not need a peripheral flush.

Ack.

> >
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> >> index ff85b5ee0acf8..5d86c560b6d3f 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> >> @@ -122,6 +122,15 @@ struct dpu_hw_ctl_ops {
> >>       void (*update_pending_flush_intf)(struct dpu_hw_ctl *ctx,
> >>           enum dpu_intf blk);
> >>   +    /**
> >> +     * OR in the given flushbits to the cached
> >> pending_(periph_)flush_mask
> >> +     * No effect on hardware
> >> +     * @ctx       : ctl path ctx pointer
> >> +     * @blk       : interface block index
> >> +     */
> >> +    void (*update_pending_flush_periph)(struct dpu_hw_ctl *ctx,
> >> +        enum dpu_intf blk);
> >> +
> >>       /**
> >>        * OR in the given flushbits to the cached
> >> pending_(merge_3d_)flush_mask
> >>        * No effect on hardware
> >> @@ -264,6 +273,7 @@ struct dpu_hw_ctl {
> >>       u32 pending_flush_mask;
> >>       u32 pending_intf_flush_mask;
> >>       u32 pending_wb_flush_mask;
> >> +    u32 pending_periph_flush_mask;
> >>       u32 pending_merge_3d_flush_mask;
> >>       u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
> >>       u32 pending_dsc_flush_mask;
> >



-- 
With best wishes
Dmitry

