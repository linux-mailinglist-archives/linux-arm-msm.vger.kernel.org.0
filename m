Return-Path: <linux-arm-msm+bounces-82136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EFAC654CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1FC6D4F099B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 16:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18652FC034;
	Mon, 17 Nov 2025 16:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gaQBei8U";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="EZe+tcSD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D832F1FF5;
	Mon, 17 Nov 2025 16:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763398646; cv=none; b=rH3ueYTALqbd7BkEdLstJxAotLrpHfMc8ZMxDpB93MnRvh2nBA9HybE/66wiECr3tdKGKnfIGyG0MmhvTBKXfgQYER3yOVbC864JXEna/BiJWq1aEBQqNQUvzWTh/kHCYcEQAofp75zP0tOaYJTOecJjujF1cBaX77RZ/2f2Fos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763398646; c=relaxed/simple;
	bh=gSdwOQe/Xk9bFyCcZMI8WVd0yEC9v0Qmqh3rOcnBUlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aax+BItnV0uIOQvc9xtnygJgOE/Ug7kKBYW7fne5uYAKZczQq5ObPue9EyIrqu4Z3fNfQkirISzyOvTv+NPHTVVT5+8PBUb6Yc0wculwSGAel7TpwfulQEsJsKKVtDruRdt7TDgAYxgBBq5g0C4BQbpmoh3I69Kmg2b3cwnegs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gaQBei8U; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=EZe+tcSD; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763398641; bh=yXCT+4e+QbC0PpPJDzKn5OY
	LIXlYjDUXsazMj0rHz4g=; b=gaQBei8U45VAMXQ+FXkpy0j7lwrq68QW2RGfZTAMzV6ki0U+5h
	RQakj0WR76lTSpqP1HFJeyOf76/iPe+bJCfgXBX95pJFdnViIBaF0JHFl95O0j71R1kYhdPysyn
	tugqnPz7bK/UzGZ28u6L8tTDnNbGYkRl/givjMQgseJK+GD5dKCQnmGpTQRPuwVFI8zRdlLcmnz
	LmB4JxY4QB5SSdgEimeJPzIvyyvzKQdyIIOyR4qZgYcIJS5pn2qgAOW4N1M2KVf5kp70UuLCog2
	RqIqViXdOUQWRXCIxPZxYvP9FtYRQy4drJ1xS1XfWtvIYzxU+PvB+yuee5Y+ryR2kRw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763398641; bh=yXCT+4e+QbC0PpPJDzKn5OY
	LIXlYjDUXsazMj0rHz4g=; b=EZe+tcSD+MqwZHiXQrjBIMdveNCYAnzm7ZIKPfZASF2L+AlQqs
	htb6OUpdX2Uez3ZFRs3ptQLqFt8JKKNKEXDA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 17 Nov 2025 17:57:06 +0100
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom: Add MSM8940 Global Clock
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251117-gcc-msm8940-sdm439-v2-1-4af57c8bc7eb@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763398640; l=2035;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=gSdwOQe/Xk9bFyCcZMI8WVd0yEC9v0Qmqh3rOcnBUlQ=;
 b=L1TUSiAxYVAWiAl/zeCYDqM/AHzgYA0uGJZdOD+C98JN13coI4qxfBUrQTlYCxwVgrYdnWN++
 Ai8TKLyW4lACgWkqgZnfnV60wAQOKj1O1ZY3A1NotQ1TlKkjCPJ0k5k
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add devicetree bindings for the global clock controller on Qualcomm
MSM8940 platform.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
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


