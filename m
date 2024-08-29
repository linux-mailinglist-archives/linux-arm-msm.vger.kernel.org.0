Return-Path: <linux-arm-msm+bounces-30010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8706D96444C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08E1D1F2574E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877F819047F;
	Thu, 29 Aug 2024 12:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OZNDyHU6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA15818DF99
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 12:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724934188; cv=none; b=YJSIeeE64gQ6bginD/YaY11PY9T6ZhDs+P1TnGr6qU9sy1OVSuBQGBskGOZHvYUpVgLTsNIsEUtqeaFeMfOb78Dme+4+MEu6r/ZKkzuCyPQyIn/HNI4D8uFqSIol/uI2Xo1KlpnpjNg+ykkGzzCwTvoQql/6SitCnzm37pcaPvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724934188; c=relaxed/simple;
	bh=Tw3/jhaabwzEbbNyJEyJTf+O3ChH2rIwxRUBlWAIgG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ln2qgISAgU4zpeqL38kTG6szQh49o6SM4l8sY/Oy6JMo5pgBCx5a13Gv/C8qG65NToRhXVrucNaNk3ZMxhjGrRbKAdfJQou+2BFzdsVmKCaTEDO4aV9UtE36pBmu3BsCysYdLrbxWSE3LNjMir6K1dLHEM8WQQdXJyrsza1mErU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OZNDyHU6; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso582775276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 05:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724934185; x=1725538985; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oBRgy1SwbqgGgsChwDpW9dCKtLDOgboL57fncnEqPqg=;
        b=OZNDyHU6dzPzHY5MLDixm1dg489ClGCM8CQXB/+FUEUphp3flBSXgvfUcjdS6O5gMn
         57NsrqiwzQpGHGpVM2x/sDhYBk5j35S3M7dd5OXmehqODw35XsXFtBdGozZo2ow1d2PM
         jobcvZVDfuGImLATz9KqwmCpFzZe3/PiPGzFsifN9+NE5sMOYptMS2zKCaROSB/hHtMv
         RgfYkrRAzpwwJT9Dmnk4fuhYA4Xp4XfxOozr+6AYVpygqsBBfVpGfZOcYNxJ5YBj9/6B
         fXKytgeQuo02gEbvx7PvKAXwsNEZPPZFn5wHWLJo2w5sSz/ai0gocsWzVcQOQy1lW1SE
         sR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724934185; x=1725538985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oBRgy1SwbqgGgsChwDpW9dCKtLDOgboL57fncnEqPqg=;
        b=rfZef9ODqII5QC1fRXAC76n/M5wXH9umsPkff7FCIOLtBet/NPIOGUDE8iG+lm9O87
         Avd0jXcS42GVksQ68tUonaN4V7ZLKPIZdeOfVojBhiRr28lIHYURHPNk5q/BqCi5Y6TE
         ysdCnQcM2XJIhIyeVMBiLoViuL83z5lbRfGJROo4FueF7GsT8dtlJRfAgkynr1W3Wwii
         tWVf4oUIrZOliiPr/yble/XnPdV8+yfBg+eQHozHPK2tmp4d4BYcBuydsRC50YO2SXhB
         koTybH31NJNBts1eNDG7H5wXqlktb4KrMuH+NW5zO9Yr11KDmFEgda/lY7IDETk7In7p
         cw8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUx+4LcPiKyAmXJIa9wOhMn6STOm9tnECMAa/YExr0uj8I+wVTWKVOGSAaa167aOMF7NaTVwPxnfpFma/hK@vger.kernel.org
X-Gm-Message-State: AOJu0YxhDew2MxShfXJ15UcNb2PgpsChzIE5I+SB3rFwlz4m2ki1j90c
	96w3ZiVD9cB3rbULB2y/ZCt57PhBw88s/9x0FIfzepjgmwHXoe8GpXab78wpDmXc0IpTyqf2xl9
	sv6yWTxTQyOpJDtC2Qrpg3exhNBai0/67ZeVnhQ==
X-Google-Smtp-Source: AGHT+IE2JwdDtHrXWOXkr8swPM5s7DryraYBiVanjT5C61UlNu+OUKVCm0356LXp35L2K1UItF9VpHBO/lLLY49AnQM=
X-Received: by 2002:a05:6902:2e11:b0:e0b:e550:4e46 with SMTP id
 3f1490d57ef6-e1a5ab452e5mr2752227276.5.1724934185317; Thu, 29 Aug 2024
 05:23:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 15:22:54 +0300
