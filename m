Return-Path: <linux-arm-msm+bounces-118041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aMD1JIG2T2qbnAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:56:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A0D732857
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:56:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QNMaiOKl;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118041-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118041-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7ED3E3073ED2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 14:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901D73E3D8C;
	Thu,  9 Jul 2026 14:52:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0D93C4546;
	Thu,  9 Jul 2026 14:52:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608744; cv=none; b=QkfO2+bWKi/dz1Byefmfy8B1Zz5weSuAMYB/mNJT1phUyeioE+QxzuCbGRp2L2IVzp1tbQG8oufYdWfmih+NOii/y9H4q0G1LRL2sJeEF8RfITfcdNuuiQcP/6logKyn9f7yyCCndNDfzky5STn4wo81pJel6gbf1HXCPKJr33Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608744; c=relaxed/simple;
	bh=S89o8thyy4R7y0vl6MhKpS8rOEUQSxGyP9ahFA+5OTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BUfLwd8VaBl0qHajFKX13o0i8b9CtLeBnbDMC5XIajIcHvRAbBsewuKIgg4f/NE26hj4J3+kpmTzO3CJXasdkz2STT29uF38KOL2UNEitHVFHk0KNvjB6xE1KFGwwRHSM0+sxO9DedZUjldCvHccdy2TtHFOpVeL33Vy4wmMujo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QNMaiOKl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5AB1F000E9;
	Thu,  9 Jul 2026 14:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783608742;
	bh=kPpfLWK7GZV22ZiG2NIQmu1C2IHKk82G2KY81WwAbBM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QNMaiOKlMDl4ceuxKymeZQqaD082at//FsgJ3FPVff75M9IRqI3Ax4WUL8uHs7MCT
	 anqlcE2m7DD/1FJwff9Vs18205VLahMvI66L/tlTBTyhLfjI6L2l705OOaaPQH7+ON
	 Xg78EmK9hqE7pCo1YN0ypB8upYDN2ERk4wqTCuMbUUwSOikAWuxsdLdI4IJpZED68G
	 gkGFaA0ceP2b2JRxGbPkESnFN6E/Uxh4Za6yKRcLYTFr3i/F7Chu1nvzsJL+mkSFde
	 wnLVrTXcpwbzulnRwsgfG2V8J7uOMKfLW95O1nrejYRCOoB21isvE4YuHfc25tEe23
	 WTO/+/AbqBeHg==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Thu, 09 Jul 2026 16:52:10 +0200
Subject: [PATCH v2 2/2] phy: qcom: qmp-usb: Add support for SA8255P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-phy-qcom-qmp-usb-8255-v2-2-3b6c26a45788@kernel.org>
References: <20260709-phy-qcom-qmp-usb-8255-v2-0-3b6c26a45788@kernel.org>
In-Reply-To: <20260709-phy-qcom-qmp-usb-8255-v2-0-3b6c26a45788@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Sriram Dash <quic_sriramd@quicinc.com>, 
 Shazad Hussain <quic_shazhuss@quicinc.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10001;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=R/z0y5/HrZRHfrps+nwXnb+g5O7GiVCXS9FwUwT1qT8=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqT7We5/0AAdehnaq6h3wIpf32fmJOK0K66Y4aS
 TsLXol0nkCJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCak+1ngAKCRAZDR20Zk4Z
 NdD/CAC0HR9xOAU2ehkJ9tV0uDqMHH6+xl4bKKDP85ubW5f0LEDL2acKC/d+o3craCVZmfUGnNA
 UuRivYNwSkoIt1CyBU2xoBzh61KxiWjqfIlbJl23NwEqGDNxuAQX/+uV1/2UtQQhVS6BAJoMfq4
 JRQiBYSclmeH39NYLDTP3jkP3ZnLMny2Ea2LhBSj8Laj2Zu0DS+rSoeSBSYNq4Okyz7dHH66C49
 XZ1iAvchr+vXVOMvvsiTD/Zooz+lQptfsMbL9+HrYZWV75GBDEu7KBJWLbMpSsJiJH2IDys9l1S
 ixShS6BUVEc1SZssgJy9iwUQ+mnEXp/NY1MT203OyGAbEvYx
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118041-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mripard@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mkorpershoek@kernel.org,m:quic_sriramd@quicinc.com,m:quic_shazhuss@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mkorpershoek@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkorpershoek@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,quicinc.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3A0D732857

