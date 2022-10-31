Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86E2B613F63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 22:01:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiJaVBX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 17:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiJaVBV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 17:01:21 -0400
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9C813CC8;
        Mon, 31 Oct 2022 14:01:20 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id p8-20020a056830130800b0066bb73cf3bcso7432930otq.11;
        Mon, 31 Oct 2022 14:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=987jdJA0Irwu+IZt+ZSzTaDZw4daVI3hNs/okiLh6vM=;
        b=yqyy/4BW1PUvIs8QBjv+5jdpZbD0QwweP3c9IGPnPlpWohNf7H6BsOiKGhl/5ct8sC
         AM2NWaQ+Tma7f1aWCA/j/n7egHvZwXrr/wPcHxUpnCRhDeW1bUAQ+6hxJj4RoPxj6Te5
         3I7MjXWvUKqmO5HXbOFUUZNtjn3VC7MyJiraiTOkkAMLhFrPstgkKYF/E3ztjDyVSxq8
         ljH5mno9k6nOInDa4K1xDXFKJAuADnouuTQC/+nQP0DZhmoXnrUEImkXboEFJfOXcnuv
         ERiAG81Rd9Le00zBmTHfcwwC+hHdYvpeTA++encnz5h2VkL/KiE9n2hEKJKaoxsWFhd6
         yIaQ==
X-Gm-Message-State: ACrzQf1QHl41KqGmH05PLUCp6F0ebXsqb4+DmwMf22g5QJ9y07NwS5hU
        CqpvPm3WHhZqwcE2JCzthg==
X-Google-Smtp-Source: AMsMyM6jt4nH7hVXWH5OCQjRysxBsStJNZ3rr+kyfIzYoof8j3D7438kxcV2e885MttFwNCwrGNN3w==
X-Received: by 2002:a9d:22a5:0:b0:66c:358b:3931 with SMTP id y34-20020a9d22a5000000b0066c358b3931mr7533751ota.79.1667250080171;
        Mon, 31 Oct 2022 14:01:20 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ej32-20020a056870f72000b0013b9ee734dcsm3586697oab.35.2022.10.31.14.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 14:01:19 -0700 (PDT)
Received: (nullmailer pid 3512396 invoked by uid 1000);
        Mon, 31 Oct 2022 21:01:21 -0000
Date:   Mon, 31 Oct 2022 16:01:21 -0500
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
Subject: Re: [PATCH 11/12] dt-bindings: mtd: Argue in favor of keeping
 additionalProperties set to true
Message-ID: <20221031210121.GA3510754-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-12-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-12-miquel.raynal@bootlin.com>
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

On Sat, Oct 29, 2022 at 01:59:32AM +0200, Miquel Raynal wrote:
> In most cases we try to avoidit but in some cases this is

avoid it

> needed. Clarify why by adding a small comment.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml                  | 1 +
>  Documentation/devicetree/bindings/mtd/nand-chip.yaml            | 1 +
>  Documentation/devicetree/bindings/mtd/partitions/partition.yaml | 1 +
>  3 files changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
