Return-Path: <linux-arm-msm+bounces-39244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7139DA154
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 05:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E0382840BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 04:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF387139D0B;
	Wed, 27 Nov 2024 04:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qlGgdzMB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEACE42AB3;
	Wed, 27 Nov 2024 04:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732680434; cv=none; b=OeQkSoohurHBV5MutV3MqYEu426Fs/iqyYfmA/FnZ6HaAnMTz5xdkN40WsOvcTF/NWio8yfwv9oJzfenMYvuTPaqbpehBIb/R9N1rd87pFOl8heetViXjTrN3TtlJydoZJ2sCWf4dM3IT1LBZreLktIfsrKRUcrKr/0YDjHLz98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732680434; c=relaxed/simple;
	bh=OmVtOoVnhc+wKXNqr18xMEkfBDu8J0aIQTO6c6iNU2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQuC8/7PSKkYHYm1+rtBR/ZUXapPG45Jh4xpVJ/vk4QfMO6zAsF8+WB2tZ2wQKkHRsqO5v3DOEkuONrpdKKGDgQ3t+njwqBJa7ntb0Yl6hgKaAxOOYgvJPRqxJ6i7m1RRYWD8jTpiNSBLwTxGXOAM7eTg3zBMDP2/EuGMZdG2eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qlGgdzMB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDBC1C4CECC;
	Wed, 27 Nov 2024 04:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732680433;
	bh=OmVtOoVnhc+wKXNqr18xMEkfBDu8J0aIQTO6c6iNU2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qlGgdzMBLMKqs29v7ugGZDliNCaXlq7KOlvDfdz9qCJuPzsHE/a9gvOInMis7VvQc
	 UiAlp/V7F5RxilpLBTLdlOzFBauFrnFo/oC7lmRrcAefXnFqDT75ibgTIvDnAQF/Nh
	 09y3P5V95mYGo1Hoey+0W0Kcc8tyY5Lfv6uTTyAO7BMYylpy0zkq18KroE8nMRiqYR
	 FOijftzVAQsMME0omtOEBh8VeFmFWXhLRatr+M1J5KKfQaJAE10KG06RbL0KK9q6Q9
	 9V9WtuyeTcN9fKHP8dNt4hmaJ6ibq3yQHp+dlsDlFdgQQ+bx1AbTRdF9IAtdSMurp+
	 4Y/HaNgRDdyMA==
Date: Tue, 26 Nov 2024 22:07:11 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] driver: clk: qcom: Support attaching subdomain
 list to multiple parents
Message-ID: <fs4lj5a3n52yx5bskizsthjw3egr73u6v3cuili46ef24owb2a@jff4l5uz2pn3>
References: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
 <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-3-836dad33521a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-3-836dad33521a@linaro.org>

On Tue, Nov 26, 2024 at 11:44:29PM +0000, Bryan O'Donoghue wrote:
> When a clock-controller has multiple power-domains we need to attach parent
> GDSCs in that clock-controller as subdomains of each of the power-domains.
> 

This is a bit sparse, in particular it would be nice to capture the open
questions about whether every GDSC always should be parented by all
defined power-domains, and if performance-state should be applied
equally across all those power-domains (and/or if this actually
happens).

PS. Please drop "drivers: " and s/subdomain list/GDSC/ in subject.

Regards,
Bjorn

> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/clk/qcom/common.c |  1 +
>  drivers/clk/qcom/gdsc.c   | 35 +++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gdsc.h   |  1 +
>  3 files changed, 37 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 7727295c57c8f6672d46d2380e1ff5ec2ac68d42..58a8397eefe51da237a4285d4e7cee967e19948f 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -338,6 +338,7 @@ int qcom_cc_really_probe(struct device *dev,
>  		scd->dev = dev;
>  		scd->scs = desc->gdscs;
>  		scd->num = desc->num_gdscs;
> +		scd->pd_list = cc->pd_list;
>  		ret = gdsc_register(scd, &reset->rcdev, regmap);
>  		if (ret)
>  			return ret;
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 4fc6f957d0b846cc90e50ef243f23a7a27e66899..cb4afa6d584899f3dafa380d5e01be6de9711737 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -506,6 +506,36 @@ static int gdsc_init(struct gdsc *sc)
>  	return ret;
>  }
>  
> +static int gdsc_add_subdomain_list(struct dev_pm_domain_list *pd_list,
> +				   struct generic_pm_domain *subdomain)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < pd_list->num_pds; i++) {
> +		struct device *dev = pd_list->pd_devs[i];
> +		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
> +
> +		ret = pm_genpd_add_subdomain(genpd, subdomain);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void gdsc_remove_subdomain_list(struct dev_pm_domain_list *pd_list,
> +				       struct generic_pm_domain *subdomain)
> +{
> +	int i;
> +
> +	for (i = 0; i < pd_list->num_pds; i++) {
> +		struct device *dev = pd_list->pd_devs[i];
> +		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
> +
> +		pm_genpd_remove_subdomain(genpd, subdomain);
> +	}
> +}
> +
>  int gdsc_register(struct gdsc_desc *desc,
>  		  struct reset_controller_dev *rcdev, struct regmap *regmap)
>  {
> @@ -558,6 +588,9 @@ int gdsc_register(struct gdsc_desc *desc,
>  			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
>  		else if (!IS_ERR_OR_NULL(dev->pm_domain))
>  			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> +		else if (desc->pd_list)
> +			ret = gdsc_add_subdomain_list(desc->pd_list, &scs[i]->pd);
> +
>  		if (ret)
>  			return ret;
>  	}
> @@ -580,6 +613,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
>  			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
>  		else if (!IS_ERR_OR_NULL(dev->pm_domain))
>  			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> +		else if (desc->pd_list)
> +			gdsc_remove_subdomain_list(desc->pd_list, &scs[i]->pd);
>  	}
>  	of_genpd_del_provider(dev->of_node);
>  }
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index 1e2779b823d1c8ca077c9b4cd0a0dbdf5f9457ef..dd843e86c05b2f30e6d9e978681580016333839d 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -80,6 +80,7 @@ struct gdsc_desc {
>  	struct device *dev;
>  	struct gdsc **scs;
>  	size_t num;
> +	struct dev_pm_domain_list *pd_list;
>  };
>  
>  #ifdef CONFIG_QCOM_GDSC
> 
> -- 
> 2.45.2
> 

