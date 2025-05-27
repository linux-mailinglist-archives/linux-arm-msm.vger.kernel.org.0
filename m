Return-Path: <linux-arm-msm+bounces-59615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D7BAC5B81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 22:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 242607B109E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3D820C48D;
	Tue, 27 May 2025 20:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sm0iTUnq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4350420C47F;
	Tue, 27 May 2025 20:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748378440; cv=none; b=hc5mWF8k+/U94Fojta3bRL0iJHH8v0LwI35Rkd0S3C0QzFzz6hO03o5ECMNVUXoDzm2Qvwk84SGkAwPZezYVSAc6StdzHAw4ZCNdIIKuKyB3aGBPmeHb1JRobGC4TyLADqfZ2hEjJ7C33kM/oVDwSCQ8jg06FDARLADXuKDvk5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748378440; c=relaxed/simple;
	bh=IpMb7V0sAlt8/QPGelTGeOsg+wTJq9WrQx/D96Ll6L0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JudgtvU6Jz+2Tc4tQ5c/f9IR0Z/MpaDazJntTpSS23bqW5jXh2p3dbXQ5C1dyt4DG34kSmIJxzxTN4cX8WUJA7pY471IbCXnPeXAErVCUdsv32/+CUzdWQDabWpbzBCv2Iai0Z/TZ3OaQLOLpWlp0zwVJJHkxVoCd1b1k4obNNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sm0iTUnq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D512C4CEED;
	Tue, 27 May 2025 20:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748378439;
	bh=IpMb7V0sAlt8/QPGelTGeOsg+wTJq9WrQx/D96Ll6L0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sm0iTUnqpGSTq1Y8Dz5W4NuIK65PfDjOitYRyTrKZBDPC0JP6klw4PqLhkFilRAOz
	 XToWo8EkeK7/NWoNBbA3WUAGrbS0MaLPwRPNIs+hWfFln8hV84EsWdeCbTvtjJhmK8
	 hCL7xjvblRYHkhlGB7FAo3pEXGo4DS71hhQh6jDZiEmYiH84M3Zb4OcH5d470z8aj+
	 /6nQPe6PdEs0c9jwgoeqghuVshAPfifKFcCjxA1zev0LWx/6enBIAWKOPGIZXBj/Rk
	 b7XVYPc8cVR22ioaG32IRDWLpgnbwTxNOpQttnLfYr7g8aTJZOw1yAl4fY3hk9zKJm
	 1Rj9uI/htbwCQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 27 May 2025 22:40:06 +0200
Subject: [PATCH v3 4/6] phy: qcom: qmp-combo: introduce QMPPHY_MODE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-topic-4ln_dp_respin-v3-4-f9a0763ec289@oss.qualcomm.com>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
In-Reply-To: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748378414; l=3132;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=BRtYMDxSKD4x12RQQ6A5MlAQlMhQmTMBNmxjgiW2Chw=;
 b=gQjg8nQnAUGrwjxRU5MiHRlAjrYVku3MgKHySByvAkjXbgEBmybkXtq15P0JmJOAklP46JIbY
 d+KUTZoZGb2DSdRn60uujm0YfyMJeo5RFaR/mkgpb4gOO3WQyVEeRzj
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Neil Armstrong <neil.armstrong@linaro.org>

Introduce an enum for the QMP Combo PHY modes, use it in the
QMP commmon phy init function and default to COMBO mode.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
[konrad: some renaming and rewording]
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 44 +++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 26480d63322b22eca9637392f888bfbe440c2a13..b34ad92021a656b39562e2685a1e7a0a93660a35 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -61,6 +61,12 @@
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
+enum qmpphy_mode {
+	QMPPHY_MODE_USB3DP = 0,
+	QMPPHY_MODE_DP_ONLY,
+	QMPPHY_MODE_USB3_ONLY,
+};
+
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
 	/* PCS registers */
@@ -1685,6 +1691,7 @@ struct qmp_combo {
 
 	struct mutex phy_mutex;
 	int init_count;
+	enum qmpphy_mode qmpphy_mode;
 
 	struct phy *usb_phy;
 	enum phy_mode phy_mode;
@@ -2817,12 +2824,33 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
 		val |= SW_PORTSELECT_VAL;
 	writel(val, com + QPHY_V3_DP_COM_TYPEC_CTRL);
-	writel(USB3_MODE | DP_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
 
-	/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
-	qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
-			SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
-			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
+	switch (qmp->qmpphy_mode) {
+	case QMPPHY_MODE_USB3DP:
+		writel(USB3_MODE | DP_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
+
+		/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
+		qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
+				SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
+				SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
+		break;
+
+	case QMPPHY_MODE_DP_ONLY:
+		writel(DP_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
+
+		/* bring QMP DP PHY PCS block out of reset */
+		qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
+				SW_DPPHY_RESET_MUX | SW_DPPHY_RESET);
+		break;
+
+	case QMPPHY_MODE_USB3_ONLY:
+		writel(USB3_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
+
+		/* bring QMP USB PHY PCS block out of reset */
+		qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
+				SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
+		break;
+	}
 
 	qphy_clrbits(com, QPHY_V3_DP_COM_SWI_CTRL, 0x03);
 	qphy_clrbits(com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
@@ -3833,6 +3861,12 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	/*
+	 * The hw default is USB3_ONLY, but USB3+DP mode lets us more easily
+	 * check both sub-blocks' init tables for blunders at probe time.
+	 */
+	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
+
 	qmp->usb_phy = devm_phy_create(dev, usb_np, &qmp_combo_usb_phy_ops);
 	if (IS_ERR(qmp->usb_phy)) {
 		ret = PTR_ERR(qmp->usb_phy);

-- 
2.49.0


