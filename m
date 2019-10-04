Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43A5ACBF0B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2019 17:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389628AbfJDPXQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 11:23:16 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39025 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389591AbfJDPXQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 11:23:16 -0400
Received: by mail-wr1-f67.google.com with SMTP id r3so7734779wrj.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2019 08:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6VbBxJXaVWnZlAADrl1WxG30jUtJzv378C6PGxLc+AY=;
        b=aaa3/q/a5tR1PDWZ8bj5BaM3zUVRiDQB4aXt7LaL/buzlSan8z0CB0n/sg6ovJ5zUa
         YP7iZ7kpt73cR6r9njXdlT2x2MBKsK3hGke9IUzvFiRDiJTajjLh5il5O3+TyxF/lIGk
         P+k1wmxzdoxqWZlQB5OMkp0ytrfwyPtL2VMsUlAIKnZGYpqAj9CjOzvpLr2kOJrnynLx
         M60zVkJidfBI0cb6u0ns7Ywzrv87tQkdqZBmZhzE5kCXRWhs2llV67cXPh62Jb2SEUYC
         CoxjyX8Vtb+eRnrdiTgenB/r8IlbteZpVrFx95o8nQWZsHUumA0RiTlxZdN/NbYPMg38
         t7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6VbBxJXaVWnZlAADrl1WxG30jUtJzv378C6PGxLc+AY=;
        b=A2fFM2Scir1CaLee2G6sYZtyRxhI91bwot7o7FQB9bK22T92HVUfKYIi8CV4auz5E6
         fusEfXJv4ZGYEr8sXwa2VTu1byCu1Ers1af9TN+AO5v7oWcexSrGjFCo/zzcDWLUT1OI
         StEqrbDYvcATF8eogG/+N2WaFK2GQsIAxJgC6hi9Zqe6jRQrFR7VEKb7d+qsqvJNNCkp
         DDYfVkxHllW30eq/UjfW37e8yzRZdxVFlyiSkxCFmYd9pTU5RcTZFbCwyQ1RxxKs3jX5
         liFCAFisxJNvlTXCXck7gMGIrWu3etW3SvlxfBuE39hcI+OaaAX1/Q9GvoeO6TbURc/s
         uEbA==
X-Gm-Message-State: APjAAAUV3hFS/nnvLlu7ePduxWVRxeNR9QxqJ6ks4exvMaAA68iayhS6
        yvj9ZTnmFiqwFN5DXnYbj1GMyVwt6NsPSgzfNpkqKg==
X-Google-Smtp-Source: APXvYqxXCw83yPFVlvvGHkJz3490AdAmYodXCS3fD7fYOO6wXPsyCN2EyfZEPC/Vp6+Yki2f6bhsZmh46pqCJIQKr28=
X-Received: by 2002:a05:6000:45:: with SMTP id k5mr10966563wrx.259.1570202591937;
 Fri, 04 Oct 2019 08:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190301192017.39770-1-dianders@chromium.org> <CAJ+vNU0Ma5nG9_ThLO4cdO+=ivf7rmXiHZonF0HY0xx6X3R6Hw@mail.gmail.com>
 <5dce2964-8761-e7d0-8963-f0f5cb2feb02@arm.com> <CAJ+vNU0Q1-d7YDbAAEMqEcWnniqo6jLdKBbcUTar5=hJ+AC8vQ@mail.gmail.com>
 <1f6f7eb0-e1dc-d5a8-fb38-44c5bd839894@arm.com>
In-Reply-To: <1f6f7eb0-e1dc-d5a8-fb38-44c5bd839894@arm.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 4 Oct 2019 08:23:00 -0700
Message-ID: <CAJ+vNU1Nd2p-ot2Qkj6vD9yD6gcYM-vm+snNWyt0ChgSqe4tBg@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: Break insecure users by disabling
 bypass by default
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Tirumalesh Chalamarla <tchalamarla@caviumnetworks.com>,
        Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>,
        linux-arm-msm@vger.kernel.org, evgreen@chromium.org,
        tfiga@chromium.org, Rob Clark <robdclark@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 3, 2019 at 3:24 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2019-10-03 9:51 pm, Tim Harvey wrote:
