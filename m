Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECCD3B5650
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 02:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbhF1AbA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 20:31:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:53658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231689AbhF1AbA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 20:31:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E950561C35;
        Mon, 28 Jun 2021 00:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624840116;
        bh=WaSz+8DMaDc+JD17Y6WPciY50zdTWdGuyQ1bKDSGu3A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=H+ugFLefkMO7zmizUOp07azzNrTXrh7f+cRvnkbe/0ZPpPjr3/8EwG0THxYpS9RDm
         E78HNgJ/djK+cVzW4/RCgJJCXIYPxT5/YaTV8wi7HhbQ1t2nEtyi2IOVk427bIkfOV
         UwOnrlDMvGSgXvb1dseNiWUW6jvd1hivJJYBE7TXtcl2WDzTTcLgVZtz0kWJG/64HV
         CDCeuvqOyApEGDUgxuCVt/q1KZRw5BAxU+No2X35gGJaoXenUWcNtJ7c3GSwbnEgDj
         SgVeUcEx5hsmzzX76KDA8zlTjAVRAL6d6dUcd6iA5qqpkqJE9c6tOyZRx6a+aM62QA
         Jc+liut0Sa2rQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210504052844.21096-4-shawn.guo@linaro.org>
References: <20210504052844.21096-1-shawn.guo@linaro.org> <20210504052844.21096-4-shawn.guo@linaro.org>
Subject: Re: [PATCH 3/5] clk: qcom: apcs-msm8916: Retrieve clock name from DT
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Date:   Sun, 27 Jun 2021 17:28:34 -0700
Message-ID: <162484011476.3259633.10138087900669024498@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Shawn Guo (2021-05-03 22:28:42)
> Unlike MSM8916 which has only one APCS clock, MSM8939 gets three for
> Cluster0 (little cores), Cluster1 (big cores) and CCI (Cache Coherent
> Interconnect).  Instead of hard coding APCS (and A53PLL) clock name,
> retrieve the name from DT, so that multiple APCS clocks can be
> registered.
>=20
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/clk/qcom/a53-pll.c      | 5 ++++-
>  drivers/clk/qcom/apcs-msm8916.c | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
> index 8614b0b0e82c..964f5ab7d02f 100644
> --- a/drivers/clk/qcom/a53-pll.c
> +++ b/drivers/clk/qcom/a53-pll.c
> @@ -42,6 +42,7 @@ static int qcom_a53pll_probe(struct platform_device *pd=
ev)
>         struct clk_pll *pll;
>         void __iomem *base;
>         struct clk_init_data init =3D { };
> +       const char *clk_name =3D NULL;
>         int ret;
> =20
>         pll =3D devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
> @@ -66,7 +67,9 @@ static int qcom_a53pll_probe(struct platform_device *pd=
ev)
>         pll->status_bit =3D 16;
>         pll->freq_tbl =3D a53pll_freq;
> =20
> -       init.name =3D "a53pll";
> +       of_property_read_string(pdev->dev.of_node, "clock-output-names",
> +                               &clk_name);

Please no? Is there any use for this? Why not just generate the name as
a53pll@<MMIO ADDRESS>?

> +       init.name =3D clk_name ? clk_name : "a53pll";
>         init.parent_names =3D (const char *[]){ "xo" };
>         init.num_parents =3D 1;
>         init.ops =3D &clk_pll_sr2_ops;
