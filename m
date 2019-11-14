Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64FC7FCBF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 18:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbfKNRjP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 12:39:15 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:52076 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfKNRjP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 12:39:15 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B2A7F60FF9; Thu, 14 Nov 2019 17:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573753153;
        bh=RPC+2jas2s+k3RFoeRjA2/hYuU9Gn+d5GL6qKdZf9dY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m1zvT6wXxuMOnsA/omGOq7bxZP5u4CDlSPxH/ijFT939KisenUH95k+mV6Qj59E6b
         t3809XLmb+9tteZNHaVzPc6ygS9kRAj9VZksanja0VmjKlBb5ZUy/PouGC1ukSfQ+3
         zwyHw/0gaCtSs+SkjOpgIkEk+Keuy1D7LJFIvz7M=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7B97860DCD;
        Thu, 14 Nov 2019 17:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573753152;
        bh=RPC+2jas2s+k3RFoeRjA2/hYuU9Gn+d5GL6qKdZf9dY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fjT6lIeSx3d+sYc3se784USyc4fzu6Cv+F+9SK3Qwmn99luQw1Q55Mv7gL6reoreR
         0a7yPbyXzwaCbTs4l4ujGSQNji2e9uN0Q2NelAHobdOPnIN3+kYh/XFCRcck2o29mI
         p/sekKnnydc0Knr5/4BI0wEO6gcH3Cenab6C1Vj4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7B97860DCD
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 14 Nov 2019 10:39:09 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Shubhashree Dhar <dhar@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
        hoegsberg@chromium.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org
Subject: Re: [Freedreno] [v1] msm: disp: dpu1: add support to access hw irqs
 regs depending on revision
Message-ID: <20191114173909.GA19503@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Shubhashree Dhar <dhar@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
        hoegsberg@chromium.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org
References: <1573710536-26889-1-git-send-email-dhar@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573710536-26889-1-git-send-email-dhar@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 14, 2019 at 11:18:56AM +0530, Shubhashree Dhar wrote:
> Current code assumes that all the irqs registers offsets can be
> accessed in all the hw revisions; this is not the case for some
> targets that should not access some of the irq registers.
> This change adds the support to selectively remove the irqs that
> are not supported in some of the hw revisions.
> 
> Change-Id: I6052b8237b703a1a9edd53893e04f7bd72223da1
> Signed-off-by: Shubhashree Dhar <dhar@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  22 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   1 +
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c    | 478 ++++++++++++++++++++++
>  5 files changed, 500 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 04c8c44..357e15b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -421,6 +421,7 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>  		.reg_dma_count = 1,
>  		.dma_cfg = sdm845_regdma,
>  		.perf = sdm845_perf_data,
> +		.mdss_irqs[0] = 0x3ff,
>  	};
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index ec76b868..def8a3f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -646,6 +646,7 @@ struct dpu_perf_cfg {
>   * @dma_formats        Supported formats for dma pipe
>   * @cursor_formats     Supported formats for cursor pipe
>   * @vig_formats        Supported formats for vig pipe
> + * @mdss_irqs          Bitmap with the irqs supported by the target
>   */
>  struct dpu_mdss_cfg {
>  	u32 hwversion;
> @@ -684,6 +685,8 @@ struct dpu_mdss_cfg {
>  	struct dpu_format_extended *dma_formats;
>  	struct dpu_format_extended *cursor_formats;
>  	struct dpu_format_extended *vig_formats;
> +
> +	DECLARE_BITMAP(mdss_irqs, BITS_PER_BYTE * sizeof(long));

This is a very round about way of declaring an unsigned long. Do you ever
expect to have more than a long's worth of interrupt bits? If not, then just an
unsigned long mdss_irqs would be the preferred less macro-y way of doing this.

>  };
>  
>  struct dpu_mdss_hw_cfg_handler {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 8bfa7d0..2a3634c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -800,7 +800,8 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
>  		start_idx = reg_idx * 32;
>  		end_idx = start_idx + 32;
>  
> -		if (start_idx >= ARRAY_SIZE(dpu_irq_map) ||
> +		if (!test_bit(reg_idx, &intr->irq_mask) ||
> +			start_idx >= ARRAY_SIZE(dpu_irq_map) ||
>  				end_idx > ARRAY_SIZE(dpu_irq_map)) 

This last one will always be true since end_idx is always 32 bigger than
start_idx. If you add the start_idx check you no longer need the end_idx check.

>  			continue;
>  
> @@ -955,8 +956,11 @@ static int dpu_hw_intr_clear_irqs(struct dpu_hw_intr *intr)
>  	if (!intr)
>  		return -EINVAL;
>  
> -	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++)
> -		DPU_REG_WRITE(&intr->hw, dpu_intr_set[i].clr_off, 0xffffffff);
> +	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
> +		if(test_bit(i, &intr->irq_mask))
> +			DPU_REG_WRITE(&intr->hw,
> +					dpu_intr_set[i].clr_off, 0xffffffff);
> +	}
>  
>  	/* ensure register writes go through */
>  	wmb();
> @@ -971,8 +975,11 @@ static int dpu_hw_intr_disable_irqs(struct dpu_hw_intr *intr)
>  	if (!intr)
>  		return -EINVAL;
>  
> -	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++)
> -		DPU_REG_WRITE(&intr->hw, dpu_intr_set[i].en_off, 0x00000000);
> +	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
> +		if(test_bit(i, &intr->irq_mask))
> +			DPU_REG_WRITE(&intr->hw,
> +					dpu_intr_set[i].en_off, 0x00000000);
> +	}
>  
>  	/* ensure register writes go through */
>  	wmb();
> @@ -991,6 +998,10 @@ static void dpu_hw_intr_get_interrupt_statuses(struct dpu_hw_intr *intr)
>  
>  	spin_lock_irqsave(&intr->irq_lock, irq_flags);
>  	for (i = 0; i < ARRAY_SIZE(dpu_intr_set); i++) {
> +

This extra blank line isn't strictly needed if you don't want it.

> +		if(!test_bit(i, &intr->irq_mask))
> +			continue;
> +
>  		/* Read interrupt status */
>  		intr->save_irq_status[i] = DPU_REG_READ(&intr->hw,
>  				dpu_intr_set[i].status_off);
> @@ -1115,6 +1126,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
>  		return ERR_PTR(-ENOMEM);
>  	}
>  
> +	intr->irq_mask = m->mdss_irqs[0];
>  
>  	return intr;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 4edcf40..fc9c986 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -187,6 +187,7 @@ struct dpu_hw_intr {
>  	u32 *save_irq_status;
>  	u32 irq_idx_tbl_size;
>  	spinlock_t irq_lock;
> +	unsigned long irq_mask;

This plus the chunk above would imply that, no, you never expect more than a
long's worth of interrupt bits.

>  	spin_lock_init(&intr->irq_lock);
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> new file mode 100644
> index 00000000..1bbd40d
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c

Do you mean this file to be in this patch? The commit log doesn't make mention
of it and it doesn't seem to be related.

<snip>

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
