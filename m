Return-Path: <linux-arm-msm+bounces-46170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9806A1CEB2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 22:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40CB33A42D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 21:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F1F18DF60;
	Sun, 26 Jan 2025 21:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="ob+qo0WM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5961C156F3C;
	Sun, 26 Jan 2025 21:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737925505; cv=none; b=N0gmuM1lm73rvrAiypuNx2j9rBQDkRkwZCRi2CeaaUaQiU8npCdsSvNYAqpmsfOn91YoJTf+JK0rBR15p838GHOdlcj+zbAgtmYE9Qp6WNnoBU0yXCZtW5yqeceoMz6NW+B8bm8KMitNLxd2J78lLBsceP9AvDOTW4WpKNliIEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737925505; c=relaxed/simple;
	bh=35jT1gY9WoG3GTktEbhEhnbkGf1JpRCR4+f5ruZr+ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iM+7KZHQXrfU4qlhwWGR4StPLmy6C9+aEHRLui3YHFrr6wZSmGLZlAXW+6qCh+rRaaiLp3QE3v4URaavll8VBkge3uUtIIYEvfD2b58VaiZWtkAqvTZnyenRvwJ3OO5fg7qvoiJE4cW1WhUv/JdW+AtUx1UwJE7SPgAi5dSzA8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=ob+qo0WM; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1737925053; bh=35jT1gY9WoG3GTktEbhEhnbkGf1JpRCR4+f5ruZr+ZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ob+qo0WMlAkIK7cYNkQz2LVrd2k9shaK8q+p7Tz+P7YeJAvN5G62N24l7dFGNYLDH
	 LS0BrMlXNY17MRnY4tzTAC+BYCpzkPAWnCXjMwSZh67kY8xVkx+rHxdYGYZ+3U12AX
	 yzmP144T7PDiDd042IEEqjJGh7hEpvCvwKKTrsXo=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 26 Jan 2025 21:57:22 +0100
Subject: [PATCH v2 3/9] remoteproc: qcom_q6v5_mss: Handle platforms with
 one power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250126-msm8226-modem-v2-3-e88d76d6daff@lucaweiss.eu>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
In-Reply-To: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2157; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=35jT1gY9WoG3GTktEbhEhnbkGf1JpRCR4+f5ruZr+ZE=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnlqG2FVrNrus763G7T8flNROko4SlkuMnALsaZ
 A2BpkLMP1mJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5ahtgAKCRBy2EO4nU3X
 VtReD/4hHKyEJMF9iZVUkX7FJ4eGjEZmlOVxkFL1kaM2ioh84M3YNA7LsRcAVnfdqjz8/qFNMec
 7BsJbiJrGG3sVBdVEA31Ld4BFjXkpg+qEaBOJyXSIONfzAsKEUWBi21+/3uAh8dr7XBIi61ySVl
 g2q24BWV8+Nkdo1XsueT86dp9tvb1SuFxRf7aVXRCCEL3TY/rqqMkvaFFkKIfy8qTQgHuwLGn2u
 gbjTmv2IXmYLjc+asDoezv6o+i+ggt0l0sxtD7FM0Ts60AFfkj3+yOVxhakGkequCCymZayaNIZ
 tlTREAg0cifHpDvi9yyBLhG2gsJxTgZWAdiEzVNZ0/OVxAfGOfHPdYDXxohc2iV50wPElHRuJe3
 1wNte49EFqee7/bKl8z5Vy+zqUEF8oq7Fnay3FBIgroHEN8XCNwAZGq4CsCdmt5VoonW4J931tn
 M/Ki9cbRbFOgkh6pO0OzR9b+CoAYJXDS0ZXkJ9b9ljYeOU/1gyHaRg3M4yHkhhJpocJuNMbS1BM
 4hpPOwJPmYROF+bcGXDstpKosovKKzykncE+XvtJk8iRw9u3gUYxQ6uILZC1ZJDhsly1gODQW5J
 He7pePt8swRQvnSJSVkc0vB8kViRIRTrHY8DFy3pcQWVBJp7mKdfFpQ3KkdjCoRnGSFgYzG50Ht
 nbAwR+tewY25TpA==
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
Changes in v2:
  - Move MSM8974 mx-supply from "fallback_proxy_supply" to
    "proxy_supply" to match updated DT schema
  - Add fixes tag
---
 drivers/remoteproc/qcom_q6v5_mss.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index e78bd986dc3f256effce4470222c0a5faeea86ec..e2523b01febf393abfe50740a68b85a04011293c 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1828,6 +1828,13 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
 	if (!pd_names)
 		return 0;
 
+	/* Handle single power domain */
+	if (dev->pm_domain) {
+		devs[0] = dev;
+		pm_runtime_enable(dev);
+		return 1;
+	}
+
 	while (pd_names[num_pds])
 		num_pds++;
 
@@ -1851,8 +1858,15 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
 static void q6v5_pds_detach(struct q6v5 *qproc, struct device **pds,
 			    size_t pd_count)
 {
+	struct device *dev = qproc->dev;
 	int i;
 
+	/* Handle single power domain */
+	if (dev->pm_domain && pd_count) {
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


