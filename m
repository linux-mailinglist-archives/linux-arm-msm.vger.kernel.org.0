Return-Path: <linux-arm-msm+bounces-30419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C952968B7A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 18:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0A071F21A04
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 16:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831041CB512;
	Mon,  2 Sep 2024 16:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4osFr0t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0F061FEB
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Sep 2024 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725292937; cv=none; b=jQ9Klns+qJCYPngT4PU1qtBky13GhTYs/wLRF1WlPub9emoRhV5szTDeeBFUd6EJijwAOxcuTV8ClwyFqD57DZ2bXKK6p82aeBezuCqWUFz7yP7C3ZMw1b84xBvIH7MeoKvbCJ6MpV7wRtVEYMBp2Wxu3AZtHzKuN/P8B71K2IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725292937; c=relaxed/simple;
	bh=bhOd29Ph4ablsEbCbVtM4OLdkWT2TfJLL97jz9+8E3g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Z9Q74Rw/5qW68WSDGdgRWeliFEl90HNjvK+jN0yjz2rebWTZFamAtn0RzH1ZrmRPNPDlcMXhMFH8/vrhbGoLhDx5jJi/Y5K3ouEgAy/lnFA5iT0Qfrwi9t0RUtZAHh1EGCM4RiAzhquY/4SmoI3tV9+n3Pf5mPQ5eCiv2A5xMb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4osFr0t; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c260b19f71so1019113a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725292934; x=1725897734; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C5Vz4j/A/EBROJlE9V4B05ru+E+LAW4sw0oP3utBImE=;
        b=B4osFr0tWxUmkN0P1PcPTS0B8Kg83ZtZ9F3t1713jpWwUumzTSwAmynse5ykVchfJz
         7AbUlPIuvCbe5SxEP/4D+DFeSUkWbiz3nvKhuR2W071hFiLWUBAU/UjWRPpgGkYsLSi3
         aPMvBabGdIET7muCcMSlwpZi8/qkEL/s+HP7i7zEdrG+CZy8I60Ts9Al90PR/hGu82D2
         EO8n/TEIJCDdNxRDoAjVMDqjbT5l+DIHxvoL065p2zp3jQ5tsl4SY/zrWiHWdKEqPGSN
         ypyx0ULBHt4RCaTKGQOYUGNodtBOglxgDI6xT+1e4v7SX2nZJqeuFMcULA93CBlPrrai
         mfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725292934; x=1725897734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5Vz4j/A/EBROJlE9V4B05ru+E+LAW4sw0oP3utBImE=;
        b=FLaSXmc/MAgofJUeZZHSNnZzC50uvhACu3mgeWkyee4S2j+ZELPUiwtim6i2p5vu9i
         38iPuj10qh+IBjKsPd+Dpd0nuNmgo5p8CsaR2vxlN9Y6qFrvEI0cZK1SzJQpUFuuq0vA
         efFq7v07mGIAgulyk88lsf9rSu3PSVDjCsF+o1EajEqA4j2waAun5/W+NZZvzjuybCkC
         0NBJTiAC/poLC5sadDl+jFC95W9IJLodpn2ACULIe1F3fpyUPKEDiyUa/At8Jc7uT5v+
         C2uLtMNJc4JayCpOW8/Phf9fykoVRn9NRWhc8niX6RKzmd9r0/8PNkFjkOxXNVNnuAa3
         LaSw==
X-Forwarded-Encrypted: i=1; AJvYcCW9liV0VoX0IBz9WTlt2EU5ZDs54SfQ2foUWpCEa8TqYvqCdFri3hu1zxeeHs+JvrNcihoacY6O4/yiZLN2@vger.kernel.org
X-Gm-Message-State: AOJu0YzcMKofn+sxTqv2cERsuxD67xN9W/RclI1AJdQ1+NnSVvJD7cIY
	pLEyRCOi1DRqzX9A/yP/ZXftjSqSPIowLQxyCOTDh09GyDpZK+rzc/Jw87yHvGNPmSk/8FmMexP
	3g3SxkkPxcJ0/5tovmhJLf6718eY=
X-Google-Smtp-Source: AGHT+IEhc+/8y64ZulsxnV4yI6VLUOUZZy9iSB4IdqH34+WUVPpWjXBiGG98AToLe56K34DK7eKcTEBawagsbwAnfMs=
X-Received: by 2002:a05:6402:350c:b0:5be:d7d8:49ad with SMTP id
 4fb4d7f45d1cf-5c24374192amr4098204a12.22.1725292932960; Mon, 02 Sep 2024
 09:02:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 2 Sep 2024 09:02:01 -0700
Message-ID: <CAF6AEGudK7YMiKDhtvYgp=bY64OZZt0UQSkEkSxLo4rLmeVd9g@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2024-09-02 for v6.12
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave, Sima,

