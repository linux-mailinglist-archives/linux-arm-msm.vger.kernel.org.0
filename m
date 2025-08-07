Return-Path: <linux-arm-msm+bounces-68035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE09B1DBC6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 18:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A39E7A43E0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 16:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA3927145D;
	Thu,  7 Aug 2025 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inP1U+j8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14CB270EDF;
	Thu,  7 Aug 2025 16:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754584425; cv=none; b=YKdIb7oIIh60QQyLgQBbZf3xRmHSZ1x0fGRQfmaOzIkGNoKgl8LPGXkX3sHGG2qkRLUd0u5U3CM1GVddrP2dVdR5PnIcRrJIfU2/px+xumKPY6blUOkspmtyQnJyOobRnV7onqd6XQNP7MqI+It5lHHwb05FIrssWXyrQdaAbBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754584425; c=relaxed/simple;
	bh=vH+XAhFoFw8bFy65i97uyeO5sSUgfdapXmGNVliPTCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUq7206QIGvGrD67yO7hEihPG0RJNdfvv/XSGR70Zu3mX5l3zrAkG9KDg/2lCpCFaeOYrdges7wG6dzTRUp0MVl2lSLVWSG/Vg/z3IEM2ydHDDY7Mwv8CWd3NGr7KIyiEKBreymCgpFiUhMXBpUZln0nhk1X6Jw29tRkz/l2pWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inP1U+j8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8D8C4CEEB;
	Thu,  7 Aug 2025 16:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754584423;
	bh=vH+XAhFoFw8bFy65i97uyeO5sSUgfdapXmGNVliPTCY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=inP1U+j8GLuygHdBHyI5g2HB8++hrj50TXnv9YbSqem2vjoV45o8w5WP9IZTMJrZb
	 sLY46LvtRUvmVUq9ZkiZjiSzdbAdWi3VTuntv4XiTIj7c+QOOV3AoaOlg3iuxvstA9
	 74qcPVw5oUOaBMB0VB5D1rAVtCArHJK13Fb8SIVpHL5yUi8hhaROOsh+Yn3BpkCiin
	 pC/sjvAcdZ52vZQg2iTuvZRJYHBCpxn1VdhY6Huw3vbTkOIJ4TMI3gl6VisCVnxWOA
	 SN8v/Q62sJTiy8iuCBejNQrj8syvCU+fWXBCzTt/oBeeSddmB9jGtkrRw9Rd9wahMw
	 iAp0W6j6lS8jA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 07 Aug 2025 18:33:22 +0200
Subject: [PATCH v4 4/6] phy: qcom: qmp-combo: introduce QMPPHY_MODE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250807-topic-4ln_dp_respin-v4-4-43272d6eca92@oss.qualcomm.com>
References: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
In-Reply-To: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754584403; l=3132;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=wwNxslbPGJK/G//pcTLP5e9hP0rnAe22Nbzx6I8BS6A=;
 b=O3EkWAfpwOBee9+xb4F8ZXG5qiQHu0ZfS1BfuPaHUlsViOcPtkxfqQRmWujBK0WLBPAqRVqN7
 8fDIFIGYNwoAYNotjtZ4d1adHE6RtEJ2Q/LPHDE2w610r4MMtX/EPRl
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
index 8395035754975808ee1b5b9c48d046a719e79e60..c65837fc9e4c38673fc61d3ae66072ba5a265a70 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -62,6 +62,12 @@
 
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
@@ -1844,6 +1850,7 @@ struct qmp_combo {
 
 	struct mutex phy_mutex;
 	int init_count;
+	enum qmpphy_mode qmpphy_mode;
 
 	struct phy *usb_phy;
 	enum phy_mode phy_mode;
@@ -3037,12 +3044,33 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
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
@@ -4053,6 +4081,12 @@ static int qmp_combo_probe(struct platform_device *pdev)
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
2.50.1


