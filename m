Return-Path: <linux-arm-msm+bounces-108159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFiyLkztCmo89gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:43:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB1756ADF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 663183449ECA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECF63F0AB3;
	Mon, 18 May 2026 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgbaSZUm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945AB3F0A91;
	Mon, 18 May 2026 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100391; cv=none; b=rZ5duNaR4NnJwRWDEgqTnHPfXCgTmf/s5uyqznCNJ03EewwNYS5OxuX5hUAsp/z+a6I5F7tUleiqtuQGhj0w72+gRYpNAx2cu/kwgx1pdAJ3owkH2ClyJHXKHHWy/Cob+8R+RAzTeOnvPqwzz1BiIJ3Ji03lSdTYuSUlwipk6RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100391; c=relaxed/simple;
	bh=Lto80FV9XLO8w8CT7E6/SeI9mh0aebiItcDXoSXw4aM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D8ZT6hIZsP7g0YKlLkGmqK4kpOqTZQtNb79e+cY4xW0XzN1sA5XG9KFJ8MaVK6XjyzzX05FixeflWW6dvSi62mKr+8y6IokEKFjw4y+/Ws+WFu/urtiMUj1rw/6HfGqtYJMmDyqiqUkBf1THNXXoJy+vl1g8x4L5IhHAPLUh0SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgbaSZUm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05611C2BCC6;
	Mon, 18 May 2026 10:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779100390;
	bh=Lto80FV9XLO8w8CT7E6/SeI9mh0aebiItcDXoSXw4aM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JgbaSZUmv3UJHhtg1UYTw37T+UNH7xPFwYm2JV01zPDzxZCYYF66vgJJ0e2YsC/Ne
	 bW9LP3DRVJDGSrM+dF87mYgRzgdHJarX/lQv4GiZfpIkFtJNTdVPj7pYMZcIOPbROg
	 2bHIh2k1JvyWy+ebo7cP53EczSG2uHoAWc8h1X4vMbnBWmWCO9hE0dn2HB1oDgtNNm
	 vVjKpKgwhWoz2hpIZm39ssKCO5H60D4SxdF4RJjbl6w3g6/SUyu8SXNaMirBQiMX9g
	 n+SHqON4R/wKZOBQSynvffcKCNGjKv+lfwrkxmrwAxGYN2SYzPybR0SegZZnm68lTP
	 bXvsJkG1N8ebQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 18 May 2026 12:29:51 +0200
Subject: [PATCH 4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3 configuration
 data for Hamoa
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-topic-usb4phy-v1-4-71d827c49dca@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779100365; l=19894;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=7sucHOq4upL6BQiyJczh25Wph2pP6NC9RTXlO1emwd8=;
 b=F4wf8MXkfOAVqfV9JKgO5ulZboVu4AhCwklO8Sj8CuSChAhLdiFQdbrUwQKwzvPHMZ/yu0a+N
 n5W55ycLRR2CAL2Fx+XUEJQiLmtrWkFjzWtvsQqIW9gfV9wNWtZycnF
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 3DB1756ADF0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108159-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add the offsets and configuration tables to support USB4 and
Thunderbolt 3 operation on the USB4-capable PHYs found on Hamoa chips.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 200 ++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h     |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h     |  15 ++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h |  45 +++++
 4 files changed, 256 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 898f42de4a08..0916d9a4599e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -235,6 +235,7 @@ static const unsigned int qmp_v6_n4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
 
 	[QPHY_PCS_CLAMP_ENABLE]		= QPHY_V6_PCS_AON_CLAMP_ENABLE,
+	[QPHY_PCS_USB4_CLAMP_ENABLE]	= QPHY_V6_PCS_AON_USB4_CLAMP_ENABLE,
 
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V6_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]	= QSERDES_V6_COM_C_READY_STATUS,
@@ -1812,7 +1813,85 @@ static const struct qmp_phy_init_tbl sc8280xp_usb43dp_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
 };
 
