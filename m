Return-Path: <linux-arm-msm+bounces-50537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E8AA5522E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 18:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF3933AA5BE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 17:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61E025C6F7;
	Thu,  6 Mar 2025 17:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="CVZB7ph+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AA025B69E;
	Thu,  6 Mar 2025 17:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280491; cv=none; b=bbr1utrSlN72C09l3ellh4xq6gG2uQnAMZBEBVdKoYryqYAfSOm6WSOt5AXqy89hrqpyqVhozpAnbZP7rQ8TPHYWum01PvCWcEuo0rDrbXCZHVwBI8xeR9TcqwMh7Z9sq67cJnpGh6grXVFNnJ/SX5hqqZZLF6KTgAyxt+4ctLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280491; c=relaxed/simple;
	bh=0bG+xsvVA43Tj04NjYI8l6dTopg/wLEDMHxrsSVIdBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S0YmWoCNyZJVNZPn/wDeMQPGYZTJjZTuTywaY7RIXWfQSv76Zl74HAFP3jAu3MVvMK9KG1fXIsNQ7CkmPnrwf+Lz9grbK3/poVd3abHt44Py2iGb8nBEYEmH2bClTVXU2PCoLTXqokBL2hrDYACePOYtnuyvYel9UcimBOr8cpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=CVZB7ph+; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4Z7wg668C9zlgrtp;
	Thu,  6 Mar 2025 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1741280480; x=1743872481; bh=9/EC2f3UG/oS/+8VXzx/tS1v
	HUYjgPed0E+QLpjuj9o=; b=CVZB7ph+QCcWq+r/qJMWPnFmDjolmS+ML+SCq5Ie
	fd2rzDR/JjK5IabvsFiQsWQQ8hms9nFOPc1iwIv6hOtuFCwrihrDxaBio+ZvLxvA
	biWgyC8zwmR+umf/a7f/z61VAUGqOGdzpJYG5wKWFiMM8Q5qV7SqKZxSNo7G6r4i
	g5hogrKsq0joAU8d7+jrlbUxfXcB02T2VcUl+ccsPjNuX7JvuKY3HzxKPb7kxdbb
	SR5rW/cOMZL7gSr7R2h4pRQkMLlz4eMBKUUgk0Q/WnheWfKcNd/FcXgSQHUXt/DR
	JYxdT5Ua+aYmFniGJIfvJOhM3oxZ8v9n+x/k6UeoNzv4DQ==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id zrJYGK11rEh9; Thu,  6 Mar 2025 17:01:20 +0000 (UTC)
Received: from [172.20.25.222] (unknown [192.80.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4Z7wfw6l4nzlgrtN;
	Thu,  6 Mar 2025 17:01:12 +0000 (UTC)
Message-ID: <7ff50e9c-8556-4b55-9457-03ee45ee07c0@acm.org>
Date: Thu, 6 Mar 2025 09:01:11 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/3] scsi: ufs-qcom: Add support for dumping MCQ
 registers
To: Manish Pandey <quic_mapa@quicinc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com,
 quic_cang@quicinc.com, quic_nguyenb@quicinc.com
References: <20250305120355.16834-1-quic_mapa@quicinc.com>
 <20250305120355.16834-3-quic_mapa@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250305120355.16834-3-quic_mapa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/5/25 4:03 AM, Manish Pandey wrote:
> +static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
> +{
> +	/* RES_MCQ_1 */
> +	ufshcd_dump_regs(hba, 0x0, 256 * 4, "MCQ HCI 1da0000-1da03f0 ");
> +	usleep_range(1000, 1100);

Please add a comment that explains why the usleep_range() calls are
present.

> @@ -1624,6 +1670,19 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
>   
>   	reg = ufs_qcom_get_debug_reg_offset(host, UFS_DBG_RD_REG_TMRLUT);
>   	ufshcd_dump_regs(hba, reg, 9 * 4, "UFS_DBG_RD_REG_TMRLUT ");
> +
> +	if (hba->mcq_enabled) {
> +		reg = ufs_qcom_get_debug_reg_offset(host, UFS_RD_REG_MCQ);
> +		ufshcd_dump_regs(hba, reg, 64 * 4, "HCI MCQ Debug Registers ");
> +	}
> +
> +	if (in_task()) {
> +		/* Dump MCQ Host Vendor Specific Registers */
> +		if (hba->mcq_enabled) {
> +			ufs_qcom_dump_mcq_hci_regs(hba);
> +			usleep_range(1000, 1100);
> +		}
> +	}
>   }

Please either combine the two "if (hba->mcq_enabled)" tests or combine
the "in_task()" and "hba->mcq_enabled" tests.

Please also add a comment that explains why the in_task() call is
present and a comment that explains why the usleep_range() call is
present.

Thanks,

Bart.

