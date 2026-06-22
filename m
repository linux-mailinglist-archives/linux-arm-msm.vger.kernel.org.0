Return-Path: <linux-arm-msm+bounces-113968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VaUPJXoSOWpXmQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:46:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DA36AED0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:46:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Lr98dekk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113968-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113968-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15BA4302AE27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 10:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE9A2E1746;
	Mon, 22 Jun 2026 10:46:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EA425A2DD;
	Mon, 22 Jun 2026 10:46:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782125174; cv=none; b=olmnBxy3pgthC14SJ4YPqU4u4u2bWl0CK9mCy0HYXZnOqCmcigWO28t1tx7lqxzAWskRM2idPlA9XjcllynijGE6DlRNHjPyoPnwUcWF6nkdKyiAazotL3xdCUv2hleV+PkEv/ufJ88xRezuUC6VQSluwnGOcDML3D7swqFvaUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782125174; c=relaxed/simple;
	bh=hMDAgLe7cDer6nzvqmXg9ylcO6Ix4RJZqoVohhfsUfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=diMTXjn4cuy+f8PPxhOH6hm+7iAwRrgTSOhERZhVQdoFowsp/g+Yo5rWWOp35+LiOfS3jmTC5rn62jMGU4T8aEEWhUwy1KzHSM+sKpkJ2nKr39EnljrR9E1a+7QAMSBmJw5pgMftXrPxwwgwEQn7DTD/mxb1M1zWzIGRC+RADi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lr98dekk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5D91F000E9;
	Mon, 22 Jun 2026 10:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782125173;
	bh=vA8TsApoYifboONc/BviKOxLxdIYQW+iSoPtQoVWi4o=;
	h=From:Date:Subject:To:Cc;
	b=Lr98dekkNcYr0R3kUQrDXOfN81g6b+xfjCXEpbp1HRtL5Aq5itDClLgqZ8L2h34nY
	 jSUDNYpSNT766BkKSfYeF+0RiNTXrb+S1RKIPa8yR2uprb/npz5WOKlY64RXZDOQtK
	 zfABW2UBk29Q5aNDYcQj6RxLrIewvwmtWfRiDk5o8mD/y3FM5fLK72yI+zh3vinJ99
	 +S+xiP3drdXx9VW0bMrEvqD/wHPUzJf8wpD4YCIc3xVDTmJUEZ4Ab0G0el+Xeef/ES
	 HUv4CkFGFghyjz/+sMwV5anXflhCGPF/X87UKzKObrKmyhZfwDXd/XRFFEt1i8Ez40
	 Hi66PEyaZgJXw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 22 Jun 2026 12:46:05 +0200
Subject: [PATCH] Revert "clk: qcom: regmap-phy-mux: Rework the
 implementation"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-topic-phymux_revert-v1-1-f6ec85523840@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ7CIBBA4as0s5aEosWmVzGN4WeUMWlLgBoM4
 e5SXX6L9wpEDIQRpq5AwDdF2taG/tSBcWp9IiPbDIILyaUQLG2eDPPus+z53goMiV3UddBS2bM
 dEVrpAz4o/663+e+46xeadKyg1i+LjL0sdwAAAA==
X-Change-ID: 20260622-topic-phymux_revert-4a75b6ad3d8e
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782125169; l=3567;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=G52ORgWlRAy4sEcqY1Z6pWueSuJsz3m566Cs2dOALKQ=;
 b=EvZ4l0sU+5kwTl9swItPbccyA+3sUPm2WEdWTKq9cLNngw3e6Shbb3+S1ZSsIdMNWcBx6KcFu
 Qh1aN4CygmACn9Xs+i4VtbMdI4d1l53tGXfzbqPDKtiM6Kl0/Vow3/p
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113968-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4DA36AED0A

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This reverts commit e108373c54fbc844b7f541c6fd7ecb31772afd3c.

This has been reported to break PCIe on at least SM8350 and Eliza
platforms. I had originally tested this on Hamoa (X1E) where there were
no adverse effects. It's highly likely that this stems from a
difference in how the bootloader configures the clocks.

