Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3098F62EE69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 08:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241271AbiKRHbR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 02:31:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241089AbiKRHbK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 02:31:10 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A23C7EC90;
        Thu, 17 Nov 2022 23:31:06 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AI4hxTm019229;
        Fri, 18 Nov 2022 07:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=k/q75UzrGFjIZAukfAPHyXsyPAGqWWGzVpeqOlV5SII=;
 b=RDx6Ie0B7clYzg3NYq/QHU+C/yMOAAhcCWhFrUqlRYW//r2wPK/qdZhmda1W0wrVXUw0
 ptKIhjGR2pJq2GkW8j0vlt3uIABelAE2l6GJHirPrud3S7Ye+TIS7tT+NnUZak/NZvZc
 Brd0uCYTpNc6Aqqk6nTbbJedZRVyea5CFefC3kAk+H5Zkzr5ZeIUYc5KRQaRTNmA80KI
 /JGDVJI1lFq+jYMgzk/VRsmUkz5LIPVyQUSyYN/IVgfsUolAJLa8Gj4yrMjeXA5ICRkT
 tPT2K5Osf+iAhTLT3B08h9iTSDu9lzFDuqEFHr4W36muFPwWnn7NEhgfv43L5ec42mWQ gw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kx0u7rpyg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Nov 2022 07:31:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AI7Ux4R019266
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Nov 2022 07:30:59 GMT
Received: from blr-ubuntu-173.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 17 Nov 2022 23:30:55 -0800
From:   Rajendra Nayak <quic_rjendra@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <konrad.dybcio@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dianders@chromium.org>,
        <mka@chromium.org>, Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: [PATCH 2/2] arm64: dts: qcom: sc7280: Add a new herobrine Pro SKU
Date:   Fri, 18 Nov 2022 13:00:17 +0530
Message-ID: <20221118073017.26128-2-quic_rjendra@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221118073017.26128-1-quic_rjendra@quicinc.com>
References: <20221118073017.26128-1-quic_rjendra@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W3toO81nt22qUyYkq-gwtLBrLqrrAI4W
X-Proofpoint-ORIG-GUID: W3toO81nt22qUyYkq-gwtLBrLqrrAI4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=647
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180050
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some of the qualcomm qcard based herobrine devices can come with
a Pro variant of the chipset with some qcard level changes like
the smps9 from pm8350c which is ganged up with smps7 and smps8,
so we just end up removing smps9 from the herobrine pro sku dtsi.
We then use it to create a new dts for the Pro variant of the
herobrine CRD.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../dts/qcom/sc7280-herobrine-crd-pro.dts     | 35 +++++++++++++++++++
 .../dts/qcom/sc7280-herobrine-pro-sku.dtsi    |  8 +++++
 3 files changed, 44 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-pro-sku.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index afe496a93f94..c5ac51c3a383 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -108,6 +108,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-crd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-crd-pro.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-evoker.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-evoker-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-herobrine-r1.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dts
new file mode 100644
index 000000000000..fe6b228e9e4b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dts
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * sc7280 CRD 3+ Pro board device tree source
+ *
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "sc7280-herobrine-crd.dts"
+#include "sc7280-herobrine-pro-sku.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. sc7280 CRD Pro platform (rev5+)";
+	compatible = "google,hoglin-sku1536", "qcom,sc7280";
+
+	/* FIXED REGULATORS */
+
+	/*
+	 * On most herobrine boards PPVAR_SYS directly provides VREG_EDP_BL.
+	 * However, on CRD there's an extra regulator in the way. Since this
+	 * is expected to be uncommon, we'll leave the "vreg_edp_bl" label
+	 * in the baseboard herobrine.dtsi point at "ppvar_sys" and then
+	 * make a "_crd" specific version here.
+	 */
+	vreg_edp_bl_crd: vreg-edp-bl-crd-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_edp_bl_crd";
+
+		gpio = <&pm8350c_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&edp_bl_reg_en>;
+
+		vin-supply = <&ppvar_sys>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-pro-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-pro-sku.dtsi
new file mode 100644
index 000000000000..fb4bbe8aeda0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-pro-sku.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Google Herobrine dts fragment for PRO SKUs
+ *
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/delete-node/ &vreg_s9c_0p676;
-- 
2.17.1

