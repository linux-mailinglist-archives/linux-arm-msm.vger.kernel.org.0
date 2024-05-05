Return-Path: <linux-arm-msm+bounces-19221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D737B8BC37D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2024 22:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CB6F281E06
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2024 20:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91227580E;
	Sun,  5 May 2024 20:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="si+hl1D3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp56.i.mail.ru (smtp56.i.mail.ru [95.163.41.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37727174F;
	Sun,  5 May 2024 20:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.41.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714939861; cv=none; b=ul/ckF6xQzLFPz6cqDjSTzrekxiElS7wY5ZgG2PlNztDWclv2hp8kXn8e9qZwzLTbFnjXUKJ28a19YWeIBZPcH5mvgGIhw9gtQvDVxWOHVFffHUaje9LLd9S0WEQXkuurUfR+obbRkSaNGVpeRmxRPXX69MOsWxftipgYX4bpBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714939861; c=relaxed/simple;
	bh=cLWAvoXIuG2er/5a7LNr2lD4EAoPAxqIMzub1Hf3S1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mpc48hv9/+ee1KaemGspP/KcvL48wn2ie1rlq4MvKatVJXzOkVN7x3QszFs7wWQ9jVk9BTMPWy5FYYtch3IIyVrVv1Rw2UMVz+U293k6eUTyrDwk9vxu+YrScZMoKjls/xhh/oEX1zzB/iFMlPnBd+I3s/2WAbwQn0TP3IWCUGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=si+hl1D3; arc=none smtp.client-ip=95.163.41.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=K+5KlMN21LdFThHBEYgFrodhlXF/ngKkx8ddu8jznCQ=; t=1714939859; x=1715029859; 
	b=si+hl1D3PeeIiY6GcGoU5zlcYsDwjbAvmOoTsuif9TouFF9gL6fh7lC7D5nf/xz+gHe9ApdqcrH
	s2Pn9HEPhPUBOfzDc0/4HAAlSkulzWyo9hBIosnV7oJOJjE1EbXVsad2XfG66NnLNpOPf/aY0ya+b
	GL62ZJuLTTqsTRMnGLE=;
Received: by smtp56.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1s3iCG-00000009RwX-05W0; Sun, 05 May 2024 23:10:56 +0300
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
Subject: [PATCH v3 7/8] dt-bindings: clock: qcom: Add SM7150 VIDEOCC clocks
Date: Sun,  5 May 2024 23:10:37 +0300
Message-ID: <20240505201038.276047-8-danila@jiaxyga.com>
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
Authentication-Results: smtp56.i.mail.ru; auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD949E5EAB5516A8929DE075C24D8BAFAB57312B5E9C7B6EDB7182A05F5380850404C228DA9ACA6FE2703C5B0E9E402BC985D1BE6A8D71B10A598FABAC509C4400BBE7375619A971F148E7CFC23E8784A43
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7C27E92EFAD44F80DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371A4E0E763A740679EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F36B51508219DF83EA1BDDC0B754BE8D4D43B9F7A34ACC287A5A471835C12D1D9774AD6D5ED66289B5278DA827A17800CE77FFCE1C639F4728C9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C332941D3B652364A4117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CFF8FC95E56CD5E825BA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B62785264B78788A1276E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C224936DA1BED736F9328E827F84554CEF50127C277FBC8AE2E8B3A703B70628EAD7BAAAE862A0553A39223F8577A6DFFEA7CFC839A7D10C5E1E9C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5B13C14C67047DBFA5002B1117B3ED696483F066C1BEFA9244869453249F34FA4823CB91A9FED034534781492E4B8EEADA2D5570B22232E1EC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFB5FD4D0F0DB54D933D128032ACABD8001F393D8C49F4BD8CCDCF822CB9FA8933E5920CFB4BEC2A83643425263F8C9A4E0FE26A9D30407360ED97F980A7132E10D8FC38F7E159AC9D146D90F64BF3396102C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3Gch4W13RDHEY3D59oGZNg==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C739498105F947809758DEDF91CF6C6A8F7D6EF6D83723F33B9F8D30E8A43C49E76C94972C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

Add device tree bindings for the video clock controller on Qualcomm
SM7150 platform.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/qcom,sm7150-videocc.yaml   | 58 +++++++++++++++++++
 .../dt-bindings/clock/qcom,sm7150-videocc.h   | 28 +++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-videocc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm7150-videocc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm7150-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm7150-videocc.yaml
new file mode 100644
index 000000000000..037ffc71e70e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm7150-videocc.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm7150-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller on SM7150
+
+maintainers:
+  - Danila Tikhonov <danila@jiaxyga.com>
+  - David Wronek <david@mainlining.org>
+  - Jens Reidel <adrian@travitia.xyz>
+
+description: |
+  Qualcomm video clock control module provides the clocks, resets and power
+  domains on SM7150.
+
+  See also:: include/dt-bindings/clock/qcom,videocc-sm7150.h
+
+properties:
+  compatible:
+    const: qcom,sm7150-videocc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board Always On XO source
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
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    videocc: clock-controller@ab00000 {
+      compatible = "qcom,sm7150-videocc";
+      reg = <0x0ab00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sm7150-videocc.h b/include/dt-bindings/clock/qcom,sm7150-videocc.h
new file mode 100644
index 000000000000..d86e0fbb159a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm7150-videocc.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Danila Tikhonov <danila@jiaxyga.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEOCC_SM7150_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEOCC_SM7150_H
+
+#define VIDEOCC_PLL0			0
+#define VIDEOCC_IRIS_AHB_CLK		1
+#define VIDEOCC_IRIS_CLK_SRC		2
+#define VIDEOCC_MVS0_AXI_CLK		3
+#define VIDEOCC_MVS0_CORE_CLK		4
+#define VIDEOCC_MVS1_AXI_CLK		5
+#define VIDEOCC_MVS1_CORE_CLK		6
+#define VIDEOCC_MVSC_CORE_CLK		7
+#define VIDEOCC_MVSC_CTL_AXI_CLK	8
+#define VIDEOCC_VENUS_AHB_CLK		9
+#define VIDEOCC_XO_CLK			10
+#define VIDEOCC_XO_CLK_SRC		11
+
+/* VIDEOCC GDSCRs */
+#define VENUS_GDSC			0
+#define VCODEC0_GDSC			1
+#define VCODEC1_GDSC			2
+
+#endif
-- 
2.44.0


