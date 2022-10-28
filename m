Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6F8611E74
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 02:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbiJ2AAB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 20:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiJ2AAA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 20:00:00 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1888831EDE;
        Fri, 28 Oct 2022 16:59:45 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id AB506FF806;
        Fri, 28 Oct 2022 23:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1667001584;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JnETgG5ahkxv0BMu7R1ArSayvHSpy+z/aCTR3oTK0R0=;
        b=B5FNgu6wuxBypJWg2jf/DyROdDwZBgPbVO4319iHfWvFM31N2kwtD+k7V4UQzy4Ggkthgd
        v5XjVodOJnQ8JpkGt3ufe7FlTdcB3EFjsxjV/u+wJ404DnOuLAy0LkXcQ5KXhvjJHUFypn
        mPkQaetIW7lzxaF8rg0RMZ8OhTxdUTEB+3G7eQ4HObfqSkc6Kx1dVus84AiGL+vU3Irbnj
        yGH1vBqh/35RdWRRbjNm32Fg27wOBWROvHjIjO2YXzdyuwXqAt0W+BUW+ZOykeMvV3Oxw0
        HfjMBmkeQElQmrGJYBhqIo128SZTJhawkFTMPcov4phO3vDeK3U8AjaKniRpfA==
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
Subject: [PATCH 04/12] dt-bindings: mtd: ingenic: Mark partitions in the controller node as deprecated
Date:   Sat, 29 Oct 2022 01:59:25 +0200
Message-Id: <20221028235933.934850-5-miquel.raynal@bootlin.com>
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

Defining partitions as subnodes of the controller has been deprecated
long time ago, but unlike having partitions within the controller node,
having an enveloppe named "partitions" (which is not itself within a
chip subnode) is not that common, so keep this deprecated definition in
this file.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/ingenic,nand.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
index 8c272c842bfd..484280dd35ab 100644
--- a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
@@ -32,6 +32,7 @@ properties:
 
   partitions:
     type: object
+    deprecated: true
     description:
       Node containing description of fixed partitions.
       See Documentation/devicetree/bindings/mtd/partition.txt
-- 
2.34.1

