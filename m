Return-Path: <linux-arm-msm+bounces-56893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A315DAABB94
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 09:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82F3B3B60C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 07:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4133729550C;
	Tue,  6 May 2025 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtFl+xv8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DB127F175;
	Tue,  6 May 2025 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510261; cv=none; b=gi4ZvARcUQ11nZCC2uizhX5WdjOJeN3nvPoTy1VVbS96JB2lYsOm8c/WXjrdrat3woNzZ529uW37AJx8cJHVn2jDl3H24c880cbOA1/OlTygXieCIzpcPZgSo3npCScaHus++HAYNPAtFrgCavV14+urfjriwHR0bM1JhalBDb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510261; c=relaxed/simple;
	bh=z45Mhrm50G2NpvDPKyb5BFCNwuMnJv7rrdU8ii7BY4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LEmGhQUEmzVkPnGzDu0knZgHAD2VdJbFYheNtPdLweC6VAIzpuycOy7gQLvHSJ5TFWKJHopsj3AQ8Y3rPvSE5veNSOFmaRw/qtfbapMp8fRQb788W4JM/C1JNIF4yOqKLGtV5LSd24GUfjgJetGS6VPUVH2iHWu+mM3UtZk8ue8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtFl+xv8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5CABC4CEF0;
	Tue,  6 May 2025 05:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746510260;
	bh=z45Mhrm50G2NpvDPKyb5BFCNwuMnJv7rrdU8ii7BY4w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WtFl+xv8z/6VRVbe5b/1/wp6FZJEoChJR3qgcSDwQdrrINejPHsIKmnHleJfklTaL
	 uOu1CCe1Jehv1vOekdIgJ4T4dZJh5iMUrfwI/2E1UW+aGUaQ0hWP3g7nhH1MsREOEI
	 vuxuL52wzCb2F6HT6zbS9LmrHeDOah5+fD8nTidAQ4q2QHeDIvFOfj/yIfrT+NZo/U
	 vu49txDiAPRtJa2qORbyx25K5/E3OzEIQmLH6sTvkCb+6oH+1f0t3h8TSJtMvxTbt4
	 AW6ej7hNKYitCGDHfxfo4MDxWk/nJSd87CxbL86eoUUsKR2jrjwo2Xplox6ZkJdYWa
	 gMFWlUsIEtqUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB17CC3ABC3;
	Tue,  6 May 2025 05:44:20 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 06 May 2025 09:43:35 +0400
Subject: [PATCH v2 3/6] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5018 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-ipq5018-cmn-pll-v2-3-c0a9fcced114@outlook.com>
References: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
In-Reply-To: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746510258; l=1805;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=8ErFwBb8LXa01ct7/Tl+4mrJDAJ15D3Sw41xcCkSs/4=;
 b=oA5CQA6Mwh7Ty3WViEfqrAci7NX4dm4nnvnWOgQ/jUopT4a5cT/Du/swtu91VgSnuRJAV7xOm
 8Y7tDi4LDaqA/+NtXOqeseDGBlUVwvFAmgF05EuJGV8xpxz7p9c/7SE
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



