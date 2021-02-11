Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B15AB31845B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 05:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbhBKEhf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 23:37:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:39870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229457AbhBKEhf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 23:37:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 907EC64E76;
        Thu, 11 Feb 2021 04:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613018214;
        bh=XPvkfWu9iNJg4IpOigCGzYQHEusZWZkAU9p+NvAt1YM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TqoxAr5ndqFZA3fFbH12bdnKldyE86TVZVo2kDVCzTEqRRAEYrx4NQCZUfDvgUYwp
         PsxIr1wZYi5V7rNVfE3yY59JvnX/ryV9/94SfPwszqVkKJv+qfUGIo9co3oCPIAWEW
         7RR1QISbfpHGdFpnGWCDHqTr8ag04FCBOb5KxNS1yxAeksPrgjC6iMrLzZ7p0WAvM4
         ArcyrKgxCGisxa+ZN3f+xb/bOAf23WcfGTjui24UzcwD+1Xc9mGiafg257SjCKo/JY
         99k9/zGGv2tdfekcI03aeTFASie3MLobZsqJCToUERZIJffzSvE48GtJORx9s+p8ER
         wm9QW3H0lmgkQ==
Date:   Thu, 11 Feb 2021 10:06:50 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "open list:VOLTAGE AND CURRENT REGULATOR FRAMEWORK" 
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] regulator: qcom-rpmh: fix pm8009 ldo7
Message-ID: <20210211043650.GG2774@vkoul-mobl.Dlink>
References: <20210211034935.5622-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211034935.5622-1-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-02-21, 22:49, Jonathan Marek wrote:
> Use the correct name to avoid ldo7 commands being sent to ldo6's address.

Thanks for spotting and fixing it.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> Fixes: 06369bcc15a1 ("regulator: qcom-rpmh: Add support for SM8150")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 05f1b4e150f4..043dc2fd39eb 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -937,7 +937,7 @@ static const struct rpmh_vreg_init_data pm8009_vreg_data[] = {
>  	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l4"),
>  	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l5-l6"),
>  	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l5-l6"),
> -	RPMH_VREG("ldo7",   "ldo%s6",  &pmic5_pldo_lv,   "vdd-l7"),
> +	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo_lv,   "vdd-l7"),
>  	{},
>  };
>  
> -- 
> 2.26.1

-- 
~Vinod
