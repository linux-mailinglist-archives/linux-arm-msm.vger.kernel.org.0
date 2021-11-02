Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 604DE443820
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 22:58:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhKBWAl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 18:00:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:60176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229525AbhKBWAk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 18:00:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BDA660EDF;
        Tue,  2 Nov 2021 21:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635890285;
        bh=P16OQEV/s/AT2BeYrLgBIB2QROVOkYZGirYakOBKtd8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JK0aPFSs5hLpl7vTgMaRlAT7rSvA9eNskbYJAdAWx7++gDRJauzmxSx1+VZrR6se9
         5J5Q4wmjTSkkNgFFocGpQnEN5c7AvE7sYyPiaiSwFHqaleEV1A5KBJq4GFN5P+HlbO
         L5sZUZ6QWfeQall0MIogFvUA/vvDuym4KzjwQNuJdsANiQ6WCPA6JwRmbYifgxF6Nt
         lK3sVBMQttdtHUD5QZZLJfwUCq4ToWOBchFkqCO4/Tdv6HbASSYYWgA5/9/fZ0HC16
         o93h64sKbgubjqBi7qCFlNjvjbvn3OO6cn8QcQ1VUKW3nJo/cm2NkfSfBEjL/Cg37T
         4zCOOLTmwbo7w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1635847013-3220-3-git-send-email-tdas@codeaurora.org>
References: <1635847013-3220-1-git-send-email-tdas@codeaurora.org> <1635847013-3220-3-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 2/4] clk: qcom: gdsc: Add support for clock voting from GDSC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 02 Nov 2021 14:58:03 -0700
Message-ID: <163589028388.2993099.5936912812368868539@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-11-02 02:56:51)
> In the cases where the clock is required to be enabled before the genpd
> enable add support for the same.

Please describe more. One sentence is not enough here.

>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/gdsc.c | 45 +++++++++++++++++++++++++++++++++++++++----=
--
>  drivers/clk/qcom/gdsc.h |  3 +++
>  2 files changed, 42 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 7e1dd8c..1caca32 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -478,6 +499,18 @@ int gdsc_register(struct gdsc_desc *desc,
>                         return PTR_ERR(scs[i]->rsupply);
>         }
>=20
> +       for (i =3D 0; i < num; i++) {
> +               if (!scs[i])
> +                       continue;
> +
> +               scs[i]->clk =3D devm_clk_get(dev, scs[i]->clk_name);
> +               if (IS_ERR(scs[i]->clk))
> +                       return PTR_ERR(scs[i]->clk);
> +               ret =3D clk_prepare(scs[i]->clk);

Why do we keep it prepared forever? And don't we have support for
writing directly into cxc registers?

> +               if (ret)
> +                       return ret;
> +       }
> +
>         data->num_domains =3D num;
>         for (i =3D 0; i < num; i++) {
>                 if (!scs[i])
