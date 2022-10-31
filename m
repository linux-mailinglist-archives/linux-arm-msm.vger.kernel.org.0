Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3E2613F5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 21:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiJaU7q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 16:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiJaU7p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 16:59:45 -0400
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE0412AF7;
        Mon, 31 Oct 2022 13:59:44 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-13ba86b5ac0so14843497fac.1;
        Mon, 31 Oct 2022 13:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/c2XNU9qCi0/SIq7JxxxUeiJFklOM1fPVnjo5nHEOw=;
        b=vpRafGrEkpFonpQ0S0WRswAGo2zwbRwMHLlxf3OOeW4Df3orrFb6TJf4IXxmmO8Hv3
         hOVa5hudmeTfPLwkUny1pDhKsdC0Nz4xInvu2rsjnVGMeL3G7NKUzQ+yKAWLLFQdXuMP
         7yAA4Vmqamq2ZGvB8FGk3Tk+Y5PjxkLG/0RUZnsJvQwKdi/CEnI+mds2nV17+0fjg396
         o7EL8mKUrEokyL7zGvaNzidrLB0POAO0OyIxvHtOi4EOfciPfGURQIbrS1W1mhdNOFOP
         /874pH5u0bjivC8Q0lH/2z6STkVdnQIPIqvMXmiS7rfizoalaVQ7wbbOtC0OpHG7DiPH
         caTg==
X-Gm-Message-State: ACrzQf3Tn7FJF6+sFkREKDUcvVn/oPqIYtoMAdYAoKfIJj3mD16RIdkt
        5/b0ZVTFFy+DEJ2qbdPBvQ==
X-Google-Smtp-Source: AMsMyM7LswAnDKtLB5pnbZtOd1oJ1fXaUx7UPx0vVt58JL1FF2qxUk756+yv8MotVg8+NLv9lFOOTg==
X-Received: by 2002:a05:6870:2043:b0:13c:f48b:7ca8 with SMTP id l3-20020a056870204300b0013cf48b7ca8mr4428052oad.169.1667249983817;
        Mon, 31 Oct 2022 13:59:43 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y12-20020a4ae70c000000b00492f9f46aa4sm2746051oou.36.2022.10.31.13.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 13:59:43 -0700 (PDT)
Received: (nullmailer pid 3510647 invoked by uid 1000);
        Mon, 31 Oct 2022 20:59:44 -0000
Date:   Mon, 31 Oct 2022 15:59:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Richard Weinberger <richard@nod.at>,
        linux-mtd@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
        Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-sunxi@lists.linux.dev,
        Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: Re: [PATCH 10/12] dt-bindings: mtd: Drop object types when
 referencing other files
Message-ID: <166724998418.3510591.18309655417406556730.robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-11-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-11-miquel.raynal@bootlin.com>
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


On Sat, 29 Oct 2022 01:59:31 +0200, Miquel Raynal wrote:
> Setting an object type is redundant when a reference is made, so drop
> these useless lines.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml             | 1 -
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 1 -
>  2 files changed, 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
