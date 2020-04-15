Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFC21A95FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 10:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635715AbgDOIQK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 04:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2635714AbgDOIQH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 04:16:07 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA84AC061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 01:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586938565;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=MEGcVkcXAjSuizW8Ns4m/GZAOVbeWi0P2cUdPTTRoN8=;
        b=Ytd5Pj18MtLzZf5bcvAveoa6rOuBrQgxa3F/5FiKL2QXVm1IFA8dUgtfFL+GS6KOER
        fs2+U2uO9hRMim5xWIpBQwo+2F2G3qei0C+7XEBMyS+Njh+6p5nA5ylPPUZuaLUut6VU
        XkmWk/+yXCst/x1Qr8GF2jIISDRtangVuYfGAqnsaMh8ThPV6InPl3sfP+g0HSupg16K
        HGBNKJv7t96EYh3E2KgGu78ph7UdU6lc6ZmEzODc4sXFgYGWVTERu7Lyto8HR7oRfiMq
        p3IPoi8Q9XlaU9qloOxduXePoh9DVuzbOo+mnoG8CaAfUMoqRjhaKwgp0nMN1Ppkc+xX
        Qb3A==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB526NccuO"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
        with ESMTPSA id k074e0w3F8D10Do
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 10:13:01 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/2] dt-bindings: ASoC: qdsp6: Suggest more generic node names
Date:   Wed, 15 Apr 2020 10:11:58 +0200
Message-Id: <20200415081159.1098-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the listed examples to use more generic node names, representing
the class of the device nodes:

  - apr-service@<id>
  - dai@<id>

Both names are already in use in arch/arm64/boot/dts/qcom/sdm845.dtsi.

Also add #address-cells + #size-cells to the q6asm example,
without them the example produces dtc warnings.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../devicetree/bindings/sound/qcom,q6adm.txt  |  2 +-
 .../devicetree/bindings/sound/qcom,q6afe.txt  | 46 +++++++++----------
 .../devicetree/bindings/sound/qcom,q6asm.txt  |  7 ++-
 .../devicetree/bindings/sound/qcom,q6core.txt |  2 +-
 4 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6adm.txt b/Documentation/devicetree/bindings/sound/qcom,q6adm.txt
index bbae426cdfb1..15c353a20de8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6adm.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,q6adm.txt
@@ -29,7 +29,7 @@ used by the apr service device.
 	Definition: Must be 0
 
 = EXAMPLE
-q6adm@8 {
+apr-service@8 {
 	compatible = "qcom,q6adm";
 	reg = <APR_SVC_ADM>;
 	q6routing: routing {
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
index d74888b9f1bb..4916dd6a0896 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
@@ -100,7 +100,7 @@ configuration of each dai. Must contain the following properties.
 
 = EXAMPLE
 
-q6afe@4 {
+apr-service@4 {
 	compatible = "qcom,q6afe";
 	reg = <APR_SVC_AFE>;
 
@@ -110,12 +110,12 @@ q6afe@4 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		hdmi@1 {
-			reg = <1>;
+		dai@1 {
+			reg = <HDMI_RX>;
 		};
 
-		tdm@24 {
-			reg = <24>;
+		dai@24 {
+			reg = <PRIMARY_TDM_RX_0>;
 			qcom,tdm-sync-mode = <1>:
 			qcom,tdm-sync-src = <1>;
 			qcom,tdm-data-out = <0>;
@@ -125,8 +125,8 @@ q6afe@4 {
 
 		};
 
-		tdm@25 {
-			reg = <25>;
+		dai@25 {
+			reg = <PRIMARY_TDM_TX_0>;
 			qcom,tdm-sync-mode = <1>:
 			qcom,tdm-sync-src = <1>;
 			qcom,tdm-data-out = <0>;
@@ -135,43 +135,43 @@ q6afe@4 {
 			qcom,tdm-data-align = <0>;
 		};
 
-		prim-mi2s-rx@16 {
-			reg = <16>;
+		dai@16 {
+			reg = <PRIMARY_MI2S_RX>;
 			qcom,sd-lines = <0 2>;
 		};
 
-		prim-mi2s-tx@17 {
-			reg = <17>;
+		dai@17 {
+			reg = <PRIMARY_MI2S_TX>;
 			qcom,sd-lines = <1>;
 		};
 
-		sec-mi2s-rx@18 {
-			reg = <18>;
+		dai@18 {
+			reg = <SECONDARY_MI2S_RX>;
 			qcom,sd-lines = <0 3>;
 		};
 
-		sec-mi2s-tx@19 {
-			reg = <19>;
+		dai@19 {
+			reg = <SECONDARY_MI2S_TX>;
 			qcom,sd-lines = <1>;
 		};
 
-		tert-mi2s-rx@20 {
-			reg = <20>;
+		dai@20 {
+			reg = <TERTIARY_MI2S_RX>;
 			qcom,sd-lines = <1 3>;
 		};
 
-		tert-mi2s-tx@21 {
-			reg = <21>;
+		dai@21 {
+			reg = <TERTIARY_MI2S_TX>;
 			qcom,sd-lines = <0>;
 		};
 
-		quat-mi2s-rx@22 {
-			reg = <22>;
+		dai@22 {
+			reg = <QUATERNARY_MI2S_RX>;
 			qcom,sd-lines = <0>;
 		};
 
-		quat-mi2s-tx@23 {
-			reg = <23>;
+		dai@23 {
+			reg = <QUATERNARY_MI2S_TX>;
 			qcom,sd-lines = <1>;
 		};
 	};
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt b/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
index 9f5378c51686..6b9a88d0ea3f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
@@ -51,13 +51,16 @@ configuration of each dai. Must contain the following properties.
 
 = EXAMPLE
 
-q6asm@7 {
+apr-service@7 {
 	compatible = "qcom,q6asm";
 	reg = <APR_SVC_ASM>;
 	q6asmdai: dais {
 		compatible = "qcom,q6asm-dais";
+		#address-cells = <1>;
+		#size-cells = <0>;
 		#sound-dai-cells = <1>;
-		mm@0 {
+
+		dai@0 {
 			reg = <0>;
 			direction = <2>;
 			is-compress-dai;
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6core.txt b/Documentation/devicetree/bindings/sound/qcom,q6core.txt
index 7f36ff8bec18..5cd4cc9b1fde 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6core.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,q6core.txt
@@ -15,7 +15,7 @@ used by the apr service device.
 		   example "qcom,q6core-v2.0"
 
 = EXAMPLE
-q6core@3 {
+apr-service@3 {
 	compatible = "qcom,q6core";
 	reg = <APR_SVC_ADSP_CORE>;
 };
-- 
2.26.1