Message-ID: <CAA8EJpoD_=FaBL2xj+xu21BG0X2vOtVcskOyeZFrWg4XL3m_tw@mail.gmail.com>
Subject: Re: [PATCH 00/21] drm/msm: Support quad pipe with dual-DSI
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
>
> 2 SSPP and dual-DSI interface are need for super wide DSI panel.
> This patch set make changes to DSI driver and extend pipes
> and related mixer blending logic to support quad pipe.
>
> This patch set is based on virtual plane patch set:
> https://patchwork.freedesktop.org/series/131109/

Is this "depends" or "used some ideas" or something else?

If it depends, please say that clearly, including the revision of the patchset.

Next, generic feedback for the series.
- Please provide detailed commit messages. Describe why the change is
being introduced.
- Please grok why and how SSPPs are handled in non-virtual and
especially in a virtual case. Feel free to ask questions, but I really
don't expect to see patches assuming single SSPP per pair of pipes.
- Please drop all unrelated changes. DSI, DSC, etc must go to separate series.
- Please take care about the commit trailers. If the change is a fix,
it should have the Fixes trailer.

Next, please restructure the series. The patches should be ordered and
split in a logical order.
Start with a commit that gets rid of r_pipe. Don't increase
PIPES_PER_STAGE, etc, just loop over two pipes. Note how the code
handles r_pipe->sspp and keep that unchanged. Be sure to handle odd
plane sizes correctly. You can not just divide width by two to get the
pipe width.
Next, split PIPES_PER_STAGE into two defines: one for mixer code, one
for the pipes per plane.
Next come additional patches, like PP stride, etc.
Then extract the code to handle a single LM pair.
Finally introduce quad pipe, allocate two sets of LM configs, etc.
Each LM config still gets two pipes per plane. Each plane can have 4
pipes. Be extremely careful with splitting of the plane framebuffer
into the pipe configuration. Both x coordinate and width can be odd.
And a pair of pipes can not cross the screen middle line.

>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
> Jonathan Marek (3):
>       drm/msm/dsi: add support to DSI CTRL v2.8.0
>       drm/msm/dsi: fix DSC width for the bonded DSI case
>       drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
>
> Jun Nie (18):
>       drm/msm/dsi: pass the right width to dsc
>       drm/msm/dpu: polish log for resource allocation
>       drm/msm/dpu: Add utility to get mixer number
>       drm/msm/dpu: Support dynamic DSC number
>       drm/msm/dpu: decide right side per last bit
>       drm/msm/dpu: request more mixer for 4K+ DSC case
>       drm/msm/dpu: fix lm number counter for quad-pipe
>       drm/msm/dpu: Support 4 mixers at most
>       drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
>       drm/msm/dpu: Support quad pipe in header files
>       drm/msm/dpu: Support quad-pipe in SSPP checking
>       drm/msm/dpu: support plane splitting in quad-pipe case
>       drm/msm/dpu: support SSPP assignment for quad-pipe case
>       drm/msm/dpu: setup pipes with 2 set of stage config
>       drm/msm/dpu: blend pipes by left and right
>       drm/msm/dpu: bind correct pingpong for quad pipe
>       drm/msm/dpu: support quad pipe in general operations
>       drm/msm/dpu: revise debug info to support quad pipe
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 119 ++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  11 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  73 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c       |  19 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h       |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h      |  11 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 385 ++++++++++++-----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  30 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 209 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  19 +-
>  drivers/gpu/drm/msm/dsi/dsi.h                    |   3 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c               |  54 ++--
>  drivers/gpu/drm/msm/dsi/dsi_manager.c            |   2 +-
>  include/drm/drm_mipi_dsi.h                       |   2 +
>  18 files changed, 566 insertions(+), 393 deletions(-)
> ---
> base-commit: 9651fbfb684e7a1288dbae3bf1f15cd484c0217a
> change-id: 20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-d2d6b3eb1d57
>
> Best regards,
> --
> Jun Nie <jun.nie@linaro.org>
>


-- 
With best wishes
Dmitry

