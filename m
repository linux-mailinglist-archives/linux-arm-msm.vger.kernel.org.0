Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE2A3B564D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 02:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbhF1AaH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 20:30:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:53412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231689AbhF1AaH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 20:30:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C2B961C35;
        Mon, 28 Jun 2021 00:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624840062;
        bh=8Oa0lAWF6FMit1YLA+2jkTaLCWVABVWcVj9AZnZfErg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HxXACPb1dvtRMth7K5e8pVC6O+X9h3s7oayCBEEmj8VdedGtghXtkbHLuvwAO2Qu/
         /7F4OImKSquj7YCGAazGVbYIomgeT7XCtBoChaLZ4c8exPoQNT6EkZ3uvng3CADO3Z
         sxB3bdNIa0uHhnHoADnn4RDVIR3W+Tj40J+RujEKyZkT2zwi/74ha1ekNB3A8pLXAo
         fmvqlQ7aQYR26v/u8iGs1fC3tfwcNvAu/pXNAMgfVVfk0ob/FKX5dzmNWenbiq8Que
         vJryYLPq1LbWqa2/AK4uI/OUCSrzlqubbTt06bJPA31/8lIZiTgI8uyxyoM9awKIEI
         8fnuHJWJQFMYQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210504052844.21096-2-shawn.guo@linaro.org>
References: <20210504052844.21096-1-shawn.guo@linaro.org> <20210504052844.21096-2-shawn.guo@linaro.org>
Subject: Re: [PATCH 1/5] clk: qcom: apcs-msm8916: Flag a53mux instead of a53pll as critical
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Date:   Sun, 27 Jun 2021 17:27:41 -0700
Message-ID: <162484006132.3259633.9518693749627795895@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Shawn Guo (2021-05-03 22:28:40)
> The clock source for MSM8916 cpu cores is like below.
>=20
>                         |\
>          a53pll --------| \ a53mux     +------+
>                         | |------------| cpus |
>      gpll0_vote --------| /            +------+
>                         |/
>=20
> So clock a53mux rather than a53pll is actually the clock source of cpu
> cores.  It makes more sense to flag a53mux rather than a53pll as
> critical, since a53pll could be irrelevant if a53mux switches its parent
> clock to be gpll0_vote.

Can you add some more detail here? I think the idea is to mark the mux
as critical so that either a53pll or gpll0_vote is kept enabled, but
only if they're used by the CPU. That isn't very clear from the commit
text. Otherwise it seems OK.

>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/clk/qcom/a53-pll.c      | 1 -
>  drivers/clk/qcom/apcs-msm8916.c | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
> index 45cfc57bff92..8614b0b0e82c 100644
> --- a/drivers/clk/qcom/a53-pll.c
> +++ b/drivers/clk/qcom/a53-pll.c
> @@ -70,7 +70,6 @@ static int qcom_a53pll_probe(struct platform_device *pd=
ev)
>         init.parent_names =3D (const char *[]){ "xo" };
>         init.num_parents =3D 1;
>         init.ops =3D &clk_pll_sr2_ops;
> -       init.flags =3D CLK_IS_CRITICAL;
>         pll->clkr.hw.init =3D &init;
> =20
>         ret =3D devm_clk_register_regmap(dev, &pll->clkr);
> diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8=
916.c
> index cf69a97d0439..d7ac6d6b15b6 100644
> --- a/drivers/clk/qcom/apcs-msm8916.c
> +++ b/drivers/clk/qcom/apcs-msm8916.c
> @@ -65,7 +65,7 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_=
device *pdev)
>         init.parent_data =3D pdata;
>         init.num_parents =3D ARRAY_SIZE(pdata);
>         init.ops =3D &clk_regmap_mux_div_ops;
> -       init.flags =3D CLK_SET_RATE_PARENT;
> +       init.flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT;
> =20
>         a53cc->clkr.hw.init =3D &init;
>         a53cc->clkr.regmap =3D regmap;
> --=20
> 2.17.1
>
