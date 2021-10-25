Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50266438F65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 08:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbhJYG1B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 02:27:01 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:32675 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbhJYG1A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 02:27:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1635143078;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=BxFdtpiqUqg1lLlBuIYjUj5iwU8WtbDWyRSpWR4ys1Q=;
    b=QDASDSknW7i5ud487prm9gIf333Xw+VLNQM00pjJsx2JM4X5VTlPfCecgjXAr+6Iw6
    MbcAae9dKuO+yp5+U3hl9jaZogwdrA2wmnZeOCSZ0FIUSRbqroJfnWc/c2lX0qFv3Tg5
    UUGvxsP26z+BJcxGtRAIlg8iNRQj15xUE3y7SLMimpZgurIetFTWmvfqOBCClX++HuWx
    WV6qAClpG0rjITtvmA0Wna4EI6Di9e2JTMD1EPkEsukm2e1lXs8AjkVZZQWf4bNJjtwm
    g2JM5obOJgLKg+fTQqr6Rw0Uh59Px+gwO1WsbB0SaBKQcRNkZHiTJiZ8rmiPYSllu/Zd
    anTA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK8+86Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id 301038x9P6Ob6NO
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 25 Oct 2021 08:24:37 +0200 (CEST)
Date:   Mon, 25 Oct 2021 08:24:36 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: scm: Don't break compile test on non-ARM
 platforms
Message-ID: <YXZNpLfU0eNbO7ic@gerhold.net>
References: <20211025025816.2937465-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211025025816.2937465-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Oct 24, 2021 at 07:58:16PM -0700, Bjorn Andersson wrote:
> The introduction of __qcom_scm_set_boot_addr_mc() relies on
> cpu_logical_map() and MPIDR_AFFINITY_LEVEL() from smp_plat.h, but only
> ARM and ARM64 has this include file, so the introduction of this
> dependency broke compile testing on e.g. x86_64.
> 
> Make the inclusion of smp_plat.h and the affected function depend on
> ARM || ARM64 to allow the code to still be compiled.
> 
> Fixes: 55845f46df03 ("firmware: qcom: scm: Add support for MC boot address API")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Sorry about this, I have to say I'm rather surprised that qcom_scm can
be compiled at all on x86_64. It's just a wrapper around ARM SMCs that
don't exist on x86_64 either. :D
But knowing how quickly qcom_scm causes compile problems on random
kernel configurations I'm not going to suggest changing that...

So, this looks good to me. Thanks for fixing it. :)

> ---
>  drivers/firmware/qcom_scm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 7dd9e5e10f23..11464f6502be 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -17,7 +17,9 @@
>  #include <linux/reset-controller.h>
>  #include <linux/arm-smccc.h>
>  
> +#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
>  #include <asm/smp_plat.h>
> +#endif
>  
>  #include "qcom_scm.h"
>  
> @@ -262,6 +264,7 @@ static bool __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
>  	return ret ? false : !!res.result[0];
>  }
>  
> +#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
>  static int __qcom_scm_set_boot_addr_mc(void *entry, const cpumask_t *cpus,
>  				       unsigned int flags)
>  {
> @@ -290,6 +293,13 @@ static int __qcom_scm_set_boot_addr_mc(void *entry, const cpumask_t *cpus,
>  
>  	return qcom_scm_call(__scm->dev, &desc, NULL);
>  }
> +#else
> +static inline int __qcom_scm_set_boot_addr_mc(void *entry, const cpumask_t *cpus,
> +					      unsigned int flags)
> +{
> +	return -EINVAL;
> +}
> +#endif
>  
>  static int __qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
>  {
> -- 
> 2.29.2
> 
