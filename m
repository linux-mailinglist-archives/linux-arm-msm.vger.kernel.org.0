Return-Path: <linux-arm-msm+bounces-10124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D8C84D319
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 21:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA7D21F247A5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 20:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84D81D697;
	Wed,  7 Feb 2024 20:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJLhxtcC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115D91E525
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Feb 2024 20:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707338546; cv=none; b=He1pehQg4b+0fy6JZcco3uvgMBmlTbIjBwM2sJhBjtwH/ylFJTf49CSenDFmLeWl31ZGUTGX42LHBy2H+k1Y06xBqmLEcjyZGCscf12fIweQHo11v3XreqDx8utCQY9b6SZU5S2N/phPuEQifj2U4S4MTbkbxLPJ/zENsB8CVaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707338546; c=relaxed/simple;
	bh=jWCS7vTWieaHmmI0xYRhP9xkHjDH0g/h0j4ZjlMz0g4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=LMCvOvpvDTpQzV+fkthl6t+/iRfp7JJpeiJRUwV+7jHnouO+5SFwJ+PdfP6uMbkrcWsCdjCfx4j1R8zD1EID7r2nH2C0oleXq3QUFneynmZbDbHcXgn/k1ceXGH3pIwxvyq8t7/fCgbpUdBO3g/SdF/fsNFWWCCXORm5lXhlQs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJLhxtcC; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so1460998a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Feb 2024 12:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707338542; x=1707943342; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i7SRBxYoK9LHUFD9hGgBcXZ8tzxyzNmubya79xIxsbE=;
        b=nJLhxtcC3KrGhOwWDog/XF3Erhz4Agq9gtuchBL1v7Zt8MRmp7+U8p+10WQErsxVv7
         mdiF40JVHb3CBjQ8SdnXAD+kN3d7V4GigpAZBwhFUYf7m20oL4Tyi3OkuLiWoXtVG0VN
         pHb9djiRxABSZz6cuC0IiC5pf4Tg3hGQJ49OjuQJBjp5Nukw0hg8K1Uf+ok3lJWGUVKc
         2ynf+33mePDNfFPabzQcHU+JADusnMAQsaae7gMKIJGIuyUZLl1Jg2D2kTrj/w///ZwR
         wmhP8OHI/5YvNBf0nUazma4tVBrAQHw5T5w/d//YOMGXBMsjle2L5a9jhc8xVvRVDr6S
         oZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707338542; x=1707943342;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i7SRBxYoK9LHUFD9hGgBcXZ8tzxyzNmubya79xIxsbE=;
        b=YWYrdkt8j7WY9PcawWVQ/avVsqnyk3plr5jBbHN24922iLtZOV9rf9knOr5aue/kK1
         5hkDhND3H5nm6KsfeccO4flsucQB62cWdODU4Tky2SAbup17SbozXofMCGW4u1BDgpZM
         D4M+LWlPClKWcL7vNlpNgWXGEJLdpMsOnqdGzKiCr0SyxRpJiITIz65n+gClzFEQwya4
         ZHoGFK03ZKzhq30qBGBCiDWKz19fYwF6h4ePAtLmL2AedzMoaE9QWJcCumuQNSGvWUZa
         Yb+DdMEFO/3TogRe9l9fN/1vNWhjn3L32Ei9LecttIxrGO8hAvfN48RpW9b004yJppfe
         LVrw==
X-Forwarded-Encrypted: i=1; AJvYcCUskyLli17laR76Yc13hEmxgSjUS1QCwlBKR7o9g1TW+dLcdjkVUKeW2IzLplkIY56eg+E/kWEZFDa0zDgni4V8/yK2EZGCEyZBWWCBoA==
X-Gm-Message-State: AOJu0YyVsywACgr/THs3QIut6Zc9bFUgz9L8IX8Hq5lmu2jlsUOoz3hA
	gwMUH67BeHrT4SZEqhpbJKqHy69Ey/wurW+uWyM5/FXWBCy9XEMUpMpyG90PxGp8vB27gb6BQ7T
	W18gFniGMeD9bCAmjBKJMKwqkxXo=
X-Google-Smtp-Source: AGHT+IFY3hjMz3ULM/3LgTj/OI5mPF5L/7niwSxy11z7IHfIRFUyp2boumPUFmr4o9DUWE5Yb2lHWlai8l/DVZmKoMc=
X-Received: by 2002:a50:fb0b:0:b0:55f:ff7b:3a00 with SMTP id
 d11-20020a50fb0b000000b0055fff7b3a00mr4783718edq.8.1707338541881; Wed, 07 Feb
 2024 12:42:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 7 Feb 2024 12:42:09 -0800
Message-ID: <CAF6AEGv+tb1+_cp7ftxcMZbbxE9810rvxeaC50eL=msQ+zkm0g@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2024-02-07 for v6.8-rc4
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dave,

A few fixes for v6.8, description below

The following changes since commit d4ca26ac4be0d9aea7005c40df75e6775749671b:

  drm/msm/dp: call dp_display_get_next_bridge() during probe
(2023-12-14 09:27:46 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2024-02-07

for you to fetch changes up to 8d35217149daa33358c284aca6a56d5ab92cfc6c:

  drm/msm/mdss: specify cfg bandwidth for SDM670 (2024-01-25 14:36:04 -0800)

----------------------------------------------------------------
Fixes for v6.8-rc4

DPU:
- fix for kernel doc warnings and smatch warnings in dpu_encoder
- fix for smatch warning in dpu_encoder
- fix the bus bandwidth value for SDM670

DP:
- fixes to handle unknown bpc case correctly for DP. The current code was
  spilling over into other bits of DP configuration register, had to be
  fixed to avoid the extra shifts which were causing the spill over
- fix for MISC0 programming in DP driver to program the correct
  colorimetry value

GPU:
- dmabuf vmap fix
- a610 UBWC corruption fix (incorrect hbb)
- revert a commit that was making GPU recovery unreliable

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dpu: check for valid hw_pp in dpu_encoder_helper_phys_cleanup

Dmitry Baryshkov (1):
      drm/msm/mdss: specify cfg bandwidth for SDM670

Kuogee Hsieh (2):
      drm/msms/dp: fixed link clock divider bits be over written in
BPC unknown case
      drm/msm/dp: return correct Colorimetry for DP_TEST_DYNAMIC_RANGE_CEA case

Randy Dunlap (1):
      drm/msm/dpu: fix kernel-doc warnings

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  8 ++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  3 ++-
 drivers/gpu/drm/msm/dp/dp_ctrl.c            |  5 -----
 drivers/gpu/drm/msm/dp/dp_link.c            | 22 ++++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_reg.h             |  3 +++
 drivers/gpu/drm/msm/msm_mdss.c              |  1 +
 6 files changed, 22 insertions(+), 20 deletions(-)

