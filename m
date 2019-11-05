Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8831AEF3BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 03:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729717AbfKECue (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 21:50:34 -0500
Received: from onstation.org ([52.200.56.107]:45044 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727861AbfKECue (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 21:50:34 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id CD5243E88C;
        Tue,  5 Nov 2019 02:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1572922233;
        bh=mftnOysqKec/i2OHMWCPv+FVM5NmKWpJ0XHNOCDFcpY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IbyMDHnS0MTwDOlN5ByEzpbcFcs3rBBq+lwvseb3uHoTveFWgGDJwE3Rmb2VMsVw9
         jB3C/gKOlWnD/brv23Mn4WdCWwmqytswXhPm2ozkTv7JRK4opiNPA1lgsQ+m5JDRxj
         oDhcHow4yBrDJw6d2sO/2M4adG8gkjYO1kVU8Dao=
Date:   Mon, 4 Nov 2019 21:50:32 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, jonathan@marek.ca
Subject: Re: [PATCH] clk: qcom: mmcc8974: add frequency table for gfx3d
Message-ID: <20191105025032.GA7664@onstation.org>
References: <20191006010100.32053-1-masneyb@onstation.org>
 <20191017181329.D593C21835@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017181329.D593C21835@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On Thu, Oct 17, 2019 at 11:13:29AM -0700, Stephen Boyd wrote:
> Quoting Brian Masney (2019-10-05 18:01:00)
> > From: Jonathan Marek <jonathan@marek.ca>
> > 
> > Add frequency table for the gfx3d clock that's needed in order to
> > support the GPU upstream on msm8974-based systems.
> > 
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > ---
> >  drivers/clk/qcom/mmcc-msm8974.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
> > index bcb0a397ef91..e70abfe2a792 100644
> > --- a/drivers/clk/qcom/mmcc-msm8974.c
> > +++ b/drivers/clk/qcom/mmcc-msm8974.c
> > @@ -452,10 +452,17 @@ static struct clk_rcg2 mdp_clk_src = {
> >         },
> >  };
> >  
> > +static struct freq_tbl ftbl_gfx3d_clk_src[] = {
> > +       F(37500000, P_GPLL0, 16, 0, 0),
> > +       F(533000000, P_MMPLL0, 1.5, 0, 0),
> > +       { }
> > +};
> 
> On msm-3.10 kernel the gpu clk seems to be controlled by the RPM[1].
> What is going on here? This code just looks wrong, but I think it was
> added as an rcg so that the branch wasn't orphaned and would have some
> sane frequency. Eventually we planned to parent it to a clk exposed in
> the RPM clk driver. It's been a while so I'm having a hard time
> remembering, but I think GPU clk on this device needed to be controlled
> by RPM so that DDR self refresh wouldn't interact badly with ocmem? Or
> maybe ocmem needed GPU to be enabled to work? Maybe there is some
> information in the 3.10 downstream kernel.
> 
> [1] https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/arch/arm/mach-msm/clock-rpm-8974.c?h=msm-3.10#n82

I looked in the MSM 3.4 and 3.10 sources and I can't find that gfx3d
clock in the mmss (the downstream name for the mmcc that's upstream). I
even looked through the git history in the 3.10 sources to see if it was
removed at some point.

The gfx3d_clk_src was added to mmcc-msm8974.c upstream at the time the
file was first introduced into the kernel:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d8b212014e69d6b6323773ce6898f224ef4ed0d6
I haven't been able to find anything else so far where that came from.

The GPU works using kmscube and KDE Plasma Mobile with this patch
applied but won't work without it. As for the status of the GPU working
upstream for MSM8974: My OCMEM and interconnect patches are now in
linux-next and are queued for the next merge window. All that's left is
1) iommu support, 2) this patch (or whatever it needs to become), and
3) add the GPU nodes to device tree for this board.

Would you be willing to reconsider accepting this patch since its 8974
specific and is one of the pieces that gets the GPU working upstream?

Thanks,

Brian


> > +
> >  static struct clk_rcg2 gfx3d_clk_src = {
> >         .cmd_rcgr = 0x4000,
> >         .hid_width = 5,
> >         .parent_map = mmcc_xo_mmpll0_1_2_gpll0_map,
> > +       .freq_tbl = ftbl_gfx3d_clk_src,
> >         .clkr.hw.init = &(struct clk_init_data){
> >                 .name = "gfx3d_clk_src",
> >                 .parent_names = mmcc_xo_mmpll0_1_2_gpll0,
> 
