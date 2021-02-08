Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86CC0313B8F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 18:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233220AbhBHRwZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 12:52:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:43960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232955AbhBHRvG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 12:51:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7264764E84;
        Mon,  8 Feb 2021 17:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612806625;
        bh=NhejrOM6a43dC+qjIL+6h3IShBZ+5vhg83SJUixf2w4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=B2FMW+2MOdXoczhKakD1wHVxvdRj+h7stgVp9ZP+Uo45f/yvqVurJUOrLAWkFhWnB
         kGEjzROkyiEX343RtIS2TwCHKJBR0kEtRyVNbw6JdThairisxlWOrXvCCcDJF/aFoL
         M63MygR6F+NPCeZck/5L0N5Z37wbiRIO5IKDErG5kulTT9Is+gxvvg9J3lQp0QL9pU
         2zw72IDaGhA5LcTanZVbqB2a3QqgWe00Lk80O+PHgFqmcqMVd77YEUQpwuuAcUrfeS
         juf4WLz1E6lvlHehOLU2LZV++JMioz/4ZlRVcGBrILGzvymMKY0pU11UwGeNSyx3vg
         8CLXo8Sewz5/Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210118161442.104660-1-konrad.dybcio@somainline.org>
References: <20210118161442.104660-1-konrad.dybcio@somainline.org>
Subject: Re: [PATCH] clk: qcom: smd: Add missing RPM clocks for msm8992/4
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Mon, 08 Feb 2021 09:50:24 -0800
Message-ID: <161280662401.76967.11809752025480357094@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-01-18 08:14:41)
> This was omitted when first adding the clocks for these SoCs.
>=20

I believe they were omitted because the system crashed if they were
touched. Is that still the case?

> Fixes: b4297844995 ("clk: qcom: smd: Add support for MSM8992/4 rpm clocks=
")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c         | 16 ++++++++++++++++
>  include/dt-bindings/clock/qcom,rpmcc.h |  2 ++
>  include/linux/soc/qcom/smd-rpm.h       |  1 +
>  3 files changed, 19 insertions(+)
>=20
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rp=
m.c
> index 0e1dfa89489e..91d610042a5d 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -624,6 +624,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 =
=3D {
>  };
> =20
>  /* msm8992 */
> +DEFINE_CLK_SMD_RPM_BRANCH(msm8992, bi_tcxo, bi_tcxo_a, QCOM_SMD_RPM_MISC=
_CLK, 0,
> +                                                               19200000);

This rate should come from some parent clk specified in the board DTS
file as a fixed rate clock.

>  DEFINE_CLK_SMD_RPM(msm8992, pnoc_clk, pnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, =
0);
>  DEFINE_CLK_SMD_RPM(msm8992, ocmemgx_clk, ocmemgx_a_clk, QCOM_SMD_RPM_MEM=
_CLK, 2);
>  DEFINE_CLK_SMD_RPM(msm8992, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, =
0);
