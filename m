Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A1545B402
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 06:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232856AbhKXFoF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 00:44:05 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:21739 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231421AbhKXFoF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 00:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637732456; x=1669268456;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=n2ByG1U6a8arle+otb2T4sVUn1mKPtFoPzYZfKwb0B8=;
  b=PFyvwC7hRq5MOD/L1/MQPsAQHgf1FCGYT4fOY8HjHeCfnu/2IxfrEZfJ
   mvmWHOhrzYofmCFyzEm/trQF4x5dDPQ0gwmQjrgC//kiLwXCHukmEh8VT
   Z5eg88DT2XgLhNjGUkwPffbREOGQql8w2flFW3cV+flGwauxbZRhG47Dd
   A=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Nov 2021 21:40:56 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 21:40:56 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 23 Nov 2021 21:40:55 -0800
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 23 Nov 2021 21:40:53 -0800
From:   Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <robh+dt@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Manikanta Pubbisetty" <quic_mpubbise@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: sc7280: Add WCN6750 WiFi node
Date:   Wed, 24 Nov 2021 11:10:38 +0530
Message-ID: <1637732438-17016-1-git-send-email-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding DTS node for WCN6750 WiFi chipset.

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
Depends on:
- https://patchwork.kernel.org/project/linux-arm-msm/patch/1637299488-22336-1-git-send-email-pillair@codeaurora.org/
- https://patchwork.kernel.org/project/linux-wireless/patch/1637693434-15462-20-git-send-email-quic_mpubbise@quicinc.com/

 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi |  7 +++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi     | 47 ++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index d623d71..ee152b9 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -598,3 +598,10 @@
 		bias-pull-up;
 	};
 };
+
+&wifi {
+	status = "okay";
+	wifi-firmware {
+		iommus = <&apps_smmu 0x1C02 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 1969e8dfb..eb7106f 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -83,6 +83,11 @@
 		#size-cells = <2>;
 		ranges;
 
+		wlan_ce_mem: memory@4cd000 {
+			no-map;
+			reg = <0x0 0x4cd000 0x0 0x1000>;
+		};
+
 		hyp_mem: memory@80000000 {
 			reg = <0x0 0x80000000 0x0 0x600000>;
 			no-map;
@@ -1579,6 +1584,48 @@
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		wifi: wifi@17a10040 {
+			compatible = "qcom,wcn6750-wifi";
+			reg = <0 0x17A10040 0 0x0>;
+			reg-names = "msi_addr";
+			iommus = <&apps_smmu 0x1C00 0x1>;
+			interrupts = <GIC_SPI 768 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 769 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 770 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 772 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 773 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 774 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 775 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 776 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 777 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 778 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 779 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 780 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 781 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 782 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 783 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 784 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 785 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 786 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 787 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 788 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 789 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 790 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 791 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 792 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 793 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 794 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 795 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 796 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 797 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 798 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 799 IRQ_TYPE_EDGE_RISING>;
+			qcom,rproc = <&remoteproc_wpss>;
+			memory-region = <&wlan_fw_mem &wlan_ce_mem>;
+			status = "disabled";
+		};
+
 		pcie1: pci@1c08000 {
 			compatible = "qcom,pcie-sc7280";
 			reg = <0 0x01c08000 0 0x3000>,
-- 
2.7.4

