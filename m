Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABD21A92B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 07:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441040AbgDOFya (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 01:54:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:51856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2441036AbgDOFy3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 01:54:29 -0400
Received: from localhost (unknown [106.201.106.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30228206F9;
        Wed, 15 Apr 2020 05:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586930069;
        bh=AmBPuwrPkxVjYlLOzwXCcIb+TBd1bFmicvNUArR8V4g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sd72jEpiiXhrUGqPx7QGtkYFGnMjcd9AVkN4eQd2bvgBy/gaSL+FkUjIGBKlDi+qe
         L/SfziGsEKhFFtM0DQ8A73GjZoQIg5/N39HkJj7Xm6GIYC8YQQge8OcQE0H7G9ThRL
         jm0bAR6Yv6dAWbjUnFlV2WsLR8TPqj7MPpv7I414=
Date:   Wed, 15 Apr 2020 11:24:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom-rpmh: Fix typos in pm8150 and pm8150l
Message-ID: <20200415055419.GN72691@vkoul-mobl>
References: <20200415053708.717623-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415053708.717623-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14-04-20, 22:37, Bjorn Andersson wrote:
> Fix typos in pm8150 l13/l16/l17 and pm8150l ldo8 supplies.
> 

Thanks Bjorn for spotting this:

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Vinod Koul <vkoul@kernel.org>

> Fixes: 06369bcc15a1 ("regulator: qcom-rpmh: Add support for SM8150")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index c86ad40015ce..c88cfa8952d6 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -832,11 +832,11 @@ static const struct rpmh_vreg_init_data pm8150_vreg_data[] = {
>  	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l2-l10"),
>  	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_nldo,      "vdd-l1-l8-l11"),
>  	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
> -	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,      "vdd-l13-l6-l17"),
> +	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,      "vdd-l13-l16-l17"),
>  	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
>  	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
> -	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_pldo,      "vdd-l13-l6-l17"),
> -	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,      "vdd-l13-l6-l17"),
> +	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_pldo,      "vdd-l13-l16-l17"),
> +	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,      "vdd-l13-l16-l17"),
>  	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
>  	{},
>  };
> @@ -857,7 +857,7 @@ static const struct rpmh_vreg_init_data pm8150l_vreg_data[] = {
>  	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l4-l5-l6"),
>  	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l4-l5-l6"),
>  	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l7-l11"),
> -	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_pldo_lv,   "vdd-l1-l8-l11"),
> +	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_pldo_lv,   "vdd-l1-l8"),
>  	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_pldo,      "vdd-l9-l10"),
>  	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l9-l10"),
>  	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      "vdd-l7-l11"),
> -- 
> 2.24.0

-- 
~Vinod
