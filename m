Return-Path: <linux-arm-msm+bounces-52226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4964FA6BFC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 17:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADB7D7A8024
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 16:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DAE22AE76;
	Fri, 21 Mar 2025 16:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="OJLKm1cE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8F91DEFC5;
	Fri, 21 Mar 2025 16:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742574026; cv=none; b=nEspUjzhewhcSd+R6OrCPf/eEJSaVH5OcMzTI2NaZVjwz6zZL8LrCpa85uFjXv4wzCxN6JE8wkkpHMojcUGXqM5AX74QJFb2tD1ZxdH4ZjJoTFdiEGIs2NEQaKd1B4vUgr/NEAk+DSfnYczdfwkCJ1CIa9P96VAv4nIe2PrUC7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742574026; c=relaxed/simple;
	bh=pw+m5se+pQEuMCaFj9AWsSaNGo1mpEzijJ6omJch4sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZw8xYc77qLugaTKKbjo0LkF5GzmMjfpHIYLvl+GdbTG+fHw6VcaKgRoOSpkHYG4Q448rBo/9ncAxGR9F5tuBNg+7goZ+BcqYo0pzDpvfdeekMK68sF/R/6R5vfw8q7nWe56eZw/tNnILN5cxKT//4bSuvLZ0hlK95vlLuEUd60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=OJLKm1cE; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4ZK72p0r5hzltM4s;
	Fri, 21 Mar 2025 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1742574016; x=1745166017; bh=9dyI6yv0FfobA2AHnFPAlTAe
	x+wUcJGo91eWOYIZ7lo=; b=OJLKm1cENVXpFRHwXA6qt/2+2Kb/cQQIz7Lc4ZQD
	5cvdfGq4C2wei0I7AY3lc2HgvODlhZ6bsMGL1mUpQGseJI46FLpx6nLaHUPH9ojw
	hJa8OnC+MVaHQyTn1cgmzHHs6QcarLwyPT7dXYC+digMu0+cEvcD8b0Ub3I7Oo13
	buLUy+NPtASuGkwZlwwKzleSh3I/Y775FuZRGaAM8qBhudSN1chrnmkBH9namIKS
	4wTYvsX9c0WUpjufKPwLIyHuXnLciCIy24oWGgDjGpob+1yGohVJ6RnfXXP7pQoY
	upB/iDOvS4R6PfBk+yHR0HBrGEF2Lx4Eeiq039J/lBoe5A==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id GnBwmSn9tA2a; Fri, 21 Mar 2025 16:20:16 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4ZK72c26gLzlschZ;
	Fri, 21 Mar 2025 16:20:06 +0000 (UTC)
