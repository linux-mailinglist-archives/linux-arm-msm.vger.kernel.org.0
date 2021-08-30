Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8955C3FBC7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 20:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238843AbhH3SeA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 14:34:00 -0400
Received: from relay08.th.seeweb.it ([5.144.164.169]:53705 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238849AbhH3Sd7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 14:33:59 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5DB493E878;
        Mon, 30 Aug 2021 20:33:01 +0200 (CEST)
Date:   Mon, 30 Aug 2021 20:33:00 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] arm: dts: qcom: apq8064: Use 27MHz PXO clock as DSI
 PLL reference
Message-ID: <YS0kXJ/Mr+qNMRfq@Marijn-Arch-PC.localdomain>
References: <20210829203027.276143-2-marijn.suijten@somainline.org>
 <CAA8EJprQ03ipZzO+1vgt9W7jFbLXgsYR0n-oJxVB-142x8dgRA@mail.gmail.com>
 <17d19b93-dbe5-cc85-f302-b52cd8eeed56@somainline.org>
 <CAA8EJpqd7_5510TodALnX13Wo0MufYm2G=r6vw9sy=VURrewyw@mail.gmail.com>
 <YSznouVZ93sUd6xa@Marijn-Arch-PC.localdomain>
 <CAA8EJpoRo6rPgpUeT9X0K4UPu5d8-YBP=BJ3AAejD+wujhmv+g@mail.gmail.com>
 <YSzqR2yq3MtdPnIG@Marijn-Arch-PC.localdomain>
 <YSz2kVKv8jhz7/n8@yoga>
 <YSz7NZD7elH3+XgP@Marijn-Arch-PC.localdomain>
 <YS0AEZR7NhmDhHmk@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YS0AEZR7NhmDhHmk@yoga>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-30 10:58:09, Bjorn Andersson wrote:
[...]
> > > 
> > > Afaik these devices all boots off a boot.img, which means that it's
> > > unlikely that a new kernel is installed on a device with an older DT.
> > > None of them would boot mainline off the DT that shipped with the
> > > original product.
> > 
> > That was my understanding as well, DT overlays are a "new thing" afaik
> > and most devices (at least all Sony's that I'm working with) use an
> > appended DTB that's always in-sync with the kernel image.
> > 
> 
> I think that with the introduction of DT overlays the system becomes
> more flexible and as such more susceptible for bugs caused by unexpected
> DT versions.

Offtopic: We have some problems with this on newer Sony devices where
the BL indeed tries to overlay this DTBO on the DT, which is usually a
downstream DT not fitting on top of a mainline kernel+appended-DTB.  The
solution is to simply wipe DTBO, and afaik it should be fine to compile
the overlay bits directly inside the appended-DTB anyway.  Leads to
unsuspecting problems at times, but it is manageable.

> I think in practice the real issues comes when the DTB is delivered
> separately (i.e. not by boot.img) or inbetween two kernel releases where
> the Qualcomm tree might not be in sync with the driver tree.

Dmitry sees this as a problem for msm8974 but I'm not familiar enough
with the board.  I take it this doesn't use appended DTBs then?

> > > As such, if I pick this patch up as a fix for 5.15 you can respin the
> > > other two patches and they can land in 5.16 and I would be surprised if
> > > anyone will run into any issues with it.
> > > 
> > > I.e. I've applied this patch.
> > 
> > Sounds good, I'll leave this patch out from v2.  Should it have a Fixes:
> > tag to get backported too?
> > 
> 
> Sounds good, I added to this:
> 
> Fixes: 6969d1d9c615 ("ARM: dts: qcom-apq8064: Set 'cxo_board' as ref clock of the DSI PHY")

Did the same on the v2 respin since it seems like those patches were
incomplete without the driver change.

> > Since most review seems to be in I'll respin v2 shortly with the
> > addition of the "ref" clock to msm8974, that should probably get the
> > same treatment (added to 5.15 fixes) then we can land this patchset in
> > 5.16 (maybe without .name= fallback if Dmitry is okay with that).
> > 
> 
> Sounds good.

Sent the msm8974 patch separately and re-spun a v2.  I haven't added the
.name="xo" fallback yet while awaiting Dmitry to see if that counts as
enough time for firmware to be delivered between kernel 5.15 and 5.16.

- Marijn
