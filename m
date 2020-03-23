Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79DBF190112
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 23:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgCWW3U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 18:29:20 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:33859 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbgCWW3T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 18:29:19 -0400
Received: by mail-pj1-f66.google.com with SMTP id q16so450929pje.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2020 15:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DzC9W/xv9G0mvkqS7wIEtwwe0msHpsyFnVKkJbuUO4o=;
        b=RRAMMEbw0WzP6ie3WUj3bXGLHVWJ4tqcEZ35ZByVEJ5uPEWhBPBznkXE4LPsceL+xj
         5gbK2D/L/3F239ZhijvA4aBuJsRqMo/D8YGfO46rqPIHrvHudE7r4ZrohelL4JJZjG/q
         EtbRVQvhNWrOrcuPHTepVgKydz1UIvPKb/fGyR7WEItqPyiAA8Z42gzUPcslJCocEL1D
         cRKtbo54OWTzl6zuu9BKzayiCoAmk3FWrtP+E7h7hz3zjjAvQFAhK7JMki7tqqBpw7f9
         UCzO3W9WJhP50lsL8LmFDzIJRyZfGV9g5YT+mXl6vziNcStdBoPgcPkxz2FQ7IXLw4Zs
         IpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DzC9W/xv9G0mvkqS7wIEtwwe0msHpsyFnVKkJbuUO4o=;
        b=dtO9fAQmxul+Baz+qKDXxg2zrr/N0HdAj4zZLZshBJWpDXoXfPb8PkJobtOfg1WO7e
         TEKXXf4tIbCougDUhlv/Fa45DEpnCQjfQ10Y8tTmhhMKuIQ+4YYVopVqMvJj4nIO8IYK
         NRvhQp3DNY3ML+E9gGp1rgBd0EcM+3C2VrppLLBeCfPmN+jPKRsC+R6MTiVwQNtemRUS
         7lyc2n2zszDHdkWQpOQnqwzUYGYn8K7U2vE8OplTYcNTOCNZ9LcuJhu9qfSrv53NOWpW
         dD9nn2nG4xBqwkq1612Ta4zpdH4aXd65cMYhXCgxkVqa7gVJMJ56/ySI8+qVtTO0WQan
         QjHg==
X-Gm-Message-State: ANhLgQ1ahIbhoEQX/zT+BOrm7W8RAEAOxAKsD7/Zcbyk/Y5gE8KMmsue
        ND7GMT2CGXmwBU3C5Kz5KwkUgg==
X-Google-Smtp-Source: ADFU+vsVn86V0nTSOc3nrWDYcJKh13+JDnpO+YGzVzsSQe0GKLfpodxZJmr0s+/lkTqlRudDTZm8Xw==
X-Received: by 2002:a17:90a:9b06:: with SMTP id f6mr1723653pjp.76.1585002556593;
        Mon, 23 Mar 2020 15:29:16 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x70sm13119417pgd.37.2020.03.23.15.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 15:29:16 -0700 (PDT)
Date:   Mon, 23 Mar 2020 16:29:14 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] remoteproc: Introduce "panic" callback in ops
Message-ID: <20200323222914.GB30464@xps15>
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

To do things correctly rproc->state would need to be protected by the
rproc->mutex, which would violate RCU's rule of not blocking inside a read-side
critical section.  And going back to using the rproc_list_mutex as in your
previous version would likely set off the lockdep mechanic quickly.   

I don't have a solution, just noting that a potential race does exist.  On the
flip side consequences are minimal.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

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
