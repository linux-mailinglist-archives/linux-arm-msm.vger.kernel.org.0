Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C671A7B7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 14:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502383AbgDNMzm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 08:55:42 -0400
Received: from mga09.intel.com ([134.134.136.24]:61364 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502340AbgDNMzk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 08:55:40 -0400
IronPort-SDR: hMoVI6hEo1ARLEjvoUHwDPYkzzWIEIr5qcuzpgoEkT0MMSZPbzNNbM8tiyeInL8cxdCqAI13eA
 lgUFKkMQGwbg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 05:55:39 -0700
IronPort-SDR: diMMi4QqTqFKA5bJPJZ/exdxzAePKcr19ME8m96/fIUeRLLyglld6JKCFMfuF7xh/Nlpq/A1yt
 4TaulNDIFepg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; 
   d="scan'208";a="453526355"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.87]) ([10.237.72.87])
  by fmsmga005.fm.intel.com with ESMTP; 14 Apr 2020 05:55:35 -0700
Subject: Re: [PATCH] mmc: cqhci: Avoid false "cqhci: CQE stuck on" by not
 open-coding timeout loop
To:     Douglas Anderson <dianders@chromium.org>,
        Ritesh Harjani <riteshh@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Konstantin Dorfman <kdorfman@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20200413162717.1.Idece266f5c8793193b57a1ddb1066d030c6af8e0@changeid>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <e3806686-8a86-59b6-0497-04d02ced40f3@intel.com>
Date:   Tue, 14 Apr 2020 15:54:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200413162717.1.Idece266f5c8793193b57a1ddb1066d030c6af8e0@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/04/20 2:27 am, Douglas Anderson wrote:
> Open-coding a timeout loop invariably leads to errors with handling
> the timeout properly in one corner case or another.  In the case of
> cqhci we might report "CQE stuck on" even if it wasn't stuck on.
> You'd just need this sequence of events to happen in cqhci_off():
> 
> 1. Call ktime_get().
> 2. Something happens to interrupt the CPU for > 100 us (context switch
>    or interrupt).
> 3. Check time and; set "timed_out" to true since > 100 us.
> 4. Read CQHCI_CTL.
> 5. Both "reg & CQHCI_HALT" and "timed_out" are true, so break.
> 6. Since "timed_out" is true, falsely print the error message.
> 
> Rather than fixing the polling loop, use readx_poll_timeout() like
> many people do.  This has been time tested to handle the corner cases.
> 
> Fixes: a4080225f51d ("mmc: cqhci: support for command queue enabled host")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>


> ---
> 
>  drivers/mmc/host/cqhci.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mmc/host/cqhci.c b/drivers/mmc/host/cqhci.c
> index c2239ee2c0ef..75934f3c117e 100644
> --- a/drivers/mmc/host/cqhci.c
> +++ b/drivers/mmc/host/cqhci.c
> @@ -5,6 +5,7 @@
>  #include <linux/delay.h>
>  #include <linux/highmem.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/slab.h>
> @@ -349,12 +350,16 @@ static int cqhci_enable(struct mmc_host *mmc, struct mmc_card *card)
>  /* CQHCI is idle and should halt immediately, so set a small timeout */
>  #define CQHCI_OFF_TIMEOUT 100
>  
> +static u32 cqhci_read_ctl(struct cqhci_host *cq_host)
> +{
> +	return cqhci_readl(cq_host, CQHCI_CTL);
> +}
> +
>  static void cqhci_off(struct mmc_host *mmc)
>  {
>  	struct cqhci_host *cq_host = mmc->cqe_private;
> -	ktime_t timeout;
> -	bool timed_out;
>  	u32 reg;
> +	int err;
>  
>  	if (!cq_host->enabled || !mmc->cqe_on || cq_host->recovery_halt)
>  		return;
> @@ -364,15 +369,9 @@ static void cqhci_off(struct mmc_host *mmc)
>  
>  	cqhci_writel(cq_host, CQHCI_HALT, CQHCI_CTL);
>  
> -	timeout = ktime_add_us(ktime_get(), CQHCI_OFF_TIMEOUT);
> -	while (1) {
> -		timed_out = ktime_compare(ktime_get(), timeout) > 0;
> -		reg = cqhci_readl(cq_host, CQHCI_CTL);
> -		if ((reg & CQHCI_HALT) || timed_out)
> -			break;
> -	}
> -
> -	if (timed_out)
> +	err = readx_poll_timeout(cqhci_read_ctl, cq_host, reg,
> +				 reg & CQHCI_HALT, 0, CQHCI_OFF_TIMEOUT);
> +	if (err < 0)
>  		pr_err("%s: cqhci: CQE stuck on\n", mmc_hostname(mmc));
>  	else
>  		pr_debug("%s: cqhci: CQE off\n", mmc_hostname(mmc));
> 

