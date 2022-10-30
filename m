Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C74A1612ACC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Oct 2022 14:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiJ3NuZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Oct 2022 09:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiJ3NuY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Oct 2022 09:50:24 -0400
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0758D55BB;
        Sun, 30 Oct 2022 06:50:23 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1322d768ba7so11176469fac.5;
        Sun, 30 Oct 2022 06:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hw01HOuryg79no8aMleCKIAZAkXFo9PVrSnrQ3NItHg=;
        b=Bm9Mp4ppADYXI0sjG6qbgXGrryxPlcD7N2s+k2JDU+Kr0pfwlVZgGjygtliPGGEXSN
         qc8Npzyk1qanPsUogA0QqQd+PL7CraXqGwJPCI/Ryk1DTcD84KQxiKWxscJJhf3UghdM
         VAjjwqP07Yt2OU+kpO0CK4cQOB5QfwSKaWjFcoOvPj/qZuufsS7jt8BcUAMLMMXvr3PD
         5kNBFJi4mTBfAqlHfgifsFL2U8MKZ/iajYY038AuKax5jyaLyO5m/TCdZvhLxAZ9UByI
         zT5Rr5svJFrwhcL/K0+c1EUVR+349dzEdxR6gyYgeG6o7PWIw8eJVpSfX93040ktWOSe
         S6Yw==
X-Gm-Message-State: ACrzQf06nyW3KysllPwGAC52lW52FLi7myuy7+bV5wn7h9DOzCPTNirz
        uvttz5HwzKUdRd1oumQQyA==
X-Google-Smtp-Source: AMsMyM6HN4/vLJC1yWt+A8WWnZkp+11IcygTJEWrLtMHxk3x/m5N+dKkTENhuNR66OXIOrZIW/02AA==
X-Received: by 2002:a05:6870:d285:b0:12b:cdce:63d8 with SMTP id d5-20020a056870d28500b0012bcdce63d8mr14117853oae.140.1667137822201;
        Sun, 30 Oct 2022 06:50:22 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a11-20020a9d5c8b000000b0066c3b6eff00sm1728680oti.2.2022.10.30.06.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 06:50:21 -0700 (PDT)
Received: (nullmailer pid 992217 invoked by uid 1000);
        Sun, 30 Oct 2022 13:50:23 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Michael Walle <michael@walle.cc>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        devicetree@vger.kernel.org,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Pratyush Yadav <p.yadav@ti.com>, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
In-Reply-To: <20221028235933.934850-5-miquel.raynal@bootlin.com>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-5-miquel.raynal@bootlin.com>
Message-Id: <166713668385.965763.9400218413404488593.robh@kernel.org>
Subject: Re: [PATCH 04/12] dt-bindings: mtd: ingenic: Mark partitions in the
 controller node as deprecated
Date:   Sun, 30 Oct 2022 08:50:23 -0500
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sat, 29 Oct 2022 01:59:25 +0200, Miquel Raynal wrote:
> Defining partitions as subnodes of the controller has been deprecated
> long time ago, but unlike having partitions within the controller node,
> having an enveloppe named "partitions" (which is not itself within a
> chip subnode) is not that common, so keep this deprecated definition in
> this file.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/ingenic,nand.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 



My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/mtd/atmel-nand.txt references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Warning: Documentation/devicetree/bindings/mtd/ingenic,nand.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Warning: Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Warning: Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Warning: Documentation/devicetree/bindings/mtd/mtk-nand.txt references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Warning: drivers/mtd/parsers/Kconfig references a file that doesn't exist: Documentation/devicetree/bindings/mtd/partition.txt
Documentation/devicetree/bindings/mtd/atmel-nand.txt: Documentation/devicetree/bindings/mtd/partition.txt
Documentation/devicetree/bindings/mtd/ingenic,nand.yaml: Documentation/devicetree/bindings/mtd/partition.txt
Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt: Documentation/devicetree/bindings/mtd/partition.txt
Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt: Documentation/devicetree/bindings/mtd/partition.txt
Documentation/devicetree/bindings/mtd/mtk-nand.txt: Documentation/devicetree/bindings/mtd/partition.txt
drivers/mtd/parsers/Kconfig: Documentation/devicetree/bindings/mtd/partition.txt

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

