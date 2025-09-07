Return-Path: <linux-arm-msm+bounces-72437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CA8B47BDE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 16:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2F203C2A95
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 14:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFE227FD71;
	Sun,  7 Sep 2025 14:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WQ0JhCdl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C3E27EFFE
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 14:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757256746; cv=none; b=AOFE0sunzJ2BdWMd2Rrfxqvs4e+k8m8iIIsodLmqNOF2jJ2KOuVUF+X8bVnKhcqiXgvo+nxgtoGWzU7Ryd0fCaSO4cyi/YKV6+ltJqfZXOMPp5UVXEh1uphj641uTQlJ2iQ7aGVZE3xuC7musUzVVOgghs1/XtB7Riz1rk9kj5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757256746; c=relaxed/simple;
	bh=Nf1s/PhEXHXo8aFyYDttuLdpXnvksenJa+qmRK/vJes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ca2tDM6ul9NQOX5o++lZoEknEIABeUykSTrRQ2x83IN2moWyDYcRo5eP/yyPT5+4n9EIZswJnd+wRyFTSB+MwxPwHg10ytgp5wfOvpN8JLj8HK8ICA1BrJHpKKMmLr05gQKvpyBLXGvCvJCXUpN+aJNk6SRD9NtAZEGIqXLMMq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQ0JhCdl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587DI4or019458
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 14:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/XIqAkAydaF2HysR2i0jalHW8uI70wZ4L0rHiq97FcI=; b=WQ0JhCdl+4P26S18
	FL2Q3orsNqAvmDMv4MtfZYaeosQ+UqdW4pYqzlSLU25kqM1PNKUfaRWwx72VLMAg
	xWQruyu+dHb4vyRuNcvxDMO1L6vn/poo7IrZT6FR7Y77RgyzKjj0tZP7w/Rvo3rt
	Dp7NKsmarixj55fVIP9/PybRU4j7DUh83zxs1XngHT2Hp3qzGAPya45hyWYL+8St
	3pvOktQ1hIKoSq2zH4lCRblivAoti5+Dp/qzuWOd4edx7gvKncVG+ilCiP1QwIaD
	sV+aAuDRJSGqx9pDTtJpYf7lFN9zJAVefV8LldnAWCvRABtY/xVoa1AYOZeKMe64
	wYHCRg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws29wc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 14:52:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b3aac677e1so33402511cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 07:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757256741; x=1757861541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XIqAkAydaF2HysR2i0jalHW8uI70wZ4L0rHiq97FcI=;
        b=hK1FXj+YFoCMF+eKnQHHkl4wZLcgaMwaVrgDTTp+AT5BeOpgMERciRgu5ecg+Muz5n
         chtkryYQB+TQ+SD3KIqjundZF04kElFteqEOBCwuE4b6TzIqS7XKDoQ8O4E2UjxPKYB7
         qrVadg7aQslhtpvlxgu60OOcA4JERMpY/KDKn4NgCPA6vUu7nouGNNNmNOL7olF6Hpe0
         lAIx5xZjIjmWfVrWENaSUZUqoqQt/NJffy4gbZ2mpCDHjkDpjFDiKP29BdYwN7oglDAp
         K1j+fTi8qrkkq0H9kqeDqO3Hi8996S2ig3mOynNXVLaBc8ht3joMKXznf/1h+D8UgqNb
         fCDg==
X-Gm-Message-State: AOJu0YxKoV5R3WrUQd7oACWHWEm41/j2RUPG3u+ZFUN5b9EkltagOrX2
	TRz2LkhFlcLsAZWEkPtYNFxjl33x7b23i2WDVtJx1fjfkc3hj77Bg+P7UUdKke0hfaCJd9+ajm4
	iJGGgMntwy7FejerpZUzqIJhMM8to6+5wqvOMeabPijNasYXIdQ60StWh7nDgso3u1o/cqMeopa
	Vg
