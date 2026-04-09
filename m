Return-Path: <linux-arm-msm+bounces-102487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDVaBRCV12mGPwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 14:01:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C66333C9FE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 14:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A6113033F0D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 11:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3933C3452;
	Thu,  9 Apr 2026 11:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/QKIivU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797083C343F;
	Thu,  9 Apr 2026 11:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735871; cv=none; b=LYKNXC6CgCRjkwI4obkhl9wwCJMF9XfjTsshLijH2wvnQBd+mSMaMQ/gedu3A+h3terw54zooeP4xGhNd14Vm2vfM0aLhltKRuyDCEhAYs2NV99LccvMfMXyXCKVSRe9/bxZ4DanBaF/sb4TO2RQ9mvvezncmDubb3yIEMFtM6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735871; c=relaxed/simple;
	bh=DA0NkvvgdwZQ6nEqdoZX7mvZkVs3uTDY2bfvL+lIIMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hx3YbzM+Sy8SgmaNXfItX1qrfhHzwLyW6nxAd0WbjB1UKSFtYQsuPFVsSMOivYTjljR+8TGGIyk7ceFR2Fn7vZLSEGQZ0Z/gYrI7SrB2gaWIQFQAVoWaTZ7L2fHO6/4qP9rXJStrlqNtE0EEwKHheMGBUO738Uj8EIwVRKVXGGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/QKIivU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C62C2BC9E;
	Thu,  9 Apr 2026 11:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775735871;
	bh=DA0NkvvgdwZQ6nEqdoZX7mvZkVs3uTDY2bfvL+lIIMU=;
	h=From:Date:Subject:To:Cc:From;
	b=S/QKIivUGkI2kk9eucdS7YaW2QV4t9QhBmc0He3JhcZuXl1XvCLNzTDDdOlAmQtEu
	 nEdq4Edp9AUYj6Qv8sfNqNKjoXHTWzKDFzQVprsev94p6xjLzUDBhvLoDhPQZTKOKR
	 6VfRmyRg0fggZ90zWtOT9m4ipA2ainpc0mzwbys42OARo+TNMntslkAKyuGqdCJPGB
	 HzhUckAbEn5P3/3IOw0XL39V65knpRQ8QYGMh8ycNeyE68qeFYb0oYV00ZoY8bZEaM
	 IlcG6HWeK/ctU7gkDbyYciP7NhRqM0/CWCEKs/SN4DVbC9iEVUQPPla7A/163nz5vz
	 iKR25xhGqsEZA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 09 Apr 2026 13:57:45 +0200
Subject: [PATCH] clk: qcom: regmap-phy-mux: Rework the implementation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-topic-phy_fastclk-v1-1-6b4aaee56b90@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avIrBNM7PcqEWE21VCYqEQR3T1p+
 S3eeyCgJwzQsgc8nhTosAl5xsCs2i7IaUoGKWQplGh4PBwZ7tZ7mHWIZt94I4taKzFWBU6QOud
 xput/dv37fuo0ubdjAAAA
