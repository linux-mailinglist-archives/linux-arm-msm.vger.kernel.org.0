Return-Path: <linux-arm-msm+bounces-48290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6A2A38E8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA15E171E27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA521B0F14;
	Mon, 17 Feb 2025 22:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="TqXwgJue"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A7F1ADC81;
	Mon, 17 Feb 2025 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739829961; cv=none; b=rbtXu80MF5qN+Oj9U2wCFR7lwKZy6UIozZXt4vFkWHlbLl+0CML8PoumbHAYcHLtnu5UifAzpmMEVnJCl1sKlLe6rk5I6lXHw7X96AR814V/raxnjKMPHKf3fNHDa077yaMi/myouehFKwzmZvvVNlIq3HqosRB6qDyRT1fm9r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739829961; c=relaxed/simple;
	bh=WQpAU91b0ofgV9N95YLIs+rsidLddutzsiejwyRckP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=htNvTJ0qshIbXVIdD4vLH7W94hWYQi3GNYi6TTzqXRmTV/SBv6zBhL5oZuWVfFlSaiG4KcNcoSomCIwaplI+bXH85jE7MGisTsQrkIH1TWhuHGeuwAMdbJ6V7F7aUZ3MuB9pklf0q5KTPqn4aHst8qq7NFXgR2pPnVaP/PGNXLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=TqXwgJue; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1739829949; bh=WQpAU91b0ofgV9N95YLIs+rsidLddutzsiejwyRckP8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TqXwgJueOIHTrpX13hunlvBTPqF77xfSggqOk78A7FCCZnmWAmLA4mWXfeanXqSeq
	 LiCFaeDIkfJtjbGIAzedG3+Lp1KezqhUDApTLIf6IRXgywPTAAI3EV8X1svZdqWs2a
	 6Lm5C7ji1h+26pkeJBzI6+fiqRWdvRSkVIFVcRTs=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 17 Feb 2025 23:05:20 +0100
Subject: [PATCH v5 06/13] remoteproc: qcom_q6v5_mss: Add modem support on
 MSM8926
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-msm8226-modem-v5-6-2bc74b80e0ae@lucaweiss.eu>
References: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
In-Reply-To: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2428; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=WQpAU91b0ofgV9N95YLIs+rsidLddutzsiejwyRckP8=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBns7K07p0mjJmO0IXoqEbaFZBIXeyKJL7LY7/Ms
 v13QOsDevWJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7OytAAKCRBy2EO4nU3X
 VsrvD/9ezZFVJJyExv4G5IwV7HwJHM0qEhaHL1G2K2r1YhfT2h+v/GAK3pXFdxK7SYTX6bLQkQ/
 f/EdLbSyfVVJ29fGlg3YVHF2424gQDS20n5gGl5pzEAYhc3SLlpGHK56SHpN0tZfB4mpLYPGHyK
 26iNj+DiwTTFe/G3worU44nWxKgF/x3/Zs0J9/8xcaSKN9DUpP6Nc29oRzfDU9fKiy0mclEXcrn
 Ue2URrS0UctgJzYL+2V/ryFfsOd9E4IUGiPScYI/dmG8ksY2lpPIF4wkTHb123AHMPxLtJ3teD5
 GjimBXRNBuoSbfdFIH9uWgkmY5DR5i9RUzG79qV+cjuV3K5x8Wmy/07eIRDOOKRm85lcUppaScs
 JadCPdIXy1J00NGcN5QI0VtO7IAObFfntu/K5k3KRNxNe8jSZN7wcpDFUwNbxmEA9YAoY0073cu
 0/dQtSnQqmPC5itwXSClo/79diA7UHfWKLaRpPloErwKekeKBGqd6wiMn+ZyAOeBuNHRRnZ7tgM
 4G0SUxYKtYXfGTF4swlqIpIH+BmRh0YfVT9S8OlNICdst6ZXNYbpN+HBFbi+a0ofBz6EGDUjXu/
 OZzFp99zGrrq8FEjITirJLoPxFeZtgPt9oAc7xnipLKrD7Ar04ZCPD0sSX23T4bHFp1JndwrRmo
 MsUn7HHvIMOeHng==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

While MSM8926 being 'just' an LTE-capable variant of MSM8226 it appears
the modem setup has changed significantly, by requiring mss-supply and
not using the ext-bhs-reg.

Add a new compatible and new struct to support that.

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 6f590f9128409b4aa427ab6bde1a9c4a966b3d15..0c0199fb0e68d6286f1e238d110539554d1d5f14 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -257,6 +257,7 @@ enum {
 	MSS_MSM8226,
 	MSS_MSM8909,
 	MSS_MSM8916,
+	MSS_MSM8926,
 	MSS_MSM8953,
 	MSS_MSM8974,
 	MSS_MSM8996,
@@ -2622,11 +2623,58 @@ static const struct rproc_hexagon_res msm8226_mss = {
 	.version = MSS_MSM8226,
 };
 
+static const struct rproc_hexagon_res msm8926_mss = {
+	.hexagon_mba_image = "mba.b00",
+	.proxy_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "pll",
+			.uA = 100000,
+		},
+		{
+			.supply = "mx",
+			.uV = 1050000,
+		},
+		{}
+	},
+	.active_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "mss",
+			.uV = 1050000,
+			.uA = 100000,
+		},
+		{}
+	},
+	.proxy_clk_names = (char*[]){
+		"xo",
+		NULL
+	},
+	.active_clk_names = (char*[]){
+		"iface",
+		"bus",
+		"mem",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"cx",
+		NULL
+	},
+	.need_mem_protection = false,
+	.has_alt_reset = false,
+	.has_mba_logs = false,
+	.has_spare_reg = false,
+	.has_qaccept_regs = false,
+	.has_ext_bhs_reg = false,
+	.has_ext_cntl_regs = false,
+	.has_vq6 = false,
+	.version = MSS_MSM8926,
+};
+
 static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
 	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss},
 	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
 	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
+	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss},
 	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
 	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
 	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},

-- 
2.48.1


