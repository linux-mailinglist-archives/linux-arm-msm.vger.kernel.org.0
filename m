Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33332A75B5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 03:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388383AbgKECm6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 21:42:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:55938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733101AbgKECm6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 21:42:58 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 889D42074B;
        Thu,  5 Nov 2020 02:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604544177;
        bh=o2ZixdoyTez57g0Hgq+WoFiK7SSCRB/m5mogC7KJns8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=McE9Hu5/PkUGK6ZzHobSX7n8IhHsT8XXclsd7NLZe73S3Bg5K6I6GHt8GFIGnVjp+
         wo8ykXNS2687iFweCked1NsnYLD0G0JSjXvcUdzsqVstdQ6o1ctynJtl1QEPAUloAc
         5hieE/MhytBORgcSyjGRwYJUZa9MZ2MG0Ptw38EU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201023131925.334864-6-dmitry.baryshkov@linaro.org>
References: <20201023131925.334864-1-dmitry.baryshkov@linaro.org> <20201023131925.334864-6-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 5/5] clk: qcom: dispcc-sm8250: handle MMCX power domain
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Wed, 04 Nov 2020 18:42:56 -0800
Message-ID: <160454417608.3965362.16775651224166864448@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2020-10-23 06:19:25)
> On SM8250 MMCX power domain is required to access MMDS_GDSC registers.
> This power domain is expressed as mmcx-supply regulator property. Use
> this regulator as MDSS_GDSC supply.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sm8250.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-s=
m8250.c
> index 07a98d3f882d..588575e1169d 100644
> --- a/drivers/clk/qcom/dispcc-sm8250.c
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -963,6 +963,7 @@ static struct gdsc mdss_gdsc =3D {
>         },
>         .pwrsts =3D PWRSTS_OFF_ON,
>         .flags =3D HW_CTRL,
> +       .supply =3D "mmcx",
>  };
> =20

Can this patch be applied to clk tree or will it break the tree without
the dts/regulator bits in place?
