Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1ED2B16C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 08:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgKMH6V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 02:58:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:49996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgKMH6U (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 02:58:20 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAA46217A0;
        Fri, 13 Nov 2020 07:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605254299;
        bh=10l0sk2jrGzHB1tIxTLrFahRzHJbVxhjaHaFD3DdNK4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZCKHUwXZ9GgFME/9s7A0jXfI82DQxMiKSyvJv4cPCetpP4S71sw3Gj7a/D/nSDcKA
         ObSuBYb7tix5kLaH1ty/B5vf/PC0xhc4MIH+PePur5qvXQetqPaDlmbUAIbGEOODrO
         AvCzEALf4OeUqkJ2ntYtme1SbHCyDvHEDBcUP02o=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201105085148.GA7308@work>
References: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org> <20201028074232.22922-3-manivannan.sadhasivam@linaro.org> <160454301723.3965362.9504622582275389041@swboyd.mtv.corp.google.com> <20201105085148.GA7308@work>
Subject: Re: [PATCH 2/4] clk: qcom: Add SDX55 GCC support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naveen Yadav <naveenky@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date:   Thu, 12 Nov 2020 23:58:18 -0800
Message-ID: <160525429844.60232.2716300766254728207@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manivannan Sadhasivam (2020-11-05 00:51:48)
> On Wed, Nov 04, 2020 at 06:23:37PM -0800, Stephen Boyd wrote:
> > > diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx5=
5.c
> > > new file mode 100644
> > > index 000000000000..75831c829202
> > > --- /dev/null
> > > +++ b/drivers/clk/qcom/gcc-sdx55.c
> > > @@ -0,0 +1,1667 @@
> > > +
>=20
> [...]
>=20
> > > +static const struct clk_div_table post_div_table_lucid_even[] =3D {
> > > +       { 0x0, 1 },
> > > +       { 0x1, 2 },
> > > +       { 0x3, 4 },
> > > +       { 0x7, 8 },
> > > +       { }
> > > +};
> >=20
> > I think this table is common to all lucid plls? Maybe we can push it
> > into the clk_ops somehow and stop duplicating it here?
> >=20
>=20
> Are you referring to lucid plls in this driver? Because, this table is
> not common for other SoCs. And I don't think having this way introduces
> any overhead, so I'd prefer keeping it as it is.
>=20

Yes all lucid type PLLs probably have the same divider table.

>=20
> > > +/* For CPUSS functionality the SYS NOC clock needs to be left enable=
d */
> > > +static struct clk_branch gcc_sys_noc_cpuss_ahb_clk =3D {
> > > +       .halt_reg =3D 0x4010,
> > > +       .halt_check =3D BRANCH_HALT_VOTED,
> > > +       .clkr =3D {
> > > +               .enable_reg =3D 0x6d008,
> > > +               .enable_mask =3D BIT(0),
> > > +               .hw.init =3D &(struct clk_init_data){
> > > +                       .name =3D "gcc_sys_noc_cpuss_ahb_clk",
> > > +                       .parent_hws =3D (const struct clk_hw *[]){
> > > +                               &gcc_cpuss_ahb_clk_src.clkr.hw },
> > > +                       .num_parents =3D 1,
> > > +                       .flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PAR=
ENT,
> >=20
> > These CLK_IS_CRITICAL clks can't be set once at driver probe time and
> > forgotten about? It would be nice to not allocate memory for things that
> > never matter.
> >=20
>=20
> Makes sense! But are we moving into the direction of deprecating the use
> of CLK_IS_CRITICAL?

No? Just judiciously using it.
