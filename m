Return-Path: <linux-arm-msm+bounces-108158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFbQHmHwCmpv+AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:56:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D5156B104
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F991330B7D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700593F0A86;
	Mon, 18 May 2026 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYGfYRh+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBC83ED5A9;
	Mon, 18 May 2026 10:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100390; cv=none; b=PXRyGL5qzUo69MZDGm/b04S4pIpgYVV0Vn9a1R1b0r9d0UpEvTGPiJhSmaEaUCzo4lmVF2frxC3PoVdXiwJMVlLKbaVul4wfg+j5OM/ok5wI1eJ9AFXEGLaD9FaKoX0QRwvvOrruEHYCF1dHxPAu8X59/mmqeefEiRH4LUvCgD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100390; c=relaxed/simple;
	bh=M7QM8+uaEwca/mAYvXP9Zxb0ywesKSGpaV0u8FK8FBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G75HJNhlvzYAT3m/Lki/6eiieqgGfrVF+GXFEGev7LnkdnitjyBbhnStTp/t5uVkDDbjG4yXm1ZlXrWM3rFK3xB6MsZHMN7BGFXnKv2MBrioi0g6AuAnAOdBMSfODFJXgqIG7VdXfHVgwtr3owFmQSno4wuBOdMmOc1xHHBUIEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYGfYRh+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C50C2BCB8;
	Mon, 18 May 2026 10:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779100386;
	bh=M7QM8+uaEwca/mAYvXP9Zxb0ywesKSGpaV0u8FK8FBc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bYGfYRh+52BRwN8NLMS21ZrycIsjtL8jBDb3UT91LYB5TTyHqIWTrdnoxaIVO8FIE
	 T64hTcPGn77IKp88QAnzGYCXEy1YLRMGSNgIcNjD9W79q3LTJ/BUJr8Sk2BC756Ccn
	 o6Hf2tEJip+ixA5PdzEJlcGLuMe/MBhhrJVFpr1BJAQaZ6LoR1yl88LPbqA/Ca1ezq
	 I1y19mctGUP1sc+f8WAeWzbG+cTXNRO+TjaiTVLdMcvypk/f9hHgnhkLAYGMOp52HO
	 m5IyoZZVGyfmlJ/qQ4IfuLG37S1KMnAq7y6C0VJ+c+QY9Tmc38WOuz4lcdw59qa37n
	 zZ/c+sgdCGJRQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 18 May 2026 12:29:50 +0200
