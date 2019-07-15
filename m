Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD2C169F46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2019 00:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731825AbfGOW7H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jul 2019 18:59:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:36162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730960AbfGOW7G (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jul 2019 18:59:06 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5B73D20693;
        Mon, 15 Jul 2019 22:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563231545;
        bh=84hs7RNmbMqglNbeC06bSh9CNbtdAtWSAy3dE4LCVAQ=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=FfpHmeOuThZ6931JkuRrfNb8JNVuDffbZvu8MDMqZjY6lkGeeRUyP8mkCIX86l9hj
         jFlH/LA5pPFxuKCiG7gH2VF19or+qc2PEjkCc/89GjWTj52RzAEo1ov6aeWf3pKYDN
         TWGIPS6XUVCc+8Zk1RcLN47L+ZuLHms/SOcymKss=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c7440ea58b65150ed333bf6bba2d30c3@codeaurora.org>
References: <1539093467-12123-1-git-send-email-tdas@codeaurora.org> <1539093467-12123-3-git-send-email-tdas@codeaurora.org> <153911726378.119890.5522594539667887860@swboyd.mtv.corp.google.com> <3c4cccca-2c5c-927f-f471-2bbbd71b4155@codeaurora.org> <9c359e26-3708-14b6-f22a-fb529446d325@codeaurora.org> <154083859263.98144.15690571729193618604@swboyd.mtv.corp.google.com> <c7440ea58b65150ed333bf6bba2d30c3@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     chandanu@codeaurora.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v1 2/2] clk: qcom : dispcc: Add support for display port clocks
User-Agent: alot/0.8.1
Date:   Mon, 15 Jul 2019 15:59:04 -0700
Message-Id: <20190715225905.5B73D20693@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting chandanu@codeaurora.org (2019-02-01 16:05:55)
> On 2018-10-29 11:43, Stephen Boyd wrote:
> > Quoting Taniya Das (2018-10-28 03:34:55)
> >> On 2018-10-19 16:04, Taniya Das wrote:
>=20
> >> >>
> >> >>> +static struct clk_branch disp_cc_mdss_dp_link_intf_clk =3D {
> >> >>> +       .halt_reg =3D 0x2044,
> >> >>> +       .halt_check =3D BRANCH_HALT,
> >> >>> +       .clkr =3D {
> >> >>> +               .enable_reg =3D 0x2044,
> >> >>> +               .enable_mask =3D BIT(0),
> >> >>> +               .hw.init =3D &(struct clk_init_data){
> >> >>> +                       .name =3D "disp_cc_mdss_dp_link_intf_clk",
> >> >>> +                       .parent_names =3D (const char *[]){
> >> >>> +                               "disp_cc_mdss_dp_link_clk_src",
> >> >>> +                       },
> >> >>> +                       .num_parents =3D 1,
> >> >>> +                       .flags =3D CLK_GET_RATE_NOCACHE,
> >> >>
> >> >> Why?
> >> >>
> >> >
> >> > It was a requirement, but let me get back on this too.
> >> >
> >> I had a discussion with the Display Port teams and below is the=20
> >> requirement,
> >>=20
> >> This flag is required since we reset/power-down the PLL every time=20
> >> they
> >> disconnect/connect the DP cable or during suspend/resume.
> >> Only with this flag, the calls to the PLL driver properly.
> >=20
> > Ok. So that explains the get rate nocache flag. Can you please add a
> > comment that explains that these clk registers here are lost across
> > suspend/resume of the display device? It really sounds like these
> > display clks are inside of the display power domain and thus they lose
> > their state across the display power domain power down. It would be
> > better if we could properly implement suspend/restore for these clk
> > registers across suspend/resume of the display device so that we don't
> > need this nocache flag and the display code can work together with the
> > clk code here to restore the frequency to the clk.
>=20

This patch came again and it didn't have any comments to this effect in
the code around the flag.

>=20
> We already handle the suspend/restore for these clk registers
> in Dp PLL domain. Without the "NOCACHE_FLAG", and if we are requesting=20
> the same clock rate
> for any of the clocks, the set_rate call never reaches the DP PLL Ops.

So do you restore the frequency of the PLL manually? Or that is done by
calling clk_set_rate() on the leaf clk again?

>=20
> I am not clear on what you are suggesting for removing the=20
> "NOCACHE_FLAG" for
> the DisplayPort clocks. Are you suggesting design changes in DP PLL=20
> driver or in dispcc-driver?
> Can you please provide more details?
>=20

I'm suggesting that the clk framework needs to be told that the PLL has
lost the rate and thus should do a save/restore of the registers so that
the clk framework can be back in sync with the clk hardware. Maybe it's
as simple as calling clk_set_rate(&pll, XO_RATE) or clk_set_parent(&pll,
&xo_clk), so that we can recalc the rate down the tree and fix up the
child clk frequencies. Or, maybe we need to add some sort of mechanism
to the clk framework so it can be told that the frequency here has
changed. Or we need to add a hook in the power domain for the DP PLL to
tell the clk framework that the clk has changed rate and thus should
recalc down to the children. Something like this, instead of an obtuse
flag that tells us very little about what's going on.

