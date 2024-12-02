Return-Path: <linux-arm-msm+bounces-39771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AED819DF9BC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 04:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BDAEB20F88
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 03:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C621F8AFF;
	Mon,  2 Dec 2024 03:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHyN+gAj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F701F8AF9;
	Mon,  2 Dec 2024 03:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733111894; cv=none; b=aMR9ruhhn45xE+2lBP+CMnZSJlcNa1/cSC6gVwO7G62Pweeo1O+sOB0fSVJ+jQf4/V614e8he6jL7KQPKZHs5WTQ4wEorf6YEX+zInu8FhB5uuz5AM37Pti5ZcmFo/NWESCjFN/rJsb60XE8vzdC70rb1c8rhG0U9Hy5PyOT76k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733111894; c=relaxed/simple;
	bh=aVDfCKtaigEChhc1oQn3uCiGBKz3heH4xaoXSvXbnVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtwqY0kLPXCoJjs1OzXi0Tt4QYQEbbOEpFbRaGBt1IIwTO12gAmuVK50wJoUtlat5diKU+f8eev810+EUX8cVaWtZcXHDWiiR2L1owtfIjCYthe/d64boJkXj7GiYIDe7Co5q9zR5Lk8bR48LEp6RWfvm7xh3/IMn1zvyTWEA10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHyN+gAj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1A0C4CEDA;
	Mon,  2 Dec 2024 03:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733111894;
	bh=aVDfCKtaigEChhc1oQn3uCiGBKz3heH4xaoXSvXbnVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UHyN+gAjUPjPpk4IwqXqSjgCRl+8JBT1ZK/NC7timCLkg/TD8Yrd790ZNsXPuTmQD
	 I3vpWMNvnl/bFV1z66o2/owSG0ASJRvOPtlCon/4dngHpn/IVrc6r2rZW37vxtUl0j
	 HiWjEwc2Ph2qq7nWd1h/J7pkAOVpJqnRdmH/XF10xmT+a9RZDlqk4NG6mF+dwWUzWI
	 qMyRgx1BIT948tsx2FzF08LitEX6LfqQGhXuXFcckHul0wpmXGFUjdgl3FJ8Acfb/7
	 pZ12wllDQpMlLW2P6O8RZoz/erzR7yekME8HYgEuucIS/Whg/y9ciyEvToJVgdeZVq
	 vbtYNhxWfZa/Q==
Date: Sun, 1 Dec 2024 21:58:11 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] clk: qcom: Support attaching GDSCs to multiple
 parents
Message-ID: <7slvjokv5xcwdpoa77vtg5ihkmgsok5arz2aw2f3wfh4hffkzu@rep6qmkqy2ro>
References: <20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-0-24486a608b86@linaro.org>
 <20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-3-24486a608b86@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-3-24486a608b86@linaro.org>

On Fri, Nov 29, 2024 at 01:06:49PM +0000, Bryan O'Donoghue wrote:
> When a clock-controller has multiple power-domains we need to attach
> parent GDSCs in that clock-controller as subdomains of each of the
> power-domains.

I envision a fair number of current and future readers will wonder why
this is... Why do we _need_ to perform this attachment?

> 
> Testing on the x1e80100 reference shows that both power-domains need to be
> switched on for the GDSCs in the clock-controller to work.

You're making a completely generic change, but are referring here to
some specific (probably camera) case.

> Some open
> questions remain.
> 
> 1. Should there be a hirearchy of power-domains in the clock-controller.

Your TITAN_TOP patches is already an example of such hierarchy, so I
don't think that's an open question.

> 2. If there should be no hirearchy should the parent GDSC inside the
>    clock-controller attach to each power-domain in the clock-controller.

I suspect that the TITAN_TOP gives you this impression that there is a
"parent GDSC"; that's generally not the case - but the mechanism
introduced by the patch is still needed.

> 3. If there are multiple parent GDSCs in a clock-controller do we attach
>    those top-level GDSCs to each controller power-domain.
> 4. Finally should performance-states be applied equally across those
>    power-domains.
> 
> It may be if we see more clock-controllers with multiple power-domains that
> some mixture of these questions will need to be implemented for specific
> hardware.

GPUCC has always been an example of this and there are several other
examples in multimedia, which we've just ignored. And even for GCC you
have a mix of voltage requirements cast across CX and MX.

> Right now the approach taken here is to attach the
> clock-controller GDSC parent to each clock-controller power-domain.
> 

What is "the clock-controller GDSC parent"? Perhaps I'm just parsing
this incorrectly?

Perhaps we can use the naming from the API and say "each GDSC is put in
the subdomain of all power-domains of the clock-controller"?


I'm not convinced that the propagation of set_performance_state has been
adequately been understood.

But, in general, I'm not against the idea of starting off by voting on
all rails, mentioning that it's likely that in some cases more effective
propagation of votes can be made and then leave this as a future
exercise.

I would like to see 1-2 use cases beyond camcc being exposed to this
though.

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
> index b79e6a73b53a4113ca324d102d7be5504a9fe85e..9e3380fd718198c9fe63d7361615a91c3ecb3d60 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -323,6 +323,7 @@ int qcom_cc_really_probe(struct device *dev,
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

