Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38F714665EF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 15:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235854AbhLBPAi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 10:00:38 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:13251 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347169AbhLBPAh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 10:00:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638457026;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=A5gpLUQWRwoL/TsaFKZHgKW2VXbUq+LuUyss51S4cqM=;
    b=FoNgeE12Vjn82Lr2OBqhdjyEYLDxV+Z1qPDAmV1Woh4+CatoW9uXUZs2d5hihqc6h1
    jrFbPQ/YNhDyYb7tJRkRmCG6WDX2Bs0t6W8iM37XyrthJm8cTG51pJz+tbS0dBbs/rbL
    eoeR65Q8OG/Z+mY6nuxQzlA8gdoOA2Bz9eSBF8jN1X05XuveCa5jgGDPBCYLM+MkkaCi
    +VX34UJZjNHmDWHGQetj3uHjqAbE3HqNa0utW8HIoIDSsJLjUPLopIzEg+byGQ++8mRP
    KRzvr3Thq9l1g5smgtyEzJnzVLt3oX8sR/jfATJv+gILSvTcxFem5f3YztMwrs+Es6Z/
    9Hug==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fyLyu9s="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.34.10 AUTH)
    with ESMTPSA id j03bcbxB2Ev6pxx
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 2 Dec 2021 15:57:06 +0100 (CET)
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
Subject: [PATCH 2/5] ASoC: dt-bindings: qcom: sm8250: Document "aux-devs"
Date:   Thu,  2 Dec 2021 15:55:02 +0100
Message-Id: <20211202145505.58852-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211202145505.58852-1-stephan@gerhold.net>
References: <20211202145505.58852-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sm8250 audio driver uses the common Qualcomm device tree parser and
therefore already supports the "aux-devs" property that allows adding
additional auxiliary devices to the sound card (e.g. analog speaker
amplifiers that can be connected using "audio-routing").

Document the property in the DT schema for sm8250 as well. The description
is taken from simple-card.yaml which has a very similar property.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index a0f1d7340eb5..3123382297b8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -27,6 +27,12 @@ properties:
       being the connection's source. Valid names could be power supplies,
       MicBias of codec and the jacks on the board.
 
+  aux-devs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      List of phandles pointing to auxiliary devices, such
+      as amplifiers, to be added to the sound card.
+
   model:
     $ref: /schemas/types.yaml#/definitions/string
     description: User visible long sound card name
-- 
2.34.1

