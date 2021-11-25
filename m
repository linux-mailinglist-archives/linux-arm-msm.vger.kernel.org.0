Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0301645DC36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 15:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355599AbhKYOXM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 09:23:12 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:36216 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355646AbhKYOVL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 09:21:11 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 25 Nov 2021 06:16:03 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 Nov 2021 06:16:01 -0800
X-QCInternal: smtphost
Received: from ekangupt-linux.qualcomm.com ([10.204.67.11])
  by ironmsg02-blr.qualcomm.com with ESMTP; 25 Nov 2021 19:45:53 +0530
Received: by ekangupt-linux.qualcomm.com (Postfix, from userid 2319895)
        id 410954500; Thu, 25 Nov 2021 19:45:51 +0530 (IST)
From:   Jeya R <jeyr@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org
Cc:     Jeya R <jeyr@codeaurora.org>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: [PATCH 5/5] arm64: dts: qcom: add non-secure domain property to fastrpc nodes
Date:   Thu, 25 Nov 2021 19:45:44 +0530
Message-Id: <1637849744-24844-6-git-send-email-jeyr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637849744-24844-1-git-send-email-jeyr@codeaurora.org>
References: <1637849744-24844-1-git-send-email-jeyr@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

FastRPC DSP domain would be set as secure if non-secure dsp property is not
added to the fastrpc DT node. Add this property to DT files of  msm8916,
sdm845, sm8150, sm8250 and sm8350.

Signed-off-by: Jeya R <jeyr@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 2 ++
 arch/arm64/boot/dts/qcom/sm8150.dtsi  | 3 +++
 arch/arm64/boot/dts/qcom/sm8250.dtsi  | 3 +++
 arch/arm64/boot/dts/qcom/sm8350.dtsi  | 3 +++
 5 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index c1c42f2..137a479 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1365,6 +1365,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,smd-channels = "fastrpcsmd-apps-dsp";
 					label = "adsp";
+					qcom,non-secure-domain;
 
 					#address-cells = <1>;
 					#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5260875..4aebfed 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -838,6 +838,7 @@
 				compatible = "qcom,fastrpc";
 				qcom,glink-channels = "fastrpcglink-apps-dsp";
 				label = "adsp";
+				qcom,non-secure-domain;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -888,6 +889,7 @@
 				compatible = "qcom,fastrpc";
 				qcom,glink-channels = "fastrpcglink-apps-dsp";
 				label = "cdsp";
+				qcom,non-secure-domain;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 81b4ff2..9ac213b 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1751,6 +1751,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "sdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -2994,6 +2995,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -3439,6 +3441,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 6f6129b..62b8aa1 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2107,6 +2107,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "sdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -2172,6 +2173,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -3905,6 +3907,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index d134280..80f753c 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1278,6 +1278,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "sdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -1347,6 +1348,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -1643,6 +1645,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-- 
2.7.4

