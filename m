Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 454D43DE236
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 00:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbhHBWLy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 18:11:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:58852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231126AbhHBWLw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 18:11:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36C596018A;
        Mon,  2 Aug 2021 22:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627942302;
        bh=uQ4300Zg9wVJ91sSCEg7PTrzjVOlNO5W7l7vf1E5uW0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IjqxaSj158DoF4zTsoOShFdE/HONMyDFi7XOx6Dsg8O5mlTDm4NjJTTlIDj8AKVFT
         ng2kySx6BqGjrMu1A7YFt15PoipW4tgwvrkvxrxVXVdLIZIXCXoV6EkfNDRKhvcMhi
         NLg8v5chatn22gzaOyamO1zs5i8GTwRTxT+hQ/YBl7w5X/qWNBNXOYyKF5/w4f5FCG
         qGFB26dRykdNrjRH/XOlS3gP/JEcvov4Bck6Iwc5vtbdPAMuS8WbeXO8x9eCK+FRCS
         t+0neKba/ea6jDt+b7csqDC8O3f2BtWU7EkiuOUau9mzWsa4e9ErUhhOoMgMo12lwf
         Foeqm4dEyvA2g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210802153657.879499-1-bryan.odonoghue@linaro.org>
References: <20210802153657.879499-1-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH] clk: qcom: clk-smd-rpm: Fix invalid RPM_SMD_PCNOC_A_CLK entry
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Mon, 02 Aug 2021 15:11:40 -0700
Message-ID: <162794230095.714452.9666166450349622061@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bryan O'Donoghue (2021-08-02 08:36:57)
> MSM8936 and MSM8939 both share the same RPMCC clock tree, I've been testi=
ng
> on MSM8939 and I've found that RPM_SMD_PCNOC_A_CLK is currently invalid.
>=20
> RPM_SMD_PCNOC_A_CLK should point to msm8916_pcnoc_a_clk not to
> msm8916_pcnoc_clk.
>=20
> Fixes: a0384ecfe2aa8 ("clk: qcom: smd-rpm: De-duplicate identical entries=
")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

This is superseded by
https://lore.kernel.org/r/20210727092613.23056-1-shawn.guo@linaro.org

>  drivers/clk/qcom/clk-smd-rpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rp=
m.c
> index 800b2fef1887f..b2c142f3a649e 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -467,7 +467,7 @@ DEFINE_CLK_SMD_RPM(msm8936, sysmmnoc_clk, sysmmnoc_a_=
clk, QCOM_SMD_RPM_BUS_CLK,
> =20
>  static struct clk_smd_rpm *msm8936_clks[] =3D {
>         [RPM_SMD_PCNOC_CLK]             =3D &msm8916_pcnoc_clk,
> -       [RPM_SMD_PCNOC_A_CLK]           =3D &msm8916_pcnoc_clk,
> +       [RPM_SMD_PCNOC_A_CLK]           =3D &msm8916_pcnoc_a_clk,
>         [RPM_SMD_SNOC_CLK]              =3D &msm8916_snoc_clk,
>         [RPM_SMD_SNOC_A_CLK]            =3D &msm8916_snoc_a_clk,
>         [RPM_SMD_BIMC_CLK]              =3D &msm8916_bimc_clk,
> --=20
> 2.30.1
>
