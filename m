Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64F40C37A2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 16:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388870AbfJAOi1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 10:38:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:50946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727143AbfJAOi1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 10:38:27 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CD3212054F;
        Tue,  1 Oct 2019 14:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569940705;
        bh=BC6OroHcKot4AxHRsLzrj3gVVxqz2wKqdFSlgTuptpw=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=BYHEm8XyvTeCxQXNCByi8u5BlrT28BYw6+dYsZfyegW+qvnaE0V30GvfVl5LKhTVR
         TbYCnlYyFno04qwhsbnta3Rc7FW7ECti0aE8lfZe5rdZapEbFkOtfAk/Vt2o9Mr7WJ
         a93ez7ZSk3JUOhccqgPm8UbUZZ39MSaylIylYKNw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <35f8b699-6ff7-9104-5e3d-ef4ee8635832@codeaurora.org>
References: <20190918095018.17979-1-tdas@codeaurora.org> <20190918095018.17979-4-tdas@codeaurora.org> <20190918213946.DC03521924@mail.kernel.org> <a3cd82c9-8bfa-f4a3-ab1f-2e397fbd9d16@codeaurora.org> <20190924231223.9012C207FD@mail.kernel.org> <347780b9-c66b-01c4-b547-b03de2cf3078@codeaurora.org> <20190925130346.42E0820640@mail.kernel.org> <35f8b699-6ff7-9104-5e3d-ef4ee8635832@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>, robh+dt@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] clk: qcom: Add Global Clock controller (GCC) driver for SC7180
User-Agent: alot/0.8.1
Date:   Tue, 01 Oct 2019 07:38:25 -0700
Message-Id: <20191001143825.CD3212054F@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-09-27 00:37:57)
> Hi Stephen,
>=20
> On 9/25/2019 6:33 PM, Stephen Boyd wrote:
> > Quoting Taniya Das (2019-09-25 04:20:07)
> >> Hi Stephen,
> >>
> >> Please find my comments.
> >>
> >> On 9/25/2019 4:42 AM, Stephen Boyd wrote:
> >>> Quoting Taniya Das (2019-09-23 01:01:11)
> >>>> Hi Stephen,
> >>>>
> >>>> Thanks for your comments.
> >>>>
> >>>> On 9/19/2019 3:09 AM, Stephen Boyd wrote:
> >>>>> Quoting Taniya Das (2019-09-18 02:50:18)
> >>>>>> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-=
sc7180.c
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..d47865d5408f
> >>>>>> --- /dev/null
> >>>>>> +++ b/drivers/clk/qcom/gcc-sc7180.c
> >>>>>> +                       .ops =3D &clk_branch2_ops,
> >>>>>> +               },
> >>>>>> +       },
> >>>>>> +};
> >>>>>> +
> >>> [...]
> >>>>>> +static struct clk_branch gcc_ufs_phy_phy_aux_clk =3D {
> >>>>>> +       .halt_reg =3D 0x77094,
> >>>>>> +       .halt_check =3D BRANCH_HALT,
> >>>>>> +       .hwcg_reg =3D 0x77094,
> >>>>>> +       .hwcg_bit =3D 1,
> >>>>>> +       .clkr =3D {
> >>>>>> +               .enable_reg =3D 0x77094,
> >>>>>> +               .enable_mask =3D BIT(0),
> >>>>>> +               .hw.init =3D &(struct clk_init_data){
> >>>>>> +                       .name =3D "gcc_ufs_phy_phy_aux_clk",
> >>>>>> +                       .parent_data =3D &(const struct clk_parent=
_data){
> >>>>>> +                               .hw =3D &gcc_ufs_phy_phy_aux_clk_s=
rc.clkr.hw,
> >>>>>> +                       },
> >>>>>> +                       .num_parents =3D 1,
> >>>>>> +                       .flags =3D CLK_SET_RATE_PARENT,
> >>>>>> +                       .ops =3D &clk_branch2_ops,
> >>>>>> +               },
> >>>>>> +       },
> >>>>>> +};
> >>>>>> +
> >>>>>> +static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk =3D {
> >>>>>> +       .halt_reg =3D 0x7701c,
> >>>>>> +       .halt_check =3D BRANCH_HALT_SKIP,
> >>>>>
> >>>>> Again, nobody has fixed the UFS driver to not need to do this halt =
skip
> >>>>> check for these clks? It's been over a year.
> >>>>>
> >>>>
> >>>> The UFS_PHY_RX/TX clocks could be left enabled due to certain HW boot
> >>>> configuration and thus during the late initcall of clk_disable there
> >>>> could be warnings of "clock stuck ON" in the dmesg. That is the reas=
on
> >>>> also to use the BRANCH_HALT_SKIP flag.
> >>>
> >>> Oh that's bad. Why do the clks stay on when we try to turn them off?
> >>>
> >>
> >> Those could be due to the configuration selected by HW and SW cannot
> >> override them, so traditionally we have never polled for CLK_OFF for
> >> these clocks.
> >=20
> > Is that the case or just a guess?
> >=20
>=20
> This is the behavior :).