Subject: [PATCH 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
In-Reply-To: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779100365; l=23183;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Vv7DNTXdWoblbl02zHXDTUX4bh/QPzbVQ0uNT/+6gTE=;
 b=uBznFoGtf4Bi2u8nxHWKTRVYz/fCwqBFzh9SQGDlpA+l/6psxSkbawV8fJcmUX9aheWabqKFc
 XTgBz72LrppC6jmVYOqf45cIn5rHvnVxzcWS2VzwrcI65vvksFDGjtv
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 00D5156B104
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108158-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
a flavor called USB43DP, which as the name implies, features USB4, USB3
and DP signal processing capabilities. In that architecture, USB3 and
USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
The DP part is roughly the same as on the instances without USB4.

The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
Only one USB protocol (and flavor of pipe clock) can be active at a
given moment (not to be confused with USB3 not being able to be
tunneled as USB4 packets - that of course remains possible).
The DP PLL is still used for clocking tunneled DP links. It may be
turned off to save power when no tunnels are active, but that's left as
a TODO item for now.

Due to the nature of USB4, the Type-C handling happens entirely inside
the Host Router, and as such the QMPPHY's mux_set() function is
nullified for the period when USB4 PHY remains active. This is strictly
necessary, as the Host Router driver is going to excercise manual
control over the USB4 PHY's power state, which is needed by the suspend
and resume flows. Failure to control that synchronously with other
parts of the code results in a SoC crash by unlocked access.

Because of that, a new struct phy is spawned to expose the USB4 mode,
along with a .set_mode callback to allow toggling between USB4 and TBT3
submodes.

Thunderbolt 3, having a number of differences vs USB4, requires a
couple specific overrides, pertaining to electrical characteristics,
which are easily accommodated for.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 392 ++++++++++++++++++++++++------
 1 file changed, 322 insertions(+), 70 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 93f1aa10d400..898f42de4a08 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -22,6 +22,7 @@
 #include <linux/usb/typec.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
+#include <linux/usb/typec_tbt.h>
 
 #include <drm/bridge/aux-bridge.h>
 
@@ -61,10 +62,14 @@
 #define SW_USB3PHY_RESET			BIT(2)
 /* mux to select USB3 PHY reset control, 0:HW control, 1: software reset */
 #define SW_USB3PHY_RESET_MUX			BIT(3)
+#define SW_USB4PHY_RESET			BIT(4)
+#define SW_USB4PHY_RESET_MUX			BIT(5)
 
 /* QPHY_V3_DP_COM_PHY_MODE_CTRL register bits */
 #define USB3_MODE				BIT(0) /* enables USB3 mode */
 #define DP_MODE					BIT(1) /* enables DP mode */
+#define USB4_MODE				BIT(2) /* mutually exclusive with the above */
+#define DP_TUNNELING_CLOCK_GEN_EN		BIT(3)
 
 /* QPHY_V3_DP_COM_TYPEC_CTRL register bits */
 #define SW_PORTSELECT_VAL			BIT(0)
@@ -77,6 +82,8 @@ enum qmpphy_mode {
 	QMPPHY_MODE_USB3DP = 0,
 	QMPPHY_MODE_DP_ONLY,
 	QMPPHY_MODE_USB3_ONLY,
+	/* USB4 QMPPHY mode refers to both USB4 and TBT3 */
+	QMPPHY_MODE_USB4,
 };
 
 /* set of registers with offsets different per-PHY */
@@ -89,6 +96,7 @@ enum qphy_reg_layout {
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
 	QPHY_PCS_POWER_DOWN_CONTROL,
 	QPHY_PCS_CLAMP_ENABLE,
+	QPHY_PCS_USB4_CLAMP_ENABLE,
 
 	QPHY_COM_RESETSM_CNTRL,
 	QPHY_COM_C_READY_STATUS,
@@ -2198,6 +2206,8 @@ struct qmp_combo_offsets {
 	u16 dp_txa;
 	u16 dp_txb;
 	u16 dp_dp_phy;
+	u16 usb4_serdes;
+	u16 usb4_pcs;
 };
 
 struct qmp_phy_cfg {
@@ -2245,6 +2255,18 @@ struct qmp_phy_cfg {
 	int (*calibrate_dp_phy)(struct qmp_combo *qmp);
 	void (*dp_aux_init)(struct qmp_combo *qmp);
 
+	/* USB4 specifics */
+	const struct qmp_phy_init_tbl *usb4_serdes_tbl;
+	int usb4_serdes_tbl_num;
+	const struct qmp_phy_init_tbl *usb4_serdes_tb3_ovrd_tbl;
+	int usb4_serdes_tb3_ovrd_num;
+	const struct qmp_phy_init_tbl *usb4_tx_tbl;
+	int usb4_tx_tbl_num;
+	const struct qmp_phy_init_tbl *usb4_rx_tbl;
+	int usb4_rx_tbl_num;
+	const struct qmp_phy_init_tbl *usb4_pcs_tbl;
+	int usb4_pcs_tbl_num;
+
 	/* resets to be requested */
 	const char * const *reset_list;
 	int num_resets;
@@ -2286,8 +2308,12 @@ struct qmp_combo {
 	void __iomem *dp_tx2;
 	void __iomem *dp_dp_phy;
 
+	void __iomem *usb4_serdes;
+	void __iomem *usb4_pcs;
+
 	struct clk *pipe_clk;
 	struct clk_bulk_data *clks;
+	struct clk *p2rr2p_pipe_clk;
 	int num_clks;
 	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
@@ -2306,6 +2332,10 @@ struct qmp_combo {
 	unsigned int dp_init_count;
 	bool dp_powered_on;
 
+	struct phy *usb4_phy;
+	enum tbt_phy_submode usb4_phy_submode;
+	unsigned int usb4phy_init_count;
+
 	struct clk_fixed_rate pipe_clk_fixed;
 	struct clk_hw dp_link_hw;
 	struct clk_hw dp_pixel_hw;
@@ -3661,14 +3691,26 @@ static int qmp_combo_dp_calibrate(struct phy *phy)
 static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	u32 dp_reset_val = SW_DPPHY_RESET_MUX | SW_DPPHY_RESET;
 	void __iomem *com = qmp->com;
 	void __iomem *pcs_aon = qmp->pcs_aon;
+	void __iomem *pcs = qmp->pcs;
 	int ret;
 	u32 val;
 
 	if (!force && qmp->init_count++)
 		return 0;
 
+	if (qmp->qmpphy_mode == QMPPHY_MODE_USB4) {
+		pcs = qmp->usb4_pcs;
+
+		qphy_setbits(pcs_aon, cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
+
+		/* Do not disturb the DP PLL in case there's an active DP tunnel */
+		if (readl(com + QPHY_V3_DP_COM_RESET_OVRD_CTRL) & DP_TUNNELING_CLOCK_GEN_EN)
+			dp_reset_val &= ~SW_DPPHY_RESET_MUX;
+	}
+
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
 	if (ret) {
 		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
@@ -3695,8 +3737,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 
 	/* override hardware control for reset of qmp phy */
 	qphy_setbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
-			SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
-			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
+			dp_reset_val |
+			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET |
+			SW_USB4PHY_RESET_MUX | SW_USB4PHY_RESET);
 
 	/* override hardware control for reset of qmp phy */
 	if (pcs_aon && cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {
@@ -3712,6 +3755,10 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 	if (cfg->invert_cc_polarity)
 		val |= INVERT_CC_POLARITY;
 
+	/*
+	 * Note that in USB4 mode, the router controls pin assignments instead
+	 * and the values of the PORTSELECT registers are ignored.
+	 */
 	writel(val, com + QPHY_V3_DP_COM_TYPEC_CTRL);
 
 	switch (qmp->qmpphy_mode) {
@@ -3739,12 +3786,21 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 		qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
 				SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
 		break;
+	case QMPPHY_MODE_USB4:
+		writel(USB4_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
+
+		/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
+		/* TODO: disable DP PLL if there are no active tunnels after router setup */
+		qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
+			     SW_USB4PHY_RESET_MUX | SW_USB4PHY_RESET |
+			     SW_DPPHY_RESET_MUX | SW_DPPHY_RESET);
+		break;
 	}
 
 	qphy_clrbits(com, QPHY_V3_DP_COM_SWI_CTRL, 0x03);
 	qphy_clrbits(com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
 
-	qphy_setbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			SW_PWRDN);
 
 	return 0;
@@ -3859,6 +3915,10 @@ static int qmp_combo_usb_power_on(struct phy *phy)
 	struct qmp_combo *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *serdes = qmp->serdes;
+	const struct qmp_phy_init_tbl *pcs_tbl;
+	const struct qmp_phy_init_tbl *rx_tbl;
+	const struct qmp_phy_init_tbl *serdes_tbl;
+	const struct qmp_phy_init_tbl *tx_tbl;
 	void __iomem *tx = qmp->tx;
 	void __iomem *rx = qmp->rx;
 	void __iomem *tx2 = qmp->tx2;
@@ -3866,10 +3926,39 @@ static int qmp_combo_usb_power_on(struct phy *phy)
 	void __iomem *pcs = qmp->pcs;
 	void __iomem *pcs_usb = qmp->pcs_usb;
 	void __iomem *status;
+	int pcs_tbl_num, rx_tbl_num, serdes_tbl_num, tx_tbl_num;
 	unsigned int val;
 	int ret;
 
-	qmp_configure(qmp->dev, serdes, cfg->serdes_tbl, cfg->serdes_tbl_num);
+	if (qmp->qmpphy_mode == QMPPHY_MODE_USB4) {
+		pcs = qmp->usb4_pcs;
+		serdes = qmp->usb4_serdes;
+		pcs_tbl = cfg->usb4_pcs_tbl;
+		pcs_tbl_num = cfg->usb4_pcs_tbl_num;
+
+		serdes_tbl = cfg->usb4_serdes_tbl;
+		serdes_tbl_num = cfg->usb4_serdes_tbl_num;
+
+		rx_tbl = cfg->usb4_rx_tbl;
+		rx_tbl_num = cfg->usb4_rx_tbl_num;
+
+		tx_tbl = cfg->usb4_tx_tbl;
+		tx_tbl_num = cfg->usb4_tx_tbl_num;
+	} else {
+		pcs_tbl = cfg->pcs_tbl;
+		pcs_tbl_num = cfg->pcs_tbl_num;
+
+		serdes_tbl = cfg->serdes_tbl;
+		serdes_tbl_num = cfg->serdes_tbl_num;
+
+		rx_tbl = cfg->rx_tbl;
+		rx_tbl_num = cfg->rx_tbl_num;
+
+		tx_tbl = cfg->tx_tbl;
+		tx_tbl_num = cfg->tx_tbl_num;
+	}
+
+	qmp_configure(qmp->dev, serdes, serdes_tbl, serdes_tbl_num);
 
 	ret = clk_prepare_enable(qmp->pipe_clk);
 	if (ret) {
@@ -3878,17 +3967,19 @@ static int qmp_combo_usb_power_on(struct phy *phy)
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qmp_configure_lane(qmp->dev, tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
-	qmp_configure_lane(qmp->dev, tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
+	qmp_configure_lane(qmp->dev, tx, tx_tbl, tx_tbl_num, 1);
+	qmp_configure_lane(qmp->dev, tx2, tx_tbl, tx_tbl_num, 2);
 
-	qmp_configure_lane(qmp->dev, rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
-	qmp_configure_lane(qmp->dev, rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
+	qmp_configure_lane(qmp->dev, rx, rx_tbl, rx_tbl_num, 1);
+	qmp_configure_lane(qmp->dev, rx2, rx_tbl, rx_tbl_num, 2);
 
-	qmp_configure(qmp->dev, pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	qmp_configure(qmp->dev, pcs, pcs_tbl, pcs_tbl_num);
 	qmp_configure(qmp->dev, qmp->pcs_misc, cfg->pcs_misc_tbl, cfg->pcs_misc_tbl_num);
 
-
-	if (pcs_usb)
+	if (qmp->qmpphy_mode == QMPPHY_MODE_USB4 && qmp->usb4_phy_submode == PHY_SUBMODE_TBT3)
+		qmp_configure(qmp->dev, serdes, cfg->usb4_serdes_tb3_ovrd_tbl,
+			      cfg->usb4_serdes_tb3_ovrd_num);
+	else if (qmp->qmpphy_mode != QMPPHY_MODE_USB4 && pcs_usb)
 		qmp_configure(qmp->dev, pcs_usb, cfg->pcs_usb_tbl,
 			      cfg->pcs_usb_tbl_num);
 
@@ -3921,18 +4012,22 @@ static int qmp_combo_usb_power_off(struct phy *phy)
 {
 	struct qmp_combo *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	void __iomem *pcs = qmp->pcs;
+
+	if (qmp->usb4phy_init_count)
+		pcs = qmp->usb4_pcs;
 
 	clk_disable_unprepare(qmp->pipe_clk);
 
 	/* PHY reset */
-	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+	qphy_setbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
 	/* stop SerDes and Phy-Coding-Sublayer */
-	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_START_CTRL],
+	qphy_clrbits(pcs, cfg->regs[QPHY_START_CTRL],
 			SERDES_START | PCS_START);
 
 	/* Put PHY into POWER DOWN state: active low */
-	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+	qphy_clrbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			SW_PWRDN);
 
 	return 0;
@@ -3943,21 +4038,27 @@ static int qmp_combo_usb_init(struct phy *phy)
 	struct qmp_combo *qmp = phy_get_drvdata(phy);
 	int ret;
 
-	mutex_lock(&qmp->phy_mutex);
+	guard(mutex)(&qmp->phy_mutex);
+
+	/* USB4 mode takes precedence, do not reprogram the PHY in that case */
+	if (qmp->usb4phy_init_count) {
+		qmp->init_count++;
+		qmp->usb_init_count++;
+		return 0;
+	}
+
 	ret = qmp_combo_com_init(qmp, false);
 	if (ret)
-		goto out_unlock;
+		return ret;
 
 	ret = qmp_combo_usb_power_on(phy);
 	if (ret) {
 		qmp_combo_com_exit(qmp, false);
-		goto out_unlock;
+		return ret;
 	}
 
 	qmp->usb_init_count++;
 
-out_unlock:
-	mutex_unlock(&qmp->phy_mutex);
 	return ret;
 }
 
@@ -3966,20 +4067,26 @@ static int qmp_combo_usb_exit(struct phy *phy)
 	struct qmp_combo *qmp = phy_get_drvdata(phy);
 	int ret;
 
-	mutex_lock(&qmp->phy_mutex);
+	guard(mutex)(&qmp->phy_mutex);
+
+	/* USB4 mode takes precedence, do not reprogram the PHY in that case */
+	if (qmp->usb4phy_init_count) {
+		qmp->init_count--;
+		qmp->usb_init_count--;
+		return 0;
+	}
+
 	ret = qmp_combo_usb_power_off(phy);
 	if (ret)
-		goto out_unlock;
+		return ret;
 
 	ret = qmp_combo_com_exit(qmp, false);
 	if (ret)
-		goto out_unlock;
+		return ret;
 
 	qmp->usb_init_count--;
 
-out_unlock:
-	mutex_unlock(&qmp->phy_mutex);
-	return ret;
+	return 0;
 }
 
 static int qmp_combo_usb_set_mode(struct phy *phy, enum phy_mode mode, int submode)
@@ -3991,6 +4098,119 @@ static int qmp_combo_usb_set_mode(struct phy *phy, enum phy_mode mode, int submo
 	return 0;
 }
 
+static int qmp_combo_reconfigure_phy(struct qmp_combo *qmp, enum qmpphy_mode new_mode)
+{
+	dev_dbg(qmp->dev, "qmp_combo_reconfigure_phy: switching from qmpphy mode %d to %d\n",
+		qmp->qmpphy_mode, new_mode);
+
+	if (qmp->usb_init_count || qmp->usb4phy_init_count)
+		qmp_combo_usb_power_off(qmp->usb_phy);
+
+	if (qmp->dp_init_count)
+		writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
+
+	qmp_combo_com_exit(qmp, true);
+
+	qmp->qmpphy_mode = new_mode;
+
+	/* Now everything's powered down, power up the right PHYs */
+	qmp_combo_com_init(qmp, true);
+
+	if ((qmp->usb_init_count || qmp->usb4phy_init_count) &&
+	    new_mode != QMPPHY_MODE_DP_ONLY)
+		qmp_combo_usb_power_on(qmp->usb_phy);
+
+	if ((new_mode == QMPPHY_MODE_USB3DP || new_mode == QMPPHY_MODE_DP_ONLY) &&
+	    qmp->dp_init_count)
+		qmp->cfg->dp_aux_init(qmp);
+
+	return 0;
+}
+
+static int qmp_combo_usb4_init(struct phy *phy)
+{
+	struct qmp_combo *qmp = phy_get_drvdata(phy);
+	int ret;
+
+	guard(mutex)(&qmp->phy_mutex);
+
+	if (!qmp->p2rr2p_pipe_clk) {
+		dev_err(qmp->dev, "missing p2rr2p_pipe clock handle. Update your Device Tree.\n");
+		return -EINVAL;
+	}
+
+	ret = clk_prepare_enable(qmp->p2rr2p_pipe_clk);
+	if (ret) {
+		dev_err(qmp->dev, "p2rr2p_pipe enable failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = qmp_combo_com_init(qmp, false);
+	if (ret)
+		return ret;
+
+	/* USB4 mode takes precedence to USB3(+DP), force reconfigure the PHY */
+	ret = qmp_combo_reconfigure_phy(qmp, QMPPHY_MODE_USB4);
+	if (ret)
+		return ret;
+
+	ret = qmp_combo_usb_power_on(phy);
+	if (ret) {
+		qmp_combo_com_exit(qmp, false);
+		return ret;
+	}
+
+	/*
+	 * Due to the SoC design, the PHY only has a single valid consumer and
+	 * preventing it from having sole ownership of the PHY's power state
+	 * makes suspending/resuming the router impossible.
+	 */
+	WARN_ON(qmp->usb4phy_init_count++);
+
+	return 0;
+}
+
+static int qmp_combo_usb4_exit(struct phy *phy)
+{
+	struct qmp_combo *qmp = phy_get_drvdata(phy);
+	int ret;
+
+	guard(mutex)(&qmp->phy_mutex);
+
+	ret = qmp_combo_usb_power_off(qmp->usb_phy);
+	if (ret)
+		return ret;
+
+	ret = qmp_combo_com_exit(qmp, false);
+	if (ret)
+		return ret;
+
+	/*
+	 * Mark the USB4 PHY uninitialized and wait for a mux_set event to determine the correct
+	 * setting. This will always be possible because USB4 requires Type-C.
+	 */
+	qmp->usb4phy_init_count--;
+
+	clk_disable_unprepare(qmp->p2rr2p_pipe_clk);
+
+	return 0;
+}
+
+static int qmp_combo_usb4_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct qmp_combo *qmp = phy_get_drvdata(phy);
+
+	if (mode != PHY_MODE_TBT)
+		return -EINVAL;
+
+	if (submode == PHY_SUBMODE_USB4 || submode == PHY_SUBMODE_TBT3) {
+		qmp->usb4_phy_submode = submode;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static const struct phy_ops qmp_combo_usb_phy_ops = {
 	.init		= qmp_combo_usb_init,
 	.exit		= qmp_combo_usb_exit,
@@ -3998,6 +4218,13 @@ static const struct phy_ops qmp_combo_usb_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct phy_ops qmp_combo_usb4_phy_ops = {
+	.init		= qmp_combo_usb4_init,
+	.exit		= qmp_combo_usb4_exit,
+	.set_mode	= qmp_combo_usb4_set_mode,
+	.owner		= THIS_MODULE,
+};
+
 static const struct phy_ops qmp_combo_dp_phy_ops = {
 	.init		= qmp_combo_dp_init,
 	.configure	= qmp_combo_dp_configure,
@@ -4037,9 +4264,12 @@ static void qmp_combo_enable_autonomous_mode(struct qmp_combo *qmp)
 	 * Enable i/o clamp_n for autonomous mode
 	 * V6 and later versions use pcs aon clamp register
 	 */
-	if (pcs_aon)
-		qphy_clrbits(pcs_aon, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
-	else if (pcs_misc)
+	if (pcs_aon) {
+		if (qmp->qmpphy_mode == QMPPHY_MODE_USB4)
+			qphy_clrbits(pcs_aon, cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
+		else
+			qphy_clrbits(pcs_aon, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
+	} else if (pcs_misc)
 		qphy_clrbits(pcs_misc, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
 }
 
@@ -4051,9 +4281,12 @@ static void qmp_combo_disable_autonomous_mode(struct qmp_combo *qmp)
 	void __iomem *pcs_aon = qmp->pcs_aon;
 
 	/* Disable i/o clamp_n on resume for normal mode */
-	if (pcs_aon)
-		qphy_setbits(pcs_aon, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
-	else if (pcs_misc)
+	if (pcs_aon) {
+		if (qmp->qmpphy_mode == QMPPHY_MODE_USB4)
+			qphy_setbits(pcs_aon, cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
+		else
+			qphy_setbits(pcs_aon, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
+	} else if (pcs_misc)
 		qphy_setbits(pcs_misc, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
 
 	qphy_clrbits(pcs_usb, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL],
@@ -4427,24 +4660,29 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
 	struct qmp_combo *qmp = typec_switch_get_drvdata(sw);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
+	if (qmp->qmpphy_mode == QMPPHY_MODE_USB4) {
+		/* QMPPHY has no orientation handling in USB4 mode, don't cache the setting */
+		qmp->orientation = TYPEC_ORIENTATION_NONE;
+		return 0;
+	}
+
 	if (orientation == qmp->orientation || orientation == TYPEC_ORIENTATION_NONE)
 		return 0;
 
-	mutex_lock(&qmp->phy_mutex);
+	guard(mutex)(&qmp->phy_mutex);
 	qmp->orientation = orientation;
 
 	if (qmp->init_count) {
-		if (qmp->usb_init_count)
+		if (qmp->usb_init_count || qmp->usb4phy_init_count)
 			qmp_combo_usb_power_off(qmp->usb_phy);
 		qmp_combo_com_exit(qmp, true);
 
 		qmp_combo_com_init(qmp, true);
-		if (qmp->usb_init_count)
+		if (qmp->usb_init_count || qmp->usb4phy_init_count)
 			qmp_combo_usb_power_on(qmp->usb_phy);
 		if (qmp->dp_init_count)
 			cfg->dp_aux_init(qmp);
 	}
-	mutex_unlock(&qmp->phy_mutex);
 
 	return 0;
 }
@@ -4452,7 +4690,6 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
 static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
 {
 	struct qmp_combo *qmp = typec_mux_get_drvdata(mux);
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	enum qmpphy_mode new_mode;
 	unsigned int svid;
 
@@ -4463,6 +4700,29 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 	else
 		svid = 0;
 
+	/*
+	 * The USB4 router driver must excercise fine-grained control over the timing of
+	 * USB4 QMPPHY mode entry/exit, which is difficult to otherwise ensure within Linux's
+	 * Type-C framework if the PHY acts as a self-decisive mode mux in parallel.
+	 *
+	 * Keep the hardware in QMPPHY_MODE_USB4 at all times between .init and .exit of the
+	 * (Linux) USB4 PHY and wait for the router driver to turn it off at its discretion.
+	 * Once that happens, fall back to the usual USB3/DP/Combo mode logic.
+	 *
+	 * After the QMPPHY has been turned off through phy_exit(usb4_phy), the next mux_set
+	 * will initialize it in the right mode.
+	 */
+	if (qmp->usb4phy_init_count)
+		return 0;
+
+	/*
+	 * Explicitly ignore TBT/USB4 mode requests that may come if the USB4 PHY hasn't been
+	 * initialized, either due to the USB4 drivers being disabled or due to this PHY instance
+	 * lacking USB4 support.
+	 */
+	if (svid == USB_TYPEC_TBT_SID || (!state->alt && state->mode == TYPEC_MODE_USB4))
+		return 0;
+
 	if (svid == USB_TYPEC_DP_SID) {
 		switch (state->mode) {
 		/* DP Only */
@@ -4495,41 +4755,11 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 		return 0;
 	}
 
-	dev_dbg(qmp->dev, "typec_mux_set: switching from qmpphy mode %d to %d\n",
-		qmp->qmpphy_mode, new_mode);
+	/* The mux still receives Type-C events, even if all PHYs are uninitialized */
+	if (!qmp->init_count)
+		return 0;
 
-	qmp->qmpphy_mode = new_mode;
-
-	if (qmp->init_count) {
-		if (qmp->usb_init_count)
-			qmp_combo_usb_power_off(qmp->usb_phy);
-
-		if (qmp->dp_init_count)
-			writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
-
-		qmp_combo_com_exit(qmp, true);
-
-		/* Now everything's powered down, power up the right PHYs */
-		qmp_combo_com_init(qmp, true);
-
-		if (new_mode == QMPPHY_MODE_DP_ONLY) {
-			if (qmp->usb_init_count)
-				qmp->usb_init_count--;
-		}
-
-		if (new_mode == QMPPHY_MODE_USB3DP || new_mode == QMPPHY_MODE_USB3_ONLY) {
-			qmp_combo_usb_power_on(qmp->usb_phy);
-			if (!qmp->usb_init_count)
-				qmp->usb_init_count++;
-		}
-
-		if (new_mode == QMPPHY_MODE_DP_ONLY || new_mode == QMPPHY_MODE_USB3DP) {
-			if (qmp->dp_init_count)
-				cfg->dp_aux_init(qmp);
-		}
-	}
-
-	return 0;
+	return qmp_combo_reconfigure_phy(qmp, new_mode);
 }
 
 static void qmp_combo_typec_switch_unregister(void *data)
@@ -4733,6 +4963,9 @@ static int qmp_combo_parse_dt(struct qmp_combo *qmp)
 	}
 	qmp->dp_dp_phy = base + offs->dp_dp_phy;
 
+	qmp->usb4_serdes = base + offs->usb4_serdes;
+	qmp->usb4_pcs = base + offs->usb4_pcs;
+
 	ret = qmp_combo_clk_init(qmp);
 	if (ret)
 		return ret;
@@ -4743,6 +4976,12 @@ static int qmp_combo_parse_dt(struct qmp_combo *qmp)
 				"failed to get usb3_pipe clock\n");
 	}
 
+	qmp->p2rr2p_pipe_clk = devm_clk_get_optional(dev, "p2rr2p_pipe");
+	if (IS_ERR(qmp->p2rr2p_pipe_clk)) {
+		return dev_err_probe(dev, PTR_ERR(qmp->p2rr2p_pipe_clk),
+				     "failed to get p2rr2p_pipe clock\n");
+	}
+
 	return 0;
 }
 
@@ -4758,6 +4997,8 @@ static struct phy *qmp_combo_phy_xlate(struct device *dev, const struct of_phand
 		return qmp->usb_phy;
 	case QMP_USB43DP_DP_PHY:
 		return qmp->dp_phy;
+	case QMP_USB43DP_USB4_PHY:
+		return qmp->usb4_phy ?: ERR_PTR(-EINVAL);
 	}
 
 	return ERR_PTR(-EINVAL);
@@ -4965,6 +5206,17 @@ static int qmp_combo_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(qmp->dp_phy, qmp);
 
+	if (qmp->cfg->usb4_serdes_tbl) {
+		qmp->usb4_phy = devm_phy_create(dev, dev->of_node, &qmp_combo_usb4_phy_ops);
+		if (IS_ERR(qmp->usb4_phy)) {
+			ret = PTR_ERR(qmp->usb4_phy);
+			dev_err(dev, "failed to create USB4 PHY: %d\n", ret);
+			goto err_node_put;
+		}
+
+		phy_set_drvdata(qmp->usb4_phy, qmp);
+	}
+
 	if (usb_np == dev->of_node)
 		phy_provider = devm_of_phy_provider_register(dev, qmp_combo_phy_xlate);
 	else

-- 
2.54.0


