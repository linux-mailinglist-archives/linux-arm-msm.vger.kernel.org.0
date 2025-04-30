Return-Path: <linux-arm-msm+bounces-56249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FCEAA4A28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 505E8178EFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 11:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342AA2505BE;
	Wed, 30 Apr 2025 11:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qebHaRJ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09975231829;
	Wed, 30 Apr 2025 11:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746012902; cv=none; b=iF4nVJceBLW05gG6EQX0vJApgrdx1Hhyc67jQSv3mM7GlFTFBk0sN9DrmQorwpWrfWFV1ogcTcxj+1pwpNqZMbvFTxll25Llh4LABQmDSsn6M1XuGcgbTGq4t58A/OduWH6eXivNURbYvsxsbZMEGYPa1dlb1uN9PZolVTfjRc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746012902; c=relaxed/simple;
	bh=yyD1cbb+bkMR/9YU0BHBwauoxKa4CcRYXmN3iuWr+yM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TagKUtXs3EjoqphZ9OQnEjDDivQnDgKAaNVRvh8cM9snnEjXcXHfWhMgWBmHkIFF/gzBXG+Ss3Ad2RLMQieaurR7mt/OynmXB7dUidkIf1ntiSdqFMnJWEKsRaVQjQHywSR7KYu82DxTHPhjb6DuizLSwRdlpFqzFy938QfZJF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qebHaRJ7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A3BC4CEED;
	Wed, 30 Apr 2025 11:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746012901;
	bh=yyD1cbb+bkMR/9YU0BHBwauoxKa4CcRYXmN3iuWr+yM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qebHaRJ7B3N2Wk6Z3WdDcWwCYaytcEDoHEg5eamGne/foQKk3GWCOSkrmk6wv5wt4
	 pEtQEyz/F5rahR+lkuO6+K2QwVRoXThlSBzIj86ysnsjE+it1sTJYyo9M9PF6ak11f
	 Mz+5UpIYPNwoUcbtoS05GcGLciOEL6Ntd927LZP+MNQ2YNlWfGBbRwqQsxY+5zlfzo
	 Q8VD+eFikcPlLNHtuM56W+77zqjYbydtJEEAbFLB5DUUGwsb+wgXMQcPz381Fuz9NC
	 1lw1BPkCJsO7ZhDlrlwZmhIrUgr+7VtHM+Wj6S07ScemXpyfk7/njcuSQZgldjOjJg
	 1cy2rGy2cxTZg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 30 Apr 2025 13:34:37 +0200
Subject: [PATCH RFT v6 3/5] drm/msm/adreno: Define A530 speed bins
 explicitly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-topic-smem_speedbin_respin-v6-3-954ff66061cf@oss.qualcomm.com>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
In-Reply-To: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746012880; l=930;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=vdqNF+6quxj2StOOTX7jH5Xg/VFIUIIQYh+43Msf0f4=;
 b=yj0jAj72kXnPsZI/W9i3P4rFmZ/2Sk6iFwiOZV6jRdaNjCicAgyvTKpUA9rCQpPi9PvfP29H1
 Iq85Tsqq16qAsw2qhb5cjXD4gVVrspx6gKwKmTlbLO0JPif9GxF3ZdA
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@linaro.org>

In preparation for commonizing the speedbin handling code.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
index 633f3153916277b34f90acc046ed2ee04a761727..105b3d14bd7592c784863346cfbcc28f000c2e8f 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
@@ -129,6 +129,12 @@ static const struct adreno_info a5xx_gpus[] = {
 			ADRENO_QUIRK_FAULT_DETECT_MASK,
 		.init = a5xx_gpu_init,
 		.zapfw = "a530_zap.mdt",
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0, 0 },
+			{ 1, 1 },
+			{ 2, 2 },
+			{ 3, 3 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05040001),
 		.family = ADRENO_5XX,

-- 
2.49.0


