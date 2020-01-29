Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1EB914C438
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2020 01:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgA2Avx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 19:51:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:42008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726383AbgA2Avx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 19:51:53 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A3ED205F4;
        Wed, 29 Jan 2020 00:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580259112;
        bh=j1KaIgCWyPkhoeweQVCLM1MOQ4TTXHNJJ7NyK8FDKzc=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=emMgcth/oMiYw97T/4qUT4slXu93GuyAmROoYdoS11nZuNxhoPm+FNQ/XTvljlFvj
         V4aFuB/HySQ42ffPm0be0TQLeUE01jS6CGhP7QITc/NeD/E18Hw6mkqlwE3c0UsLSg
         oXsvjSZDHNst6L9jxA0OV+DEWqIwXmD5reKhQjhM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200124144154.v2.5.If590c468722d2985cea63adf60c0d2b3098f37d9@changeid>
References: <20200124224225.22547-1-dianders@chromium.org> <20200124144154.v2.5.If590c468722d2985cea63adf60c0d2b3098f37d9@changeid>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 05/10] clk: qcom: Fix sc7180 dispcc parent data
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        mka@chromium.org, kalyan_t@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        hoegsberg@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Tue, 28 Jan 2020 16:51:51 -0800
Message-Id: <20200129005152.2A3ED205F4@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-01-24 14:42:20)
>=20
> diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-s=
c7180.c
> index 30c1e25d3edb..380eca3f847d 100644
> --- a/drivers/clk/qcom/dispcc-sc7180.c
> +++ b/drivers/clk/qcom/dispcc-sc7180.c
> @@ -76,40 +76,32 @@ static struct clk_alpha_pll_postdiv disp_cc_pll0_out_=
even =3D {
> =20
>  static const struct parent_map disp_cc_parent_map_0[] =3D {
>         { P_BI_TCXO, 0 },
> -       { P_CORE_BI_PLL_TEST_SE, 7 },
>  };
> =20
>  static const struct clk_parent_data disp_cc_parent_data_0[] =3D {
> -       { .fw_name =3D "bi_tcxo" },
> -       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +       { .fw_name =3D "xo" },

If we can make the binding match the code here and keep saying "bi_tcxo"
then that is preferred. That way we don't have to see bi_tcxo changing
and qcom folks are happy to keep the weird name. The name in the binding
is really up to the binding writer.

>  };
> =20
>  static const struct parent_map disp_cc_parent_map_1[] =3D {
>         { P_BI_TCXO, 0 },
>         { P_DP_PHY_PLL_LINK_CLK, 1 },
>         { P_DP_PHY_PLL_VCO_DIV_CLK, 2 },
> -       { P_CORE_BI_PLL_TEST_SE, 7 },
>  };
[...]
> @@ -203,7 +188,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src =
=3D {
>         .clkr.hw.init =3D &(struct clk_init_data){
>                 .name =3D "disp_cc_mdss_dp_aux_clk_src",
>                 .parent_data =3D disp_cc_parent_data_0,
> -               .num_parents =3D 2,
> +               .num_parents =3D ARRAY_SIZE(disp_cc_parent_data_0),

Can you split this ARRAY_SIZE() stuff to another patch? That will keep
focus on what's relevant here without distracting from the patch
contents. I know that parent array size is changing, but I don't want it
to be changing this line too.

>                 .ops =3D &clk_rcg2_ops,
>         },
>  };
