Return-Path: <linux-arm-msm+bounces-79959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8EBC26869
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 19:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FC0B3B727A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 18:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DE5299923;
	Fri, 31 Oct 2025 18:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZFJtiRUr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EFD20C463
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 18:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761934110; cv=none; b=uKUS0KDZ25R4M/WhFZ/HlxnbQ87JR6BcfcW9IEslsjHvs/2nQhQnhsa+MWjITX30ojKBtLbdJwGXt2XLkZkABhcvUKLhhPA0kVoW5lmN9VrL1x11tkZg8V2gNWByxIC2Rzr8+4tTVEGMHayLHIhGNOFzMCDt2SWZWSxtvdQsSCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761934110; c=relaxed/simple;
	bh=uRHRvhmVNdE2i1lOFkZVyULnEQvxP0ZCohisi9KyGP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCWB491MzIknSyq1EVTiasFVRxm9UG+y18HxpKuhjMKJ/VlA0X0C36/Ql3u3PYcI7i5qKVPBw1pIhXYPtzawDhv8bubdxCEmc0FHY5ftpgNXtphM34U4WoC+61lUO6UNtFVxr5U2YV1P3YngDzBV+ydvady02Bdmy/K4FVeLb24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=ZFJtiRUr; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b6dbb4a209aso474428566b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1761934107; x=1762538907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k8d3ECFMhnrvwiqROxc/5OIhq95iyP7zpdKInqKWJBA=;
        b=ZFJtiRUrMJjbR5J5unM7bN2uf98HFVirMgqfUw3iRtv26zFZaoU/dMJc5uHGigcLxP
         kvUGRt7wiH9SIdqOMPlorlEH3iGOAy2voU58Sf1H79ko595neSdoLZ2IEQp7/1tORBRm
         /wI1sQd+JvgpFkCrrfTejffmSN3SJnJ1VI+zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761934107; x=1762538907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8d3ECFMhnrvwiqROxc/5OIhq95iyP7zpdKInqKWJBA=;
        b=hUoaZjCknScCntT1SKJy07VnHbLAmF4PwA9nnbvxaegWbWpjVD/4ChUAxYegGrVzzp
         ynaZWmMBiHiZKqLPdKWbjBTuMr9DGuKpufR5AzxyauzdoW3nRWz2/uGwNuVMh52mIkb2
         Mp9n89jWipseYBmkO4zweAy9NQ9AHDobVIReHXM4zAxS2ylE0rcw8DbEGe4a0oP5yBIY
         CeJE4gRgoTxFBsdBQXBXGhxoO7UR25Ko1SOAlhjQi0dD8YMgB4265JWhxJ/ARhPihRiw
         UoyyDSLVTf76Btdjps1ZR4cUn71OK0esrly7xNwV0KaVjWqfg6Nkzn/H9n+MQ2qxS9YA
         9KIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFFBeK7vF0+2VZWYpcTeJEkuG2BJ9EKkm+Fl7WlrC0ncikitm44ExcRk+H0qi9dhJTFmlIcwFbtcP9B45b@vger.kernel.org
X-Gm-Message-State: AOJu0YyaWL7OL4v6k8Q5IatQkD9CIJxM2QaL0lzQA9QuigQsgaUTMAMq
	2rFThqeSBfr2I3Qho1GnoKVp4qyGKEq9WV0kPF8dMBjqq1NwmUN9bSs+IEmBx1ozAh4=
X-Gm-Gg: ASbGncvSnKcTMyG3hjE0zbIzKUFQShaACcg4GMKWUHLPadKU/GXubiy2M/ZpvGTJasw
	BjC9iEn8oR0f6SOc8xHxzRnLqGi3tRApvmxdFPEZPXcpxrFEfROSbs6CBR0YCvZGAoRne+DWwgD
	HssVc/vtAH5U0LnDtGP4zm+e/0xSrrz93pu16bLQOpfnMi5DokDxTzto2yzmGhruG6dRJ6AyXG5
	pmDYcv/aSIDUCnYMguJMeYgI/44U+f03R2NIuVwSH9lHdqzy1TsIYSAJiEFuDaEorss+5CzqUt3
	4RsLeNGoDsa14I/jUnyUa6hfgmB06N+R5bzvS7gEcL0ihQ331eo79cWzazD4pBMamhg7I7gbsrm
	7lEmCSfrZTcoJNS74qUhiVk9DcCXSfZiOQyUA1UQiKKE0KC7Vg5zBhJ9X27OQDJuAIHDGJkQqSZ
	ofSY6u8ZAs934=
