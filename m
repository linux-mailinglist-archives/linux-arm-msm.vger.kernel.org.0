Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9C5322336
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 01:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbhBWAkQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 19:40:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:32886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231472AbhBWAkP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 19:40:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6D1964E2E;
        Tue, 23 Feb 2021 00:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614040775;
        bh=RAS/zV/A8ZywrC+NvzQgFkWxsi7W1Hes6xnrlxj8880=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WzkhvZxd20wxh9Cg1oGrxYtgYgkAserBfxYxSu79UWJmZt+/ZYKYNaXdNFtBsUEWS
         686HVdx8Z1SvpqHAA52jqGQYsiOq6FW9VnjXajL8RE3XfBM8CV2UZVoEFSfcRLJBcV
         nDhOYssnIY5IPm98bIFjXPYVXOva8Ou0YTfTaxiOmdy4c7MqL6cy3Av/IP7dVBuE0o
         8eE/H3LcChBGlbg3n2WsDY1bnStr6heTCn+WrR47/+LrvxxNlWk4/XSWcVjGuk0Zz4
         hxz/VKAlIpDRxF9Uu90CgHEj0LiF0c8AEFCc3+iqBcb48T7iMxMJmM3L21tTtJdBBU
         vd2bOQHHh0DgA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210220155618.176559-5-konrad.dybcio@somainline.org>
References: <20210220155618.176559-1-konrad.dybcio@somainline.org> <20210220155618.176559-5-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 5/6] clk: qcom: gcc-sdm660: Account for needed adjustments in probe function
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Craig Tatlor <ctatlor97@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Mon, 22 Feb 2021 16:39:33 -0800
Message-ID: <161404077336.1254594.15002572465360321874@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-02-20 07:56:16)
> Downstream kernel executes a bunch of commands, such as keeping
> GPU/MMSS interface clocks alive to make sure all subsystems can
> work properly. Add these to make sure they do.
>=20
> Fixes: f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver=
 for SDM660")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  drivers/clk/qcom/gcc-sdm660.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
> index bc8dfcd6d629..db2185c88b77 100644
> --- a/drivers/clk/qcom/gcc-sdm660.c
> +++ b/drivers/clk/qcom/gcc-sdm660.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/regmap.h>
>  #include <linux/reset-controller.h>
> @@ -2622,7 +2623,27 @@ static int gcc_sdm660_probe(struct platform_device=
 *pdev)
>         if (ret)
>                 return ret;
> =20
> -       return qcom_cc_really_probe(pdev, &gcc_sdm660_desc, regmap);
> +       ret =3D qcom_cc_really_probe(pdev, &gcc_sdm660_desc, regmap);
> +       if (ret)
> +               return ret;
> +
> +       /* Disable the GPLL0 active input to MMSS and GPU via MISC regist=
ers */
> +       regmap_update_bits(regmap, 0x0902c, 0x3, 0x3);
> +       regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
> +
> +       /* This clock is used for all MMSSCC register access */
> +       clk_prepare_enable(gcc_mmss_noc_cfg_ahb_clk.clkr.hw.clk);
> +
> +       /* This clock is used for all GPUCC register access */
> +       clk_prepare_enable(gcc_gpu_cfg_ahb_clk.clkr.hw.clk);
> +
> +       /* Keep bimc gfx clock port on all the time */
> +       clk_prepare_enable(gcc_bimc_gfx_clk.clkr.hw.clk);
> +

Preferably just set these various bits with regmap_update_bits() during
probe. Also, please do it before regsitering the clks, not after.

> +       /* Set the HMSS_GPLL0_SRC for 300MHz to CPU subsystem */
> +       clk_set_rate(hmss_gpll0_clk_src.clkr.hw.clk, 300000000);

Is this not already the case?

> +
> +       return ret;
>  }
>
