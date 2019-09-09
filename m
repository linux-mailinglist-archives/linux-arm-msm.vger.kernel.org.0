Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACE10AD6A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2019 12:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730256AbfIIKWP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Sep 2019 06:22:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:35224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729660AbfIIKWP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Sep 2019 06:22:15 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E0C302089F;
        Mon,  9 Sep 2019 10:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568024535;
        bh=Yk7S6QNE+0Vrk3XPrz/DAzAJIhloqdm30vmB81tUVmc=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=xeWuxUI0x22r5b6XuuqnFDHzLRt+ecSXo3CbmirAKjpDEispNoHfZjtxNPYLzxyCF
         UnLOJ6EFsltO/FZ3L8d2aF7SO7kU+iM4v0HxtGCZEvJ4Qq8g9px80iB2ZoKhxnUO+A
         yYdZMk3c72H41K6ixKQBh1QLHNB5N5lb9MAmFNlc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190826164510.6425-3-jorge.ramirez-ortiz@linaro.org>
References: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org> <20190826164510.6425-3-jorge.ramirez-ortiz@linaro.org>
Cc:     bjorn.andersson@linaro.org, niklas.cassel@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     agross@kernel.org, jorge.ramirez-ortiz@linaro.org,
        mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/5] clk: qcom: hfpll: get parent clock names from DT
User-Agent: alot/0.8.1
Date:   Mon, 09 Sep 2019 03:22:14 -0700
Message-Id: <20190909102214.E0C302089F@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2019-08-26 09:45:08)
> diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
> index a6de7101430c..87b7f46d27e0 100644
> --- a/drivers/clk/qcom/hfpll.c
> +++ b/drivers/clk/qcom/hfpll.c
> @@ -52,6 +52,7 @@ static int qcom_hfpll_probe(struct platform_device *pde=
v)
>         void __iomem *base;
>         struct regmap *regmap;
>         struct clk_hfpll *h;
> +       struct clk *pclk;
>         struct clk_init_data init =3D {
>                 .parent_names =3D (const char *[]){ "xo" },
>                 .num_parents =3D 1,
> @@ -75,6 +76,13 @@ static int qcom_hfpll_probe(struct platform_device *pd=
ev)
>                                           0, &init.name))
>                 return -ENODEV;
> =20
> +       /* get parent clock from device tree (optional) */
> +       pclk =3D devm_clk_get(dev, "xo");
> +       if (!IS_ERR(pclk))
> +               init.parent_names =3D (const char *[]){ __clk_get_name(pc=
lk) };
> +       else if (PTR_ERR(pclk) =3D=3D -EPROBE_DEFER)
> +               return -EPROBE_DEFER;
> +

Can this use the "new" way of specifying parents of clks? That would be
better than calling clk_get() on the XO clk to handle this.

>         h->d =3D &hdata;
>         h->clkr.hw.init =3D &init;
>         spin_lock_init(&h->lock);
