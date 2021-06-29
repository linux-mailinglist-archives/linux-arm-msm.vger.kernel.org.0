Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADC63B7A75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 00:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235415AbhF2WfR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 18:35:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:48970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233056AbhF2WfQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 18:35:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC30061DA0;
        Tue, 29 Jun 2021 22:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625005968;
        bh=0COl4WVfRdda/+FUqcvWnS4TglaX/LSFDdNPIUex3RI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uVCU0pANdHhA4/H7Wcd/YbFVumVPZHtrzMLjfl479ea9rmy7j530KouFDgYREXUm/
         2sDVQXUtpDq4wIkHShC35yPkN+emc1fJxhxPyu0iCxByFntsgFdQmcpmgNMaWpzkb7
         DOPOmsmsXfAjSVeX2nMLQVkLkFquYxq36U7/y2826yN9rRA0wPyMd2Keai+z89KkFe
         ypXTjUOZH83kIjF0WU5o2gjy+P0/eBJ+Y4azvuL+diPBPqikw7JcLcaJYZN7xtuxz4
         rfV3R+s52Snk6VJPP15iZFQe11x++ZUnNIma9Yo9g8UJ4eiNzG1Qbtg+yhunH5JXqM
         3rr6c6L+tyEuw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210629203919.2956918-1-dmitry.baryshkov@linaro.org>
References: <20210629203919.2956918-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] clk: qcom: fix error_path in gdsc_register
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 29 Jun 2021 15:32:47 -0700
Message-ID: <162500596752.3331010.9143984291895131092@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-06-29 13:39:18)
> Properly handle and cleanup errors in gdsc_register() instead of just
> returning an error and leaving some of resources registered/hanging in
> the system.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Any Fixes tag?

Also, please send multi-patch series with a cover letter and Cc Taniya
Das <tdas@codeaurora.org> on qcom clk patches.

-Stephen

> ---
>  drivers/clk/qcom/gdsc.c | 32 ++++++++++++++++++++++++++++----
>  1 file changed, 28 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 51ed640e527b..241186d9d08c 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -429,7 +429,7 @@ int gdsc_register(struct gdsc_desc *desc,
>                 scs[i]->rcdev =3D rcdev;
>                 ret =3D gdsc_init(scs[i]);
>                 if (ret)
> -                       return ret;
> +                       goto err_init;
>                 data->domains[i] =3D &scs[i]->pd;
>         }
> =20
> @@ -437,11 +437,35 @@ int gdsc_register(struct gdsc_desc *desc,
>         for (i =3D 0; i < num; i++) {
>                 if (!scs[i])
>                         continue;
> -               if (scs[i]->parent)
> -                       pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->p=
d);
> +               if (scs[i]->parent) {
> +                       ret =3D pm_genpd_add_subdomain(scs[i]->parent, &s=
cs[i]->pd);
> +                       if (ret)
> +                               goto err_subdomain;
> +               }
>         }
> =20
> -       return of_genpd_add_provider_onecell(dev->of_node, data);
> +       ret =3D of_genpd_add_provider_onecell(dev->of_node, data);
> +       if (!ret)
> +               return 0;
> +
> +err_subdomain:
> +       i--;
> +       for (; i >=3D 0; i--) {
> +               if (!scs[i] || !scs[i]->parent)
> +                       continue;
> +               pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
> +       }
> +       i =3D num;
> +
> +err_init:
> +       i--;
> +       for (; i >=3D 0; i--) {
> +               if (!scs[i])
> +                       continue;
> +               pm_genpd_remove(&scs[i]->pd);
> +       }
> +
> +       return ret;
>  }
> =20
>  void gdsc_unregister(struct gdsc_desc *desc)
> --
