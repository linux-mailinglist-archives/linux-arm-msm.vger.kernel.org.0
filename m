Return-Path: <linux-arm-msm+bounces-62591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E434DAE995C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA140167EAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 09:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C35D28C5D2;
	Thu, 26 Jun 2025 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehVNkdFM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5234B1B85FD;
	Thu, 26 Jun 2025 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928562; cv=none; b=NufyOZ/0cLqXi22uJxBkf4mNwGCm/BNUyJ/9DdhElINJQQp58AsIWnlTcauGUAfB3Np69xfDqizuWbUDsULWBSn9C5JAa/8GOp2KV4Bne4TuL9wewtiXwatNPiwKtmqP7mpQ7Y0kaB2pA7n8Dgu2QiIUP6z4RzJ7q1QFm5/On5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928562; c=relaxed/simple;
	bh=KbLsdwb4HpArj4QJSpFyt/yC2KREItkA16Uytq4IACM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k0QU7VqdwqpQj2uvlgTBVwoa910fdfVVW2a5ZHbNRF7M2F0oyNLoSsSoJnGlQepHBbsT03R3pGYL9s3dVZrZXLPu4HR+8OrWAkOP7C+CoNvkr6almDcOMjzlutqDsrXYmCfHqj8jts/tnMB653PBeGr8vdtM1FQq6qF4K1WTVZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehVNkdFM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7EE2C4CEEB;
	Thu, 26 Jun 2025 09:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928562;
	bh=KbLsdwb4HpArj4QJSpFyt/yC2KREItkA16Uytq4IACM=;
	h=From:Subject:Date:To:Cc:From;
	b=ehVNkdFMeKT97WQGZwvIkscsmUQ9ExrIMXzKYH+2z5ywpN2VygpmOMZo/q4PQFhxm
	 cmgbOWk5S9luBwJN4wv2eSZBOkTo1vmM2Mqf8n5VJtrifTo7mpu3XvACA6U2dShcaY
	 QcnCqQbEbc43KGlonY2sCm4xoAyn1f2rV3mQfOVLaLhVjuOnBaoJD92kEcQgSwe1XZ
	 fBOkgXymqgjNBZ9kwtFId6MJ9or60dYIu4AbFdUluSUnc3gInvOOtuWE1zCgxKpddy
	 TYnhSAbFRcdszHotel3TrqfnyhhtZXFuhkQhb3II5sxVHa+IRSHyTwcwxsbXglPzaz
	 Dvrq++QvqnZNg==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v6 00/14] Add a single source of truth for UBWC
 configuration data
Date: Thu, 26 Jun 2025 11:02:27 +0200
Message-Id: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKMMXWgC/3XRwW7DIAwG4FepOI8KDGbpTnuPaZqI46xIbdJCk
 m2q8u4j7aE5kIul3xLfL5mbSBwDJ/G2u4nIU0ih73JwLztBR999swxNzgIUoLJGyaG/BJJj/UN
 fxN0Q/UmiIbSqVfrAKPLDS+Q2/N7Rj89Hjnwdsz08l8eQhj7+3YsnvWwfHaiqUsekpZLKIFlCq
 hnVe5/S/jr6E/Xn8z4PsagTrCRtixIs0oGpJuUVEm9IZi29FiWTJUOVdYgO28ptSHYlQfGCk80
 SeOt0YwCM9RsSPiUHWJQwSwzoGl1B/hAoSPM8/wOMEezw+AEAAA==
X-Change-ID: 20250430-topic-ubwc_central-53c540f019e5
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928557; l=4935;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=KbLsdwb4HpArj4QJSpFyt/yC2KREItkA16Uytq4IACM=;
 b=YT3dVWVjfNYZJ/2iNP5eqXiaENyeuJYGa6RWMbR2mTTMbfn6mgv+EAHT59FAD1KjbgK3ntV03
 Ah0AzQ71TdfBj2gyGEz+EAg/OXT2UT11UxIZpApFN9Z5BulLvqaDZtX
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

As discussed a lot in the past, the UBWC config must be coherent across
a number of IP blocks (currently display and GPU, but it also may/will
concern camera/video as the drivers evolve).

