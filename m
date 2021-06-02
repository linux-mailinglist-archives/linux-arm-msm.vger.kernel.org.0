Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B16E039861C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 12:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhFBKRs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 06:17:48 -0400
Received: from foss.arm.com ([217.140.110.172]:40432 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229524AbhFBKRs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 06:17:48 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 437371042;
        Wed,  2 Jun 2021 03:16:05 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.31.212])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 955503F73D;
        Wed,  2 Jun 2021 03:16:03 -0700 (PDT)
Date:   Wed, 2 Jun 2021 11:16:00 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     will@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] perf: qcom_l2_pmu: move to use request_irq by
 IRQF_NO_AUTOEN flag
Message-ID: <20210602101600.GB12753@C02TD0UTHF1T.local>
References: <1622595642-61678-1-git-send-email-tiantao6@hisilicon.com>
 <1622595642-61678-3-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622595642-61678-3-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 02, 2021 at 09:00:42AM +0800, Tian Tao wrote:
> request_irq() after setting IRQ_NOAUTOEN as below
> irq_set_status_flags(irq, IRQ_NOAUTOEN); request_irq(dev, irq...); can
> be replaced by request_irq() with IRQF_NO_AUTOEN flag.
> 
> this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
> is being merged: https://lore.kernel.org/patchwork/patch/1388765/
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

As with patch 1, I see that the patch above was merged in v5.13-rc1 as commit:

  cbe16f35bee6880b ("genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()")

With that in mind:

Acked-by: Mark Rutland <mark.rutland@arm.com>

I expect Will will pick this up.

Thanks,
Mark.

> ---
>  drivers/perf/qcom_l2_pmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/qcom_l2_pmu.c b/drivers/perf/qcom_l2_pmu.c
> index fc54a80..b60e301 100644
> --- a/drivers/perf/qcom_l2_pmu.c
> +++ b/drivers/perf/qcom_l2_pmu.c
> @@ -869,14 +869,14 @@ static int l2_cache_pmu_probe_cluster(struct device *dev, void *data)
>  	irq = platform_get_irq(sdev, 0);
>  	if (irq < 0)
>  		return irq;
> -	irq_set_status_flags(irq, IRQ_NOAUTOEN);
>  	cluster->irq = irq;
>  
>  	cluster->l2cache_pmu = l2cache_pmu;
>  	cluster->on_cpu = -1;
>  
>  	err = devm_request_irq(&pdev->dev, irq, l2_cache_handle_irq,
> -			       IRQF_NOBALANCING | IRQF_NO_THREAD,
> +			       IRQF_NOBALANCING | IRQF_NO_THREAD |
> +			       IRQF_NO_AUTOEN,
>  			       "l2-cache-pmu", cluster);
>  	if (err) {
>  		dev_err(&pdev->dev,
> -- 
> 2.7.4
> 
