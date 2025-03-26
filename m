Return-Path: <linux-arm-msm+bounces-52519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BCEA71506
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 11:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAEDD16D78D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 10:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057ED1C7000;
	Wed, 26 Mar 2025 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="jKoNWX/3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390151C6FF5;
	Wed, 26 Mar 2025 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742985609; cv=none; b=gCIX7EyxWPwNdJKapZNLMQc5RlcLMKFAX0XkQf9053Aux1o2IbeA2WRgUZaemQr3r96lgLc06WPXipHphhYCw6Xb6TdW48HpqoYDUMpNNQm/tRTpe2X/kg0trDAlik0rwqi4gY4crMpTR/xEaczsKUf33eTTAqJY5F8OP06x5og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742985609; c=relaxed/simple;
	bh=RYG3GvKpPm0CCjt7UlMCORi74Y9C4BgsN1oxmH9nSXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtwOKCNay/3CPMaEewLFZT/X/P6+giIL4tObeY4QIgQLLDlq4GJw+XqE89u031T7Dhl1su28dvP63e/de5YQ/BNwWWUFgLPFtv6LQlizS8Lv//iNjkRaahIjSGTJIfDzUYIoPrLy2pPtw8jY/24E53KhPZ0KWehj1ZcZeFWzK6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=jKoNWX/3; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4ZN3Fs0mb1zm0yQB;
	Wed, 26 Mar 2025 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1742985599; x=1745577600; bh=u+WrZRiDxBHkaSi9rgxzaHuw
	fSAuRnMVMR5t3aCZTWA=; b=jKoNWX/33oTD9bFaDCMkQEr5ARI18RCAybsb3n3A
	8oI3SQeA3aXTaax3AaSSVyh54Gh4F9ae0c/zJ47b+wNvNNLYa5PoeLeadsQUnCqD
	Sw6uQdV6eiiZwT6xN0GzVPqefWME1d8lLSydlGYjsfGdzcpjMNllPdDYKUy5wIdp
	qFiX4i9MZDvR2Y1i5uUJ+8Is1Hdue9rovDgVm8CZncSBD0SZZ4ectC0xUx8Guubq
	Efn0rwXN61sa9RAkF0tSxsnZlCxm74PXY/anfYiiggkdb1JMRUoNuGEBGlxPt+ZI
	/wg0WKJE7UaddB68Efo6ztlW8HIPEwQmrGKFx/mxPnuUag==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id SdE-fRP6IFbp; Wed, 26 Mar 2025 10:39:59 +0000 (UTC)
Received: from [172.22.32.156] (unknown [99.209.85.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4ZN3Fg6WY5zm1Hbr;
	Wed, 26 Mar 2025 10:39:50 +0000 (UTC)
Message-ID: <e5c5ea82-2103-4616-8bcf-e21be5952f4c@acm.org>
Date: Wed, 26 Mar 2025 06:39:39 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ufs: qcom: Add quirks for Samsung UFS devices
To: MANISH PANDEY <quic_mapa@quicinc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com,
 quic_bhaskarv@quicinc.com, quic_rampraka@quicinc.com, quic_cang@quicinc.com,
 quic_nguyenb@quicinc.com
References: <20250325083857.23653-1-quic_mapa@quicinc.com>
 <c0691392-1523-4863-a722-d4f4640e4e28@acm.org>
 <33c03e94-5e8b-44cf-be32-fb571ca73a17@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <33c03e94-5e8b-44cf-be32-fb571ca73a17@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/25 5:53 AM, MANISH PANDEY wrote:
> The QUIRK_PA_HIBER8TIME may also be necessary for other SoC vendors host 
> controllers. For instance, the ufs-exynos.c file implements a similar 
> approach in the fsd_ufs_post_link() function:
> 
> ufshcd_dme_set(hba, UIC_ARG_MIB(0x15A7), max_rx_hibern8_time_cap + 1);
> 
> https://lore.kernel.org/lkml/001101d874c1$3d850eb0$b88f2c10$@samsung.com/
> 
> Should we consider moving the QUIRK_PA_HIBER8TIME quirk to the ufshcd 
> driver? Please advise.

That would be appreciated.

Thanks,

Bart.

