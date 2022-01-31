Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D03274A47CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 14:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378551AbiAaNKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 08:10:17 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:15809 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1377441AbiAaNKQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 08:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1643634617; x=1675170617;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=V16p3x2BPGyaA9WkYWk0ijzhzBn4py9uChieJntlJqU=;
  b=TKdw9naXTyLLJvNcfaxqKEIKpufWKgjggsFpGmus7EKgOIoz/hjg07hX
   sS71Ly5oj85qiUOOMsw8RnGic6KgsKpRFYhV+0e+9hwI8cZRySPWQyiMO
   DBv+5UM5H7kbiK2hrcfnLb4XJLUSbnWWNj+ipGn2lhGkUnEIS0KW1fIc9
   c=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 31 Jan 2022 05:10:16 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 05:10:16 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 31 Jan 2022 05:10:16 -0800
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 31 Jan 2022 05:10:13 -0800
From:   Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <robh+dt@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Manikanta Pubbisetty" <quic_mpubbise@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: sc7280: Add nodes to support WoW on WCN6750
Date:   Mon, 31 Jan 2022 18:40:04 +0530
Message-ID: <1643634604-17612-1-git-send-email-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add nodes to support WoW (Wake on Wireless) feature on WCN6750
WiFi hardware.

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
Depends on:
- https://patchwork.kernel.org/project/linux-arm-msm/list/?series=609101
- https://patchwork.kernel.org/project/linux-wireless/list/?series=608934

Changes from V1:
- Compilation Fixes

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index bb57274..5d10b5f 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -517,6 +517,17 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		wlan_smp2p_out: wlan-ap-to-wpss {
+			qcom,entry-name = "wlan";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wlan_smp2p_in: wlan-wpss-to-ap {
+			qcom,entry-name = "wlan";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	pmu {
@@ -1619,6 +1630,8 @@
 			qcom,rproc = <&remoteproc_wpss>;
 			memory-region = <&wlan_fw_mem &wlan_ce_mem>;
 			status = "disabled";
+			qcom,smem-states = <&wlan_smp2p_out 0>;
+			qcom,smem-state-names = "wlan-smp2p-out";
 		};
 
 		pcie1: pci@1c08000 {
-- 
2.7.4