X-Gm-Gg: ASbGncvJeQXobWBMEdSWeml60dkFuh3tW7UFjN97i+Eq7qGLEH1Az0HulpSiX+wJ1T6
	qRAPhVl0JRFd+YcviWQBQ4pRfYyNO/TOOU50ENV4tNt3CtkbgXzi12Za2HtudFULhPxU1GNOgrz
	y3s6dWuBDpOTIVCFlZtnKkOlLNnzARK+drSWAPR3Im1VGySyBNfbRa2oXEkZOq8XNwGGNhowN/G
	c31pGrMG/AQ0H1pKcDqn4JgbjXGDJ1TBskxXVpRNm+li3l4UC9lM+51Md8t57DYAdL3uGcLCpdf
	vZlMxY6A7TfEMJ3p81APZyYT1nASsEZvd/WGlw6Hj+z7Jcp6RV2wbeIl56vu2WDrS3Inr83PZyk
	tOdyhGQdYJQ4v/vUS6A49M5aMR+J1372OdrIhdtZOv4a94NZJXcnd
X-Received: by 2002:a05:6214:acf:b0:720:b2a:adf0 with SMTP id 6a1803df08f44-739336399cfmr57253616d6.30.1757256741131;
        Sun, 07 Sep 2025 07:52:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ7BpzdmfRxSJ4iPWNPxFzR24KLl0eNrbDfQ7kNZIkt44v3QFEXN+68rqb20Oo4OxU0W8Rgw==
X-Received: by 2002:a05:6214:acf:b0:720:b2a:adf0 with SMTP id 6a1803df08f44-739336399cfmr57253366d6.30.1757256740346;
        Sun, 07 Sep 2025 07:52:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab939d5sm2936738e87.46.2025.09.07.07.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 07:52:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 07 Sep 2025 17:52:11 +0300
Subject: [PATCH 2/4] phy: qcom: qmp: extract common PIPE clock helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250907-qcom-dp-phy-v1-2-46634a6a980b@oss.qualcomm.com>
References: <20250907-qcom-dp-phy-v1-0-46634a6a980b@oss.qualcomm.com>
In-Reply-To: <20250907-qcom-dp-phy-v1-0-46634a6a980b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=23326;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Nf1s/PhEXHXo8aFyYDttuLdpXnvksenJa+qmRK/vJes=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBovZwfCkHF28rSlsLQ9CGbnty7aFu3iBXCT7agh
 5GE3rqn3y2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaL2cHwAKCRCLPIo+Aiko
 1S2YCACsds6BQnyNj7TiVUIHaLJTe9q9ddmYeb++/PKSAKx23+PgtgXweKl8wAmQFB4OO3GnWvq
 CTu/RTyKQ/+cc592NWgEGDff7a8GJItTr7XEwcRcT+0zFlT3R4pIB6ZRkQcb/ukqo0X3Rz++aOi
 Mo5R8h/OIJFD1j6k6lunEFmId5M9MUcXc8AKy9FktOHh+fUZYRTtA7awDcLG5M2ptqLfTMzD3+X
 08YoUfYyoEGAE4U12Pwf3ehyomoIN1BCxA27hYUXmC6amd/bOnca+VLceqk4rG4xN7+EweAxInl
 QRTrsV6piFqWn2H80jWxszrjVvNYtWilYRRCanOU/39KYkeZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Giv435sEPrPYUvyBBiNq7-TWG5cD3lbl
