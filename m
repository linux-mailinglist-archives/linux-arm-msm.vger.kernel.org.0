Return-Path: <linux-arm-msm+bounces-24514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B0991ACEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 18:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C49301F2413D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 16:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758C11993A9;
	Thu, 27 Jun 2024 16:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="MC0v4hPX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AD519754D;
	Thu, 27 Jun 2024 16:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719506156; cv=none; b=tTPGPuM6Qm1CU9aUaCxl1SMs+D+0OYqTn1ehBVN/FSH9/3b6Bv3lVNkL+yrWoRwySeQYynIGAFFYpY58gXDjycY+TkSm2IaVFemivt0vR5DCFNyt/DTSx7BX1vzYAnEoLYPATxqaZl+sLh6svxFaDfo9NPv+BN+jidJxkaBsGU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719506156; c=relaxed/simple;
	bh=i5uSuHzDAA3dG29s0ri3FEEJ620FhxvUQqdNQbTmYOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5/uPZjEq3hZWxrYm7gOLPAjksa0eFDYDsl0ueZivJHQ1/3xF1MwZy1ILOAhqxspV2jZtDxXLS8GaQ7P8S0nDqiMPO9E1FLIEDR65FZbw1mRCIQMFpzEgFOUV6DrsCcgxtG7lmJkhahudQX1sqZ5d8k33g9+zDMBYnAuKfpTaLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=MC0v4hPX; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4W94222JYzzlgMVh;
	Thu, 27 Jun 2024 16:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1719506149; x=1722098150; bh=hVDMUsVF+/V1YGWN2LOQHR7A
	/yvxeORdTPizOwfWMu0=; b=MC0v4hPXm7TTQYbXcerNglbhdxtZn8QxQDDBRpwm
	VEjAd9Nc+tndQdQwl0/svcZEHM8LzUQBAR7txGKX5nHK/4Z/rAxGBmtBtoI8DyBl
	rZEKdKSShHyEyePTCkHh2Uj8fy2PMpVmXZtDZvwakj/XYb4W6aTkFOU8oe49l/6q
	DRf2XcT3TWQwYIr8BsvlP0SW3GMfhUjTmOJOrHFQK530uHyVp67Q2/mCEAzZKtpE
	GkFywRpgYAsfWpFUDY1ILiKmfa3cjWpxqiAj/XX3t3pDUnYEwGZoF5BoTxNTFpb/
	RHR75jJZarbPD5AVXscOINaUdx0ZS+SQz3pA5Rp3A2VZXA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Q64WVv8m8ORN; Thu, 27 Jun 2024 16:35:49 +0000 (UTC)
Received: from [100.125.79.228] (unknown [104.132.1.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4W941w3b2mzlgMVf;
	Thu, 27 Jun 2024 16:35:48 +0000 (UTC)
Message-ID: <97bb4c5a-46f3-4a81-96bf-a3147d9ec78b@acm.org>
Date: Thu, 27 Jun 2024 09:35:47 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] scsi: ufs: Suspend clk scaling on no request
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_cang@quicinc.com,
 quic_nguyenb@quicinc.com, quic_pragalla@quicinc.com,
 quic_nitirawa@quicinc.com
References: <20240627083756.25340-1-quic_rampraka@quicinc.com>
 <20240627083756.25340-2-quic_rampraka@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240627083756.25340-2-quic_rampraka@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/27/24 1:37 AM, Ram Prakash Gupta wrote:
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 1b65e6ae4137..9f935e5c60e8 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -1560,7 +1560,8 @@ static int ufshcd_devfreq_target(struct device *dev,
>   		ktime_to_us(ktime_sub(ktime_get(), start)), ret);
>   
>   out:
> -	if (sched_clk_scaling_suspend_work && !scale_up)
> +	if (sched_clk_scaling_suspend_work &&
> +			(!scale_up || hba->clk_scaling.suspend_on_no_request))
>   		queue_work(hba->clk_scaling.workq,
>   			   &hba->clk_scaling.suspend_work);
>   
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index bad88bd91995..c14607f2890b 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -457,6 +457,7 @@ struct ufs_clk_scaling {
>   	bool is_initialized;
>   	bool is_busy_started;
>   	bool is_suspended;
> +	bool suspend_on_no_request;
>   };
>   
>   #define UFS_EVENT_HIST_LENGTH 8

Who are the other vendors that support clock scaling? I'm asking because
I don't think that the behavior change introduced by this patch should
depend on the SoC vendor.

Thanks,

Bart.

