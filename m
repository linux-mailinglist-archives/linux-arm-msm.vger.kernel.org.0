Return-Path: <linux-arm-msm+bounces-56471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 461DDAA6F32
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 12:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B7E51BC7B80
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 10:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A660A23BCE4;
	Fri,  2 May 2025 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhQSXXwg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A2021146A;
	Fri,  2 May 2025 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180949; cv=none; b=FOGtyJk+OmKJ88A/EHXYqeTlXg+ahsTi+6/AhuYJ9j64VO/882q6t9fPcyHJrWYr11K/iuxMpGmyGC3B/aicV99d1Hc0IWSqBZ9k3XP1LRf/4w6+5znzdlMoGhXTSltt/9aKo08HQqxbjRK36zhZo20cGmax1/6Nwiy5e7pSsJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180949; c=relaxed/simple;
	bh=OEMRWSk4kiWPE3EhCFbIe0N0cuQqpnI5N1PC98kusOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VBSn+VwKeDiZrGOu9y4Zi0fOHomHd60lzKm/SKoelpL2nqB3/ihR5Ia+LpdRXEsRouIXuHbCme2v4DSjcscGnqmL4jl2Fr/9/06NtroVJFnaLCCDgKiNOe1i/lcugCyFpFFLtZm1f86wuqcEzVGIuB2b/Kz7rGEx2jWsxJx2b1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhQSXXwg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED60EC4CEED;
	Fri,  2 May 2025 10:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746180949;
	bh=OEMRWSk4kiWPE3EhCFbIe0N0cuQqpnI5N1PC98kusOo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NhQSXXwgWP7TgnjKs0pD9ZOB4UyvSBCVdH0iSEE+rs4bXGzJ2VBuhiq6XSvxdX5Rx
	 7LhZgVTuk6HiqlO0H25TwVYd6PP1kLXufmL+Xwk1bYdXmAnOnMvcn3VR/bLHhVu/eE
	 V11iJima33/7/ldCpEJqi79kuV2L6AzuOXXqxzVNFVi7uqG+BmZeTSlYsNVU6FgOz3
	 52puUzbiEhdBjAhk+2UK8uyvkNu47fn9sWTb+KOYNyNzbGzIadLmYePEYXSfUQaxuf
	 dkV0pl+N5gkh3GOhnxEwhSe4ao3okJNiooa+c8Xr5IOm0+IvWyJvqMHGv5SxeNFSWz
	 EYJrf8xhhh9DA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD246C3ABA3;
	Fri,  2 May 2025 10:15:48 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Fri, 02 May 2025 14:15:43 +0400
Subject: [PATCH 1/6] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5018 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-ipq5018-cmn-pll-v1-1-27902c1c4071@outlook.com>
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
In-Reply-To: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>, 
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746180945; l=2537;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=xMsnswH7lfsZOMdAFG5L88fjf8jqYYNAJSbGO9nECgc=;
 b=7+PZxKnRPFSXkwIqCDngsDZjv0Ccl/GljGOBpZt45o/525VNJJBP5j1WbKqTcVlOYbdtF4XIy
 cg4neOqVkaPABNsGuww3237zj0QlAtE2I7kTYca9XgcEr+QBd+kYvlK
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

The CMN PLL block in the IPQ5018 SoC takes 96 MHZ as the reference
input clock. Its output clocks are the XO (24Mhz), sleep (32Khz), and
ethernet (50Mhz) clocks.

Unlike IPQ9574, the CMN PLL to the ethernet block needs to be enabled
first in IPQ5018. Hence, add optional phandle to TCSR register space
and offset to do so.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml  | 11 ++++++++---
 include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h         | 16 ++++++++++++++++
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
index cb6e09f4247f4b25105b25f4ae746c0b3ef47616..25006d65d30e20ef8e1f43537bcf3dca65bae73d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -24,12 +24,10 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,ipq5018-cmn-pll
       - qcom,ipq5424-cmn-pll
       - qcom,ipq9574-cmn-pll
 
-  reg:
-    maxItems: 1
-
   clocks:
     items:
       - description: The reference clock. The supported clock rates include
@@ -50,6 +48,13 @@ properties:
   "#clock-cells":
     const: 1
 
+  qcom,cmn-pll-eth-enable:
+    description: Register in TCSR to enable CMN PLL to ethernet
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+        - description: phandle of TCSR syscon
+        - description: offset of TCSR register to enable CMN PLL to ethernet
+
 required:
   - compatible
   - reg
diff --git a/include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h
new file mode 100644
index 0000000000000000000000000000000000000000..586d1c9b33b374331bef413f543c526212c18494
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_IPQ5018_CMN_PLL_H
+#define _DT_BINDINGS_CLK_QCOM_IPQ5018_CMN_PLL_H
+
+/* CMN PLL core clock. */
+#define IPQ5018_CMN_PLL_CLK			0
+
+/* The output clocks from CMN PLL of IPQ5018. */
+#define IPQ5018_XO_24MHZ_CLK			1
+#define IPQ5018_SLEEP_32KHZ_CLK			2
+#define IPQ5018_ETH_50MHZ_CLK			3
+#endif

-- 
2.49.0



