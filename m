Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 056BA611E83
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 02:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbiJ2AAO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 20:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbiJ2AAG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 20:00:06 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974F01900A;
        Fri, 28 Oct 2022 17:00:04 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 1CCACFF80F;
        Fri, 28 Oct 2022 23:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1667001598;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UEYlWh78STx8kM7HdfKAssnfJ9FCt1Mok1R8ei+AmNY=;
        b=e8517KkBQ6XkYOpU3YdF4RvgZDguqK03Sk4EcOEa4oQB84Sz7SHVwl1hcVckcNl9SOmSsJ
        REyjtbeLsnM11NWSWWFuYsVvA1exiAd4fFxu3gQeGW0lPZv90IHFQP9SjkLW6Z4ittLM8a
        2ht+gWanmogiE2OchmVHiWFWwh8ERkRmomFoNdNK62EZiBAeiUyxppmLGEa7n+zep3yNY/
        djNlr5WAnEk2krmDyFzE126JPtxljRbXlRetg0wFVxiJik3TaRlS0jnRh+lky/lpgnTHOI
        GTD8+QRLWo8vqBwK0ljvY0S1KcT8PA4Sffw8VccMU67eskMO17ehFh8uaNPzgg==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 12/12] dt-bindings: mtd: Constrain the list of parsers
Date:   Sat, 29 Oct 2022 01:59:33 +0200
Message-Id: <20221028235933.934850-13-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028235933.934850-1-miquel.raynal@bootlin.com>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Parser compatibles cannot be used anywhere, and the list is limited. In
order to constrain this list, enumerate them all under the top
"partitions" subnode. New parsers will have to add their own compatible
here as well.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/mtd.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index bddb7bdf441b..29db0b5c115e 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -27,13 +27,29 @@ properties:
   partitions:
     type: object
     properties:
+      compatible:
+        contains:
+          enum:
+            - fixed-partitions
+            - arm,arm-firmware-suite
+            - brcm,bcm4908-partitions
+            - brcm,bcm947xx-cfe-partitions
+            - nksys,ns-partitions
+            - nvmem-cells
+            - qcom,smem-part
+            - redboot-fis
+
       '#address-cells': true
+
       '#size-cells': true
 
     patternProperties:
       "partition@[0-9a-f]+":
         $ref: partitions/partition.yaml
 
+    required:
+      - compatible
+
 patternProperties:
   "@[0-9a-f]+$":
     $ref: partitions/partition.yaml
-- 
2.34.1

