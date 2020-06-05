Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4581C1F002A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2020 21:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbgFETCz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jun 2020 15:02:55 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.171]:24108 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbgFETCz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jun 2020 15:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591383772;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=W4bCg1lG4HoFwBxz9czdfoDXzBcdOM4JgKX/4m0N6s0=;
        b=opMiiUiZ8uwe+7KZ1thprXQWdqR/dAp/Qx6+4AvdFna7J8a1+ItCAnkjjdCxygGKfl
        vGgF8kK/go9F27974stlcdDtGyuQX3c5nserPtx+U/0dYFmLF6nItlsSGbYp2WKoAsVe
        AjY3vALJr/Tlb4yl5JMNG5ERbQ9l3xbH863tJ6pJm2m7TuNQdlrcs7QahASvhzjGCmF7
        FbSuYHEhktv/AVRAs/IltNiJ6PfdxuRzK3zcs38kjbCnLWjRYfRZyaG3OoLfSo4fQMlG
        T/xHLh+0nP8DZTw1hvORzqj+6mOBbuvvW3F3v91aAv+knA342KuYjalnHoujVGV6NMN4
        DsbQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6IlKY="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.9.1 DYNA|AUTH)
        with ESMTPSA id U0b5f2w55IxsKmH
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 5 Jun 2020 20:59:54 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 4/4] arm64: dts: qcom: apq8016-sbc: Replace spaces with tabs
Date:   Fri,  5 Jun 2020 20:59:16 +0200
Message-Id: <20200605185916.318494-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605185916.318494-1-stephan@gerhold.net>
References: <20200605185916.318494-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

apq8016-sbc.dtsi uses spaces on some lines instead of tabs.
Make this consistent by converting them to tabs.

Also remove some redundant comments from the DAI link definitions
- this is already visible from the comment block before the "sound"
node or the device node entries itself.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 75 ++++++++++++-----------
 1 file changed, 38 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 8a4b790aa7ff..364014c96632 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -453,22 +453,23 @@ capture - Quat MI2S
 
 		*/
 
-                sound: sound {
-                        compatible = "qcom,apq8016-sbc-sndcard";
-                        reg = <0x07702000 0x4>, <0x07702004 0x4>;
-                        reg-names = "mic-iomux", "spkr-iomux";
-
-                        status = "okay";
-                        pinctrl-0 = <&cdc_pdm_lines_act &ext_sec_tlmm_lines_act &ext_mclk_tlmm_lines_act>;
-                        pinctrl-1 = <&cdc_pdm_lines_sus &ext_sec_tlmm_lines_sus &ext_mclk_tlmm_lines_sus>;
-                        pinctrl-names = "default", "sleep";
-                        qcom,model = "DB410c";
-                        qcom,audio-routing =
-                                "AMIC2", "MIC BIAS Internal2",
-                                "AMIC3", "MIC BIAS External1";
+		sound: sound {
+			compatible = "qcom,apq8016-sbc-sndcard";
+			reg = <0x07702000 0x4>, <0x07702004 0x4>;
+			reg-names = "mic-iomux", "spkr-iomux";
+
+			status = "okay";
+			pinctrl-0 = <&cdc_pdm_lines_act &ext_sec_tlmm_lines_act &ext_mclk_tlmm_lines_act>;
+			pinctrl-1 = <&cdc_pdm_lines_sus &ext_sec_tlmm_lines_sus &ext_mclk_tlmm_lines_sus>;
+			pinctrl-names = "default", "sleep";
+			qcom,model = "DB410c";
+			qcom,audio-routing =
+				"AMIC2", "MIC BIAS Internal2",
+				"AMIC3", "MIC BIAS External1";
+
 			external-dai-link@0 {
 				link-name = "ADV7533";
-				cpu { /* QUAT */
+				cpu {
 					sound-dai = <&lpass MI2S_QUATERNARY>;
 				};
 				codec {
@@ -476,26 +477,26 @@ codec {
 				};
 			};
 
-                        internal-codec-playback-dai-link@0 {            /* I2S - Internal codec */
-                                link-name = "WCD";
-                                cpu { /* PRIMARY */
-                                        sound-dai = <&lpass MI2S_PRIMARY>;
-                                };
-                                codec {
-                                        sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
-                                };
-                        };
-
-                        internal-codec-capture-dai-link@0 {             /* I2S - Internal codec */
-                                link-name = "WCD-Capture";
-                                cpu { /* PRIMARY */
-                                        sound-dai = <&lpass MI2S_TERTIARY>;
-                                };
-                                codec {
-                                        sound-dai = <&lpass_codec 1>, <&wcd_codec 1>;
-                                };
-                        };
-                };
+			internal-codec-playback-dai-link@0 {
+				link-name = "WCD";
+				cpu {
+					sound-dai = <&lpass MI2S_PRIMARY>;
+				};
+				codec {
+					sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
+				};
+			};
+
+			internal-codec-capture-dai-link@0 {
+				link-name = "WCD-Capture";
+				cpu {
+					sound-dai = <&lpass MI2S_TERTIARY>;
+				};
+				codec {
+					sound-dai = <&lpass_codec 1>, <&wcd_codec 1>;
+				};
+			};
+		};
 
 		spmi@200f000 {
 			pm8916@0 {
@@ -650,9 +651,9 @@ resin {
 };
 
 &wcd_codec {
-        status = "okay";
-        clocks = <&gcc GCC_CODEC_DIGCODEC_CLK>;
-        clock-names = "mclk";
+	status = "okay";
+	clocks = <&gcc GCC_CODEC_DIGCODEC_CLK>;
+	clock-names = "mclk";
 	qcom,mbhc-vthreshold-low = <75 150 237 450 500>;
 	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
 };
-- 
2.26.2

