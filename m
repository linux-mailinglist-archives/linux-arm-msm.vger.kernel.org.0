Return-Path: <linux-arm-msm+bounces-62459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAF9AE840B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 15:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FFA51C20B45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207492620C4;
	Wed, 25 Jun 2025 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zggbwkhl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BC625D53E;
	Wed, 25 Jun 2025 13:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857051; cv=none; b=VVljQxKJVcDLhPx+iZl4ZzDCintuOkFC3mMXp2zM0d4pHQVFZorRErftfK0LPPngk2XMb8ZsI6DUjhI4szP6tuyP8y6BlkY2qDVF+mv6/+VdrY/hoFX5UK7fYO8UuFpBh8DwEYvbfbpP/JJK5v5qfjnItht4/Mai07h6epJInHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857051; c=relaxed/simple;
	bh=4+f7GA/otNyWhQwFzv3cN+bRXvAY+QsCJlqjXa4WCbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZhekKv3EgPfgHpba2+sTxNZ+MIIKMTLcMp+KfKWuzLLVYfNAodkUb+PGSoow5FCoSH7qdTAkLo69rzQ6gHrmUzdvybZBnqih1T5bSPjORi+GrONZHVhikQS/Rj7GvOIRhYpdOqldyY3Li/2xmjIAqNyoYtlFXcdMAbGen4weeIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zggbwkhl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE60C4CEEA;
	Wed, 25 Jun 2025 13:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857050;
	bh=4+f7GA/otNyWhQwFzv3cN+bRXvAY+QsCJlqjXa4WCbQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zggbwkhl/imWx1II153ZRhSuyRKcNYTOUYKDyZ89WIP/rDVulNHf3oUs3OJ5IfI8g
	 QPkRedXzK6JnoIzuGfJAs0DMeozBZdMpTLa/itFkX7TonHS39cR7pc8gypj/Z588Dy
	 abgD8ubRSGGgQr6acWXJpfwxSx9TZhye2dNttKpBF2iQC1ARVP90/YtFpH1gmWz2OK
	 ZpNwVnzaLU20uw6u7I7ZwKGHDSWI2rV7E9qBDsCMHSu63T2O+FqohnOTE3/rjCLs9o
	 UdRvkkEgdN6IPQHD5lAUv0Bc6gAYj/8IxFUquAWVeyWnFDghkL2ZgCyhaQf3AbQPpa
	 X0eobgrixNDJw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 25 Jun 2025 15:10:15 +0200
Subject: [PATCH v5 07/14] drm/msm/a6xx: Resolve the meaning of UBWC_MODE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-topic-ubwc_central-v5-7-e256d18219e2@oss.qualcomm.com>
References: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
In-Reply-To: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750857014; l=2107;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=gbQdqtBOeisek0R+EbShz3Z9yw3aoUL/2+EsNsZHbj0=;
 b=/+o6wlnyMk5hrp+/vadcqkO8sHq+NbuPMHdUmYnHhEk3cMwl55Puusn+FBrovmHN0hUq/JAdy
 njmm6QCaOECDslOrFNm77gsXgieQEjbtBSxI9zb3WcfiCKaJfPsI0pk
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This bit is set iff the UBWC version is 1.0. That notably does not
include QCM2290's "no UBWC".

This commit is intentionally cross-subsystem to ease review, as the
patchset is intended to be merged together, with a maintainer
consensus.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 include/linux/soc/qcom/ubwc.h         | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 3d9c98e56d92ed43cf6e702fbd2b5cbd3293ac5a..3d345844337608086ffec1998b47b315ada68a97 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -686,11 +686,11 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
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
index b92fc402638bae85e4e9da2552be56ac9ea9b448..5dc41aafa0afe1fe7f66ae6f8815989663ced780 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -62,4 +62,14 @@ static inline const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 }
 #endif
 
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
2.50.0


