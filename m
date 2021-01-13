Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 716BB2F538F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 20:44:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728869AbhAMTny (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 14:43:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728866AbhAMTnx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 14:43:53 -0500
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B29BC0617AA
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 11:42:19 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 717171FF9F;
        Wed, 13 Jan 2021 20:42:18 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 6/7] dt-bindings: regulator: qcom-labibb: Document SCP/OCP interrupts
Date:   Wed, 13 Jan 2021 20:42:13 +0100
Message-Id: <20210113194214.522238-7-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113194214.522238-1-angelogioacchino.delregno@somainline.org>
References: <20210113194214.522238-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Short-Circuit Protection (SCP) and Over-Current Protection (OCP) are
now implemented in the driver: document the interrupts.
This also fixes wrong documentation about the SCP interrupt for LAB.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../regulator/qcom-labibb-regulator.yaml      | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
index 7a507692f1ba..cf784bd1f5e5 100644
--- a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
@@ -29,9 +29,10 @@ properties:
         default: 200
 
       interrupts:
-        maxItems: 1
+        minItems: 1
+        maxItems: 2
         description:
-          Short-circuit interrupt for lab.
+          Short-circuit and over-current interrupts for lab.
 
     required:
       - interrupts
@@ -47,9 +48,10 @@ properties:
         default: 300
 
       interrupts:
-        maxItems: 1
+        minItems: 1
+        maxItems: 2
         description:
-          Short-circuit interrupt for lab.
+          Short-circuit and over-current interrupts for ibb.
 
     required:
       - interrupts
@@ -67,13 +69,15 @@ examples:
       compatible = "qcom,pmi8998-lab-ibb";
 
       lab {
-        interrupts = <0x3 0x0 IRQ_TYPE_EDGE_RISING>;
-        interrupt-names = "sc-err";
+        interrupts = <0x3 0xde 0x1 IRQ_TYPE_EDGE_RISING>,
+                     <0x3 0xde 0x0 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-names = "sc-err", "ocp";
       };
 
       ibb {
-        interrupts = <0x3 0x2 IRQ_TYPE_EDGE_RISING>;
-        interrupt-names = "sc-err";
+        interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>,
+                     <0x3 0xdc 0x0 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-names = "sc-err", "ocp";
       };
     };
 
-- 
2.29.2

