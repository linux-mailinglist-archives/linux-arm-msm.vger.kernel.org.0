Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 573C4398612
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 12:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbhFBKQH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 06:16:07 -0400
Received: from foss.arm.com ([217.140.110.172]:40386 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229675AbhFBKQH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 06:16:07 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63BBE1042;
        Wed,  2 Jun 2021 03:14:24 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.31.212])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEF0B3F73D;
        Wed,  2 Jun 2021 03:14:22 -0700 (PDT)
Date:   Wed, 2 Jun 2021 11:14:13 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     will@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] arm_pmu: move to use request_irq by IRQF_NO_AUTOEN
 flag
Message-ID: <20210602101413.GA12753@C02TD0UTHF1T.local>
References: <1622595642-61678-1-git-send-email-tiantao6@hisilicon.com>
 <1622595642-61678-2-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622595642-61678-2-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 02, 2021 at 09:00:41AM +0800, Tian Tao wrote:
> request_irq() after setting IRQ_NOAUTOEN as below
> irq_set_status_flags(irq, IRQ_NOAUTOEN);
> request_irq(dev, irq...);
> can be replaced by request_irq() with IRQF_NO_AUTOEN flag.
> 
> this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
> is being merged: https://lore.kernel.org/patchwork/patch/1388765/
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

I see that the patch above was merged in v5.13-rc1 as commit:

  cbe16f35bee6880b ("genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()")

With that in mind:

Acked-by: Mark Rutland <mark.rutland@arm.com>

... I expect Will will pick this up.

Thanks,
Mark.

> ---
>  drivers/perf/arm_pmu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index e57b348..eb3a802 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -644,11 +644,9 @@ int armpmu_request_irq(int irq, int cpu)
>  		}
>  
>  		irq_flags = IRQF_PERCPU |
> -			    IRQF_NOBALANCING |
> +			    IRQF_NOBALANCING | IRQF_NO_AUTOEN |
>  			    IRQF_NO_THREAD;
>  
> -		irq_set_status_flags(irq, IRQ_NOAUTOEN);
> -
>  		err = request_nmi(irq, handler, irq_flags, "arm-pmu",
>  				  per_cpu_ptr(&cpu_armpmu, cpu));
>  
> -- 
> 2.7.4
> 
