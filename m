Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6C2F38177
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 01:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfFFXAv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 19:00:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:45944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726352AbfFFXAv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 19:00:51 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F33720645;
        Thu,  6 Jun 2019 23:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559862050;
        bh=A2CuOolZBDK0Z3relfnI07Z/gnbTneghKbkRvdlGm3k=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=YPTYWA7Vd0sPaZNRyWtc/92OXwKwg9OT3pB847NFm0o9iDF9nfdg8fVMgvED/Pkfk
         1VL7Wmd8s+t4afWGIqrccCUMimewhaJMvcNqlJ3bsxi5tV3BvSvvHUYQy+c8t7meV6
         Mblbc7xMXzts2DiX4kqPkf4nphq4ynOe4XTgZavA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190528164803.38642-1-jeffrey.l.hugo@gmail.com>
References: <20190528164616.38517-1-jeffrey.l.hugo@gmail.com> <20190528164803.38642-1-jeffrey.l.hugo@gmail.com>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/3] clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver
Cc:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, marc.w.gonzalez@free.fr,
        jcrouse@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
User-Agent: alot/0.8.1
Date:   Thu, 06 Jun 2019 16:00:49 -0700
Message-Id: <20190606230050.2F33720645@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-05-28 09:48:03)
> diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-ms=
m8998.c
> new file mode 100644
> index 000000000000..e45062e40718
> --- /dev/null
> +++ b/drivers/clk/qcom/gpucc-msm8998.c
> +
> +static int gpucc_msm8998_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;
> +       struct clk *xo;
> +
> +       /*
> +        * We must have a valid XO to continue until orphan probe defer is
> +        * implemented.
> +        */
> +       xo =3D clk_get(&pdev->dev, "xo");

Why is this necessary?

> +       if (IS_ERR(xo))
> +               return PTR_ERR(xo);
> +       clk_put(xo);
> +
> +       regmap =3D qcom_cc_map(pdev, &gpucc_msm8998_desc);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       /* force periph logic on to acoid perf counter corruption */

avoid?

> +       regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(13), BIT=
(13));
> +       /* tweak droop detector (GPUCC_GPU_DD_WRAP_CTRL) to reduce leakag=
e */
> +       regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(0), BIT(=
0));
> +
> +       return qcom_cc_really_probe(pdev, &gpucc_msm8998_desc, regmap);
> +}
> +
