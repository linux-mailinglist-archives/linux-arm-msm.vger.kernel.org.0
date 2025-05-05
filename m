Return-Path: <linux-arm-msm+bounces-56862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1510AAB21E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 06:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3FD43ABF61
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 04:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F17641DA17;
	Tue,  6 May 2025 00:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="askWdw91"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F20C2D4B47;
	Mon,  5 May 2025 22:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485656; cv=none; b=DrGsnspl6ce9/86Ma5RYP1cRnBRhBdiKOeg6hHskFtUI1m5PC2Ras7XH2qBUp0888raqHCBTP3cRMXokuSPqwmVFZ4e+BrKbaFiWun1wrHfDal0kandJ61rdRhq9/vY+xZxO5o8IJz7JpaU9mkpvjCrSOwP0BeIEZYuYiTBpKAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485656; c=relaxed/simple;
	bh=r4bPjLhG9mo/teWcD6gGtcIeJW3C/ykeywdfhWCI4QU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YRcaCwGMeYTP1U2ytITBvGsFUNxdeo7i7rv7pXaeV5uYQw4RwVddfL1mE/Ou04SpfTPUI+4tcesAUy+fgDfxOUE4jJT4wVjxKSI0VAtB8eMmnscfp7U+K/W9kvQJ4PQll2OYe+Qu3LNFSwy5YMWs8d0Zsod4An2HLBjHDG3iJo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=askWdw91; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040BAC4CEEE;
	Mon,  5 May 2025 22:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485656;
	bh=r4bPjLhG9mo/teWcD6gGtcIeJW3C/ykeywdfhWCI4QU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=askWdw91kd1cP6AnVmnuGeTk3zDxLn+c3/CWDwq/iac56KTL6K3ide3Ff+gMfFUAD
	 aVwFAWiTRfuDQfCwu4PZ6sw6lYGwD3vyWFhXUqayvs3QXXD8hUWz76hVR6izDE2K/n
	 zTg2bhzJhgEBG8dDJvq0/RLxOubKM4U/726MEZFVQHAb1seD/zzl+AxWcA4FyXZRY8
	 RF9dWPsIn7fKSRk+brQRTBiaGH9bfbNl823SKGN3VV74YVIrWqF5djM+0aL5vGM3Gr
	 Wq7qbCPl4C2IBkyI9HcZ84pEZsuCJ/k5+776wBVLoP/pMh0/w2dQDbGXgVOhy2gBEE
	 vmkgjQcQZAw1w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jordan Crouse <jorcrous@amazon.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 411/486] clk: qcom: camcc-sm8250: Use clk_rcg2_shared_ops for some RCGs
Date: Mon,  5 May 2025 18:38:07 -0400
Message-Id: <20250505223922.2682012-411-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit

From: Jordan Crouse <jorcrous@amazon.com>

[ Upstream commit 52b10b591f83dc6d9a1d6c2dc89433470a787ecd ]

Update some RCGs on the sm8250 camera clock controller to use
clk_rcg2_shared_ops. The shared_ops ensure the RCGs get parked
to the XO during clock disable to prevent the clocks from locking up
when the GDSC is enabled. These mirror similar fixes for other controllers
such as commit e5c359f70e4b ("clk: qcom: camcc: Update the clock ops for
the SC7180").

Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Link: https://lore.kernel.org/r/20250122222612.32351-1-jorcrous@amazon.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/qcom/camcc-sm8250.c | 56 ++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
index 34d2f17520dcc..450ddbebd35f2 100644
--- a/drivers/clk/qcom/camcc-sm8250.c
+++ b/drivers/clk/qcom/camcc-sm8250.c
@@ -411,7 +411,7 @@ static struct clk_rcg2 cam_cc_bps_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -433,7 +433,7 @@ static struct clk_rcg2 cam_cc_camnoc_axi_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -454,7 +454,7 @@ static struct clk_rcg2 cam_cc_cci_0_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -469,7 +469,7 @@ static struct clk_rcg2 cam_cc_cci_1_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -490,7 +490,7 @@ static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -511,7 +511,7 @@ static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -526,7 +526,7 @@ static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -556,7 +556,7 @@ static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -571,7 +571,7 @@ static struct clk_rcg2 cam_cc_csi4phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -586,7 +586,7 @@ static struct clk_rcg2 cam_cc_csi5phytimer_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -611,7 +611,7 @@ static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -634,7 +634,7 @@ static struct clk_rcg2 cam_cc_fd_core_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -649,7 +649,7 @@ static struct clk_rcg2 cam_cc_icp_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -673,7 +673,7 @@ static struct clk_rcg2 cam_cc_ife_0_clk_src = {
 		.parent_data = cam_cc_parent_data_2,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -710,7 +710,7 @@ static struct clk_rcg2 cam_cc_ife_0_csid_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -734,7 +734,7 @@ static struct clk_rcg2 cam_cc_ife_1_clk_src = {
 		.parent_data = cam_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -749,7 +749,7 @@ static struct clk_rcg2 cam_cc_ife_1_csid_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -771,7 +771,7 @@ static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -786,7 +786,7 @@ static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -810,7 +810,7 @@ static struct clk_rcg2 cam_cc_ipe_0_clk_src = {
 		.parent_data = cam_cc_parent_data_4,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -825,7 +825,7 @@ static struct clk_rcg2 cam_cc_jpeg_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -847,7 +847,7 @@ static struct clk_rcg2 cam_cc_mclk0_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -862,7 +862,7 @@ static struct clk_rcg2 cam_cc_mclk1_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -877,7 +877,7 @@ static struct clk_rcg2 cam_cc_mclk2_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -892,7 +892,7 @@ static struct clk_rcg2 cam_cc_mclk3_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -907,7 +907,7 @@ static struct clk_rcg2 cam_cc_mclk4_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -922,7 +922,7 @@ static struct clk_rcg2 cam_cc_mclk5_clk_src = {
 		.parent_data = cam_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -993,7 +993,7 @@ static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
 		.parent_data = cam_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
-- 
2.39.5