X-Proofpoint-GUID: Giv435sEPrPYUvyBBiNq7-TWG5cD3lbl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX9AUtqv7gHhxj
 hCPRXnKqoGDeGksXaJkeZ+uOusnPJoUfgKr+yJ1sR7Q/sCrndYV8WaflEdu31iUWcRRP5gxZrDN
 1mBcacArhY0VxmJ8bx7zGf7Xr5+n3j+ruEoe0/vgyzVHUTmr3zD9QfLHxDVXjrsI9/sErmmpMLV
 lIyU7o54RsL10ffIt2R1b6kPohendirwY9B7nQgNDBsD4dU98ULYuhlVyioRGPDDGVASMCCIyo9
 AmC5DUk1KjNuxKJbGcrQEwYkqwvH7plYufbQnTWMEuKlRJGX9FoTosOjJabODlrixGJ6ES8NhNF
 tasuG3p3cUatiRZVw+XT7C7r1gBQdISEL41XK6eECIRDrVD2tAlRJsgbR50KY4BdFyl9xqyTB+U
 2y99LrVu
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68bd9c27 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=o8b8T06iM2j7pLjo7BIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Extract the code common to (almost) all QMP PHY drivers, which handles
the 125 MHz PIPE clock. Drop unused pipe_clk_fixed fields from the QMP
PHY structures, using pipe_clk_hw instead (where required).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c        | 56 +++-----------------
 drivers/phy/qualcomm/phy-qcom-qmp-common.h       | 67 ++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 62 +---------------------
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c         | 67 +++---------------------
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c   | 60 +--------------------
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c          | 60 +--------------------
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c         | 60 +--------------------
 7 files changed, 87 insertions(+), 345 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 7b5af30f1d028c592500e723ecd27b54ed554709..baf25ae442478ac01a5428fa4268470e6b5211e3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1863,7 +1863,7 @@ struct qmp_combo {
 	unsigned int dp_init_count;
 	bool dp_powered_on;
 
-	struct clk_fixed_rate pipe_clk_fixed;
+	struct clk_hw *pipe_clk_hw;
 	struct clk_hw dp_link_hw;
 	struct clk_hw dp_pixel_hw;
 
@@ -3512,46 +3512,6 @@ static int qmp_combo_clk_init(struct qmp_combo *qmp)
 	return devm_clk_bulk_get_optional(dev, num, qmp->clks);
 }
 
-static void phy_clk_release_provider(void *res)
-{
-	of_clk_del_provider(res);
-}
-
-/*
- * Register a fixed rate pipe clock.
- *
- * The <s>_pipe_clksrc generated by PHY goes to the GCC that gate
- * controls it. The <s>_pipe_clk coming out of the GCC is requested
- * by the PHY driver for its operations.
- * We register the <s>_pipe_clksrc here. The gcc driver takes care
- * of assigning this <s>_pipe_clksrc as parent to <s>_pipe_clk.
- * Below picture shows this relationship.
- *
- *         +---------------+
- *         |   PHY block   |<<---------------------------------------+
- *         |               |                                         |
- *         |   +-------+   |                   +-----+               |
- *   I/P---^-->|  PLL  |---^--->pipe_clksrc--->| GCC |--->pipe_clk---+
- *    clk  |   +-------+   |                   +-----+
- *         +---------------+
- */
-static int phy_pipe_clk_register(struct qmp_combo *qmp, struct device_node *np)
-{
-	struct clk_fixed_rate *fixed = &qmp->pipe_clk_fixed;
-	struct clk_init_data init = { };
-	char name[64];
-
-	snprintf(name, sizeof(name), "%s::pipe_clk", dev_name(qmp->dev));
-	init.name = name;
-	init.ops = &clk_fixed_rate_ops;
-
-	/* controllers using QMP phys use 125MHz pipe clock interface */
-	fixed->fixed_rate = 125000000;
-	fixed->hw.init = &init;
-
-	return devm_clk_hw_register(qmp->dev, &fixed->hw);
-}
-
 /*
  * Display Port PLL driver block diagram for branch clocks
  *
@@ -3724,7 +3684,7 @@ static struct clk_hw *qmp_combo_clk_hw_get(struct of_phandle_args *clkspec, void
 
 	switch (clkspec->args[0]) {
 	case QMP_USB43DP_USB3_PIPE_CLK:
-		return &qmp->pipe_clk_fixed.hw;
+		return qmp->pipe_clk_hw;
 	case QMP_USB43DP_DP_LINK_CLK:
 		return &qmp->dp_link_hw;
 	case QMP_USB43DP_DP_VCO_DIV_CLK:
@@ -3739,9 +3699,9 @@ static int qmp_combo_register_clocks(struct qmp_combo *qmp, struct device_node *
 {
 	int ret;
 
-	ret = phy_pipe_clk_register(qmp, usb_np);
-	if (ret)
-		return ret;
+	qmp->pipe_clk_hw = devm_qmp_register_pipe_clock(qmp->dev, usb_np);
+	if (IS_ERR(qmp->pipe_clk_hw))
+		return PTR_ERR(qmp->pipe_clk_hw);
 
 	ret = phy_dp_clks_register(qmp, dp_np);
 	if (ret)
@@ -3757,7 +3717,7 @@ static int qmp_combo_register_clocks(struct qmp_combo *qmp, struct device_node *
 	 * Register multiple providers for legacy bindings with child nodes.
 	 */
 	ret = of_clk_add_hw_provider(usb_np, of_clk_hw_simple_get,
-					&qmp->pipe_clk_fixed.hw);
+				     qmp->pipe_clk_hw);
 	if (ret)
 		return ret;
 
