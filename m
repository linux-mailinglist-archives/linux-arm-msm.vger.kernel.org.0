Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48DD7613E4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 20:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiJaTds (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 15:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiJaTdq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 15:33:46 -0400
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D63C13D71;
        Mon, 31 Oct 2022 12:33:46 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-13ba86b5ac0so14600050fac.1;
        Mon, 31 Oct 2022 12:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahMyyoN83BTbMMrhkPxnMNFzT+CMI4++uXPUE/MdHpM=;
        b=tW3GzOF8EqFteA64PnEN0Lkgy1YYznlprd2qZU9oAuvWkHCzfX9lIUzcSSp232ytsr
         hCF6ht5DUU0OMwy9TrKh+C1uE4VlHgDt6IHrnpqqnJPLDN+/TvqOSlcnAlzUKqi3cGl7
         kFlBEn+25YH05yC9YgRsSUZyEVzBl+3uCnEJk7EunGqMYBdqUM8IoOuV/cOw7skaxhWj
         hH3pDEiiLS1dXmwyry/Sxc1YgfaG/XrtHXCmnhoz2CqhGF55DPNPxQOZ+jDgWm4xi4TW
         RHTAy7oyCJIYpyIUJWuQq9f/6sqZBS8PBPLplMIxP56o5JOgCKb1PyMDUqHn/2L6IwxF
         3jaw==
X-Gm-Message-State: ACrzQf0enTooHVEofdEoaJuezB+dcqgoaIdUx4hTuGv3g6mAEpMe1UPI
        YwZVbU0VJEb99WsIfEkVpbxhnPS0NQ==
X-Google-Smtp-Source: AMsMyM4l+TcsCdFGnvR3QaiG9UCl2pWcUZK2fq3fnZnqeQiOFRnod/8llhOVvWw3ORc5uoJnulLmDQ==
X-Received: by 2002:a05:6870:96a7:b0:13b:ceea:baf8 with SMTP id o39-20020a05687096a700b0013bceeabaf8mr18519996oaq.88.1667244825301;
        Mon, 31 Oct 2022 12:33:45 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bj23-20020a056808199700b00353ef11d6c9sm2656248oib.19.2022.10.31.12.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 12:33:44 -0700 (PDT)
Received: (nullmailer pid 3294529 invoked by uid 1000);
        Mon, 31 Oct 2022 19:33:46 -0000
Date:   Mon, 31 Oct 2022 14:33:46 -0500
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
Subject: Re: [PATCH 02/12] dt-bindings: mtd: Mention basic properties
Message-ID: <20221031193346.GB3291000-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-3-miquel.raynal@bootlin.com>
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

On Sat, Oct 29, 2022 at 01:59:23AM +0200, Miquel Raynal wrote:
> there to avoid the need to do it in each and every file.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> index 9fcaa61b046c..10684b233ae3 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> @@ -21,6 +21,9 @@ properties:
>        based name) in order to ease flash device identification and/or
>        describe what they are used for.
>  
> +  '#address-cells': true
> +  '#size-cells': true
> +

These are only for 'partition' nodes, right? If so, they should be 
marked deprecated too.

>    partitions:
>      type: object
>      properties:
> -- 
> 2.34.1
> 
> 
