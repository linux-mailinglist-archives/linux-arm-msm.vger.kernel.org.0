Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58B9D613E89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 20:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbiJaTqE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 15:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiJaTqD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 15:46:03 -0400
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1635013F35;
        Mon, 31 Oct 2022 12:46:03 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id y67so13876086oiy.1;
        Mon, 31 Oct 2022 12:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqPBfh/sHLOCUkJwzrRXE8QNX4/bCsSnqwI1z6aeHg0=;
        b=zboUwPxJsPpeY9EpaPD+rJFXED1f/1QE1T7tLJ44NdqsdHmQd3Y/Jw5bhWHswtZlkC
         6o77xTnJHrNr348P/a7wtNa13ShZkvJisPC54rN+ztoRA/3iMLPmd/oPauUaaNer1KcW
         N8YWVOP2nMu+g6VlhgllcT2ZDvayEdsMiZ8m2vQfFbALWV78Fi2TSWXXLuxjfp+x+E2L
         59Hf0x0Hl8IIKuBtz7GU6AYASc+t1Q4Atl0tVt4mAy44zwuvFw2F2XjkVVAA8c6ccuDV
         Q6Pf90u1qmRpkoz0mbukCfICUwupyPcKfJa0xidODFY9WQe/zDdgMKNEd7lbG3NIoQ5f
         ffAQ==
X-Gm-Message-State: ACrzQf24A9o37IY7iLtlkJjSdRu0oftf5WeV80QsFP5nNA2hnuOO0zwM
        o+bzCDdyes6lx6ONwFzHLA==
X-Google-Smtp-Source: AMsMyM5DjCcuMLrtnUf3Usg92SdXXm4p/mUKMHioTXVsEWUiB+C3u5HR/ONxnbc5Kn3g5zOFM7xPVQ==
X-Received: by 2002:a05:6808:178a:b0:359:fe7a:14ac with SMTP id bg10-20020a056808178a00b00359fe7a14acmr4520490oib.34.1667245562350;
        Mon, 31 Oct 2022 12:46:02 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 5-20020a9d0685000000b0066c41be56e7sm2778937otx.55.2022.10.31.12.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 12:46:01 -0700 (PDT)
Received: (nullmailer pid 3307676 invoked by uid 1000);
        Mon, 31 Oct 2022 19:46:03 -0000
Date:   Mon, 31 Oct 2022 14:46:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Pratyush Yadav <p.yadav@ti.com>, linux-sunxi@lists.linux.dev,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 04/12] dt-bindings: mtd: ingenic: Mark partitions in the
 controller node as deprecated
Message-ID: <166724556189.3307605.7479486129187361560.robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-5-miquel.raynal@bootlin.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
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

Acked-by: Rob Herring <robh@kernel.org>