-static const struct qmp_phy_init_tbl x1e80100_usb43dp_serdes_tbl[] = {
+static const struct qmp_phy_init_tbl x1e80100_usb4_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0xd9),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE1, 0xb2),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_BUF_ENABLE, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_CFG, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x43),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x86),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MSB_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE1, 0xa7),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE0, 0xba),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE1, 0x3c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_HS_SWITCH_SEL_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CORE_CLK_DIV_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORECLK_DIV_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x76),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0xb0),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO_MODE1, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_INTEGLOOP_GAIN0_MODE0, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_INTEGLOOP_GAIN0_MODE1, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_IPTRIM, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SVS_MODE_CLK_SEL, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_MODE, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_VCO_DC_LEVEL_CTRL, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADDITIONAL_MISC_2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_INITVAL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAXVAL2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_POST_DIV_MUX, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x0a),
+};
+
+static const struct qmp_phy_init_tbl x1e80100_usb4_tb3_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x54),
+};
+
+static const struct qmp_phy_init_tbl x1e80100_usb4_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_LANE_MODE_1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_LANE_MODE_2, 0x50),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_LANE_MODE_3, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RES_CODE_LANE_OFFSET_TX, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RES_CODE_LANE_OFFSET_RX, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH1_RATE210, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH1_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH2_RATE210, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH2_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH3_RATE210, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH3_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LDO_TIMER_CTRL, 0x03),
+};
+
+static const struct qmp_phy_init_tbl x1e80100_usb3dp_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x62),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x02),
@@ -1873,6 +1952,68 @@ static const struct qmp_phy_init_tbl x1e80100_usb43dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_RES_CODE_LANE_OFFSET_RX, 0x0a),
 };
 
+static const struct qmp_phy_init_tbl x1e80100_usb4_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_SIGDET_ENABLES, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE2_B0, 0xd3),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE2_B1, 0xee),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE2_B2, 0x58),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE2_B4, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE3_B0, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE3_B1, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE3_B2, 0xa2),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE3_B3, 0xdd),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE3_B4, 0x6a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE3_B5, 0xdb),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_MODE_RATE3_B6, 0xe3),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE2, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE2, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE3, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE3, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_PI_CTRL1, 0xd0),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_PI_CTRL2, 0x48),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_SB2_THRESH1_RATE3, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_SB2_GAIN2_RATE2, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_SB2_GAIN1_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_SB2_GAIN2_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_IVCM_CAL_CODE_OVERRIDE, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_RX_IVCM_CAL_CTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_RX_SUMMER_CAL_SPD_MODE, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DCC_CMUX_POSTCAL_OFFSET, 0x1d),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_FO_GAIN_RATE2, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_FO_GAIN_RATE3, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_SO_GAIN_RATE2, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_SO_GAIN_RATE3, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_PI_CONTROLS, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_FASTLOCK_FO_GAIN_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_FASTLOCK_SO_GAIN_RATE3, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_UCDR_SO_SATURATION, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_RX_IVCM_POSTCAL_OFFSET, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_VGA_CAL_CNTRL1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_VGA_CAL_MAN_VAL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_DAC_ENABLE1, 0x88),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_DAC_ENABLE2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_2, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_3, 0x45),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_TAP3_CTRL, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_TAP4_CTRL, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_TAP5_CTRL, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_GM_CAL, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_RX_OFFSET_ADAPTOR_CNTRL3, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_EOM_CTRL1, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_EOM_CTRL2, 0x21),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_TAP3_MANVAL_KTAP, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_TAP4_MANVAL_KTAP, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_DFE_TAP5_MANVAL_KTAP, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_VTHRESH_CAL_MAN_VAL_RATE3, 0x78),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_Q_PI_INTRINSIC_BIAS_RATE32, 0x27),
+	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_RX_BKUP_CTRL1, 0x14),
+};
+
 static const struct qmp_phy_init_tbl x1e80100_usb43dp_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_SIGDET_CNTRL, 0x04),
 	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
@@ -1911,6 +2052,23 @@ static const struct qmp_phy_init_tbl x1e80100_usb43dp_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_N4_RX_RX_BKUP_CTRL1, 0x14),
 };
 
