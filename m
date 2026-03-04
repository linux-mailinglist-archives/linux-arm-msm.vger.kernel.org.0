Return-Path: <linux-arm-msm+bounces-95433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIXRIEyDqGmYvAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:09:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2529D206E9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8450F301F392
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 19:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A82D28314E;
	Wed,  4 Mar 2026 19:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="FWLB7JfV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6C83D75C3
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 19:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772651338; cv=none; b=GhKBQ4mtVUwY03Q5XKJpLB/os56qCEQbLY5xwWcMQqtNX8Dr7EMdEDWwqWPRd8uDd4Ctfz9FF9N13d1KlqLzF9KeWHsut2K09JQtna3w1DMx8PxaFFKL6w4SSEwCytp3Ya0yRrdtqwWIORLtuhTPbP/bB/vbW0piLR6dR7EgEN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772651338; c=relaxed/simple;
	bh=9fourSTkhAQgs826lDee9RWvteRmPy4uNjN8cDjQdI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fOkYxGuWdOVHWmkIg9fh5bIT+LrQn4op3HIl0sJCIzh6YIggdwuW46tOUhkvxSUWYmJvJR8OwSUbVkly4RABA1nA1XwDlSVLBkxrvyJPW0bI2Bee+3JOMoz3CvteTPMSTfKviQGsctBd4DQxRtDqWk/IZ8uZKPDshPlBqkLvlaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=FWLB7JfV; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772651334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QWi/D71MzwCQILqzVZa58xbV1qWKBRrD+N8wo4wzvp4=;
	b=FWLB7JfVVzHFldVFEYMTdyggmlDcnB2bZ5K+JuBkBD5aj2xqENWGIs9tBVi3P0f8NiVHMn
	dku0FStjqqwBaR3BLCj0Y9gkLp60T9oNkrdeOAE982JEVDLZNCelZ0rkyPVAeEqIMKdLqe
	DMMTxbSVwjf3NoYv1HYcPPI5FAa0yMMNewvfaMx3zkL+NAYfQ+G2L+dwCBb6dJwkATRCmJ
	jdhZjP4LxElu6o0mvIpkLV04f2JEgFveTTByBSDH4IK2gj7rp5iHU+gQyLcnMYHEX/g+9O
	VFQ01zQf7e74QGNm1Yxow3/DR1/z2w9SZyldsoe1VoVSoTYC6WsMWwD7rxDs6w==
From: Val Packett <val@packett.cool>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Val Packett <val@packett.cool>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] phy: qcom: qmp-combo: Move pipe_clk on/off to common
Date: Wed,  4 Mar 2026 16:06:23 -0300
Message-ID: <20260304190827.176988-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 2529D206E9C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95433-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[packett.cool:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,packett.cool:dkim,packett.cool:email,packett.cool:mid,linaro.org:email]
X-Rspamd-Action: no action

Keep the USB pipe clock working when the phy is in DP-only mode, because
the dwc controller still needs it for USB 2.0 over the same Type-C port.

Tested with the BenQ RD280UA monitor which has a downstream-facing port
for data passthrough that's manually switchable between USB 2 and 3,
corresponding to 4-lane and 2-lane DP respectively.

Note: the suspend/resume callbacks were already gating the enable/disable
of this clock only on init_count and not usb_init_count!

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
v3: Pull suggestion/fix and R-b
v2: https://lore.kernel.org/all/20260228220634.22778-2-val@packett.cool/
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 93f1aa10d400..cdcfad2e86b1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3691,6 +3691,13 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 	if (ret)
 		goto err_assert_reset;
 
+	/* In DP-only mode, the pipe clk is still required for USB2 */
+	ret = clk_prepare_enable(qmp->pipe_clk);
+	if (ret) {
+		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
+		goto err_disable_clocks;
+	}
+
 	qphy_setbits(com, QPHY_V3_DP_COM_POWER_DOWN_CTRL, SW_PWRDN);
 
 	/* override hardware control for reset of qmp phy */
@@ -3749,6 +3756,8 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 
 	return 0;
 
+err_disable_clocks:
+	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 err_assert_reset:
 	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 err_disable_regulators:
@@ -3768,6 +3777,7 @@ static int qmp_combo_com_exit(struct qmp_combo *qmp, bool force)
 
 	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
+	clk_disable_unprepare(qmp->pipe_clk);
 	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
@@ -3871,12 +3881,6 @@ static int qmp_combo_usb_power_on(struct phy *phy)
 
 	qmp_configure(qmp->dev, serdes, cfg->serdes_tbl, cfg->serdes_tbl_num);
 
-	ret = clk_prepare_enable(qmp->pipe_clk);
-	if (ret) {
-		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
-		return ret;
-	}
-
 	/* Tx, Rx, and PCS configurations */
 	qmp_configure_lane(qmp->dev, tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
 	qmp_configure_lane(qmp->dev, tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
@@ -3922,8 +3926,6 @@ static int qmp_combo_usb_power_off(struct phy *phy)
 	struct qmp_combo *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-	clk_disable_unprepare(qmp->pipe_clk);
-
 	/* PHY reset */
 	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
-- 
2.52.0


