Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F13F9611E78
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 02:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbiJ2AAE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 20:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbiJ2AAA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 20:00:00 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D25092F3B6
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 16:59:44 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id BBAFCFF802;
        Fri, 28 Oct 2022 23:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1667001576;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=zC82iFrlIYbSsP6fbExDAPio+9uwFvsxm72+V19fmUQ=;
        b=R2AMi4l+N69yWcGSR7WvtK5yF4dZv9jT7XFuGPsfTZl22MAuEiTIBoq5ZcYVpqLHufCBMH
        e2IofCj9i7rtK3BGWV0yZZnqn//kfOwsYzyqgqd16lV9dEZ6ypbVyJN4B0a5iSxt0JzUcq
        A+5tFYsb4c7LVz1GM1LHFyesQiWAevQh+zUhv8AVIKcg2EcqtU6zjGlgf0w9pR0/7fjwyk
        kO8qv+n9lGxo6+o9nGZMcXBaptnZf7N86lEOR3mxhGGloq7BsVnScVuWWo2G69SdHBrMXY
        Eyrb+XiexTTSaOXf7XXa2/8X7p+t1hEdyrhcGWSMacC4LFRokRqXEpXPOEVnNg==
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
Subject: [PATCH 00/12] Improve MTD bindings
Date:   Sat, 29 Oct 2022 01:59:21 +0200
Message-Id: <20221028235933.934850-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

During a yaml conversion review, Krzysztof opened the discussion about
the links and references made between the different files in the mtd
bindings. I figured out some minimal changes might be needed to properly
reference everything correctly and ensure we constrain as much as
possible the existing bindings. That is what I tried to do here.

The idea is:
* partition.yaml defines one MTD partition
* parsers/*.yaml define partition parsers (mainly compatibles)
* mtd.yaml contains the generic definition of any mtd device (nand,
  spi-nand, spi-nor, nor, sram, etc), in particular, it defines the
  various partition formats (legacy and current) and references
  partition.yaml as well as a list of all the possible parsers within a
  "partitions" node.
* nand-chip.yaml, jedec,spi-nor, mtd-physmap.yaml all describe real
  instances of mtd device, each of them with a different underlying
  technology, they reference mtd.yaml 
* nand-controller.yaml has subnodes which reference nand-chip.yaml.
* Specific NAND controller bindings reference nand-controller.yaml.

I've tested with the following command and it worked okay:
$ make dt_binding_check -j10 DT_CHECKER_FLAG=-m DT_SCHEMA_FILES=mtd/

Comments welcome of course :-)

Cheers,
Miquèl

Miquel Raynal (12):
  dt-bindings: mtd: Clarify all partition subnodes
  dt-bindings: mtd: Mention basic properties
  dt-bindings: mtd: Remove useless file about partitions
  dt-bindings: mtd: ingenic: Mark partitions in the controller node as
    deprecated
  dt-bindings: mtd: onenand: Mention the expected node name
  dt-bindings: mtd: nand-chip: Reference mtd.yaml
  dt-bindings: mtd: Drop common properties from NAND controllers
  dt-bindings: mtd: spi-nor: Drop common properties
  dt-bindings: mtd: phymap: Reuse the generic definitions
  dt-bindings: mtd: Drop object types when referencing other files
  dt-bindings: mtd: Argue in favor of keeping additionalProperties set
    to true
  dt-bindings: mtd: Constrain the list of parsers

 .../mtd/allwinner,sun4i-a10-nand.yaml         |  3 --
 .../bindings/mtd/arasan,nand-controller.yaml  |  3 --
 .../devicetree/bindings/mtd/ingenic,nand.yaml | 13 +-----
 .../bindings/mtd/intel,lgm-ebunand.yaml       | 10 +----
 .../bindings/mtd/jedec,spi-nor.yaml           | 14 -------
 .../devicetree/bindings/mtd/mtd-physmap.yaml  |  7 ++--
 .../devicetree/bindings/mtd/mtd.yaml          | 41 ++++++++++++++++++-
 .../devicetree/bindings/mtd/nand-chip.yaml    |  4 ++
 .../bindings/mtd/nand-controller.yaml         |  1 -
 .../devicetree/bindings/mtd/partition.txt     | 33 ---------------
 .../bindings/mtd/partitions/partition.yaml    |  1 +
 .../devicetree/bindings/mtd/qcom,nandc.yaml   |  3 --
 .../bindings/mtd/ti,gpmc-onenand.yaml         |  3 ++
 13 files changed, 52 insertions(+), 84 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/partition.txt

-- 
2.34.1

