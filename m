Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49EAD39A31C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 16:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbhFCO2c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 10:28:32 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44884 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbhFCO2c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 10:28:32 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 153EQkDm012045;
        Thu, 3 Jun 2021 09:26:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622730406;
        bh=fIVNwmif1ogtvdg6K8Ndbxh5RbYIcRehUlgIhqe5KYE=;
        h=From:To:CC:Subject:Date;
        b=jmiE0luU0xEBlm6WxI6FvWVMbs7ZmTbZEMnZms75jrQWzDaQyDs1P4HzbWnhrI1L3
         JTiNUeGs4nW6iv9ZphSRN+yUbLNIRAjeiNsw2zOlV9UDjEn0t9poukQP9fy/KUl1Jo
         pgeMrTHTFaCrIGnrndLMIs4ncIMZgC3whnHBRWuQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 153EQkPX009259
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 3 Jun 2021 09:26:46 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 3 Jun
 2021 09:26:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 3 Jun 2021 09:26:46 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 153EQjU2087089;
        Thu, 3 Jun 2021 09:26:45 -0500
Received: from localhost ([10.250.35.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 153EQjQC024229;
        Thu, 3 Jun 2021 09:26:45 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH] dt-bindings: remoteproc: qcom: pas: Fix indentation warnings
Date:   Thu, 3 Jun 2021 09:26:39 -0500
Message-ID: <20210603142639.8335-1-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The list indentation should always be 2 spaces more than the preceding
keyword. A few of the items are only using 1 space, and resulting in
warnings with dt_binding_check. Fix these.

Fixes: cf107e98d024 ("dt-bindings: remoteproc: qcom: pas: Convert binding to YAML")
Signed-off-by: Suman Anna <s-anna@ti.com>
---
Hi Bjorn,

This patch is for you to pick up since you staged the corresponding YAML
conversion patch. Issue found when double-checking one of my bindings on
latest next.

regards
Suman

 .../bindings/remoteproc/qcom,adsp.yaml        | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 6c11812385ca..9ea05e608bc1 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -329,7 +329,7 @@ allOf:
             - description: CX power domain
         power-domain-names:
           items:
-           - const: cx
+            - const: cx
 
   - if:
       properties:
@@ -345,7 +345,7 @@ allOf:
             - description: SSC-CX power domain
         power-domain-names:
           items:
-           - const: ssc_cx
+            - const: ssc_cx
       required:
         - px-supply
 
@@ -365,10 +365,10 @@ allOf:
             - description: MSS power domain
         power-domain-names:
           items:
-           - const: load_state
-           - const: cx
-           - const: mx
-           - const: mss
+            - const: load_state
+            - const: cx
+            - const: mx
+            - const: mss
 
   - if:
       properties:
@@ -385,8 +385,8 @@ allOf:
             - description: CX power domain
         power-domain-names:
           items:
-           - const: load_state
-           - const: cx
+            - const: load_state
+            - const: cx
 
   - if:
       properties:
@@ -404,9 +404,9 @@ allOf:
             - description: MSS power domain
         power-domain-names:
           items:
-           - const: load_state
-           - const: cx
-           - const: mss
+            - const: load_state
+            - const: cx
+            - const: mss
 
   - if:
       properties:
@@ -422,8 +422,8 @@ allOf:
             - description: MSS power domain
         power-domain-names:
           items:
-           - const: cx
-           - const: mss
+            - const: cx
+            - const: mss
 
   - if:
       properties:
@@ -444,9 +444,9 @@ allOf:
             - description: LMX power domain
         power-domain-names:
           items:
-           - const: load_state
-           - const: lcx
-           - const: lmx
+            - const: load_state
+            - const: lcx
+            - const: lmx
 
   - if:
       properties:
@@ -463,9 +463,9 @@ allOf:
             - description: MXC power domain
         power-domain-names:
           items:
-           - const: load_state
-           - const: cx
-           - const: mxc
+            - const: load_state
+            - const: cx
+            - const: mxc
 
   - if:
       properties:
-- 
2.30.1

