Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08ED519011C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 23:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbgCWWdG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 18:33:06 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35849 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbgCWWdG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 18:33:06 -0400
Received: by mail-pg1-f195.google.com with SMTP id j29so1076226pgl.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2020 15:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0+ekX362XTPZJu3MhQATXIXqUXtG5s7CcnngEAL+Izo=;
        b=b1NZ3QUpB8kyqAwX+eyh8GUPAXNDdOo1fCa5qf2EFSFPVbJdg07sptzq6SiNSW34i5
         ZWmyQbOPpGEoDsMvWnvurtNfNzkCUyns53hEoX3dawG18/5impvl8lZn5WXph6sSYxA8
         jm04jXIkWWISgkibF1MGcD4GUIygaajwRfRxRQoYb421YVaARMC13jM/IlQCMSuMsY91
         Azu/HDfOmz33wfgnx4n7F8dFgSNDMnsJD1XjNMbDDueKcb6MNqCPk8fC/X9RRFeGrgKF
         s1D3IWrT7WQO4jO5rzwukZcpKmhpsS13Aby/O2uyxX96wlFbaVOKsVs/8BUrsVU97CSQ
         n7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0+ekX362XTPZJu3MhQATXIXqUXtG5s7CcnngEAL+Izo=;
        b=JhUCasi56kg8EFcEuy8InFJ0vV+D2Ed3zuLiUErFUUucKuu+URfeF/y4F8/SyF7KyJ
         dxQvkUoAN8p/SRjU5U9Vn3lLyxI9ys1K+RuBNS1rPYj4SC+Fqg15ehynY+ijKqb7dut0
         ITVSqcqHVCCLrRRJqkNpRrBDPBuKngMeeWMKds4UEMr+ZCATAedUf7uUVtX/wKQJSJKl
         vSrO4Qw9lxzEBoGF0u2z5YoCLMQnluY3SuzigRTXaFf7foT+kFz3q0mj5hFM1fIqJ+Rv
         /tsQpx+tHuUjMIjqhQKZc52gW1dKmvz8THTlh/PMnmltm0DfANJgFWeI/r7HGAoo4l6M
         Zvzw==
X-Gm-Message-State: ANhLgQ1OSQFG80rFAi01biAV1EPHf9I4LYa3UW6h+QiJu8PawUM5/ftA
        ylODSf5jvDhsb1LfSkQV6yMgPx/pABE=
X-Google-Smtp-Source: ADFU+vtefTwL6Il0Xt8K5zlmPRXAiFzgLNisLSnIcnujFjC7yBzql5SiSmblDDlkqMGnLglZXAPmpA==
X-Received: by 2002:a63:4912:: with SMTP id w18mr23539999pga.122.1585002784637;
        Mon, 23 Mar 2020 15:33:04 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id e9sm14427742pfl.179.2020.03.23.15.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 15:33:04 -0700 (PDT)
Date:   Mon, 23 Mar 2020 16:33:02 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] remoteproc: Introduce "panic" callback in ops
Message-ID: <20200323223302.GC30464@xps15>
References: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
 <20200310063817.3344712-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310063817.3344712-3-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 09, 2020 at 11:38:15PM -0700, Bjorn Andersson wrote:
> Introduce generic support for handling kernel panics in remoteproc
> drivers, in order to allow operations needed for aiding in post mortem
> system debugging, such as flushing caches etc.
> 
> The function can return a number of milliseconds needed by the remote to
> "settle" and the core will wait the longest returned duration before
> returning from the panic handler.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Change since v3:
> - Migrate from mutex_trylock() to using RCU
> - Turned the timeout to unsigned long
> 
>  drivers/remoteproc/remoteproc_core.c | 44 ++++++++++++++++++++++++++++
>  include/linux/remoteproc.h           |  3 ++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f0a77c30c6b1..2024a98930bf 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -16,6 +16,7 @@
>  
>  #define pr_fmt(fmt)    "%s: " fmt, __func__
>  
> +#include <linux/delay.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/device.h>
> @@ -43,6 +44,7 @@
>  
>  static DEFINE_MUTEX(rproc_list_mutex);
>  static LIST_HEAD(rproc_list);
> +static struct notifier_block rproc_panic_nb;
>  
>  typedef int (*rproc_handle_resource_t)(struct rproc *rproc,
>  				 void *, int offset, int avail);
> @@ -2219,10 +2221,51 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>  }
>  EXPORT_SYMBOL(rproc_report_crash);
>  
> +static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
> +			       void *ptr)
> +{
> +	unsigned int longest = 0;
> +	struct rproc *rproc;
> +	unsigned int d;
> +
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(rproc, &rproc_list, node) {
> +		if (!rproc->ops->panic || rproc->state != RPROC_RUNNING)
> +			continue;
> +
> +		d = rproc->ops->panic(rproc);
> +		longest = max(longest, d);
> +	}
> +	rcu_read_unlock();
> +
> +	/*
> +	 * Delay for the longest requested duration before returning.
> +	 * This can be used by the remoteproc drivers to give the remote
> +	 * processor time to perform any requested operations (such as flush
> +	 * caches), where means for signalling the Linux side isn't available

There is a problem with the above sentence.

> +	 * while in panic.
> +	 */
> +	mdelay(longest);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static void __init rproc_init_panic(void)
> +{
> +	rproc_panic_nb.notifier_call = rproc_panic_handler;
> +	atomic_notifier_chain_register(&panic_notifier_list, &rproc_panic_nb);
> +}
> +
> +static void __exit rproc_exit_panic(void)
> +{
> +	atomic_notifier_chain_unregister(&panic_notifier_list, &rproc_panic_nb);
> +}
> +
>  static int __init remoteproc_init(void)
>  {
>  	rproc_init_sysfs();
>  	rproc_init_debugfs();
> +	rproc_init_panic();
>  
>  	return 0;
>  }
> @@ -2232,6 +2275,7 @@ static void __exit remoteproc_exit(void)
>  {
>  	ida_destroy(&rproc_dev_index);
>  
> +	rproc_exit_panic();
>  	rproc_exit_debugfs();
>  	rproc_exit_sysfs();
>  }
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 16ad66683ad0..5959d6247dc0 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -369,6 +369,8 @@ enum rsc_handling_status {
>   *			expects to find it
>   * @sanity_check:	sanity check the fw image
>   * @get_boot_addr:	get boot address to entry point specified in firmware
> + * @panic:	optional callback to react to system panic, core will delay
> + *		panic at least the returned number of milliseconds
>   */
>  struct rproc_ops {
>  	int (*start)(struct rproc *rproc);
> @@ -383,6 +385,7 @@ struct rproc_ops {
>  	int (*load)(struct rproc *rproc, const struct firmware *fw);
>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
>  	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> +	unsigned long (*panic)(struct rproc *rproc);
>  };
>  
>  /**
> -- 
> 2.24.0
> 
