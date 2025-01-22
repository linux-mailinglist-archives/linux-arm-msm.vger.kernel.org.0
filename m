Return-Path: <linux-arm-msm+bounces-45854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8A5A1985C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 19:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61CC81882900
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 18:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7227215072;
	Wed, 22 Jan 2025 18:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="USBjii8b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A10185B62;
	Wed, 22 Jan 2025 18:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737570145; cv=none; b=piXVLN8gZwITfhWE6+AtpqdgwFTeOURo892eQVLmbaEGdTzLDcoyToK5sldVdwPaBEwQ5GNAMH1VrfaoZgjMaoTE51uz3CbmLeSk1DbeO+SkB309GJ1BfK7LeEIgmQRyQkpjAI/OCqNDaP1OR2VKiliv0nLQ6dnv3LPBkOssvFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737570145; c=relaxed/simple;
	bh=haZ0QJa1biXmckdBWD03SCcoeONJAW0OLxTX1IVJ0Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EjEE6l3YMItoBmdxv9ElbKbVXgg3ZYdYVsr9m2wNL6wR/0BJ2V2867F9qVYmJC64mvpBMZVeAtn8nN9JEJ/AxXsRCGnRPRrQ6w/On98Ex+kBOrJJeCa2D92b5BiFpverTz13F9zjI3tNU+7XkCQmUuRsKsGpI2MEiagoU2OH0gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=USBjii8b; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4YdXVR4fF4z6CmR07;
	Wed, 22 Jan 2025 18:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1737570134; x=1740162135; bh=xp/OujmYyTnEnIg01zpNIE3c
	mYaCtdAddQdqVCPqgio=; b=USBjii8bggCnlNONShLnnpaQVAcS+wZekhy4yHwK
	rhb8wjvE2VtrJK9uio3kIeJA0yyBG+wjmXhlPJpLmoyxtDTraSrt67/qxPjlGJvY
	XlFGI5MTEW84/R5vBnM8x/4A4v5IinOgau7oO3fkAGs+Sc6noZDxVUUOTRD/6siE
	39DNog6o6zr6NBkFeB7Y6KHtQSkV0G+BF5VQa87LZFjonFAmgDPNgRwMptZc+2up
	J5yfi4Hu17saToGOrJIJaeZk3KphiUrBo4k+sd8kfDN+IAi5jWySAjquMQR9wfX2
	aBswGlRrMl3aS0E5Q8JQP78EwcQakNscOca0TrWITSkkrQ==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id YAz9pov79v96; Wed, 22 Jan 2025 18:22:14 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4YdXV66hNCz6CmR1W;
	Wed, 22 Jan 2025 18:22:06 +0000 (UTC)
Message-ID: <2f36f1c1-8fee-487d-94e0-0939368d3136@acm.org>
Date: Wed, 22 Jan 2025 10:22:05 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] scsi: ufs: core: Add a vops to map clock frequency
 to gear speed
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 mani@kernel.org, beanhuo@micron.com, avri.altman@wdc.com,
 junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Peter Wang <peter.wang@mediatek.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-4-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250122100214.489749-4-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/25 2:02 AM, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
> 
> Add a vops to map UFS host controller clock frequencies to the maximum

Above and in the subject, please change "vops" into "vop" (variant
operation).

>   struct ufs_hba_variant_ops {
>   	const char *name;
> @@ -387,6 +388,8 @@ struct ufs_hba_variant_ops {
>   				       unsigned long *ocqs);
>   	int	(*config_esi)(struct ufs_hba *hba);
>   	void	(*config_scsi_dev)(struct scsi_device *sdev);
> +	int (*freq_to_gear_speed)(struct ufs_hba *hba, unsigned long freq,
> +					u32 *gear);
>   };

Please keep the indentation consistent.

Thanks,

Bart.


