Return-Path: <linux-arm-msm+bounces-46297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4ACA200E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 23:47:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 264D718839C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA631DE2DF;
	Mon, 27 Jan 2025 22:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Hk7k0/OK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BC51DDC29;
	Mon, 27 Jan 2025 22:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738018001; cv=none; b=u3uP4jU63zV7FLXzouiAKP5s7Fk2D/UWT/NYRgQsTel+Ay01ccNYc2VOZDz7gO6D0YCzlE1k8Q7oQJcxtj42xEpIJMGwzkViN7pzOWpFnLMV3E0R6grt2RLKqlfoBPowX/WASKqjxt9wgeVvijzyW3KoaOOqC7ATi+X2ScsPVRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738018001; c=relaxed/simple;
	bh=g7XQ7nqrXEs6kLvs+nXBVI5v3iI0Bt/WCnvzpcbjxBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hxqqd/JDiI7sVXNBLuVfS1+s8CpvgCbi0vSGNSZLG6da7gflaLGJp+mTf/vRwlNyuqa5VRR9Ojb9KaMMkOcfbeYB4g2pVsLT2d6t6GOC6+6tUyxxst9zIPkkP1LxiGXT53R9z56Z7S/vZVSYx3qazXeqvg5iYvgsJZrXGY3UXXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=Hk7k0/OK; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738017996; bh=g7XQ7nqrXEs6kLvs+nXBVI5v3iI0Bt/WCnvzpcbjxBY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Hk7k0/OKdDlvMMtzi9Mj200JBP3mPgLcZA2KdeTMbfHSmasHna5VQjDccxRiNgzax
	 gtTzv1JfABrKqbjPzD2ICtgfMdw+sXXeONjdVcpvKeEMH3P/nFvzIrEMX578COyDvK
	 D7iLOJSBvNazSc2aCOWB4OwMj+vaYbyyEKzpy6lg=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 27 Jan 2025 23:45:36 +0100
Subject: [PATCH v3 04/13] remoteproc: qcom_q6v5_mss: Handle platforms with
 one power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250127-msm8226-modem-v3-4-67e968787eef@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2128; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=g7XQ7nqrXEs6kLvs+nXBVI5v3iI0Bt/WCnvzpcbjxBY=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmAzBFvtfqXyKAe1snR95HWKJpcG3dB+Xs+IuE
 FguF91kcmaJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5gMwQAKCRBy2EO4nU3X
 VmeID/9aVuOjj8c/QUcv8793JPfc/WwMbMu2LYLfkUzmmlVWQqASeQT/y7iXhCbmJIL76O9Cxme
 uaJhyEKl79TSIV9kaN/eYnrdzoV4/5aGWbpuubRTG6KrBfeC8kN2dHbKs0/VFuswTOgOfbP9Qak
 JR3z+IXqishQYHGD2goQhlyss0VnZw8u+3RQCpDnSGw35BEf1c5yVDbyXunkFBE2caciHSL8558
 evrhndbVfR6TyKCZxXGrv+UqjW9OO6yje0WnpRJo2ChQBk7eDM1JZfA0Afba1/0p77SmB+ZHFbs
 4mXsbiJ0udhv6Plb85SrYKDG4dBGbqSB7R0x35HQPPVNxaLhGVrFkOdhdXC1YsigtIx8tNYkJAE
 vgP7/IBBvzhKqAUvDo8K2adOUQ+0fif9DG5uuFXNxjFF7qhwdRx4NNQI6Rw7Xm2ydfm0lmoqY2T
 QDz1IUSplYP/EPWg4PEaMUGQb1KjlRgs2tnr5CSKCLjZo4/hY26D5gseSmHuDhGDIaj4wL26TBa
 GzTWb+ix4U+RgXoLs1at2SQ9fJ5VVKVvFY4ebPxwZPbi34IWfKWEF07ylNnMw/cXpVe+h7unxEQ
 0646vZUu5cDEt9+MU4dl/uVte0cHq/nZFa2Y5SiCWEZWHZosP4ovWNzhmCJEybSymPStycROOfu
 jDyXgF6seo1TWMw==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

For example MSM8974 has mx voltage rail exposed as regulator and only cx
voltage rail is exposed as power domain. This power domain (cx) is
attached internally in power domain and cannot be attached in this driver.

Fixes: 8750cf392394 ("remoteproc: qcom_q6v5_mss: Allow replacing regulators with power domains")
Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index e78bd986dc3f256effce4470222c0a5faeea86ec..0e1b0934ceedd13d5790b798afc95d68a8314c75 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1831,6 +1831,13 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
 	while (pd_names[num_pds])
 		num_pds++;
 
+	/* Handle single power domain */
+	if (num_pds == 1 && dev->pm_domain) {
+		devs[0] = dev;
+		pm_runtime_enable(dev);
+		return 1;
+	}
+
 	for (i = 0; i < num_pds; i++) {
 		devs[i] = dev_pm_domain_attach_by_name(dev, pd_names[i]);
 		if (IS_ERR_OR_NULL(devs[i])) {
@@ -1851,8 +1858,15 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
 static void q6v5_pds_detach(struct q6v5 *qproc, struct device **pds,
 			    size_t pd_count)
 {
+	struct device *dev = qproc->dev;
 	int i;
 
+	/* Handle single power domain */
+	if (pd_count == 1 && dev->pm_domain) {
+		pm_runtime_disable(dev);
+		return;
+	}
+
 	for (i = 0; i < pd_count; i++)
 		dev_pm_domain_detach(pds[i], false);
 }
@@ -2449,13 +2463,13 @@ static const struct rproc_hexagon_res msm8974_mss = {
 			.supply = "pll",
 			.uA = 100000,
 		},
-		{}
-	},
-	.fallback_proxy_supply = (struct qcom_mss_reg_res[]) {
 		{
 			.supply = "mx",
 			.uV = 1050000,
 		},
+		{}
+	},
+	.fallback_proxy_supply = (struct qcom_mss_reg_res[]) {
 		{
 			.supply = "cx",
 			.uA = 100000,

-- 
2.48.1


