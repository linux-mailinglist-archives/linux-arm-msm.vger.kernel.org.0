Return-Path: <linux-arm-msm+bounces-58210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDE5AB9B55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 441F84E6EAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35264239E6C;
	Fri, 16 May 2025 11:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfflWfnH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AE42376EB;
	Fri, 16 May 2025 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747395788; cv=none; b=A4bLQPCAE50zuL80ykUcAxiEOMOvViu9lyc4CRdQv2nzVPjD7PZgmG4EnSUI6VNEyYzttB+zoQg56KAJr75KPrPUjw91a0MvHumys3s+XCNA8DFg66t7TrcfnktU3M8TF14F+jdqbk5KW4qdWJbWkj9CZ+sLofU38iuCAs64tls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747395788; c=relaxed/simple;
	bh=s6mJVg2trpUHXaM+kQ70RjDGFK4205sObTq4U0KZQ4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q0stir2WB9Fp1ZirwjP+QbiMRWNwWjo4Vgn4tb3T9Sf6GLv80kkjveaewpFOPN7yTNyiflB9B6jN0lKpboGtujXt38KjPx4LrpHCSD4tZWhaYXQ50knM+zsj/0QsdZwHlMLEnLXIIBLXMJV177fjvpvOyz9oig7bTIo+0+iRPhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfflWfnH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75BD9C4CEED;
	Fri, 16 May 2025 11:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747395787;
	bh=s6mJVg2trpUHXaM+kQ70RjDGFK4205sObTq4U0KZQ4U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kfflWfnH7Ko8lZDRBiL0AoQD7Gk6lYLgrj9carIlh9ISwYCn7LqGX+zJoxoI241jW
	 Vw1VNOC5MikzGA2Og5ZJDbefWUHsQkMhxVZm4vL10N0c8DgArsq+kSvIRWkLoiKl3W
	 HzK1ZcO3DEMUgW9BHWS3mGrDZ8vVNXYe0VLxQim9MderFPDqBswa+GWMuYMdSNEVfK
	 NEldpPuVrcPANKB5uqvcwzUfs3Z0UVuYFHS9cLdFWPwIzPBIJ0irAuL96TGerEoeIe
	 EQ8eQk4RhkaI5uX5Uv7sDEeE86d5WemBD+VF3ynsX1Qnc5zZ2A+esQKNxtdnLnYYmM
	 28sUoeJ2S5+Iw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C96C3ABDD;
	Fri, 16 May 2025 11:43:07 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Fri, 16 May 2025 15:43:05 +0400
Subject: [PATCH v3 2/5] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5018 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-ipq5018-cmn-pll-v3-2-f3867c5a2076@outlook.com>
References: <20250516-ipq5018-cmn-pll-v3-0-f3867c5a2076@outlook.com>
In-Reply-To: <20250516-ipq5018-cmn-pll-v3-0-f3867c5a2076@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>, 
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747395784; l=1855;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=aD8B+18ScDcHtu0wgN3a3xFwWsO42AOs4yTmUEt8w/0=;
 b=ggusxMAiNh1P6l+yIUj0dmH5Os8r/sWqU5XPHACRD/cF4pzbLw0cctLk1clr6ipW8ItEiHCYe
 yuzi8BSLpy/AEpj2ZYmbxYA5lH4GzXcGAHJ7DDNg8S8FuPOJlCnFKht
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml  |  1 +
 include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h         | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
index cb6e09f4247f4b25105b25f4ae746c0b3ef47616..817d51135fbfdf0f518af1007ec7d6b120a91818 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -24,6 +24,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,ipq5018-cmn-pll
       - qcom,ipq5424-cmn-pll
       - qcom,ipq9574-cmn-pll
 
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



