Return-Path: <linux-arm-msm+bounces-53899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 026B0A84B8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 19:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B4747B7D88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 17:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5167828EA63;
	Thu, 10 Apr 2025 17:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qmRzQV63"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2467C28EA61;
	Thu, 10 Apr 2025 17:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744307059; cv=none; b=HzCeFsML3p0Ght8E/NgtZJ8EPTrwuaUmculYJAc+CWlRNoZOV7TRRBgmVsdmdHTdxZnuERZiPlGd+yFbsCUEZpU7iejZL5E8cpYKwvCukrsi00HvicHq+T07PW2BgwILrRhdBsrJTNbP+eXcGil4MVU4Ja4WzuFZVuLogdPqo8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744307059; c=relaxed/simple;
	bh=+TXOFnKqLNVBQVmqkqgvY5ByLqr5f+PoTrMrJaHt+f0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mUagLiGFyfkf1GM4CnbCq2p7nV3mL0ai5N6RE1HX8jXmjb6d89yz7O4XCUWmH3kN6/OyAVMjBvtkl56foS1zaJXdx+nOf51NLuNVJ8HO4Lmk9hiFEmblaVmbJH0qMMX6IaomhMwAnvLIpNGEkkqKfbMeLJG4iFPyHKl+IB+npsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qmRzQV63; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D5AC4CEDD;
	Thu, 10 Apr 2025 17:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744307059;
	bh=+TXOFnKqLNVBQVmqkqgvY5ByLqr5f+PoTrMrJaHt+f0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qmRzQV63x24BdHYuCbf0feqPnRhvkGp7ijara0BP5bRFYo4YOPkyAna0d/zTm62u8
	 QARlOg16vIeTi0OKaw7csqVnky4zmAw49LQlhaT7QNANIV17AsxA77lS2lbrzrI75P
	 mUgea4RNJcqDyJTsDvmpyY1njeUrSb9mNAgNiCd6m8Uv5jAeOd7iYYbXm/lIYFQYhD
	 CIDW+qJO07KessQEbatwVKncMIRzl13EjPoOvD3mtgk4W1z4nZYIaNR1sqS+EHRYfQ
	 RBnbhgK0m3swrdUkOzd7rR05XoBaIZc8yRvkWmmKWie/zdIqD25U889Q9doLy0SjaJ
	 L7LI1Df7sZNdA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 10 Apr 2025 19:43:47 +0200
Subject: [PATCH v2 4/4] drm/msm/mdss: Get HBB dynamically, if available
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-topic-smem_dramc-v2-4-dead15264714@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744307035; l=4364;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=u4DLQLo3tH5nr+Zi9TgIpdAPYpDHteGYc0a2ROXvGKs=;
 b=qS0K/ADcOWTRbVEPdzhzxqnyG+jDeryAle3FlGQNCiV5CAPeE2m8FrGGKr+AWeGLhnIyH8jGK
 5UVo9E9N7HTB9iTPKVj7QOtQbnYkwxXHHLkyAVIt5JPF+B3MWCki/YP
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Highest Bank address Bit value can change based on memory type used.

Attempt to retrieve it dynamically, and fall back to a reasonable
default (the one used prior to this change) on error.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..3f5c60ce20c0b66160bcc9bf74bf8f86ab57e9a4 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <linux/soc/qcom/smem.h>
 
 #include "msm_mdss.h"
 #include "msm_kms.h"
@@ -163,11 +164,11 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 	return 0;
 }
 
-static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
+static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss, int hbb)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(hbb);
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -178,11 +179,11 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
-static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
+static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss, int hbb)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(hbb);
 
 	if (data->macrotile_mode)
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
@@ -196,11 +197,11 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
-static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
+static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss, int hbb)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(hbb);
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -287,7 +288,7 @@ const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
-	int ret, i;
+	int hbb, ret, i;
 
 	/*
 	 * Several components have AXI clocks that can only be turned on if
@@ -317,6 +318,11 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	if (msm_mdss->is_mdp5 || !msm_mdss->mdss_data)
 		return 0;
 
+	/* Attempt to retrieve HBB data from SMEM, keep reasonable defaults in case of error */
+	hbb = qcom_smem_dram_get_hbb() - 13;
+	if (hbb < 0)
+		hbb = msm_mdss->mdss_data->highest_bank_bit;
+
 	/*
 	 * ubwc config is part of the "mdss" region which is not accessible
 	 * from the rest of the driver. hardcode known configurations here
@@ -330,14 +336,14 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 		/* do nothing */
 		break;
 	case UBWC_2_0:
-		msm_mdss_setup_ubwc_dec_20(msm_mdss);
+		msm_mdss_setup_ubwc_dec_20(msm_mdss, hbb);
 		break;
 	case UBWC_3_0:
-		msm_mdss_setup_ubwc_dec_30(msm_mdss);
+		msm_mdss_setup_ubwc_dec_30(msm_mdss, hbb);
 		break;
 	case UBWC_4_0:
 	case UBWC_4_3:
-		msm_mdss_setup_ubwc_dec_40(msm_mdss);
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, hbb);
 		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
@@ -538,6 +544,10 @@ static int mdss_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int ret;
 
+	/* We need data from SMEM to retrieve HBB msm_mdss_enable() */
+	if (!qcom_smem_is_available())
+		return -EPROBE_DEFER;
+
 	mdss = msm_mdss_init(pdev, is_mdp5);
 	if (IS_ERR(mdss))
 		return PTR_ERR(mdss);

-- 
2.49.0


