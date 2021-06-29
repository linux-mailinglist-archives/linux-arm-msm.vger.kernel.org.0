Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD6DB3B7A77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 00:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233329AbhF2WhG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 18:37:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:49344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233056AbhF2WhG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 18:37:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B77C61D2E;
        Tue, 29 Jun 2021 22:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625006078;
        bh=HshZ+39IdwahaJkmfBB0YzLsh2aQB532mmuwkEx2MHI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Kjj2heGt3fCxpkjXvGXejuGqWZhZBL2PIfu/WVkHR9hd/5ySioHesiJpS5turkoRr
         /UKFm7rm/Yc3Q5EsLLQw5/VQ8DgNJHNHwkmzPZALGzhUgRyDHGOpqDtsLEGLo88iTs
         GZpBeduZNazQZOADfOiuknW9aAqIupP1hoOgFK/w400Qn29DVRzDT+eEOgDlfad3ha
         4c9OdGLk2dYWlYBX2/FRoUptnWRz/8pX8SDaqVAiHmhDkYaajLCk9oQ73/L8lTvrMj
         0FO3CeSEjf80RE21Xrl1qIlGRckuUK8BTcnUbAgBuDrjPdG/og5B/kkGbBy3C+jmFa
         2gr/rae+XqFEg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210629203919.2956918-2-dmitry.baryshkov@linaro.org>
References: <20210629203919.2956918-1-dmitry.baryshkov@linaro.org> <20210629203919.2956918-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: fix domains cleanup in gdsc_unregister
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 29 Jun 2021 15:34:37 -0700
Message-ID: <162500607734.3331010.12498813187207407633@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-06-29 13:39:19)
> Properly remove registered genpds. Also remove the provider before
> breaking parent/child links, so that the system is consistent at remove
> time.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/gdsc.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 241186d9d08c..4b211dd1764d 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -475,6 +475,9 @@ void gdsc_unregister(struct gdsc_desc *desc)
>         struct gdsc **scs =3D desc->scs;
>         size_t num =3D desc->num;
> =20
> +       /* Remove provider first */

but why? A better comment would be

	/*
	 * Remove provider first so that we can remove the genpds
	 * without worrying about consumers getting them during the
	 * removal process.
	 */

> +       of_genpd_del_provider(dev->of_node);
> +
>         /* Remove subdomains */
>         for (i =3D 0; i < num; i++) {
>                 if (!scs[i])
> @@ -482,7 +485,13 @@ void gdsc_unregister(struct gdsc_desc *desc)
>                 if (scs[i]->parent)
>                         pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]=
->pd);
>         }
> -       of_genpd_del_provider(dev->of_node);
> +
> +       /* Remove domains themselves */
> +       for (i =3D 0; i < num; i++) {
> +               if (!scs[i])
> +                       continue;
> +               pm_genpd_remove(&scs[i]->pd);
> +       }
>  }
