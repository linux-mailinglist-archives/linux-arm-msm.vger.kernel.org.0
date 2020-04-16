Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C14A1AC982
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 17:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395164AbgDPPXk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 11:23:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:37194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2395158AbgDPPXh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 11:23:37 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DD784206D6;
        Thu, 16 Apr 2020 15:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587050616;
        bh=IzkNZB35W1ndrDT9IYOyxKuHacGeFfTHARmLelJ2Y4A=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=0itGvQ0TRTSbAX89qQPxyd624QQHZgcthxDJZuTh1ggkUswcN5j1nXOLbnVSHqJue
         fYC5kBVkTgl2kBYymGsgWY89hXTA2mmnHCprGo8W0vppPvtvfHjsNtmrF91M2+aoJN
         narHOBRK3+6V5J429mTBb+5Vu4V1rhQRkEBtNaf4=
Date:   Thu, 16 Apr 2020 16:23:33 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     alsa-devel@alsa-project.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Applied "ASoC: qdsp6: Suggest more generic node names" to the asoc tree
In-Reply-To:  <20200415081159.1098-1-stephan@gerhold.net>
Message-Id:  <applied-20200415081159.1098-1-stephan@gerhold.net>
X-Patchwork-Hint: ignore
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   ASoC: qdsp6: Suggest more generic node names

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 35c638d039bbabbca7affb52960d468951d811c1 Mon Sep 17 00:00:00 2001
From: Stephan Gerhold <stephan@gerhold.net>
Date: Wed, 15 Apr 2020 10:11:58 +0200
Subject: [PATCH] ASoC: qdsp6: Suggest more generic node names

Change the listed examples to use more generic node names, representing
the class of the device nodes:

  - apr-service@<id>
  - dai@<id>

Both names are already in use in arch/arm64/boot/dts/qcom/sdm845.dtsi.

Also add #address-cells + #size-cells to the q6asm example,
without them the example produces dtc warnings.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20200415081159.1098-1-stephan@gerhold.net
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1

