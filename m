Return-Path: <linux-arm-msm+bounces-23292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3163F90F81E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 23:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 440651C21E21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD9515B106;
	Wed, 19 Jun 2024 21:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="OGKSxOpY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E9215A847;
	Wed, 19 Jun 2024 21:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718830989; cv=none; b=niv6n1qFF/g6pA6BMs4vFb4xK1zHX/KSY2egwRwERY7zQ0GYKHhpnRyhuWLzS5CmAiKQ8C4X/qMOy83g8U1knZ8N9G9UCnkaoG/ZuwsDPqeTLcVlf6bhvpHa4I9C7RmUBDCzEaZvV8sedXwFdHpRKjE7Xb2mOqshmwNmSWRS3jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718830989; c=relaxed/simple;
	bh=Rv7J16jrk32Z3j6CaqeK641utIIgQWQRQjogcpwAMIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sq97i7EXGCUwejulCZ9tWPl2FebQVu7Yhh6/o8mZADSA8Y1vST3xjLw/G1Uu/O6TYRqDy1GheV3F7JFrPwOIVvGgSV2YBiF1a9KFbg6IGYKm2MxhSldeCMOAOxnsVOFYw4lcjxcwNI5aE93kV53TzEys63ojBkhmJBo1l3JdkhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=OGKSxOpY; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1718830986; bh=Rv7J16jrk32Z3j6CaqeK641utIIgQWQRQjogcpwAMIw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OGKSxOpYUqQbe1IS7QvQIMoUr+HQdkjO75e9kmiZdrqoQwQTJWCjZiMlGdBIi86mg
	 Uals8VueqTZufxSUSrSUoBdLRlxAOP/qWaJvBluCtlFVKBYzR4AeglnEZOqSvuYVJ/
	 sxuCwU91UCkkFX5mR8b7c499mb170dH51YWp5wtQ=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 19 Jun 2024 23:02:47 +0200
Subject: [PATCH 3/7] dt-bindings: clock: qcom,a53pll: Add msm8226-a7pll
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-msm8226-cpufreq-v1-3-85143f5291d1@lucaweiss.eu>
References: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
In-Reply-To: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=738; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=Rv7J16jrk32Z3j6CaqeK641utIIgQWQRQjogcpwAMIw=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmc0eEPLCOjXDZiFvPYrV0BXhlYxojOhbh8Q7Xm
 pHoqh1k4nWJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZnNHhAAKCRBy2EO4nU3X
 VpKxEACoVdW0tjGjFMfgTxxEQ4Rksdk3RUOLRWeFr5uIddusza9IqfSwgraSBFARR8/UAhkp5Ef
 oQQpfX5+WmPANeFcdCVyRzRdPpb5b14bWJW+6QT0lBh/B20gMyvBSEJjlZ9hxyPwKe+ebbpC5Fo
 CAUevpjJFqAcmzD378+o4ynJIn0R18ms7fDuLDD7CzDSkd1WCCNhGQ4b7FqEj2nE6zhu0LjKLNO
 FWuukZ1aYH6FBpPfYV7kHgCvSpY7lZ4R62a3j3CQmivF9D+z0hUfgOlybYyS9f5kelzdHRljCPF
 NNIsXxOJbYYvqRHsErlm+6+rBqR82aZTfrPXdeTRf2dW8rIQwrdCmda1nIqklID6sJSYIwLHOei
 s4+E7ufsvoEjfItkEynToKqOP8sCjbPLUmqFIpPaI/q4Ie06gsqPInMW2PIl3GGTl0F4MX1w0WJ
 Gzd2FaQWGh2YXJeZc1ecoU1ZwyNX+49uRhdm2BvHNMNK9XZIZKbNr2HJCry2C09+zQ7X561N3YJ
 0XXDBe+QKGEqdKuou5kUxIA2ob8rEkZwfXIj0vFYKCXzd3SmjhEyzaQZZfl02s+eu736/qv2XSe
 FJIuSjmzFJkZ4Jx0w8ZTvzzzCiDbTXiTaBkUyet7LFZYYu57wbKtwT/vKMRigV9pkXDW29/+S6u
 GFgWT9+uCLzXmew==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the compatible for the A7PLL found in MSM8226 SoCs.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index 8cd73a623ef5..47ceab641a4c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -21,6 +21,7 @@ properties:
       - qcom,ipq6018-a53pll
       - qcom,ipq8074-a53pll
       - qcom,ipq9574-a73pll
+      - qcom,msm8226-a7pll
       - qcom,msm8916-a53pll
       - qcom,msm8939-a53pll
 

-- 
2.45.2


