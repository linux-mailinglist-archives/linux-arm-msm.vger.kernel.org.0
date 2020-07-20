Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F18F225A7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 10:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgGTIy1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 04:54:27 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.171]:11647 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgGTIyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 04:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595235261;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=42ZjqZGlXfOqMJOWHmPx2ivLCN+efJju3GqGC8iFf0c=;
        b=eOCqsUalCFubmia02VVvYWAb8eV3PGHRCML5bm8lzwG4nUUiM51jCn8yh4D/CfW0Mb
        97/89urNlJzF3Xx21pPXH5nZdp/ymn6BhzYgVvBAKo3Hyh7DQTowbJKASA5XD3HdNKmn
        cJEjW1HD2j30nKmvODi0hh0Snt1VqpZJ2/DAGnNuOHNZc7uqW9qyikuCUoI3LznCvPAU
        Ylt8ZYTWfkUNmsCxQt6BtzUaFzUTAXkhQ9E+YCJIE/qquGuOpIIFOgYBmFZEKLxxkgUI
        eI2LfF4iP+OYgBNWmupOeBEY6WTzBAipZO64w5gmyvdVT+6xQmB1LrxuNHKacfo9wqdt
        /CfA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6NeHYC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew6K8sJdgG
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 20 Jul 2020 10:54:19 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 04/10] arm64: dts: qcom: msm8916: Add more labels
Date:   Mon, 20 Jul 2020 10:54:00 +0200
Message-Id: <20200720085406.6716-5-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720085406.6716-1-stephan@gerhold.net>
References: <20200720085406.6716-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a few more labels to device nodes declared in msm8916.dtsi
so that we can set all needed properties using labels in the
board-specific device tree part.

Also rename the "otg" label to "usb" to allow grouping it with
the USB PHY (usb_hs_phy) node when ordering referenced labels
alphabetically.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 40 +++++++++++++--------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8b12961f3269..acbaed23bbdd 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -781,7 +781,7 @@ sdhc_2: sdhci@7864000 {
 			status = "disabled";
 		};
 
