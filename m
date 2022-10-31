Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21498613E7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 20:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiJaTnb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 15:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiJaTnb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 15:43:31 -0400
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93EDB13DF1;
        Mon, 31 Oct 2022 12:43:30 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id l42-20020a9d1b2d000000b0066c6366fbc3so746974otl.3;
        Mon, 31 Oct 2022 12:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uIj8F7o3xWdPkZPlyBxdDMdHvNd/oWAtYl8AntcMkY=;
        b=gmfbZdl4GYLHv5btFfVvMYqi3iPQd7PBJJuYVbqJEK6tmzkWAycIpL98ASNdZWegDO
         Oq1EMe6kcEBypunrR1vrzwwdOF655h0Fn7ddXde3I/O/Sq5xkg5k9zPqHGq74MMTFBLF
         9rjlYmrEq2GouhLShYMS2bPhKyLsFo8+jiwaqGp4u92FDRUPcknnX1no2rVinZipyZ84
         qdpxFE8CkPMRf8RxP1DOPi5ld95mX+a31zukNEvc4/IgDfJ5GAGIrg9Irb1lQCiu+pvD
         sVhY0OyvCncdv2AAHwoRzPXzah4xypwXPRK0g0zjgz5WvAUZ7waIktMzcoSD1Ux2nlqY
         3F6Q==
X-Gm-Message-State: ACrzQf0opy0DFgW2AOP8OBOD0Gybep0EQ1Dh/JsHysgWnbntcwo+F+Dj
        i88PLg52EJRdt7YvFcXvCA==
X-Google-Smtp-Source: AMsMyM5g7KTSYGxrZRcKyiAux4UsYqX+I25nfP9WEslETBfWyT/AE2QXqBuAEAt4tQmd0TLlfMb3Gw==
X-Received: by 2002:a9d:4109:0:b0:66c:5346:4505 with SMTP id o9-20020a9d4109000000b0066c53464505mr3136867ote.224.1667245409784;
        Mon, 31 Oct 2022 12:43:29 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p22-20020a4a8156000000b0049052c66126sm2711866oog.2.2022.10.31.12.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 12:43:29 -0700 (PDT)
Received: (nullmailer pid 3304763 invoked by uid 1000);
        Mon, 31 Oct 2022 19:43:30 -0000
Date:   Mon, 31 Oct 2022 14:43:30 -0500
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
Message-ID: <20221031194330.GA3299482-robh@kernel.org>
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

Also, this node needs 'additionalProperties: false'. Unless there cases 
of custom properties here. If so, then it gets more complicated and 
we'll need a partitions.yaml schema instead so we can do:

$ref: partitions.yaml
properties:
  my-extra-custom-property: true

unevaluatedProperties: false

(Multiple node levels doesn't work for that as child nodes from 2 
different schemas can't 'see' each other.)

> +    properties:
> +      '#address-cells': true
> +      '#size-cells': true
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
