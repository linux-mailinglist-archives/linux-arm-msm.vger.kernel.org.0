Return-Path: <linux-arm-msm+bounces-57302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78105AB0231
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 20:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F07B54C3200
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B4227A903;
	Thu,  8 May 2025 18:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWunfEki"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A0D229B16;
	Thu,  8 May 2025 18:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728006; cv=none; b=uMRBeIGveCcMXbFzjsGTFat0/8SaYh25hy12raGZXcNdLxFveswteoqrRdVroMo1dAzpWQuFlIgNaY9L86//qb6m/NVe8IL22aeBSX0p6U7DsGgO45P5DEIo+r+RSsgnHNowmct7ZnD0oLVMeUb5PmSBoatu6uiw5YJFKbNc5OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728006; c=relaxed/simple;
	bh=tMAy5xVCwWpgxNJfNaRnAAeKwSI9QYqDnzAylqCtjYc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nVsR7LRwFYRV8RgYaogr7ywNtU3+V1lSrn0tU0OiGgVGgAZyzYoHZ4fY6MDW55xz9emA/EBzL+2V9SQik1Wi+XSGi1gwp4HHN3Hj0JgBaANh9U+MEuDQbh3Q6keIafclGKK5u2LUpaVvEjkBRzg7ley7pji4eWSFCfBuzJ+t3Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWunfEki; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A26C4CEE7;
	Thu,  8 May 2025 18:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746728006;
	bh=tMAy5xVCwWpgxNJfNaRnAAeKwSI9QYqDnzAylqCtjYc=;
	h=From:Subject:Date:To:Cc:From;
	b=mWunfEkiaoTV8QCc52y61TtGeejMs4U1+AhKERoIPr0LyzDpbvji+lITrAeLm6/QY
	 m43XRJLKliEPWcj/rNWNX0UAYGdkaTQ+5c3praGKnHIKlDF0s87GUXFzNX382Ibmva
	 LNZ3dJfPSBssNWXmiH68iYiVsEeWM94Jrn5V42/VWMRoTayEDRYCTVHYLJLxdn2JZL
	 bs/juXDgZ/WglgQS3O2khXdPjA4xp6bP/OLarYNgdIiU2Nwhi3uD9dRNJDvJuBNXkG
	 SfFMaaVrV7wmAUzN2YgguyDj46nORqbQpl/0ACLEL+bOJAob4Q6UNOci5+cYSOFrc6
	 euwMzG7grCPTw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [RFT PATCH 00/14] Add a single source of truth for UBWC
 configuration data
Date: Thu, 08 May 2025 20:12:32 +0200
Message-Id: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABD0HGgC/y3NYQrCMAwF4KuU/DbSbla3IeI9REZb4yxsnTadC
 uLdrVMCgfcgX17AFD0xNOIFke6e/RhyUAsB7mJCR+hPOUMhCy1XpcQ0Xr3DyT5c6yikaHrUpdM
 reZaqJg358Brp7J8zejj+cqTblO30K2EgZjPbjdjOdJ4/vXFlGzur1zrfndos4V2hQqsMWapqa
 Svaj8zL22R6Nw7DMq/d9681TPhtfGpEoGfCP13B8f3+AAEWw2frAAAA
X-Change-ID: 20250430-topic-ubwc_central-53c540f019e5
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746728002; l=3014;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=tMAy5xVCwWpgxNJfNaRnAAeKwSI9QYqDnzAylqCtjYc=;
 b=qwT6r0o9a6b07+HS3tbDhJgdoh+nVD6SD7bdCNpoJHF0AEPe24I3pCZEYQTv+ZfFHYOPPx7FF
 uBJsq7l9E0cBBzlIOcrQxVkfBKbPmxO3hqK2AvOLaqjBggV/g275URH
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
Konrad Dybcio (14):
      soc: qcom: Add UBWC config provider
      drm/msm: Use the central UBWC config database
      drm/msm/adreno: Offset the HBB value by 13
      drm/msm/a6xx: Get a handle to the common UBWC config
      drm/msm/a6xx: Resolve the meaning of AMSBC
      drm/msm/a6xx: Simplify uavflagprd_inv detection
      drm/msm/a6xx: Resolve the meaning of UBWC_MODE
      drm/msm/a6xx: Replace '2' with BIT(1) in level2_swizzling_dis calc
      drm/msm/a6xx: Resolve the meaning of rgb565_predicator
      drm/msm/a6xx: Stop tracking macrotile_mode (again)
      drm/msm/a6xx: Simplify min_acc_len calculation
      drm/msm/adreno: Switch to the common UBWC config struct
      drm/msm/a6xx: Drop cfg->ubwc_swizzle override
      drm/msm/a5xx: Use UBWC data from the common UBWC config struct

 drivers/gpu/drm/msm/Kconfig                        |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  17 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 129 ++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  10 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  41 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   2 +-
 drivers/gpu/drm/msm/msm_mdss.c                     | 302 +++------------------
 drivers/soc/qcom/Kconfig                           |   8 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/ubwc_config.c                     | 255 +++++++++++++++++
 .../msm_mdss.h => include/linux/soc/qcom/ubwc.h    |  19 +-
 17 files changed, 395 insertions(+), 414 deletions(-)
---
base-commit: 19c541fe872387798a25df947f56a26212aa9a97
change-id: 20250430-topic-ubwc_central-53c540f019e5
prerequisite-message-id: <20250505-topic-7c3_rgb565pred_fix-v1-1-b1aebe890b8e@oss.qualcomm.com>
prerequisite-patch-id: b1d26d75633cacbde82a456bff06d27de2792733

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