From: Sriram Dash <quic_sriramd@quicinc.com>

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

Power domain "usb_core" controls the GDSC, resets, and TLMM (GPIOs)
whereas power domain "usb_transfer" controls clocks and interconnects.

In this variant, two disjoint sets of resources are modeled against
the power domain suppliers which can be turned on/off to achieve modeled
device states. Two modeled low power states d1 and d3 are supported.

transition: d0 <--> d3  :: both core and transfer suppliers
transition: d0 <--> d1  :: only transfer supplier

Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 182 ++++++++++++++++++++++++++++----
 1 file changed, 160 insertions(+), 22 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index c5507168e135..d085c1ad7fb5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -15,6 +15,7 @@
 #include <linux/of_address.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -1411,6 +1412,9 @@ struct qmp_phy_cfg {
 
 	/* Offset from PCS to PCS_USB region */
 	unsigned int pcs_usb_offset;
+
+	/* true, if the device resources are fw managed */
+	bool fw_managed;
 };
 
 struct qmp_usb {
@@ -1437,6 +1441,8 @@ struct qmp_usb {
 	struct phy *phy;
 
 	struct clk_fixed_rate pipe_clk_fixed;
+
+	struct dev_pm_domain_list *pd_list;
 };
 
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
@@ -1667,6 +1673,25 @@ static const struct qmp_phy_cfg qcs8300_usb3_uniphy_cfg = {
 	.regs			= qmp_v5_usb3phy_regs_layout,
 };
 
+static const struct qmp_phy_cfg sa8255p_usb3_uniphy_cfg = {
+	.offsets		= &qmp_usb_offsets_v5,
+
+	.serdes_tbl		= sc8280xp_usb3_uniphy_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sc8280xp_usb3_uniphy_serdes_tbl),
+	.tx_tbl			= sc8280xp_usb3_uniphy_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sc8280xp_usb3_uniphy_tx_tbl),
+	.rx_tbl			= sc8280xp_usb3_uniphy_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sc8280xp_usb3_uniphy_rx_tbl),
+	.pcs_tbl		= sa8775p_usb3_uniphy_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sa8775p_usb3_uniphy_pcs_tbl),
+	.pcs_usb_tbl		= sa8775p_usb3_uniphy_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(sa8775p_usb3_uniphy_pcs_usb_tbl),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= qmp_v5_usb3phy_regs_layout,
+	.fw_managed		= true,
+};
+
 static const struct qmp_phy_cfg sc8280xp_usb3_uniphy_cfg = {
 	.offsets		= &qmp_usb_offsets_v5,
 
@@ -1865,6 +1890,77 @@ static const struct qmp_phy_cfg glymur_usb3_uniphy_cfg = {
 	.regs			= qmp_v7_usb3phy_regs_layout,
 };
 
+static int qmp_usb_domain_attach(struct qmp_usb *qmp)
+{
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_flags       = PD_FLAG_NO_DEV_LINK,
+		.pd_names       = (const char *[]) { "usb_transfer", "usb_core" },
+		.num_pd_names   = 2,
+	};
+	struct device *dev = qmp->dev;
+	int ret;
+
+	ret = dev_pm_domain_attach_list(dev, &pd_data, &qmp->pd_list);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "domain attach failed\n");
+
+	return 0;
+}
+
+static void qmp_usb_domain_detach(void *data)
+{
+	struct qmp_usb *qmp = data;
+
+	dev_pm_domain_detach_list(qmp->pd_list);
+}
+
+/* d3_to_d0 transition by turning on all the suppliers */
+static int qmp_usb_d3_to_d0(struct qmp_usb *qmp)
+{
+	int ret;
+
+	if (!qmp->pd_list)
+		return 0;
+
+	ret = pm_runtime_resume_and_get(qmp->pd_list->pd_devs[0]);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(qmp->pd_list->pd_devs[1]);
+	if (ret)
+		pm_runtime_put_sync(qmp->pd_list->pd_devs[0]);
+
+	return ret;
+}
+
+/* d0_to_d3 transition by turning off all the suppliers */
+static void qmp_usb_d0_to_d3(struct qmp_usb *qmp)
+{
+	if (!qmp->pd_list)
+		return;
+
+	pm_runtime_put_sync(qmp->pd_list->pd_devs[1]);
+	pm_runtime_put_sync(qmp->pd_list->pd_devs[0]);
+}
+
+/* d1_to_d0 transition by turning on the 'transfer' supplier */
+static int qmp_usb_d1_to_d0(struct qmp_usb *qmp)
+{
+	if (!qmp->pd_list)
+		return 0;
+
+	return pm_runtime_resume_and_get(qmp->pd_list->pd_devs[0]);
+}
+
+/* d0_to_d1 transition by turning off the 'transfer' supplier */
+static void qmp_usb_d0_to_d1(struct qmp_usb *qmp)
+{
+	if (!qmp->pd_list)
+		return;
+
+	pm_runtime_put_sync(qmp->pd_list->pd_devs[0]);
+}
+
 static int qmp_usb_serdes_init(struct qmp_usb *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -1884,10 +1980,16 @@ static int qmp_usb_init(struct phy *phy)
 	void __iomem *pcs = qmp->pcs;
 	int ret;
 
+	ret = qmp_usb_d3_to_d0(qmp);
+	if (ret < 0) {
+		dev_err(qmp->dev, "Failed to transition to d0 state\n");
+		return ret;
+	}
+
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
 	if (ret) {
 		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
-		return ret;
+		goto err_transition_to_d3;
 	}
 
 	ret = reset_control_bulk_assert(qmp->num_resets, qmp->resets);
@@ -1914,6 +2016,8 @@ static int qmp_usb_init(struct phy *phy)
 	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
+err_transition_to_d3:
+	qmp_usb_d0_to_d3(qmp);
 
 	return ret;
 }
