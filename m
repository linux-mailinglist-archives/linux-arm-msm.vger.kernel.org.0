Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45CAA6169BB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 17:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbiKBQuk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 12:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbiKBQuR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 12:50:17 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4850F1120;
        Wed,  2 Nov 2022 09:50:15 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 9836CC0007;
        Wed,  2 Nov 2022 16:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1667407813;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZsyW8KhbSSKVe049F+rFznlD/CrHS6a/awk5KKcwAxk=;
        b=FJGlgULNNF8yfAiVsxOge3rp3zqT+bPsVZ/NcJIQVVEPrGHJ0G3ANYjBVm1V8jurCI5z9/
        BaiUyUX5xKTM4MDUnpDdvqwfzCwjq0CQ12+3n4kJSKSEn+JZHXOBbrsXioyZanq4PfYESK
        +f7mld3Tgp86shRYUpMVDsoPr99xeYtu9GDpwELKZCVkinaj14W2hp8rL9O2y0koiy0rjN
        3sdCsiuuaVQ4kNjaKXbXMVHfIUyXdDKlrNapg3MOMdC7OLth4arERUsWd0Ft8KGsGbMW6N
        GcesQ5HwTRPYgk/OF34RqNPM8fHoJcLWkEkOic8aKn6t0QMcBOcNZmfyKTkfpw==
Date:   Wed, 2 Nov 2022 17:50:07 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh@kernel.org>
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
Message-ID: <20221102175007.4a4db2c9@xps-13>
In-Reply-To: <20221031205442.GA3307775-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
        <20221028235933.934850-6-miquel.raynal@bootlin.com>
        <20221031205442.GA3307775-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

robh@kernel.org wrote on Mon, 31 Oct 2022 15:54:42 -0500:

> On Sat, Oct 29, 2022 at 01:59:26AM +0200, Miquel Raynal wrote:
> > The chip node name in this driver is expected to be different and should
> > be prefixed with onenand instead of the regular "flash" string, so
> > mention it.
> >=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml=
 b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> > index a953f7397c40..8a79ad300216 100644
> > --- a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
> > @@ -15,6 +15,9 @@ description:
> >    as child nodes of the GPMC controller.
> > =20
> >  properties:
> > +  $nodename:
> > +    pattern: "^onenand@[0-9],[0,9]$" =20
>=20
> I don't think it is worth enforcing node names that we=20
> haven't defined in the spec. Wouldn't 'nand-controller' be appropriate?

Actually I've added this pattern here because there are several users in
the arm/boot/dts/ directory which use it, and the example below in this
file also uses onenand@xxx.

I can either fix the example to use nand-controller or add this pattern
(I guess "deprecated: true" would not mean anything?). What do you
prefer?

If we decide to switch to the nand-controller@ name, shall I change the
DTS as well?

Thanks,
Miqu=C3=A8l
