Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13D22617009
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 22:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbiKBVq6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 17:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiKBVq6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 17:46:58 -0400
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5079FD2;
        Wed,  2 Nov 2022 14:46:57 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id l42-20020a9d1b2d000000b0066c6366fbc3so12482otl.3;
        Wed, 02 Nov 2022 14:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEKx0Shm1UKG9N4dHMtDn/VoOtRRsP7HnRMJ8KxzNPs=;
        b=YOhf6D5VmnaFzCdFjyCwTTF/Dvq3JDn/3tSSuPsXOSjxun5UpwbEnsYzKBNzWT6Dyn
         zIPMM3rVyiTr0Rk8P2oGigMN2uMj2cXc/H4dq5KhiCrmweVGZnxAdma7b5uP/hQga2I8
         O5eoAaQT60Snj//VcMwXwon3H4NmRusmqZte3TSau/pp6eGBk1r8UdJjmFdVHt56O+Jx
         G2yqJ3cmWmcB109AJPpMddsbRweWYqCa/0WVNwj3qEUNYf9fyIx8iXhXRJTeN7ihPk/Q
         1YA4WgVFKj9mEGLf+zt0kbOhE4as8vgqRglltP5wofVvCKvZRvmegqYXZ37gKDw9gvp6
         zVzA==
X-Gm-Message-State: ACrzQf3s6VxJAUsvZTWgGIWEVHy1vFtM3nT84HzC6WxTDCOnxKGqVjyN
        /T3KqIZWfG8LLZJf3E9aZQ==
X-Google-Smtp-Source: AMsMyM4ufTiUMCMAGmLmron3x5FQ9kYiwpyqxeU/VVzQh3J8El2uRf5SIGCRwa9kgLnn77z1Y9oBkQ==
X-Received: by 2002:a05:6830:4409:b0:66c:797d:5e07 with SMTP id q9-20020a056830440900b0066c797d5e07mr2098928otv.57.1667425616611;
        Wed, 02 Nov 2022 14:46:56 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k6-20020a056870148600b0011f00b027bdsm6503172oab.45.2022.11.02.14.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 14:46:56 -0700 (PDT)
Received: (nullmailer pid 524395 invoked by uid 1000);
        Wed, 02 Nov 2022 21:46:57 -0000
Date:   Wed, 2 Nov 2022 16:46:57 -0500
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
Message-ID: <20221102214657.GC459441-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-6-miquel.raynal@bootlin.com>
 <20221031205442.GA3307775-robh@kernel.org>
 <20221102175007.4a4db2c9@xps-13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102175007.4a4db2c9@xps-13>
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

On Wed, Nov 02, 2022 at 05:50:07PM +0100, Miquel Raynal wrote:
> Hi Rob,
> 
> robh@kernel.org wrote on Mon, 31 Oct 2022 15:54:42 -0500:
> 
> > On Sat, Oct 29, 2022 at 01:59:26AM +0200, Miquel Raynal wrote:
> > > The chip node name in this driver is expected to be different and should
> > > be prefixed with onenand instead of the regular "flash" string, so
> > > mention it.
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> > > index a953f7397c40..8a79ad300216 100644
> > > --- a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> > > +++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> > > @@ -15,6 +15,9 @@ description:
> > >    as child nodes of the GPMC controller.
> > >  
> > >  properties:
> > > +  $nodename:
> > > +    pattern: "^onenand@[0-9],[0,9]$"  
> > 
> > I don't think it is worth enforcing node names that we 
> > haven't defined in the spec. Wouldn't 'nand-controller' be appropriate?
> 
> Actually I've added this pattern here because there are several users in
> the arm/boot/dts/ directory which use it, and the example below in this
> file also uses onenand@xxx.
> 
> I can either fix the example to use nand-controller or add this pattern
> (I guess "deprecated: true" would not mean anything?). What do you
> prefer?
> 
> If we decide to switch to the nand-controller@ name, shall I change the
> DTS as well?

I guess I'd just leave it as you have it.

Rob