Revert the offending change to fix the issue in the immediate, with the
intent to revisit it in the upcoming cycle.

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reported-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-regmap-phy-mux.c | 58 ++++++++++++-----------------------
 1 file changed, 20 insertions(+), 38 deletions(-)

diff --git a/drivers/clk/qcom/clk-regmap-phy-mux.c b/drivers/clk/qcom/clk-regmap-phy-mux.c
index b7d1c69d62f7..7b7243b7107d 100644
--- a/drivers/clk/qcom/clk-regmap-phy-mux.c
+++ b/drivers/clk/qcom/clk-regmap-phy-mux.c
@@ -15,66 +15,48 @@
 #define PHY_MUX_PHY_SRC		0
 #define PHY_MUX_REF_SRC		2
 
-#define XO_RATE			19200000UL
-
 static inline struct clk_regmap_phy_mux *to_clk_regmap_phy_mux(struct clk_regmap *clkr)
 {
 	return container_of(clkr, struct clk_regmap_phy_mux, clkr);
 }
 
-static unsigned long phy_mux_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+static int phy_mux_is_enabled(struct clk_hw *hw)
 {
 	struct clk_regmap *clkr = to_clk_regmap(hw);
 	struct clk_regmap_phy_mux *phy_mux = to_clk_regmap_phy_mux(clkr);
-	u32 val;
+	unsigned int val;
 
 	regmap_read(clkr->regmap, phy_mux->reg, &val);
+	val = FIELD_GET(PHY_MUX_MASK, val);
 
-	switch (FIELD_GET(PHY_MUX_MASK, val)) {
-	case PHY_MUX_PHY_SRC:
-		return ULONG_MAX;
-	case PHY_MUX_REF_SRC:
-		return XO_RATE;
-	default:
-		return 0;
-	}
+	WARN_ON(val != PHY_MUX_PHY_SRC && val != PHY_MUX_REF_SRC);
+
+	return val == PHY_MUX_PHY_SRC;
 }
 
-static int phy_mux_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
-{
-	if (req->rate == XO_RATE || req->rate == ULONG_MAX)
-		return 0;
-
-	return -EINVAL;
-}
-
-static int phy_mux_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
+static int phy_mux_enable(struct clk_hw *hw)
 {
 	struct clk_regmap *clkr = to_clk_regmap(hw);
 	struct clk_regmap_phy_mux *phy_mux = to_clk_regmap_phy_mux(clkr);
-	u32 val;
 
-	switch (rate) {
-	case XO_RATE:
-		val = PHY_MUX_REF_SRC;
-		break;
-	case ULONG_MAX:
-		val = PHY_MUX_PHY_SRC;
-		break;
-	default:
-		return -EINVAL;
-	}
+	return regmap_update_bits(clkr->regmap, phy_mux->reg,
+				  PHY_MUX_MASK,
+				  FIELD_PREP(PHY_MUX_MASK, PHY_MUX_PHY_SRC));
+}
+
+static void phy_mux_disable(struct clk_hw *hw)
+{
+	struct clk_regmap *clkr = to_clk_regmap(hw);
+	struct clk_regmap_phy_mux *phy_mux = to_clk_regmap_phy_mux(clkr);
 
 	regmap_update_bits(clkr->regmap, phy_mux->reg,
 			   PHY_MUX_MASK,
-			   FIELD_PREP(PHY_MUX_MASK, val));
-
-	return 0;
+			   FIELD_PREP(PHY_MUX_MASK, PHY_MUX_REF_SRC));
 }
 
 const struct clk_ops clk_regmap_phy_mux_ops = {
-	.recalc_rate = phy_mux_recalc_rate,
-	.determine_rate = phy_mux_determine_rate,
-	.set_rate = phy_mux_set_rate,
+	.enable = phy_mux_enable,
+	.disable = phy_mux_disable,
+	.is_enabled = phy_mux_is_enabled,
 };
 EXPORT_SYMBOL_GPL(clk_regmap_phy_mux_ops);

---
base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
change-id: 20260622-topic-phymux_revert-4a75b6ad3d8e

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


