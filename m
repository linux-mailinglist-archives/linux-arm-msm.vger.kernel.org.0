Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C841A95FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 10:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635714AbgDOIQK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 04:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2635712AbgDOIQH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 04:16:07 -0400
X-Greylist: delayed 178 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 15 Apr 2020 01:16:06 PDT
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8233AC061A0C
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 01:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586938565;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=JxDtJn02UGDLaqiwxhMrK0P0y2GkLVhXtvW50yKCoHI=;
        b=g1YvXNRPsQIG7+KrGVpcxS032Bwca1AeyE57JBlzcCehptXSQipfkPrWbCqDdtWC5u
        JdNbNC+oGojzYkeJrBD5sEOMZyUeokCncpHrVt/0YzALMovhOujy7Dud2i/s5VIR3j8U
        lkZwJDaNgOLdL86LKrKTmTjHEx8WZegXir9sUKWf1u9J2PCL2jrLFRduD2d35z69Uv2c
        X5GIgpXDjTwaCh7uWDwMMOYDrVU94H8560TgH4nPHc3X4d4P+TWA3KkE43HRIoqAX9ZD
        qr5XTbmChet9QdRGTsO4Q0SCuhxVyoQL3yFAEvs+lLmGZkCKf6GpI8QtwoV8owoY9051
        aNNw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB526NccuO"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
        with ESMTPSA id k074e0w3F8D20Dp
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 10:13:02 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] dt-bindings: soc: qcom: apr: Use generic node names for APR services
Date:   Wed, 15 Apr 2020 10:11:59 +0200
Message-Id: <20200415081159.1098-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200415081159.1098-1-stephan@gerhold.net>
References: <20200415081159.1098-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Device nodes should be named according to the class of devices
they belong to. Change the suggested names of the subnodes to
apr-service@<id>, which is already in use in
arch/arm64/boot/dts/qcom/sdm845.dtsi.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../devicetree/bindings/soc/qcom/qcom,apr.txt | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
index f8fa71f5d84b..2e2f6dc351c0 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
@@ -65,30 +65,30 @@ which uses apr as communication between Apps and QDSP.
 		compatible = "qcom,apr-v2";
 		qcom,apr-domain = <APR_DOMAIN_ADSP>;
 
-		q6core@3 {
+		apr-service@3 {
 			compatible = "qcom,q6core";
 			reg = <APR_SVC_ADSP_CORE>;
 		};
 
-		q6afe@4 {
+		apr-service@4 {
 			compatible = "qcom,q6afe";
 			reg = <APR_SVC_AFE>;
 
 			dais {
 				#sound-dai-cells = <1>;
-				hdmi@1 {
-					reg = <1>;
+				dai@1 {
+					reg = <HDMI_RX>;
 				};
 			};
 		};
 
-		q6asm@7 {
+		apr-service@7 {
 			compatible = "qcom,q6asm";
 			reg = <APR_SVC_ASM>;
 			...
 		};
 
-		q6adm@8 {
+		apr-service@8 {
 			compatible = "qcom,q6adm";
 			reg = <APR_SVC_ADM>;
 			...
@@ -106,26 +106,26 @@ have no such dependency.
 		qcom,glink-channels = "apr_audio_svc";
 		qcom,apr-domain = <APR_DOMAIN_ADSP>;
 
-		q6core {
+		apr-service@3 {
 			compatible = "qcom,q6core";
 			reg = <APR_SVC_ADSP_CORE>;
 		};
 
-		q6afe: q6afe {
+		q6afe: apr-service@4 {
 			compatible = "qcom,q6afe";
 			reg = <APR_SVC_AFE>;
 			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
 			...
 		};
 
-		q6asm: q6asm {
+		q6asm: apr-service@7 {
 			compatible = "qcom,q6asm";
 			reg = <APR_SVC_ASM>;
 			qcom,protection-domain = "tms/servreg", "msm/slpi/sensor_pd";
 			...
 		};
 
-		q6adm: q6adm {
+		q6adm: apr-service@8 {
 			compatible = "qcom,q6adm";
 			reg = <APR_SVC_ADM>;
 			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-- 
2.26.1

