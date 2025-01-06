Return-Path: <linux-arm-msm+bounces-44024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8E8A02ECE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 18:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4B073A371F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 17:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2C31DEFDA;
	Mon,  6 Jan 2025 17:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFpM+mfv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CFA1DED77;
	Mon,  6 Jan 2025 17:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736184074; cv=none; b=MN47YIrK/ejhpSHCljZUww/sjo9Q5lt/ZCO8rCJPgEWChVx2E5DxoqmSlWU6lili2F64VhYtrvPMUIpYqmKnABjguOu8UOpcgpJAVROeom5SFLZ8L2E5Sgyezag/IEPR+EQKoz+eSWJw6TbtXVnUpRl2F4KnBkNUTwH4+IbezZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736184074; c=relaxed/simple;
	bh=PIZq03ehKDKmROzjq97rmzVMsFzu+QAUIkRYSPw1Tuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1HcNIrWj6KFs8OWDlqH1WsR7khtoGRQAOCaQtC9xA9+vKk+KLQkhTDF8DsYF6E1DakhnxbrqoQuBCeUb0zz4Mtc9jaUQOYTzfS746AyM24bKbKrRd40X+TjBtxQqXTHKzTbaGQyB8R7huhMdURDH7WrXW/qIGYVCLv+TSPVVb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFpM+mfv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C7FC4CED2;
	Mon,  6 Jan 2025 17:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736184073;
	bh=PIZq03ehKDKmROzjq97rmzVMsFzu+QAUIkRYSPw1Tuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QFpM+mfv48VrRoK7uBwM02njkGTIFKRGSiozIQKbLnyeSOvr3wrmMQg9n24Ld6pdn
	 fBkLpR4IOtFl8WL22kbBX+6TGNLehzfXne6ueEf/I6N82ClsNsQ5LSw+CmA8VRA5we
	 jUk8m4KCSMJAXWcYwKDBsr1I4qJgEfTTdsDi2FscuxuG4bFLFLRyjMhI1Y/VGB0C4C
	 qjMtmJ7NK1ttGIfEE9pzKnQKdUiClp0Zn1hOgenEXDiw8oRG8BDa7HpM/uN5x4rb7E
	 7a09FKaolxsgsIcoK1rb+0m07HT3WPO8tGRswMiLrYPWfUlH7Yahk4SPmMgRerYimS
	 GoaD8gW7rRA1A==
Date: Mon, 6 Jan 2025 11:21:11 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 4/4] clk: qcom: Support attaching GDSCs to multiple
 parents
Message-ID: <4mf7lmni57qrj7xperxc4ybr2xy4s765qbo7sgdvsw77y7sxgd@t7ajdyr67q2k>
References: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org>
 <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-4-f15fb405efa5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-4-f15fb405efa5@linaro.org>

On Mon, Dec 30, 2024 at 01:30:21PM +0000, Bryan O'Donoghue wrote:
> When a clock-controller has multiple power-domains we need to attach the
> GDSCs provided by the clock-controller to each of the list of power-domains
> as power subdomains of each of the power-domains respectively.
> 
> GDSCs come in three forms:
> 
> 1. A GDSC which has no parent GDSC in the controller and no child GDSCs.
> 2. A GDSC which has no parent GDSC in the controller and has child GDSCs.
> 3. A child GDSC which derives power from the parent GDSC @ #2.
> 

These are good discussion points, but we're not going to discuss them in
the commit log. Try to squash these "design decisions" as succinctly as
you can.

In particular, establish that GDSCs are just pm-domains and that
"dependencies between GDSCs and other power-domains are described using
the pm-domain hierarchy".

Perhaps I'm oversimplifying it? But in my eyes these cases then becomes
different flavors of the same thing.

