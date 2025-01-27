Return-Path: <linux-arm-msm+bounces-46298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF54A200EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 23:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB1073A16BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A5A1DE3D7;
	Mon, 27 Jan 2025 22:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="eqIVKu8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907C71DD88F;
	Mon, 27 Jan 2025 22:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738018002; cv=none; b=FVGIWbjkSFzv6sDd0HeN6da2bEpqNG2PWX5owYx7B7hvnxyRjDVeirIdURweVyCO55pTZYo5bRPRk5JBVZfCNt9X38yKTixOmnsVcWmu9qsqIdeA/8V7V+5O3G193fGBhYRTzpkTa0USM1+Op0n8oT1MCy8dPH8g/BoBwDll6pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738018002; c=relaxed/simple;
	bh=iDH8bJYGp5bK4xIZwe0+LJf90ZSZFmB7uJ36rweWBhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MbdMtkwTxdoUuRbcwBbsYuEBEvFsJYcBPH37Mxt8ntrnZz/XB7rtaJy5huLXYqB8TUgT8SRW3FONPCT0dFhFRLRuKbBcTLgDa+KPI8uYFbfTApt5DDeiJlcrk0HzVyT9uUOfandptpCz8Amx/5IT4NZ6wOR5DIebnYroU/R9ZDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=eqIVKu8W; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738017997; bh=iDH8bJYGp5bK4xIZwe0+LJf90ZSZFmB7uJ36rweWBhI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eqIVKu8WppmuKXAj7CITGqv83doGmrz8ugqtDgoBglue4i+SXar4QZzoLI+sWXt3B
	 DpyxT9N9seCpxaFnUEGGUoVwAmkOGVwgfXtLqc1nmwgzSSeL5CdTQhqfkxw3mtRf90
	 dwZub6n3W1939oQJHVfu1glpMBm4pc/uRSVF+fwE=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 27 Jan 2025 23:45:38 +0100
Subject: [PATCH v3 06/13] remoteproc: qcom_q6v5_mss: Add modem support on
 MSM8926
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-msm8226-modem-v3-6-67e968787eef@lucaweiss.eu>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
In-Reply-To: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2369; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=iDH8bJYGp5bK4xIZwe0+LJf90ZSZFmB7uJ36rweWBhI=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmAzDGALGH9HS6xFqPeLY6r7NCeUu3SrPJzpIQ
 Qynw7ljKBSJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5gMwwAKCRBy2EO4nU3X
 VkgFD/4++GB2uabaKtVEEmpcUYxr2yrrgWRy5817GiYl7zdy91b0vqitXN7KpyMJqG7kcgAJn2R
 fSRdB0RIneDcE/jfys0gLPksQ+h9Ap4AiHQUjR3sX1neXZsfB/84ovCCP/hcm64by2hA+k3xxFZ
 UD9BG2fqQjslcjMXK53pdkcqj/Sie5qodpQKAOqDIUtErFNr+fcQcm+9889u1AJFfIWjkaxEryu
 E5I0WoR1xs6GyeQ0v2BO0nT2sdO4bqkMzdOU4rFlRdrfOZ1l/r6fhiTKl5kb+T+cRVJtaVmvhhl
 uoUejLGry5wo9Ax6s+54J42V8MNWzeNjB+RdPoSH4q6HQV0dkQeQ0S0bsl7C8bfhlncHSzGOian
 wBcF9uS7nIYDgAjzowy/BMla6CrRA6qi1BuyT0lddHp55NMpsXLnjgJYl7DCjf4DlUmLtSZ4u3Z
 hq5SAzYe6GU+FKbEEcLkid0nisSyh22R7lRJbczjK6F6uLwJL7y1RvZGBErorYU9J8ioQ0uXS2F
 QXxCoRh7tJQj59ZIopa+rMWTKeuBWdtzY1PNZSiUJXapvQmBbJjvKjwY6zIda7l6RDal7UMd1cN
 gzpWyuaMxHtPHeKa1slyRfqytaewTEhnw1ssAgwQm4PXlYjcYlL4sGV4juPHFfTvk9/yCw5oUHH
 msCVQ+cJEQobnbQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

While MSM8926 being 'just' an LTE-capable variant of MSM8226 it appears
the modem setup has changed significantly, by requiring mss-supply and
not using the ext-bhs-reg.

Add a new compatible and new struct to support that.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 32f35fe89416f167fe49be7ca02a24af842e0073..cd7ea7bb345f558636f9414c43460b29b3be6f5c 100644
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
@@ -2621,11 +2622,58 @@ static const struct rproc_hexagon_res msm8226_mss = {
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


