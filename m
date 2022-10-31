Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BADDF613F59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 21:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiJaU4r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 16:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbiJaU4k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 16:56:40 -0400
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C3D12762;
        Mon, 31 Oct 2022 13:56:39 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-13b6c1c89bdso14760109fac.13;
        Mon, 31 Oct 2022 13:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvegeEey9KZKQoiJGj9a9K6oNOkm96buyBFBJMatGTs=;
        b=fALu615imcXWWCESDV7y7znQGCzVQv8usW98XzAeM/AJOQFiZnpNHcF9oqwpbElCam
         ymH38ydwo3kN4NfZcYQx7cC9MVRDqX553WbCfA3KzhC3eYhJofQcl7hj8dlOkDa8Pvb5
         81t3mtK+Ak35NywLjLxl8R+Vatv9f7nvY6rLOsDElUPNew3zV7seqzctmRL4KMQs1DQ1
         r9ICl5bqfZIsSeD7b/rQJ4fFUStRNo8/L8vKFynShHjQjBM9+gb7PVvzTJmm27U0Vv3s
         qpmeDoOU1+MdhJgEUVgJJo3Uiyih8X4gYfpFZnIHqv24ATcIBOBskJc/U3rHECiaddpH
         Zv8g==
X-Gm-Message-State: ACrzQf0ivf14743/zEaT2z/fM0uU9x+c6iZdgylNS1eddzr4Lp8R/UG1
        vT0cx9raVmKUsG0ecbtDsQ==
X-Google-Smtp-Source: AMsMyM7ot7WGQL5vQT/Scg5o+2DDdPD1reviquzBu+AauCzEoG/H14929Ca5tYII/jDSRqJizgiilw==
X-Received: by 2002:a05:6870:e30e:b0:132:e934:5c0a with SMTP id z14-20020a056870e30e00b00132e9345c0amr8424541oad.202.1667249798893;
        Mon, 31 Oct 2022 13:56:38 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k6-20020a056870148600b0011f00b027bdsm3526141oab.45.2022.10.31.13.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 13:56:38 -0700 (PDT)
Received: (nullmailer pid 3507196 invoked by uid 1000);
        Mon, 31 Oct 2022 20:56:39 -0000
Date:   Mon, 31 Oct 2022 15:56:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Michael Walle <michael@walle.cc>, linux-sunxi@lists.linux.dev,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Richard Weinberger <richard@nod.at>,
        Pratyush Yadav <p.yadav@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
        linux-mtd@lists.infradead.org,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 08/12] dt-bindings: mtd: spi-nor: Drop common properties
Message-ID: <166724979937.3507124.10435048977508140792.robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-9-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-9-miquel.raynal@bootlin.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sat, 29 Oct 2022 01:59:29 +0200, Miquel Raynal wrote:
> When redefining common properties does not bring any additional
> information, just drop them from the SPI-NOR bindings because these
> properties already are definied in mtd.yaml.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.yaml     | 14 --------------
>  1 file changed, 14 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
