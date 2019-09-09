Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E653AAD648
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2019 12:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728995AbfIIKFy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Sep 2019 06:05:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:42850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728824AbfIIKFy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Sep 2019 06:05:54 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3BD9A2054F;
        Mon,  9 Sep 2019 10:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568023553;
        bh=m7XiTRb1WFEjVvNR8wQbSxOgTr57nqldAWpKZ9nsNLE=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=kirLzG60VSEz/rP8x5AeuB78hMdHGMbNe+f3G/+dRoUdTbBW3vjN204D7cf8LdULR
         sHJKJcZ/FvKFCqgCI6jqSjaDfzwO98wY81gbWpVOn874LqCFgdEpNArgg5F4GQbRFX
         SvSHAvPuwZGNnYrzLIofzcqeXN/G1PdqXeC4eoW0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f2e43da9-2d31-e8d5-83d2-77020e85e2a7@linaro.org>
References: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org> <f2e43da9-2d31-e8d5-83d2-77020e85e2a7@linaro.org>
Cc:     bjorn.andersson@linaro.org, niklas.cassel@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>, agross@kernel.org,
        mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/5] clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
User-Agent: alot/0.8.1
Date:   Mon, 09 Sep 2019 03:05:52 -0700
Message-Id: <20190909100553.3BD9A2054F@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jorge Ramirez (2019-09-05 00:30:42)
> On 8/26/19 18:45, Jorge Ramirez-Ortiz wrote:
> > Limit the GPLL0_AO_OUT_MAIN operating frequency as per its hardware
> > specifications.
> >=20
> > Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> > Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > ---
> >  drivers/clk/qcom/clk-alpha-pll.c | 8 ++++++++
> >  drivers/clk/qcom/clk-alpha-pll.h | 1 +
> >  drivers/clk/qcom/gcc-qcs404.c    | 2 +-
> >  3 files changed, 10 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-al=
pha-pll.c
> > index 055318f97991..9228b7b1f56e 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.c
> > +++ b/drivers/clk/qcom/clk-alpha-pll.c
> > @@ -878,6 +878,14 @@ static long clk_trion_pll_round_rate(struct clk_hw=
 *hw, unsigned long rate,
> >       return clamp(rate, min_freq, max_freq);
> >  }
> > =20
> > +const struct clk_ops clk_alpha_pll_fixed_ops =3D {
> > +     .enable =3D clk_alpha_pll_enable,
> > +     .disable =3D clk_alpha_pll_disable,
> > +     .is_enabled =3D clk_alpha_pll_is_enabled,
> > +     .recalc_rate =3D clk_alpha_pll_recalc_rate,
> > +};
> > +EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_ops);
> > +
> >  const struct clk_ops clk_alpha_pll_ops =3D {
> >       .enable =3D clk_alpha_pll_enable,
> >       .disable =3D clk_alpha_pll_disable,
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-al=
pha-pll.h
> > index 15f27f4b06df..c28eb1a08c0c 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.h
> > +++ b/drivers/clk/qcom/clk-alpha-pll.h
> > @@ -109,6 +109,7 @@ struct alpha_pll_config {
> >  };
> > =20
> >  extern const struct clk_ops clk_alpha_pll_ops;
> > +extern const struct clk_ops clk_alpha_pll_fixed_ops;
> >  extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
> >  extern const struct clk_ops clk_alpha_pll_postdiv_ops;
> >  extern const struct clk_ops clk_alpha_pll_huayra_ops;
> > diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs40=
4.c
> > index e12c04c09a6a..567140709c7d 100644
> > --- a/drivers/clk/qcom/gcc-qcs404.c
> > +++ b/drivers/clk/qcom/gcc-qcs404.c
> > @@ -330,7 +330,7 @@ static struct clk_alpha_pll gpll0_ao_out_main =3D {
> >                       .parent_names =3D (const char *[]){ "cxo" },
> >                       .num_parents =3D 1,
> >                       .flags =3D CLK_IS_CRITICAL,
> > -                     .ops =3D &clk_alpha_pll_ops,
> > +                     .ops =3D &clk_alpha_pll_fixed_ops,
> >               },
> >       },
> >  };
> >=20
>=20
> just a quick follow up, is this series being picked-up?

No cover letter! ;P

Anyway, I'll pick it up.

