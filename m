Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB278205B7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 21:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387427AbgFWTLV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 15:11:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:47978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733248AbgFWTLV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 15:11:21 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B9280207D0;
        Tue, 23 Jun 2020 19:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592939479;
        bh=lL6Vi58BV4Hq79xacbX1vg5CvC657OXabhE4EjlEbBM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HYjCaelFMaI3bvz3sjtMpxzywJoqfAGkX/bx3T+OWPjnlRUBJgJbCUSwH/x8TmQqt
         QCDdWQe18BkDbkRYhZuYeFxKxB6nyyAJdLEtJnyZt8rpY8fEpr550EDsrmqK4ybzBD
         +WmV38dbMjQMF0bSZ3OmgzZeQ2ZzUeOrh/rGYSoM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200620144639.335093-2-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com> <20200620144639.335093-2-konradybcio@gmail.com>
Subject: Re: [PATCH 01/21] clk: qcom: smd: Add support for MSM8992/4 rpm clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konradybcio@gmail.com>, skrzynka@konradybcio.pl
Date:   Tue, 23 Jun 2020 12:11:19 -0700
Message-ID: <159293947912.62212.6644513418045609359@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2020-06-20 07:46:17)
> Add rpm smd clocks, PMIC and bus clocks which are required on MSM8992,
> MSM8994 (and APQ variants) for clients to vote on.

We really should move the bus clks to be in the interconnect framework.

>=20
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Doc=
umentation/devicetree/bindings/clock/qcom,rpmcc.txt
> index 90a1349bc713..f864ea69a590 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> @@ -17,6 +17,8 @@ Required properties :
>                         "qcom,rpmcc-msm8976", "qcom,rpmcc"
>                         "qcom,rpmcc-apq8064", "qcom,rpmcc"
>                         "qcom,rpmcc-ipq806x", "qcom,rpmcc"
> +                        "qcom,rpmcc-msm8992", "qcom,rpmcc"
> +                        "qcom,rpmcc-msm8994", "qcom,rpmcc"

Indentation is off.

>                         "qcom,rpmcc-msm8996", "qcom,rpmcc"
>                         "qcom,rpmcc-msm8998", "qcom,rpmcc"
>                         "qcom,rpmcc-qcs404", "qcom,rpmcc"
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rp=
m.c
> index 52f63ad787ba..429517340148 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -574,6 +574,176 @@ static const struct rpm_smd_clk_desc rpm_clk_msm897=
6 =3D {
>         .num_clks =3D ARRAY_SIZE(msm8976_clks),
>  };
[...]
> +       [RPM_SMD_RF_CLK1_A_PIN] =3D &msm8994_rf_clk1_a_pin,
> +       [RPM_SMD_RF_CLK2_PIN] =3D &msm8994_rf_clk2_pin,
> +       [RPM_SMD_RF_CLK2_A_PIN] =3D &msm8994_rf_clk2_a_pin,
> +       [RPM_SMD_CE1_CLK] =3D &msm8994_ce1_clk,
> +       [RPM_SMD_CE1_A_CLK] =3D &msm8994_ce1_a_clk,
> +       [RPM_SMD_CE2_CLK] =3D &msm8994_ce2_clk,
> +       [RPM_SMD_CE2_A_CLK] =3D &msm8994_ce2_a_clk,
> +       [RPM_SMD_CE3_CLK] =3D &msm8994_ce3_clk,
> +       [RPM_SMD_CE3_A_CLK] =3D &msm8994_ce3_a_clk,
> +};
> +
> +static const struct rpm_smd_clk_desc rpm_clk_msm8994 =3D {
> +       .clks =3D msm8994_clks,
> +       .num_clks =3D ARRAY_SIZE(msm8994_clks),
> +};
> +
> +

Please drop the extra newline.

>  /* msm8996 */
>  DEFINE_CLK_SMD_RPM(msm8996, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK=
, 0);
>  DEFINE_CLK_SMD_RPM(msm8996, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, =
1);
> @@ -770,6 +940,8 @@ static const struct of_device_id rpm_smd_clk_match_ta=
ble[] =3D {
>         { .compatible =3D "qcom,rpmcc-msm8916", .data =3D &rpm_clk_msm891=
6 },
>         { .compatible =3D "qcom,rpmcc-msm8974", .data =3D &rpm_clk_msm897=
4 },
>         { .compatible =3D "qcom,rpmcc-msm8976", .data =3D &rpm_clk_msm897=
6 },
> +       { .compatible =3D "qcom,rpmcc-msm8992", .data =3D &rpm_clk_msm899=
2 },
> +       { .compatible =3D "qcom,rpmcc-msm8994", .data =3D &rpm_clk_msm899=
4 },
>         { .compatible =3D "qcom,rpmcc-msm8996", .data =3D &rpm_clk_msm899=
6 },
>         { .compatible =3D "qcom,rpmcc-msm8998", .data =3D &rpm_clk_msm899=
8 },
>         { .compatible =3D "qcom,rpmcc-qcs404",  .data =3D &rpm_clk_qcs404=
  },
> diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings=
/clock/qcom,rpmcc.h
> index ae74c43c485d..9cbf17027afd 100644
> --- a/include/dt-bindings/clock/qcom,rpmcc.h
> +++ b/include/dt-bindings/clock/qcom,rpmcc.h
> @@ -133,5 +133,9 @@
>  #define RPM_SMD_RF_CLK3_A                      87
>  #define RPM_SMD_RF_CLK3_PIN                    88
>  #define RPM_SMD_RF_CLK3_A_PIN                  89
> +#define RPM_SMD_CE2_CLK             90
> +#define RPM_SMD_CE2_A_CLK               91
> +#define RPM_SMD_CE3_CLK             92
> +#define RPM_SMD_CE3_A_CLK           93
> =20

This is wrecked by other patches you've sent. Please resend just this
patch to clk maintainers with these two things fixed.
