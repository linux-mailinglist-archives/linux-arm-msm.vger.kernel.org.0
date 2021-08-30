Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 843B93FB7A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 16:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237067AbhH3OO5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 10:14:57 -0400
Received: from m-r1.th.seeweb.it ([5.144.164.170]:58321 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237037AbhH3OO5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 10:14:57 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 2A39B1F4FC;
        Mon, 30 Aug 2021 16:14:01 +0200 (CEST)
Date:   Mon, 30 Aug 2021 16:13:54 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm: dts: qcom: apq8064: Use 27MHz PXO clock as DSI
 PLL reference
Message-ID: <YSznouVZ93sUd6xa@Marijn-Arch-PC.localdomain>
References: <20210829203027.276143-1-marijn.suijten@somainline.org>
 <20210829203027.276143-2-marijn.suijten@somainline.org>
 <CAA8EJprQ03ipZzO+1vgt9W7jFbLXgsYR0n-oJxVB-142x8dgRA@mail.gmail.com>
 <17d19b93-dbe5-cc85-f302-b52cd8eeed56@somainline.org>
 <CAA8EJpqd7_5510TodALnX13Wo0MufYm2G=r6vw9sy=VURrewyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqd7_5510TodALnX13Wo0MufYm2G=r6vw9sy=VURrewyw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 30, 2021 at 04:24:58PM +0300, Dmitry Baryshkov wrote:
> On Mon, 30 Aug 2021 at 11:28, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > Hi Dmitry,
> >
> > On 8/30/21 3:18 AM, Dmitry Baryshkov wrote:
> > > On Sun, 29 Aug 2021 at 23:30, Marijn Suijten
> > > <marijn.suijten@somainline.org> wrote:
> > >>
> > >> The 28NM DSI PLL driver for msm8960 calculates with a 27MHz reference
> > >> clock and should hence use PXO, not CXO which runs at 19.2MHz.
> > >>
> > >> Note that none of the DSI PHY/PLL drivers currently use this "ref"
> > >> clock; they all rely on (sometimes inexistant) global clock names and
> > >> usually function normally without a parent clock.  This discrepancy will
> > >> be corrected in a future patch, for which this change needs to be in
> > >> place first.
> > >>
> > >> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > Checked the downstream driver, it always uses 27 MHz clock in calculations.
> >
> >
> > Given our concerns for msm8974 not updating DT in parallel with the
> > kernel (hence the need for a global-name fallback because "ref" is
> > missing from the DT), should we worry about the same for apq8064?  That
> > is, is there a chance that the kernel but not the firmware is upgraded
> > leading to the wrong parent clock being used?  The msm8960 variant of
> > the 28nm PLL driver uses parent_rate in a few places and might read
> > cxo's 19.2MHz erroneously instead of using pxo's 27MHz.
> 
> Checked the code. It uses .parent_names =  "pxo", so changing ref
> clock should not matter. We'd need to fix ref clocks and after that we
> can switch parent names to fw_name.

Correct, hence why this patch is ordered before the switch to .fw_name.
These patches can't go in the same series if apq8064 doesn't update its
firmware in parallel with the kernel just like msm8974.  Do you know if
this is the case?  If so, how much time do you think should be between
the DT fix (this patch) and migrating the drivers?

- Marijn
