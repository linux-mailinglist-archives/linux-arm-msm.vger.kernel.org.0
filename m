Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0FCEF3AEB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 23:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbfKGWGZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 17:06:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:36364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfKGWGZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 17:06:25 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B6B3C20679;
        Thu,  7 Nov 2019 22:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573164383;
        bh=zZLMhikB7hoRMy0ddDiquboV9T7zKWdmy9eBzZlKbdI=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=vDydn33R6r2YyJxuK/ZXTPXZLfSKWZSKF67wl4TnPapyOQh8IT6ugwqfhxDQZBkrK
         wlBAB8X/c8hTlnShZ/aB4lSb1rayLDbhlZ+lQFtF5jzh7sVqtbd8DHdIuKJq4JvURV
         bverMnUPRudM9WGenOYLko1yBT2oa7uPbIbYk+XA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191105025032.GA7664@onstation.org>
References: <20191006010100.32053-1-masneyb@onstation.org> <20191017181329.D593C21835@mail.kernel.org> <20191105025032.GA7664@onstation.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     mturquette@baylibre.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, jonathan@marek.ca
Subject: Re: [PATCH] clk: qcom: mmcc8974: add frequency table for gfx3d
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 14:06:22 -0800
Message-Id: <20191107220623.B6B3C20679@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Brian Masney (2019-11-04 18:50:32)
> Hi Stephen,
>=20
> On Thu, Oct 17, 2019 at 11:13:29AM -0700, Stephen Boyd wrote:
> > Quoting Brian Masney (2019-10-05 18:01:00)
> > > From: Jonathan Marek <jonathan@marek.ca>
> > >=20
> > > Add frequency table for the gfx3d clock that's needed in order to
> > > support the GPU upstream on msm8974-based systems.
> > >=20
> > > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > > ---
> > >  drivers/clk/qcom/mmcc-msm8974.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >=20
> > > diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-=
msm8974.c
> > > index bcb0a397ef91..e70abfe2a792 100644
> > > --- a/drivers/clk/qcom/mmcc-msm8974.c
> > > +++ b/drivers/clk/qcom/mmcc-msm8974.c
> > > @@ -452,10 +452,17 @@ static struct clk_rcg2 mdp_clk_src =3D {
> > >         },
> > >  };
> > > =20
> > > +static struct freq_tbl ftbl_gfx3d_clk_src[] =3D {
> > > +       F(37500000, P_GPLL0, 16, 0, 0),
> > > +       F(533000000, P_MMPLL0, 1.5, 0, 0),
> > > +       { }
> > > +};
> >=20
> > On msm-3.10 kernel the gpu clk seems to be controlled by the RPM[1].
> > What is going on here? This code just looks wrong, but I think it was
> > added as an rcg so that the branch wasn't orphaned and would have some
> > sane frequency. Eventually we planned to parent it to a clk exposed in
> > the RPM clk driver. It's been a while so I'm having a hard time
> > remembering, but I think GPU clk on this device needed to be controlled
> > by RPM so that DDR self refresh wouldn't interact badly with ocmem? Or
> > maybe ocmem needed GPU to be enabled to work? Maybe there is some
> > information in the 3.10 downstream kernel.
> >=20
> > [1] https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/arch/arm=
/mach-msm/clock-rpm-8974.c?h=3Dmsm-3.10#n82
>=20
> I looked in the MSM 3.4 and 3.10 sources and I can't find that gfx3d
> clock in the mmss (the downstream name for the mmcc that's upstream). I
> even looked through the git history in the 3.10 sources to see if it was
> removed at some point.
>=20
> The gfx3d_clk_src was added to mmcc-msm8974.c upstream at the time the
> file was first introduced into the kernel:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dd8b212014e69d6b6323773ce6898f224ef4ed0d6
> I haven't been able to find anything else so far where that came from.

Yes. I did that! :) I think it was to make sure there weren't any orphan
clks in the tree, which is why I left the code in place to read the clk
frequency but not change it by omitting a frequency table.

>=20
> The GPU works using kmscube and KDE Plasma Mobile with this patch
> applied but won't work without it. As for the status of the GPU working
> upstream for MSM8974: My OCMEM and interconnect patches are now in
> linux-next and are queued for the next merge window. All that's left is
> 1) iommu support, 2) this patch (or whatever it needs to become), and
> 3) add the GPU nodes to device tree for this board.
>=20
> Would you be willing to reconsider accepting this patch since its 8974
> specific and is one of the pieces that gets the GPU working upstream?
>=20

No? I don't believe the kernel should be controlling this clk through
direct register read/writes. Instead, the GPU frequency should be
controlled through an RPM clk. See oxili_gfx3d_clk_src in the link you
mention above [1] and how it indirects to gfx3d_clk_src via
RPM_MEM_CLK_TYPE and OXILI_ID. In the end, anything that's parented to
this rcg in mmcc should probably just be parented to the RPM clk
instead.

