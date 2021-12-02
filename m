Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F574665F3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 15:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358682AbhLBPAj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 10:00:39 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:28750 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347191AbhLBPAh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 10:00:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638457028;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=pMYDkCs49E4DXnqeiChk16zB4xqwukbwqREXbae/qPk=;
    b=Ek1XZ+DMrDXNnQU+vMlgGss074qwZ3M8fjkKq7OHcn90PaUyGvh7UpGdwd0hcYH5eL
    WsrerqdfcwYbCbk9oc3LKHuruW5RHcX/oCxI/m77btAW614ZMxbB0C21/dI5FOSbu1H9
    gRT+yZCfsqMVeGMGEwkZQTmtKFRYEbHD+/beKDgWcPvVgt4HDglKWfVU5/WKZjKBBKwZ
    kXJ8G9V0TG8dEtme1cIgjP4Cn4W87SI+fSs/TWwkqxAnBjVzd/u6lg619/+QP64Fh65b
    /oFGZCFT1d1IUISWXdfdJvyFjxBcXq8gYDxQjfhbAaelE75Nu82znGH7TZHdcUcQvk3E
    EOsg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fyLyu9s="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.34.10 AUTH)
    with ESMTPSA id j03bcbxB2Ev7pxz
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 2 Dec 2021 15:57:07 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mark Brown <broonie@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 4/5] ASoC: dt-bindings: qcom: Document qcom,msm8916-qdsp6-sndcard compatible
Date:   Thu,  2 Dec 2021 15:55:04 +0100
Message-Id: <20211202145505.58852-5-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211202145505.58852-1-stephan@gerhold.net>
References: <20211202145505.58852-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are two possible audio setups on MSM8916/APQ8016: Normally the audio
is routed through the audio/modem DSP (covered by the qdsp6 driver). During
upstreaming for the DragonBoard 410c it was decided to bypass it and
instead talk directly to the audio controller using the "lpass" driver.

Bypassing the DSP gives more control about the audio configuration but limits
the functionality: For example, routing audio through the audio/modem DSP is
strictly required for voice call audio. Also, without the special changes in
the DB410c firmware other MSM8916 devices can only use the bypass as long as
the modem DSP is not started. Otherwise, the firmware will assume control of
the LPASS hardware block and audio is no longer functional.

Add support for using the DSP audio setup instead using a new
"qcom,msm8916-qdsp6-sndcard" compatible. It is basically a mixture of
the apq8016-sbc-sndcard and the newer sm8250-sndcard, which uses
indirect QDSP6 DAI links instead of the direct LPASS DAI links.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../bindings/sound/qcom,sm8250.yaml           | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 97f13a0a71a9..e50964c54bb9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,apq8016-sbc-sndcard
+      - qcom,msm8916-qdsp6-sndcard
       - qcom,sm8250-sndcard
       - qcom,qrb5165-rb5-sndcard
 
@@ -91,6 +92,7 @@ allOf:
           contains:
             enum:
               - qcom,apq8016-sbc-sndcard
+              - qcom,msm8916-qdsp6-sndcard
     then:
       properties:
         reg:
@@ -239,3 +241,43 @@ examples:
             };
         };
     };
+
+  - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    #include <dt-bindings/sound/qcom,q6asm.h>
+    sound@7702000 {
+        compatible = "qcom,msm8916-qdsp6-sndcard";
+        reg = <0x07702000 0x4>, <0x07702004 0x4>;
+        reg-names = "mic-iomux", "spkr-iomux";
+
+        model = "msm8916";
+        audio-routing =
+            "AMIC1", "MIC BIAS Internal1",
+            "AMIC2", "MIC BIAS Internal2",
+            "AMIC3", "MIC BIAS Internal3";
+        aux-devs = <&speaker_amp>;
+
+        pinctrl-names = "default", "sleep";
+        pinctrl-0 = <&cdc_pdm_lines_act>;
+        pinctrl-1 = <&cdc_pdm_lines_sus>;
+
+        mm1-dai-link {
+            link-name = "MultiMedia1";
+            cpu {
+                sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+            };
+        };
+
+        primary-dai-link {
+            link-name = "Primary MI2S";
+            cpu {
+                sound-dai = <&q6afedai PRIMARY_MI2S_RX>;
+            };
+            platform {
+                sound-dai = <&q6routing>;
+            };
+            codec {
+                sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
+            };
+        };
+    };
-- 
2.34.1