X-Change-ID: 20260409-topic-phy_fastclk-9258a40b75ed
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: usb4-upstream@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775735867; l=3710;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ZBunsSWP7UvmxeurBAj7ASuxpfk0/UhcgP555CC0X1w=;
 b=50JWlCfgsLJRHES2GGnk90UliCnYXrCtVtj8N8kOiq6nLYupU9WA0apXc9a/S9sWWMIa6z/5/
 JWJnxpWYy/TDwbSthIN42n1OP1HU2r9lsCS2XyiMZgU/yERZkM1Rfbe
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RSPAMD_URIBL_FAIL(0.00)[qualcomm.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102487-lists,linux-arm-msm=lfdr.de];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.7.a.0.0.1.0.0.e.9.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[konrad.dybcio.oss.qualcomm.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: C66333C9FE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The sole reason this hw exists is to let the branch clock downstream of
it keep running, with the PHY disengaged. This is not possible with the
current implementation, as the enabled status is hijacked to mean
"enabled" = "use fast/PHY source" and "disabled" = "use XO source".

This is an issue, since the mux enable state follows that of the child
branch, making the desired "child enabled, MUX @ XO" combination
impossible.

Solve that by implementing ratesetting. Because PHY clock rates may
change at runtime and aren't really deterministic from Linux, assume
ULONG_MAX as "fast clock" and 19.2 MHz as XO. All the branches in
question already set CLK_SET_RATE_PARENT, so everything works out.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-regmap-phy-mux.c | 58 +++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/qcom/clk-regmap-phy-mux.c b/drivers/clk/qcom/clk-regmap-phy-mux.c
index 7b7243b7107d..b7d1c69d62f7 100644
--- a/drivers/clk/qcom/clk-regmap-phy-mux.c
+++ b/drivers/clk/qcom/clk-regmap-phy-mux.c
@@ -15,48 +15,66 @@
 #define PHY_MUX_PHY_SRC		0
 #define PHY_MUX_REF_SRC		2
 
+#define XO_RATE			19200000UL
+
 static inline struct clk_regmap_phy_mux *to_clk_regmap_phy_mux(struct clk_regmap *clkr)
 {
 	return container_of(clkr, struct clk_regmap_phy_mux, clkr);
 }
 
-static int phy_mux_is_enabled(struct clk_hw *hw)
+static unsigned long phy_mux_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 {
 	struct clk_regmap *clkr = to_clk_regmap(hw);
 	struct clk_regmap_phy_mux *phy_mux = to_clk_regmap_phy_mux(clkr);
-	unsigned int val;
+	u32 val;
 
 	regmap_read(clkr->regmap, phy_mux->reg, &val);
-	val = FIELD_GET(PHY_MUX_MASK, val);
 
-	WARN_ON(val != PHY_MUX_PHY_SRC && val != PHY_MUX_REF_SRC);
-
-	return val == PHY_MUX_PHY_SRC;
+	switch (FIELD_GET(PHY_MUX_MASK, val)) {
+	case PHY_MUX_PHY_SRC:
+		return ULONG_MAX;
+	case PHY_MUX_REF_SRC:
+		return XO_RATE;
+	default:
+		return 0;
+	}
 }
 
-static int phy_mux_enable(struct clk_hw *hw)
+static int phy_mux_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	if (req->rate == XO_RATE || req->rate == ULONG_MAX)
+		return 0;
+
+	return -EINVAL;
+}
+
+static int phy_mux_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
 {
 	struct clk_regmap *clkr = to_clk_regmap(hw);
 	struct clk_regmap_phy_mux *phy_mux = to_clk_regmap_phy_mux(clkr);
+	u32 val;
 
-	return regmap_update_bits(clkr->regmap, phy_mux->reg,
-				  PHY_MUX_MASK,
-				  FIELD_PREP(PHY_MUX_MASK, PHY_MUX_PHY_SRC));
-}
-
-static void phy_mux_disable(struct clk_hw *hw)
-{
-	struct clk_regmap *clkr = to_clk_regmap(hw);
-	struct clk_regmap_phy_mux *phy_mux = to_clk_regmap_phy_mux(clkr);
+	switch (rate) {
+	case XO_RATE:
+		val = PHY_MUX_REF_SRC;
+		break;
+	case ULONG_MAX:
+		val = PHY_MUX_PHY_SRC;
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	regmap_update_bits(clkr->regmap, phy_mux->reg,
 			   PHY_MUX_MASK,
-			   FIELD_PREP(PHY_MUX_MASK, PHY_MUX_REF_SRC));
+			   FIELD_PREP(PHY_MUX_MASK, val));
+
+	return 0;
 }
 
 const struct clk_ops clk_regmap_phy_mux_ops = {
-	.enable = phy_mux_enable,
-	.disable = phy_mux_disable,
-	.is_enabled = phy_mux_is_enabled,
+	.recalc_rate = phy_mux_recalc_rate,
+	.determine_rate = phy_mux_determine_rate,
+	.set_rate = phy_mux_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_regmap_phy_mux_ops);

---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-topic-phy_fastclk-9258a40b75ed

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


