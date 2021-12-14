Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E894744B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Dec 2021 15:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234890AbhLNOWs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 09:22:48 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:30551 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbhLNOWr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 09:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1639491755;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=z2GjOJisdAbabtu8mFVDMyV6/eqKuOCfC207QQYIfb8=;
    b=awM/icih3+mO5ims3FKIACYm9G4aoaBtPRq5PgwE6Eic+I8RojlL9gCLG7aDqCpTIn
    Jjdgbfd9FNIHTiR3FKLZhtMWNglZMKai/CpfoN3CyyL32u6IhB61OinpbapwU3bfc5g9
    KJJqGQ5l62KHGNLrqG25MyangAfXCy0uVRORrNUS8i/soWa30txwwRm7tkBsuzbxNjFa
    7sZXpTNQtjjEqF+E57OzQoOirdk8BAZNXPKef1O3AfsGzMDQg/4OsjROKSX2DRAcXxV3
    +UKqbs8dKieQd6jqOVIieiv8PLxl0jqYEgRo4H7ewSd+gzK5h42fXUZod/SBu3z5wINB
    ktPQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL1O/hR"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.35.3 AUTH)
    with ESMTPSA id x08baexBEEMZ8rX
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 14 Dec 2021 15:22:35 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Paul Cercueil <paul@crapouillou.net>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/4] ASoC: dt-bindings: qcom: sm8250: Document "pin-switches" and "widgets"
Date:   Tue, 14 Dec 2021 15:20:47 +0100
Message-Id: <20211214142049.20422-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211214142049.20422-1-stephan@gerhold.net>
References: <20211214142049.20422-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some sound card setups might require extra pin switches to allow
turning off certain audio components. There are two real examples for
this in smartphones/tablets based on MSM8916:

  1. Analog speaker amplifiers connected to headphone outputs.

     The MSM8916 analog codec does not have a separate "Line Out" port
     so some devices have an analog speaker amplifier connected to one
     of the headphone outputs. A pin switch is necessary to allow
     playback on headphones without also activating the speaker.

  2. External speaker codec also used as earpiece.

     Some smartphones have two front-facing (stereo) speakers that can
     be also configured to act as an earpiece during voice calls. A pin
     switch is needed to allow disabling the second speaker during
     voice calls.

There are existing bindings that allow setting up such pin switches in
simple-card.yaml. Document the same for Qcom sound cards.

One variant of example 1 above is added to the examples in the DT
schema: There is an analog speaker amplifier connected to the HPH_R
(right headphone channel) output. Adding a "Speaker" pin switch and
widget allows turning off the speaker when audio should be only played
via the connected headphones.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../devicetree/bindings/sound/qcom,sm8250.yaml   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index e50964c54bb9..4bfda04b4608 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -39,6 +39,14 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     description: User visible long sound card name
 
+  pin-switches:
+    description: List of widget names for which pin switches should be created.
+    $ref: /schemas/types.yaml#/definitions/string-array
+
+  widgets:
+    description: User specified audio sound widgets.
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+
   # Only valid for some compatibles (see allOf if below)
   reg: true
   reg-names: true
@@ -251,7 +259,15 @@ examples:
         reg-names = "mic-iomux", "spkr-iomux";
 
         model = "msm8916";
+        widgets =
+            "Speaker", "Speaker",
+            "Headphone", "Headphones";
+        pin-switches = "Speaker";
         audio-routing =
+            "Speaker", "Speaker Amp OUT",
+            "Speaker Amp IN", "HPH_R",
+            "Headphones", "HPH_L",
+            "Headphones", "HPH_R",
             "AMIC1", "MIC BIAS Internal1",
             "AMIC2", "MIC BIAS Internal2",
             "AMIC3", "MIC BIAS Internal3";
-- 
2.34.1

