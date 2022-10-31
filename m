Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E94F2613F83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 22:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbiJaVKK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 17:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbiJaVKI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 17:10:08 -0400
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41291400A;
        Mon, 31 Oct 2022 14:10:07 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-12c8312131fso14851276fac.4;
        Mon, 31 Oct 2022 14:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byO+eVFbmi2JQ5E3MJb1RGvLIDktwgzVitZO6ouN7wo=;
        b=hAltad2iPiNAPhoZtxskvB/l4qMqQsCwl2ha9uIsqD66+YjKUGRmRTv8usXeE+kTHQ
         9BghGTEJeHx81JbMHnjB+1WqcLqwhl8Wy1PEwGH04tKfSUcNVze+nAaNkoW8mw4Bx5jY
         EJLGq8476hpAk49+yXhlhO6iHoFIOVkPXi9uXxIcUC4djTj9bzBHTeEeAFCvm1f+pc+N
         P+RMdGF5NflKUnCgVOUpDZlq/44r/4Z1H5ukIa6NGNDgxD6MKNQHIUBPhDTig96qISDo
         dmCHOr2t8L4UKGsTWXIPJdgl8T76kOZq3up//veq4sO8qw2YZU7XSKu9LME5K0jMJGxd
         XKRA==
X-Gm-Message-State: ACrzQf3/NLGiFt+EMlkNzaMrnjfJsXkSuLGTDYJwLaJyZTvcIAaI05ZH
        JGak+nv2wuCFvFCtqqyfIg==
X-Google-Smtp-Source: AMsMyM7dZOYdOCb1mto/Idcngckl/1c+JFp3aBXRCuJUrrtvUu24JUA3N2jFdQRjes/90Wb2FlzIkw==
X-Received: by 2002:a05:6870:e3d1:b0:13c:9dbb:7e95 with SMTP id y17-20020a056870e3d100b0013c9dbb7e95mr8929109oad.43.1667250607134;
        Mon, 31 Oct 2022 14:10:07 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r7-20020a4acb07000000b00494ed04f500sm2779419ooq.27.2022.10.31.14.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 14:10:06 -0700 (PDT)
Received: (nullmailer pid 3585087 invoked by uid 1000);
        Mon, 31 Oct 2022 21:10:08 -0000
Date:   Mon, 31 Oct 2022 16:10:08 -0500
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
Subject: Re: [PATCH 12/12] dt-bindings: mtd: Constrain the list of parsers
Message-ID: <20221031211008.GA3512582-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-13-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-13-miquel.raynal@bootlin.com>
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

On Sat, Oct 29, 2022 at 01:59:33AM +0200, Miquel Raynal wrote:
> Parser compatibles cannot be used anywhere, and the list is limited. In
> order to constrain this list, enumerate them all under the top
> "partitions" subnode. New parsers will have to add their own compatible
> here as well.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> index bddb7bdf441b..29db0b5c115e 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> @@ -27,13 +27,29 @@ properties:
>    partitions:
>      type: object
>      properties:
> +      compatible:
> +        contains:
> +          enum:
> +            - fixed-partitions
> +            - arm,arm-firmware-suite
> +            - brcm,bcm4908-partitions
> +            - brcm,bcm947xx-cfe-partitions
> +            - nksys,ns-partitions
> +            - nvmem-cells
> +            - qcom,smem-part
> +            - redboot-fis
> +
>        '#address-cells': true
> +
>        '#size-cells': true

Alternatively, you could add a 'oneOf' with $ref's to each partition 
type. Then we don't have the same compatible in 2 places. If you do, 
then the partition schemas should have a 'select: false' so we don't 
apply the schema twice.

Or keeping it like this is fine too.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
