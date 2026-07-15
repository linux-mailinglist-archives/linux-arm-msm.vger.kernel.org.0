Return-Path: <linux-arm-msm+bounces-119165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id htVhM9wxV2rQHAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:08:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5D475B4B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:08:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=V2ORq5Om;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119165-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119165-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6285E30498C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71A6339705;
	Wed, 15 Jul 2026 07:07:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80D1331EAE;
	Wed, 15 Jul 2026 07:07:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099254; cv=none; b=Qoqal70P6wzPSN1ut4veMtM2TJ1wFuarHdL0KwLjS/GbGKqfA+e3bMbyfqe0qqgjzoIQzkvgdNfeQB6TSW+oMr+hK8qfsaKvKkEY+SRf8bYOKkmrIHz6kw8xGRf+2/0tKz0wbwDr5JJww52H20XN3pUZrjzw7Mhvn0UWc9Y233g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099254; c=relaxed/simple;
	bh=FDpYnwRtmcbV17Q4xx73jxmEu1o34piLsbK8kMgW2H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKHiwNpfZLbbKuXwWb0drctqJY7y/xj0OHM2joCtAhp4BEgchfCdTSNvYaIZzrEQgx52dtyguyeZwINHGv46iPjUZFunydcImQnf6zOHfkzNAypbwxw2cROQfaBO4FrpgJ/Uz/mhTC/GIKSfac/7LvDd2MLirWcyOCFEbR5xh14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2ORq5Om; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30082C2BCC7;
	Wed, 15 Jul 2026 07:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784099252;
	bh=FDpYnwRtmcbV17Q4xx73jxmEu1o34piLsbK8kMgW2H8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V2ORq5OmROZq/MutKakFVnnOOgVd+eYkBVdEQtvG2IzQ4QH7AmK+CNgMdw0ffngFP
	 DBlHWWQ7KDF4vznX/Gdd1B5+DxCl99Fk6hdOjqpbF5ylUrK9SDMNS/VHSZSHcyNXiJ
	 F8CelbaNU1NRdsHqpAJIZS6CtsU713KUeHFNX+AxlAnVsRYeEmA5dYuOb/W+ZLPItp
	 Z9ti4lP1FImOHpzgMMrXhbpwZ0hQzZFxqXB9eJt+Z1mszUszICgXkfn53WjAs9lepH
	 bN+XKCtQN+G4+pXoXrB1iOTxGYIg7tymPJu+v+Ay4l839aO92+6S4yE5drbwTbOgwe
	 ly+143NWqxjVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BCFC4450F;
	Wed, 15 Jul 2026 07:07:32 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Wed, 15 Jul 2026 03:06:55 -0400
Subject: [PATCH v2 2/3] phy: qcom: qmp-combo: Specify PLL version in
 qmp_v6_dp_serdes_tbl structs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-sm8475-bup-usbss-v2-2-2d8def39b190@proton.me>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
In-Reply-To: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784099250; l=9527;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=xM+iYx47hDJsnpSr2d5T8wt7Tbc8+U5gc/fVbCObSpg=;
 b=dpSwwbXivqqU+bDPWgA3zyKaYt0JIRtkKAGQsEXRLCG76OsgoZoeF6Eb2oIXq+g1WvDIFT4N9
 REGyOXwOORcCYDqkpgV5yuf4WHCNl7orZtQGDt2w9q0Jo2e9XSdCqbd
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119165-lists,linux-arm-msm=lfdr.de,esteuwu.proton.me];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:esteuwu@proton.me,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[esteuwu@proton.me];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,proton.me:mid,proton.me:email,proton.me:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C5D475B4B0

From: Esteban Urrutia <esteuwu@proton.me>

Two versions of PLLs for v6 PHYs exist: v1 and v1.1.
These tables only cover v1.1 PLLs.
For serdes, the difference between v1 and v1.1 PLLs is the value written to
the BG_TIMER register.
This register is set to 0x0e for v1 PLLs and 0x0a for v1.1 PLLs.
As reference, SM8550 and SM8650 SoCs use v1.1 PLLs.
For RBR/HBR/HBR2/HBR3, most values change.
Make this distinction clear to avoid confusion when adding support for SoCs
making use of v1 PLLs.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 90 +++++++++++++++----------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 9bd666ac2c49..36361ac02855 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1337,7 +1337,7 @@ static const struct qmp_phy_init_tbl qmp_v5_5nm_dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_5NM_TX_TX_BAND, 0x01),
 };
 
-static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl[] = {
+static const struct qmp_phy_init_tbl qmp_v6_dp_v1_1_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SVS_MODE_CLK_SEL, 0x15),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x3b),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYS_CLK_CTRL, 0x02),
@@ -1471,7 +1471,7 @@ static const struct qmp_phy_init_tbl qmp_v8_n3p_dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_RESTRIM_POST_CAL_OFFSET, 0x10),
 };
 
-static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_rbr[] = {
+static const struct qmp_phy_init_tbl qmp_v6_dp_v1_1_serdes_tbl_rbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x05),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x34),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0xc0),
@@ -1483,7 +1483,7 @@ static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_rbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0c),
 };
 
-static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_hbr[] = {
+static const struct qmp_phy_init_tbl qmp_v6_dp_v1_1_serdes_tbl_hbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x03),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x34),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0xc0),
@@ -1495,7 +1495,7 @@ static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_hbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0c),
 };
 
-static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_hbr2[] = {
+static const struct qmp_phy_init_tbl qmp_v6_dp_v1_1_serdes_tbl_hbr2[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x46),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0x00),
@@ -1507,7 +1507,7 @@ static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_hbr2[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x10),
 };
 
