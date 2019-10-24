Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE47E36C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2019 17:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503308AbfJXPgl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Oct 2019 11:36:41 -0400
Received: from foss.arm.com ([217.140.110.172]:54640 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503224AbfJXPgl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Oct 2019 11:36:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A6EB31F;
        Thu, 24 Oct 2019 08:36:25 -0700 (PDT)
Received: from bogus (e107155-lin.cambridge.arm.com [10.1.196.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B1A03F71F;
        Thu, 24 Oct 2019 08:36:23 -0700 (PDT)
Date:   Thu, 24 Oct 2019 16:36:21 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lina Iyer <ilina@codeaurora.org>, linux-pm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Kevin Hilman <khilman@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 06/13] cpuidle: psci: Simplify OF parsing of CPU idle
 state nodes
Message-ID: <20191024153621.GE11467@bogus>
References: <20191010113937.15962-1-ulf.hansson@linaro.org>
 <20191010113937.15962-7-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010113937.15962-7-ulf.hansson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 10, 2019 at 01:39:30PM +0200, Ulf Hansson wrote:
> Iterating through the idle state nodes in DT, to find out the number of
> states that needs to be allocated is unnecessary, as it has already been
> done from dt_init_idle_driver(). Therefore, drop the iteration and use the
> number we already have at hand.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/cpuidle/cpuidle-psci.c | 33 ++++++++++++++++-----------------
>  1 file changed, 16 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> index 2e91c8d6c211..1195a1056139 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -73,28 +73,22 @@ static int __init psci_dt_parse_state_node(struct device_node *np, u32 *state)
>  	return 0;
>  }
>
> -static int __init psci_dt_cpu_init_idle(struct device_node *cpu_node, int cpu)
> +static int __init psci_dt_cpu_init_idle(struct device_node *cpu_node,
> +				unsigned int state_nodes, int cpu)

[super nit] Too much in the beginning of the patch to not notice this ;)
May need some '(' alignment here and other places in general.

>  {
> -	int i, ret = 0, count = 0;
> +	int i, ret = 0;
>  	u32 *psci_states;
>  	struct device_node *state_node;
>
> -	/* Count idle states */
> -	while ((state_node = of_parse_phandle(cpu_node, "cpu-idle-states",
> -					      count))) {
> -		count++;
> -		of_node_put(state_node);
> -	}
> -
> -	if (!count)
> -		return -ENODEV;
> -
> -	psci_states = kcalloc(count, sizeof(*psci_states), GFP_KERNEL);
> +	psci_states = kcalloc(state_nodes, sizeof(*psci_states), GFP_KERNEL);
>  	if (!psci_states)
>  		return -ENOMEM;
>
> -	for (i = 0; i < count; i++) {
> +	for (i = 0; i < state_nodes; i++) {
>  		state_node = of_parse_phandle(cpu_node, "cpu-idle-states", i);

Can we move above to use of_get_cpu_state_node ? Since it also handles
domain-idle-states.

> +		if (!state_node)
> +			break;
> +
>  		ret = psci_dt_parse_state_node(state_node, &psci_states[i]);
>  		of_node_put(state_node);
>
> @@ -104,6 +98,11 @@ static int __init psci_dt_cpu_init_idle(struct device_node *cpu_node, int cpu)
>  		pr_debug("psci-power-state %#x index %d\n", psci_states[i], i);
>  	}
>
> +	if (i != state_nodes) {
> +		ret = -ENODEV;
> +		goto free_mem;
> +	}
> +
>  	/* Idle states parsed correctly, initialize per-cpu pointer */
>  	per_cpu(psci_power_state, cpu) = psci_states;
>  	return 0;
> @@ -113,7 +112,7 @@ static int __init psci_dt_cpu_init_idle(struct device_node *cpu_node, int cpu)
>  	return ret;
>  }
>
> -static __init int psci_cpu_init_idle(unsigned int cpu)
> +static __init int psci_cpu_init_idle(unsigned int cpu, unsigned int state_nodes)

Does it make sense to rename it as state_count or something similar ?
And it may need + 1 once we add wfi also as entry as suggested by
Lorenzo.

--
Regards,
Sudeep
