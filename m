Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A701D3F19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 22:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgENUkl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 16:40:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:34512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726241AbgENUkk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 16:40:40 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CAA7F20722;
        Thu, 14 May 2020 20:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589488839;
        bh=jPPQZ0RhlAk4LlkzHIvg67OHCVaezZjs7+20BukTROQ=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=joDZfSD1q1oIDk3PNxUr+a2VvPslTZZMCegoK9C9/oTR67Iw3JCa7RpvoCA4QmMQK
         tnkuoSlPIejfXkKXsX1XD98DCvSybqleOCzrYZab9oiEDg+1wo9kVheVHLXPI32TbD
         l/EGa666ytUz6d7KTKfEM1wn5jl7bRTngumQQxL4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4025e5c3-b532-d235-f73b-2b86055bdde2@codeaurora.org>
References: <1586832922-29191-1-git-send-email-sivaprak@codeaurora.org> <1586832922-29191-4-git-send-email-sivaprak@codeaurora.org> <158754602745.132238.14379194464345140559@swboyd.mtv.corp.google.com> <4025e5c3-b532-d235-f73b-2b86055bdde2@codeaurora.org>
Subject: Re: [PATCH V3 3/8] clk: qcom: Add A53 PLL support for ipq6018 devices
From:   Stephen Boyd <sboyd@kernel.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Thu, 14 May 2020 13:40:39 -0700
Message-ID: <158948883904.215346.15910533287389644445@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-04-22 03:44:33)
> On 4/22/2020 2:30 PM, Stephen Boyd wrote:
> > Quoting Sivaprakash Murugesan (2020-04-13 19:55:17)
> >> diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
> >> index 45cfc57..a95351c 100644
> >> --- a/drivers/clk/qcom/a53-pll.c
> >> +++ b/drivers/clk/qcom/a53-pll.c
> >> @@ -57,30 +146,26 @@ static int qcom_a53pll_probe(struct platform_devi=
ce *pdev)
> >>          if (IS_ERR(regmap))
> >>                  return PTR_ERR(regmap);
> >>  =20
> >> -       pll->l_reg =3D 0x04;
> >> -       pll->m_reg =3D 0x08;
> >> -       pll->n_reg =3D 0x0c;
> >> -       pll->config_reg =3D 0x14;
> >> -       pll->mode_reg =3D 0x00;
> >> -       pll->status_reg =3D 0x1c;
> >> -       pll->status_bit =3D 16;
> >> -       pll->freq_tbl =3D a53pll_freq;
> >> -
> >> -       init.name =3D "a53pll";
> >> -       init.parent_names =3D (const char *[]){ "xo" };
> >> -       init.num_parents =3D 1;
> >> -       init.ops =3D &clk_pll_sr2_ops;
> >> -       init.flags =3D CLK_IS_CRITICAL;
> > Please document why a clk is critical.
> ok
> >
> >> -       pll->clkr.hw.init =3D &init;
> >> -
> >> -       ret =3D devm_clk_register_regmap(dev, &pll->clkr);
> >> +       if (pll_data->flags & PLL_IS_ALPHA) {
> >> +               struct clk_alpha_pll *alpha_pll =3D
> >> +                       pll_data->a53pll.alpha_pll.pll;
> >> +               struct alpha_pll_config *alpha_pll_config =3D
> >> +                       pll_data->a53pll.alpha_pll.pll_config;
> >> +
> >> +               clk_alpha_pll_configure(alpha_pll, regmap, alpha_pll_c=
onfig);
> >> +               clkr =3D &pll_data->a53pll.alpha_pll.pll->clkr;
> >> +       } else {
> >> +               clkr =3D &pll_data->a53pll.pll->clkr;
> >> +       }
> > Sorry, the design is confusing.
>=20
> The basic idea is to add support for various PLLs available to clock the =

> A53 core.
>=20
> if this messing up the code, can the alpha pll support be moved to a=20
> separate file?
>=20
> It would be very helpful if you provide your input on this.

Isn't the alpha PLL support already in a different file? Is it sometimes
an alpha pll and other times it is something else?
