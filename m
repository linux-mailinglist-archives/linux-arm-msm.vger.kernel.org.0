Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E817613F54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 21:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbiJaUzn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 16:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbiJaUzi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 16:55:38 -0400
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF7C12762;
        Mon, 31 Oct 2022 13:55:38 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-13b103a3e5dso14809177fac.2;
        Mon, 31 Oct 2022 13:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LIZ2dqSSBT+On4PWAgl6ETxuBttWHH8FQXx49BSlJI=;
        b=Tg4dEPSsT2bBihhHSsB63GQFKhu4WVPaGe8cm+D7qFJtLcgHRpnzv36YxzO6poO/F8
         z+Jsr22JcGcrSNVYsOmAgFqpQkvLaXb1IHtWMBqxuFRO7bxtnhJ5m3rZo2j7hUslTi8y
         t0gDu4k4J/W+ngEnxQyti7tOIeFlfE83qW40SztXqU16/S0Ro86/lvaQmgG/6fSQPIQs
         DoClx2Q5hNZer2mpEy30HXMjWlnHRi00Xeyka4xO8Qq+rhY9f8hfgdyVSQ6r0d/RBecr
         OWdhjj2M8gnI/bCRXDim7djSaxj0+705qtHWYpx1WNJ4TNoy1KN2EMEuZmo4YOmqMdvp
         rJtQ==
X-Gm-Message-State: ACrzQf0BwD6wt/pb3SerhlTao8NOZrKMVbH29Mudt5NkF4F/g5IIkyD+
        iiZllyIaNvk0RT01jn8Z6Q==
X-Google-Smtp-Source: AMsMyM42H6rURv5CxNKKP6tU1K9paQFFoz/iq+4AdUhxq8YPqX+kj9on+V+Yw0UjKIjEGJDFW08Pmg==
X-Received: by 2002:a05:6870:f61a:b0:132:49:bd11 with SMTP id ek26-20020a056870f61a00b001320049bd11mr17509733oab.228.1667249737471;
        Mon, 31 Oct 2022 13:55:37 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q10-20020a4aa88a000000b0049bdee12662sm544026oom.6.2022.10.31.13.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 13:55:36 -0700 (PDT)
Received: (nullmailer pid 3505988 invoked by uid 1000);
        Mon, 31 Oct 2022 20:55:38 -0000
Date:   Mon, 31 Oct 2022 15:55:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, Michael Walle <michael@walle.cc>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        linux-mtd@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        linux-arm-msm@vger.kernel.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 07/12] dt-bindings: mtd: Drop common properties from NAND
 controllers
Message-ID: <166724973801.3505934.3879671899387347829.robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-8-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-8-miquel.raynal@bootlin.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sat, 29 Oct 2022 01:59:28 +0200, Miquel Raynal wrote:
> When redefining common properties does not bring any additional
> information, just drop them from the controller bindings because these
> properties already are definied in nand-controller.yaml.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/mtd/allwinner,sun4i-a10-nand.yaml       |  3 ---
>  .../bindings/mtd/arasan,nand-controller.yaml         |  3 ---
>  .../devicetree/bindings/mtd/ingenic,nand.yaml        | 12 ------------
>  .../devicetree/bindings/mtd/intel,lgm-ebunand.yaml   | 10 +---------
>  .../devicetree/bindings/mtd/qcom,nandc.yaml          |  3 ---
>  5 files changed, 1 insertion(+), 30 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
