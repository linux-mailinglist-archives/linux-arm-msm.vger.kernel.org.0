Return-Path: <linux-arm-msm+bounces-81999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F308EC61D6F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 22:36:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A02673B4C73
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 21:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F39D27056F;
	Sun, 16 Nov 2025 21:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="KaOQY63U";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="nF6EZWRo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D238264A65;
	Sun, 16 Nov 2025 21:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763328978; cv=none; b=HY+z9eS12Xv4hk5t1zL2mYR4Mub/PuHohsz91IUJRCXyp8bIG2BeV0un/RYZL65t6egyh9nc5YjAo1gSkGng7kadoWlLWHNsCbdvUFy+VPgtBRL8d1xBmMz8B4WyD5wZTgqcUwHIAHCG2EFFDNw2VdfHLKIUOCmFnp3NSSnevic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763328978; c=relaxed/simple;
	bh=dzA5eL7+/fWdAq4ToFIf2tsFUjWsqpfewbFqeXXUgno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Etd+NVd+rCMcjs4h1kC3Jef68l3yUqPz3BqRFLQqPJ1XknfifAMqUOZ6jUA5slX9eJfQyYfdP1Uhhn0EBmYUi37Qe+XZWDEV7jMfkDOXp5vqrG6LqtdnZXcZ6KgwasppTs0813GtKnu4ot/6dNRJpuuApIlrGlUT/X1mBamZGaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=KaOQY63U; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=nF6EZWRo; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763328960; bh=LVmuZ+WiMnOHNXtt4C8tUZp
	x9YWh1sob0ivfJJJ0xeo=; b=KaOQY63UL1xnknngvTKaIJ3nHPX217C7LLweNsAgWqH85bJPzZ
	7NgY7cPa+raCgdmNd2QCVFyF/2MObpk3N4uwtZvperUlMIyuH02lRpXxBTS0ZBzrgHl+YdEYYHJ
	Kea5Vp4gbuXVbt13VAQXj/SRzwYhtlg0uq/+Zx7wQ9Leey4KALkV0NxM1oCya4gHVJho6SZwvqs
	AkEiFvH4/aVOgm5qoCPSJmhf/It4j9zQFTQuUKMfENysKLlXayGEvO6xnMmV5NKthXMEHEQ1xow
	GAuUo17pk9RseY1hVJ8ChtnoXWp3+SIkK6z83T6+Qm1anNk8nYZqu4P3n+ahU/grPxA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763328960; bh=LVmuZ+WiMnOHNXtt4C8tUZp
	x9YWh1sob0ivfJJJ0xeo=; b=nF6EZWRo8O0WJEtF2cImNgjBi/f+9RcJ/ALNsGcdqlQer9OjY5
	6OiOvG4eZOF6mQy45WkfCG46qpfEFFaQqHCA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 16 Nov 2025 22:35:58 +0100
Subject: [PATCH 3/4] dt-bindings: clock: qcom: Add SDM439 Global Clock
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251116-gcc-msm8940-sdm439-v1-3-7c0dc89c922c@mainlining.org>
References: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org>
In-Reply-To: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763328958; l=1464;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=dzA5eL7+/fWdAq4ToFIf2tsFUjWsqpfewbFqeXXUgno=;
 b=1vBBDecH+9YzSFs/XwOLUc/zZPq94VMZ0fkxBpRPqkUv3paoMz6JVY3NeO0nArrrrl1dGw4Jn
 HHJzQDKgCvpCuBA67NmYWVaiWDPQpj4D/q3LiaaUMzJsCoclssKb6+P
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add devicetree bindings for the global clock controller on Qualcomm
SDM439 platform.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
index 68fcd0d6492f..ced3118c8580 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/qcom,gcc-msm8953.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Global Clock & Reset Controller on MSM8937, MSM8940 and MSM8953
+title: Qualcomm Global Clock & Reset Controller on MSM8937, MSM8940, MSM8953 and SDM439
 
 maintainers:
   - Adam Skladowski <a_skl39@protonmail.com>
@@ -13,7 +13,7 @@ maintainers:
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
-  domains on MSM8937, MSM8940 or MSM8953.
+  domains on MSM8937, MSM8940, MSM8953 or SDM439.
 
   See also::
     include/dt-bindings/clock/qcom,gcc-msm8917.h
@@ -25,6 +25,7 @@ properties:
       - qcom,gcc-msm8937
       - qcom,gcc-msm8940
       - qcom,gcc-msm8953
+      - qcom,gcc-sdm439
 
   clocks:
     items:

-- 
2.51.2


