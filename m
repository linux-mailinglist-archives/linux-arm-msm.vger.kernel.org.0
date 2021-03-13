Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9E633A1D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Mar 2021 00:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbhCMXAA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Mar 2021 18:00:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:57592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231756AbhCMXAA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Mar 2021 18:00:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2090064E87;
        Sat, 13 Mar 2021 23:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615676400;
        bh=JvN2gE2cwHT9RI41PHOKMwum4FYziRMG+R+kWsNa02Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=adaM4hqQBNnRAXFMA3Hm8KSklIkDvXedtL+Au187klkwYnhUZiuqCvdE1DHaAhjMx
         0vn1iOC2Jnfpd0SRTQkE+pm5uywSq4IiJIMJZ8sT6CvRANwav485wnRiUsLAomrS1n
         ooKAbs9K/MBgGcIHWtqqm4oNYubE98kcX1I06e/9J1GS+lAooGomuphgo7ze8YproS
         4eefVSwS3oUgXiTSJ8rNUcFO5XXYrvbpsvtrx8nXFhDcNMhs4tCQzu7YXCR1Yg3pdD
         bapyZVYlkGoBal16GPZww8YyitD94D764PKG37LQc6Sz2PKt+YLRTCPiuZkULNefzJ
         C6MtWf5i3GYuQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1615467092-6982-1-git-send-email-tdas@codeaurora.org>
References: <1615467092-6982-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2] clk: qcom: clk-rcg2: Add support for duty-cycle for RCG
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Sat, 13 Mar 2021 14:59:58 -0800
Message-ID: <161567639878.1478170.18101287599042992816@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-03-11 04:51:32)
> The root clock generators with MND divider has the capability to support
> change in duty-cycle by updating the 'D'. Add the clock ops which would
> check all the boundary conditions and enable setting the desired duty-cyc=
le
> as per the consumer.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/clk-rcg2.c | 42 +++++++++++++++++++++++++++++++++++++++=
+++
>  1 file changed, 42 insertions(+)
>=20
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 42f13a2..aac6893 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -357,6 +357,46 @@ static int clk_rcg2_set_floor_rate_and_parent(struct=
 clk_hw *hw,
>         return __clk_rcg2_set_rate(hw, rate, FLOOR);
>  }
>=20
> +static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *d=
uty)
> +{
> +       struct clk_rcg2 *rcg =3D to_clk_rcg2(hw);
> +       u32 notn_m_val, n_val, m_val, d_val, not2d_val, mask, duty_per;
> +       int ret;
> +
> +       if (!rcg->mnd_width)
> +               return 0;

Shouldn't we fail this call if the duty cycle can't be changed? Or have
another set of clk ops that doesn't support this clk op if the mnd=20
isn't present.

> +
> +       mask =3D BIT(rcg->mnd_width) - 1;
> +
> +       regmap_read(rcg->clkr.regmap, RCG_N_OFFSET(rcg), &notn_m_val);
> +       regmap_read(rcg->clkr.regmap, RCG_M_OFFSET(rcg), &m_val);
> +
> +       n_val =3D (~(notn_m_val) + m_val) & mask;
> +
> +       duty_per =3D (duty->num * 100) / duty->den;
> +
> +       /* Calculate 2d value */
> +       d_val =3D DIV_ROUND_CLOSEST(n_val * duty_per * 2, 100);
> +
> +        /* Check BIT WIDTHS OF 2d. If D is too big reduce Duty cycle. */

Why is BIT WIDTHS capitalized? And Duty?

> +       if (d_val > mask)
> +               d_val =3D mask;
> +
> +       if ((d_val / 2) > (n_val - m_val))
> +               d_val =3D (n_val - m_val) * 2;
> +       else if ((d_val / 2) < (m_val / 2))
> +               d_val =3D m_val;
> +
> +       not2d_val =3D ~d_val & mask;
> +
> +       ret =3D regmap_update_bits(rcg->clkr.regmap, RCG_D_OFFSET(rcg), m=
ask,
> +                                not2d_val);
> +       if (ret)
> +               return ret;
> +
> +       return update_config(rcg);
> +}
> +
>  const struct clk_ops clk_rcg2_ops =3D {
>         .is_enabled =3D clk_rcg2_is_enabled,
>         .get_parent =3D clk_rcg2_get_parent,
> @@ -365,6 +405,7 @@ const struct clk_ops clk_rcg2_ops =3D {
>         .determine_rate =3D clk_rcg2_determine_rate,
>         .set_rate =3D clk_rcg2_set_rate,
>         .set_rate_and_parent =3D clk_rcg2_set_rate_and_parent,
> +       .set_duty_cycle =3D clk_rcg2_set_duty_cycle,

Can you also implement get_duty_cycle?

>  };
>  EXPORT_SYMBOL_GPL(clk_rcg2_ops);
>
