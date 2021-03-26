Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3D4734AE7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 19:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhCZSYF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 14:24:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:34412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229957AbhCZSYA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 14:24:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E81D619B6;
        Fri, 26 Mar 2021 18:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616783039;
        bh=W8+TXVmo3TkbP6PiUlApcKVziKCU56ZFoOlT9n6Zkxw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Kios6cSeCsttAHy1KDawrB2JejkY8LwM6e5i7D9zKvCaJIDQYSh924HMf6D9v6ff6
         R4zAZenWZQAhT42XoXYJUsj5uuuaIEN2RfqwXMaEIrhBMzlv1j4F8Ra32hehJXyyJS
         m4rS3huyPf7W5Lp+ZA3PLXElDG8p19ojrXsnr8b5743qBfGqUG6VqZ80UfrGtb1yId
         dMsj4qmJmFPUEzsz81TeKBbrooApWwAt/YTv0guFqDsU04SOFY8igyEW4K+CZ5kVVP
         mJcsPksAQFTfvNWKfGvD0IzBKji33+c5eA94W1al1tqb48SXC8VSsQ7/C2T2NrmQR2
         QRxVKXkQer9tQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210326145816.9758-3-bartosz.dudziak@snejp.pl>
References: <20210326145816.9758-1-bartosz.dudziak@snejp.pl> <20210326145816.9758-3-bartosz.dudziak@snejp.pl>
Subject: Re: [PATCH 2/5] clk: qcom: gcc: Add support for Global Clock controller found on MSM8226
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 26 Mar 2021 11:23:58 -0700
Message-ID: <161678303809.3012082.14127191260312393003@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bartosz Dudziak (2021-03-26 07:58:13)
> Modify existing MSM8974 driver to support MSM8226 SoC. Override frequenci=
es
> which are different in this older chip. Register all the clocks to the
> framework for the clients to be able to request for them.

Alphabet sort includes? Preferably do that in a different patch.

>=20
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  drivers/clk/qcom/gcc-msm8974.c | 185 ++++++++++++++++++++++++++++++---
>  1 file changed, 171 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm897=
4.c
> index 740d3c44c0..06cd669e10 100644
> --- a/drivers/clk/qcom/gcc-msm8974.c
> +++ b/drivers/clk/qcom/gcc-msm8974.c
> @@ -3,16 +3,13 @@
>   * Copyright (c) 2013, The Linux Foundation. All rights reserved.
>   */
> =20
> -#include <linux/kernel.h>
> -#include <linux/bitops.h>
> +#include <linux/clk-provider.h>
>  #include <linux/err.h>
> -#include <linux/platform_device.h>
> +#include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of.h>
>  #include <linux/of_device.h>
> -#include <linux/clk-provider.h>
> +#include <linux/of.h>
>  #include <linux/regmap.h>
> -#include <linux/reset-controller.h>
> =20
>  #include <dt-bindings/clock/qcom,gcc-msm8974.h>
>  #include <dt-bindings/reset/qcom,gcc-msm8974.h>
> @@ -2727,7 +2880,11 @@ static int gcc_msm8974_probe(struct platform_devic=
e *pdev)
>         if (ret)
>                 return ret;
> =20
> -       return qcom_cc_probe(pdev, &gcc_msm8974_desc);
> +       regmap =3D qcom_cc_map(pdev, id->data);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       return qcom_cc_really_probe(pdev, id->data, regmap);

Is this doing anything? I think qcom_cc_probe(pdev, id->data) should
work?
