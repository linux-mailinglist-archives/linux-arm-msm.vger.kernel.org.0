Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECC7F249926
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Aug 2020 11:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgHSJRA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 05:17:00 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:8345 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbgHSJQ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 05:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597828616;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=QF9pEdpob/aapYjgmPjRf6gK63aNdtYCv2gYZ1UtYsQ=;
        b=OLdYXz+8DQJbUYYOo9Hc/vXacWtxDbM9fkWBlnnJD2ECHlKRbg5tM9jUVI5lvjmkf0
        SshCHT+GdRRPmbocsXrISqfGrjYbjjaIp/N4CbSxqeLco3J0482E0xZfRoeRV5l0TqGs
        KDSMufTfMeopInT+Jgl0S4MEggI6DXCS3ViZJi2XOI+J5C1+PWn5OLWUl/Uz1vGPXuXp
        UydTltxWcMsBh4qPLFwvw3JOtb6fTkuD6EsxTM4XAlXrcZw52YRaA/GIDrs3DWrdNa1X
        bm2znnX9gRCWG6MS40zYlZzDusPqOQZ4PRjF64+hEhYtsWjMoEXYV8O1r+XGIaB18A5j
        sR1g==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6NDwQo"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w7J9Gt0ST
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 19 Aug 2020 11:16:55 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mark Brown <broonie@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom: Document "aux-devs" property
Date:   Wed, 19 Aug 2020 11:15:32 +0200
Message-Id: <20200819091533.2334-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819091533.2334-1-stephan@gerhold.net>
References: <20200819091533.2334-1-stephan@gerhold.net>
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
index c814e867850f..248df5056fec 100644
--- a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
@@ -55,6 +55,14 @@ This binding describes the APQ8096 sound card, which uses qdsp for audio.
 	Value type: <stringlist>
 	Definition: The user-visible name of this sound card.
 
+- aux-devs
+	Usage: optional
+	Value type: <phandles with arguments>
+	Definition: A list of phandles for auxiliary devices (e.g. analog
+		    amplifiers) that do not appear directly within the DAI
+		    links. Should be connected to another audio component
+		    using "audio-routing".
+
 = dailinks
 Each subnode of sndcard represents either a dailink, and subnodes of each
 dailinks would be cpu/codec/platform dais.
diff --git a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
index ca8c89e88bfa..3d5cbe953cf7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
@@ -24,6 +24,14 @@ This binding describes the SDM845 sound card, which uses qdsp for audio.
 	Value type: <stringlist>
 	Definition: The user-visible name of this sound card.
 
+- aux-devs
+	Usage: optional
+	Value type: <phandles with arguments>
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

