Return-Path: <linux-arm-msm+bounces-19227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B7C8BC3D0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2024 22:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9C07B21B29
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2024 20:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139D675818;
	Sun,  5 May 2024 20:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="wGK4xhs3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="zrq1e02/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback3.i.mail.ru (fallback3.i.mail.ru [79.137.243.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EBD6BB30;
	Sun,  5 May 2024 20:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714942675; cv=none; b=i5HkkEFe29CFVJsKzLYKd9aVwwaVSJi7AbcwwyLYD2i4I782VnNoqqFflue5gT+MAXQ030SRC8DIiy5br1uELCPxnNEzTHWd6FXgC7B4i6j9FUz/w1Han4M002BvLuFWH8wXjCiwlArmvOsUpVfsKsyeNxsuPIZfcpxzxU2Ra8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714942675; c=relaxed/simple;
	bh=UCAnAAtSuPVWQEsZqwrA6E+E+a+w9YR1nZK0vA5uF7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HD+e52/GH35S2q5IQ7CLVVF7lDTUjp2QyNOQWl/Y9gE3hdei96wLcGVvIe8CqQu36plAxY1JhLr1Xknx9NOCo0i/Zro+uK7PmHUBNSUMlYPLUtfda0510MXEAZwl5Sp3zRNCLwCR6bDCce3x+3C675f1drGb619wWel7ZhMOb0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=wGK4xhs3; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=zrq1e02/; arc=none smtp.client-ip=79.137.243.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=Sq1hRxPihYAm9AttFJqQInvc9/J+1ZCvq0CMmPYhARw=;
	t=1714942671;x=1715032671; 
	b=wGK4xhs3wTD6Bub0Fhs9LNBTiTVeFrYptZc5cQyuAWbXsBQLe63ub1XNWIGUR5A5oJ5kzGX8E9iavldUBZxTO7k/FSv5ciz2tVy2QV7U1Uaeamw5c/Gt2B6qDvmCMYPQklxYTBEAVl7jkcbE0SLejMg2vD14BXSxb1nFvACJmSk=;
Received: from [10.12.4.31] (port=52756 helo=smtp56.i.mail.ru)
	by fallback3.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1s3iCH-00Gec2-Rl; Sun, 05 May 2024 23:10:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=Sq1hRxPihYAm9AttFJqQInvc9/J+1ZCvq0CMmPYhARw=; t=1714939857; x=1715029857; 
	b=zrq1e02/WJRejg7JMCdGpe0srNoEmgKZ/CuiySTpGLTsQfOKZh9eGILLKkgLo96h0En1AEb9uXL
	F5Tsqpdmtniv38Al1Lwk/Hbz6ubK9L+G/fGuFp1bQAVkrOCDdtk/WIBfyG9Njr/VgwSL3jUdA0tSt
	R2nAqB1ncdncyEt8rhQ=;
Received: by smtp56.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1s3iC7-00000009RwX-1lle; Sun, 05 May 2024 23:10:47 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	david@mainlining.org,
	adrian@travitia.xyz
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v3 3/8] dt-bindings: clock: qcom: Add SM7150 DISPCC clocks
Date: Sun,  5 May 2024 23:10:33 +0300
Message-ID: <20240505201038.276047-4-danila@jiaxyga.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240505201038.276047-1-danila@jiaxyga.com>
References: <20240505201038.276047-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9C1015E4FDF53778088566B0F8B29AAE8070DD98344CBE1AA182A05F538085040EF8CAC2B77C89A295D1BE6A8D71B10A592F50CCF4FCBE2FCBE7375619A971F143A0542435AA8B4D9
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BB0F1327467DA3D4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006377845AD97F799C6E88638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8E24D388591819498965C51F0EA95FD596C1EF769956C495ECC7F00164DA146DAFE8445B8C89999728AA50765F790063773DCDF0198120BE8389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC82D01283D1ACF37BAF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C1DAA61796BF5227B9735652A29929C6C4AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C37D36EA09806432C2BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF4964A708C60C975A1DD303D21008E298D5E8D9A59859A8B636DA1BED736F932875ECD9A6C639B01B78DA827A17800CE7EBD83694CB3B8CDE731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5212DAD83BAD31A3F5002B1117B3ED696BFBB84414F84C9AE14DB8790748E3E77823CB91A9FED034534781492E4B8EEADB71243024C627CEAC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF00564282498EBE5129D3E7C552F55C176DF49D04B65818E8424469C7ADC2F2E34D6C1B221ADCA664643425263F8C9A4E2AB0AB11A7545B88ED97F980A7132E1098F2227382376140146D90F64BF3396102C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3Gch4W13RDFkVO0WEK/Cbw==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C739498105F947809758DEDF601A8E04A89F3FFCB7A64390BB7B1D53FCF00596C5E993662C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B476D451B6D5EC6144A35CF194DDD9AEA5A3F18874191C351368F3CF0E9FE49B69A0D2E209AB8FF7E22EE22401F0B294FE4F6D734DE108FC07E8AB790AC4CB01C9
X-7FA49CB5: 0D63561A33F958A575A7236DFAE4EB97FB8EE0BFD92D6402F3D151E35DD2530E8941B15DA834481FA18204E546F3947CA90F9F3818B5FC68F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006374A812122049E91A1389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C325AE611EB865B371089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3Gch4W13RDFvZxan6sIvYw==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add device tree bindings for the display clock controller on Qualcomm
SM7150 platform.

Co-developed-by: David Wronek <david@mainlining.org>
Signed-off-by: David Wronek <david@mainlining.org>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/qcom,sm7150-dispcc.yaml    | 75 +++++++++++++++++++
 .../dt-bindings/clock/qcom,sm7150-dispcc.h    | 59 +++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-dispcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm7150-dispcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm7150-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm7150-dispcc.yaml
new file mode 100644
index 000000000000..b8d6e1d05ce2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm7150-dispcc.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm7150-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller for SM7150
+
+maintainers:
+  - Danila Tikhonov <danila@jiaxyga.com>
+  - David Wronek <david@mainlining.org>
+  - Jens Reidel <adrian@travitia.xyz>
+
+description: |
+  Qualcomm display clock control module provides the clocks, resets and power
+  domains on SM7150.
+
+  See also:: include/dt-bindings/clock/qcom,sm7150-dispcc.h
+
+properties:
+  compatible:
+    const: qcom,sm7150-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board Always On XO source
+      - description: GPLL0 source from GCC
+      - description: Sleep clock source
+      - description: Byte clock from MDSS DSI PHY0
+      - description: Pixel clock from MDSS DSI PHY0
+      - description: Byte clock from MDSS DSI PHY1
+      - description: Pixel clock from MDSS DSI PHY1
+      - description: Link clock from DP PHY
+      - description: VCO DIV clock from DP PHY
+
+  power-domains:
+    maxItems: 1
+    description:
+      CX power domain.
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm7150-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@af00000 {
+      compatible = "qcom,sm7150-dispcc";
+      reg = <0x0af00000 0x200000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+               <&sleep_clk>,
+               <&mdss_dsi0_phy 0>,
+               <&mdss_dsi0_phy 1>,
+               <&mdss_dsi1_phy 0>,
+               <&mdss_dsi1_phy 1>,
+               <&dp_phy 0>,
+               <&dp_phy 1>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sm7150-dispcc.h b/include/dt-bindings/clock/qcom,sm7150-dispcc.h
new file mode 100644
index 000000000000..fc1fefe8fd72
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm7150-dispcc.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Danila Tikhonov <danila@jiaxyga.com>
+ * Copyright (c) 2024, David Wronek <david@mainlining.org>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISPCC_SM7150_H
+#define _DT_BINDINGS_CLK_QCOM_DISPCC_SM7150_H
+
+/* DISPCC clock registers */
+#define DISPCC_PLL0				0
+#define DISPCC_MDSS_AHB_CLK			1
+#define DISPCC_MDSS_AHB_CLK_SRC			2
+#define DISPCC_MDSS_BYTE0_CLK			3
+#define DISPCC_MDSS_BYTE0_CLK_SRC		4
+#define DISPCC_MDSS_BYTE0_DIV_CLK_SRC		5
+#define DISPCC_MDSS_BYTE0_INTF_CLK		6
+#define DISPCC_MDSS_BYTE1_CLK			7
+#define DISPCC_MDSS_BYTE1_CLK_SRC		8
+#define DISPCC_MDSS_BYTE1_DIV_CLK_SRC		9
+#define DISPCC_MDSS_BYTE1_INTF_CLK		10
+#define DISPCC_MDSS_DP_AUX_CLK			11
+#define DISPCC_MDSS_DP_AUX_CLK_SRC		12
+#define DISPCC_MDSS_DP_CRYPTO_CLK		13
+#define DISPCC_MDSS_DP_CRYPTO_CLK_SRC		14
+#define DISPCC_MDSS_DP_LINK_CLK			15
+#define DISPCC_MDSS_DP_LINK_CLK_SRC		16
+#define DISPCC_MDSS_DP_LINK_INTF_CLK		17
+#define DISPCC_MDSS_DP_PIXEL1_CLK		18
+#define DISPCC_MDSS_DP_PIXEL1_CLK_SRC		19
+#define DISPCC_MDSS_DP_PIXEL_CLK		20
+#define DISPCC_MDSS_DP_PIXEL_CLK_SRC		21
+#define DISPCC_MDSS_ESC0_CLK			22
+#define DISPCC_MDSS_ESC0_CLK_SRC		23
+#define DISPCC_MDSS_ESC1_CLK			24
+#define DISPCC_MDSS_ESC1_CLK_SRC		25
+#define DISPCC_MDSS_MDP_CLK			26
+#define DISPCC_MDSS_MDP_CLK_SRC			27
+#define DISPCC_MDSS_MDP_LUT_CLK			28
+#define DISPCC_MDSS_NON_GDSC_AHB_CLK		29
+#define DISPCC_MDSS_PCLK0_CLK			30
+#define DISPCC_MDSS_PCLK0_CLK_SRC		31
+#define DISPCC_MDSS_PCLK1_CLK			32
+#define DISPCC_MDSS_PCLK1_CLK_SRC		33
+#define DISPCC_MDSS_ROT_CLK			34
+#define DISPCC_MDSS_ROT_CLK_SRC			35
+#define DISPCC_MDSS_RSCC_AHB_CLK		36
+#define DISPCC_MDSS_RSCC_VSYNC_CLK		37
+#define DISPCC_MDSS_VSYNC_CLK			38
+#define DISPCC_MDSS_VSYNC_CLK_SRC		39
+#define DISPCC_XO_CLK_SRC			40
+#define DISPCC_SLEEP_CLK			41
+#define DISPCC_SLEEP_CLK_SRC			42
+
+/* DISPCC GDSCR */
+#define MDSS_GDSC				0
+
+#endif
-- 
2.44.0