@@ -3765,7 +3725,7 @@ static int qmp_combo_register_clocks(struct qmp_combo *qmp, struct device_node *
 	 * Roll a devm action because the clock provider is the child node, but
 	 * the child node is not actually a device.
 	 */
-	ret = devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, usb_np);
+	ret = devm_add_action_or_reset(qmp->dev, qmp_clk_release_provider, usb_np);
 	if (ret)
 		return ret;
 
@@ -3773,7 +3733,7 @@ static int qmp_combo_register_clocks(struct qmp_combo *qmp, struct device_node *
 	if (ret)
 		return ret;
 
-	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, dp_np);
+	return devm_add_action_or_reset(qmp->dev, qmp_clk_release_provider, dp_np);
 }
 
 #if IS_ENABLED(CONFIG_TYPEC)
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-common.h b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
index b945fc14cecec4ef00143e144cea4e10225d5947..00041892d9ec7a45e21b0b15301ab65ed996bd45 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-common.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-common.h
@@ -6,6 +6,10 @@
 #ifndef QCOM_PHY_QMP_COMMON_H_
 #define QCOM_PHY_QMP_COMMON_H_
 
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/of.h>
+
 struct qmp_phy_init_tbl {
 	unsigned int offset;
 	unsigned int val;
@@ -59,4 +63,67 @@ static inline void qmp_configure(struct device *dev, void __iomem *base,
 	qmp_configure_lane(dev, base, tbl, num, 0xff);
 }
 
+/*
+ * Register a fixed rate pipe clock.
+ *
+ * The <s>_pipe_clksrc generated by PHY goes to the GCC that gate
+ * controls it. The <s>_pipe_clk coming out of the GCC is requested
+ * by the PHY driver for its operations.
+ * We register the <s>_pipe_clksrc here. The gcc driver takes care
+ * of assigning this <s>_pipe_clksrc as parent to <s>_pipe_clk.
+ * Below picture shows this relationship.
+ *
+ *         +---------------+
+ *         |   PHY block   |<<---------------------------------------+
+ *         |               |                                         |
+ *         |   +-------+   |                   +-----+               |
+ *   I/P---^-->|  PLL  |---^--->pipe_clksrc--->| GCC |--->pipe_clk---+
+ *    clk  |   +-------+   |                   +-----+
+ *         +---------------+
+ */
+static inline struct clk_hw *devm_qmp_register_pipe_clock(struct device *dev,
+							  struct device_node *np)
+{
+	const char *pname = NULL;
+	char name[64];
+
+	/* ignore if the property is not present */
+	if (np)
+		of_property_read_string(np, "clock-output-names", &pname);
+
+	if (!pname) {
+		snprintf(name, sizeof(name), "%s::pipe_clk", dev_name(dev));
+		pname = name;
+	}
+
+	/* controllers using QMP phys use 125MHz pipe clock interface */
+	return devm_clk_hw_register_fixed_rate(dev, pname, NULL, 0, 125000000);
+}
+
+static inline void qmp_clk_release_provider(void *res)
+{
+	of_clk_del_provider(res);
+}
+
+static inline int devm_qmp_register_pipe_clock_provider(struct device *dev,
+							struct device_node *np)
+{
+	struct clk_hw *fixed;
+	int ret;
+
+	fixed = devm_qmp_register_pipe_clock(dev, np);
+	if (IS_ERR(fixed))
+		return PTR_ERR(fixed);
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, fixed);
+	if (ret)
+		return ret;
+
+	/*
+	 * Roll a devm action because the clock provider is the child node, but
+	 * the child node is not actually a device.
+	 */
+	return devm_add_action_or_reset(dev, qmp_clk_release_provider, np);
+}
+
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index a7c65cfe31dfb80d8b1058d3c519a324a309d1c2..226d893c198bdce0ecd3d7d31ed65199fc360ecf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -579,66 +579,6 @@ static int qmp_pcie_msm8996_clk_init(struct device *dev, const struct qmp_phy_cf
 	return devm_clk_bulk_get(dev, num, qmp->clks);
 }
 
