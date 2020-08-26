Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D59252AC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 11:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbgHZJwZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 05:52:25 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:14699 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728303AbgHZJwY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 05:52:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1598435538;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=PtOA7FAw/iEqDUeGc5Ioxizj0fv1lckLU2YvxJLvd3o=;
        b=XNfJblBsiaUx0k1rnKyBYfEHm6IESt2ih+Sv84XVQTFfmp9uNpNYkCsvk6K933gqxl
        xw5U5Esb//Z5Hzp5haegvjRTSt+1p+AwJZnc2ta9FL4mB6dmfSp5IX3Q7KSZm83nvn+u
        tGPhjt2GkT97caUneezvFEQrcbiTjSQI2qZ/rNiJsk9K0bQyDGiBVSpz5WuzNnuOGM+j
        OIoU0vo8C9xbAXf/NLVNdtKLizpNq02WIBsEbp1Omxag7wAWf4e/kjKEnKdB40F/4FCF
        W0coP7a6LXE9kKkoV4xxuo0OqJnOf1WPXX+B8mqaUdNnRLPRmVTOtqEJ4J8X1m+kNXze
        yG8Q==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6NYn8D"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w7Q9qHl6V
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 26 Aug 2020 11:52:17 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mark Brown <broonie@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: qcom: Document "aux-devs" property
Date:   Wed, 26 Aug 2020 11:51:40 +0200
Message-Id: <20200826095141.94017-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826095141.94017-1-stephan@gerhold.net>
References: <20200826095141.94017-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In some cases we need to probe additional audio components that do
not appear as part of the DAI links specified in the device tree.
Examples for this are auxiliary devices such as analog amplifiers
or codecs.

To make them work they need to be added as part of "aux-devs"
and connected to some other audio component using the audio routes
configurable using "(qcom,)audio-routing".

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../devicetree/bindings/sound/qcom,apq8016-sbc.txt        | 7 +++++++
 Documentation/devicetree/bindings/sound/qcom,apq8096.txt  | 8 ++++++++
 Documentation/devicetree/bindings/sound/qcom,sdm845.txt   | 8 ++++++++
 3 files changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
index 84b28dbe9f15..23998262a0a7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
@@ -34,6 +34,13 @@ Required properties:
 			  * DMIC
 			  * Ext Spk
 
+Optional properties:
+
+- aux-devs		: A list of phandles for auxiliary devices (e.g. analog
+			  amplifiers) that do not appear directly within the DAI
+			  links. Should be connected to another audio component
+			  using "qcom,audio-routing".
+
 Dai-link subnode properties and subnodes:
 
 Required dai-link subnodes:
diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt b/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
index c814e867850f..e1b9fa8a5bf8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
@@ -55,6 +55,14 @@ This binding describes the APQ8096 sound card, which uses qdsp for audio.
 	Value type: <stringlist>
 	Definition: The user-visible name of this sound card.
 
+- aux-devs
+	Usage: optional
+	Value type: <array of phandles>
+	Definition: A list of phandles for auxiliary devices (e.g. analog
+		    amplifiers) that do not appear directly within the DAI
+		    links. Should be connected to another audio component
+		    using "audio-routing".
+
 = dailinks
 Each subnode of sndcard represents either a dailink, and subnodes of each
 dailinks would be cpu/codec/platform dais.
diff --git a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
index ca8c89e88bfa..de4c604641da 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
@@ -24,6 +24,14 @@ This binding describes the SDM845 sound card, which uses qdsp for audio.
 	Value type: <stringlist>
 	Definition: The user-visible name of this sound card.
 
+- aux-devs
+	Usage: optional
+	Value type: <array of phandles>
+	Definition: A list of phandles for auxiliary devices (e.g. analog
+		    amplifiers) that do not appear directly within the DAI
+		    links. Should be connected to another audio component
+		    using "audio-routing".
+
 = dailinks
 Each subnode of sndcard represents either a dailink, and subnodes of each
 dailinks would be cpu/codec/platform dais.
-- 
2.28.0

