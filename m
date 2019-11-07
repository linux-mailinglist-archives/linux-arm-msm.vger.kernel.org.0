Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37D8CF3B40
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 23:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfKGWTh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 17:19:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:39548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbfKGWTh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 17:19:37 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E2A7F206C3;
        Thu,  7 Nov 2019 22:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573165177;
        bh=F7k9EZtZvvvemljU4hl3MjhGzHCnPTT9RJQ3cl2MyNA=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=xY0xzb0cnI1wYlyG2H+EItQZV6+dd5u/zZc6l3lYKjwO6Cd81xcYNVTsBRGmVfGQV
         WKF8X22fByQfbWP5/gBWOwbd2N+9IwHEVIhdVKqW5DNG7Dpzn2J+/ekmB1g0uFn6zb
         6Z7fKL7jnxpJ2VnzJ6YNbXxE4YDWYOhFaSZf2Rog=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190912141534.28870-6-jorge.ramirez-ortiz@linaro.org>
References: <20190912141534.28870-1-jorge.ramirez-ortiz@linaro.org> <20190912141534.28870-6-jorge.ramirez-ortiz@linaro.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        jorge.ramirez-ortiz@linaro.org, mturquette@baylibre.com
Cc:     niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] clk: qcom: apcs-msm8916: get parent clock names from DT
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 14:19:36 -0800
Message-Id: <20191107221936.E2A7F206C3@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2019-09-12 07:15:34)
> @@ -61,6 +62,9 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_=
device *pdev)
>         if (!a53cc)
>                 return -ENOMEM;
> =20
> +       if (of_clk_parent_fill(parent->of_node, parents, 2) =3D=3D 2)
> +               memcpy(gpll0_a53cc, parents, sizeof(parents));
> +
>         init.name =3D "a53mux";
>         init.parent_names =3D gpll0_a53cc;
>         init.num_parents =3D ARRAY_SIZE(gpll0_a53cc);

Why can't we use new way of specifying parents in this driver too?

> @@ -76,10 +80,11 @@ static int qcom_apcs_msm8916_clk_probe(struct platfor=
m_device *pdev)
>         a53cc->src_shift =3D 8;
>         a53cc->parent_map =3D gpll0_a53cc_map;
> =20
> -       a53cc->pclk =3D devm_clk_get(parent, NULL);
> +       a53cc->pclk =3D of_clk_get(parent->of_node, 0);

And then leave this one alone? clk_get() with a NULL id should use a DT
index of 0 from what I can tell.

>         if (IS_ERR(a53cc->pclk)) {
>                 ret =3D PTR_ERR(a53cc->pclk);
> -               dev_err(dev, "failed to get clk: %d\n", ret);
> +               if (ret !=3D -EPROBE_DEFER)
> +                       dev_err(dev, "failed to get clk: %d\n", ret);
>                 return ret;
>         }
> =20
