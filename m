Return-Path: <linux-arm-msm+bounces-66945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD1B144F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 01:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18F5E16D721
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 23:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24B5238C03;
	Mon, 28 Jul 2025 23:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="npOZVDfs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D84225784;
	Mon, 28 Jul 2025 23:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753746084; cv=none; b=LJVsSuFGlcrX6Gs3mcoH3t29bljS2VYWx2+ZhYCnmH8B45IyR3V1uBIBjRViqvJCdYb3Ii1ulHvpRkqTy5L/vKMSQ1WBTeNm70oW9CMMQ6MivLbhyIssLLCO+947lx6acshuzDy+YimzRvCCzryu2fcWu//ZdBjY5fHI7YKlRKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753746084; c=relaxed/simple;
	bh=8Mx/St1Lvv82OL/HGliBZbJ+FGkc6T61Vt6yRy1a9iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WKjofaT3b6gYXvGiHElUTm3qK3b60gdvfMy/dtHCGwVAQHx0ihcDUkRxpAPRzx+S734hNqjUOifPi27oXunWTg1wovkyBBPQB6U4vpmqbC/4YtdxmCgzWkvXvMik6LHjtuYigP/PEkOf6ASwZ/A+3TNauRNU/WUKRAJ02uE2cfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=npOZVDfs; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4brZkB00Hxzm0ysc;
	Mon, 28 Jul 2025 23:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1753746079; x=1756338080; bh=2N0BtDT+c0J8tC2zG0DvK3uA
	sURIC+bC+MfeGOsWPX4=; b=npOZVDfsHVqYO2buUr9y9V5jEmAm/8tU9X2kLVI3
	SIr+V+MOqc9PIF2BC+IL0q/iDRmlzTyDr9uPxq84BJYXvK2pUScQ+vI4rdEWWi5c
	ZyommjkXBr0HFRQueGiuoyvZKv6DZOvIIpnr5Qt2vkI37D6Nsvm+53DQo6w4ROT9
	VZxCwRkzVKwishMbmZ+TAp/Pd8WwFrZXF9lgYRFi9IWhTfaWAK++SiG7yt3f03sJ
	EJSVuUoP3TXM76+wSZ/4YfpcGmAv6rzXHZ+yQhnmAVRuleGcKadBsEvfZkuM+PJi
	iJnrEHRKhzMm6YLRrrbkwkonzohktkHwtzZQefC5mZtILw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id G5hm9EV8xA4r; Mon, 28 Jul 2025 23:41:19 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4brZjt69jVzm0yNS;
	Mon, 28 Jul 2025 23:41:05 +0000 (UTC)
Message-ID: <a7cfe930-44b6-41dc-a84b-00f5ba314946@acm.org>
Date: Mon, 28 Jul 2025 16:41:01 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] ufs: core: Fix interrupt handling for MCQ Mode in
 ufshcd_intr
To: Nitin Rawat <quic_nitirawa@quicinc.com>, alim.akhtar@samsung.com,
 avri.altman@wdc.com, James.Bottomley@HansenPartnership.com,
 huobean@gmail.com, mani@kernel.org, martin.petersen@oracle.com,
 beanhuo@micron.com, peter.wang@mediatek.com, andre.draszik@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palash Kambar <quic_pkambar@quicinc.com>
References: <20250728225711.29273-1-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250728225711.29273-1-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/25 3:57 PM, Nitin Rawat wrote:
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index fd8015ed36a4..5413464d63c8 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -7145,14 +7145,19 @@ static irqreturn_t ufshcd_threaded_intr(int irq, void *__hba)
>   static irqreturn_t ufshcd_intr(int irq, void *__hba)
>   {
>   	struct ufs_hba *hba = __hba;
> +	u32 intr_status, enabled_intr_status;
> 
>   	/* Move interrupt handling to thread when MCQ & ESI are not enabled */
>   	if (!hba->mcq_enabled || !hba->mcq_esi_enabled)
>   		return IRQ_WAKE_THREAD;
> 
> +	intr_status = ufshcd_readl(hba, REG_INTERRUPT_STATUS);
> +	enabled_intr_status = intr_status & ufshcd_readl(hba, REG_INTERRUPT_ENABLE);
> +
> +	ufshcd_writel(hba, intr_status, REG_INTERRUPT_STATUS);
> +
>   	/* Directly handle interrupts since MCQ ESI handlers does the hard job */
> -	return ufshcd_sl_intr(hba, ufshcd_readl(hba, REG_INTERRUPT_STATUS) &
> -				   ufshcd_readl(hba, REG_INTERRUPT_ENABLE));
> +	return ufshcd_sl_intr(hba, enabled_intr_status);
>   }

Hi Nitin,

Thank you for having published this patch. It seems like we both have 
been working on a fix independently and without knowing about each 
other's efforts. Can you please take a look at this patch and let me
know which version you prefer?

https://lore.kernel.org/linux-scsi/20250728212731.899429-1-bvanassche@acm.org/

Thanks,

Bart.