+static const struct qmp_phy_init_tbl x1e80100_usb4_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_POWER_STATE_CONFIG3, 0x4f),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_LOCK_DETECT_CONFIG1, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_LOCK_DETECT_CONFIG2, 0xc0),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_RX_SIGDET_LVL, 0x55),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_PCS_PCS_TX_RX_CONFIG1, 0x51),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_EQ_CONFIG1, 0x2e),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_G3_EQ_CONFIG1, 0x4b),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_G3_EQ_CONFIG5, 0x1e),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_G2_FOM_EQ_CONFIG1, 0x83),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_G2_FOM_EQ_CONFIG3, 0x2e),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_G2_FOM_EQ_CONFIG5, 0x10),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_G3_FOM_EQ_CONFIG3, 0x25),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_G3_FOM_EQ_CONFIG5, 0x22),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB4_LPFS_TX_ECSTART, 0x0f),
+};
+
 static const struct qmp_phy_init_tbl x1e80100_usb43dp_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
 	QMP_PHY_INIT_CFG(QPHY_V6_N4_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
@@ -2429,6 +2587,23 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
 	.dp_dp_phy	= 0x2200,
 };
 
+static const struct qmp_combo_offsets qmp_combo_offsets_v6_n4 = {
+	.com		= 0x0000,
+	.usb3_pcs_aon	= 0x0100,
+	.txa		= 0x0400,
+	.rxa		= 0x0600,
+	.txb		= 0x0a00,
+	.rxb		= 0x0c00,
+	.usb3_serdes	= 0x1000,
+	.usb3_pcs_misc	= 0x1200,
+	.usb3_pcs	= 0x1400,
+	.usb3_pcs_usb	= 0x1700,
+	.dp_serdes	= 0x2000,
+	.dp_dp_phy	= 0x2200,
+	.usb4_serdes	= 0x3000,
+	.usb4_pcs	= 0x3400,
+};
+
 static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
 	.com		= 0x0000,
 	.txa		= 0x1400,
@@ -2689,11 +2864,11 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 	.regs			= qmp_v5_5nm_usb3phy_regs_layout,
 };
 
-static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
-	.offsets		= &qmp_combo_offsets_v5,
+static const struct qmp_phy_cfg x1e80100_usb43dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v6_n4,
 
-	.serdes_tbl		= x1e80100_usb43dp_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(x1e80100_usb43dp_serdes_tbl),
+	.serdes_tbl		= x1e80100_usb3dp_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(x1e80100_usb3dp_serdes_tbl),
 	.tx_tbl			= x1e80100_usb43dp_tx_tbl,
 	.tx_tbl_num		= ARRAY_SIZE(x1e80100_usb43dp_tx_tbl),
 	.rx_tbl			= x1e80100_usb43dp_rx_tbl,
@@ -2728,6 +2903,19 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
+	.usb4_serdes_tbl	= x1e80100_usb4_serdes_tbl,
+	.usb4_serdes_tbl_num	= ARRAY_SIZE(x1e80100_usb4_serdes_tbl),
+	.usb4_serdes_tb3_ovrd_tbl = x1e80100_usb4_tb3_serdes_tbl,
+	.usb4_serdes_tb3_ovrd_num = ARRAY_SIZE(x1e80100_usb4_tb3_serdes_tbl),
+
+	.usb4_tx_tbl		= x1e80100_usb4_tx_tbl,
+	.usb4_tx_tbl_num	= ARRAY_SIZE(x1e80100_usb4_tx_tbl),
+	.usb4_rx_tbl		= x1e80100_usb4_rx_tbl,
+	.usb4_rx_tbl_num	= ARRAY_SIZE(x1e80100_usb4_rx_tbl),
+
+	.usb4_pcs_tbl		= x1e80100_usb4_pcs_tbl,
+	.usb4_pcs_tbl_num	= ARRAY_SIZE(x1e80100_usb4_pcs_tbl),
+
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -5296,7 +5484,7 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
 	},
 	{
 		.compatible = "qcom,x1e80100-qmp-usb3-dp-phy",
-		.data = &x1e80100_usb3dpphy_cfg,
+		.data = &x1e80100_usb43dpphy_cfg,
 	},
 	{ }
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
index 52db31a7cf22..f19f461297b6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
@@ -8,5 +8,7 @@
 
 /* Only for QMP V6 PHY - PCS_AON registers */
 #define QPHY_V6_PCS_AON_CLAMP_ENABLE			0x00
