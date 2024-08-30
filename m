Return-Path: <linux-arm-msm+bounces-30316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B90F966C2D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 00:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40A221C214E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 22:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A231C1AB3;
	Fri, 30 Aug 2024 22:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZwCAbl+n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848081C1755
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 22:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725056192; cv=none; b=ee2mfPEdbEm1xzC+LVHydhh/ktvLoejqrUUYNqwbRWAFYcqH53C96iu3y81SDlaDaI+oEzgXvbE5jq2jj7RDiCFIOjc/1oZljiRh0mGewIvSgCQWeSVfD7NX14VDv4KFETK2T27mA+rgQ21J0WnxUrDN3/MrBprsRZy/tzZr02g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725056192; c=relaxed/simple;
	bh=q24YQHMqdDaHIRrMFVWRSb8dxdfIQqcrBR9swz7mMCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fkn1OLqHwG1opSbHFJT5GaOG24awHkuA2zhFdcY/qc0/nKO7DbvU1SuJjTfo//szzinVj4zJ8AaRKsiKiwNnQntIF027oDHlUSrKFNHjSrjgj5Bf6TirBNrbdCjV0mL1Ur1hbbHijN5iyRZda+x4jd0RExciBzzduX/TuC848sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZwCAbl+n; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6d49cec2a5dso7364517b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 15:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725056188; x=1725660988; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kg0OcxRkiJ9mILCxT4CPJe/4xi2OQv9TcXwbD36UhOo=;
        b=ZwCAbl+nA+NBzZSEhS7hsc/aexBCr/uKhyrID/OusbjPA5etgZrQPjXGbM4hUuIBSv
         oJTwTZC/BJZ40T4HjH6ZigaKs+RB/qYJKVU8SzDm34txCKStK3ZSzAkZvvAyZTI8VgNb
         UyRqJwt1jeOeGafPrcrpr9L5ihwFHkxoEluwFK2zaE9ETmpHbmlOxn3D4hOMQyeAxXHW
         dCFiZ9yPHO7FO/vm01PGzgAp1TOvUoI01Qbf5upyXd+eozXUHsFgZk3+Xa/QBDLiQb2T
         E4ybfTgW1QTzMiljePUp9+e7OfikN5sfb0HZe/dgcb8bag3rLCLncFMvNvzEGPLsPUO7
         fNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725056188; x=1725660988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kg0OcxRkiJ9mILCxT4CPJe/4xi2OQv9TcXwbD36UhOo=;
        b=CCHq8qhPhd07AB+OCJrMYEkp3HsMu9fNvn5+mqqsP8ggvIWB45RX/iY9RuRVtmrxzM
         9Ahi6G7jhhPCais8py/uJ8JtVJ32GD2Qf/ejv4UbjNYVFvjYm/TOCZRvYEbDAkSbJTCS
         QxvVCo4izisd9viCt1sMm4X5ExDoyvqr/MgAoDl93iO+5Iuu12PTS4L5dQ2aFIHvFcJZ
         htn6MjIacmVPH1y+GqY4APeuZMUso7JWO4fS7qHrlw33U6Po3iPQHGJIQO1XY5Zzq9po
         Be3lrwehDq1TDU2fSen+7JIW6FAhT0glkJTQMuLC0YBjMpXfCLOdQxMwJ8Un1HaZTyhf
         zfiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXKM3s1bX1IaMC7R1EaBkBUBxyEFQ2yYHNy2uw8v5LUi2xTHHV/EgHhytPfpF4rr4CYNW2nCXTvF6EDlxS@vger.kernel.org
X-Gm-Message-State: AOJu0YzdEs1KSQaIRud+mcHe9GTdvPciMNWpN/O7k/Dylf6YtOTjVohL
	GK8yPG/MApW+MBKP9vsWcG+bksfIuTTqFHEbcGx2cXWVxoeLpzz+ZjjLhicfhstqaxAF2jWc2H9
	ajBSysFX8XU3NfHEMfDMBFurabViWX5KhnUdqDg==
X-Google-Smtp-Source: AGHT+IHgOBmdwt0xUdZkJgCOZZM6PHszQRsO5mml5cm8WKpLa4tuyNCeZ9ZjuBiXceqbfQLAyAgRg28VJm8LcQEYicM=
X-Received: by 2002:a05:690c:6711:b0:6d3:be51:6d03 with SMTP id
 00721157ae682-6d40f82a5dcmr47478337b3.23.1725056188103; Fri, 30 Aug 2024
 15:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-11-502b16ae2ebb@quicinc.com> <pf6xgu7yjanzjigfpupons4ud6jbcmbr5icnd7yur6qhh3n5sf@plj4bi3beguw>
 <665da6e9-d9f3-4a28-a53b-0f467967fc78@quicinc.com>
