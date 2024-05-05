Return-Path: <linux-arm-msm+bounces-19219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A0E8BC377
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2024 22:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2FE2B21058
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2024 20:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D020F6EB55;
	Sun,  5 May 2024 20:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="UwWECiEj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp56.i.mail.ru (smtp56.i.mail.ru [95.163.41.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8AE6DCF5;
	Sun,  5 May 2024 20:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.41.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714939857; cv=none; b=tnW72snEPIJ4SMAUcAAibDUktJQi3FD0duItzZT4orps1SH599SC05cnhzVVEbYVr0t3Br8q+83WxgEcbrjAp5KcSYDthyAt9zK2/CXR3+eZ4l4gSFrs5UVwp4pSFKYOUaqMja747csstcbbYFhpRfBc2HjIePO2Tnxt/vJW9mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714939857; c=relaxed/simple;
	bh=HZPHNpjyg4/sxUKZpKWDtoxzAlyv2vqc7mhPM4BQr+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZgumC3adjszrUbWx64tD9YFPg2DQ0Pcts8mmdrdrrCM2lOaBlyBMlTTn0F1kW3otAXKA6F0YinhUKW4NFMmb4JHg84ow7GsCco/4wmIsEIzvkG4OumbxdQBVbqSmFVjUiYyaKEYpCT6Yvj9Y6E5F69W76EHsvPwR6oq7bDO2kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=UwWECiEj; arc=none smtp.client-ip=95.163.41.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=0Ix7UQVnD0ilprUP5MbXlA5LpK3uivJ93HU7Jpk8/G4=; t=1714939854; x=1715029854; 
	b=UwWECiEjAUms+kc6ZVufdBlm5JI2cOL9+0jk7njbLbUpnno0fMoAFgrDS07x+EI2FobCOhiQqB6
	Ob+D+THpTXEzBc2SmwSFH8jTlhLcNvY2AQ2xlxHcAHTC8Vk429Ae8n4LT/Vhl7KwBkNYyyahN0YX4
	DrO/ZAzkxgqtwL+DPjk=;
Received: by smtp56.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1s3iCA-00000009RwX-3ywS; Sun, 05 May 2024 23:10:51 +0300
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
Subject: [PATCH v3 5/8] dt-bindings: clock: qcom: Add SM7150 CAMCC clocks
Date: Sun,  5 May 2024 23:10:35 +0300
Message-ID: <20240505201038.276047-6-danila@jiaxyga.com>
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
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9C1015E4FDF537780DFDCE44B03D90A4295A4593ED33AC928182A05F5380850401BA86DFCE1D07ECC5D1BE6A8D71B10A5E226B81DAD0F4F63BE7375619A971F144662B04911350A54
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE753B96F70D0F8F35FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AE7D31454303AF298638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D824F81A09E6FB07C7965C51F0EA95FD593A48485F7875D926CC7F00164DA146DAFE8445B8C89999728AA50765F79006370277CA7F994D7EF5389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC80CABCCA60F52D7EBF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CBC0ADEB1C81BB3626E0066C2D8992A164AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3BCD92BA7D744A5E9BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF4964A708C60C975A1DD303D21008E298D5E8D9A59859A8B636DA1BED736F932875ECD9A6C639B01B78DA827A17800CE7EBD83694CB3B8CDE731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A53B9EDC7E2D568D3F5002B1117B3ED6966E20C846E50E2CF01E49B01306B5E3AD823CB91A9FED034534781492E4B8EEADB30A456A8F293845C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF6BE2356A10E94BAB5AE6BE8F0CB5CDBBEB5C955AA58033BD65AAC0F392DABB1ECEAE7BAE235C0E40643425263F8C9A4E0E3C8E32989829CAED97F980A7132E1025DB120362BE99F6146D90F64BF3396102C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3Gch4W13RDEjiLKOJgIdpw==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C739498105F947809758DEDF72C88FB39F7EDAED98AF54C2AE994E1DD664FAC4B21F51B32C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

Add device tree bindings for the camera clock controller on Qualcomm
SM7150 platform.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/qcom,sm7150-camcc.yaml     |  60 ++++++++++
 include/dt-bindings/clock/qcom,sm7150-camcc.h | 113 ++++++++++++++++++
 2 files changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-camcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm7150-camcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm7150-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm7150-camcc.yaml
