Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B22C4743E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Dec 2021 14:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232356AbhLNNwc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 08:52:32 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.219]:12848 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231995AbhLNNwc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 08:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1639489947;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=pYibwlUUBQifFciJnYB0q0+Tq2C0+Rty8Kco70yJ1mY=;
    b=IOwAtOfgJmGcA+jfZ7syljSSjwLKOLyQbti2fw7bl95hygiwGQvXCvMMqzhW/xWoes
    BqQ21LeIh2yh1WzsYduhK7GgsQskAnqrW/JmLomNzajtiKhqIKSJV/9nBRfFjUOCkTuL
    97lBmTGo9FlmsvHHpos2kamvi3c2ouVrBfYlPFG8mjJ70ddHUyD4q/KJL1GishTuYtog
    J90dk4sS7F8qZJOMe4Fq5rsM356weR1fH6naPeffaXFv33+8c2C2klVbUC+tfa7EaP5W
    bIxEdMOHhWc/tC72Q22LO5xaU3sPc1xrVgCUvxMT+J7507Ay4ol0Ox5y9HbIwwHOkLkp
    Y8YA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL1O/hR"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.35.3 AUTH)
    with ESMTPSA id x08baexBEDqR8bA
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 14 Dec 2021 14:52:27 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] arm64: dts: qcom: apq8016-sbc: Fix dtbs_check warnings for &sound
Date:   Tue, 14 Dec 2021 14:51:24 +0100
Message-Id: <20211214135124.2380-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom,apq8016-sbc-sndcard is now covered by the qcom,sm8250.yaml schema
which has slightly different recommendations for the naming of
properties and nodes. The old naming is still functional but
deprecated. Update the &sound node in apq8016-sbc to fix the following
dtbs_check warnings:

  apq8016-sbc.dt.yaml: sound@7702000: 'model' is a required property
    From schema: sound/qcom,sm8250.yaml
  apq8016-sbc.dt.yaml: sound@7702000: 'external-dai-link@0', ...
    do not match any of the regexes: '.*-dai-link$', ...
    From schema: sound/qcom,sm8250.yaml

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index a5320d6d30e7..0c566876333a 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -351,12 +351,12 @@ &sound {
 	pinctrl-0 = <&cdc_pdm_lines_act &ext_sec_tlmm_lines_act &ext_mclk_tlmm_lines_act>;
 	pinctrl-1 = <&cdc_pdm_lines_sus &ext_sec_tlmm_lines_sus &ext_mclk_tlmm_lines_sus>;
 	pinctrl-names = "default", "sleep";
-	qcom,model = "DB410c";
-	qcom,audio-routing =
+	model = "DB410c";
+	audio-routing =
 		"AMIC2", "MIC BIAS Internal2",
 		"AMIC3", "MIC BIAS External1";
 
-	external-dai-link@0 {
+	quaternary-dai-link {
 		link-name = "ADV7533";
 		cpu {
 			sound-dai = <&lpass MI2S_QUATERNARY>;
@@ -366,7 +366,7 @@ codec {
 		};
 	};
 
-	internal-codec-playback-dai-link@0 {
+	primary-dai-link {
 		link-name = "WCD";
 		cpu {
 			sound-dai = <&lpass MI2S_PRIMARY>;
@@ -376,7 +376,7 @@ codec {
 		};
 	};
 
-	internal-codec-capture-dai-link@0 {
+	tertiary-dai-link {
 		link-name = "WCD-Capture";
 		cpu {
 			sound-dai = <&lpass MI2S_TERTIARY>;
-- 
2.34.1

