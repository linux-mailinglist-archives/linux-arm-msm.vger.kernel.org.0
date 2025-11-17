Return-Path: <linux-arm-msm+bounces-82137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F95C654D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 333BD4F0F2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 16:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6123016EF;
	Mon, 17 Nov 2025 16:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="VqsSBy+/";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="yiHbPZLZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE3A270541;
	Mon, 17 Nov 2025 16:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763398648; cv=none; b=OBELiTROhJpoxTlngOZE1PBr0ISCtA/ASMaIicY2EFMIiqU4OW3iQhzDwl3pCqbodr5cz9oWlkO7bouw1QN00Ml4FreWRdfg3TqmoC+kQNRxw9kikjAcu/C2xWaQezdqhSvWwOtz5oxfCumjMSJcqvyTWtQTgva2vfjHFlhHdKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763398648; c=relaxed/simple;
	bh=0rdTFknzm31/v037Hm5ik64KrUP12/RIbfuJqGk6e/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFygHafMMG3wGHYmopMce2Sn0L/SeuucBTX2Cxf2asG41KgatEd4gOlpShXnirO0MAvsSBmuzBrt3CXpmHQt2A7qU+mWpWyLco/EfzJ9W2G96r/rdOxs/ySQB6EpfbeDGJjaqpkELiDVbyIEvXW2JRmNbklerjJxQAW/iTviV10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=VqsSBy+/; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=yiHbPZLZ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763398643; bh=YhyWcd6cneaTtw8q8LH8oKQ
	jjDlCWa/0j4SoIH5ZJ4Q=; b=VqsSBy+/NgkGsPQ4MtCbXXmHAr71QhfmJz0dLLDzXc4WEr4lNM
	oU4wOZVwOIbdt3lFfryQ8IJKm+0ke/WxwBzDaodUEuoznwSG2DPsif4O1x4Gm1Wk9IblTzz2T3C
	hhTS+7AbrGQawBafgf3naaWI7ieVHvbbVJnfxCEG05IaYGPrKXUsSSfg1Ow8ihchDqOCUAuriiB
	s6GwPPfQccBdB492kDjyo1JAoj0akbZwU3prN2BJb3aR7ZbpR12lf4yPCpkw4uoaIdrAXezkyxJ
	uqKaxh1LhSZsrrRgew+E/VCU05AeqUvbwLpzADzd+0AdbSDFjsdwQIYqzL+DFn68/Yw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763398643; bh=YhyWcd6cneaTtw8q8LH8oKQ
	jjDlCWa/0j4SoIH5ZJ4Q=; b=yiHbPZLZtrlWIqoHsoWZY6VZxHEFke0r8Po8B4QwGT4zxw/ZwS
	Hkmb7oyhv9hSfbxw1u1ki2wr2yJCn+oFidBg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 17 Nov 2025 17:57:08 +0100
Subject: [PATCH v2 3/4] dt-bindings: clock: qcom: Add SDM439 Global Clock
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251117-gcc-msm8940-sdm439-v2-3-4af57c8bc7eb@mainlining.org>
References: <20251117-gcc-msm8940-sdm439-v2-0-4af57c8bc7eb@mainlining.org>
In-Reply-To: <20251117-gcc-msm8940-sdm439-v2-0-4af57c8bc7eb@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763398640; l=1516;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=0rdTFknzm31/v037Hm5ik64KrUP12/RIbfuJqGk6e/w=;
 b=uQJoGZZoDNiFtJ1esmZEnC1Kq0S0H6DUeVdGXsGRpSSBRJY35wD4C4bpqcdGc8iTJN9i21l8D
 KU56P+yHe41AosOOtFCzHvMm43dvhPjfmK8tltBLvJXw/jDmb15yXbS
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add devicetree bindings for the global clock controller on Qualcomm
SDM439 platform.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
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


