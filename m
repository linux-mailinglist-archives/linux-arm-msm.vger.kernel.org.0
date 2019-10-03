Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C42C0CB079
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 22:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730140AbfJCUvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 16:51:17 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45721 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbfJCUvR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 16:51:17 -0400
Received: by mail-wr1-f67.google.com with SMTP id r5so4225897wrm.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2019 13:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oT5munY2A09zpSHzYJ6m6wmIRb/RVjgLvFvW+U+KSoY=;
        b=xMip7plzqBtaMG8e7QIgtdrUd2y6V5SX/WOrz/GyKIxy13ehe0olzrNXZCKbJc13d9
         QwKm2GmW1840zwcHGUXOwYOVSuL/asmBZ1MmpK1l0JICCd9iqE1VeaY+n7liUlqi2vqZ
         dJ9rY47/oWc9gslxYiT1uKiS1yBOGY+Ex56+2xpEP9Dfr/IB0fUkiriCZGIqAfaxNU3G
         a3dkCvWXxXNecnV0MGX0M+cUsf6uVqVZIOa1M/HJzW2Gdndaf7RxSYyY26ilNeTaQ+bt
         +ewWpw++s6oJEj4OEHQ6hnQ/ohA5Ac4dAVk2cQX9O1beDM2QFJxUGeqEE1197IHvnOzq
         +XBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oT5munY2A09zpSHzYJ6m6wmIRb/RVjgLvFvW+U+KSoY=;
        b=gxokHilGXfmELKnfw+F/eTSqznjxCchxPluk6virAhwzonp3rFpWlK8XS5SdacbNRQ
         WBCupfmbK7kKdEsbZ0PlFfL2+pAcPyxI3bgch1ELUkKrD0+ryRTDxHSaBFtxovRBgm/J
         I4Su4yiMz0yB7BFCPWmftKTMUGni2DiCa6iG1557pusfaW8ZjAP7wnBiaky+VKwlpAmk
         yYq59egJlPx5umxIJsIzCnUtBmqxQYMVYeHe1R8enzGYXj0rCmK6Yb4ESpikN3uwyFQ3
         q2Mwo019+7xKYWUZUnjafmPb8QaNkQgRzKnwebz6XTZVKYSzripQzTCYhgGqygB5Pk0S
         Ybqg==
X-Gm-Message-State: APjAAAUG1Mh3qJXao+2ODNonTXbiXXkahk9XFhUh/JvO0HUtot/L7lG2
        bnZXHJxc4mZawwkbA7Ike7B+rpc1cT56JmeYqLZnjw==
X-Google-Smtp-Source: APXvYqxDT5OzCqjJantqJggK7nMHfDLOl2hcFlODbx4Jh6VSUctsOvtmO4GgjrDD3AHzRLRHwJWsAxNNMAXWqdPcxrM=
X-Received: by 2002:a05:6000:45:: with SMTP id k5mr7782985wrx.259.1570135874531;
 Thu, 03 Oct 2019 13:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190301192017.39770-1-dianders@chromium.org> <CAJ+vNU0Ma5nG9_ThLO4cdO+=ivf7rmXiHZonF0HY0xx6X3R6Hw@mail.gmail.com>
 <5dce2964-8761-e7d0-8963-f0f5cb2feb02@arm.com>
In-Reply-To: <5dce2964-8761-e7d0-8963-f0f5cb2feb02@arm.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 3 Oct 2019 13:51:03 -0700
Message-ID: <CAJ+vNU0Q1-d7YDbAAEMqEcWnniqo6jLdKBbcUTar5=hJ+AC8vQ@mail.gmail.com>
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

On Thu, Oct 3, 2019 at 1:42 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> Hi Tim,
>
> On 2019-10-03 7:27 pm, Tim Harvey wrote:
> > On Fri, Mar 1, 2019 at 11:21 AM Douglas Anderson <dianders@chromium.org> wrote:
> >>
> >> If you're bisecting why your peripherals stopped working, it's
> >> probably this CL.  Specifically if you see this in your dmesg:
> >>    Unexpected global fault, this could be serious
> >> ...then it's almost certainly this CL.
> >>
> >> Running your IOMMU-enabled peripherals with the IOMMU in bypass mode
> >> is insecure and effectively disables the protection they provide.
> >> There are few reasons to allow unmatched stream bypass, and even fewer
> >> good ones.
> >>
> >> This patch starts the transition over to make it much harder to run
> >> your system insecurely.  Expected steps:
> >>
> >> 1. By default disable bypass (so anyone insecure will notice) but make
> >>     it easy for someone to re-enable bypass with just a KConfig change.
> >>     That's this patch.
> >>
> >> 2. After people have had a little time to come to grips with the fact
> >>     that they need to set their IOMMUs properly and have had time to
> >>     dig into how to do this, the KConfig will be eliminated and bypass
> >>     will simply be disabled.  Folks who are truly upset and still
> >>     haven't fixed their system can either figure out how to add
> >>     'arm-smmu.disable_bypass=n' to their command line or revert the
> >>     patch in their own private kernel.  Of course these folks will be
> >>     less secure.
> >>
> >> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> >> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >> ---
> >
> > Hi Doug / Robin,
> >
> > I ran into this breaking things on OcteonTx boards based on CN80XX
> > CPU. The IOMMU configuration is a bit beyond me and I'm hoping you can
> > offer some advice. The IOMMU here is cavium,smmu-v2 as defined in
> > https://github.com/Gateworks/dts-newport/blob/master/cn81xx-linux.dtsi
> >
> > Booting with 'arm-smmu.disable_bypass=n' does indeed work around the
> > breakage as the commit suggests.
> >
> > Any suggestions for a proper fix?
>
> Ah, you're using the old "mmu-masters" binding (and in a way which isn't
> well-defined - it's never been specified what the stream ID argument(s)
> would mean for a PCI host bridge, and Linux just ignores them). The
> ideal thing would be to update the DT to generic "iommu-map" properties
> - it's been a long time since I last played with a ThunderX, but I
> believe the SMMU stream IDs should just be the same as the ITS device
> IDs (which is how the "mmu-masters" mapping would have played out anyway).
>
> The arm-smmu driver support for the old binding has always relied on
> implicit bypass - there are technical reasons why we can't realistically
> support the full functionality offered to the generic bindings, but it
> would be possible to add some degree of workaround to prevent it
> interacting quite so poorly with disable_bypass, if necessary. Do you
> have deployed systems with DTs that can't be updated, but still might
> need to run new kernels?
>

Robin,

Thanks for the response. I don't care too much about supporting new
kernels with the current DT - I'm good with fixing this with a DT
change. Would you be able to give me an example? I would love to see
Cavium mainline an cn81xx dts/dtsi in arch/arm64/boot/dts to be used
as a base as the only thing we have to go off of currently is the
Cavium SDK which has fairly old kernel support.

Thanks,

Tim