This is the main pull for v6.12.  It ended a bit smaller this time,
there are a few series on the dpu and gpu side that weren't quite
ready to go this time around.

Further description below.

The following changes since commit 6d0ebb3904853d18eeec7af5e8b4ca351b6f9025=
:

  Merge tag 'drm-intel-next-2024-08-29' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next
(2024-08-30 13:41:32 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2024-09-02

for you to fetch changes up to 15302579373ed2c8ada629e9e7bcf9569393a48d:

  drm/msm/dpu: enable writeback on SM6350 (2024-09-02 02:53:44 +0300)

----------------------------------------------------------------
Updates for v6.12

DPU:
- Fix implement DP/PHY mapping on SC8180X
- Enable writeback on SM8150, SC8180X, SM6125, SM6350

DP:
- Enable widebus on all relevant chipsets

DSI:
- Fix PHY programming on SM8350 / SM8450

HDMI:
- Add support for HDMI on MSM8998

MDP5:
- NULL string fix

GPU:
- A642L speedbin support
- A615 support
- A306 support
- A621 support
- Expand UBWC uapi
- A7xx GPU devcoredump fixes
- A5xx preemption fixes
- cleanups

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dp: enable widebus on all relevant chipsets

Aleksandr Mishin (1):
      drm/msm: Fix incorrect file name output in adreno_request_fw()

Arnaud Vrac (1):
      drm/msm: add msm8998 hdmi phy/pll support

Connor Abbott (7):
      drm/msm: Use a7xx family directly in gpu_state
      drm/msm: Dump correct dbgahb clusters on a750
      drm/msm: Fix CP_BV_DRAW_STATE_ADDR name
      drm/msm: Update a6xx register XML
      drm/msm: Expand UBWC config setting
      drm/msm: Expose expanded UBWC config uapi
      drm/msm: Fix UBWC macrotile_mode for a680

Dmitry Baryshkov (6):
      drm/msm/dpu: Configure DP INTF/PHY selector
      drm/msm/dsi: correct programming sequence for SM8350 / SM8450
      drm/msm/dpu: enable writeback on SM8150
      drm/msm/dpu: enable writeback on SC8108X
      drm/msm/dpu: enable writeback on SM6125
      drm/msm/dpu: enable writeback on SM6350

Eugene Lepshy (1):
      drm/msm/a6xx: Add A642L speedbin (0x81)

Konrad Dybcio (7):
      drm/msm/adreno: Assign msm_gpu->pdev earlier to avoid nullptrs
      drm/msm/a6xx: Evaluate adreno_is_a650_family in pdc_in_aop check
      drm/msm/a6xx: Store primFifoThreshold in struct a6xx_info
      drm/msm/a6xx: Store correct gmu_cgc_mode in struct a6xx_info
      drm/msm/a6xx: Use the per-GPU value for gmu_cgc_mode
      drm/msm/a6xx: Set GMU CGC properties on a6xx too
      drm/msm/a6xx: Add A621 support

Laurent Pinchart (1):
      drm/msm: Remove prototypes for non-existing functions

Li Zetao (1):
      drm/msm/adreno: Use kvmemdup to simplify the code

Marc Gonzalez (3):
      dt-bindings: phy: add qcom,hdmi-phy-8998
      dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
      drm/msm/hdmi: add "qcom,hdmi-tx-8998" compatible

Otto Pfl=C3=BCger (1):
      drm/msm/adreno: Add A306A support

Richard Acayan (1):
      drm/msm/adreno: add a615 support

Rob Clark (1):
      drm/msm: Remove unused pm_state

Sherry Yang (1):
      drm/msm: fix %s null argument error

Vladimir Lypak (4):
      drm/msm/a5xx: disable preemption in submits by default
      drm/msm/a5xx: properly clear preemption records on resume
      drm/msm/a5xx: fix races in preemption evaluation stage
      drm/msm/a5xx: workaround early ring-buffer emptiness check

 .../devicetree/bindings/display/msm/hdmi.yaml      |   28 +-
 .../devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml |    1 +
 drivers/gpu/drm/msm/Makefile                       |    1 +
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c          |   11 +
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   14 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   16 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c          |   30 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  141 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   21 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   89 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   46 +-
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |    2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   15 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   51 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   18 +
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |   18 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |   18 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |   18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |    6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   41 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h           |    7 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   12 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |    2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   10 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |   12 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |    1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |    8 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |    5 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c           |  779 ++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h                      |    4 -
 drivers/gpu/drm/msm/msm_gpu.c                      |    1 -
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 1118 ++++++++++++++++=
+++-
 drivers/gpu/drm/msm/registers/display/hdmi.xml     |   89 ++
 include/uapi/drm/msm_drm.h                         |    2 +
 37 files changed, 2527 insertions(+), 130 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c

