Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 790AC313D6F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235494AbhBHS0g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:26:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:54766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235498AbhBHSYz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:24:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2F7664E37;
        Mon,  8 Feb 2021 18:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808653;
        bh=vS0fzGJmDb6WmV2rw3MiBTn3cohiaMqNhjQhgUgCtU0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=P+DFoUvhwIbIqCm/HmDfuLMgfotPv6DmgBfMpQM0K1IzbcI5mAE6ZWNpnY6NC7+D/
         rD/EjyVx7TI8RjMQw5YPQtJN27E5ROKD+NPwJAx+fhv8RemRCF17Jv3j2NsZxNokfl
         hZ+8ROjQcX07i6QO28aLRLcSBBA3g0Gx++cwjsogcXdjcxNpja0vb3QT8Sw9M0vSjR
         ANbqB9MMp85xFPnJTTZKTovNKmM+s8NBEv9oaKFblHS3Y9lo4bE4sa8n6+NYoQWQMm
         WvkwbYFADb1c1ClwLDwJwjrD3ZcqL6TuFuCRFBcoOx9Dj0OV3Uq02CY4Ny9//K8pXZ
         v4pWyix97d5uA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114221059.483390-12-angelogioacchino.delregno@somainline.org>
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org> <20210114221059.483390-12-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 11/11] clk: qcom: gpucc-msm8998: Allow fabia gpupll0 rate setting
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org
Date:   Mon, 08 Feb 2021 10:24:12 -0800
Message-ID: <161280865244.76967.4923517866545833837@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-14 14:10:59)
> The GPU PLL0 is not a fixed PLL and the rate can be set on it:
> this is necessary especially on boards which bootloader is setting
> a very low rate on this PLL before booting Linux, which would be
> unsuitable for postdividing to reach the maximum allowed Adreno GPU
> frequency of 710MHz (or, actually, even 670MHz..) on this SoC.
>=20
> To allow setting rates on the GPU PLL0, also define VCO boundaries
> and set the CLK_SET_RATE_PARENT flag to the GPU PLL0 postdivider.
>=20
> With this change, the Adreno GPU is now able to scale through all
> the available frequencies.

BTW, you're probably undervolting your GPU and clocking it higher
than it should be at the voltage from boot.

>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---
>  drivers/clk/qcom/gpucc-msm8998.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-ms=
m8998.c
> index 1a518c4915b4..fedfffaf0a8d 100644
> --- a/drivers/clk/qcom/gpucc-msm8998.c
> +++ b/drivers/clk/qcom/gpucc-msm8998.c
> @@ -50,6 +50,11 @@ static struct clk_branch gpucc_cxo_clk =3D {
>         },
>  };
> =20
> +static struct pll_vco fabia_vco[] =3D {

Should be const.

> +       { 249600000, 2000000000, 0 },
> +       { 125000000, 1000000000, 1 },
> +};
> +
>  static const struct clk_div_table post_div_table_fabia_even[] =3D {
>         { 0x0, 1 },
>         { 0x1, 2 },