> > On Thu, Oct 3, 2019 at 1:42 PM Robin Murphy <robin.murphy@arm.com> wrote:
> >>
> >> Hi Tim,
> >>
> >> On 2019-10-03 7:27 pm, Tim Harvey wrote:
> >>> On Fri, Mar 1, 2019 at 11:21 AM Douglas Anderson <dianders@chromium.org> wrote:
> >>>>
> >>>> If you're bisecting why your peripherals stopped working, it's
> >>>> probably this CL.  Specifically if you see this in your dmesg:
> >>>>     Unexpected global fault, this could be serious
> >>>> ...then it's almost certainly this CL.
> >>>>
> >>>> Running your IOMMU-enabled peripherals with the IOMMU in bypass mode
> >>>> is insecure and effectively disables the protection they provide.
> >>>> There are few reasons to allow unmatched stream bypass, and even fewer
> >>>> good ones.
> >>>>
> >>>> This patch starts the transition over to make it much harder to run
> >>>> your system insecurely.  Expected steps:
> >>>>
> >>>> 1. By default disable bypass (so anyone insecure will notice) but make
> >>>>      it easy for someone to re-enable bypass with just a KConfig change.
> >>>>      That's this patch.
> >>>>
> >>>> 2. After people have had a little time to come to grips with the fact
> >>>>      that they need to set their IOMMUs properly and have had time to
> >>>>      dig into how to do this, the KConfig will be eliminated and bypass
> >>>>      will simply be disabled.  Folks who are truly upset and still
> >>>>      haven't fixed their system can either figure out how to add
> >>>>      'arm-smmu.disable_bypass=n' to their command line or revert the
> >>>>      patch in their own private kernel.  Of course these folks will be
> >>>>      less secure.
> >>>>
> >>>> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> >>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>>> ---
> >>>
> >>> Hi Doug / Robin,
> >>>
> >>> I ran into this breaking things on OcteonTx boards based on CN80XX
> >>> CPU. The IOMMU configuration is a bit beyond me and I'm hoping you can
> >>> offer some advice. The IOMMU here is cavium,smmu-v2 as defined in
> >>> https://github.com/Gateworks/dts-newport/blob/master/cn81xx-linux.dtsi
> >>>
> >>> Booting with 'arm-smmu.disable_bypass=n' does indeed work around the
> >>> breakage as the commit suggests.
> >>>
> >>> Any suggestions for a proper fix?
> >>
> >> Ah, you're using the old "mmu-masters" binding (and in a way which isn't
> >> well-defined - it's never been specified what the stream ID argument(s)
> >> would mean for a PCI host bridge, and Linux just ignores them). The
> >> ideal thing would be to update the DT to generic "iommu-map" properties
> >> - it's been a long time since I last played with a ThunderX, but I
> >> believe the SMMU stream IDs should just be the same as the ITS device
> >> IDs (which is how the "mmu-masters" mapping would have played out anyway).
> >>
> >> The arm-smmu driver support for the old binding has always relied on
> >> implicit bypass - there are technical reasons why we can't realistically
> >> support the full functionality offered to the generic bindings, but it
> >> would be possible to add some degree of workaround to prevent it
> >> interacting quite so poorly with disable_bypass, if necessary. Do you
> >> have deployed systems with DTs that can't be updated, but still might
> >> need to run new kernels?
> >>
> >
> > Robin,
> >
> > Thanks for the response. I don't care too much about supporting new
> > kernels with the current DT - I'm good with fixing this with a DT
> > change. Would you be able to give me an example? I would love to see
> > Cavium mainline an cn81xx dts/dtsi in arch/arm64/boot/dts to be used
> > as a base as the only thing we have to go off of currently is the
> > Cavium SDK which has fairly old kernel support.
>
> No promises (it's a late-night hack from my sofa), but try giving this a
> go...
>
> Robin.
>
> ----->8-----
> diff --git a/cn81xx-linux.dtsi b/cn81xx-linux.dtsi
> index 3b759d9575fe..dabc9047c674 100644
> --- a/cn81xx-linux.dtsi
> +++ b/cn81xx-linux.dtsi
> @@ -234,7 +234,7 @@
>                         clocks = <&sclk>;
>                 };
>
> -               smmu0@830000000000 {
> +               smmu: smmu0@830000000000 {
>                         compatible = "cavium,smmu-v2";
>                         reg = <0x8300 0x0 0x0 0x2000000>;
>                         #global-interrupts = <1>;
> @@ -249,23 +249,18 @@
>                                      <0 69 4>, <0 69 4>, <0 69 4>, <0 69 4>, <0 69 4>, <0 69 4>,
>                                      <0 69 4>, <0 69 4>, <0 69 4>, <0 69 4>, <0 69 4>, <0 69 4>,
>                                      <0 69 4>, <0 69 4>, <0 69 4>, <0 69 4>, <0 69 4>;
> -
> -                       mmu-masters = <&ecam0 0x100>,
> -                                     <&pem0  0x200>,
> -                                     <&pem1  0x300>,
> -                                     <&pem2  0x400>;
> -
> +                       #iommu-cells = <1>;
> +                       dma-coherent;
>                 };
>
>                 ecam0: pci@848000000000 {
>                         compatible = "pci-host-ecam-generic";
>                         device_type = "pci";
> -                       msi-parent = <&its>;
>                         msi-map = <0 &its 0 0x10000>;
> +                       iommu-map = <0 &smmu 0 0x10000>;
>                         bus-range = <0 31>;
>                         #size-cells = <2>;
>                         #address-cells = <3>;
> -                       #stream-id-cells = <1>;
>                         u-boot,dm-pre-reloc;
>                         dma-coherent;
>                         reg = <0x8480 0x00000000 0 0x02000000>;  /* Configuration space */
> @@ -399,12 +394,11 @@
>
>                         compatible = "cavium,pci-host-thunder-pem";
>                         device_type = "pci";
> -                       msi-parent = <&its>;
>                         msi-map = <0 &its 0 0x10000>;
> +                       iommu-map = <0 &smmu 0 0x10000>;
>                         bus-range = <0x1f 0x57>;
>                         #size-cells = <2>;
>                         #address-cells = <3>;
> -                       #stream-id-cells = <1>;
>                         dma-coherent;
>                         reg = <0x8800 0x1f000000 0x0 0x39000000>,  /* Configuration space */
>                                 <0x87e0 0xc0000000 0x0 0x01000000>; /* PEM space */
> @@ -424,12 +418,11 @@
>                 pem1: pci@87e0c1000000 {
>                         compatible = "cavium,pci-host-thunder-pem";
>                         device_type = "pci";
> -                       msi-parent = <&its>;
>                         msi-map = <0 &its 0 0x10000>;
> +                       iommu-map = <0 &smmu 0 0x10000>;
>                         bus-range = <0x57 0x8f>;
>                         #size-cells = <2>;
>                         #address-cells = <3>;
> -                       #stream-id-cells = <1>;
>                         dma-coherent;
>                         reg = <0x8840 0x57000000 0x0 0x39000000>,  /* Configuration space */
>                                 <0x87e0 0xc1000000 0x0 0x01000000>; /* PEM space */
> @@ -449,12 +442,11 @@
>                 pem2: pci@87e0c2000000 {
>                         compatible = "cavium,pci-host-thunder-pem";
>                         device_type = "pci";
> -                       msi-parent = <&its>;
>                         msi-map = <0 &its 0 0x10000>;
> +                       iommu-map = <0 &smmu 0 0x10000>;
>                         bus-range = <0x8f 0xc7>;
>                         #size-cells = <2>;
>                         #address-cells = <3>;
> -                       #stream-id-cells = <1>;
>                         dma-coherent;
>                         reg = <0x8880 0x8f000000 0x0 0x39000000>,  /* Configuration space */
>                                 <0x87e0 0xc2000000 0x0 0x01000000>; /* PEM space */

Robin,

No difference... still need 'arm-smmu.disable_bypass=n' to boot. Are
all four iommu-map props above supposed to be the same? Seems to me
they all point to the same thing which looks wrong.

Tim