+/* Valid only for USB43DP variants */
+#define QPHY_V6_PCS_AON_USB4_CLAMP_ENABLE		0x04
 
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
index df670143feb1..30fdb437146c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
@@ -14,4 +14,19 @@
 #define QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40
 #define QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x44
 
+#define QPHY_V6_PCS_USB4_POWER_STATE_CONFIG3		0x98
+#define QPHY_V6_PCS_USB4_LOCK_DETECT_CONFIG1		0xd0
+#define QPHY_V6_PCS_USB4_LOCK_DETECT_CONFIG2		0xd4
+#define QPHY_V6_PCS_USB4_RX_SIGDET_LVL			0x17c
+#define QPHY_V6_PCS_USB4_PCS_PCS_TX_RX_CONFIG1		0x1a8
+#define QPHY_V6_PCS_USB4_EQ_CONFIG1			0x1b8
+#define QPHY_V6_PCS_USB4_G3_EQ_CONFIG1			0x1d8
+#define QPHY_V6_PCS_USB4_G3_EQ_CONFIG5			0x1e8
+#define QPHY_V6_PCS_USB4_G2_FOM_EQ_CONFIG1		0x1f4
+#define QPHY_V6_PCS_USB4_G2_FOM_EQ_CONFIG3		0x1fc
+#define QPHY_V6_PCS_USB4_G2_FOM_EQ_CONFIG5		0x204
+#define QPHY_V6_PCS_USB4_G3_FOM_EQ_CONFIG3		0x210
+#define QPHY_V6_PCS_USB4_G3_FOM_EQ_CONFIG5		0x218
+#define QPHY_V6_PCS_USB4_LPFS_TX_ECSTART		0x220
+
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
index d37cc0d4fd36..e72ae2cb460a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h
@@ -23,27 +23,63 @@
 #define QSERDES_V6_N4_TX_TRAN_DRVR_EMP_EN		0xac
 #define QSERDES_V6_N4_TX_TX_BAND			0xd8
 #define QSERDES_V6_N4_TX_INTERFACE_SELECT		0xe4
+#define QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH1_RATE210	0xe8
+#define QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH1_RATE3	0xec
+#define QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH2_RATE210	0xf0
+#define QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH2_RATE3	0xf4
+#define QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH3_RATE210	0xf8
+#define QSERDES_V6_N4_TX_RX_MARG_COARSE_THRESH3_RATE3	0xfc
 #define QSERDES_V6_N4_TX_VMODE_CTRL1			0xb0
+#define QSERDES_V6_TX_LDO_TIMER_CTRL			0x120
 
 #define QSERDES_V6_N4_RX_UCDR_FO_GAIN_RATE2		0x8
+#define QSERDES_V6_N4_RX_UCDR_FO_GAIN_RATE3		0xc
+#define QSERDES_V6_N4_RX_UCDR_SO_GAIN_RATE3		0x1c
 #define QSERDES_V6_N4_RX_UCDR_SO_GAIN_RATE2		0x18
 #define QSERDES_V6_N4_RX_UCDR_PI_CONTROLS		0x20
+#define QSERDES_V6_N4_RX_EOM_CTRL1			0x44
+#define QSERDES_V6_N4_RX_EOM_CTRL2			0x48
 #define QSERDES_V6_N4_RX_IVCM_CAL_CODE_OVERRIDE		0x94
 #define QSERDES_V6_N4_RX_RX_IVCM_CAL_CTRL2		0x9c
 #define QSERDES_V6_N4_RX_RX_IVCM_POSTCAL_OFFSET		0xa0
+#define QSERDES_V6_N4_RX_DFE_1				0xac
+#define QSERDES_V6_N4_RX_DFE_2				0xb0
 #define QSERDES_V6_N4_RX_DFE_3				0xb4
+#define QSERDES_V6_N4_RX_DFE_TAP3_CTRL			0xbc
+#define QSERDES_V6_N4_RX_DFE_TAP3_MANVAL_KTAP		0xc0
+#define QSERDES_V6_N4_RX_DFE_TAP4_CTRL			0xc4
+#define QSERDES_V6_N4_RX_DFE_TAP4_MANVAL_KTAP		0xc8
+#define QSERDES_V6_N4_RX_DFE_TAP5_CTRL			0xcc
+#define QSERDES_V6_N4_RX_DFE_TAP5_MANVAL_KTAP		0xd0
 #define QSERDES_V6_N4_RX_VGA_CAL_CNTRL1			0xe0
 #define QSERDES_V6_N4_RX_VGA_CAL_MAN_VAL		0xe8