-static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_hbr3[] = {
+static const struct qmp_phy_init_tbl qmp_v6_dp_v1_1_serdes_tbl_hbr3[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x34),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0xc0),
@@ -2442,19 +2442,19 @@ static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
 	.pcs_usb_tbl		= sm8550_usb3_pcs_usb_tbl,
 	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8550_usb3_pcs_usb_tbl),
 
-	.dp_serdes_tbl		= qmp_v6_dp_serdes_tbl,
-	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl),
+	.dp_serdes_tbl		= qmp_v6_dp_v1_1_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl),
 	.dp_tx_tbl		= qmp_v6_dp_tx_tbl,
 	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_dp_tx_tbl),
 
-	.serdes_tbl_rbr		= qmp_v6_dp_serdes_tbl_rbr,
-	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_rbr),
-	.serdes_tbl_hbr		= qmp_v6_dp_serdes_tbl_hbr,
-	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr),
-	.serdes_tbl_hbr2	= qmp_v6_dp_serdes_tbl_hbr2,
-	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr2),
-	.serdes_tbl_hbr3	= qmp_v6_dp_serdes_tbl_hbr3,
-	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr3),
+	.serdes_tbl_rbr		= qmp_v6_dp_v1_1_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v6_dp_v1_1_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v6_dp_v1_1_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v6_dp_v1_1_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr3),
 
 	.swing_hbr_rbr		= &qmp_dp_v5_voltage_swing_hbr_rbr,
 	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
@@ -2852,19 +2852,19 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 	.pcs_usb_tbl		= sm8550_usb3_pcs_usb_tbl,
 	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8550_usb3_pcs_usb_tbl),
 
-	.dp_serdes_tbl		= qmp_v6_dp_serdes_tbl,
-	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl),
+	.dp_serdes_tbl		= qmp_v6_dp_v1_1_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl),
 	.dp_tx_tbl		= qmp_v6_dp_tx_tbl,
 	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_dp_tx_tbl),
 
-	.serdes_tbl_rbr		= qmp_v6_dp_serdes_tbl_rbr,
-	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_rbr),
-	.serdes_tbl_hbr		= qmp_v6_dp_serdes_tbl_hbr,
-	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr),
-	.serdes_tbl_hbr2	= qmp_v6_dp_serdes_tbl_hbr2,
-	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr2),
-	.serdes_tbl_hbr3	= qmp_v6_dp_serdes_tbl_hbr3,
-	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr3),
+	.serdes_tbl_rbr		= qmp_v6_dp_v1_1_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v6_dp_v1_1_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v6_dp_v1_1_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v6_dp_v1_1_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr3),
 
 	.swing_hbr_rbr		= &qmp_dp_v5_voltage_swing_hbr_rbr,
 	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
@@ -2897,19 +2897,19 @@ static const struct qmp_phy_cfg sm8650_usb3dpphy_cfg = {
 	.pcs_usb_tbl		= sm8550_usb3_pcs_usb_tbl,
 	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8550_usb3_pcs_usb_tbl),
 
-	.dp_serdes_tbl		= qmp_v6_dp_serdes_tbl,
-	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl),
+	.dp_serdes_tbl		= qmp_v6_dp_v1_1_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl),
 	.dp_tx_tbl		= qmp_v6_dp_tx_tbl,
 	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_dp_tx_tbl),
 
-	.serdes_tbl_rbr		= qmp_v6_dp_serdes_tbl_rbr,
-	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_rbr),
-	.serdes_tbl_hbr		= qmp_v6_dp_serdes_tbl_hbr,
-	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr),
-	.serdes_tbl_hbr2	= qmp_v6_dp_serdes_tbl_hbr2,
-	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr2),
-	.serdes_tbl_hbr3	= qmp_v6_dp_serdes_tbl_hbr3,
-	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr3),
+	.serdes_tbl_rbr		= qmp_v6_dp_v1_1_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v6_dp_v1_1_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v6_dp_v1_1_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v6_dp_v1_1_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr3),
 
 	.swing_hbr_rbr		= &qmp_dp_v6_voltage_swing_hbr_rbr,
 	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
@@ -2942,19 +2942,19 @@ static const struct qmp_phy_cfg sm8750_usb3dpphy_cfg = {
 	.pcs_usb_tbl		= sm8750_usb3_pcs_usb_tbl,
 	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8750_usb3_pcs_usb_tbl),
 
-	.dp_serdes_tbl		= qmp_v6_dp_serdes_tbl,
-	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl),
+	.dp_serdes_tbl		= qmp_v6_dp_v1_1_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl),
 	.dp_tx_tbl		= qmp_v6_dp_tx_tbl,
 	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_dp_tx_tbl),
 
-	.serdes_tbl_rbr		= qmp_v6_dp_serdes_tbl_rbr,
-	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_rbr),
-	.serdes_tbl_hbr		= qmp_v6_dp_serdes_tbl_hbr,
-	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr),
-	.serdes_tbl_hbr2	= qmp_v6_dp_serdes_tbl_hbr2,
-	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr2),
-	.serdes_tbl_hbr3	= qmp_v6_dp_serdes_tbl_hbr3,
-	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr3),
+	.serdes_tbl_rbr		= qmp_v6_dp_v1_1_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v6_dp_v1_1_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v6_dp_v1_1_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v6_dp_v1_1_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr3),
 
 	.swing_hbr_rbr		= &qmp_dp_v6_voltage_swing_hbr_rbr,
 	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,

-- 
2.55.0



