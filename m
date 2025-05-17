Return-Path: <linux-arm-msm+bounces-58277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C10ABABA1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 19:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C44316F65B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 17:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F3C20FAB4;
	Sat, 17 May 2025 17:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMq+wsdp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D208720012B;
	Sat, 17 May 2025 17:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747503201; cv=none; b=YfniWmlLwQq1vRy49XVeFHU1gLOfZKHYbVBtoWZh3kVOKfCgLtGmiTeR+AIxKhqAnOO9unIeylXB75T2cHzeRZkMRogBUh1H2dyS9qRnEzEuKGIp2BKFNfIn9ZZl3RnMD6Eygh+L67gV30EIsGUl4keCYszE5cSpgJ3vMEhsKQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747503201; c=relaxed/simple;
	bh=PJY08kjslgGhmDdERkXwScVrVjwlofF6yo+WJBP8gzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dLrm/7pvE4rz61DdzsbQOUd55rCSf0PszI2ErEXVIY2CWRvYZTMCGiZeszZ8Lrfkp+xasKouPWbnNbGkQu5igLnlpO4DGJINzeb8zpXLsl6jLTkIVjG/YBPAuabK/XsGUG88ssLBZhhFG+TFIkSfzhMYldHWlHiTj6+NXCuDcVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMq+wsdp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B04DC4CEEA;
	Sat, 17 May 2025 17:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747503200;
	bh=PJY08kjslgGhmDdERkXwScVrVjwlofF6yo+WJBP8gzE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qMq+wsdpbMZIkVJfHS6rJWYcYAUHdXvJ+XvRI3TnC+c6ySW/lvK98ROzPEVkb1B7x
	 vqVPvrZEGDFjBf6247xEk6yW9v7c2xeOQKeIP/oHafpqNBXcXOdgu0W+/kXrVDD954
	 YAqf5aS92wl0a6zWOkHXMmOGs3rQmX71+RGHJxf32gdf5tcfRN6E/m6Tb3vZMEvFWt
	 1bMB4c1+//O/mnlLtHK5Qc4ofpWYWGW+iMGyJzACROF8imZXrVfn/I6gRuFsJS82ne
	 DPj2a4lFGzykjLo5bkYYTt6hUwjVMg12eQ+yT8tpCto8iUPFqNzD1XtrBiOeh1K9pX
	 QUFiM84RDyd7w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 17 May 2025 19:32:41 +0200
Subject: [PATCH RFT v3 07/14] drm/msm/a6xx: Resolve the meaning of
 UBWC_MODE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-topic-ubwc_central-v3-7-3c8465565f86@oss.qualcomm.com>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
In-Reply-To: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747503160; l=2047;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=He8e9HFnzlSX4PTezq/QcRFeVx7J3NLaNFodeWm9TZ0=;
 b=DR+XPN/8cllzDpifMYRUmxmyry7v+h34PnWADDeMZfmhjOil+PN6Gv20gU5d+wLMbRqjL9fXk
 nSr+A1uy4etC0wkJu9UyYvI/ef1wee+UxNLcKcvoZo9ssZzercNw4IB
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This bit is set iff the UBWC version is 1.0. That notably does not
include QCM2290's "no UBWC".

This commit is intentionally cross-subsystem to ease review, as the
patchset is intended to be merged together, with a maintainer
consensus.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 include/linux/soc/qcom/ubwc.h         | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 00a928fee07290951b69263dd1d902ce85400fc0..154346591365f3f89d467674952abb2f067e7ce3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -668,11 +668,11 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	 */
 	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
-	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
 	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
 
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 4309787f7b6c8df3bbc37c3abd1a3f900398c1e7..7227bcdbd8d88834beb7427ca0929964d2ae937d 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -54,4 +54,14 @@ struct qcom_ubwc_cfg_data {
 
 const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);
 
+static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
+{
+	bool ret = cfg->ubwc_enc_version == UBWC_1_0;
+
+	if (ret && !(cfg->ubwc_swizzle & BIT(0)))
+		pr_err("UBWC config discrepancy - level 1 swizzling disabled on UBWC 1.0\n");
+
+	return ret;
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.49.0


