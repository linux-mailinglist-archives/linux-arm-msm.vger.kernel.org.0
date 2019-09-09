Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5736AD4AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2019 10:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbfIIITi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Sep 2019 04:19:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:55476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726928AbfIIITh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Sep 2019 04:19:37 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 13E0920678;
        Mon,  9 Sep 2019 08:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568017177;
        bh=Mpvur8qXCAfHMVIkSt2wICPWYL86B+HBB+4HLiCewek=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=KpzuiJlGsoWanuGSVCqfCjO3vIipkZZTvOENlVFQ8n6E3JGXLj5TJWkfCDUAYUM92
         2zL4QfzE0r5wgjooSyLdsv+c/LWYuV3cdtH/cuztjA5jcEIO1OsKX9RDpUDj1NdTJt
         8l2o+L3MHEJ9wpQravNQDag118dTctlOt7Y/z+0M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190906232346.8435-1-jorge.ramirez-ortiz@linaro.org>
References: <20190906232346.8435-1-jorge.ramirez-ortiz@linaro.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     agross@kernel.org, jorge.ramirez-ortiz@linaro.org,
        mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: qcom: fix QCS404 TuringCC regmap
User-Agent: alot/0.8.1
Date:   Mon, 09 Sep 2019 01:19:36 -0700
Message-Id: <20190909081937.13E0920678@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2019-09-06 16:23:46)
> The max register is 0x23004 as per the manual (the current
> max_register that this commit is fixing is actually out of bounds).
>=20
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---

Fixes tag?

>  drivers/clk/qcom/turingcc-qcs404.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/qcom/turingcc-qcs404.c b/drivers/clk/qcom/turing=
cc-qcs404.c
> index aa859e6ec9bd..4cfbbf5bf4d9 100644
> --- a/drivers/clk/qcom/turingcc-qcs404.c
> +++ b/drivers/clk/qcom/turingcc-qcs404.c
> @@ -96,7 +96,7 @@ static const struct regmap_config turingcc_regmap_confi=
g =3D {
>         .reg_bits       =3D 32,
>         .reg_stride     =3D 4,
>         .val_bits       =3D 32,
> -       .max_register   =3D 0x30000,
> +       .max_register   =3D 0x23004,
>         .fast_io        =3D true,
>  };
> =20
> --=20
> 2.23.0
>=20
