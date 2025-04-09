Return-Path: <linux-arm-msm+bounces-53660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 168CEA82937
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 17:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A4B390789F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 14:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1818827603D;
	Wed,  9 Apr 2025 14:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WV0dZW4C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E056C276033;
	Wed,  9 Apr 2025 14:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210088; cv=none; b=hrdV6BzMai8F3cVngkl9zxc0tZNem3ys6Jd/SZ6SnG10v3SVaUCBQyw0D2BR5V4NtFJZTLfcSsZa1eRLKrOAoR5Y4JXjWy712lJCZaLBaL5U4texbqdSPwVrXbWraZh/Py5sSvW+aNQwz1zf04LP/Gu2InccGnMTKBt5iY5tJwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210088; c=relaxed/simple;
	bh=rQBB6jbnrS8Sm508XLIWz1L1qf5uNl92Y7dQesXjv3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zt0Ir9qECjEh0tfYr4HO6MwM4D47oqRLEKrYEpVdZpPzLJeZq1Cwc40zmf5caMb+gz4r3xJ+gcu4roqh7+owPWZXukZJr7JADNEOFac6r5XEcWhz+Km6D6FaCr6dZk2to54S0vs06dozRxsMEqZC+mQzjs4nXdFd+v2wMjFb0wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WV0dZW4C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1408AC4CEE7;
	Wed,  9 Apr 2025 14:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744210087;
	bh=rQBB6jbnrS8Sm508XLIWz1L1qf5uNl92Y7dQesXjv3k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WV0dZW4CSd0AuRUJv0RUpzEH0MXFmfeLxiNdP3cvjgGNBxRndAsyi+4UKAtb3dqnx
	 sKEB4iyR0FicQQGORRInrAsMAUNyleQCu9bPQ3njRkoI8tJWJpnGE+HBMTBfwOHS+b
	 6BRF1cjnqroZ0B7FaWOYyBzds4od2K7NG6ag8RnzK05nVEiX9cHMYv+PNP+FMRMQzt
	 51tvSyJPz0F/npR9jhrjuB3PD4lpsHIoA6mSJt8g6Dkcb20nvA+cJrNpBIlTbLdU5x
	 xj/tCWPxN5PSAIyg8WAdonw4abN6SIS5LuLAn6SKKwzeFgaqLnR1WuBslAekCx6mr8
	 P5uZb8U7MnGrQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 09 Apr 2025 16:47:32 +0200
Subject: [PATCH 4/4] drm/msm/mdss: Get HBB dynamically, if available
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-topic-smem_dramc-v1-4-94d505cd5593@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744210063; l=3179;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=KAQqkKm/ZpU7QkabKJNN+6New53pE5zJNqI4Pg3sAhM=;
 b=5+hWG/GPJdQC6qZafGnzY1Y5DEOaRiytTwCA4reEDXK9gFZgHVE5c+Y1lKnKc7oFT/56MK5em
 ekBsY4I9fiMCQivNW6orLRhBfAHUyQQYjU1IGx/WmWy04i1dKtvC/Pr
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Highest Bank address Bit value can change based on memory type used.

Attempt to retrieve it dynamically, and fall back to a reasonable
default (the one used prior to this change) on error.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..c9b05c7cad9fcf3140ff994c1572c4f4cd508206 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <linux/soc/qcom/smem.h>
 
 #include "msm_mdss.h"
 #include "msm_kms.h"
@@ -166,8 +167,14 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+	u32 hbb = qcom_smem_dram_get_hbb() - 13;
+	u32 value;
+
+	if (hbb < 0)
+		hbb = data->highest_bank_bit;
+
+	value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(hbb);
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -181,8 +188,14 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+	u32 hbb = qcom_smem_dram_get_hbb() - 13;
+	u32 value;
+
+	if (hbb < 0)
+		hbb = data->highest_bank_bit;
+
+	value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
+		MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(hbb);
 
 	if (data->macrotile_mode)
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
@@ -199,8 +212,14 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+	u32 hbb = qcom_smem_dram_get_hbb() - 13;
+	u32 value;
+
+	if (hbb < 0)
+		hbb = data->highest_bank_bit;
+
+	value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(hbb);
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -538,6 +557,10 @@ static int mdss_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int ret;
 
+	/* We need data from SMEM to retrieve HBB in _setup_ubwc_dec_() */
+	if (!qcom_smem_is_available())
+		return -EPROBE_DEFER;
+
 	mdss = msm_mdss_init(pdev, is_mdp5);
 	if (IS_ERR(mdss))
 		return PTR_ERR(mdss);

-- 
2.49.0


