Return-Path: <linux-arm-msm+bounces-67261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62148B17549
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 18:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9556C58441D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 16:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1277223E329;
	Thu, 31 Jul 2025 16:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="QATD2swK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5331FAC48;
	Thu, 31 Jul 2025 16:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753980782; cv=none; b=Ov8j837JtW8oteW9ix44HH6+WoqFKaS14aDt6ARODjvDVzfelbFUbtMtbGAs4NNl3xiV5wvdAGTg+ltg0+34GyPcsi+0oXUjvHdXIWlcR0J/WP+p0dNKqcH0WM/lrvd7JDpn8DnHmnx7O0jxZX/FHRXz7B46jSZH7/nrc5KOATc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753980782; c=relaxed/simple;
	bh=oM9rSevoQ7JkUN01oUeMRghVmEpm4moYN3as8s68inc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Egfp5HL7wZBC0xk7ISfVPoafQMDPV4qdwA3s9X7xkw+uN2mF+N57oCm9VLdwXd5YJc7HAqMMRYJ6oBerARwXV2V9ivgJiuAFeJZpColOEjVYc3O2H2V+TvSd2EF07TI1EeMiDz5zFxBUuczQrsbSdvomP3El8fVH1W6Lf2mfMsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=QATD2swK; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4btFWb0G0Gzm0pKP;
	Thu, 31 Jul 2025 16:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1753980776; x=1756572777; bh=q+N8OqzcjFRQTlP1J8tBBS2b
	KX+Af+zJ2IQ7vZkBgiA=; b=QATD2swKrjfG8BEzdtfQA37NHcgBsIBlw0vIMSCu
	DUKyfra0dNbroIY4I6OgVhyylFQ8NLJUTPLUuoAHFrn/BcjY6h5LHrhtxS4kDXlz
	GOyi2X6i16XSwItBCbjYq738FO3nwkfx2PaF6HmCOv5x3W3eEBXpwKJ//of2FrWn
	BlVrznNgurkAwpzuYgY1bTsbLgI7Nixnj4N2bXWHfMZ5CtGbRX2m2MOeu9P1Tqj6
	bnopXq4Jh1rrL0Hy/7miTLMxLP3o9/VJSjqdCxplzse5TX5dtFWPO//LpZ2KDB2p
	61UNkVtltjCTN+Q7SUpiZqb7bCM8c3EIuVKakaupNkmlBg==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id u58zs7n3NP8I; Thu, 31 Jul 2025 16:52:56 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4btFWM1yGczm0yVJ;
	Thu, 31 Jul 2025 16:52:45 +0000 (UTC)
Message-ID: <c516ed73-5947-4b18-a1d9-18a9901e30e3@acm.org>
Date: Thu, 31 Jul 2025 09:52:44 -0700
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
> 
>   static int ufshcd_clear_tm_cmd(struct ufs_hba *hba, int tag)

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

Martin, this patch seems to be more popular than my "[PATCH v2] ufs:
core: Fix interrupt handling". Please consider queuing this patch when
this is convenient for you.

Thanks,

Bart.

