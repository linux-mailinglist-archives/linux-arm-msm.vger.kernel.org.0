Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD9818CD6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2020 13:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgCTMES (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 08:04:18 -0400
Received: from foss.arm.com ([217.140.110.172]:48142 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726893AbgCTMER (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 08:04:17 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7670131B;
        Fri, 20 Mar 2020 05:04:17 -0700 (PDT)
Received: from C02TD0UTHF1T.local (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 340313F85E;
        Fri, 20 Mar 2020 05:04:15 -0700 (PDT)
Date:   Fri, 20 Mar 2020 12:04:12 +0000
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
Subject: Re: [PATCH v3 2/3] firmware: psci: Add support for dt-supplied
 SYSTEM_RESET2 type
Message-ID: <20200320120412.GB36658@C02TD0UTHF1T.local>
References: <1583435129-31356-1-git-send-email-eberman@codeaurora.org>
 <1583435129-31356-3-git-send-email-eberman@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583435129-31356-3-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 05, 2020 at 11:05:28AM -0800, Elliot Berman wrote:
> Some implementors of PSCI may wish to use a different reset type than
> SYSTEM_WARM_RESET. For instance, Qualcomm SoCs support an alternate
> reset_type which may be used in more warm reboot scenarios than
> SYSTEM_WARM_RESET permits (e.g. to reboot into recovery mode).
> 
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>

I think we need to discuss the expected semantics on patch 1, and as
things stand, I do not want to take this patch until we understand and
agree to how things should behave.

Thanks,
Mark.

> ---
>  drivers/firmware/psci/psci.c | 21 +++++++++++++++++----
>  include/uapi/linux/psci.h    |  5 +++++
>  2 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index 2937d44..43fe3af 100644
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
> @@ -505,7 +507,18 @@ static int __init psci_0_2_init(struct device_node *np)
>  	 * can be carried out according to the specific version reported
>  	 * by firmware
>  	 */
> -	return psci_probe();
> +	err = psci_probe();
> +	if (err)
> +		return err;
> +
> +	if (psci_system_reset2_supported &&
> +	    !of_property_read_u32(np, "arm,psci-sys-reset2-vendor-param", &param)) {
> +		psci_sys_reset2_reset_param = param |
> +			(PSCI_1_1_SYSTEM_RESET2_OWNER_VENDOR <<
> +			 PSCI_1_1_SYSTEM_RESET2_OWNER_SHIFT);
> +	}
> +
> +	return 0;
>  }
>  
>  /*
> diff --git a/include/uapi/linux/psci.h b/include/uapi/linux/psci.h
> index 2fcad1d..0829175 100644
> --- a/include/uapi/linux/psci.h
> +++ b/include/uapi/linux/psci.h
> @@ -55,6 +55,11 @@
>  #define PSCI_1_0_FN64_SYSTEM_SUSPEND		PSCI_0_2_FN64(14)
>  #define PSCI_1_1_FN64_SYSTEM_RESET2		PSCI_0_2_FN64(18)
>  
> +#define PSCI_1_1_SYSTEM_RESET2_OWNER_SHIFT		31
> +#define PSCI_1_1_SYSTEM_RESET2_OWNER_ARCH		0
> +#define PSCI_1_1_SYSTEM_RESET2_OWNER_VENDOR		1
> +#define PSCI_1_1_SYSTEM_RESET2_SYSTEM_WARM_RESET	0
> +
>  /* PSCI v0.2 power state encoding for CPU_SUSPEND function */
>  #define PSCI_0_2_POWER_STATE_ID_MASK		0xffff
>  #define PSCI_0_2_POWER_STATE_ID_SHIFT		0
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
