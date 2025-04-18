Return-Path: <linux-arm-msm+bounces-54773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26891A93FD6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 00:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D93BB1B64532
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 22:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B0E1ADC8D;
	Fri, 18 Apr 2025 22:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3rYfl7u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A257241760
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 22:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745014686; cv=none; b=AbrNyb6yFTgqK7ECxneM0yPJz7UM/7RYWLSLat0cXFy+GA97XIGqoPAJipaZb7af+8G/ou+ZYY3Taj5vc3MYDMxHFo/pg4ao7V4NMl0tFIWNvD+tTyXr6UboPMGPaqeM7u/8CVEZ8AUyJ6tpkNSa3dIomB+Eh0u/hLvc7PCe3oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745014686; c=relaxed/simple;
	bh=aopDMgWKPr95w7dsaushMxqs4etUce29f0Yb+htFAUA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tHQxXDtAJ9fFT7FjiWQHY1G7T2oBBvDh2od6gVukC6C7W+q7ihmCrib1Ao+p0vPEh2rtJfg26jyxkVNvqiMwKbGZKj+LBSZFf701AkbkngjGmKpSyX8taByPOUpRwT0zJqdXuFqYVReJXHgQPimw3/patRFXdy55rX7JJRiEkuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3rYfl7u; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-85ea482e3adso98025739f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 15:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745014683; x=1745619483; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RS1FSpT2MlnZ7LD4PcV6/Q3ZAeJ8XPNoKk60igAHuvQ=;
        b=H3rYfl7uc9nXO0KOLs+DiX1nIHUD/CFMz6SEThwtX6MsnGYBzY98Hza9VYn4qBtsvr
         n9mvtKY8FDzy4IMav0J/QRWCm2Br4EoLzI3w0Fa9fhgSHFYYqwHsqQNkJerAQc/Mkx+b
         RC862UFgBJGVLdMWr+clGPPJmLC+ek4zu2e4qJZq3sEGd0r8j/hH+gpsm2NdnnqlCuJq
         W2spKr15cCUN0Ra9QydZdQJu3uIDsI9HrSLMeREXxw5IhD1uadvcxbtmfD7hpwY3kh5d
         z4uCsRKCAiHkdEulHMpy3ckCMB7akJgreIj3vv2TcEH5hFxGx2nfH4mUDzc+x15d3hTT
         vW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745014683; x=1745619483;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RS1FSpT2MlnZ7LD4PcV6/Q3ZAeJ8XPNoKk60igAHuvQ=;
        b=cJt/p7mj3KfGpTxxEO/MZ2U4D89TYrp4/4SsJAjkv+Cmo55S7TmRJ+ekNWaw+MRTrR
         FhUUJFpckJLy1OVTjujEl8Tztw0k+aDFeFx3YZvLOTa+yFzn/42GcBP6oe/ewoZboRAs
         fiyEsVyW4vPmMkJRBI7EL/FAYxQGNHZQsE8M1D+85Q8+wUAqssvcAdv4O+7sy0gmZe6B
         p8NO7CB8dx7snMN/ys9GLFuR38siExnXNZBbPz/V6pBe7+6awt4mG+PSDJfEyssd+4ev
         hpqyrnaIWYypG9Q/2WwCzpcetS9DTX/AlEI+vVrKRug0BmeeLz5mBHJ8dOQ45ttDygBv
         /nZA==
X-Forwarded-Encrypted: i=1; AJvYcCVcGgbTcwgvioM0cRvZ1qn7zQqvYDgMR9GBMk0Wl98vGGJ+pzQLBt3PL0p/5NutnbDovtEleTmHyCv6wN5g@vger.kernel.org
X-Gm-Message-State: AOJu0YzNnFMjHp7YX84T44IlaO8AK7R50Rd8BQFb1AjXE1tiWNtFVBsA
	wM+xL36G7NVVxLpH9xzETZmALLqcc3wfY7vmJ6EnZmkxDKY0lFtMzWsRYakjw597bYH/ERCGcnl
	wQ9a9BHjRrmICpbN/W/9xHJWTX+k=
X-Gm-Gg: ASbGncvnJEQz4VInoFz2/z+Oyyl/9D1FSAF+Fb2cCg8Zb5pvR5PY2As4OPr7kHkc9mm
	aU3O3ku7IKKssNI8SsOrwtxcQBHitWFyQvEWxXmCOV3ltrYqGzkR9+KrXO3O+YYfBB+4hnCiBHB
	IopI6/A57kZKWrybcfrVHvJybtKjWSfdDHNni6FuvMHGn5JwcG3pv3qkGb
X-Google-Smtp-Source: AGHT+IEfUxsOUwDFYpKLoaEmUzZ5X3ueiW+fXEta1tk63WYohjmHx0iZcS/k63/0pUUlXY5jfKd05JxFjQ17rgsUXqg=
X-Received: by 2002:a05:6e02:174c:b0:3d6:d838:8b93 with SMTP id
 e9e14a558f8ab-3d8bf27aca2mr33660785ab.7.1745014683628; Fri, 18 Apr 2025
 15:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 18 Apr 2025 15:17:52 -0700
X-Gm-Features: ATxdqUFZ_tO0K7cdxfy-S6NFR2m3x7fcs4Yr_m40G6w-4lUTP8wPeq_iH8w8-U8
Message-ID: <CAF6AEGtVKXEVdzUzFWmQE8JmK3nx_hp+ynOd-5j3vnfcU-sgOA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2025-04-18 for v6.15-rc3
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dave, Simona,

A few fixes for v6.15, as described below.

The following changes since commit 83ee6d2ec52f1378f3473ee8657d559bebdbda44:

  dt-bindings: display/msm: dsi-controller-main: Add missing minItems
(2025-03-08 03:06:00 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2025-04-18

for you to fetch changes up to 9d78f02503227d3554d26cf8ca73276105c98f3e:

  drm/msm/a6xx+: Don't let IB_SIZE overflow (2025-04-18 15:15:24 -0700)

----------------------------------------------------------------
Fixes for v6.15-rc3

Display:
- Fix to call dpu_plane_atomic_check_pipe() for both SSPPs in
  case of multi-rect
- Fix to validate plane_state pointer before using it in
  dpu_plane_virtual_atomic_check()
- Fix to make sure dereferencing dpu_encoder_phys happens after
  making sure it is valid in _dpu_encoder_trigger_start()
- Remove the remaining intr_tear_rd_ptr which we initialized
  to -1 because NO_IRQ indices start from 0 now

GPU:
- Fix IB_SIZE overflow

----------------------------------------------------------------
Chenyuan Yang (1):
      drm/msm/dpu: Fix error pointers in dpu_plane_virtual_atomic_check

Dmitry Baryshkov (1):
      drm/msm/dpu: drop rogue intr_tear_rd_ptr values

Jun Nie (1):
      drm/msm/dpu: check every pipe per capability

Qasim Ijaz (1):
      drm/msm/dpu: reorder pointer operations after sanity checks to
avoid NULL deref

Rob Clark (1):
      drm/msm/a6xx+: Don't let IB_SIZE overflow

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  8 +--
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |  2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |  3 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  4 --
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  3 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 74 ++++++++++++----------
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  7 ++
 10 files changed, 53 insertions(+), 55 deletions(-)

