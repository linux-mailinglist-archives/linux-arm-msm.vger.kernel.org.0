Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19AF3611E71
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 01:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbiJ1X7o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 19:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiJ1X7n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 19:59:43 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F5D25C4D;
        Fri, 28 Oct 2022 16:59:41 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 14946FF805;
        Fri, 28 Oct 2022 23:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1667001580;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Butx8i3x6waX06tzNbc8/G+V5LmsGgkNbbLeRWrHG9o=;
        b=JxxlOPJyZc3Om+Fqj3548BrMCrYLgXNN+D35HC4VbVUm93L7D99yTEe6Aby6MHnU3XLoYx
        1KXubrZcGe6uTecE/BzxZNTUioN3LGAMOmPZkmFZ/blqVNtso/Z9PJPdVWll4LnzNFGduq
        A6aBJmNkCe6lP+/LY5Sot6ubuJRAdRQ00HfoNRnrVC8Gt63C5gKo/HeSHrDgiAKErL1Jim
        WnSUqjxdQOa7hPpnIlHXkrIQfWIS6KesfRrwtgy7PELGC4ZHZnMR+gVfRO29cP6QK/RGsk
        eZlnbtLuzIBW+rHSDxytqYX8cqaCdUFK5ssQlXsI5dEOyagZuARlMD3gwREvpg==
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
Subject: [PATCH 02/12] dt-bindings: mtd: Mention basic properties
Date:   Sat, 29 Oct 2022 01:59:23 +0200
Message-Id: <20221028235933.934850-3-miquel.raynal@bootlin.com>
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

there to avoid the need to do it in each and every file.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/mtd.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 9fcaa61b046c..10684b233ae3 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -21,6 +21,9 @@ properties:
       based name) in order to ease flash device identification and/or
       describe what they are used for.
 
+  '#address-cells': true
+  '#size-cells': true
+
   partitions:
     type: object
     properties:
-- 
2.34.1