Message-ID: <31b46812-72d5-4f9d-b55d-16a6e10afe7d@acm.org>
Date: Fri, 21 Mar 2025 09:20:05 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] ufs: delegate the interrupt service routine to a
 threaded irq handler
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250321-topic-ufs-use-threaded-irq-v1-1-7a55816a4b1d@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250321-topic-ufs-use-threaded-irq-v1-1-7a55816a4b1d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/21/25 9:08 AM, Neil Armstrong wrote:
> On systems with a large number request slots and unavailable MCQ,
> the current design of the interrupt handler can delay handling of
> other subsystems interrupts causing display artifacts, GPU stalls
> or system firmware requests timeouts.
> 
> Since the interrupt routine can take quite some time, it's
> preferable to move it to a threaded handler and leave the
> hard interrupt handler save the status and disable the irq
> until processing is finished in the thread.
> 
> This fixes all encountered issued when running FIO tests
> on the Qualcomm SM8650 platform.
> 
> Example of errors reported on a loaded system:
>   [drm:dpu_encoder_frame_done_timeout:2706] [dpu error]enc32 frame done timeout
>   msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1: hangcheck detected gpu lockup rb 2!
>   msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1:     completed fence: 74285
>   msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1:     submitted fence: 74286
>   Error sending AMC RPMH requests (-110)
> 
> Reported bandwidth is not affected on various tests.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/ufs/core/ufshcd.c | 43 ++++++++++++++++++++++++++++++++++++-------
>   include/ufs/ufshcd.h      |  2 ++
>   2 files changed, 38 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 0534390c2a35d0671156d79a4b1981a257d2fbfa..0fa3cb48ce0e39439afb0f6d334b835d9e496387 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -6974,7 +6974,7 @@ static irqreturn_t ufshcd_sl_intr(struct ufs_hba *hba, u32 intr_status)
>   }
>   
>   /**
> - * ufshcd_intr - Main interrupt service routine
> + * ufshcd_intr - Threaded interrupt service routine
>    * @irq: irq number
>    * @__hba: pointer to adapter instance
>    *
> @@ -6982,7 +6982,7 @@ static irqreturn_t ufshcd_sl_intr(struct ufs_hba *hba, u32 intr_status)
>    *  IRQ_HANDLED - If interrupt is valid
>    *  IRQ_NONE    - If invalid interrupt
>    */
> -static irqreturn_t ufshcd_intr(int irq, void *__hba)
> +static irqreturn_t ufshcd_threaded_intr(int irq, void *__hba)
>   {
>   	u32 intr_status, enabled_intr_status = 0;
>   	irqreturn_t retval = IRQ_NONE;
> @@ -6990,8 +6990,6 @@ static irqreturn_t ufshcd_intr(int irq, void *__hba)
>   	int retries = hba->nutrs;
>   
>   	intr_status = ufshcd_readl(hba, REG_INTERRUPT_STATUS);
> -	hba->ufs_stats.last_intr_status = intr_status;
> -	hba->ufs_stats.last_intr_ts = local_clock();
>   
>   	/*
>   	 * There could be max of hba->nutrs reqs in flight and in worst case
> @@ -7000,8 +6998,7 @@ static irqreturn_t ufshcd_intr(int irq, void *__hba)
>   	 * again in a loop until we process all of the reqs before returning.
>   	 */
>   	while (intr_status && retries--) {
> -		enabled_intr_status =
> -			intr_status & ufshcd_readl(hba, REG_INTERRUPT_ENABLE);
> +		enabled_intr_status = intr_status & hba->intr_en;
>   		ufshcd_writel(hba, intr_status, REG_INTERRUPT_STATUS);
>   		if (enabled_intr_status)
>   			retval |= ufshcd_sl_intr(hba, enabled_intr_status);
> @@ -7020,9 +7017,40 @@ static irqreturn_t ufshcd_intr(int irq, void *__hba)
>   		ufshcd_dump_regs(hba, 0, UFSHCI_REG_SPACE_SIZE, "host_regs: ");
>   	}
>   
> +	ufshcd_writel(hba, hba->intr_en, REG_INTERRUPT_ENABLE);
> +
>   	return retval;
>   }
>   
> +/**
> + * ufshcd_intr - Main interrupt service routine
> + * @irq: irq number
> + * @__hba: pointer to adapter instance
> + *
> + * Return:
> + *  IRQ_WAKE_THREAD - If interrupt is valid
> + *  IRQ_NONE	    - If invalid interrupt
> + */
> +static irqreturn_t ufshcd_intr(int irq, void *__hba)
> +{
> +	u32 intr_status, enabled_intr_status = 0;
> +	irqreturn_t retval = IRQ_NONE;
> +	struct ufs_hba *hba = __hba;
> +	int retries = hba->nutrs;
> +
> +	intr_status = ufshcd_readl(hba, REG_INTERRUPT_STATUS);
> +	hba->ufs_stats.last_intr_status = intr_status;
> +	hba->ufs_stats.last_intr_ts = local_clock();
> +
> +	if (unlikely(!intr_status))
> +		return IRQ_NONE;
> +
> +	hba->intr_en = ufshcd_readl(hba, REG_INTERRUPT_ENABLE);
> +	ufshcd_writel(hba, 0, REG_INTERRUPT_ENABLE);
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
>   static int ufshcd_clear_tm_cmd(struct ufs_hba *hba, int tag)
>   {
>   	int err = 0;
> @@ -10581,7 +10609,8 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
>   	ufshcd_readl(hba, REG_INTERRUPT_ENABLE);
>   
>   	/* IRQ registration */
> -	err = devm_request_irq(dev, irq, ufshcd_intr, IRQF_SHARED, UFSHCD, hba);
> +	err = devm_request_threaded_irq(dev, irq, ufshcd_intr, ufshcd_threaded_intr,
> +					IRQF_SHARED, UFSHCD, hba);
>   	if (err) {
>   		dev_err(hba->dev, "request irq failed\n");
>   		goto out_disable;
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index e3909cc691b2a854a270279901edacaa5c5120d6..03a7216b89fd63c297479422d1213e497ce85d8e 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -893,6 +893,7 @@ enum ufshcd_mcq_opr {
>    * @ufshcd_state: UFSHCD state
>    * @eh_flags: Error handling flags
>    * @intr_mask: Interrupt Mask Bits
> + * @intr_en: Saved Interrupt Enable Bits
>    * @ee_ctrl_mask: Exception event control mask
>    * @ee_drv_mask: Exception event mask for driver
>    * @ee_usr_mask: Exception event mask for user (set via debugfs)
> @@ -1040,6 +1041,7 @@ struct ufs_hba {
>   	enum ufshcd_state ufshcd_state;
>   	u32 eh_flags;
>   	u32 intr_mask;
> +	u32 intr_en;
>   	u16 ee_ctrl_mask;
>   	u16 ee_drv_mask;
>   	u16 ee_usr_mask;

I don't like this patch because:
- It reduces performance (IOPS) for systems on which MCQ is supported
   and enabled. Please only use threaded interrupts if MCQ is not used.
- It introduces race conditions on the REG_INTERRUPT_ENABLE register.
   There are plenty of ufshcd_(enable|disable)_intr() calls in the UFS
   driver. Please remove all code that modifies REG_INTERRUPT_ENABLE
   from this patch.
- Instead of retaining hba->ufs_stats.last_intr_status and
   hba->ufs_stats.last_intr_ts, please remove both members and also
   the debug code that reports the values of these member variables.
   Please also remove hba->intr_en.

Thanks,

Bart.

