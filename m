Return-Path: <linux-arm-msm+bounces-81998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44509C61D66
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 22:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B10A03B4C2D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 21:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E1A2690C0;
	Sun, 16 Nov 2025 21:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="U6l33ZUw";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Yix3MGmc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E7A264A65;
	Sun, 16 Nov 2025 21:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763328972; cv=none; b=IuKPx4E+aLZwxeBADJiSQ6Qtw4yAst702VuC7RwOi5wttfGuUgkzGsaMpBCEjKIEDroniY9cILj/S4kmOB+w2uknK3npCaq3yZD6+RnR+LrR3AGHWKCliAbiSvMB7/CFE62+ckdXjQATdyyTKtlrfEFQFd6tiU5mPjiTRFUXvBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763328972; c=relaxed/simple;
	bh=WrZwPPx9NEjxsMuJUQfLS8Q4z79XFn3KAibXaKORpRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZBlG9VTg7Q1wMTtECPL+YtgUTm7dUj6wxdTFa1PnqvWjmXAe2T2FR1oCft0jnxWWEID02ftes7Ho+ge/nWWcdd6Ol+B2tKWs9sVy7stIZA7v535h8SQxOJzGt+oDGsrkuJ3GVQEzEtsn3RRJAMHRD6A19B6ulHVQ+4+xv+L7u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=U6l33ZUw; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Yix3MGmc; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763328959; bh=u92nYXvWG7AmK2VnC3bzD6M
	AHQ1dOq3A0Xji7uahxfk=; b=U6l33ZUwAcxUgPQnW/HBrC9sMb1lS+TmzGw/gmaGaVnUeJJdac
	Te3J6BE6XPyFhnFKhj76yKsJ3wu/GDFhYbkQPHgTecaFOOYYewXUicO+xCX/fOcqv4coTgEgvQ1
	3K6XN9C2oND82UYpQ2NLC32UK6ma9jPPnvxE7emwqwT682YlkgaRO2pe4zzKCHkpdTPrCVSVqVl
	YlzwN4hjbyUEvPhptDahRUC052EVZ1vh19ClUCue8FTUfibk7sVRwAdbo+hx8MNSYAJPAezq66t
	nIjewYepp6xJmz76bKKpWVV+jfCJkoTcWyMB/+Gw+DvbTSLKygn/8LUDMq1D8dEWS+w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763328959; bh=u92nYXvWG7AmK2VnC3bzD6M
	AHQ1dOq3A0Xji7uahxfk=; b=Yix3MGmcX4Mo1Q16jnb/rEKavb8wbrzPH/u9Mgg0w5k5k1E7OE
	dbQiCo++Ou2eXgNyD5/Sk2PzqPsnBlt7bhAw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 16 Nov 2025 22:35:56 +0100
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add MSM8940 Global Clock
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251116-gcc-msm8940-sdm439-v1-1-7c0dc89c922c@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763328958; l=1983;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=WrZwPPx9NEjxsMuJUQfLS8Q4z79XFn3KAibXaKORpRc=;
 b=XiJOaesnvvDpfFu8GWGjgMgMUO4SWYdVKBUwtYMo+8X+5MQobsUr7MqpPgp5fbwi/OFTsYhyz
 yevxuH0PK1yCqpcpms0/GAT3iL2GrL+FgG7eY9xTvV65difKzKIikHS
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add devicetree bindings for the global clock controller on Qualcomm
MSM8940 platform.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml | 5 +++--
 include/dt-bindings/clock/qcom,gcc-msm8917.h                  | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
index f2e37f439d28..68fcd0d6492f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/qcom,gcc-msm8953.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Global Clock & Reset Controller on MSM8953
+title: Qualcomm Global Clock & Reset Controller on MSM8937, MSM8940 and MSM8953
 
 maintainers:
   - Adam Skladowski <a_skl39@protonmail.com>
@@ -13,7 +13,7 @@ maintainers:
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
-  domains on MSM8937 or MSM8953.
+  domains on MSM8937, MSM8940 or MSM8953.
 
   See also::
     include/dt-bindings/clock/qcom,gcc-msm8917.h
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - qcom,gcc-msm8937
+      - qcom,gcc-msm8940
       - qcom,gcc-msm8953
 
   clocks:
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8917.h b/include/dt-bindings/clock/qcom,gcc-msm8917.h
index 4e3897b3669d..066acb447f4f 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8917.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8917.h
@@ -187,6 +187,7 @@
 #define MSM8937_GCC_MDSS_PCLK1_CLK			179
 #define MSM8937_GCC_OXILI_AON_CLK			180
 #define MSM8937_GCC_OXILI_TIMER_CLK			181
+#define MSM8940_GCC_IPA_TBU_CLK				182
 
 /* GCC block resets */
 #define GCC_CAMSS_MICRO_BCR			0

-- 
2.51.2


