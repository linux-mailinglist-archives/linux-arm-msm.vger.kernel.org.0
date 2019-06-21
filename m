Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9684DF0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 04:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfFUCOq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 22:14:46 -0400
Received: from onstation.org ([52.200.56.107]:56560 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725906AbfFUCOq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 22:14:46 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id D81933E9C9;
        Fri, 21 Jun 2019 02:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1561083285;
        bh=UMl+xDCel/ZpC8ltYDruApT4MS7N+u7XvaUpzvn6c5E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WN5tpYUjwkiOYyVBf/SFE9Yc8fRGfKwU9KMrtjMpDvNAyMVxoiSe9KN1sCvlD5UCk
         YtMlsZQhOuPzLda11cqC2TZBgsbNFWFDHaEozfq1XpxBcDofSE6ok5X730teBjDO71
         ahj3CZcZLeSD1T0q1kPeCTuqSizp4EJwFFlxtipc=
Date:   Thu, 20 Jun 2019 22:14:44 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: display: msm: gmu: add optional ocmem
 property
Message-ID: <20190621021444.GA13972@onstation.org>
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-3-masneyb@onstation.org>
 <CAL_Jsq+Ne=NEcLbO6C19iOny4bwm_m5QEtcsM78ZDeBmDUVO_Q@mail.gmail.com>
 <CAF6AEGs6By9-LGRBAPw2OwR9tRKJtEiZVgS2WVWRXmOK1VxNLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGs6By9-LGRBAPw2OwR9tRKJtEiZVgS2WVWRXmOK1VxNLA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 19, 2019 at 01:21:20PM -0700, Rob Clark wrote:
> On Wed, Jun 19, 2019 at 1:17 PM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Sun, Jun 16, 2019 at 7:29 AM Brian Masney <masneyb@onstation.org> wrote:
> > >
> > > Some A3xx and A4xx Adreno GPUs do not have GMEM inside the GPU core and
> > > must use the On Chip MEMory (OCMEM) in order to be functional. Add the
> > > optional ocmem property to the Adreno Graphics Management Unit bindings.
> > >
> > > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > > ---
> > >  Documentation/devicetree/bindings/display/msm/gmu.txt | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
> > > index 90af5b0a56a9..c746b95e95d4 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/gmu.txt
> > > +++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
> > > @@ -31,6 +31,10 @@ Required properties:
> > >  - iommus: phandle to the adreno iommu
> > >  - operating-points-v2: phandle to the OPP operating points
> > >
> > > +Optional properties:
> > > +- ocmem: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
> > > +         SoCs. See Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml.
> >
> > We already have a couple of similar properties. Lets standardize on
> > 'sram' as that is what TI already uses.
> >
> > Also, is the whole OCMEM allocated to the GMU? If not you should have
> > child nodes to subdivide the memory.
> >
> 
> iirc, downstream a large chunk of OCMEM is statically allocated for
> GPU.. the remainder is dynamically allocated for different use-cases.
> The upstream driver Brian is proposing only handles the static
> allocation case

It appears that the GPU expects to use a specific region of ocmem,
specifically starting at 0. The freedreno driver allocates 1MB of
ocmem on the Nexus 5 starting at ocmem address 0. As a test, I
changed the starting address to 0.5MB and kmscube shows only half the
cube, and four wide black bars across the screen:

https://www.flickr.com/photos/masneyb/48100534381/

> (and I don't think we have upstream support for the various audio and
> video use-cases that used dynamic OCMEM allocation downstream)

That's my understanding as well.

> Although maybe we should still have a child node to separate the
> statically and dynamically allocated parts?  I'm not sure what would
> make the most sense..

Given that the GPU is expecting a fixed address in ocmem, perhaps it
makes sense to have the child node. How about this based on the
sram/sram.txt bindings?

  ocmem: ocmem@fdd00000 {
    compatible = "qcom,msm8974-ocmem";

    reg = <0xfdd00000 0x2000>, <0xfec00000 0x180000>;
    reg-names = "ctrl", "mem";

    clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>, <&mmcc OCMEMCX_OCMEMNOC_CLK>;
    clock-names = "core", "iface";

    gmu-sram@0 {
      reg = <0x0 0x100000>;
      pool;
    };

    misc-sram@0 {
      reg = <0x100000 0x080000>;
      export;
    };
  };

I marked the misc pool as export since I've seen in the downstream ocmem
sources a reference to their closed libsensors that runs in userspace.

Looking at the sram bindings led me to the genalloc API
(Documentation/core-api/genalloc.rst). I wonder if this is the way that
this should be done?

Brian
