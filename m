Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41B5D18DBFA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2020 00:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgCTXbC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 19:31:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:43654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbgCTXbC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 19:31:02 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7369820714;
        Fri, 20 Mar 2020 23:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584747061;
        bh=tIwebCiEFjLM6caPX44WvFuTzPQDdtDBirjcM1QZ36w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=opEXkSQSPNnAiLwt8hNREBKZgqYVkb4dRXiJcStV8wXwkKpGDW42+y4WW5i99vTCF
         Xxi6dAoHeSZti50DnrT9eN9dOySVixflLxWEEhH3riE346dPcQZ8lO8U+yYnYesCgh
         odsMzsU7bIAqnKUmZz3ZqPhWYrDLpKHnV9YViOkU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200319053902.3415984-2-bjorn.andersson@linaro.org>
References: <20200319053902.3415984-1-bjorn.andersson@linaro.org> <20200319053902.3415984-2-bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/4] clk: qcom: gdsc: Handle GDSC regulator supplies
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 20 Mar 2020 16:31:00 -0700
Message-ID: <158474706060.125146.14080695452569921346@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-03-18 22:38:59)
> Certain GDSCs, such as the GPU_GX on MSM8996, requires that the upstream
> regulator supply is powered in order to be turned on.
>=20
> It's not guaranteed that the bootloader will leave these supplies on and
> the driver core will attempt to enable any GDSCs before allowing the
> individual drivers to probe defer on the PMIC regulator driver not yet
> being present.
>=20
> So the gdsc driver needs to be made aware of supplying regulators and
> probe defer on their absence, and it needs to enable and disable the
> regulator accordingly.
>=20
> Voltage adjustments of the supplying regulator are deferred to the
> client drivers themselves.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Ok. Looks mostly fine to me.

>  drivers/clk/qcom/gdsc.c | 24 ++++++++++++++++++++++++
>  drivers/clk/qcom/gdsc.h |  4 ++++
>  2 files changed, 28 insertions(+)
>=20
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index a250f59708d8..3528789cc9d0 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -13,6 +13,7 @@
>  #include <linux/regmap.h>
>  #include <linux/reset-controller.h>
>  #include <linux/slab.h>
> +#include <linux/regulator/consumer.h>

Alphabetical?

>  #include "gdsc.h"
> =20
>  #define PWR_ON_MASK            BIT(31)
> @@ -371,6 +385,16 @@ int gdsc_register(struct gdsc_desc *desc,
>         if (!data->domains)
>                 return -ENOMEM;
> =20
> +       /* Resolve any regulator supplies */

Drop the comment please, it's just saying what the code is doing.

> +       for (i =3D 0; i < num; i++) {
> +               if (!scs[i] || !scs[i]->supply)
> +                       continue;
> +
> +               scs[i]->rsupply =3D devm_regulator_get(dev, scs[i]->suppl=
y);
> +               if (IS_ERR(scs[i]->rsupply))
> +                       return PTR_ERR(scs[i]->rsupply);
> +       }
> +
>         data->num_domains =3D num;
>         for (i =3D 0; i < num; i++) {
>                 if (!scs[i])
