Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39EF569F08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2019 00:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731014AbfGOWiA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jul 2019 18:38:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:38354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730881AbfGOWiA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jul 2019 18:38:00 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA46D2080A;
        Mon, 15 Jul 2019 22:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563230278;
        bh=3mihQJssiBQsRi+/h49qZI0+gfJGu81pd2ZGIZk08L0=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=OnYpLDgEXNafjLpbYG4kz21Yu6kzUeU5BNyAbba6S4Yl7mmeD8+9QQ4WM7xKc6YQy
         zirMWEFldIA9yCuAGjNE1SPz5tRmh6QOX9+lNlPsvMvUb5tnEgQjV1eeVZ7Q6K6h7w
         w8jedVH501jWmfyipyMcMOOT9BS+kSnMmItCdl7s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1557894039-31835-3-git-send-email-tdas@codeaurora.org>
References: <1557894039-31835-1-git-send-email-tdas@codeaurora.org> <1557894039-31835-3-git-send-email-tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v2 2/2] clk: qcom : dispcc: Add support for display port clocks
User-Agent: alot/0.8.1
Date:   Mon, 15 Jul 2019 15:37:57 -0700
Message-Id: <20190715223758.BA46D2080A@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-05-14 21:20:39)
> @@ -128,6 +144,82 @@ enum {
>         },
>  };
>=20
> +static const struct freq_tbl ftbl_disp_cc_mdss_dp_aux_clk_src[] =3D {
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src =3D {
> +       .cmd_rcgr =3D 0x219c,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_2,
> +       .freq_tbl =3D ftbl_disp_cc_mdss_dp_aux_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_dp_aux_clk_src",
> +               .parent_names =3D disp_cc_parent_names_2,
> +               .num_parents =3D 2,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src =3D {
> +       .cmd_rcgr =3D 0x2154,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_1,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_dp_crypto_clk_src",
> +               .parent_names =3D disp_cc_parent_names_1,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_GET_RATE_NOCACHE,

Why do we need this flag on various clks here? I'd prefer this is
removed. If it can't be removed, we need to describe in a code comment
why this must be set.

If it's some sort of problem where the upstream PLL goes into bypass
across a reset, then we probably need to change the display code to
restore that rate across a reset by calling clk_set_rate() on the PLL
directly. And we might need to think about how to inform the framework
that this has happened, so that downstream clks can be notified of the
change in frequency.

