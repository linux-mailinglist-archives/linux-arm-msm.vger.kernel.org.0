Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 618EAF3A3D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 22:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfKGVNy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 16:13:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:47028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfKGVNy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 16:13:54 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C15F62077C;
        Thu,  7 Nov 2019 21:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573161233;
        bh=IdWF991UEdSGL4LBEIj6ry547FfieomjyaLj+M/eKx8=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=cp22OJTfDtOBrD/ep2jXPGD0RdytM46wTNahykngHb/V9ieXiP0kn8BDRvOamAMrF
         a33cxnbOcChXdrOGc1yskmVi/uYTmzZxthMzayD/tTG71XBA+9zmwOxA3ru7wSExF4
         knn3BRB0UgHpBGKNvH6N+ElHHxFCNjYEn3yp+tBo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572371299-16774-4-git-send-email-tdas@codeaurora.org>
References: <1572371299-16774-1-git-send-email-tdas@codeaurora.org> <1572371299-16774-4-git-send-email-tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v2 3/3] clk: qcom: clk-rpmh: Add support for RPMHCC for SC7180
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 13:13:53 -0800
Message-Id: <20191107211353.C15F62077C@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-10-29 10:48:19)
> Add support for clock RPMh driver to vote for ARC and VRM managed
> clock resources.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 20d4258..3f3e08b 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -391,6 +391,24 @@ static const struct clk_rpmh_desc clk_rpmh_sm8150 =
=3D {
>         .num_clks =3D ARRAY_SIZE(sm8150_rpmh_clocks),
>  };
>=20
> +static struct clk_hw *sc7180_rpmh_clocks[] =3D {

I don't think we need to duplicate this array either, unless somehow
this driver is running on two different SoCs which seems highly
unlikely.

> +       [RPMH_CXO_CLK]          =3D &sdm845_bi_tcxo.hw,
> +       [RPMH_CXO_CLK_A]        =3D &sdm845_bi_tcxo_ao.hw,
> +       [RPMH_LN_BB_CLK2]       =3D &sdm845_ln_bb_clk2.hw,
> +       [RPMH_LN_BB_CLK2_A]     =3D &sdm845_ln_bb_clk2_ao.hw,
> +       [RPMH_LN_BB_CLK3]       =3D &sdm845_ln_bb_clk3.hw,
> +       [RPMH_LN_BB_CLK3_A]     =3D &sdm845_ln_bb_clk3_ao.hw,
> +       [RPMH_RF_CLK1]          =3D &sdm845_rf_clk1.hw,
> +       [RPMH_RF_CLK1_A]        =3D &sdm845_rf_clk1_ao.hw,
> +       [RPMH_RF_CLK2]          =3D &sdm845_rf_clk2.hw,
> +       [RPMH_RF_CLK2_A]        =3D &sdm845_rf_clk2_ao.hw,
> +};
> +
> +static const struct clk_rpmh_desc clk_rpmh_sc7180 =3D {
> +       .clks =3D sc7180_rpmh_clocks,
> +       .num_clks =3D ARRAY_SIZE(sc7180_rpmh_clocks),
> +};
> +
>  static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
>                                          void *data)
>  {
> @@ -471,6 +489,7 @@ static int clk_rpmh_probe(struct platform_device *pde=
v)
>  static const struct of_device_id clk_rpmh_match_table[] =3D {
>         { .compatible =3D "qcom,sdm845-rpmh-clk", .data =3D &clk_rpmh_sdm=
845},
>         { .compatible =3D "qcom,sm8150-rpmh-clk", .data =3D &clk_rpmh_sm8=
150},
> +       { .compatible =3D "qcom,sc7180-rpmh-clk", .data =3D &clk_rpmh_sc7=
180},
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, clk_rpmh_match_table);
