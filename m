Return-Path: <linux-arm-msm+bounces-78790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 145F2C0993E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 18:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9A32424066
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 16:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B478230DD00;
	Sat, 25 Oct 2025 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQgzPrfE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3262D9784;
	Sat, 25 Oct 2025 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409419; cv=none; b=JtpApIw/WmCyktOGGe7HiUubdkvnCk+qz+H100XcCBssLKC3QSWD0Nf/IqJ3+2IDpUkNdqwWLCnnO5ZB4LqiErfweu7VY+A55SQR+pPODktG2xHFh0Fl3r0gmNR7HSq1WvlZD6/TGEW1nfOkfaWPz19G3AJ7bP4GRRvcjZHBenY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409419; c=relaxed/simple;
	bh=w+Yb1zq/T6QaZ+E3dZcl4J0WUk+rco4X4LfmrcEqh/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rV1iIzolBhBYBo5j4zHxBU780qCR8rloUSeqtk5TMh5aG53qRy9IZTejVRRbr8yigxD2V6uxhosO6IsdeyYwNTGnO2xBMoFgmaUOv8DqycOGuqYM9K8IOh8m/yHNl0tyn1P9KY0/2d9pdSqzyOAJNGye2TthQCGZ+4vDpDP3YbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQgzPrfE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DC4C4CEFB;
	Sat, 25 Oct 2025 16:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409419;
	bh=w+Yb1zq/T6QaZ+E3dZcl4J0WUk+rco4X4LfmrcEqh/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WQgzPrfE9sWXOh4yAcOqcpQHgDoUJqA0m6grExIqwl9+VXCPK4P4zEvE5oT7dcUWo
	 QkJwuYhbuWlEGVfZWg1pMKNFt0/vtVodJQqddsCY/5yUW6mdnR3tIMrPmSfAPzvGEh
	 eNNWVN4c+SbBIIAhelwawJ2MuXQs8NXS9UvZOP/sKi0CW4N9paJMrbzZr4MH5Sg6IK
	 qij5TxRz8cfpWrpzj80FHskJZs504KqLMA5FSF5dU8JU06a6epLDQVraHDUXlNv9ml
	 Q9TzPROjAaheMY6xq/blmcKBWT4aQCv1lIoOBNjoBYtErVUhFZeR+NXiEPFCNr4dE9
	 etamquf8MDXeg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17] drm/msm/adreno: Add speedbins for A663 GPU
Date: Sat, 25 Oct 2025 11:59:07 -0400
Message-ID: <20251025160905.3857885-316-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Akhil P Oommen <akhilpo@oss.qualcomm.com>

[ Upstream commit 0c5300343d0c622f7852145a763c570fbaf68a48 ]

Add speedbin mappings for A663 GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Patchwork: https://patchwork.freedesktop.org/patch/670096/
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Why this should be backported
- Fixes incorrect OPP selection for A663: The change adds `.speedbins`
  for the A663 entry so the driver can translate hardware fuse values to
  the correct speed-bin bit used for OPP filtering. Without this
  mapping, the driver logs “missing support for speed-bin” and falls
  back to bin 0, which can lead to selecting the wrong OPPs or even no
  OPPs for some boards. New mapping added at
  drivers/gpu/drm/msm/adreno/a6xx_catalog.c:1032:
  - drivers/gpu/drm/msm/adreno/a6xx_catalog.c:1032
  - drivers/gpu/drm/msm/adreno/a6xx_catalog.c:1033
  - drivers/gpu/drm/msm/adreno/a6xx_catalog.c:1034
  - drivers/gpu/drm/msm/adreno/a6xx_catalog.c:1035
- Directly addresses the code path that depends on speedbins:
  `a6xx_set_supported_hw()` reads the fuse via `adreno_read_speedbin()`,
  maps it with `fuse_to_supp_hw()`, and programs the mask via
  `devm_pm_opp_set_supported_hw()`. If the mapping is missing, it warns
  and defaults to `BIT(0)`, potentially mismatching the board’s OPP
  table:
  - Mapping lookup: drivers/gpu/drm/msm/adreno/a6xx_gpu.c:2483
  - Missing mapping fallback and OPP mask set:
    drivers/gpu/drm/msm/adreno/a6xx_gpu.c:2516,
    drivers/gpu/drm/msm/adreno/a6xx_gpu.c:2523
- Minimal, data-only change: No architectural changes; it only adds a
  speedbin table for one GPU ID. The macro and field already exist and
  are used elsewhere:
  - Speedbin field docs: drivers/gpu/drm/msm/adreno/adreno_gpu.h:111
  - Speedbin helper macro: drivers/gpu/drm/msm/adreno/adreno_gpu.h:148
- User impact: On A663 devices where the fuse reads 113 (now mapped to
  speedbin 1), the previous default to bin 0 could underclock the GPU or
  make the OPP table unusable if the DT only defines bin-1 OPPs. This
  change ensures correct and safe OPP filtering for real hardware
  configurations.
- Stable criteria fit: Important functional fix for existing hardware;
  small, isolated change; no new features; low regression risk; limited
  to the msm/adreno driver.

Risk and scope
- Scope: Only the A663 GPU entry is touched, mapping fuses `{0,0}`,
  `{169,0}`, `{113,1}`. Devices with fuse 169 see no behavioral change
  versus fallback; devices with fuse 113 now correctly use bin 1 instead
  of incorrectly defaulting to bin 0.
- Regression risk: Very low. The OPP filter machinery and speedbin
  infrastructure are already in place. This commit simply supplies the
  missing mapping data for one GPU variant.

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 00e1afd46b815..2b1c41f6cfeee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1024,6 +1024,11 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00300200,
 		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 169, 0 },
+			{ 113, 1 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06030500),
 		.family = ADRENO_6XX_GEN4,
-- 
2.51.0