X-Google-Smtp-Source: AGHT+IGqIcTutuaI6gZsnpUKDuo7K+T8kt8BjV1yz4nEoXEK2pIhTNz970Lt/A0xE/Jshiw649tVtA==
X-Received: by 2002:a17:907:d7cb:b0:b3b:9832:f9b with SMTP id a640c23a62f3a-b7070191794mr462444466b.25.1761934106546;
        Fri, 31 Oct 2025 11:08:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077ce927csm235947166b.63.2025.10.31.11.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 11:08:25 -0700 (PDT)
Date: Fri, 31 Oct 2025 19:08:24 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: David Airlie <airlied@gmail.com>,
	"open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
	"open list:DRM DRIVER for Qualcomm Adreno GPUs" <linux-arm-msm@vger.kernel.org>,
	"open list:DRM DRIVER for Qualcomm Adreno GPUs" <freedreno@lists.freedesktop.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Vignesh Raman <vignesh.raman@collabora.com>
Subject: Re: [pull] drm/msm: drm-msm-fixes-2025-10-29 for v6.18-rc4
Message-ID: <aQT7GMYPkgALgJ5q@phenom.ffwll.local>
References: <CACSVV03kUm1ms7FBg0m9U4ZcyickSWbnayAWqYqs0XH4UjWf+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACSVV03kUm1ms7FBg0m9U4ZcyickSWbnayAWqYqs0XH4UjWf+A@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64

On Wed, Oct 29, 2025 at 03:39:06PM -0700, Rob Clark wrote:
> Hi Dave,
> 
> Fixes for v6.18-rc4
> 
> The following changes since commit b5bad77e1e3c7249e4c0c88f98477e1ee7669b63:
> 
>   drm/msm/registers: Sync GPU registers from mesa (2025-09-10 14:48:12 -0700)
> 
> are available in the Git repository at:
> 
>   drm-msm-fixes-2025-10-29

This is not really a git repo, there is something busted with your
scripting. I just used the url from the last pr, which seems to have
worked, but please fix this.

Anyway, pulled into drm-fixes, thanks!
-Sima

> 
> for you to fetch changes up to f5d079564c44baaeedf5e25f4b943aa042ea0eb1:
> 
>   drm/msm/dpu: Fix adjusted mode clock check for 3d merge (2025-10-29
> 00:20:47 +0200)
> 
> ----------------------------------------------------------------
> Akhil P Oommen (1):
>       drm/msm/a6xx: Fix GMU firmware parser
> 
> Anna Maniscalco (1):
>       drm/msm: make sure last_fence is always updated
> 
> Jessica Zhang (1):
>       drm/msm/dpu: Fix adjusted mode clock check for 3d merge
> 
> Neil Armstrong (1):
>       drm/msm: dsi: fix PLL init in bonded mode
> 
> Rob Clark (4):
>       drm/msm: Fix GEM free for imported dma-bufs
>       drm/msm: Fix pgtable prealloc error path
>       drm/msm: Reject MAP_NULL op if no PRR
>       drm/msm: Ensure vm is created in VM_BIND ioctl
> 
> Vignesh Raman (1):
>       drm/ci: disable broken MR check in sanity job
> 
> Vladimir Lypak (6):
>       drm/msm/dpu: Fix allocation of RGB SSPPs without scaling
>       drm/msm/dpu: Propagate error from dpu_assign_plane_resources
>       drm/msm/dpu: Disable scaling for unsupported scaler types
>       drm/msm/dpu: Fix pixel extension sub-sampling
>       drm/msm/dpu: Require linear modifier for writeback framebuffers
>       drm/msm/dpu: Disable broken YUV on QSEED2 hardware
> 
>  drivers/gpu/drm/ci/gitlab-ci.yml               |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c          |  5 ++++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c        |  7 -------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  3 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 14 ++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c  |  3 +++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          |  1 -
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c      | 18 ++----------------
>  drivers/gpu/drm/msm/msm_gem.c                  | 10 +++++++---
>  drivers/gpu/drm/msm/msm_gem_submit.c           |  9 +++++----
>  drivers/gpu/drm/msm/msm_gem_vma.c              |  8 +++++++-
>  drivers/gpu/drm/msm/msm_gpu.h                  | 11 +++++++++++
>  drivers/gpu/drm/msm/msm_iommu.c                |  5 +++++
>  15 files changed, 59 insertions(+), 43 deletions(-)

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch

