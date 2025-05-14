Return-Path: <linux-arm-msm+bounces-57850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A55AB6F0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05E2F7AFBDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 15:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487861C5D4C;
	Wed, 14 May 2025 15:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vlapqhv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210FD12C499;
	Wed, 14 May 2025 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235448; cv=none; b=JVDTuREUdzh7CuedV4qZLy4ZQSSmBs577yH6gg0MflGuoOWeItibTWvdmqlgeE03+gPFuidpW8tEB6KyzOToF2OVw9/3UmjhJKf9mV8/KxjRw9cG5joEgLWCdqFkqt53oGAtwH59o5+rl8STfkAIEVwXPcbI1h4uy+PahOTe3nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235448; c=relaxed/simple;
	bh=51s1ugliCZ9y9tBTWNjREJUDvKnLeqgTAYWYYnww7tM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=daCJYex311VNpiTLw9Q+3Q2QNV+zfabFCZ7W8i9vDoP6+ar7wvsrCUH410AH0s2N6NnL+nN0NJJoKQny7FrMejOkz2xGTKfMC0kp/7lvbVlnoNNELLIozlPJcHP/iS6QQ5POLydDICJxVXNVH4Vtf3SzYmVjVJewqTdhSVxPqXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vlapqhv+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABA7C4CEE3;
	Wed, 14 May 2025 15:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235447;
	bh=51s1ugliCZ9y9tBTWNjREJUDvKnLeqgTAYWYYnww7tM=;
	h=From:Subject:Date:To:Cc:From;
	b=Vlapqhv+gM0aiz94PdoikbsOxJ0CMutLOS/yXoa/V2ibUUfYKeT525Jj6iUVj0VIX
	 oYpBIvSQjvtL8g5q6BYIofpY1WJyDiwCO0KdkmNhwLlAimM898mAQOCcqvF1zepk3N
	 WaSM/fa+Fj9xvIxu2kzL18E+Qzzkph7XbWFUggQhNoiCsc6S+EutE5L1rZrBs+Xxjf
	 86iHfDeaJL9cAq2NEkKUOv4U16KTWyGLrUiFo8n8uoLxH6HPsxal56877w2HVyQ51H
	 9dC9JclMzjXFEDvWnRTN9hPHEGHTC2phWRU045Jpb3XmkTPsPJPk98+wFuRzJYvOCb
	 DtXQtf41rDeWA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [RFT PATCH v2 00/15] Add a single source of truth for UBWC
 configuration data
Date: Wed, 14 May 2025 17:10:20 +0200
Message-Id: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFyyJGgC/22NzQ6CMBCEX4Xs2ZLlZxP15HsYYmBdpAlQaAtqC
 O9uhYMXL5N8k8x8CzixWhycowWszNpp0wdIDxFwU/YPUfoeGFJMCfMMlTeDZjVVT76x9N6WraK
 MKccak5MQhOFgpdav7fRa7GxlnMK3/5WNdt7Y9yaek2+7OwiP/xxzolBhRpwzcSWEF+NcPE5ly
 6br4hBQrOv6AV/4O7HQAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=3475;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=51s1ugliCZ9y9tBTWNjREJUDvKnLeqgTAYWYYnww7tM=;
 b=V9qKgWmQlFJZwWodaXCZPfFPpKAnjadFmxqUc6FdCktyOis3bFJK1AqssaDhaLghlADua9Kaf
 CDurEBEKoMuCAGpbIwAPzgfphXX6L/ze492vPPSixmCceby0fZGNzM7
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
Konrad Dybcio (15):
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
      drm/msm/adreno: Switch to the common UBWC config struct
      drm/msm/a6xx: Drop cfg->ubwc_swizzle override
      soc: qcom: ubwc: Fix SM6125's ubwc_swizzle value
      soc: qcom: ubwc: Add #defines for UBWC swizzle bits
      [RFC] drm/msm/a6xx: Warn if the highest_bank_bit value is overwritten

 drivers/gpu/drm/msm/Kconfig                 |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  20 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 131 +++++------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  46 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   2 +-
 drivers/gpu/drm/msm/msm_mdss.c              | 333 +++++-----------------------
 drivers/gpu/drm/msm/msm_mdss.h              |  28 ---
 drivers/soc/qcom/Kconfig                    |   8 +
 drivers/soc/qcom/Makefile                   |   1 +
 drivers/soc/qcom/ubwc_config.c              | 244 ++++++++++++++++++++
 include/linux/soc/qcom/ubwc.h               |  69 ++++++
 18 files changed, 480 insertions(+), 433 deletions(-)
---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250430-topic-ubwc_central-53c540f019e5

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


