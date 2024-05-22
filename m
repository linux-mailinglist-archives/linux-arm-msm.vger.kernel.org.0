Return-Path: <linux-arm-msm+bounces-20264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 989708CC795
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 22:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0403AB2108D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 20:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5331CAAE;
	Wed, 22 May 2024 20:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B2ZhiIAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D55F4E7
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 20:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716408099; cv=none; b=GuRc0vXnqVVrEejv9PPRXDK0YWxfEDZ/1AO5vwBBhyc5zkfrm+b/BPpF3fB3DUA2dryofKwOHw0ugWpD3dPIXsrOL+pz1tA1DAoFRXPy8YfoSamDy6prMdymKPW/mNTp6BsLBzu+P9kUB17zqVTHxSA9EokJ2bff7DiZupK11P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716408099; c=relaxed/simple;
	bh=E2MhD/impd63iY0PURt2QkGl5IEOTUJE8+cf6tDrelk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wg4TQM3u06hrKUwXYHMAaEGgVBhlAf1elW6u+zp+tZu/vWf4pzxW4ygiKjl25FzdN3XFyMwe6BdjsdyL9LcvdvWO4VsdJf2AoNpqwS/SEIFuID13+yjX+rxI6vBD6/xRC1PwEnPgWs0vrnrl6pyXfqFmBxl+ecgT2nVHNqpwhnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B2ZhiIAC; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-627e3368394so16632457b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 13:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716408095; x=1717012895; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DRPkMdMiFXiHSXSHC1KGtPEPqoByQrBvux7SR1+/mUI=;
        b=B2ZhiIACCQ31nOw/wJ3VbNw1ptMfSAOyn02kzIN10U1fEO2ZI5GmqXkSavSwcdQ19n
         87+W+KdAhp7K/MQCxtEjv6b5sAy2/N3q3hBTiCEFDSN4IC0DLhBopI0L50QE9YfRYUK9
         7b6IYYW0Vh9YwxwFZ9fcZhTxJXMsUL4ddXeWj+5jXPE6aDAP+Iwnxs7RrNQHJsDVJ/hY
         lkH9ikk29lzNQi26wFFrQ/hHVYqjcgUc3gVw5c/HSjkDHoC/kOgdBU1Eg6qTpRXMRcfI
         U8w66bZazTOOEepDIGzI9UsI5CP00sAfpazXVy2Dj31aAlp+RzStEz/T0S3PbctD6RV4
         28Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716408095; x=1717012895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRPkMdMiFXiHSXSHC1KGtPEPqoByQrBvux7SR1+/mUI=;
        b=qiLIidL8JnID0aAKAIRRRRxflaT3pH/2l2tleUzQJjoHWPMQQdLHQx2nKNCx5QGnZR
         jbrvlayrbjVRgV9J01f9Bh3corhCKw5ju1OnHvFy8X5/jYNPG3mQcMbUVYcATQPne466
         cMyAaWWF/juUDrJ7yBpVEwcfoIcgnXWJuiq9bpwg2LWEE4+6UhEbNEr2K6cbVYKrN0R3
         SsVIPD6lxXcw79sce95ExWiutkon2MScE0HgUi8GbcX3aIEs+tsK0vP3RPVJukwTNiHI
         cvoRFRBahFcR/A63AzSGWSMP+GY6legTJ/h1SUvDLrhNvC00lAwgmuKlqcvueic/ksx4
         OpbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqxAlRUS/8AnkPexGjmMy8b2HkWRcobp5H9IHf5u63sm1XwYQOW6q+X9U6gKBVDh+7Ts73l3s7usRZSqNqvx4hlUZEhp1pR1tvtyLh5g==
X-Gm-Message-State: AOJu0YxD29PaYxc+FNaMce3aDD/OilKPecS/S98D4CBoevDI1kF6tN9F
	yzLcSlBfgkBFpbUkRFmPO7ZYXDGypY7PcSFBn/deltLG/j1KvilCxSmQsehT+LjfFifszfmiGYO
	KZ4rOUfwBz+oRNjIIYw8udAOUwuxZYpeEO+Fg4g==
X-Google-Smtp-Source: AGHT+IGp6pTwvIYDaSqRLy9eyI5ICKE1WVJu990cWnLKFAuKaL+Hi52m5qOuALyhACM95iFGWGyXVZCh3VhYsES77d0=
X-Received: by 2002:a25:2c9:0:b0:dcf:bc57:cd61 with SMTP id
 3f1490d57ef6-df4e0df17bfmr3143774276.50.1716408095274; Wed, 22 May 2024
 13:01:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <20240520-dpu-handle-te-signal-v1-2-f273b42a089c@linaro.org> <a349dda7-8af5-0996-0057-9da30f39dfb1@quicinc.com>
In-Reply-To: <a349dda7-8af5-0996-0057-9da30f39dfb1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 23:01:24 +0300
Message-ID: <CAA8EJpo7MdFqFUS0jcs3v4bSOoi6WWnbjahqn4r045CX8CTcOg@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/msm/dpu: convert vsync source defines to the enum
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 May 2024 at 21:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
> > Add enum dpu_vsync_source instead of a series of defines. Use this enum
> > to pass vsync information.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 26 ++++++++++++++------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h  |  2 +-
> >   5 files changed, 18 insertions(+), 16 deletions(-)
> >

> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > index 66759623fc42..a2eff36a2224 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > @@ -54,18 +54,20 @@
> >   #define DPU_BLEND_BG_INV_MOD_ALPHA  (1 << 12)
> >   #define DPU_BLEND_BG_TRANSP_EN              (1 << 13)
> >
> > -#define DPU_VSYNC0_SOURCE_GPIO               0
> > -#define DPU_VSYNC1_SOURCE_GPIO               1
> > -#define DPU_VSYNC2_SOURCE_GPIO               2
> > -#define DPU_VSYNC_SOURCE_INTF_0              3
> > -#define DPU_VSYNC_SOURCE_INTF_1              4
> > -#define DPU_VSYNC_SOURCE_INTF_2              5
> > -#define DPU_VSYNC_SOURCE_INTF_3              6
> > -#define DPU_VSYNC_SOURCE_WD_TIMER_4  11
> > -#define DPU_VSYNC_SOURCE_WD_TIMER_3  12
> > -#define DPU_VSYNC_SOURCE_WD_TIMER_2  13
> > -#define DPU_VSYNC_SOURCE_WD_TIMER_1  14
> > -#define DPU_VSYNC_SOURCE_WD_TIMER_0  15
> > +enum dpu_vsync_source {
> > +     DPU_VSYNC_SOURCE_GPIO_0,
> > +     DPU_VSYNC_SOURCE_GPIO_1,
> > +     DPU_VSYNC_SOURCE_GPIO_2,
> > +     DPU_VSYNC_SOURCE_INTF_0 = 3,
>
> Do we need this assignment to 3?

It is redundant, but it points out that if at some point another GPIO
is added, it should go to the end (or to some other place, having the
proper value).

>
> Rest LGTM,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry

