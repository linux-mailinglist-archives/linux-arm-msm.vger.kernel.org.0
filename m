Return-Path: <linux-arm-msm+bounces-53454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2F0A7EDC4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 21:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 999203B0525
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 19:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDDC21ADB7;
	Mon,  7 Apr 2025 19:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="f/vu39tU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B949321ABCA;
	Mon,  7 Apr 2025 19:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744055075; cv=none; b=Ndvhc6jC9t6mQYZuVpQc62utKkn4gr3DIdLWh+INLTvsPxdgh7rta9vdkyJAzLZN9+CA3zHhj3qD5WT1sRpjcIFplLEYDvaptv2ZbEzKChoOQ8qFf8IZusp/HDdw/Krhokb/TUqXsA9kknHwm/I+UMKBIbq48tXznNAfeWpC0js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744055075; c=relaxed/simple;
	bh=vOITRWhlFd0itVH/3jJDEpyCXJJycNgjmpibMtVdLpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ur7sSi8/vSOBvYLVBhjzVxInaUfIszylC6s4ixzFr3vsh/Hd7bvtnWXEXiXmRbaIB6z4ZklwF5vlQfzl7/+9xE4DiwpJ+jcRdyGiN/X53+HjacYd7oL67H9KkSjr9YLPrPOQX+u+uHBVGUQiD+OOXa2gZTo9OqUS1ZEVR9TmcJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=f/vu39tU; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4ZWfmc4VHlzm0pK6;
	Mon,  7 Apr 2025 19:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1744055071; x=1746647072; bh=8/wKkxqd/B3Npjp1fYpzcknH
	1KKaQXXKd1g7aF/hx34=; b=f/vu39tUycyy9gONbjVd/R5hBJ3W9xAoUjxgC48i
	dC7CG9HDSagVen8uhDX2QZxy882ZW/EXKr6tG62eIWoe3vWmhIToki9ibDYMal/v
	rHc1RQvkYXiKmPku44cg2TCD84RJY+QkOFO8ka20baMa0f07w7ElezxBEvbNubqW
	tjYDhxHubins+8BhrsWVcuOnTB0xCT0lm5kFH3H0i7F51bRsiicLbhSrv5jYmnfj
	nWF5qfUZ3lAFi/7Dq3U/75jaZwCEYJSMTBm/+QzxuAJVWf1UnHVapW/Zl34nOdfR
	dIR9clPUSerfmbBU4mAeXcxqr/CxO4fXb8q9bB7BfsFqCw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id mrJ3z-irmDUo; Mon,  7 Apr 2025 19:44:31 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4ZWfmT3Jqzzm0jw8;
	Mon,  7 Apr 2025 19:44:24 +0000 (UTC)
Message-ID: <7f0694df-05e5-481c-b1d6-1d6cf4267355@acm.org>
Date: Mon, 7 Apr 2025 12:44:23 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 3/3] ufs: core: delegate the interrupt service
 routine to a threaded irq handler
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250407-topic-ufs-use-threaded-irq-v3-0-08bee980f71e@linaro.org>
 <20250407-topic-ufs-use-threaded-irq-v3-3-08bee980f71e@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250407-topic-ufs-use-threaded-irq-v3-3-08bee980f71e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/25 3:17 AM, Neil Armstrong wrote:
> +static irqreturn_t ufshcd_intr(int irq, void *__hba)
> +{
> +	struct ufs_hba *hba = __hba;
> +
> +	/* Move interrupt handling to thread when MCQ & ESI are not enabled */
> +	if (!hba->mcq_enabled || !hba->mcq_esi_enabled)
> +		return IRQ_WAKE_THREAD;
> +
> +	/* Directly handle interrupts since MCQ ESI handlers does the hard job */
> +	return ufshcd_sl_intr(hba, ufshcd_readl(hba, REG_INTERRUPT_STATUS) &
> +				   ufshcd_readl(hba, REG_INTERRUPT_ENABLE));
> +}

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

