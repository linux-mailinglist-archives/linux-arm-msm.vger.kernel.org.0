Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA364F8F0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2019 01:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbfFVX2i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Jun 2019 19:28:38 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39993 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726286AbfFVX2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Jun 2019 19:28:38 -0400
Received: by mail-ed1-f65.google.com with SMTP id k8so15646386eds.7;
        Sat, 22 Jun 2019 16:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OvdGvB+gsBI8ix8GBbVgoDhcwK+AHVAdtlmUns+BMLk=;
        b=l/U6ztiWvim6OPcpsFWv+8/nGMbNqRUP5HKW49NEuFiQ/2hm5kLZ4LOKVe4Dj9kDLL
         h4stuhYillm96itObs7iUJZP+sT2TCufg4Cy9p25mhyv6xk4YFzCeWHzshYvdTM8syLa
         XYDbgwvCQeZu1v0+Tf5TFOCIPu5oOP2Q9Z8BPZ8kuhFuBc9wZ4J6AgH/ubHeiOsmjlnK
         2vm3QYGxJaVtJCyuCKlORFWR7xKSgmDUFAailHSENSEr0KXCUDn+AOsswOX+362EHKpm
         DyjZE3VP2vqTXGZV7DJwj3grRVINabDTJQsScoIEKyoY5yJYNXK/JoU80CGqQRw3VJNU
         Jquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OvdGvB+gsBI8ix8GBbVgoDhcwK+AHVAdtlmUns+BMLk=;
        b=KMN0zcxTfUqLq5DvtWt8+6aMj+KhuiX/udzLcs0SELBHNeucHtbcjZQFXV5rTy0PCg
         6HNRRJVlsIw5dPoAY0DDNQpZhx6DHOldHwyUzXjfTHQPZFza17gPE/q7UKmh9Cqyhgtd
         1orzl9Xbf0r/+ghUuSskIDJvdAiWr3jDE/xEK74c5Wd+LKcwq0x6PF+qhIZ4ug+bVSWZ
         lpB4XZNPz7EL8AZUPDP+/PD0MnXM1ju3oMe+PubyTj52evUd14iJSJuB2Mxvs28XNbtt
         QM6u+ZgC3ItI8Vfx6iXVrzAi7rE4pXpf28FGlVrawuov7BjxX7AUbF+qH3Nt+Fxu2iKr
         BsJA==
X-Gm-Message-State: APjAAAWUSOZ7MtlWaU4IW501gNJMNNfp52tABxS4wU9AdvJN4GbqhNUC
        W/rdek0LXe40qOQf7oxxAyKbnC+hirotQA8gicfnhOx1
X-Google-Smtp-Source: APXvYqwFLKK+g33AoATUdqVfqMxrjCm4EjDKVf4RHDoYPxn6MRppHUMZNpsmcSWHp1P/TWzfaasoZ54TfRUwqU9nxlo=
X-Received: by 2002:a50:9468:: with SMTP id q37mr26168041eda.163.1561246115698;
 Sat, 22 Jun 2019 16:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190616132930.6942-1-masneyb@onstation.org> <20190616132930.6942-3-masneyb@onstation.org>
 <CAL_Jsq+Ne=NEcLbO6C19iOny4bwm_m5QEtcsM78ZDeBmDUVO_Q@mail.gmail.com>
 <CAF6AEGs6By9-LGRBAPw2OwR9tRKJtEiZVgS2WVWRXmOK1VxNLA@mail.gmail.com> <20190621021444.GA13972@onstation.org>
In-Reply-To: <20190621021444.GA13972@onstation.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 22 Jun 2019 16:28:20 -0700
Message-ID: <CAF6AEGuVKtAu60kLYNKOsy3=hT0FDbJ5vvEJE6gFLAodpU5MGA@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: display: msm: gmu: add optional ocmem property
To:     Brian Masney <masneyb@onstation.org>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 20, 2019 at 7:14 PM Brian Masney <masneyb@onstation.org> wrote:
>
> On Wed, Jun 19, 2019 at 01:21:20PM -0700, Rob Clark wrote:
> > On Wed, Jun 19, 2019 at 1:17 PM Rob Herring <robh+dt@kernel.org> wrote:
> > >
> > > On Sun, Jun 16, 2019 at 7:29 AM Brian Masney <masneyb@onstation.org> wrote:
> > > >
> > > > Some A3xx and A4xx Adreno GPUs do not have GMEM inside the GPU core and
> > > > must use the On Chip MEMory (OCMEM) in order to be functional. Add the
> > > > optional ocmem property to the Adreno Graphics Management Unit bindings.
> > > >
> > > > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/display/msm/gmu.txt | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
> > > > index 90af5b0a56a9..c746b95e95d4 100644
> > > > --- a/Documentation/devicetree/bindings/display/msm/gmu.txt
> > > > +++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
> > > > @@ -31,6 +31,10 @@ Required properties:
> > > >  - iommus: phandle to the adreno iommu
> > > >  - operating-points-v2: phandle to the OPP operating points
> > > >
> > > > +Optional properties:
> > > > +- ocmem: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
> > > > +         SoCs. See Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml.
> > >
> > > We already have a couple of similar properties. Lets standardize on
> > > 'sram' as that is what TI already uses.
> > >
> > > Also, is the whole OCMEM allocated to the GMU? If not you should have
> > > child nodes to subdivide the memory.
> > >
> >
> > iirc, downstream a large chunk of OCMEM is statically allocated for
> > GPU.. the remainder is dynamically allocated for different use-cases.
> > The upstream driver Brian is proposing only handles the static
> > allocation case
>
> It appears that the GPU expects to use a specific region of ocmem,
> specifically starting at 0. The freedreno driver allocates 1MB of
> ocmem on the Nexus 5 starting at ocmem address 0. As a test, I
> changed the starting address to 0.5MB and kmscube shows only half the
> cube, and four wide black bars across the screen:
>
> https://www.flickr.com/photos/masneyb/48100534381/
>
> > (and I don't think we have upstream support for the various audio and
> > video use-cases that used dynamic OCMEM allocation downstream)
>
> That's my understanding as well.
>
> > Although maybe we should still have a child node to separate the
> > statically and dynamically allocated parts?  I'm not sure what would
> > make the most sense..
>
> Given that the GPU is expecting a fixed address in ocmem, perhaps it
> makes sense to have the child node. How about this based on the
> sram/sram.txt bindings?
>
>   ocmem: ocmem@fdd00000 {
>     compatible = "qcom,msm8974-ocmem";
>
>     reg = <0xfdd00000 0x2000>, <0xfec00000 0x180000>;
>     reg-names = "ctrl", "mem";
>
>     clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>, <&mmcc OCMEMCX_OCMEMNOC_CLK>;
>     clock-names = "core", "iface";
>
>     gmu-sram@0 {
>       reg = <0x0 0x100000>;
>       pool;
>     };
>
>     misc-sram@0 {
>       reg = <0x100000 0x080000>;
>       export;
>     };
>   };
>
> I marked the misc pool as export since I've seen in the downstream ocmem
> sources a reference to their closed libsensors that runs in userspace.
>
> Looking at the sram bindings led me to the genalloc API
> (Documentation/core-api/genalloc.rst). I wonder if this is the way that
> this should be done?

won't claim to be a dt expert, but this seems somewhat sane..  maybe
drop the export until a use-case comes along for that.. or even the
entire second child node?  I guess that comes down to what robher and
others prefer, I can't really speculate too much about the non-gpu
use-cases for ocmem (or if they'll ever be upstream)

BR,
-R
