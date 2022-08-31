Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDEE65A8052
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 16:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbiHaOgp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 10:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbiHaOgo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 10:36:44 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA9E51A18;
        Wed, 31 Aug 2022 07:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nGSmRsAujBazAHqrtfh3QSvd8Ae4QbEgTLD1kEu2UgU=; b=LzPYtetfSnl4DGNKoCaeAZE4P4
        Z6aw/gZG24wjm6mFAcuWgNov5G8jTHkqmbKM3iOXFyBgUKkF1CnZ7hkQdabDgM6QyfNaoJ8hNONrt
        lpJqeqZq9XPeYKiMKq8CHDJeOQl5uY4jmhHTWLoVZXlsh+0R2SetzxyMXiA2WuB0X2N8mjS40BrSU
        KKSK+lxhOMubmqM+h8/m41yJwqjnm1S3+HfCLcNyBjaq13m4aCXGfKea75iezgmSmiSClm5zwYzn8
        KFID7KsWNCkhiSoYXFT2r6nK28rpwOc3agFycW2nXLFKraYkkjkSOI9UQRWQDOE5leHNqVektSDCu
        OXEExdAA==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1oTO44-003wS7-9Z; Wed, 31 Aug 2022 15:47:32 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <andersson@kernel.org>
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
Subject: [PATCH v3 3/7] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8974
Date:   Wed, 31 Aug 2022 15:46:22 +0200
Message-Id: <20220831134626.2803117-4-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220831134626.2803117-1-stephan.gerhold@kernkonzept.com>
References: <20220831134626.2803117-1-stephan.gerhold@kernkonzept.com>
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
Changes in v3: None
Changes in v2:
  - Add if to the "allOf" list (suggested by Krzysztof)
---
 .../remoteproc/qcom,msm8916-mss-pil.yaml         | 16 ++++++++++++++++
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt | 16 ----------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index e4ac4889fc92..c7e594873648 100644
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
@@ -181,6 +185,18 @@ required:
   - smd-edge
 
 allOf:
+  # mss-supply is only valid (and required) for MSM8974
+  - if:
+      properties:
+        compatible:
+          const: qcom,msm8974-mss-pil
+    then:
+      required:
+        - mss-supply
+    else:
+      properties:
+        mss-supply: false
+
   # Fallbacks for deprecated properties
   - oneOf:
       - required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 11862b6c2339..5923c0447e2d 100644
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

