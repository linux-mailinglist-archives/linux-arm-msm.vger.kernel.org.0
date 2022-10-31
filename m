Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED8A2613F50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 21:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbiJaUzP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 16:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbiJaUzN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 16:55:13 -0400
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C3112AB5;
        Mon, 31 Oct 2022 13:55:12 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id n83so13997893oif.11;
        Mon, 31 Oct 2022 13:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCSN6Z+0y4J22903M64Zf4+jbjsk7cN/Snw9CD4bul8=;
        b=t8KhJXYnMRMWLzlTz7k6ugv9JVQt0hl72NIpZoNj6wqwJ2GguOFReU4ObCTG4+Bvoc
         M5tQ47K8hHoigQSmY8kKisxfO/n0ZRxi9Dim/4aYMostjbB7bbZcF5UNjcvXuUYu75GY
         aNEOWVf+00dHY+pwRUZVUx3JzouMvXYhOxm233wx8zR4DY2YJrxhPXpkO7KTe1DjuIEd
         1IvkSGWpMdNEbP70mr+bIZwo5Q+OM+3z8yRWVt+gG7t6A1INki6YaJRVpT5/Pl86Bj+X
         toQti3U2zIo6qbF+GUpMFeMOCPh4xs0wN0hjd1ninoIrcsKVCknVMlFN5XbghJmKrKZs
         WfxQ==
X-Gm-Message-State: ACrzQf0EnZa+Ds2mX4HUF6llsfQ6HB7Iqty1LdMaUH5ttPn9REUvc95z
        jOFqtLcqKWSqZNiKHppQxg==
X-Google-Smtp-Source: AMsMyM7XjXOlecZaxEkia4ZmEGJQotcenwAVinqsz6x6j+hsDlruF/WE8oHbdwgzxZc0aE6fkaNnfg==
X-Received: by 2002:a05:6808:f09:b0:359:b15d:349c with SMTP id m9-20020a0568080f0900b00359b15d349cmr14725300oiw.57.1667249711409;
        Mon, 31 Oct 2022 13:55:11 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id fp42-20020a05687065aa00b0013bc95650c8sm3541051oab.54.2022.10.31.13.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 13:55:10 -0700 (PDT)
Received: (nullmailer pid 3505400 invoked by uid 1000);
        Mon, 31 Oct 2022 20:55:12 -0000
Date:   Mon, 31 Oct 2022 15:55:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-sunxi@lists.linux.dev,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        linux-mtd@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 06/12] dt-bindings: mtd: nand-chip: Reference mtd.yaml
Message-ID: <166724971189.3505343.6716916963356990521.robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-7-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-7-miquel.raynal@bootlin.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sat, 29 Oct 2022 01:59:27 +0200, Miquel Raynal wrote:
> A NAND chip is an MTD device. mtd.yaml already defines many useful and
> relevant properties, let's reference this file here to get access to
> these additional property definitions.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand-chip.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
