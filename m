Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCC33613F4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 21:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiJaUyn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 16:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiJaUym (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 16:54:42 -0400
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311C11114C;
        Mon, 31 Oct 2022 13:54:42 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-13ae8117023so14789564fac.9;
        Mon, 31 Oct 2022 13:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlLgdjn9D1YIceaBfkfEVV7Xu0o6/DdkHOK6FWg7DXs=;
        b=i8XXyz0ljTRKzFG7iRTffARXCJXHYjF5fbW/hbKeBn34VjkuJUTmBOV6bRgchtUZjq
         cQH8gqaSXIrEHDsGG9CrOZ3vA6lDI96sTIcjQk9swpXhsCDbtfKtcAq32f6EEiHIkWlN
         7XholdPK28twvX0CZ09APhCe5qcjdi3C4krdqjI7catmb1o7fWAFeA02iSjxEiOrNL4H
         FQ82LfmTwMw8dON7NKdTS1cZuM6H84DdVl8ECb04qcZ8iEvQZSVideZ4rxz6zbLIxdT3
         g3nP/nlp6D/XmkfJizyOprFBeSOD2y9PG9qv1pCwTim9eQPti9ZmOBk0MmBY1Xnv6pu6
         yAgQ==
X-Gm-Message-State: ACrzQf0ONnXrYs9CygPk+FvUDLiJJuvLzR1QZqn8c5npRXanTrMnJ2Zn
        9/E276YLzSY9EqVTqBvntw==
X-Google-Smtp-Source: AMsMyM7vTUsE4Eu/4WH4ujPZbj5pkakgbRyAll6n+tNS+7ne5KKzHQQXzNKYvu6fsABenaccKwfl4Q==
X-Received: by 2002:a05:6870:a7a5:b0:125:76da:1bc1 with SMTP id x37-20020a056870a7a500b0012576da1bc1mr19209128oao.272.1667249681241;
        Mon, 31 Oct 2022 13:54:41 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d94-20020a9d2967000000b0066b9a6bf3bcsm3152995otb.12.2022.10.31.13.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 13:54:40 -0700 (PDT)
Received: (nullmailer pid 3504734 invoked by uid 1000);
        Mon, 31 Oct 2022 20:54:42 -0000
Date:   Mon, 31 Oct 2022 15:54:42 -0500
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
Subject: Re: [PATCH 05/12] dt-bindings: mtd: onenand: Mention the expected
 node name
Message-ID: <20221031205442.GA3307775-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-6-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-6-miquel.raynal@bootlin.com>
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

On Sat, Oct 29, 2022 at 01:59:26AM +0200, Miquel Raynal wrote:
> The chip node name in this driver is expected to be different and should
> be prefixed with onenand instead of the regular "flash" string, so
> mention it.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> index a953f7397c40..8a79ad300216 100644
> --- a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> @@ -15,6 +15,9 @@ description:
>    as child nodes of the GPMC controller.
>  
>  properties:
> +  $nodename:
> +    pattern: "^onenand@[0-9],[0,9]$"

I don't think it is worth enforcing node names that we 
haven't defined in the spec. Wouldn't 'nand-controller' be appropriate?

> +
>    compatible:
>      const: ti,omap2-onenand
>  
> -- 
> 2.34.1
> 
> 
