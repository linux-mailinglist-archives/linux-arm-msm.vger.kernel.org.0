Return-Path: <linux-arm-msm+bounces-53898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F48A84B92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 19:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65AC19C3DF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 17:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6903628FFC5;
	Thu, 10 Apr 2025 17:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s7aPuTLk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBB428EA5D;
	Thu, 10 Apr 2025 17:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744307054; cv=none; b=ebQmDU2b+vnOmwEn3+kueIgYW/s/lbg8ei8D66VdAzPmJRrdQL7GT+kDxKRrfY1IAvwTMan0X1djqxwECIiQITHQABrXWoKyzwdNTSnM3yVKybZe5zI8NMe19MGrK2MKvdkMmzR49ye7zlG0R/P4knxmX7SxBO3MjO35hBTQvJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744307054; c=relaxed/simple;
	bh=TzU0yNDNxTV7Xy8TTEpD94TaKa3KYI72neWKtr0Ki74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H9HSvuxw8toWMCf5OqjxgMfu4E3LzY9aB0Id/udigG2ATqw/pKA+KoaPUW0qXemXPZc/J0DNyx3aJm637O/5fVapo7ATHUAgesQ6CtF0oEFN7Q3SpEy506pav+9speb9gJcRZNktV/iGesLMkdGXIFeG8rOkI/D+MMXb9KL5oAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s7aPuTLk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A971DC4CEEA;
	Thu, 10 Apr 2025 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744307054;
	bh=TzU0yNDNxTV7Xy8TTEpD94TaKa3KYI72neWKtr0Ki74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s7aPuTLktguo7zatUgpFlNaGDRjdkRhZXJUsfyYYXVaaumXDZApdXsGyeRVFy7bUK
	 s26mQu0W2GflNjs9QNcLEiD34XIbYZYyK6zl0QpGIFgd95k0PEM9l9NFELpqpNBlU7
	 CZgyE9py3NHHAcybiOL9ne89Myg66ugBoLm2qa+Uk5bzvMf5yUjK24r5hH3vYDlr5P
	 LF9UZYUGBmcXt4Lce+MgJGQVGX5X5KuW9WR5NSwJ/3scVg/0MZKljqNy3SWazK1Oqz
	 ZyXnK6KWd5A/Yimm/1ZEb8bJioI1CY0lNceI0jyuN8ecoKZcmbjXv0+RAMKkf9XxHz
	 gRW4y48pLPafQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 10 Apr 2025 19:43:46 +0200
Subject: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
In-Reply-To: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744307035; l=2298;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=m07m8qQDOOWd2fvMDrOD8Tzt78kulsuGTKp47oc3+WQ=;
 b=mSuoD139bK0ZvIJah6ExMqatBNKiV9yZSPo2PFoW+BCtduyL7mi4+1xx9wxfMJXSCjph4mH/M
 TgUE6n9kvwIBINJ5AXx6N4iYizF/rrtPr0lVEuRbytd7Qmgr6voaezc
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Highest Bank address Bit value can change based on memory type used.

Attempt to retrieve it dynamically, and fall back to a reasonable
default (the one used prior to this change) on error.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f8f5e57f38ecc62d9f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -13,6 +13,7 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/pm_domain.h>
 #include <linux/soc/qcom/llcc-qcom.h>
+#include <linux/soc/qcom/smem.h>
 
 #define GPU_PAS_ID 13
 
@@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 
 static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 {
+	int hbb;
+
 	gpu->ubwc_config.rgb565_predicator = 0;
 	gpu->ubwc_config.uavflagprd_inv = 0;
 	gpu->ubwc_config.min_acc_len = 0;
@@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	    adreno_is_a690(gpu) ||
 	    adreno_is_a730(gpu) ||
 	    adreno_is_a740_family(gpu)) {
-		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
 		gpu->ubwc_config.highest_bank_bit = 16;
 		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
@@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.highest_bank_bit = 14;
 		gpu->ubwc_config.min_acc_len = 1;
 	}
+
+	/* Attempt to retrieve the data from SMEM, keep the above defaults in case of error */
+	hbb = qcom_smem_dram_get_hbb();
+	if (hbb < 0)
+		return;
+
+	gpu->ubwc_config.highest_bank_bit = hbb;
 }
 
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
@@ -2467,6 +2476,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	bool is_a7xx;
 	int ret;
 
+	/* We need data from SMEM to retrieve HBB in calc_ubwc_config() */
+	if (!qcom_smem_is_available())
+		return ERR_PTR(-EPROBE_DEFER);
+
 	a6xx_gpu = kzalloc(sizeof(*a6xx_gpu), GFP_KERNEL);
 	if (!a6xx_gpu)
 		return ERR_PTR(-ENOMEM);

-- 
2.49.0