> Cases 1 and 2 are "top-level" GDSCs which depend on the power-domains - the
> power-rails attached to the clock-controller to power-on.
> 
> When dtsi::power-domains = <> points to a single power-domain, Linux'
> platform probe code takes care of hooking up the referenced power-domains
> to the clock-controller.
> 
> When dtsi::power-domains = <> points to more than one power-domain we must
> take responsibility to attach the list of power-domains to our
> clock-controller.
> 
> An added complexity is that currently gdsc_enable() and gdsc_disable() do
> not register the top-level GDSCs as power subdomains of the controller's
> power-domains.
> 
> This patch makes the subdomain association between whatever list of
> top-level GDSCs a clock-controller provides and the power-domain list of
> that clock-controller.
> 
> What we don't do here is take responsibility to adjust the voltages on
> those power-rails when ramping clock frequencies - PLL rates - inside of
> the clock-controller.
> 
> That voltage adjustment should be performed by operating-point/performance
> setpoint code in the driver requesting the new frequency.
> 
> There are some questions that it is worth discussing in the commit log:
> 
> 1. Should there be a hierarchy of power-domains in the clock-controller ?
> 
>    In other words if a list of dtsi::power-domains = <pd_a, pd_b, ..>
>    should a specific hierarchy be applied by the gdsc code somehow ?
> 
>    The short answer is no, you must properly represent power-domain
>    dependencies in your dtsi.
> 
>    Do this:
> 
>    pd_a {
> 	compat = "qcom, power-domain-a";
>         power-domains = <&pd_c>;
>    };
> 
>    pd_b {
>         compat = "qcom, power-domain-b";
> 
>    };
> 
>    pd_c {
>         compat = "qcom, power-domain-c";
>    };
> 
>    clock-controller {
>        compat ="qcom, some-clock-controller";
>        power-domains = <&pd_a, &pd_b>;
>    }
> 
>    Not this:
> 
>    pd_a {
> 	compat = "qcom, power-domain-a";
>    };
> 
>    pd_b {
>         compat = "qcom, power-domain-b";
> 
>    };
> 
>    pd_c {
>         compat = "qcom, power-domain-c";
>    };
> 
>    clock-controller {
>        compat ="qcom, some-clock-controller";
>        power-domains = <&pd_c, &pd_a, &pd_b>;
>    }

I'm guessing the desire to point this out comes from previous sources
where this hasn't been the case? Could you perhaps just emphasize the
fact that we should use the hierarchy to describe these relationships,
both within the controller and in the system?

> 
> 2. Should each GDSC inside a clock-controller be attached to each
>    power-domain listed in dtsi::power-domains = <> ?
> 

Exactly what do you mean with "attach" here?

You're making each GDSC a subdomain of each of the clock-controller's
listed power-domains. While not literally being called "attached", this
is what I'm thinking of.

Is there some other way to "attach" a GDSC to these power-domains that
I'm not spotting?

>    In other words should child GDSCs attach to the power-domain list.
> 
>    The answer to this is no. GDSCs which are children of a GDSC within a
>    clock-controller need only attach to the parent GDSC.
> 

Or are you saying that GDSCs with an explicitly defined parent should
attach only to that GDSC and not to the listed power-domains, and that
any votes will trickle through the hierarchy up to the external
power-domains?

If this is the case, can you please rewrite this to make this more
obvious to future readers?

>    With a single power-domain or a list of power-domains either way only
>    the parent/top-level GDSC needs to be a subdomain of the input
>    dtsi::power-domains = <>.
> 
> 3. Should top-level GDSCs inside the clock-controller attach to each
>    power-domain in the clock-controller.
> 
>    Yes a GDSC that has no parent GDSC inside of the clock-controller has an
>    inferred dependency on the power-domains powering the clock-controller.
> 
> 4. Performance states
>    Right now the best information we have is that performance states should
>    be applied to a power-domain list equally.
> 
>    Future implementations may have more detail to differentiate the option
>    to vote for different voltages on different power-domains when setting
>    clock frequencies.
> 
>    Either way setting the performance state of the power-domains for the
>    clock-controller should be represented by operating-point code in the
>    hardware driver which depends on the clocks not in the

s/hardware driver/client drivers/

>    gdsc_enable()/gdsc_disable() path.

Rather than expressing that gdsc_enable()/disable() won't act on the
performance_state, it would be good if the commit message clarifies that
the performance_state will percolate through the pm-domain hierarchy to
those domains that handles state votes.


I think the patch looks good, and I think your commit message capture
the questions/decisions/tradeoffs we've discussed.
Please try to reformulate the message in a more succinct form. I think
you can replace the 4 "questions" with shorter statements about each
aspect of the current solution.

Regards,
Bjorn

> 
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
> index fdedf6dfe7b90c074b200353fc0c2b897863c79f..7687661491f1fd5a3076c839c4f70f430783fc51 100644
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
>  static void gdsc_pm_subdomain_remove(struct gdsc_desc *desc, size_t num)
>  {
>  	struct device *dev = desc->dev;
> @@ -520,6 +550,8 @@ static void gdsc_pm_subdomain_remove(struct gdsc_desc *desc, size_t num)
>  			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
>  		else if (!IS_ERR_OR_NULL(dev->pm_domain))
>  			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> +		else if (desc->pd_list)
> +			gdsc_remove_subdomain_list(desc->pd_list, &scs[i]->pd);
>  	}
>  }
>  
> @@ -575,6 +607,9 @@ int gdsc_register(struct gdsc_desc *desc,
>  			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
>  		else if (!IS_ERR_OR_NULL(dev->pm_domain))
>  			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> +		else if (desc->pd_list)
> +			ret = gdsc_add_subdomain_list(desc->pd_list, &scs[i]->pd);
> +
>  		if (ret)
>  			goto err_pm_subdomain_remove;
>  	}
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

