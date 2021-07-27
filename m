Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055EB3D8209
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 23:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbhG0Vql (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 17:46:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:43608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231755AbhG0Vql (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 17:46:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1C0B60238;
        Tue, 27 Jul 2021 21:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627422401;
        bh=sCNixU34kP8NRztlK0MVB8GLitrOu+6EhOaOjba7Lw8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hrWPi8MhUiLePI88IzxFVMQSE2KxlhO2q9rqt2NmM5iWRxm0TuNzqZY7gIPfBg3D8
         0AnnZEuwSC0qXH90ecEt6MxJXaK9hZI7g2yAnAhESiaEozu6ygdX19YZ01/rvR4I+e
         sNXN3eL978+lqm5PPzh5KHN/Hi+vbLA+TR83eNsP3OPiP9m58GaGpDXdeeREy7hcrj
         2JR7qgia4gW3mQ1S2jWD/KTxd4M2arrqctb8jxTIQJzcF8GIRphr91jD6DqBOAzGpE
         DzZSvB220Y2qacNTfoRQRR0LztfF+Jkn80ethjH0XXU+2DtiLyeVQFOVzL9pIeLMX5
         bpRd9BTTfadOg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210629102624.194378-4-martin.botka@somainline.org>
References: <20210629102624.194378-1-martin.botka@somainline.org> <20210629102624.194378-4-martin.botka@somainline.org>
Subject: Re: [RESEND PATCH v2 3/3] rpmcc: Add support for SM6125
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        paul.bouchara@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com
Date:   Tue, 27 Jul 2021 14:46:39 -0700
Message-ID: <162742239972.2368309.5551349117052770211@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Martin Botka (2021-06-29 03:26:23)
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rp=
m.c
> index 8200c26b968c..51458f740ba0 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -1059,6 +1059,61 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm66=
0 =3D {
>         .num_clks =3D ARRAY_SIZE(sdm660_clks),
>  };
> =20
> +/* SM6125 */
> +DEFINE_CLK_SMD_RPM_BRANCH(sm6125, bi_tcxo, bi_tcxo_ao,
> +                                       QCOM_SMD_RPM_MISC_CLK, 0, 1920000=
0);
> +DEFINE_CLK_SMD_RPM(sm6125, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1=
);
> +DEFINE_CLK_SMD_RPM(sm6125, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0=
);

Can we use msm8916_bimc_clk?

> +DEFINE_CLK_SMD_RPM(sm6125, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2=
);
> +DEFINE_CLK_SMD_RPM_BRANCH(sm6125, qdss_clk, qdss_a_clk,
> +                                       QCOM_SMD_RPM_MISC_CLK, 1, 1920000=
0);
> +DEFINE_CLK_SMD_RPM(sm6125, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);

Can we use msm8992_ce1_clk?

> +DEFINE_CLK_SMD_RPM(sm6125, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);

Can we use msm8976_ipa_clk?

> +DEFINE_CLK_SMD_RPM(sm6125, qup_clk, qup_a_clk, QCOM_SMD_RPM_QUP_CLK, 0);
> +DEFINE_CLK_SMD_RPM(sm6125, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CL=
K, 0);
> +DEFINE_CLK_SMD_RPM(sm6125, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK,=
 1);
> +DEFINE_CLK_SMD_RPM(sm6125, snoc_periph_clk, snoc_periph_a_clk,
> +                                               QCOM_SMD_RPM_BUS_CLK, 0);
> +DEFINE_CLK_SMD_RPM(sm6125, snoc_lpass_clk, snoc_lpass_a_clk,
> +                                               QCOM_SMD_RPM_BUS_CLK, 5);
> +
> +/* SMD_XO_BUFFER */
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(sm6125, ln_bb_clk1, ln_bb_clk1_a, 1);

msm8916?

> +DEFINE_CLK_SMD_RPM_XO_BUFFER(sm6125, ln_bb_clk2, ln_bb_clk2_a, 2);

msm8916?

> +DEFINE_CLK_SMD_RPM_XO_BUFFER(sm6125, ln_bb_clk3, ln_bb_clk3_a, 3);

sdm660?

> +DEFINE_CLK_SMD_RPM_XO_BUFFER(sm6125, rf_clk1, rf_clk1_a, 4);

msm8916?

> +DEFINE_CLK_SMD_RPM_XO_BUFFER(sm6125, rf_clk2, rf_clk2_a, 5);

msm8916?

> +
> +static struct clk_smd_rpm *sm6125_clks[] =3D {
> +       [RPM_SMD_XO_CLK_SRC] =3D &sm6125_bi_tcxo,
> +       [RPM_SMD_XO_A_CLK_SRC] =3D &sm6125_bi_tcxo_ao,
> +       [RPM_SMD_SNOC_CLK] =3D &sm6125_snoc_clk,
> +       [RPM_SMD_SNOC_A_CLK] =3D &sm6125_snoc_a_clk,
> +       [RPM_SMD_BIMC_CLK] =3D &sm6125_bimc_clk,
> +       [RPM_SMD_BIMC_A_CLK] =3D &sm6125_bimc_a_clk,
> +       [RPM_SMD_QDSS_CLK] =3D &sm6125_qdss_clk,
> +       [RPM_SMD_QDSS_A_CLK] =3D &sm6125_qdss_a_clk,
> +       [RPM_SMD_RF_CLK1] =3D &sm6125_rf_clk1,
> +       [RPM_SMD_RF_CLK1_A] =3D &sm6125_rf_clk1_a,
> +       [RPM_SMD_RF_CLK2] =3D &sm6125_rf_clk2,
> +       [RPM_SMD_RF_CLK2_A] =3D &sm6125_rf_clk2_a,
> +       [RPM_SMD_LN_BB_CLK1] =3D &sm6125_ln_bb_clk1,
> +       [RPM_SMD_LN_BB_CLK1_A] =3D &sm6125_ln_bb_clk1_a,
> +       [RPM_SMD_LN_BB_CLK2] =3D &sm6125_ln_bb_clk2,
> +       [RPM_SMD_LN_BB_CLK2_A] =3D &sm6125_ln_bb_clk2_a,
> +       [RPM_SMD_LN_BB_CLK3] =3D &sm6125_ln_bb_clk3,
> +       [RPM_SMD_LN_BB_CLK3_A] =3D &sm6125_ln_bb_clk3_a,
> +       [RPM_SMD_CNOC_CLK] =3D &sm6125_cnoc_clk,
> +       [RPM_SMD_CNOC_A_CLK] =3D &sm6125_cnoc_a_clk,
> +       [RPM_SMD_CE1_CLK] =3D &sm6125_ce1_clk,
> +       [RPM_SMD_CE1_A_CLK] =3D &sm6125_ce1_a_clk,
> +};
> +
> +static const struct rpm_smd_clk_desc rpm_clk_sm6125 =3D {
> +       .clks =3D sm6125_clks,
> +       .num_clks =3D ARRAY_SIZE(sm6125_clks),
> +};
> +
>  static const struct of_device_id rpm_smd_clk_match_table[] =3D {
>         { .compatible =3D "qcom,rpmcc-msm8916", .data =3D &rpm_clk_msm891=
6 },
>         { .compatible =3D "qcom,rpmcc-msm8936", .data =3D &rpm_clk_msm893=
6 },
> diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/sm=
d-rpm.h
> index f2645ec52520..b737d7e456e4 100644
> --- a/include/linux/soc/qcom/smd-rpm.h
> +++ b/include/linux/soc/qcom/smd-rpm.h
> @@ -28,6 +28,7 @@ struct qcom_smd_rpm;
>  #define QCOM_SMD_RPM_NCPA      0x6170636E
>  #define QCOM_SMD_RPM_NCPB      0x6270636E
>  #define QCOM_SMD_RPM_OCMEM_PWR 0x706d636f
> +#define QCOM_SMD_RPM_QUP_CLK   0x00707571
>  #define QCOM_SMD_RPM_QPIC_CLK  0x63697071
>  #define QCOM_SMD_RPM_SMPA      0x61706d73
>  #define QCOM_SMD_RPM_SMPB      0x62706d73

Two patches are adding this in different places.
