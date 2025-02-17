Return-Path: <linux-arm-msm+bounces-48289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEE7A38E8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 288293B2A24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03A51AF0C7;
	Mon, 17 Feb 2025 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="OexV+Luz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59DA1A8402;
	Mon, 17 Feb 2025 22:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739829959; cv=none; b=P08gFfnyN5czKjPdu2q6tDuNVYNaDGL3mQkfiIgdL7B4/RMTprm54+j9XuBgk5T57EiXC3ddx2eUc2SfRaaRltUjy9xEgi+pXOI5FHJ/JQRWZN5pJyFmbPfndnvh117JXoD9WUnRUkfpbXwVxlmCfwrsOv7Nzp4N0zdK8s7v6Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739829959; c=relaxed/simple;
	bh=nD2pzDV8BppoM+IKRng7alJagSMAro8jZUFi3iMEfnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aH31k70+/C61yOjePCqXUk+Qb682FJn8be0kLtQ7hZG/JXKwJ1g/AiaesEQVXN2hvq7ecr8eL1KggoZCKBT901IAV3+P+7mqwL1/CVOzShNPRcObuNPwRZMxxrwt4/2PMkttPYmGqXod2PSYsIVNivLLB/zusqEqqaMdfdVY+HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=OexV+Luz; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1739829949; bh=nD2pzDV8BppoM+IKRng7alJagSMAro8jZUFi3iMEfnc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OexV+Luzlk7RruMPginpkJGSUBjN0fAtJUHZ6fbbsnF9nE5hYzZAiFE4wgnzqcSBe
	 7tcURiJ+NCXoElOMMLBAccXgPJHt6fpf8iTHWsArZOd07f/AjoyjNMgv6rcu7JLX1X
	 B1XPYY95umFzSjkJfjyTOoEtITj1IKKdo9N8kil4=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 17 Feb 2025 23:05:18 +0100
Subject: [PATCH v5 04/13] remoteproc: qcom_q6v5_mss: Handle platforms with
 one power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250217-msm8226-modem-v5-4-2bc74b80e0ae@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2347; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=nD2pzDV8BppoM+IKRng7alJagSMAro8jZUFi3iMEfnc=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBns7KykC+cHZrMdhD5k2PvGPFLk6vqQrVEkG6Hk
 C9F4OCeq4qJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7OysgAKCRBy2EO4nU3X
 VnuLEACVTQvPW5uzIMpYPU9paimi9NpV2t9a91hoSEbPTogvi17QmsrY7lGqgADT/hwo0O9v960
 /EynDgJl/bgE9PbiBSKlgYQsyERdEkc8T14TD6PG8iqBaeKDJl+VftQ9M6M0exuh86F2NHFWhW9
 4z030dIsFHypV3iFPCiigc20NB0syUezD8sxNigs0ok4S4jtVvLbx0D0oVJIrBhUUdC44kYe8EZ
 vOqDMVdH0cE/sTOKomkP7ZLbE3eNDOPFhJ6cNkJpXuN6mkTCjqTOsbNJMU4O5GACZ689L6RoLs7
 ChHHq9aCk6ko3SEePzj+yqzX1GoLB/RkhZa2iqsf4FB9YSeb9ho5MtTMAYbpVzpyiZDBcHZUFHk
 EFwRLe79duz2W9z5vFHbKZhEUpSwFSpXAbqY4MPf8zrs+CC8MWV6WQbfbXt/Ahnf/aI8K5uUhae
 DXhs3M2tOvJ+udGxOOeJ6f2HCbIOAkAvpWDXa5p2ND88FKJRMe64/WeLlBZM35D4PZOoBRvEwFR
 Q+bXQDGVv6yHuslNjJ3vyqCodbkksbNFeyQFh+OKRkviVZvcfY81jj3nzwPsJoPZNtDd5fYlHrW
 W/x5V56k/OxxuEB5QiRykVi1FWCmmyJ1Zpaj2YjJeFX9F3vz0TbX58/nIm6fJFOo3E1R6tu2hIe
 8JosycjAwk5w0Ng==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

For example MSM8974 has mx voltage rail exposed as regulator and only cx
voltage rail is exposed as power domain. This power domain (cx) is
attached internally in power domain and cannot be attached in this driver.

Fixes: 8750cf392394 ("remoteproc: qcom_q6v5_mss: Allow replacing regulators with power domains")
Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index e78bd986dc3f256effce4470222c0a5faeea86ec..2c80d7fe39f8e308eb12e79415a551b5009b3fe4 100644
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
@@ -2481,7 +2495,6 @@ static const struct rproc_hexagon_res msm8974_mss = {
 		NULL
 	},
 	.proxy_pd_names = (char*[]){
-		"mx",
 		"cx",
 		NULL
 	},

-- 
2.48.1


