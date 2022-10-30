Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD05612ACF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Oct 2022 14:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbiJ3Nu2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Oct 2022 09:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbiJ3Nu0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Oct 2022 09:50:26 -0400
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BF655BB;
        Sun, 30 Oct 2022 06:50:26 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-13be3ef361dso11137902fac.12;
        Sun, 30 Oct 2022 06:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QM+uLtn35cNBB8WShoztahWkyNeyqqGV8AL7ZS4noIw=;
        b=yyqGwwSCEE3LLNbIEMxym1bJMTOYJsEfKDYEY5l68vTHcxFU5/se22Q/Wmntza0P3B
         9KLcFgnaPpJUZmfDNTxYERHy1WU5BZ4GtgowExk7J812maqn7OsfVP4rzroHGpvwXpwB
         CAzT3152sQcuje+V06dh5t3qxAb/D3/OWvGVmVymnrpmm9j6LYi8EdpLAozRJcbOJRoY
         POOfPIXpLpzhzvzI5lmsjqOFlz+ArRAocWqhEQZippilGo+AXaNz7dlJVYV6aNqS5gTH
         +786QmHd6ePYJLoPJXbchdf/UOO9CDkvEi9/45Mg1Xrpf+33WazkoxkhwO47xKoZlZhi
         Sz0g==
X-Gm-Message-State: ACrzQf3aRbWH0vnHSrhHTBFLOBY1OlDllXPVpTIsIkfTldTClqI/y/aJ
        pe7bbDwT533QTBBPQb0V1A==
X-Google-Smtp-Source: AMsMyM4ekD+KyJWMr4GSGQ0Ji2kUPt3lAnlfD1u4S/wAA6L9dkzw4WsHzE7oFxxtxteJsfH9/11fzg==
X-Received: by 2002:a05:6870:5b9d:b0:12b:5871:22f4 with SMTP id em29-20020a0568705b9d00b0012b587122f4mr4949428oab.211.1667137825562;
        Sun, 30 Oct 2022 06:50:25 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 11-20020aca280b000000b00353fe4fb4casm1394805oix.48.2022.10.30.06.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 06:50:25 -0700 (PDT)
Received: (nullmailer pid 992220 invoked by uid 1000);
        Sun, 30 Oct 2022 13:50:23 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
        linux-sunxi@lists.linux.dev, linux-mtd@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        linux-arm-msm@vger.kernel.org,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Richard Weinberger <richard@nod.at>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20221028235933.934850-10-miquel.raynal@bootlin.com>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-10-miquel.raynal@bootlin.com>
Message-Id: <166713668466.965796.13624922237162086174.robh@kernel.org>
Subject: Re: [PATCH 09/12] dt-bindings: mtd: phymap: Reuse the generic definitions
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


On Sat, 29 Oct 2022 01:59:30 +0200, Miquel Raynal wrote:
> The memory mapped MTD devices also share a lot with all the other MTD
> devices, so let's share the properties by referencing mtd.yaml. We can
> then drop mentioning the properties, to the cost of mentioning the
> possible "sram" node name prefix.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd-physmap.yaml | 7 +++----
>  Documentation/devicetree/bindings/mtd/mtd.yaml         | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 



My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi.example.dtb: psram@0,0: $nodename:0: 'psram@0,0' does not match '^(flash|sram)(@.*)?$'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

