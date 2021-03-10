Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8DE333326
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 03:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbhCJCdJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 21:33:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:36936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231235AbhCJCcm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 21:32:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7BFF364F84;
        Wed, 10 Mar 2021 02:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615343561;
        bh=69DUFNK2JB2JKzdkRdZ/XlWLEjG3ef1b4VxLgCOxoqw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=f8gpp9VdmwuPyoTT2fK7F+6mxLEzG+ejIftSJP3u2iiOdZhqnv8BsLbw6mvVTySiQ
         v82H9IFxBO06JOWtZwGPAQhXGmOFVszRwG8/3uCMNhie0bfuRfrjhuYGpXpQRJ5hR+
         Ay0ZeVv0/neMnICME4IC0vcWL9w9fdaGw8PGYCEupzWSepPFUjQ1do6ySHq/0S10Bh
         4h2L6PpngO7nw98bmzThF3id5nwvfyCKNT81qEwhOfqUI3bU3X/5g3bN2x7C5jnTLR
         EL+eljAwZ0NqjJcBWJu0z/YNVej/jEgpVR1XtlTX9+H5AC+jkSFCthAHtKhXqsnAQO
         EhMwHzTEgpUxA==
Received: by mail-ed1-f48.google.com with SMTP id m9so24949298edd.5;
        Tue, 09 Mar 2021 18:32:41 -0800 (PST)
X-Gm-Message-State: AOAM530VXa8s3FdBzPDQNHk1yc/9DLWibKa+T9jdPtQ1WJaLZ8iykRUF
        CAzqztTov9qTwRSgn5msC0GlIPlZeXAQPFSA9Q==
X-Google-Smtp-Source: ABdhPJwHjeFbPXpi7Hx1kJl/4EAmKe+MyBlw8ijIqRC+kYtRQvVW/TFyZN4qAshKdQQHueTyJWZ6Stlr1V0uk9El3Ag=
X-Received: by 2002:a05:6402:c88:: with SMTP id cm8mr699106edb.62.1615343560077;
 Tue, 09 Mar 2021 18:32:40 -0800 (PST)
MIME-Version: 1.0
References: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
 <20210222120259.94465-3-manivannan.sadhasivam@linaro.org> <20210305233657.GA839767@robh.at.kernel.org>
 <20210308053140.GA5457@thinkpad>
In-Reply-To: <20210308053140.GA5457@thinkpad>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 9 Mar 2021 19:32:28 -0700
X-Gmail-Original-Message-ID: <CAL_JsqKOfQ8v=Adp_3k64-WW-YXan_1kCG9mab6rE62VkSwmhQ@mail.gmail.com>
Message-ID: <CAL_JsqKOfQ8v=Adp_3k64-WW-YXan_1kCG9mab6rE62VkSwmhQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in Qcom NANDc
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh R <vigneshr@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Mar 7, 2021 at 10:31 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Fri, Mar 05, 2021 at 05:36:57PM -0600, Rob Herring wrote:
> > On Mon, Feb 22, 2021 at 05:32:58PM +0530, Manivannan Sadhasivam wrote:
> > > On a typical end product, a vendor may choose to secure some regions in
> > > the NAND memory which are supposed to stay intact between FW upgrades.
> > > The access to those regions will be blocked by a secure element like
> > > Trustzone. So the normal world software like Linux kernel should not
> > > touch these regions (including reading).
> > >
> > > So let's add a property for declaring such secure regions so that the
> > > driver can skip touching them.
> > >
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  Documentation/devicetree/bindings/mtd/qcom,nandc.yaml | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > > index 84ad7ff30121..7500e20da9c1 100644
> > > --- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > > +++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > > @@ -48,6 +48,13 @@ patternProperties:
> > >          enum:
> > >            - 512
> > >
> > > +      qcom,secure-regions:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> >
> > Don't you need 64-bit regions potentially? Though 4GB should be enough
> > for anyone.
> >
>
> Yes, given the size of current NAND based systems around, I thought 32 bit is
> enough.

Huh!? I was joking. 4GB is small nowadays. Make this 64-bit.

Rob
