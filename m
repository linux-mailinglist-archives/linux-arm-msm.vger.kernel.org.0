Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D060DE698F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2019 22:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729427AbfJ0VhD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Oct 2019 17:37:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:56354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727225AbfJ0VhA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Oct 2019 17:37:00 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 23423205F4;
        Sun, 27 Oct 2019 21:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572212219;
        bh=hoHHFCmI1sTcDN1WhsE34aOMhIQogs57D2phXWIk6lg=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=vQxIgU4W7DhbFHJFd4ZCQ0tfTgbMTw7qLk2qox2eRZ7Unuv+fjtTfeqPyaGbJsjo1
         8PRIcXP7UeSOfiBGR4dB0r3Vr/l1gmwiiP6hvMGVyOw2g4ebXMvuDEAipK+QX0ReUz
         Mha3Q1F6VzFQJJjf4aA+dDUKcsoCY8omTq37Abso=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAOCk7Np_Wn9JZ8JQCiDg1w+xcTVW9fhvtCA-k5ysc2juHZuvUw@mail.gmail.com>
References: <20191002011555.36571-1-jeffrey.l.hugo@gmail.com> <20191002011640.36624-1-jeffrey.l.hugo@gmail.com> <20191017215023.2BFEC20872@mail.kernel.org> <CAOCk7NqgWkt6BwY75eGS2dbJ7GGk3DqH5NC0VLHUq4fc6WuYog@mail.gmail.com> <CAOCk7Np_Wn9JZ8JQCiDg1w+xcTVW9fhvtCA-k5ysc2juHZuvUw@mail.gmail.com>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver
User-Agent: alot/0.8.1
Date:   Sun, 27 Oct 2019 14:36:58 -0700
Message-Id: <20191027213659.23423205F4@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-10-18 14:11:09)
> On Thu, Oct 17, 2019 at 5:16 PM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> w=
rote:
> >
> > On Thu, Oct 17, 2019 at 3:50 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Jeffrey Hugo (2019-10-01 18:16:40)
> > > > +static const struct freq_tbl ftbl_gfx3d_clk_src[] =3D {
> > > > +       F(180000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > > +       F(257000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > > +       F(342000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > > +       F(414000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > > +       F(515000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > > +       F(596000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > > +       F(670000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > > +       F(710000000, P_GPUPLL0_OUT_EVEN, 2, 0, 0),
> > > > +       { }
> > >
> > > I guess this one doesn't do PLL ping pong? Instead we just reprogram =
the
> > > PLL all the time? Can we have rcg2 clk ops that set the rate on the
> > > parent to be exactly twice as much as the incoming frequency? I thoug=
ht
> > > we already had this support in the code. Indeed, it is part of
> > > _freq_tbl_determine_rate() in clk-rcg.c, but not yet implemented in t=
he
> > > same function name in clk-rcg2.c! Can you implement it? That way we
> > > don't need this long frequency table, just this weird one where it lo=
oks
> > > like:
> > >
> > >         { .src =3D P_GPUPLL0_OUT_EVEN, .pre_div =3D 3 }
> > >         { }
> > >
> > > And then some more logic in the rcg2 ops to allow this possibility fo=
r a
> > > frequency table when CLK_SET_RATE_PARENT is set.
> >
> > Does not do PLL ping pong.  I'll look at extending the rcg2 ops like
> > you describe.
>=20
> Am I missing something?  From what I can tell, what you describe is
> not implemented.
>=20
> The only in-tree example of a freq_tbl with only a src and a pre_div
> defined for rcg ops is for the tv_src clk in mmcc-msm8960 [1]
> However, that uses a variant of rcg ops, clk_rcg_bypass_ops, not clk_rcg_=
ops.
>=20
> clk_rcg_bypass_ops has its own determine_rate implementation which
> does not utilize _freq_tbl_determine_rate(), and can only do a 1:1
> input rate to output ratio (we want a 1:2).
>=20
> _freq_tbl_determine_rate() in either rcg_ops or rcg2_ops won't work,
> because they both use qcom_find_freq() which doesn't work when your
> table doesn't specify any frequencies (f->freq is 0).

Yes. You have to have some sort of frequency table to tell us what the
source and predivider to use.

> qcom_find_freq() won't iterate through the table, therefore f in
> qcom_find_freq() won't be pointing at the end of the table (the null
> entry), so when qcom_find_freq decrements f in the return, it actually
> goes off the beginning of the array in an array out of bounds
> violation.

Ouch!

>=20
> Please advise how you would like to proceed.

Please have a frequency table like

 { .src =3D SOME_PLL, .div =3D 4 }


>=20
> I can still extend rcg2_ops to do what you want, but it won't be based
> on what rcg_ops is doing.

Why isn't rcg_ops doing it? The idea is to copy whatever is happening
with this snippet in the _freq_tbl_determine_rate() in rcg.c to rcg2.c

	clk_flags =3D clk_hw_get_flags(hw);
	p =3D clk_hw_get_parent_by_index(hw, index);
	if (clk_flags & CLK_SET_RATE_PARENT) {
		rate =3D rate * f->pre_div;

We have checked for CLK_SET_RATE_PARENT from the beginning. Maybe it was
always broken! If the frequency table pointer can return us the pre div
and source then we can do math to ask the parent PLL for something.

>=20
> I can spin a rcg2_ops variant to do what you want, with a custom
> determine_rate, but it doesn't seem like I'll really be saving any
> lines of code.  Whatever I eliminate by minimizing the gfx3d
> freq_table I will surely be putting into clk-rcg2.c
>=20
> Or, I can just drop this idea and keep the freq_tbl as it is.  Seems
> like just a one off scenario.

Please make rcg2 clk ops "do the right thing" when the flag
CLK_SET_RATE_PARENT is set and the frequency table is just a
source/divider sort of thing. That way we don't have to have different
clk ops or even put anything in the frequency table besides the source
PLL we want to use and the predivider we want to configure.