Ok. It's the same as sdm845 so I guess it's OK.

>=20
> >>
> >>>>
> >>>> I would also check internally for the UFS driver fix you are referri=
ng here.
> >>>
> >>> Sure. I keep asking but nothing is done :(
> >>>
> >>>>
> >>>>>> +       .clkr =3D {
> >>>>>> +               .enable_reg =3D 0x7701c,
> >>>>>> +               .enable_mask =3D BIT(0),
> >>>>>> +               .hw.init =3D &(struct clk_init_data){
> >>>>>> +                       .name =3D "gcc_ufs_phy_rx_symbol_0_clk",
> >>>>>> +                       .ops =3D &clk_branch2_ops,
> >>>>>> +               },
> >>>>>> +       },
> >>>>>> +};
> >>>>>> +
> >>> [...]
> >>>>>> +
> >>>>>> +static struct clk_branch gcc_usb3_prim_phy_pipe_clk =3D {
> >>>>>> +       .halt_reg =3D 0xf058,
> >>>>>> +       .halt_check =3D BRANCH_HALT_SKIP,
> >>>>>
> >>>>> Why does this need halt_skip?
> >>>>
> >>>> This is required as the source is external PHY, so we want to not ch=
eck
> >>>> for HALT.
> >>>
> >>> This doesn't really answer my question. If the source is an external =
phy
> >>> then it should be listed as a clock in the DT binding and the parent
> >>> should be specified here. Unless something doesn't work because of th=
at?
> >>>
> >>
> >> The USB phy is managed by the USB driver and clock driver is not aware
> >> if USB driver models the phy as a clock. Thus we do want to keep a
> >> dependency on the parent and not poll for CLK_ENABLE.
> >=20
> > The clk driver should be aware of the USB driver modeling the phy as a
> > clk. We do that for other phys so what is the difference here?
> >=20
>=20
> Let me check with the USB team, but could we keep them for now?

Ok. It's also the same as sdm845 so I guess it's OK. Would be nice to
properly model it though so we can be certain the clk is actually
enabled.

>=20
> >>
> >>>>
> >>>>>
> >>>>>> +       .clkr =3D {
> >>>>>> +               .enable_reg =3D 0xf058,
> >>>>>> +               .enable_mask =3D BIT(0),
> >>>>>> +               .hw.init =3D &(struct clk_init_data){
> >>>>>> +                       .name =3D "gcc_usb3_prim_phy_pipe_clk",
> >>>>>> +                       .ops =3D &clk_branch2_ops,
> >>>>>> +               },
> >>>>>> +       },
> >>>>>> +};
> >>>>>> +
> >>>>>> +static struct clk_branch gcc_usb_phy_cfg_ahb2phy_clk =3D {
> >>>>>> +       .halt_reg =3D 0x6a004,
> >>>>>> +       .halt_check =3D BRANCH_HALT,
> >>>>>> +       .hwcg_reg =3D 0x6a004,
> >>>>>> +       .hwcg_bit =3D 1,
> >>>>>> +       .clkr =3D {
> >>>>>> +               .enable_reg =3D 0x6a004,
> >>>>>> +               .enable_mask =3D BIT(0),
> >>>>>> +               .hw.init =3D &(struct clk_init_data){
> >>>>>> +                       .name =3D "gcc_usb_phy_cfg_ahb2phy_clk",
> >>>>>> +                       .ops =3D &clk_branch2_ops,
> >>>>>> +               },
> >>>>>> +       },
> >>>>>> +};
> >>>>>> +
> >>>>>> +/* Leave the clock ON for parent config_noc_clk to be kept enable=
d */
> >>>>>
> >>>>> There's no parent though... So I guess this means it keeps it enabl=
ed
> >>>>> implicitly in hardware?
> >>>>>
> >>>>
> >>>> These are not left enabled, but want to leave them enabled for clien=
ts
> >>>> on config NOC.
> >>>
> >>> Sure. It just doesn't make sense to create clk structures and expose
> >>> them in the kernel when we just want to turn the bits on and leave th=
em
> >>> on forever. Why not just do some register writes in probe for this
> >>> driver? Doesn't that work just as well and use less memory?
> >>>
> >>
> >> Even if I write these registers during probe, the late init check
> >> 'clk_core_is_enabled' would return true and would be turned OFF, that =
is
> >> the reason for marking them CRITICAL.
> >>
> >=20
> > That wouldn't happen if the clks weren't registered though, no?
> >=20
>=20
> I want to keep these clock CRITICAL and registered for now, but we=20
> should be able to revisit/clean them up later.
>=20

Why do you want to keep them critical and registered? I'm suggesting
that any clk that is marked critical and doesn't have a parent should
instead become a register write in probe to turn the clk on.

