Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 291A2613E41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 20:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbiJaTc3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 15:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiJaTc2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 15:32:28 -0400
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F27E12A91;
        Mon, 31 Oct 2022 12:32:27 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-13b103a3e5dso14572115fac.2;
        Mon, 31 Oct 2022 12:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVVqsExfMH5y/nVKQLe7SB8sVIcEpxDpkI7AXNSICDk=;
        b=Wr7MBfjPF55f/OurVVews0fyZU2z1qQyI1SjwIWIm9Q/s8XUr0Ump4zBf9x70QmveT
         9YugaI79zXjikHjyOO+RiIK83zXQ201rOyoG5qCUEf7OOSfJSW8igoAGG+IobHjy1LTV
         UzIepa8+tvRK4OpxoZHUXCjpeLtvsk8aytdkbBU58VLAulDzI0tefWRA90dAmN2/ukmY
         FekXMFYEJRctbwG9fAKqjCwJiURTum95xB7M4nn4XC/tZ83Ec7qGs65DY/ILIoJyBs0E
         GB7nifSgCvyY6pp4WwqkvnoUD6MOlEyKzWy2HiX3HAL20HoMGrAPdJUDlQYgh4FV+p9E
         q4ww==
X-Gm-Message-State: ACrzQf1Sp5e/LeHYpqPxBUyVBZu4UtXrM3sSzjzpu4Q03jxbTYGOEfn1
        cndMi4KANCa6bpcCkkfNSA==
X-Google-Smtp-Source: AMsMyM51Ay/CK4pAwfGf+l/L2CO2NolCQmH5Ou1KvFFhPO09DUo2mDuk+qqH803TerpG8A6bPcDstw==
X-Received: by 2002:a05:6870:d78c:b0:136:ddfe:bf16 with SMTP id bd12-20020a056870d78c00b00136ddfebf16mr8358187oab.86.1667244744371;
        Mon, 31 Oct 2022 12:32:24 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m33-20020a056870562100b0012779ba00fesm3512244oao.2.2022.10.31.12.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 12:32:23 -0700 (PDT)
Received: (nullmailer pid 3293099 invoked by uid 1000);
        Mon, 31 Oct 2022 19:32:25 -0000
Date:   Mon, 31 Oct 2022 14:32:25 -0500
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        linux-mtd@lists.infradead.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 01/12] dt-bindings: mtd: Clarify all partition subnodes
Message-ID: <20221031193225.GA3291000-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-2-miquel.raynal@bootlin.com>
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

On Sat, Oct 29, 2022 at 01:59:22AM +0200, Miquel Raynal wrote:
> Over time the various ways to define MTD partitions has evolved. Most of
> the controllers support several different bindings. Let's define all
> possible choices in one file and mark the legacy ones deprecated. This
> way, we can just reference this file and avoid dupplicating these
> definitions.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> index 25b91f25fcf4..9fcaa61b046c 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> @@ -21,7 +21,25 @@ properties:
>        based name) in order to ease flash device identification and/or
>        describe what they are used for.
>  
> +  partitions:
> +    type: object
> +    properties:
> +      '#address-cells': true
> +      '#size-cells': true

These should only be 1 or 2 which I don't think is defined anywhere 
else.

> +
> +    patternProperties:
> +      "partition@[0-9a-f]+":
> +        $ref: partitions/partition.yaml
> +
>  patternProperties:
> +  "@[0-9a-f]+$":
> +    $ref: partitions/partition.yaml
> +    deprecated: true
> +
> +  "^partition@[0-9a-f]+":
> +    $ref: partitions/partition.yaml
> +    deprecated: true
> +
>    "^otp(-[0-9]+)?$":
>      type: object
>      $ref: ../nvmem/nvmem.yaml#
> -- 
> 2.34.1
> 
> 