@@ -1929,6 +2033,8 @@ static int qmp_usb_exit(struct phy *phy)
 
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
+	qmp_usb_d0_to_d3(qmp);
+
 	return 0;
 }
 
@@ -2111,6 +2217,8 @@ static int __maybe_unused qmp_usb_runtime_suspend(struct device *dev)
 	clk_disable_unprepare(qmp->pipe_clk);
 	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
+	qmp_usb_d0_to_d1(qmp);
+
 	return 0;
 }
 
@@ -2126,14 +2234,23 @@ static int __maybe_unused qmp_usb_runtime_resume(struct device *dev)
 		return 0;
 	}
 
+	ret = qmp_usb_d1_to_d0(qmp);
+	if (ret < 0) {
+		dev_err(qmp->dev, "Failed to transition to d0 state\n");
+		return ret;
+	}
+
 	ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
-	if (ret)
+	if (ret) {
+		qmp_usb_d0_to_d1(qmp);
 		return ret;
+	}
 
 	ret = clk_prepare_enable(qmp->pipe_clk);
 	if (ret) {
 		dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
 		clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
+		qmp_usb_d0_to_d1(qmp);
 		return ret;
 	}
 
@@ -2313,10 +2430,12 @@ static int qmp_usb_parse_dt_legacy(struct qmp_usb *qmp, struct device_node *np)
 		qmp->pcs_misc = NULL;
 	}
 
