Return-Path: <linux-arm-msm+bounces-28540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE7A952119
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 19:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EE6E1C2099A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBC41BBBDA;
	Wed, 14 Aug 2024 17:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="z73f/zDu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006201B3756;
	Wed, 14 Aug 2024 17:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723656562; cv=none; b=CB8U9kegQLf/CU2Y3T+NoHpxBR6zxqYPBTl9P3rfVooinlxUtOZWRk54RVWrtXW+bgcwvgXVaLxO7M9MjSRTM++/1uW59KYJ7Cy3cUzqIojJNrnIeuLLZ3nQv7UWjVu9haI97U3MQNgt8U4M0YBLm3sBS5oiRdawoQlaoBzXORg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723656562; c=relaxed/simple;
	bh=XmsPiii+wG70h9ZM55iSB160B+XJ/WyqQWqvcOiBgPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3QQ5Q4GBwVLZ9CU5/tO428V4dXv8mzn1EcMeMXkD/DphbIAyMwMacEGF/6PyM3QNG2r1JU/jX4v3931Cbrvnc8w8TaGB9fxQ+/1BfRIDOm9BEyxJgshqe2+OKpPDRNIRMYTx1vSJDVG54Ke0346UO7uKVvPFzub8UaVa0faUco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=z73f/zDu; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4WkZxX2jFYz6CmLxT;
	Wed, 14 Aug 2024 17:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1723656556; x=1726248557; bh=I7dodsI0T6h07zqlJlprqPak
	oAeMD2WyeAzXwap4pZY=; b=z73f/zDuCPCNKGJQhAXvtSM6CAINIZHJAut9BqMs
	ekhyE7F18glxMNfcBCZRT2UG/6/NRXlR5aDBZTm232Pl++k0acQNprtsHUWEWX1K
	blYf4d8I32u4z1VgIzSazSwKybyiHRTP6Ti2hEKL/Mrcan1p9lhUoFkGvN5wvn+S
	b3tfILfRYhMJF/jX0eh7uLCb6TCI/u7K9ocs/+lKITuSkEeprKsTYy89lEJ0musG
	nZE5e/u6V9v1eEW/IlGwCUVw9s1KyRW9H7IAg99Jc3z3DH6DFBQcaLLJzV8i2Tyl
	HqGgz5EQdBm8hGF4l/QJCJ+6uU8CE8i3TPyUKEG69sNPlg==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id o6QXbFGnLU5V; Wed, 14 Aug 2024 17:29:16 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4WkZxP5W7Hz6CmLxR;
	Wed, 14 Aug 2024 17:29:13 +0000 (UTC)
Message-ID: <f51533d5-46b9-4485-b71c-2fbd6a12071a@acm.org>
Date: Wed, 14 Aug 2024 10:29:11 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ufs: core: Add a quirk for handling broken SDBS field
 in controller capabilities register
To: manivannan.sadhasivam@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>
References: <20240814-ufs-bug-fix-v1-0-5eb49d5f7571@linaro.org>
 <20240814-ufs-bug-fix-v1-2-5eb49d5f7571@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240814-ufs-bug-fix-v1-2-5eb49d5f7571@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/24 10:15 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> 'Legacy Queue & Single Doorbell Support (SDBS)' field in the controller
> capabilities register is supposed to be reserved for UFSHCI 3.0 based
> controllers and should read as 0. But some controllers may report bogus
> value of 1 due to the hardware bug. So let's add a quirk to handle those
> controllers.
> 
> If the quirk is enabled by the controller driver and MCQ is not supported,
> then 'hba->sdbs_sup' field will be ignored and the SCSI device will be
> added in legacy/single doorbell mode.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/ufs/core/ufshcd.c | 5 +++--
>   include/ufs/ufshcd.h      | 7 +++++++
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 168b9dbc3ada..acb6f261ecc2 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -10512,8 +10512,9 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
>   	}
>   
>   	if (!is_mcq_supported(hba)) {
> -		if (!hba->sdbs_sup) {
> -			dev_err(hba->dev, "%s: failed to initialize (legacy doorbell mode not supported)\n",
> +		if (!(hba->quirks & UFSHCD_QUIRK_BROKEN_SDBS_CAP) && !hba->sdbs_sup) {
> +			dev_err(hba->dev,
> +				"%s: failed to initialize (legacy doorbell mode not supported)\n",
>   				__func__);
>   			err = -EINVAL;
>   			goto out_disable;

Adding a check for the UFSHCD_QUIRK_BROKEN_SDBS_CAP quirk everywhere
hba->sdbs_sup is tested is wrong. Please move this check to the code
that assigns a value to hba->sdbs_sup.

Thanks,

Bart.


