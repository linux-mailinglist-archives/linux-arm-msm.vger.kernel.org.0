Return-Path: <linux-arm-msm+bounces-14049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EFB87B583
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47C501C20A27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 00:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE786110;
	Thu, 14 Mar 2024 00:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxJr12T2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D44346A0
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 00:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374542; cv=none; b=EoGtkgsxvfHi7RIpuAmufBItAuuYLNQJYUgv5VHUfwEEC73m7m4Gx+Q7IBB9legJ2NDKVx82ekM3uvX5OjABhX5qlq0FTwMxMV+3rWO6HGF1Z4o1kXd3vY1o9SN3SrkIhuSZvU+uGtQ/wEaWAKidVsi2eA1iJ+7TdAp2pvoSTxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374542; c=relaxed/simple;
	bh=ilkoJctGVT8SM5WLUF6Ip7DMWvtQmLAOACa8wpiZRFg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C+Wz3kVsWcK9rWH+Pi99lXgnnJzycvovPy2aJ2Qjn4HSL/KDhPbyXcRA9p1ntzOZvk+uM9qgEwRHS5NLxrQ0/Y4rWHyjwV9Od7LcUR1Bm6xrx5GngLi89vHANJ6yAwbEnjRBNxEiYlqvET0msgKSIhDfKlWnfa8FDM2Xf0h0iH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vxJr12T2; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-513b1e1724bso458382e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 17:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710374538; x=1710979338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FeiSzTwCi2+P1JIq2YaZveHxo9xBvRmuEUfbA8nH/hg=;
        b=vxJr12T2rhXj4LEnmGhHtOswNUtzMwS2oaVqkBYp1n1wiMOxlTs5JC5w9eDTWokEEX
         2B/niN1fHvGv7wed6HKyAVwT86iSUMo5v/QucdmlYEPCG2ymfygrAN7SQZUEYy01DdE0
         l2c7XKYyhqXdhKyrzGVOZJrEhCn3BVh43oWOciVAgDhTMENzXc/Ick2ZqWFUVItCmRHV
         wHBmR6MXNaI+D2jjL/p617jqMAUhNycqYAXj4Bb1BSyplfw8VmL8GguUqZFRrfhfNOvK
         HHjRxa43dgpFjqlfd9zvNBo27mZ3kE+YEYeCZ2MmOmI045GXuZ+wvueGzH0g7xRaWdZV
         N/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710374538; x=1710979338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeiSzTwCi2+P1JIq2YaZveHxo9xBvRmuEUfbA8nH/hg=;
        b=SMb2y6fwwyS7gURpmz20lRpYcav+QfSLoO/aW2FKCsVlQSZBg59af1H8bNhQUEokuH
         0/2BDRyamNT4Xu3nCMKVs5jXDMWmRk3U8icLLHn/CNjsYVhU168CPENt045BbT61Y9M7
         8vs/NWWJr5FLeFNY1w3t1i1cZZVJqdnAVHFoaw5Ba7YSyUez1Mq9KSGCAWOjqVLBpVHK
         fqvF7lnv150GlcPBmd7yNPayJgXEdveGqOzs9k+mbcKU1p7dOtNeXInoNRV2IV5q8hmj
         Yhh5eGJOgzj+mgFjMMxqB5ADGEFLrx8ef/equN3NyyrT5MM/CQpmpUHXSQ69Wh+8polA
         zVUw==
X-Forwarded-Encrypted: i=1; AJvYcCWIrPZqQ9Hrtj2RULfi0uwotBEFWhkDW/xXFVYjs0S+lrg28f+wgFx01WvLWZC2636kNrfinPBhqD8gy21uZC6D3s6u/i6kJQKL1Gc2Ng==
X-Gm-Message-State: AOJu0YyD2iTTsZtzPkQde4bBhVKwz9BmYVb26N82P+KP2/2qGJM9e/eB
	N3zcyFcfHbd7ACmNWRSXFP4CbC7ZXmNFaop+4hzqP8LU2SGP8Dw5GuPhc8zz7vo=
X-Google-Smtp-Source: AGHT+IFtdclqN3OE7RqShWXdxrVC85SIqVaNFQ57TBoMNm0+PbjGlb49KMOWGCVgP1rVSceRnv/Emg==
X-Received: by 2002:a05:6512:525:b0:512:b2b0:89d with SMTP id o5-20020a056512052500b00512b2b0089dmr1615356lfc.28.1710374538324;
        Wed, 13 Mar 2024 17:02:18 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 17:02:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v4 00/13] drm/msm/dpu: support virtual wide planes
Date: Thu, 14 Mar 2024 02:02:03 +0200
Message-Id: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As promised in the basic wide planes support ([1]) here comes a series
supporting 2*max_linewidth for all the planes.

Note: Unlike v1 and v2 this series finally includes support for
additional planes - having more planes than the number of SSPP blocks.

Note: this iteration features handling of rotation and reflection of the
wide plane. However rot90 is still not tested: it is enabled on sc7280
and it only supports UBWC (tiled) framebuffers, it was quite low on my
priority list.

[1] https://patchwork.freedesktop.org/series/99909/

Changes since v3:
- Dropped the drm_atomic_helper_check_plane_noscale (Ville)
- Reworked the scaling factor according to global value and then check
  if SSPP has scaler_blk later on.
- Split drm_rect_fp_to_int from the rotation-related fix (Abhinav)

Changes since v2:
- Dropped the encoder-related parts, leave all resource allocation as is
  (Abhinav)
- Significantly reworked the SSPP allocation code
- Added debugging code to dump RM state in dri/N/state

Changes since v1:
- Fixed build error due to me missing one of fixups, it was left
  uncommitted.
- Implementated proper handling of wide plane rotation & reflection.

Dmitry Baryshkov (13):
  drm/msm/dpu: take plane rotation into account for wide planes
  drm/msm/dpu: use drm_rect_fp_to_int()
  drm/msm/dpu: move pstate->pipe initialization to
    dpu_plane_atomic_check
  drm/msm/dpu: drop virt_formats from SSPP subblock configuration
  drm/msm/dpu: move scaling limitations out of the hw_catalog
  drm/msm/dpu: split dpu_plane_atomic_check()
  drm/msm/dpu: move rot90 checking to dpu_plane_atomic_check_pipe()
  drm/msm/dpu: add support for virtual planes
  drm/msm/dpu: allow using two SSPP blocks for a single plane
  drm/msm/dpu: allow sharing SSPP between planes
  drm/msm/dpu: create additional virtual planes
  drm/msm/dpu: allow sharing of blending stages
  drm/msm/dpu: include SSPP allocation state into the dumped state

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  59 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  20 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 675 +++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  84 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  28 +
 10 files changed, 779 insertions(+), 152 deletions(-)

-- 
2.39.2


