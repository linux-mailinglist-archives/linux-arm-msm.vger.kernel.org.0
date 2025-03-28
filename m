Return-Path: <linux-arm-msm+bounces-52794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3648A74F23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 18:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6DDB1883D8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 17:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381261DE3A6;
	Fri, 28 Mar 2025 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="j9jUbA+Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7851DB131;
	Fri, 28 Mar 2025 17:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743182111; cv=none; b=HULMEUOuEycEl6wfxyrCOF00poUseuipVsg2FrdnscccB/rz1cBLGW5xyckjsOb/x7YBekPoQLkmp6tlG42kTrfAe/AdeEO7d6ItPJapLi9TmKzOOKCCjABxm8rDx6XicBrkH5zfiC+5ZTjONhM1+dePcXC+jDnpy0LfS7BHl6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743182111; c=relaxed/simple;
	bh=da7sHPFNtbq2W4cYMJ0iJEuTAgjeSMbHDG0WJspHRso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iAzqZc2W6aQGNN3ivA/CSfNbawLkN01m+qYzt4ryV1KJV8nAY/9flYWyjTycB1xYZXVb5s45Nvrh+0k6LlyohewtmSLhZzClXHSOuhyuQxA7O0K+6RY7CDTn6MhnBOqCiPe/92hpiPyvaIEMqLJg5rYIIOM8Hi+qhnyiOCiZd+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=j9jUbA+Y; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4ZPRwk4ttvzlmm8f;
	Fri, 28 Mar 2025 17:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1743182101; x=1745774102; bh=+EK6tmoFiYgHeuEyYxLkyu/8
	1AguotCIY7k04YXofmY=; b=j9jUbA+Y5cBItNjvfQ+hyeUC2A02jumLj99vu9Ep
	QoIt9B0pGDaEXn3Eb4C7JI157palYsortj0m/1bHm0df6yx4Z9p98StjSZ7AN8UP
	OpfdWX7smPS95pZ0DGo0aKD0qc0PcwQ+VfM2ddlusFp6Oa0NFz7EauHnzZowFipv
	gSiztiM1f2lE2yD4gzixI5WBTs1+I4Tyr/aqGOg4Zt4vugPDb6ab1ecFYiB1xtf2
	grgmz+nykuAAjJy36yBnxETKZnHETu5yylDQMXZvxq35/bowSUCYW9tBflsK06Zi
	rFgyjVEFeHBrz3ALs7xayo7LCpf4GILzWbE/tjPd/+lT4A==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id fvm9X_Lqj2Gh; Fri, 28 Mar 2025 17:15:01 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4ZPRwb0J4fzlv768;
	Fri, 28 Mar 2025 17:14:53 +0000 (UTC)
Message-ID: <2ef77956-3e09-4315-8e3d-2046830f9227@acm.org>
Date: Fri, 28 Mar 2025 10:14:52 -0700
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

On 3/26/25 1:36 AM, Neil Armstrong wrote:
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

Calling ufshcd_is_intr_aggr_allowed() from the above interrupt handler
seems wrong to me. I think you want to check whether or not ESI has been
disabled since only if ESI is disabled all I/O completions are handled
by a single interrupt if MCQ is enabled.

Thanks,

Bart.

