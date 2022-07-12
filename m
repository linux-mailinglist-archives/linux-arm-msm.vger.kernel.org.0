Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD9B7571A55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233201AbiGLMqK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiGLMqI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:46:08 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ECA99C250;
        Tue, 12 Jul 2022 05:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=50u/Rkp/D2+dT5sPpwLdkTr0yPgzVeHiCIXbZseKunI=; b=IEsMU316jyFfuWAIkR5Xy2wBRV
        9fNS7+d9fPVJP/etT4nwDJjwXJlIKhRdUKZUJ5+BJcJOP3BbqMc66f0+8lJEEaYz0UMo8dkHxtPZy
        Pk3NdTj47ArFlsmoOltRoVxPZgt+qUQmmh43vX9F1xkNHUbemMl+fELrICFXplnOoB79v5n/O4epm
        uRqb9xQ0hQO4roNqA0DdoLw5BmlnvJuAO3EGogBGRcvIBRXV4pWDujKTYyWJDMSBVVmPOzQNqeWwT
        KM4mWdcKZ6fvc855v2ZFTcWEN0Lk1G99FzFWdr8ojoA7u6wdBX6cinimcyeyUb369vsOGbRguwqGz
        fz9fxp2A==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1oBFH4-0087Gb-8k; Tue, 12 Jul 2022 14:45:58 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 4/6] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8974
Date:   Tue, 12 Jul 2022 14:44:19 +0200
Message-Id: <20220712124421.3129206-5-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "qcom,msm8974-mss-pil" binding is still similar enough to MSM8916
to be covered by the same DT schema. The only difference is the
additional "mss-supply", which can be easily handled using a single
if statement.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
Note: I generated this patch on top of Sibi's series [1] to avoid
conflicts later (I expect it will be picked up first).

[1]: https://lore.kernel.org/linux-arm-msm/1657020721-24939-1-git-send-email-quic_sibis@quicinc.com/
---
 .../remoteproc/qcom,msm8916-mss-pil.yaml         | 16 ++++++++++++++++
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt | 16 ----------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index 3968348dc982..ca7146551ba9 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - enum:
           - qcom,msm8916-mss-pil
+          - qcom,msm8974-mss-pil
 
       - const: qcom,q6v5-pil
         description: Deprecated, prefer using qcom,msm8916-mss-pil
@@ -76,6 +77,9 @@ properties:
   pll-supply:
     description: PLL proxy supply (control handed over after startup)
 
+  mss-supply:
+    description: MSS power domain supply (only valid for qcom,msm8974-mss-pil)
+
   resets:
     items:
       - description: MSS restart control
@@ -177,6 +181,18 @@ required:
   - qcom,smem-state-names
   - smd-edge
 
+# mss-supply is only valid (and required) for MSM8974
+if:
+  properties:
+    compatible:
+      const: qcom,msm8974-mss-pil
+then:
+  required:
+    - mss-supply
+else:
+  properties:
+    mss-supply: false
+
 # Fallbacks for deprecated properties
 allOf:
   - oneOf:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 3beb01da134b..9366ef087209 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -9,7 +9,6 @@ on the Qualcomm Hexagon core.
 	Definition: must be one of:
 		    "qcom,ipq8074-wcss-pil"
 		    "qcom,qcs404-wcss-pil"
-		    "qcom,msm8974-mss-pil"
 		    "qcom,msm8996-mss-pil"
 		    "qcom,msm8998-mss-pil"
 		    "qcom,sdm845-mss-pil"
@@ -37,7 +36,6 @@ on the Qualcomm Hexagon core.
 		    string:
 	qcom,ipq8074-wcss-pil:
 	qcom,qcs404-wcss-pil:
-	qcom,msm8974-mss-pil:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
 	qcom,msm8996-mss-pil:
 	qcom,msm8998-mss-pil:
@@ -68,8 +66,6 @@ on the Qualcomm Hexagon core.
 		    "gcc_axim_cbcr", "lcc_ahbfabric_cbc", "tcsr_lcc_cbc",
 		    "lcc_abhs_cbc", "lcc_tcm_slave_cbc", "lcc_abhm_cbc",
 		    "lcc_axim_cbc", "lcc_bcr_sleep"
-	qcom,msm8974-mss-pil:
-		    must be "iface", "bus", "mem", "xo"
 	qcom,msm8996-mss-pil:
 		    must be "iface", "bus", "mem", "xo", "gpll0_mss",
 		    "snoc_axi", "mnoc_axi", "pnoc", "qdss"
@@ -106,17 +102,6 @@ should be referenced as follows:
 	Definition: reference to the reserved-memory for the mba region followed
 		    by the mpss region
 
-For the compatible string below the following supplies are required:
-  "qcom,msm8974-mss-pil"
-- cx-supply: (deprecated, use power domain instead)
-- mss-supply:
-- mx-supply: (deprecated, use power domain instead)
-- pll-supply:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the regulators to be held on behalf of the
-		    booting of the Hexagon core
-
 For the compatible string below the following supplies are required:
   "qcom,qcs404-wcss-pil"
 - cx-supply:
@@ -144,7 +129,6 @@ For the compatible string below the following supplies are required:
 	Definition: The power-domains needed depend on the compatible string:
 	qcom,ipq8074-wcss-pil:
 		    no power-domain names required
-	qcom,msm8974-mss-pil:
 	qcom,msm8996-mss-pil:
 	qcom,msm8998-mss-pil:
 		    must be "cx", "mx"
-- 
2.30.2

