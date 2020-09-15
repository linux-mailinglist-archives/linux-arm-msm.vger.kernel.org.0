Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC88269F66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgIOHNe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:13:34 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:36243 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbgIOHN1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600153982;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=RhtJ9rB8K29zO0DO4Ym9hTmwzgWuhM25m8xdHRmnaZI=;
        b=NL/lHYhuDylHb+/X0fl3VBa6R+K9YtIkJNVjAX8qUcj9yEklFGygCEPNJJOi3yjAEx
        OcsKqjmO5UdvGMyuw1wvy0LgRGCyH0m6MfixaMiYdK+fVQ70feBGqykPRr2KAJExKjMm
        5uaShaDkYzOUDVr3Cow88l/lI4G7vAx2ZDM55dIJl/39QjNbah/9Q/XkVzBvrmzgvthx
        r04vwo2kwLVSa1vSOWTNK1bpDJ6fg3YAneS1TSQlf8hl2D5cbCYBAqvsQYFBRjL2hHP/
        rlo12QI1NMXOemujSDtWqzjuXfZLXYZmkBJFCQp57TLJ562LMwQuzipQ/xRHP0Kea9fH
        A0fw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6FOVM="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8F7D0rdu
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 15 Sep 2020 09:13:00 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 07/14] arm64: dts: qcom: msm8916: Minor style fixes
Date:   Tue, 15 Sep 2020 09:12:14 +0200
Message-Id: <20200915071221.72895-8-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915071221.72895-1-stephan@gerhold.net>
References: <20200915071221.72895-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix usages of spaces for indentation, break a long line
and remove duplicate new lines. Add some spaces where appropriate.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 10e177988555..eca3cd94d3d5 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -151,8 +151,8 @@ CPU3: cpu@3 {
 		};
 
 		L2_0: l2-cache {
-		      compatible = "cache";
-		      cache-level = <2>;
+			compatible = "cache";
+			cache-level = <2>;
 		};
 
 		idle-states {
@@ -225,7 +225,7 @@ CLUSTER_PD: power-domain-cluster {
 
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
-		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4)| IRQ_TYPE_LEVEL_HIGH)>;
+		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
 	thermal-zones {
@@ -393,7 +393,9 @@ smem {
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm";
-			clocks = <&gcc GCC_CRYPTO_CLK>, <&gcc GCC_CRYPTO_AXI_CLK>, <&gcc GCC_CRYPTO_AHB_CLK>;
+			clocks = <&gcc GCC_CRYPTO_CLK>,
+				 <&gcc GCC_CRYPTO_AXI_CLK>,
+				 <&gcc GCC_CRYPTO_AHB_CLK>;
 			clock-names = "core", "bus", "iface";
 			#reset-cells = <1>;
 
@@ -741,14 +743,14 @@ lpass: lpass@7708000 {
 			#size-cells = <0>;
 		};
 
-                lpass_codec: codec{
+		lpass_codec: codec@771c000 {
 			compatible = "qcom,msm8916-wcd-digital-codec";
 			reg = <0x0771c000 0x400>;
 			clocks = <&gcc GCC_ULTAUDIO_AHBFABRIC_IXFABRIC_CLK>,
 				 <&gcc GCC_CODEC_DIGCODEC_CLK>;
 			clock-names = "ahbix-clk", "mclk";
 			#sound-dai-cells = <1>;
-                };
+		};
 
 		sdhc_1: sdhci@7824000 {
 			compatible = "qcom,sdhci-msm-v4";
@@ -1159,7 +1161,6 @@ dsi_phy0: dsi-phy@1a98300 {
 			};
 		};
 
-
 		mpss: hexagon@4080000 {
 			compatible = "qcom,q6v5-pil";
 			reg = <0x04080000 0x100>,
@@ -1216,7 +1217,7 @@ fastrpc {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					cb@1{
+					cb@1 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <1>;
 					};
@@ -1474,7 +1475,7 @@ funnel1_out: endpoint {
 		};
 
 		debug0: debug@850000 {
-			compatible = "arm,coresight-cpu-debug","arm,primecell";
+			compatible = "arm,coresight-cpu-debug", "arm,primecell";
 			reg = <0x850000 0x1000>;
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
@@ -1483,7 +1484,7 @@ debug0: debug@850000 {
 		};
 
 		debug1: debug@852000 {
-			compatible = "arm,coresight-cpu-debug","arm,primecell";
+			compatible = "arm,coresight-cpu-debug", "arm,primecell";
 			reg = <0x852000 0x1000>;
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
@@ -1492,7 +1493,7 @@ debug1: debug@852000 {
 		};
 
 		debug2: debug@854000 {
-			compatible = "arm,coresight-cpu-debug","arm,primecell";
+			compatible = "arm,coresight-cpu-debug", "arm,primecell";
 			reg = <0x854000 0x1000>;
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
@@ -1501,7 +1502,7 @@ debug2: debug@854000 {
 		};
 
 		debug3: debug@856000 {
-			compatible = "arm,coresight-cpu-debug","arm,primecell";
+			compatible = "arm,coresight-cpu-debug", "arm,primecell";
 			reg = <0x856000 0x1000>;
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
@@ -1679,7 +1680,6 @@ cti15: cti@85b000 {
 			status = "disabled";
 		};
 
-
 		venus: video-codec@1d00000 {
 			compatible = "qcom,msm8916-venus";
 			reg = <0x01d00000 0xff000>;
-- 
2.28.0