-	qmp->pipe_clk = devm_get_clk_from_child(dev, np, NULL);
-	if (IS_ERR(qmp->pipe_clk)) {
-		return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
-				     "failed to get pipe clock\n");
+	if (!qmp->cfg->fw_managed) {
+		qmp->pipe_clk = devm_get_clk_from_child(dev, np, NULL);
+		if (IS_ERR(qmp->pipe_clk)) {
+			return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
+					     "failed to get pipe clock\n");
+		}
 	}
 
 	ret = devm_clk_bulk_get_all(qmp->dev, &qmp->clks);
@@ -2325,10 +2444,12 @@ static int qmp_usb_parse_dt_legacy(struct qmp_usb *qmp, struct device_node *np)
 
 	qmp->num_clks = ret;
 
-	ret = qmp_usb_reset_init(qmp, usb3phy_legacy_reset_l,
-				 ARRAY_SIZE(usb3phy_legacy_reset_l));
-	if (ret)
-		return ret;
+	if (!qmp->cfg->fw_managed) {
+		ret = qmp_usb_reset_init(qmp, usb3phy_legacy_reset_l,
+					 ARRAY_SIZE(usb3phy_legacy_reset_l));
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
@@ -2362,17 +2483,19 @@ static int qmp_usb_parse_dt(struct qmp_usb *qmp)
 	if (ret)
 		return ret;
 
-	qmp->pipe_clk = devm_clk_get(dev, "pipe");
-	if (IS_ERR(qmp->pipe_clk)) {
-		return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
-				     "failed to get pipe clock\n");
+	if (!qmp->cfg->fw_managed) {
+		qmp->pipe_clk = devm_clk_get(dev, "pipe");
+		if (IS_ERR(qmp->pipe_clk)) {
+			return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
+					     "failed to get pipe clock\n");
+		}
+
+		ret = qmp_usb_reset_init(qmp, usb3phy_reset_l,
+					 ARRAY_SIZE(usb3phy_reset_l));
+		if (ret)
+			return ret;
 	}
 
-	ret = qmp_usb_reset_init(qmp, usb3phy_reset_l,
-				 ARRAY_SIZE(usb3phy_reset_l));
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
@@ -2395,6 +2518,16 @@ static int qmp_usb_probe(struct platform_device *pdev)
 	if (!qmp->cfg)
 		return -EINVAL;
 
+	if (qmp->cfg->fw_managed) {
+		ret = qmp_usb_domain_attach(qmp);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev, qmp_usb_domain_detach, qmp);
+		if (ret)
+			return ret;
+	}
+
 	ret = devm_regulator_bulk_get_const(dev, qmp->cfg->num_vregs,
 					qmp->cfg->vreg_list, &qmp->vregs);
 	if (ret)
@@ -2421,9 +2554,11 @@ static int qmp_usb_probe(struct platform_device *pdev)
 	 */
 	pm_runtime_forbid(dev);
 
-	ret = phy_pipe_clk_register(qmp, np);
-	if (ret)
-		goto err_node_put;
+	if (!qmp->cfg->fw_managed) {
+		ret = phy_pipe_clk_register(qmp, np);
+		if (ret)
+			goto err_node_put;
+	}
 
 	qmp->phy = devm_phy_create(dev, np, &qmp_usb_phy_ops);
 	if (IS_ERR(qmp->phy)) {
@@ -2470,6 +2605,9 @@ static const struct of_device_id qmp_usb_of_match_table[] = {
 	}, {
 		.compatible = "qcom,qdu1000-qmp-usb3-uni-phy",
 		.data = &qdu1000_usb3_uniphy_cfg,
+	}, {
+		.compatible = "qcom,sa8255p-qmp-usb3-uni-phy",
+		.data = &sa8255p_usb3_uniphy_cfg,
 	}, {
 		.compatible = "qcom,sa8775p-qmp-usb3-uni-phy",
 		.data = &sa8775p_usb3_uniphy_cfg,

-- 
2.54.0


