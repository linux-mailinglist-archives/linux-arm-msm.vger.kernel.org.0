Return-Path: <linux-arm-msm+bounces-52636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D3BA7313E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 12:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23A343A59DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 11:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648071F5608;
	Thu, 27 Mar 2025 11:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="JpIE6Y+1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D87E82899;
	Thu, 27 Mar 2025 11:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743076598; cv=none; b=ctbC3h1/duG9EQRNdMPh6JHMcInOHUDwMvYZU40zPHszmRjQIdQIwuZg0shXzQgm21Xq3tPPyMTIIaZhzELxo4d1pClkl3k4pDdoCZAIEwVoXbWtM1lZFKRWDqzys9GgiOIFwXTXLrOujCcnpR6VQV89PM+ipgiQrwujcT30Zsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743076598; c=relaxed/simple;
	bh=JqNoGpDZMpdGpjjIIyFPNugOaRil30Ig20t2hFZZh14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p5fZ1clpzMIxKCyjX6ADPDH46O8Kpb5/mn+NuTgugC5Skms0kuLsCzuZklm5li+P6Oj34deNJzMGna7PLO2onPfKrCaSDU+cNU6ifCvavpecie4pqB9Mae/3EzLsQm4vM0vrzpPa2tobQeI5iPdGC5q08AV8hWC4dTjErZZbuLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=JpIE6Y+1; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4ZNhvl2ptHzlpkbG;
	Thu, 27 Mar 2025 11:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1743076593; x=1745668594; bh=J0svyj8py/sA2SHp7NuyHlYK
	G4FlhF/w8aZRngyNxsE=; b=JpIE6Y+1HUvxFVMemZEuWYW4X/so/27rXT3IT70e
	lV0yEebRHFGawFJTg0ppYV82orvT3adfszCfperJv+acpk6lCc9TTWMes4h2+Hm0
	/NO/+s4DqC7MtyNj94jI5OPOCVgrMH7f6LIwJHNHBilTGnQwCn9ikiBGmp5xLKcd
	Ac19199lHXSI/8qS5nuEmegU+qlrO/bxUyzTte+v3E5LwdY85Nwm3kRUuCZC3sJg
	484sKcmB6eNoL6Chz9O0ZK6Ro6CNVzeIF9cDEYUMeMjHGItA6ogfbgua8FWIP8CC
	0a3jJ1OdphLM3cYCW03YOGc6PwmT9hfrqSoHavZVFl9B3g==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id qZSZvcHf-mBU; Thu, 27 Mar 2025 11:56:33 +0000 (UTC)
Received: from [10.47.187.167] (unknown [91.223.100.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4ZNhvW0m0Yzlmm8F;
	Thu, 27 Mar 2025 11:56:21 +0000 (UTC)
Message-ID: <4a5efc8e-ec61-40c8-9b36-59e185b0fdd5@acm.org>
Date: Thu, 27 Mar 2025 07:56:15 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/2] ufs: core: delegate the interrupt service
 routine to a threaded irq handler
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250326-topic-ufs-use-threaded-irq-v2-0-7b3e8a5037e6@linaro.org>
 <20250326-topic-ufs-use-threaded-irq-v2-2-7b3e8a5037e6@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250326-topic-ufs-use-threaded-irq-v2-2-7b3e8a5037e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/25 4:36 AM, Neil Armstrong wrote:
 > When MCQ & Interrupt Aggregation are supported, the interrupt
 > are directly handled in the "hard" interrupt routine to
 > keep IOPs high since queues handling is done in separate
 > per-queue interrupt routines.

The above explanation suggests that I/O completions are handled by the
modified interrupt handler. This is not necessarily the case. With MCQ,
I/O completions are either handled by dedicated interrupts or by the
legacy interrupt handler.

> Reported bandwidth is not affected on various tests.

This kind of patch can only affect command completion latency but not
the bandwidth, isn't it?

> +/**
> + * ufshcd_intr - Main interrupt service routine
> + * @irq: irq number
> + * @__hba: pointer to adapter instance
> + *
> + * Return:
> + *  IRQ_HANDLED     - If interrupt is valid
> + *  IRQ_WAKE_THREAD - If handling is moved to threaded handled
> + *  IRQ_NONE        - If invalid interrupt
> + */
> +static irqreturn_t ufshcd_intr(int irq, void *__hba)
> +{
> +	struct ufs_hba *hba = __hba;
> +
> +	/*
> +	 * Move interrupt handling to thread when MCQ is not supported
> +	 * or when Interrupt Aggregation is not supported, leading to
> +	 * potentially longer interrupt handling.
> +	 */
> +	if (!is_mcq_supported(hba) || !ufshcd_is_intr_aggr_allowed(hba))
> +		return IRQ_WAKE_THREAD;
> +
> +	/* Directly handle interrupts since MCQ handlers does the hard job */
> +	return ufshcd_sl_intr(hba, ufshcd_readl(hba, REG_INTERRUPT_STATUS) &
> +				   ufshcd_readl(hba, REG_INTERRUPT_ENABLE));
> +}

Where has ufshcd_is_intr_aggr_allowed() been defined? I can't find this
function.

For the MCQ case, this patch removes the loop from around
ufshcd_sl_intr() without explaining in the patch description why this 
change has been made. Please explain all changes in the patch
description.

Thanks,

Bart.