So far, we've been trying to keep the values reasonable in each of the
two drivers separately, but it really make sense to do so, especially
given certain fields (see [1]) may need to be gathered dynamically.

This series introduces a Single Source of Truth (SSOT) database to be
consumed by multimedia drivers as needed.

[1] https://lore.kernel.org/linux-arm-msm/20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com/

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v6:
- Fix modular build of ubwc_config (oops)
- Link to v5: https://lore.kernel.org/r/20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com

Changes in v5:
- Drop 'RFT'
- Rebase on 8750 addition
- Pick up additional rb on patch 4
- Link to v4: https://lore.kernel.org/r/20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com

Changes in v4:
- Stub out qcom_ubwc_config_get_data()
- Move the select for QCOM_UBWC_CONFIG to DRM_MSM
- Use a define for UBWC_SWIZZLE_ENABLE_LVL2 in a6xx_gpu.c
- Pick up tags
- Link to v3: https://lore.kernel.org/r/20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com

Changes in v3:
- Rearrange some patches some more (Dmitry and I talked off-list,
  hopefully this version is reasonably sane)
- Throw the error returned by qcom_ubwc_config_get_data(), don't always
  assume it's -EINVAL (so that we can EPROBE_DEFER in the future if the
  SMEM driver that provides DDR info decides not to come up..)
- Scream if ubwc_swizzle doesn't match
- Drop dropping the ubwc_swizzle override (needs some testing in the wild)
- Move long statements out of declaration space
- explicitly define UBWC swizzling levels
- Fix the SAR2130P omission
- Pardon the funny ordering, but since it's intended to all go through
  drm, I attempted to strike a balance between clear, separate
  changes/fixes and logical succession
- Link to v2: https://lore.kernel.org/r/20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com

Changes in v2:
- Rearrange some patches
- Don't zeroalloc a copy of ubwc_config, store a full struct inside
  adreno_gpu instead (temporary solution until we trust the central db
  on the HBB value)
- Improve some commit messages
- Fix up SM6125's config
- Don't break userspace abi (hbb value)
- Don't keep mdss_reg_bus_bw in ubwc_config
- Add the last patch warning if there are inconsistencies (I don't
  insist on it getting merged, but I think it's a good idea for the
  time being)
- Link to v1: https://lore.kernel.org/r/20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com

---
Konrad Dybcio (14):
      soc: qcom: Add UBWC config provider
      drm/msm: Offset MDSS HBB value by 13
      drm/msm: Use the central UBWC config database
      drm/msm/a6xx: Get a handle to the common UBWC config
      drm/msm/a6xx: Resolve the meaning of AMSBC
      drm/msm/a6xx: Simplify uavflagprd_inv detection
      drm/msm/a6xx: Resolve the meaning of UBWC_MODE
      drm/msm/a6xx: Replace '2' with BIT(1) in level2_swizzling_dis calc
      drm/msm/a6xx: Resolve the meaning of rgb565_predicator
      drm/msm/a6xx: Simplify min_acc_len calculation
      soc: qcom: ubwc: Fix SM6125's ubwc_swizzle value
      soc: qcom: ubwc: Add #defines for UBWC swizzle bits
      soc: qcom: ubwc: Fill in UBWC swizzle cfg for platforms that lack one
      drm/msm/adreno: Switch to the common UBWC config struct

 drivers/gpu/drm/msm/Kconfig                 |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  20 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 138 +++++------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  46 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   2 +-
 drivers/gpu/drm/msm/msm_mdss.c              | 344 +++++-----------------------
 drivers/gpu/drm/msm/msm_mdss.h              |  29 ---
 drivers/soc/qcom/Kconfig                    |   8 +
 drivers/soc/qcom/Makefile                   |   1 +
 drivers/soc/qcom/ubwc_config.c              | 282 +++++++++++++++++++++++
 include/linux/soc/qcom/ubwc.h               |  75 ++++++
 18 files changed, 535 insertions(+), 441 deletions(-)
---
base-commit: 2ae2aaafb21454f4781c30734959cf223ab486ef
change-id: 20250430-topic-ubwc_central-53c540f019e5

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