+#define QSERDES_V6_N4_RX_VTHRESH_CAL_MAN_VAL_RATE3	0x108
 #define QSERDES_V6_N4_RX_GM_CAL				0x10c
+#define QSERDES_V6_N4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1	0x13c
+#define QSERDES_V6_N4_RX_RX_OFFSET_ADAPTOR_CNTRL3	0x144
 #define QSERDES_V6_N4_RX_SIGDET_ENABLES			0x148
 #define QSERDES_V6_N4_RX_SIGDET_CNTRL			0x14c
 #define QSERDES_V6_N4_RX_SIGDET_DEGLITCH_CNTRL		0x154
 #define QSERDES_V6_N4_RX_DFE_CTLE_POST_CAL_OFFSET	0x194
+#define QSERDES_V6_N4_RX_DCC_CMUX_POSTCAL_OFFSET	0x1a8
 #define QSERDES_V6_N4_RX_Q_PI_INTRINSIC_BIAS_RATE32	0x1dc
+#define QSERDES_V6_N4_RX_UCDR_FASTLOCK_FO_GAIN_RATE3	0x200
+#define QSERDES_V6_N4_RX_UCDR_FASTLOCK_SO_GAIN_RATE3	0x210
+#define QSERDES_V6_N4_RX_UCDR_SO_SATURATION		0x214
+#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE1	0x224
+#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE1	0x228
+#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE2	0x22c
+#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE2	0x230
+#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_LOW_RATE3	0x234
+#define QSERDES_V6_N4_TX_UCDR_FASTLOCK_COUNTER_HIGH_RATE3	0x238
 #define QSERDES_V6_N4_RX_UCDR_PI_CTRL1			0x23c
 #define QSERDES_V6_N4_RX_UCDR_PI_CTRL2			0x240
+#define QSERDES_V6_N4_RX_UCDR_SB2_THRESH1_RATE3		0x250
+#define QSERDES_V6_N4_RX_UCDR_SB2_GAIN1_RATE3		0x270
 #define QSERDES_V6_N4_RX_UCDR_SB2_GAIN2_RATE2		0x27c
+#define QSERDES_V6_N4_RX_UCDR_SB2_GAIN2_RATE3		0x280
 #define QSERDES_V6_N4_RX_DFE_DAC_ENABLE1		0x298
+#define QSERDES_V6_N4_RX_DFE_DAC_ENABLE2		0x29c
 #define QSERDES_V6_N4_RX_MODE_RATE_0_1_B0		0x2b8
 #define QSERDES_V6_N4_RX_MODE_RATE_0_1_B1		0x2bc
 #define QSERDES_V6_N4_RX_MODE_RATE_0_1_B2		0x2c0
@@ -58,6 +94,15 @@
 #define QSERDES_V6_N4_RX_MODE_RATE2_B4			0x2e4
 #define QSERDES_V6_N4_RX_MODE_RATE2_B5			0x2e8
 #define QSERDES_V6_N4_RX_MODE_RATE2_B6			0x2ec
+
+#define QSERDES_V6_N4_RX_MODE_RATE3_B0			0x2f0
+#define QSERDES_V6_N4_RX_MODE_RATE3_B1			0x2f4
+#define QSERDES_V6_N4_RX_MODE_RATE3_B2			0x2f8
+#define QSERDES_V6_N4_RX_MODE_RATE3_B3			0x2fc
+#define QSERDES_V6_N4_RX_MODE_RATE3_B4			0x300
+#define QSERDES_V6_N4_RX_MODE_RATE3_B5			0x304
+#define QSERDES_V6_N4_RX_MODE_RATE3_B6			0x308
+
 #define QSERDES_V6_N4_RX_RX_SUMMER_CAL_SPD_MODE		0x30c
 #define QSERDES_V6_N4_RX_RX_BKUP_CTRL1			0x310
 

-- 
2.54.0