-static void phy_clk_release_provider(void *res)
-{
-	of_clk_del_provider(res);
-}
-
-/*
- * Register a fixed rate pipe clock.
- *
- * The <s>_pipe_clksrc generated by PHY goes to the GCC that gate
- * controls it. The <s>_pipe_clk coming out of the GCC is requested
- * by the PHY driver for its operations.
- * We register the <s>_pipe_clksrc here. The gcc driver takes care
- * of assigning this <s>_pipe_clksrc as parent to <s>_pipe_clk.
- * Below picture shows this relationship.
- *
- *         +---------------+
- *         |   PHY block   |<<---------------------------------------+
- *         |               |                                         |
- *         |   +-------+   |                   +-----+               |
- *   I/P---^-->|  PLL  |---^--->pipe_clksrc--->| GCC |--->pipe_clk---+
- *    clk  |   +-------+   |                   +-----+
- *         +---------------+
- */
-static int phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
-{
-	struct clk_fixed_rate *fixed;
-	struct clk_init_data init = { };
-	int ret;
-
-	ret = of_property_read_string(np, "clock-output-names", &init.name);
-	if (ret) {
-		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
-		return ret;
-	}
-
-	fixed = devm_kzalloc(qmp->dev, sizeof(*fixed), GFP_KERNEL);
-	if (!fixed)
-		return -ENOMEM;
-
-	init.ops = &clk_fixed_rate_ops;
-
-	/* controllers using QMP phys use 125MHz pipe clock interface */
-	fixed->fixed_rate = 125000000;
-	fixed->hw.init = &init;
-
-	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
-	if (ret)
-		return ret;
-
-	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
-	if (ret)
-		return ret;
-
-	/*
-	 * Roll a devm action because the clock provider is the child node, but
-	 * the child node is not actually a device.
-	 */
-	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
-}
-
 static const struct phy_ops qmp_pcie_msm8996_ops = {
 	.power_on	= qmp_pcie_msm8996_enable,
 	.power_off	= qmp_pcie_msm8996_disable,
@@ -785,7 +725,7 @@ static int qmp_pcie_msm8996_probe(struct platform_device *pdev)
 		 * Register the pipe clock provided by phy.
 		 * See function description to see details of this pipe clock.
 		 */
-		ret = phy_pipe_clk_register(qmp, child);
+		ret = devm_qmp_register_pipe_clock_provider(dev, child);
 		if (ret) {
 			dev_err(qmp->dev,
 				"failed to register pipe clock source\n");
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 62b1c845b6275d924fa501ac64e69db5f58844aa..dad44cc0648355fc1533c9afd176b7d37cfa9018 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3172,7 +3172,7 @@ struct qmp_pcie {
 	struct phy *phy;
 	int mode;
 
-	struct clk_fixed_rate pipe_clk_fixed;
+	struct clk_hw *pipe_clk_hw;
 	struct clk_fixed_rate aux_clk_fixed;
 };
 
@@ -4789,57 +4789,6 @@ static int qmp_pcie_clk_init(struct qmp_pcie *qmp)
 	return devm_clk_bulk_get_optional(dev, num, qmp->clks);
 }
 
-static void phy_clk_release_provider(void *res)
-{
-	of_clk_del_provider(res);
-}
-
-/*
- * Register a fixed rate pipe clock.
- *
- * The <s>_pipe_clksrc generated by PHY goes to the GCC that gate
- * controls it. The <s>_pipe_clk coming out of the GCC is requested
- * by the PHY driver for its operations.
- * We register the <s>_pipe_clksrc here. The gcc driver takes care
- * of assigning this <s>_pipe_clksrc as parent to <s>_pipe_clk.
- * Below picture shows this relationship.
- *
- *         +---------------+
- *         |   PHY block   |<<---------------------------------------+
- *         |               |                                         |
- *         |   +-------+   |                   +-----+               |
- *   I/P---^-->|  PLL  |---^--->pipe_clksrc--->| GCC |--->pipe_clk---+
- *    clk  |   +-------+   |                   +-----+
- *         +---------------+
- */
-static int phy_pipe_clk_register(struct qmp_pcie *qmp, struct device_node *np)
-{
-	struct clk_fixed_rate *fixed = &qmp->pipe_clk_fixed;
-	struct clk_init_data init = { };
-	int ret;
-
-	ret = of_property_read_string_index(np, "clock-output-names", 0, &init.name);
-	if (ret) {
-		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
-		return ret;
-	}
-
-	init.ops = &clk_fixed_rate_ops;
-
-	/*
-	 * Controllers using QMP PHY-s use 125MHz pipe clock interface
-	 * unless other frequency is specified in the PHY config.
-	 */
-	if (qmp->cfg->pipe_clock_rate)
-		fixed->fixed_rate = qmp->cfg->pipe_clock_rate;
-	else
-		fixed->fixed_rate = 125000000;
-
-	fixed->hw.init = &init;
-
-	return devm_clk_hw_register(qmp->dev, &fixed->hw);
-}
-
 /*
  * Register a fixed rate PHY aux clock.
  *
@@ -4881,11 +4830,11 @@ static struct clk_hw *qmp_pcie_clk_hw_get(struct of_phandle_args *clkspec, void
 
 	/* Support legacy bindings */
 	if (!clkspec->args_count)
-		return &qmp->pipe_clk_fixed.hw;
+		return qmp->pipe_clk_hw;
 
 	switch (clkspec->args[0]) {
 	case QMP_PCIE_PIPE_CLK:
-		return &qmp->pipe_clk_fixed.hw;
+		return qmp->pipe_clk_hw;
 	case QMP_PCIE_PHY_AUX_CLK:
 		return &qmp->aux_clk_fixed.hw;
 	}
@@ -4897,9 +4846,9 @@ static int qmp_pcie_register_clocks(struct qmp_pcie *qmp, struct device_node *np
 {
 	int ret;
 
-	ret = phy_pipe_clk_register(qmp, np);
-	if (ret)
-		return ret;
+	qmp->pipe_clk_hw = devm_qmp_register_pipe_clock(qmp->dev, np);
+	if (IS_ERR(qmp->pipe_clk_hw))
+		return PTR_ERR(qmp->pipe_clk_hw);
 
 	if (qmp->cfg->aux_clock_rate) {
 		ret = phy_aux_clk_register(qmp, np);
@@ -4910,7 +4859,7 @@ static int qmp_pcie_register_clocks(struct qmp_pcie *qmp, struct device_node *np
 		if (ret)
 			return ret;
 	} else {
-		ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &qmp->pipe_clk_fixed.hw);
+		ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, qmp->pipe_clk_hw);
 		if (ret)
 			return ret;
 	}
@@ -4919,7 +4868,7 @@ static int qmp_pcie_register_clocks(struct qmp_pcie *qmp, struct device_node *np
 	 * Roll a devm action because the clock provider is the child node, but
 	 * the child node is not actually a device.
 	 */
-	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
+	return devm_add_action_or_reset(qmp->dev, qmp_clk_release_provider, np);
 }
 
 static int qmp_pcie_parse_dt_legacy(struct qmp_pcie *qmp, struct device_node *np)
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
index ddb52c1812dd02e15a840deee934c849405c2a98..0e775671054ed02024d01e3a11c6d3e2f973a097 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -521,8 +521,6 @@ struct qmp_usb {
 	enum phy_mode mode;
 
 	struct phy *phy;
-
-	struct clk_fixed_rate pipe_clk_fixed;
 };
 
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
@@ -1043,62 +1041,6 @@ static int qmp_usb_legacy_clk_init(struct qmp_usb *qmp)
 	return devm_clk_bulk_get(dev, num, qmp->clks);
 }
 
-static void phy_clk_release_provider(void *res)
-{
-	of_clk_del_provider(res);
-}
-
-/*
- * Register a fixed rate pipe clock.
- *
- * The <s>_pipe_clksrc generated by PHY goes to the GCC that gate
- * controls it. The <s>_pipe_clk coming out of the GCC is requested
- * by the PHY driver for its operations.
- * We register the <s>_pipe_clksrc here. The gcc driver takes care
- * of assigning this <s>_pipe_clksrc as parent to <s>_pipe_clk.
- * Below picture shows this relationship.
- *
- *         +---------------+
- *         |   PHY block   |<<---------------------------------------+
- *         |               |                                         |
- *         |   +-------+   |                   +-----+               |
- *   I/P---^-->|  PLL  |---^--->pipe_clksrc--->| GCC |--->pipe_clk---+
- *    clk  |   +-------+   |                   +-----+
- *         +---------------+
- */
-static int phy_pipe_clk_register(struct qmp_usb *qmp, struct device_node *np)
-{
-	struct clk_fixed_rate *fixed = &qmp->pipe_clk_fixed;
-	struct clk_init_data init = { };
-	int ret;
-
-	ret = of_property_read_string(np, "clock-output-names", &init.name);
-	if (ret) {
-		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
-		return ret;
-	}
-
-	init.ops = &clk_fixed_rate_ops;
-
-	/* controllers using QMP phys use 125MHz pipe clock interface */
-	fixed->fixed_rate = 125000000;
-	fixed->hw.init = &init;
-
-	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
-	if (ret)
-		return ret;
-
-	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
-	if (ret)
-		return ret;
-
-	/*
-	 * Roll a devm action because the clock provider is the child node, but
-	 * the child node is not actually a device.
-	 */
-	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
-}
-
 static int qmp_usb_legacy_parse_dt_legacy(struct qmp_usb *qmp, struct device_node *np)
 {
 	struct platform_device *pdev = to_platform_device(qmp->dev);
@@ -1239,7 +1181,7 @@ static int qmp_usb_legacy_probe(struct platform_device *pdev)
 	 */
 	pm_runtime_forbid(dev);
 
-	ret = phy_pipe_clk_register(qmp, np);
+	ret = devm_qmp_register_pipe_clock_provider(dev, np);
 	if (ret)
 		goto err_node_put;
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index ed646a7e705ba3259708775ed5fedbbbada13735..7040b53e482d667f90eef09e3c4a93cb6c01f934 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1301,8 +1301,6 @@ struct qmp_usb {
 	enum phy_mode mode;
 
 	struct phy *phy;
-
-	struct clk_fixed_rate pipe_clk_fixed;
 };
 
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
@@ -2046,62 +2044,6 @@ static int qmp_usb_clk_init(struct qmp_usb *qmp)
 	return devm_clk_bulk_get_optional(dev, num, qmp->clks);
 }
 
-static void phy_clk_release_provider(void *res)
-{
-	of_clk_del_provider(res);
-}
-
-/*
- * Register a fixed rate pipe clock.
- *
- * The <s>_pipe_clksrc generated by PHY goes to the GCC that gate
- * controls it. The <s>_pipe_clk coming out of the GCC is requested
- * by the PHY driver for its operations.
- * We register the <s>_pipe_clksrc here. The gcc driver takes care
- * of assigning this <s>_pipe_clksrc as parent to <s>_pipe_clk.
- * Below picture shows this relationship.
- *
- *         +---------------+
- *         |   PHY block   |<<---------------------------------------+
- *         |               |                                         |
- *         |   +-------+   |                   +-----+               |
- *   I/P---^-->|  PLL  |---^--->pipe_clksrc--->| GCC |--->pipe_clk---+
- *    clk  |   +-------+   |                   +-----+
- *         +---------------+
- */
-static int phy_pipe_clk_register(struct qmp_usb *qmp, struct device_node *np)
-{
-	struct clk_fixed_rate *fixed = &qmp->pipe_clk_fixed;
-	struct clk_init_data init = { };
-	int ret;
-
-	ret = of_property_read_string(np, "clock-output-names", &init.name);
-	if (ret) {
-		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
-		return ret;
-	}
-
-	init.ops = &clk_fixed_rate_ops;
-
-	/* controllers using QMP phys use 125MHz pipe clock interface */
-	fixed->fixed_rate = 125000000;
-	fixed->hw.init = &init;
-
-	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
-	if (ret)
-		return ret;
-
-	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
-	if (ret)
-		return ret;
-
-	/*
-	 * Roll a devm action because the clock provider is the child node, but
-	 * the child node is not actually a device.
-	 */
-	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
-}
-
 static void __iomem *qmp_usb_iomap(struct device *dev, struct device_node *np,
 					int index, bool exclusive)
 {
@@ -2276,7 +2218,7 @@ static int qmp_usb_probe(struct platform_device *pdev)
 	 */
 	pm_runtime_forbid(dev);
 
-	ret = phy_pipe_clk_register(qmp, np);
+	ret = devm_qmp_register_pipe_clock_provider(dev, np);
 	if (ret)
 		goto err_node_put;
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 5e7fcb26744a4401c3076960df9c0dcbec7fdef7..83f3011a93c0cd53f59a1a45406bf4d9107e7ea9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -347,8 +347,6 @@ struct qmp_usbc {
 
 	struct phy *phy;
 
-	struct clk_fixed_rate pipe_clk_fixed;
-
 	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
 };
@@ -796,62 +794,6 @@ static int qmp_usbc_clk_init(struct qmp_usbc *qmp)
 	return devm_clk_bulk_get_optional(dev, num, qmp->clks);
 }
 
-static void phy_clk_release_provider(void *res)
-{
-	of_clk_del_provider(res);
-}
-
-/*
- * Register a fixed rate pipe clock.
- *
- * The <s>_pipe_clksrc generated by PHY goes to the GCC that gate
- * controls it. The <s>_pipe_clk coming out of the GCC is requested
- * by the PHY driver for its operations.
- * We register the <s>_pipe_clksrc here. The gcc driver takes care
- * of assigning this <s>_pipe_clksrc as parent to <s>_pipe_clk.
- * Below picture shows this relationship.
- *
- *         +---------------+
- *         |   PHY block   |<<---------------------------------------+
- *         |               |                                         |
- *         |   +-------+   |                   +-----+               |
- *   I/P---^-->|  PLL  |---^--->pipe_clksrc--->| GCC |--->pipe_clk---+
- *    clk  |   +-------+   |                   +-----+
- *         +---------------+
- */
-static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
-{
-	struct clk_fixed_rate *fixed = &qmp->pipe_clk_fixed;
-	struct clk_init_data init = { };
-	int ret;
-
-	ret = of_property_read_string(np, "clock-output-names", &init.name);
-	if (ret) {
-		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
-		return ret;
-	}
-
-	init.ops = &clk_fixed_rate_ops;
-
-	/* controllers using QMP phys use 125MHz pipe clock interface */
-	fixed->fixed_rate = 125000000;
-	fixed->hw.init = &init;
-
-	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
-	if (ret)
-		return ret;
-
-	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
-	if (ret)
-		return ret;
-
-	/*
-	 * Roll a devm action because the clock provider is the child node, but
-	 * the child node is not actually a device.
-	 */
-	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
-}
-
 #if IS_ENABLED(CONFIG_TYPEC)
 static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
 				      enum typec_orientation orientation)
@@ -1093,7 +1035,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	 */
 	pm_runtime_forbid(dev);
 
-	ret = phy_pipe_clk_register(qmp, np);
+	ret = devm_qmp_register_pipe_clock_provider(dev, np);
 	if (ret)
 		goto err_node_put;
 

-- 
2.47.3


