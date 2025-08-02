Return-Path: <linux-arm-msm+bounces-67501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 425C8B18DD8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 11:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3C0C3B2E11
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Aug 2025 09:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E3E1E9B35;
	Sat,  2 Aug 2025 09:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="FSGxzUVi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC2C22083
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Aug 2025 09:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754128590; cv=pass; b=VV5qVlljT39Fe0EKcqdU29bLkTM6TjVvHtghfNZvpizkDowIl2Yv82V5lZsX0w3B2Asj4BDnl3AlDwBgxafT4VKl9711fXYHQMpwRCsfNCWhHKW3UsDcHd+q3rSsD6QoYInU2Oa88HdbtGi095/eo8ciSsw05NrBrcOQ6UYm3Ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754128590; c=relaxed/simple;
	bh=c5R4BbjivtEw5x25pH8SE23ivPhM3q2JgCUr6ib1lbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VZR19vC79c1DQCr0ayp9ccd/tKwaczruAePqA/VWbbw1hl2onYf91fB1niCbU0eVG0XMsC8AVNRyjtrwfSLIdj/Q+5OZMT0o5E20WFo0aC9SYykmwblMAmp5C34SpnIFvfGRl+AL6DyeHGUHJbr+oAcUNxu26XfyTwqs1zccdl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=FSGxzUVi; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from localhost (dsl-hkibng22-50ddbb-117.dhcp.inet.fi [80.221.187.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: msmakela)
	by meesny.iki.fi (Postfix) with UTF8SMTPSA id 4bvJ9t0Rv1zyR6;
	Sat,  2 Aug 2025 12:56:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1754128578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5rSIM7n1VMOcZ5+k0Bnvx+n4JwSQCQm94ctQZA31EWw=;
	b=FSGxzUVizL4g0uCRVwHg/qe9BupJFoslpe99QsVT/aOyz9Aom3Ux1sa5L/p2G21EEOikPZ
	WW23TSUBISOfJsc009vp4uFs/ZIRmp/DRORFVAVPkkcJB0nQoItmlH00WM6804CvUH7oyJ
	7hmuCxT8RlygfY4+JqVcPCRJJDFBXmA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1754128578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5rSIM7n1VMOcZ5+k0Bnvx+n4JwSQCQm94ctQZA31EWw=;
	b=Fhi+YrarylOT4YvFBxjesThdNSW6wgLII/h7GALZ33DPaItDoG/Ff9lSUJVrbP6/1pfPAD
	vdYaKEVusspm7Fy5R1vgLmNKWK+aTJwW5/TEJvL9QrLhJLlER/+bsaguTLZuRuPn3kD37N
	FnHQg/sTG8pIhfXQyZv0PNedWQjIc9I=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1754128578; a=rsa-sha256; cv=none;
	b=vNuM0XcF0Rzt293LSSEl/vy6GJtG79XkgEYwKbohhlVGebnq7+rnbPYE0iujEdli4wqJMZ
	7neorQ7yy0j3Jz80Z3gD6/mB4v9BICG5ED9RSv3CaL5RlUbrXmw8gDUS6JhpTf19N69nOk
	X8I7KdTwUSs64Z3Slsf4J9IZu3KPUKA=
From: =?UTF-8?q?Marko=20M=C3=A4kel=C3=A4?= <marko.makela@iki.fi>
To: Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robimarko@gmail.com>,
	=?UTF-8?q?Marko=20M=C3=A4kel=C3=A4?= <marko.makela@iki.fi>
Subject: [PATCH] clk: qcom: gcc-ipq6018: rework nss_port5 clock to multiple conf
Date: Sat,  2 Aug 2025 12:55:46 +0300
Message-ID: <20250802095546.295448-1-marko.makela@iki.fi>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rework nss_port5 to use the new multiple configuration implementation
and correctly fix the clocks for this port under some corner case.

In OpenWrt, this patch avoids intermittent dmesg errors of the form
nss_port5_rx_clk_src: rcg didn't update its configuration.

This is a mechanical, straightforward port of
commit e88f03230dc07aa3293b6aeb078bd27370bb2594
("clk: qcom: gcc-ipq8074: rework nss_port5/6 clock to multiple conf")
to gcc-ipq6018, with two conflicts resolved: different frequency of the
P_XO clock source, and only 5 Ethernet ports.

This was originally developed by JiaY-shi <shi05275@163.com>.

Link: https://lore.kernel.org/all/20231220221724.3822-4-ansuelsmth@gmail.com/
Signed-off-by: Marko Mäkelä <marko.makela@iki.fi>
Tested-by: Marko Mäkelä <marko.makela@iki.fi>
---
 drivers/clk/qcom/gcc-ipq6018.c | 60 +++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
index d861191b0c85c..d4fc491a18b22 100644
--- a/drivers/clk/qcom/gcc-ipq6018.c
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -511,15 +511,23 @@ static struct clk_rcg2 apss_ahb_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_nss_port5_rx_clk_src[] = {
-	F(24000000, P_XO, 1, 0, 0),
-	F(25000000, P_UNIPHY1_RX, 12.5, 0, 0),
-	F(25000000, P_UNIPHY0_RX, 5, 0, 0),
-	F(78125000, P_UNIPHY1_RX, 4, 0, 0),
-	F(125000000, P_UNIPHY1_RX, 2.5, 0, 0),
-	F(125000000, P_UNIPHY0_RX, 1, 0, 0),
-	F(156250000, P_UNIPHY1_RX, 2, 0, 0),
-	F(312500000, P_UNIPHY1_RX, 1, 0, 0),
+static const struct freq_conf ftbl_nss_port5_rx_clk_src_25[] = {
+	C(P_UNIPHY1_RX, 12.5, 0, 0),
+	C(P_UNIPHY0_RX, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_port5_rx_clk_src_125[] = {
+	C(P_UNIPHY1_RX, 2.5, 0, 0),
+	C(P_UNIPHY0_RX, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_port5_rx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_port5_rx_clk_src_25),
+	FMS(78125000, P_UNIPHY1_RX, 4, 0, 0),
+	FM(125000000, ftbl_nss_port5_rx_clk_src_125),
+	FMS(156250000, P_UNIPHY1_RX, 2, 0, 0),
+	FMS(312500000, P_UNIPHY1_RX, 1, 0, 0),
 	{ }
 };
 
@@ -547,26 +555,34 @@ gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bias_map[] = {
 
 static struct clk_rcg2 nss_port5_rx_clk_src = {
 	.cmd_rcgr = 0x68060,
-	.freq_tbl = ftbl_nss_port5_rx_clk_src,
+	.freq_multi_tbl = ftbl_nss_port5_rx_clk_src,
 	.hid_width = 5,
 	.parent_map = gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bias_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "nss_port5_rx_clk_src",
 		.parent_data = gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bias,
 		.num_parents = 7,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_fm_ops,
 	},
 };
 
-static const struct freq_tbl ftbl_nss_port5_tx_clk_src[] = {
-	F(24000000, P_XO, 1, 0, 0),
-	F(25000000, P_UNIPHY1_TX, 12.5, 0, 0),
-	F(25000000, P_UNIPHY0_TX, 5, 0, 0),
-	F(78125000, P_UNIPHY1_TX, 4, 0, 0),
-	F(125000000, P_UNIPHY1_TX, 2.5, 0, 0),
-	F(125000000, P_UNIPHY0_TX, 1, 0, 0),
-	F(156250000, P_UNIPHY1_TX, 2, 0, 0),
-	F(312500000, P_UNIPHY1_TX, 1, 0, 0),
+static const struct freq_conf ftbl_nss_port5_tx_clk_src_25[] = {
+	C(P_UNIPHY1_TX, 12.5, 0, 0),
+	C(P_UNIPHY0_TX, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_port5_tx_clk_src_125[] = {
+	C(P_UNIPHY1_TX, 2.5, 0, 0),
+	C(P_UNIPHY0_TX, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_port5_tx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_port5_tx_clk_src_25),
+	FMS(78125000, P_UNIPHY1_TX, 4, 0, 0),
+	FM(125000000, ftbl_nss_port5_tx_clk_src_125),
+	FMS(156250000, P_UNIPHY1_TX, 2, 0, 0),
+	FMS(312500000, P_UNIPHY1_TX, 1, 0, 0),
 	{ }
 };
 
@@ -594,14 +610,14 @@ gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bias_map[] = {
 
 static struct clk_rcg2 nss_port5_tx_clk_src = {
 	.cmd_rcgr = 0x68068,
-	.freq_tbl = ftbl_nss_port5_tx_clk_src,
+	.freq_multi_tbl = ftbl_nss_port5_tx_clk_src,
 	.hid_width = 5,
 	.parent_map = gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bias_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "nss_port5_tx_clk_src",
 		.parent_data = gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bias,
 		.num_parents = 7,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_fm_ops,
 	},
 };
 
-- 
2.50.1


