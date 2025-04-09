Return-Path: <linux-arm-msm+bounces-53659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF78A82913
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 16:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D78DC189A7CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 14:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB5A270ECF;
	Wed,  9 Apr 2025 14:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIBMslPg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE1426B955;
	Wed,  9 Apr 2025 14:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210083; cv=none; b=YG93QKwSYhywPZ6l4m6W0sNtDgz1CZvGJkRQPTY9MDC9/Xf/zHAA41PwipidOdyrgWWjm5ArTIEb3Q5DGmdF/kpYbnbLQVdpZjkJ/OO2vZYre/fzH6MxDZLRXfiIovvXOmL8SxIGIR4hcCS7AYLsOLyu2R0Pf7w184o6EZK5lGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210083; c=relaxed/simple;
	bh=DA0MsBAv7mSBKJfJZoGs6FR9UBhabwdVtyUhzknmeLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2qOK7fAuB4klpSf2xQgjcjqguWw/xvBF55zMI8DyT/sCVIzatfe/2SJXMjR7dqUwoNYiWsOu7Ntk/88GSUr7NWu+pk0uBfhBP3r7Mbp398yk5sMLbNPr+iRyuypBYoURpKM0Wlx/XQ+wz1e3/AeZakAr8pViRjmeB8oIvOvD2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIBMslPg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8594FC4CEEC;
	Wed,  9 Apr 2025 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744210082;
	bh=DA0MsBAv7mSBKJfJZoGs6FR9UBhabwdVtyUhzknmeLQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NIBMslPg5t+nzDSNBdQt0IvPeAs0rJiY2u61m4prx6ZmA8wEYAU9TYXWhjJr2iyvD
	 MfM5gNaiHl0O4Yjk5UcBDB7ncfTlYC5UGHKeFIxsug0O4C2uZNQslz7sPI/dx/noXi
	 Zn0uBkkmWfnRmrhrEhyPDlqDH/7l2tCg7tZgGMKEupHMzjAJiWsTTWPLaot/gEdFky
	 WvvfQwFYTxU9rvg89pCvrUY7Zl14FItOlwprTBgC8+Og0mI93G785V/CFkPiTCM20A
	 F4wyOmY3d11WtTTDjzyo+urwIPpSO9cgY66xQjaJXLsMLz2Ah97+ldpqYp08C8riGF
	 0Vchk7fAZhIag==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 09 Apr 2025 16:47:31 +0200
Subject: [PATCH 3/4] drm/msm/a6xx: Get HBB dynamically, if available
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-topic-smem_dramc-v1-3-94d505cd5593@oss.qualcomm.com>
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
In-Reply-To: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744210063; l=2386;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=OYohf13YmiKhzjC5R6w/3DMzEahK0lGhnx+WyDhcm6w=;
 b=fNEsSSQ6jli6oC71liry1Endi/Jxui35CzCj32bAjUMJOBu1cSMwi/etDA3bbnM/J9Pe5s27u
 8HYTGcOuc99AfzlrXTJlbqdx59TCcInKGKt09TRED9IfQszMgv2wjIf
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Highest Bank address Bit value can change based on memory type used.

Attempt to retrieve it dynamically, and fall back to a reasonable
default (the one used prior to this change) on error.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..0cc397378c99db35315209d0265ad9223e8b55c7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -13,6 +13,7 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/pm_domain.h>
 #include <linux/soc/qcom/llcc-qcom.h>
+#include <linux/soc/qcom/smem.h>
 
 #define GPU_PAS_ID 13
 
@@ -669,17 +670,22 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	u32 hbb = qcom_smem_dram_get_hbb();
+	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
+	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
+	u32 hbb_hi, hbb_lo;
+
 	/*
 	 * We subtract 13 from the highest bank bit (13 is the minimum value
 	 * allowed by hw) and write the lowest two bits of the remaining value
 	 * as hbb_lo and the one above it as hbb_hi to the hardware.
 	 */
-	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
-	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
-	u32 hbb_hi = hbb >> 2;
-	u32 hbb_lo = hbb & 3;
-	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
-	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
+	if (hbb < 0)
+		hbb = adreno_gpu->ubwc_config.highest_bank_bit;
+	hbb -= 13;
+	BUG_ON(hbb < 0);
+	hbb_hi = hbb >> 2;
+	hbb_lo = hbb & 3;
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |
@@ -2467,6 +2473,10 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	bool is_a7xx;
 	int ret;
 
+	/* We need data from SMEM to retrieve HBB in set_ubwc_config() */
+	if (!qcom_smem_is_available())
+		return ERR_PTR(-EPROBE_DEFER);
+
 	a6xx_gpu = kzalloc(sizeof(*a6xx_gpu), GFP_KERNEL);
 	if (!a6xx_gpu)
 		return ERR_PTR(-ENOMEM);

-- 
2.49.0


