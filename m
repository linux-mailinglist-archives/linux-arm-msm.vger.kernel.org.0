Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB92915C675
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 17:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgBMQAu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 11:00:50 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:35790 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729065AbgBMQAt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 11:00:49 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01DFmigN024413;
        Thu, 13 Feb 2020 17:00:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=DYnVX283FjeehaiMYw7D2LGyBDeji4OjGpp51jTXiO4=;
 b=S/8jWHIUylpqJEa1qXlj6F2AcCbNxY15hZ1G7c+8gejvbkbJG7D+dNDLMyoCN+cnymgH
 pz2TzUc21fvajmkGbLuVoBcJ45xUdslz88swYSif12pr81hnMAU386FFq1gx/9QSUcC4
 oYG3+WRMUv+J9FJ/OPfbSvPt9PgPpm4Tr5f1V7s8RdkFdVAY/6Z9ZYhYyM77+/iCw+FX
 YuAzQX2efOZHkbjqDz0/FRADmazI2FMKxKMIf22tGvFW06yP970g8wSECrjEYNZOMEJL
 hHxqAAi2DCbWN7e/m8PoEUIehy8QFOIIkT9y6ItZwmCfaamD7PKYMTrY3oZwKzWBBLvm OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y1ufhpae8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Feb 2020 17:00:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8CDAB100034;
        Thu, 13 Feb 2020 17:00:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 714FE2BAEF4;
        Thu, 13 Feb 2020 17:00:37 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.46) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Feb
 2020 17:00:36 +0100
Subject: Re: [PATCH v3 6/8] remoteproc: Introduce "panic" callback in ops
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
CC:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
 <20200211005059.1377279-7-bjorn.andersson@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <d40e2d7a-19ae-0acf-dc73-f2edb8cb3c32@st.com>
Date:   Thu, 13 Feb 2020 17:00:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211005059.1377279-7-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-13_05:2020-02-12,2020-02-13 signatures=0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/11/20 1:50 AM, Bjorn Andersson wrote:
> Introduce a "panic" function in the remoteproc ops table, to allow
> remoteproc instances to perform operations needed in order to aid in
> post mortem system debugging, such as flushing caches etc, when the
> kernel panics. The function can return a number of milliseconds needed
> by the remote to "settle" and the core will wait the longest returned
> duration before returning from the panic handler.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - Replace per-rproc notifier callback with one generic
> - Move the mdelay() from the individual drivers to the core and sleep the
>   longest returned duration. Drivers that doesn't need a delay can return 0.
> - Unregister the notifier on exit
> 
>  drivers/remoteproc/remoteproc_core.c | 46 ++++++++++++++++++++++++++++
>  include/linux/remoteproc.h           |  3 ++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 097f33e4f1f3..8b6932027d36 100644
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
> @@ -2216,10 +2218,53 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>  }
>  EXPORT_SYMBOL(rproc_report_crash);
>  
> +static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
> +			       void *ptr)
> +{
> +	unsigned int longest = 0;
> +	struct rproc *rproc;
> +	unsigned int d;
> +	int locked;
> +
> +	locked = mutex_trylock(&rproc_list_mutex);
> +	if (!locked) {
> +		pr_err("Failed to acquire rproc list lock, won't call panic functions\n");
> +		return NOTIFY_DONE;
> +	}
As consequence the panic is not handled for all rproc instance if the mutex is locked.
it seems to me that the first solution with the delay side effect is more safety...

> +
> +	list_for_each_entry(rproc, &rproc_list, node) {
> +		if (!rproc->ops->panic || rproc->state != RPROC_RUNNING)
> +			continue;
> +
> +		d = rproc->ops->panic(rproc);
> +		if (d > longest)
> +			longest = d;
> +	}
> +
> +	mutex_unlock(&rproc_list_mutex);
> +
> +	/* Delay panic for the longest requested duration */
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
> @@ -2229,6 +2274,7 @@ static void __exit remoteproc_exit(void)
>  {
>  	ida_destroy(&rproc_dev_index);
>  
> +	rproc_exit_panic();
>  	rproc_exit_debugfs();
>  	rproc_exit_sysfs();
>  }
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 16ad66683ad0..14f05f26cbcd 100644
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
> +	unsigned int (*panic)(struct rproc *rproc);
>  };
>  
>  /**
> 
