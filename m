Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6511F48AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 23:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbgFIVPj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 17:15:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:38444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726395AbgFIVPi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 17:15:38 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B4410206D5;
        Tue,  9 Jun 2020 21:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591737337;
        bh=SxQV2Ugt3zKyDWzjvtu7SIHBUY5zdgcRwPzOteTbB8I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=zVbV7IZfMHOC5Q3MDct9SsP4YHZHXvS2i6yQS9lpdNllBBaEqi/NtLf5V83PXjy1u
         WdbGM+hQ+pwOo/U3rwCTMLbKoty3V84TugkrK9PhV3umD+TB3GkaD3S0rsoaxGhmeg
         8oPia7m7TbB1ZQCEMWObMBnIXgEBo4bAyIul2RmI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200608094714.382149-1-robert.marko@sartura.hr>
References: <20200608094714.382149-1-robert.marko@sartura.hr>
Subject: Re: [PATCH] clk: qcom: ipq4019: fix apss cpu overclocking
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Christian Lamparter <chunkeey@gmail.com>,
        John Crispin <john@phrozen.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
To:     Robert Marko <robert.marko@sartura.hr>, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com
Date:   Tue, 09 Jun 2020 14:15:36 -0700
Message-ID: <159173733699.242598.1278531930794428520@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Robert Marko (2020-06-08 02:47:15)
> From: Christian Lamparter <chunkeey@gmail.com>
>=20
> There's an interaction issue between the clk changes:"
> clk: qcom: ipq4019: Add the apss cpu pll divider clock node
> clk: qcom: ipq4019: remove fixed clocks and add pll clocks
> " and the cpufreq-dt.
>=20
> cpufreq-dt is now spamming the kernel-log with the following:
>=20
> [ 1099.190658] cpu cpu0: dev_pm_opp_set_rate: failed to find current OPP
> for freq 761142857 (-34)
>=20
> This only happens on certain devices like the Compex WPJ428
> and AVM FritzBox!4040. However, other devices like the Asus
> RT-AC58U and Meraki MR33 work just fine.
>=20
> The issue stem from the fact that all higher CPU-Clocks
> are achieved by switching the clock-parent to the P_DDRPLLAPSS
> (ddrpllapss). Which is set by Qualcomm's proprietary bootcode
> as part of the DDR calibration.
>=20
> For example, the FB4040 uses 256 MiB Nanya NT5CC128M16IP clocked
> at round 533 MHz (ddrpllsdcc =3D 190285714 Hz).
>=20
> whereas the 128 MiB Nanya NT5CC64M16GP-DI in the ASUS RT-AC58U is
> clocked at a slightly higher 537 MHz ( ddrpllsdcc =3D 192000000 Hz).
>=20
> This patch attempts to fix the issue by modifying
> clk_cpu_div_round_rate(), clk_cpu_div_set_rate(), clk_cpu_div_recalc_rate=
()
> to use a new qcom_find_freq_close() function, which returns the closest
> matching frequency, instead of the next higher. This way, the SoC in
> the FB4040 (with its max clock speed of 710.4 MHz) will no longer
> try to overclock to 761 MHz.

Why are the OPP tables not properly indicating the frequencies that
should be chosen? The rounding policy should presumably be matching the
frequency exactly vs. relying on some sort of rounding policy to fix it.

>=20
> Fixes: d83dcacea18 ("clk: qcom: ipq4019: Add the apss cpu pll divider clo=
ck node")
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> ---
> Changes from v1 to v2:

Please update subject of the patch to indicate patch version (i.e.
PATCHv2 and next time PATCHv3, not just PATCH).

> * Resolve warnings discovered by the kbot
> * Return the return of regmap_update_bits instead of not using it at all
>=20
>  drivers/clk/qcom/gcc-ipq4019.c | 36 ++++++++++++++++++++++++++++++----
>  1 file changed, 32 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq401=
9.c
> index ef5137fd50f3..62fa17a4291c 100644
> --- a/drivers/clk/qcom/gcc-ipq4019.c
> +++ b/drivers/clk/qcom/gcc-ipq4019.c
> @@ -1243,6 +1243,29 @@ static const struct clk_fepll_vco gcc_fepll_vco =
=3D {
>         .reg =3D 0x2f020,
>  };
> =20
> +
> +static const struct freq_tbl *qcom_find_freq_close(const struct freq_tbl=
 *f,

Please call it qcom_find_freq_closest() instead.

> +                                            unsigned long rate)
> +{
> +       const struct freq_tbl *last =3D NULL;
> +
> +       for ( ; f->freq; f++) {
> +               if (rate =3D=3D f->freq)
> +                       return f;
> +
> +               if (f->freq > rate) {
> +                       if (!last ||
> +                          (f->freq - rate) < (rate - last->freq))

> +                               return f;
> +                       else
> +                               return last;

	if (...)
		return ...;
	else

should be replaced with

	if (...)
		return ...;

	...

but I also wonder if it would be clearer with some sort of 'break' and
then 'return f' type of logic.

> +               }
> +               last =3D f;
> +       }
> +
> +       return last;
> +}

Please relocate this to common.c in the qcom directory.

> +
>  /*
>   * Round rate function for APSS CPU PLL Clock divider.
>   * It looks up the frequency table and returns the next higher frequency