new file mode 100644
index 000000000000..7be4b10c430c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm7150-camcc.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm7150-camcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Clock & Reset Controller on SM7150
+
+maintainers:
+  - Danila Tikhonov <danila@jiaxyga.com>
+  - David Wronek <david@mainlining.org>
+  - Jens Reidel <adrian@travitia.xyz>
+
+description: |
+  Qualcomm camera clock control module provides the clocks, resets and power
+  domains on SM7150.
+
+  See also:: include/dt-bindings/clock/qcom,sm7150-camcc.h
+
+properties:
+  compatible:
+    const: qcom,sm7150-camcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board XO Active-Only source
+      - description: Sleep clock source
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
+    clock-controller@ad00000 {
+      compatible = "qcom,sm7150-camcc";
+      reg = <0xad00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sm7150-camcc.h b/include/dt-bindings/clock/qcom,sm7150-camcc.h
new file mode 100644
index 000000000000..ce73ef0fe95d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm7150-camcc.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Danila Tikhonov <danila@jiaxyga.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAMCC_SM7150_H
+#define _DT_BINDINGS_CLK_QCOM_CAMCC_SM7150_H
+
+/* Hardware clocks */
+#define CAMCC_PLL0_OUT_EVEN					0
+#define CAMCC_PLL0_OUT_ODD					1
+#define CAMCC_PLL1_OUT_EVEN					2
+#define CAMCC_PLL2_OUT_EARLY					3
+#define CAMCC_PLL3_OUT_EVEN					4
+#define CAMCC_PLL4_OUT_EVEN					5
+
+/* CAMCC clock registers */
+#define CAMCC_PLL0						6
+#define CAMCC_PLL1						7
+#define CAMCC_PLL2						8
+#define CAMCC_PLL2_OUT_AUX					9
+#define CAMCC_PLL2_OUT_MAIN					10
+#define CAMCC_PLL3						11
+#define CAMCC_PLL4						12
+#define CAMCC_BPS_AHB_CLK					13
+#define CAMCC_BPS_AREG_CLK					14
+#define CAMCC_BPS_AXI_CLK					15
+#define CAMCC_BPS_CLK						16
+#define CAMCC_BPS_CLK_SRC					17
+#define CAMCC_CAMNOC_AXI_CLK					18
+#define CAMCC_CAMNOC_AXI_CLK_SRC				19
+#define CAMCC_CAMNOC_DCD_XO_CLK					20
+#define CAMCC_CCI_0_CLK						21
+#define CAMCC_CCI_0_CLK_SRC					22
+#define CAMCC_CCI_1_CLK						23
+#define CAMCC_CCI_1_CLK_SRC					24
+#define CAMCC_CORE_AHB_CLK					25
+#define CAMCC_CPAS_AHB_CLK					26
+#define CAMCC_CPHY_RX_CLK_SRC					27
+#define CAMCC_CSI0PHYTIMER_CLK					28
+#define CAMCC_CSI0PHYTIMER_CLK_SRC				29
+#define CAMCC_CSI1PHYTIMER_CLK					30
+#define CAMCC_CSI1PHYTIMER_CLK_SRC				31
+#define CAMCC_CSI2PHYTIMER_CLK					32
+#define CAMCC_CSI2PHYTIMER_CLK_SRC				33
+#define CAMCC_CSI3PHYTIMER_CLK					34
+#define CAMCC_CSI3PHYTIMER_CLK_SRC				35
+#define CAMCC_CSIPHY0_CLK					36
+#define CAMCC_CSIPHY1_CLK					37
+#define CAMCC_CSIPHY2_CLK					38
+#define CAMCC_CSIPHY3_CLK					39
+#define CAMCC_FAST_AHB_CLK_SRC					40
+#define CAMCC_FD_CORE_CLK					41
+#define CAMCC_FD_CORE_CLK_SRC					42
+#define CAMCC_FD_CORE_UAR_CLK					43
+#define CAMCC_ICP_AHB_CLK					44
+#define CAMCC_ICP_CLK						45
+#define CAMCC_ICP_CLK_SRC					46
+#define CAMCC_IFE_0_AXI_CLK					47
+#define CAMCC_IFE_0_CLK						48
+#define CAMCC_IFE_0_CLK_SRC					49
+#define CAMCC_IFE_0_CPHY_RX_CLK					50
+#define CAMCC_IFE_0_CSID_CLK					51
+#define CAMCC_IFE_0_CSID_CLK_SRC				52
+#define CAMCC_IFE_0_DSP_CLK					53
+#define CAMCC_IFE_1_AXI_CLK					54
+#define CAMCC_IFE_1_CLK						55
+#define CAMCC_IFE_1_CLK_SRC					56
+#define CAMCC_IFE_1_CPHY_RX_CLK					57
+#define CAMCC_IFE_1_CSID_CLK					58
+#define CAMCC_IFE_1_CSID_CLK_SRC				59
+#define CAMCC_IFE_1_DSP_CLK					60
+#define CAMCC_IFE_LITE_CLK					61
+#define CAMCC_IFE_LITE_CLK_SRC					62
+#define CAMCC_IFE_LITE_CPHY_RX_CLK				63
+#define CAMCC_IFE_LITE_CSID_CLK					64
+#define CAMCC_IFE_LITE_CSID_CLK_SRC				65
+#define CAMCC_IPE_0_AHB_CLK					66
+#define CAMCC_IPE_0_AREG_CLK					67
+#define CAMCC_IPE_0_AXI_CLK					68
+#define CAMCC_IPE_0_CLK						69
+#define CAMCC_IPE_0_CLK_SRC					70
+#define CAMCC_IPE_1_AHB_CLK					71
+#define CAMCC_IPE_1_AREG_CLK					72
+#define CAMCC_IPE_1_AXI_CLK					73
+#define CAMCC_IPE_1_CLK						74
+#define CAMCC_JPEG_CLK						75
+#define CAMCC_JPEG_CLK_SRC					76
+#define CAMCC_LRME_CLK						77
+#define CAMCC_LRME_CLK_SRC					78
+#define CAMCC_MCLK0_CLK						79
+#define CAMCC_MCLK0_CLK_SRC					80
+#define CAMCC_MCLK1_CLK						81
+#define CAMCC_MCLK1_CLK_SRC					82
+#define CAMCC_MCLK2_CLK						83
+#define CAMCC_MCLK2_CLK_SRC					84
+#define CAMCC_MCLK3_CLK						85
+#define CAMCC_MCLK3_CLK_SRC					86
+#define CAMCC_SLEEP_CLK						87
+#define CAMCC_SLEEP_CLK_SRC					88
+#define CAMCC_SLOW_AHB_CLK_SRC					89
+#define CAMCC_XO_CLK_SRC					90
+
+/* CAMCC GDSCRs */
+#define BPS_GDSC						0
+#define IFE_0_GDSC						1
+#define IFE_1_GDSC						2
+#define IPE_0_GDSC						3
+#define IPE_1_GDSC						4
+#define TITAN_TOP_GDSC						5
+
+#endif
-- 
2.44.0


