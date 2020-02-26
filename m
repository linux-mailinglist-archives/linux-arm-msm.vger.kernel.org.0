Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3737916FEAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 13:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgBZMKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 07:10:11 -0500
Received: from foss.arm.com ([217.140.110.172]:35018 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726920AbgBZMKL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 07:10:11 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 935D71FB;
        Wed, 26 Feb 2020 04:10:10 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4486B3FA00;
        Wed, 26 Feb 2020 04:10:09 -0800 (PST)
Date:   Wed, 26 Feb 2020 12:10:07 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Trilok Soni <tsoni@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] firmware: psci: Add support for dt-supplied
 SYSTEM_RESET2 type
Message-ID: <20200226121006.GB21897@lakrids.cambridge.arm.com>
References: <1582577858-12410-1-git-send-email-eberman@codeaurora.org>
 <1582577858-12410-3-git-send-email-eberman@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582577858-12410-3-git-send-email-eberman@codeaurora.org>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 24, 2020 at 12:57:37PM -0800, Elliot Berman wrote:
> Some implementors of PSCI may relax the requirements of the PSCI
> architectural warm reset. In order to comply with PSCI specification, a
> different reset_type value must be used. The alternate PSCI
> SYSTEM_RESET2 may be used in all warm/soft reboot scenarios, replacing
> the architectural warm reset.

As with the binding patch, this sounds like a workaround for a firmware
bug. Can you please elaborate on what exactly your firmware does in this
case?

Thanks,
Mark.

> 
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>
> ---
>  drivers/firmware/psci/psci.c | 22 ++++++++++++++++++----
>  include/uapi/linux/psci.h    |  2 ++
>  2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index 2937d44..8f4609c 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -90,6 +90,8 @@ static u32 psci_function_id[PSCI_FN_MAX];
>  
>  static u32 psci_cpu_suspend_feature;
>  static bool psci_system_reset2_supported;
> +static u32 psci_sys_reset2_reset_param =
> +	PSCI_1_1_SYSTEM_RESET2_SYSTEM_WARM_RESET;
>  
>  static inline bool psci_has_ext_power_state(void)
>  {
> @@ -272,11 +274,10 @@ static void psci_sys_reset(enum reboot_mode reboot_mode, const char *cmd)
>  	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>  	    psci_system_reset2_supported) {
>  		/*
> -		 * reset_type[31] = 0 (architectural)
> -		 * reset_type[30:0] = 0 (SYSTEM_WARM_RESET)
>  		 * cookie = 0 (ignored by the implementation)
>  		 */
> -		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), 0, 0, 0);
> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> +			       psci_sys_reset2_reset_param, 0, 0);
>  	} else {
>  		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
>  	}
> @@ -493,6 +494,7 @@ typedef int (*psci_initcall_t)(const struct device_node *);
>  static int __init psci_0_2_init(struct device_node *np)
>  {
>  	int err;
> +	u32 param;
>  
>  	err = get_set_conduit_method(np);
>  	if (err)
> @@ -505,7 +507,19 @@ static int __init psci_0_2_init(struct device_node *np)
>  	 * can be carried out according to the specific version reported
>  	 * by firmware
>  	 */
> -	return psci_probe();
> +	err = psci_probe();
> +	if (err)
> +		return err;
> +
> +	if (psci_system_reset2_supported &&
> +	    !of_property_read_u32(np, "arm,psci-sys-reset2-param", &param)) {
> +		if ((s32)param > 0)
> +			pr_warn("%08x is an invalid architectural reset type.\n",
> +				param);
> +		psci_sys_reset2_reset_param = param;
> +	}
> +
> +	return 0;
>  }
>  
>  /*
> diff --git a/include/uapi/linux/psci.h b/include/uapi/linux/psci.h
> index 2fcad1d..d786ec8 100644
> --- a/include/uapi/linux/psci.h
> +++ b/include/uapi/linux/psci.h
> @@ -55,6 +55,8 @@
>  #define PSCI_1_0_FN64_SYSTEM_SUSPEND		PSCI_0_2_FN64(14)
>  #define PSCI_1_1_FN64_SYSTEM_RESET2		PSCI_0_2_FN64(18)
>  
> +#define PSCI_1_1_SYSTEM_RESET2_SYSTEM_WARM_RESET	0
> +
>  /* PSCI v0.2 power state encoding for CPU_SUSPEND function */
>  #define PSCI_0_2_POWER_STATE_ID_MASK		0xffff
>  #define PSCI_0_2_POWER_STATE_ID_SHIFT		0
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