In-Reply-To: <665da6e9-d9f3-4a28-a53b-0f467967fc78@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 31 Aug 2024 01:16:16 +0300
Message-ID: <CAA8EJpo0X7yRaqYV-tTco9+9WyexiPN_ey8hKivFrE3jTojUpg@mail.gmail.com>
Subject: Re: [PATCH 11/21] drm/msm/dpu: Add RM support for allocating CWB
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Aug 2024 at 22:28, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 8/30/2024 10:18 AM, Dmitry Baryshkov wrote:
> > On Thu, Aug 29, 2024 at 01:48:32PM GMT, Jessica Zhang wrote:
> >> Add support for allocating the concurrent writeback mux as part of the
> >> WB allocation
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  5 ++++-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 30 +++++++++++++++++++++++++++--
> >>   2 files changed, 32 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> index c17d2d356f7a..c43cb55fe1d2 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> >> @@ -1,5 +1,7 @@
> >>   /* SPDX-License-Identifier: GPL-2.0-only */
> >> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> >> +/*
> >> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> >>    */
> >>
> >>   #ifndef _DPU_HW_MDSS_H
> >> @@ -352,6 +354,7 @@ struct dpu_mdss_color {
> >>   #define DPU_DBG_MASK_DSPP     (1 << 10)
> >>   #define DPU_DBG_MASK_DSC      (1 << 11)
> >>   #define DPU_DBG_MASK_CDM      (1 << 12)
> >> +#define DPU_DBG_MASK_CWB      (1 << 13)
> >>
> >>   /**
> >>    * struct dpu_hw_tear_check - Struct contains parameters to configure
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> index bc99b04eae3a..738e9a081b10 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> @@ -1,9 +1,10 @@
> >>   // SPDX-License-Identifier: GPL-2.0-only
> >>   /*
> >>    * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> >> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >>    */
> >>
> >> +#include <drm/drm_managed.h>
> >>   #include "msm_drv.h"
> >>   #define pr_fmt(fmt)        "[drm:%s] " fmt, __func__
> >>   #include "dpu_kms.h"
> >> @@ -34,6 +35,7 @@ int dpu_rm_init(struct drm_device *dev,
> >>              void __iomem *mmio)
> >>   {
> >>      int rc, i;
> >> +    struct dpu_hw_blk_reg_map *cwb_reg_map;
> >>
> >>      if (!rm || !cat || !mmio) {
> >>              DPU_ERROR("invalid kms\n");
> >> @@ -100,11 +102,35 @@ int dpu_rm_init(struct drm_device *dev,
> >>              rm->hw_intf[intf->id - INTF_0] = hw;
> >>      }
> >>
> >> +    if (cat->cwb_count > 0) {
> >> +            cwb_reg_map = drmm_kzalloc(dev,
> >> +                            sizeof(*cwb_reg_map) * cat->cwb_count,
> >> +                            GFP_KERNEL);
> >
> > Please move CWB block pointers to dpu_rm. There is no need to allocate a
> > separate array.
>
> Hi Dmitry,
>
> Sorry, I'm not sure what you mean here. Can you clarify your comment?
>
> This is just allocating an array of the CWB register addresses so that
> the hw_wb block can use it to configure the CWB mux registers.

Excuse me. I asked to make the cwb_reg_map array a part of the
existing dpu_rm structure. This way other subblocks can access it
through dpu_rm API.

>
> Thanks,
>
> Jessica Zhang
>
> >
> >> +
> >> +            if (!cwb_reg_map) {
> >> +                    DPU_ERROR("failed cwb object creation\n");
> >> +                    return -ENOMEM;
> >> +            }
> >> +    }
> >> +
> >> +
> >> +    for (i = 0; i < cat->cwb_count; i++) {
> >> +            struct dpu_hw_blk_reg_map *cwb = &cwb_reg_map[i];
> >> +
> >> +            cwb->blk_addr = mmio + cat->cwb[i].base;
> >> +            cwb->log_mask = DPU_DBG_MASK_CWB;
> >> +    }
> >> +
> >>      for (i = 0; i < cat->wb_count; i++) {
> >>              struct dpu_hw_wb *hw;
> >>              const struct dpu_wb_cfg *wb = &cat->wb[i];
> >>
> >> -            hw = dpu_hw_wb_init(dev, wb, mmio, cat->mdss_ver);
> >> +            if (cat->cwb)
> >> +                    hw = dpu_hw_wb_init_with_cwb(dev, wb, mmio,
> >> +                                    cat->mdss_ver, cwb_reg_map);
> >> +            else
> >> +                    hw = dpu_hw_wb_init(dev, wb, mmio, cat->mdss_ver);
> >> +
> >>              if (IS_ERR(hw)) {
> >>                      rc = PTR_ERR(hw);
> >>                      DPU_ERROR("failed wb object creation: err %d\n", rc);
> >>
> >> --
> >> 2.34.1
> >>
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

