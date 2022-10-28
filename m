Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBC3C611E7F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 02:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbiJ2AAG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 20:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiJ2AAC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 20:00:02 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A88917E36;
        Fri, 28 Oct 2022 16:59:58 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 5F1A3FF80D;
        Fri, 28 Oct 2022 23:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1667001596;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GhGJmrY4S5pbiS6htFjWyxWRV0tdapQgnC4CUqJRsQo=;
        b=PNMSPnI4t/ryFKEpCNgXTzVy7OIt9eNS0evQ1YaVNmJ8o0Y3c3L5S4+A9PJwuRIFefelQH
        4Faz2YOqKHGSKuffbs7W0GwrLT19pHDnMbXhru01g002LGbkuXUgNjZSuzth+QmTl/x+A8
        dOF1kJ5FN5QejwiSxScbrfPt0wv/wpP7/OC4+1qUm7aLQiUUOpsH9K6wtWAkotS4RdJUpl
        BNRl3LiefgYbWdquq7ClV5LCTUdOGmBFjWqhHjESLWp78k6OCSkVhEz0EKbJQLTJNDiZTs
        uWB3+srf9ilFns8Y+Dz4FIw7WOtz7Qo8AbyFmL3FTY+1chToopWLKgJNDN3Yvw==
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
Subject: [PATCH 11/12] dt-bindings: mtd: Argue in favor of keeping additionalProperties set to true
Date:   Sat, 29 Oct 2022 01:59:32 +0200
Message-Id: <20221028235933.934850-12-miquel.raynal@bootlin.com>
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

In most cases we try to avoidit but in some cases this is
needed. Clarify why by adding a small comment.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/mtd.yaml                  | 1 +
 Documentation/devicetree/bindings/mtd/nand-chip.yaml            | 1 +
 Documentation/devicetree/bindings/mtd/partitions/partition.yaml | 1 +
 3 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 64714fc8c852..bddb7bdf441b 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -61,6 +61,7 @@ patternProperties:
     required:
       - compatible
 
+# This is a generic file other binding inherit from
 additionalProperties: true
 
 examples:
diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
index 8d5d2d3ef56b..6e2dc025d694 100644
--- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
@@ -70,4 +70,5 @@ properties:
 required:
   - reg
 
+# This file can be referenced by more specific devices (like spi-nands)
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
index f1a02d840b12..1c97ca0f7f62 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
@@ -60,4 +60,5 @@ then:
     $nodename:
       pattern: '^partition-.*$'
 
+# This is a generic file other binding inherit from
 additionalProperties: true
-- 
2.34.1

