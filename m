Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62B015784BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 16:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234906AbiGROFq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 10:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235257AbiGROFq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 10:05:46 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E58CF5BA;
        Mon, 18 Jul 2022 07:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=SUAdQPFgaljHEqeilrFBAPgz3hJD62Ynrc+UtSifd2w=; b=mIj5YFWeG7yuc+0AIgcVRSMSQg
        BEg0j2Un5ODn010JAOR6q5D6LZRHe8OrQzmNGy9i2YNIJYyVfEA+bGD1nerCsbKWKoTj9hELEyz6f
        35K/XSXwCBEL9+1AP4Yj84303+cFZDnTW52Pa+Akby0gZqyNfVwDGw1IsOPIJpKShx7amhA6vTuI5
        lI1bSeRbNQ1WjczzuBg3gBlMmvgjgx2izh1NVhGw2H7su4b33RGNpxEvjqQ7dU+VrxrYCgdmXw86j
        cnXaXNwBGcm7mZvubtbzLEvfM7PSwaWruSC+cXZCFNnH/CcrN1F+bY5W9VXDRdPlCTi8KYfqoZlAG
        Ti6Sa/zg==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1oDRNR-008iC6-A6; Mon, 18 Jul 2022 16:05:37 +0200
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
Subject: [PATCH v2 3/5] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8974
Date:   Mon, 18 Jul 2022 16:03:42 +0200
Message-Id: <20220718140344.1831731-4-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718140344.1831731-1-stephan.gerhold@kernkonzept.com>
References: <20220718140344.1831731-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
Changes in v2:
  - Add if to the "allOf" list (suggested by Krzysztof)
---
NOTE: This will cause dtbs_check warnings on some MSM8974 DTBs without
commit 8d8be8dd7c1f5 ("ARM: dts: qcom: msm8974: Disable remoteprocs by
default") that was already applied by Bjorn.
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

