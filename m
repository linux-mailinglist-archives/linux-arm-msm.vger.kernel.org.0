Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1A9E456C9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 10:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234655AbhKSJqb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 04:46:31 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:47085 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233084AbhKSJq3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 04:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637315008; x=1668851008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=QC91V8RCd4p7H2NALcSkO89K62u8bJSVRDQ+/UiT49E=;
  b=rSWeTcAfyXiTAZMsZq+fyuAPa325OTlSDqGMN1oLCB61g+KLHD+5otll
   JIFNiE1RhuGlCLBemwW8dcRPPb+eGdMZJjrp1ScRplgDSEZCaeX1xdMNV
   bP2I6xNdxAzDWxQDPCpKRuxulkdrKWoFIAcDnRMz/vsalajQwXfqahA6v
   4=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 19 Nov 2021 01:43:28 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 01:43:27 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 01:43:27 -0800
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 01:43:22 -0800
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, <swboyd@chromium.org>,
        <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Lee Jones" <lee.jones@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [PATCH V4 5/6] arm64: dts: qcom: pm8008: Add base dts file
Date:   Fri, 19 Nov 2021 15:12:32 +0530
Message-ID: <1637314953-4215-6-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637314953-4215-1-git-send-email-quic_c_skakit@quicinc.com>
References: <1637314953-4215-1-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add base DTS file for pm8008 with chip and ldo nodes.

Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
---
Changes in V4:
 - This is newly added in V4, to add all the pm8008 common stuff.

 arch/arm64/boot/dts/qcom/pm8008.dtsi | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8008.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8008.dtsi b/arch/arm64/boot/dts/qcom/pm8008.dtsi
new file mode 100644
index 0000000..e23478c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8008.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause
+// Copyright (c) 2021, The Linux Foundation. All rights reserved.
+
+pm8008_chip: pm8008@8 {
+	compatible = "qcom,pm8008";
+	reg = <0x8>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+};
+
+pm8008_ldo: pm8008@9 {
+	compatible = "qcom,pm8008";
+	reg = <0x9>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	pm8008_regulators: regulators {
+		compatible = "qcom,pm8008-regulators";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8008_l1: l1@4000 {
+			reg = <0x4000>;
+			regulator-name = "pm8008_l1";
+		};
+
+		pm8008_l2: l2@4100 {
+			reg = <0x4100>;
+			regulator-name = "pm8008_l2";
+		};
+
+		pm8008_l3: l3@4200 {
+			reg = <0x4200>;
+			regulator-name = "pm8008_l3";
+		};
+
+		pm8008_l4: l4@4300 {
+			reg = <0x4300>;
+			regulator-name = "pm8008_l4";
+		};
+
+		pm8008_l5: l5@4400 {
+			reg = <0x4400>;
+			regulator-name = "pm8008_l5";
+		};
+
+		pm8008_l6: l6@4500 {
+			reg = <0x4500>;
+			regulator-name = "pm8008_l6";
+		};
+
+		pm8008_l7: l7@4600 {
+			reg = <0x4600>;
+			regulator-name = "pm8008_l7";
+		};
+	};
+};
-- 
2.7.4

