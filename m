Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDF87613E55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 20:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbiJaTfe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 15:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiJaTfd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 15:35:33 -0400
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F5613D2C;
        Mon, 31 Oct 2022 12:35:29 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-13ba86b5ac0so14605302fac.1;
        Mon, 31 Oct 2022 12:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPb0kmVeswZtbGBLrKOCmvBH/nbTOqL9MgWShnMw8Tg=;
        b=rVT68VxgWJskddJ6ANWSxgdIreujQOvVZJHBPXZcUPknh46fU4kDbOGzTx9NOBRJb1
         pY5oRna2zJ+RIFPhijkftSdMEcWiS3cnJaYs+I91jOkgOHm4YUzle0XXaOzcsuafjZcv
         mOWZjoYZDThbbmoXevbOKmAGrd4aSUC3rNHynBMReGTCmzGVkR+gkngBft7UwPrfx9N/
         /xDfDiBIoyGbAPreiKzBUebE/1tTkhAesDjJTOSsoVV8Xx9i4L2IVIm5mAfdjN8VokkI
         m5edgyYabZqb34x77tgYiGLH6skJSkPszgNpjFnRl0p3DHimOfgsfh0aIqakcS5f+NeP
         +uCA==
X-Gm-Message-State: ACrzQf3VXeJewekqokK05DQnH6EbubENUhYuYKK8q4XUDyPLuyCJnrXJ
        KkHTjwkWiw8Zwq6IRv1uOg==
X-Google-Smtp-Source: AMsMyM5JUFYZAqWZZIR+hRiehCPtmwqBAy3Pe0MPElCht3CsSW377O0x1+4mZmM3hg/qVtlZieuyjw==
X-Received: by 2002:a05:6870:f61a:b0:132:49:bd11 with SMTP id ek26-20020a056870f61a00b001320049bd11mr17306072oab.228.1667244928296;
        Mon, 31 Oct 2022 12:35:28 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b5-20020a056870d1c500b0013ae5246449sm3473506oac.22.2022.10.31.12.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 12:35:27 -0700 (PDT)
Received: (nullmailer pid 3296342 invoked by uid 1000);
        Mon, 31 Oct 2022 19:35:29 -0000
Date:   Mon, 31 Oct 2022 14:35:29 -0500
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
Subject: Re: [PATCH 03/12] dt-bindings: mtd: Remove useless file about
 partitions
Message-ID: <20221031193529.GC3291000-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-4-miquel.raynal@bootlin.com>
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

On Sat, Oct 29, 2022 at 01:59:24AM +0200, Miquel Raynal wrote:
> There is already a real partitions.yaml file, nothing in this text file
> is actually needed so drop it.

There's a bunch of references to this file still. Run the doc ref check.

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/partition.txt     | 33 -------------------
>  1 file changed, 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/partition.txt
