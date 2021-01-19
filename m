Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160EF2FC368
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jan 2021 23:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbhASW1P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 17:27:15 -0500
Received: from relay08.th.seeweb.it ([5.144.164.169]:55917 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728697AbhASRqM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 12:46:12 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 442803F115;
        Tue, 19 Jan 2021 18:44:24 +0100 (CET)
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
Subject: [PATCH v4 4/7] dt-bindings: regulator: qcom-labibb: Document soft start properties
Date:   Tue, 19 Jan 2021 18:44:18 +0100
Message-Id: <20210119174421.226541-5-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119174421.226541-1-angelogioacchino.delregno@somainline.org>
References: <20210119174421.226541-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document properties to configure soft start and discharge resistor
for LAB and IBB respectively.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/regulator/qcom-labibb-regulator.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
index 53853ec20fe2..7a507692f1ba 100644
--- a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
@@ -22,6 +22,11 @@ properties:
     type: object
 
     properties:
+      qcom,soft-start-us:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Regulator soft start time in microseconds.
+        enum: [200, 400, 600, 800]
+        default: 200
 
       interrupts:
         maxItems: 1
@@ -35,6 +40,11 @@ properties:
     type: object
 
     properties:
+      qcom,discharge-resistor-kohms:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Discharge resistor value in KiloOhms.
+        enum: [300, 64, 32, 16]
+        default: 300
 
       interrupts:
         maxItems: 1
-- 
2.30.0

