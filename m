Return-Path: <linux-arm-msm+bounces-94645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOHhLDpno2kkCgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 23:07:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 916D91C95F4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 23:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16D5D3002766
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 22:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D6038D000;
	Sat, 28 Feb 2026 22:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="YjkFqDs0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022762D837E;
	Sat, 28 Feb 2026 22:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772316469; cv=none; b=f7PWKaFlvx4H6BZPLEFCrrdeGk0vhMW726eRcwsBLxFcCWG85NKa1cy9CkeMI5ZMmI68+j9AB+D35T5f1Yn3hK+NtXKrCNl6RMIVBro2WsV/VU1nQFCkQQuc46GwYdIP0KFVNIV2j119GcJTjfkWIlTqNsWVLpfUJKaEeiK88EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772316469; c=relaxed/simple;
	bh=PS+i3OemeO6V+jJnDzdsDVy8uM7Ef4F73B2Hv8KC6qc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r7jOdmYX+Cazw/ZZXjbq8AfGppCOcUuMEB8rnP5xgT/PUH7W8lNPi3Pl4qT1jhICKYQCCXdab7VSSC1iv3J0asp71/bgDYXSaZsQkpJtvS4yUXpQj5dEfG9sbXh1jdIc01+opaBKDs8m5Dt8wNeg0nMlxKlThvQHp2zSTNOA+/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=YjkFqDs0; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772316463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V5AVxV03NAnElMqKItv7U4khI5BMEJHhDRtUcMyS+eo=;
	b=YjkFqDs0Pxqc6Amt9jN4cWcFSP9VFUm6lk1ITcE6ViWCH0FuiwyK304YH4BNvDZSx/LQmn
	vgAbnG7qp50XXKbxySTAEHWdQVq4L0p7bl2+NaMr5bFcwLk7ZmtGe8On7nz75K1PRphGlI
	o7eBfrzHkgkkf337+73WPGL18U6y4SgQpiwxzFMGmXs3Cfufc0zjvitVdE+sFwOmYTjGe7
	/f1nndsJNs9sisqlYghSgdfq+/IdXUMT42svEJPQ5jSgQdJv7HtHNrleQI2VX3MXlRRBpZ
	yraEcRL6l6V/b7/915pvJHKVAv6v2IOSYHkLtIJL1TrpvieLSi2mmfEuowWPjg==
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
Subject: [PATCH v2] phy: qcom: qmp-combo: Move pipe_clk on/off to common
Date: Sat, 28 Feb 2026 19:05:38 -0300
Message-ID: <20260228220634.22778-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94645-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[packett.cool:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:mid,packett.cool:dkim,packett.cool:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 916D91C95F4
X-Rspamd-Action: no action

Keep the USB pipe clock working when the phy is in DP-only mode, because
the dwc controller still needs it for USB 2.0 over the same Type-C port.

Tested with the BenQ RD280UA monitor which has a downstream-facing port
for data passthrough that's manually switchable between USB 2 and 3,
corresponding to 4-lane and 2-lane DP respectively.

Note: the suspend/resume callbacks were already gating the enable/disable
of this clock only on init_count and not usb_init_count!

Signed-off-by: Val Packett <val@packett.cool>
---
See https://lore.kernel.org/all/389ca5d3-a698-4dac-911c-39ba057e3d17@oss.qualcomm.com/ for more info.
BTW https://lore.kernel.org/all/20260205160240.748371-2-loic.poulain@oss.qualcomm.com/ helped with coldplug.

v2: Reorder disables as suggested
v1: https://lore.kernel.org/all/20250927093915.45124-2-val@packett.cool/
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 93f1aa10d400..28428a8d1192 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3691,6 +3691,13 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 	if (ret)
 		goto err_assert_reset;
 
+	/* In DP-only mode, the pipe clk is still required for USB2 */
+	ret = clk_prepare_enable(qmp->pipe_clk);
+	if (ret) {
+		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
+		return ret;
+	}
+
 	qphy_setbits(com, QPHY_V3_DP_COM_POWER_DOWN_CTRL, SW_PWRDN);
 
 	/* override hardware control for reset of qmp phy */
@@ -3768,6 +3775,7 @@ static int qmp_combo_com_exit(struct qmp_combo *qmp, bool force)
 
 	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
+	clk_disable_unprepare(qmp->pipe_clk);
 	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
@@ -3871,12 +3879,6 @@ static int qmp_combo_usb_power_on(struct phy *phy)
 
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
@@ -3922,8 +3924,6 @@ static int qmp_combo_usb_power_off(struct phy *phy)
 	struct qmp_combo *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-	clk_disable_unprepare(qmp->pipe_clk);
-
 	/* PHY reset */
 	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
-- 
2.52.0