-		otg: usb@78d9000 {
+		usb: usb@78d9000 {
 			compatible = "qcom,ci-hdrc";
 			reg = <0x78d9000 0x200>,
 			      <0x78d9200 0x200>;
@@ -809,7 +809,7 @@ usb_hs_phy: phy {
 					#phy-cells = <0>;
 					clocks = <&xo_board>, <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
 					clock-names = "ref", "sleep";
-					resets = <&gcc GCC_USB2A_PHY_BCR>, <&otg 0>;
+					resets = <&gcc GCC_USB2A_PHY_BCR>, <&usb 0>;
 					reset-names = "phy", "por";
 					qcom,init-seq = /bits/ 8 <0x0 0x44
 						0x1 0x6b 0x2 0x24 0x3 0x13>;
@@ -1151,7 +1151,7 @@ dsi_phy0: dsi-phy@1a98300 {
 		};
 
 
-		hexagon@4080000 {
+		mpss: hexagon@4080000 {
 			compatible = "qcom,q6v5-pil";
 			reg = <0x04080000 0x100>,
 			      <0x04020000 0x040>;
@@ -1289,7 +1289,7 @@ wifi {
 			};
 		};
 
-		tpiu@820000 {
+		tpiu: tpiu@820000 {
 			compatible = "arm,coresight-tpiu", "arm,primecell";
 			reg = <0x820000 0x1000>;
 
@@ -1307,7 +1307,7 @@ tpiu_in: endpoint {
 			};
 		};
 
-		funnel@821000 {
+		funnel0: funnel@821000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x821000 0x1000>;
 
@@ -1348,7 +1348,7 @@ funnel0_out: endpoint {
 			};
 		};
 
-		replicator@824000 {
+		replicator: replicator@824000 {
 			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
 			reg = <0x824000 0x1000>;
 
@@ -1384,7 +1384,7 @@ replicator_in: endpoint {
 			};
 		};
 
-		etf@825000 {
+		etf: etf@825000 {
 			compatible = "arm,coresight-tmc", "arm,primecell";
 			reg = <0x825000 0x1000>;
 
@@ -1410,7 +1410,7 @@ etf_out: endpoint {
 			};
 		};
 
-		etr@826000 {
+		etr: etr@826000 {
 			compatible = "arm,coresight-tmc", "arm,primecell";
 			reg = <0x826000 0x1000>;
 
@@ -1428,7 +1428,7 @@ etr_in: endpoint {
 			};
 		};
 
-		funnel@841000 {	/* APSS funnel only 4 inputs are used */
+		funnel1: funnel@841000 {	/* APSS funnel only 4 inputs are used */
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x841000 0x1000>;
 
@@ -1476,7 +1476,7 @@ funnel1_out: endpoint {
 			};
 		};
 
-		debug@850000 {
+		debug0: debug@850000 {
 			compatible = "arm,coresight-cpu-debug","arm,primecell";
 			reg = <0x850000 0x1000>;
 			clocks = <&rpmcc RPM_QDSS_CLK>;
@@ -1485,7 +1485,7 @@ debug@850000 {
 			status = "disabled";
 		};
 
-		debug@852000 {
+		debug1: debug@852000 {
 			compatible = "arm,coresight-cpu-debug","arm,primecell";
 			reg = <0x852000 0x1000>;
 			clocks = <&rpmcc RPM_QDSS_CLK>;
@@ -1494,7 +1494,7 @@ debug@852000 {
 			status = "disabled";
 		};
 
-		debug@854000 {
+		debug2: debug@854000 {
 			compatible = "arm,coresight-cpu-debug","arm,primecell";
 			reg = <0x854000 0x1000>;
 			clocks = <&rpmcc RPM_QDSS_CLK>;
@@ -1503,7 +1503,7 @@ debug@854000 {
 			status = "disabled";
 		};
 
-		debug@856000 {
+		debug3: debug@856000 {
 			compatible = "arm,coresight-cpu-debug","arm,primecell";
 			reg = <0x856000 0x1000>;
 			clocks = <&rpmcc RPM_QDSS_CLK>;
@@ -1598,7 +1598,7 @@ etm3_out: endpoint {
 
 		/* System CTIs */
 		/* CTI 0 - TMC connections */
-		cti@810000 {
+		cti0: cti@810000 {
 			compatible = "arm,coresight-cti", "arm,primecell";
 			reg = <0x810000 0x1000>;
 
@@ -1609,7 +1609,7 @@ cti@810000 {
 		};
 
 		/* CTI 1 - TPIU connections */
-		cti@811000 {
+		cti1: cti@811000 {
 			compatible = "arm,coresight-cti", "arm,primecell";
 			reg = <0x811000 0x1000>;
 
@@ -1623,7 +1623,7 @@ cti@811000 {
 
 		/* Core CTIs; CTIs 12-15 */
 		/* CTI - CPU-0 */
-		cti@858000 {
+		cti12: cti@858000 {
 			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
 				     "arm,primecell";
 			reg = <0x858000 0x1000>;
@@ -1638,7 +1638,7 @@ cti@858000 {
 		};
 
 		/* CTI - CPU-1 */
-		cti@859000 {
+		cti13: cti@859000 {
 			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
 				     "arm,primecell";
 			reg = <0x859000 0x1000>;
@@ -1653,7 +1653,7 @@ cti@859000 {
 		};
 
 		/* CTI - CPU-2 */
-		cti@85a000 {
+		cti14: cti@85a000 {
 			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
 				     "arm,primecell";
 			reg = <0x85a000 0x1000>;
@@ -1668,7 +1668,7 @@ cti@85a000 {
 		};
 
 		/* CTI - CPU-3 */
-		cti@85b000 {
+		cti15: cti@85b000 {
 			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
 				     "arm,primecell";
 			reg = <0x85b000 0x1000>;
@@ -1821,7 +1821,7 @@ rpm {
 			qcom,ipc = <&apcs 8 0>;
 			qcom,smd-edge = <15>;
 
-			rpm-requests {
+			rpm_requests: rpm-requests {
 				compatible = "qcom,rpm-msm8916";
 				qcom,smd-channels = "rpm_requests";
 
-- 
2.27.0

