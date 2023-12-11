Return-Path: <linux-arm-msm+bounces-4139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2EF80BFCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 04:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9311C1F20F95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 03:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B7C16421;
	Mon, 11 Dec 2023 03:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dG76Q699"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708FF15AF9;
	Mon, 11 Dec 2023 03:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE9CBC433C9;
	Mon, 11 Dec 2023 03:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702264626;
	bh=I2/VwSQGvh/KjP/juRn6XVQUWF6SVjlSgZaZUz/kKvc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dG76Q699uGLpWv1mEGv4AJOz+SrN+Yg7VyeJ0Gnr8c1zoVOsjdJzwEXq0WEVy+3Zt
	 8ZA3hpvYUsvf8wcSLdJy6HM2L648yz+So8KXaHf0lHM8w+VbJqVjEG2RV2qcAReLSq
	 8rkis4qHXut/r7/m+2uwPjm66FZPSzMsZ5rJQFoFHjnQ0k4KBhamOIQ5xHGDT2nr/W
	 KP8R8K/CvbM3LKivL+fbqYjkl95F2qHWHsh1noT5R5gEz6gkhRQzMMjfy13jwV3lhN
	 clrLgwEptD/Qe1FHzoiykLE+iW9kgokc3s6L30TRE8+KJbLRFRH5dKuKgwYfnFq/rq
	 whNPX7681+r9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F29C10F13;
	Mon, 11 Dec 2023 03:17:06 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+quic_fenglinw.quicinc.com@kernel.org>
Date: Mon, 11 Dec 2023 11:17:00 +0800
Subject: [PATCH 2/4] regulator: qcom,rpmh: add compatible for pm8010 RPMH
 regultor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231211-pm8010-regulator-v1-2-571e05fb4ecc@quicinc.com>
References: <20231211-pm8010-regulator-v1-0-571e05fb4ecc@quicinc.com>
In-Reply-To: <20231211-pm8010-regulator-v1-0-571e05fb4ecc@quicinc.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, quic_collinsd@quicinc.com, 
 quic_subbaram@quicinc.com, quic_jprakash@quicinc.com, 
 Fenglin Wu <quic_fenglinw@quicinc.com>
X-Mailer: b4 0.13-dev-83828
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702264625; l=1788;
 i=quic_fenglinw@quicinc.com; s=20230725; h=from:subject:message-id;
 bh=/J1wecI9Idvjq7+Myo0iVzg5n9YS96HwefGimd5GXh0=;
 b=B2XAMLyw0PnUkBiHmr494YTzxtLfHCg1lERz5M0eHkH+P/+9iy/4BE4G02pCOVJCNkV4fcJOn
 SQs5YuqIjmkD7mRqszoRKiwFnjopSraMvK5xelAZld5KYaoGV2SqQu1
X-Developer-Key: i=quic_fenglinw@quicinc.com; a=ed25519;
 pk=hleIDz3Unk1zeiwwOnZUjoQVMMelRancDFXg927lNjI=
X-Endpoint-Received:
 by B4 Relay for quic_fenglinw@quicinc.com/20230725 with auth_id=68
X-Original-From: Fenglin Wu <quic_fenglinw@quicinc.com>
Reply-To: <quic_fenglinw@quicinc.com>

From: Fenglin Wu <quic_fenglinw@quicinc.com>

Add compatible for PM8010 RPMH regulators present on sm8550-qrd and
sm8550-mtp boards.

Suggested-by: David Collins <quic_collinsd@quicinc.com>
Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index acd37f28ef53..27c6d5152413 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -42,6 +42,7 @@ description: |
       For PM7325, smps1 - smps8, ldo1 - ldo19
       For PM8005, smps1 - smps4
       For PM8009, smps1 - smps2, ldo1 - ldo7
+      For PM8010, ldo1 - ldo7
       For PM8150, smps1 - smps10, ldo1 - ldo18
       For PM8150L, smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
       For PM8350, smps1 - smps12, ldo1 - ldo10
@@ -68,6 +69,7 @@ properties:
       - qcom,pm8005-rpmh-regulators
       - qcom,pm8009-rpmh-regulators
       - qcom,pm8009-1-rpmh-regulators
+      - qcom,pm8010-rpmh-regulators
       - qcom,pm8150-rpmh-regulators
       - qcom,pm8150l-rpmh-regulators
       - qcom,pm8350-rpmh-regulators
@@ -238,6 +240,18 @@ allOf:
         "^vdd-l[1-47]-supply$": true
         "^vdd-s[1-2]-supply$": true
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm8010-rpmh-regulators
+    then:
+      properties:
+        vdd-l1-l2-supply: true
+        vdd-l3-l4-supply: true
+      patternProperties:
+        "^vdd-l[5-7]-supply$": true
+
   - if:
       properties:
         compatible:

-- 
2.25.1


