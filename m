Return-Path: <linux-arm-msm+bounces-53737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6853A832FC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 23:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D4877A61D1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 21:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5041213E6A;
	Wed,  9 Apr 2025 21:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="ssY7+9Wr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003D81C07C3;
	Wed,  9 Apr 2025 21:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744232921; cv=none; b=JAl20rCczZdxfcVi5+83UyzjY7fbFCx0M2YgC19nJWV029TpD51+X3DqDTevXlmo0ft54AO0L6EOAo1AeswsdocsdcpaWLJ1rXDs1V93S3WkBsEQE89AQo6AJ11xP3tI29K+ihP2QjT8DABd/3nxXYRqkpXSpvpcaz+2/9Io/Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744232921; c=relaxed/simple;
	bh=+856jdLoLLEWWyhtLMynN+pZtUSFemOl6XgY4gF3HzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTuQSDwYZP3aX2ljQt3Sc4B4RM2xIayn74imiMo5XrV0qs8GvWqkXY8XvQTSoHHzO6G6jWAwT+KtObAUUxuSRPRcGUOLRhqGnk/N1RSUIC6Cdga18KOV3ivturcncQjj3g1vXEt3bLpdwsoaww5vmtnb2xYGhXh5KWn2Zwf7N5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=ssY7+9Wr; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4ZXwXk6Gy2zm0yTh;
	Wed,  9 Apr 2025 21:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1744232916; x=1746824917; bh=BhvBwC5z/9Md8oVXDSlpI8ae
	/9CWhxuq5tuzJzRJjFg=; b=ssY7+9WrKDiMCS7FMwgSBpVMfMv77FB29qiKeYYJ
	/c0uVOXUtIMQwxCw8O9aoDU3slZR3TDewugWoSfW+O7ujkXMX5mx5uZEqJDfV+w0
	oNEIeiACxNBHltzCsTtRC/6TNObLNdw7tjO5NpcBfAIuqEVWavn9q4Z8nDM+JPSX
	ng3TljFWV3W3E55cWplWfzAVwPEcc8ekM+fi68omXFvMNaDHvMb5Pdx+lcYIsgU1
	taI5GpVckB2yro5vZEu/yvSWVAJEw9nn6SJTl4pQu5LzxekyR4eBiZ7zzgJDN7Kl
	dyuTa9iPZjj3yWvjhu4S8Ty8DWhfTmONETMgdEZfJ3znGg==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id AYpURVZjfLjP; Wed,  9 Apr 2025 21:08:36 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4ZXwXY5bd8zm0ySJ;
	Wed,  9 Apr 2025 21:08:28 +0000 (UTC)
Message-ID: <15df00e9-d5d9-4d16-b334-e1b8cb96f654@acm.org>
Date: Wed, 9 Apr 2025 14:08:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 2/3] scsi: ufs-qcom: Add support to dump MCQ registers
To: Manish Pandey <quic_mapa@quicinc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com,
 quic_bhaskarv@quicinc.com, quic_rampraka@quicinc.com, quic_cang@quicinc.com,
 quic_nguyenb@quicinc.com
References: <20250407142110.16925-1-quic_mapa@quicinc.com>
 <20250407142110.16925-3-quic_mapa@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250407142110.16925-3-quic_mapa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/25 7:21 AM, Manish Pandey wrote:
> +int ufs_qcom_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
> +		     const char *prefix, enum ufshcd_res id)
> +{
> +	u32 *regs __free(kfree) = NULL;
> +	size_t pos;
> +
> +	if (offset % 4 != 0 || len % 4 != 0)
> +		return -EINVAL;
> +
> +	regs = kzalloc(len, GFP_ATOMIC);
> +	if (!regs)
> +		return -ENOMEM;
> +
> +	for (pos = 0; pos < len; pos += 4)
> +		regs[pos / 4] = readl(hba->res[id].base + offset + pos);
> +
> +	print_hex_dump(KERN_ERR, prefix,
> +			len > 4 ? DUMP_PREFIX_OFFSET : DUMP_PREFIX_NONE,
> +				16, 4, regs, len, false);

The indentation of the print_hex_dump() arguments is not compliant with
the Linux kernel coding style.

> +	return 0;
> +}
> +
> +static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
> +{
> +	/* voluntarily yield the CPU to prevent CPU hog during data dumps */
> +	/* RES_MCQ_1 */
> +	ufs_qcom_dump_regs(hba, 0x0, 256 * 4, "MCQ HCI 1da0000-1da03f0", RES_MCQ);
> +	cond_resched();
> +
> +	/* RES_MCQ_2 */
> +	ufs_qcom_dump_regs(hba, 0x400, 256 * 4, "MCQ HCI 1da0400-1da07f0", RES_MCQ);
> +	cond_resched();
> +
> +	/*RES_MCQ_VS */
> +	ufs_qcom_dump_regs(hba, 0x0, 5 * 4, "MCQ VS 1da4000-1da4010", RES_MCQ_VS);
> +	cond_resched();
> +
> +	/* RES_MCQ_SQD_1 */
> +	ufs_qcom_dump_regs(hba, 0x0, 256 * 4, "MCQ SQD 1da5000-1da53f0", RES_MCQ_SQD);
> +	cond_resched();
> +
> +	/* RES_MCQ_SQD_2 */
> +	ufs_qcom_dump_regs(hba, 0x400, 256 * 4, "MCQ SQD 1da5400-1da57f0", RES_MCQ_SQD);
> +	cond_resched();
> +
> +	/* RES_MCQ_SQD_3 */
> +	ufs_qcom_dump_regs(hba, 0x800, 256 * 4, "MCQ SQD 1da5800-1da5bf0", RES_MCQ_SQD);
> +	cond_resched();
> +
> +	/* RES_MCQ_SQD_4 */
> +	ufs_qcom_dump_regs(hba, 0xc00, 256 * 4, "MCQ SQD 1da5c00-1da5ff0", RES_MCQ_SQD);
> +	cond_resched();
> +
> +	/* RES_MCQ_SQD_5 */
> +	ufs_qcom_dump_regs(hba, 0x1000, 256 * 4, "MCQ SQD 1da6000-1da63f0", RES_MCQ_SQD);
> +	cond_resched();
> +
> +	/* RES_MCQ_SQD_6 */
> +	ufs_qcom_dump_regs(hba, 0x1400, 256 * 4, "MCQ SQD 1da6400-1da67f0", RES_MCQ_SQD);
> +	cond_resched();
> +
> +	/* RES_MCQ_SQD_7 */
> +	ufs_qcom_dump_regs(hba, 0x1800, 256 * 4, "MCQ SQD 1da6800-1da6bf0", RES_MCQ_SQD);
> +	cond_resched();
> +
> +	/* RES_MCQ_SQD_8 */
> +	ufs_qcom_dump_regs(hba, 0x1c00, 256 * 4, "MCQ SQD 1da6c00-1da6ff0", RES_MCQ_SQD);
> +	cond_resched();
> +}

There is a lot of repetition in the ufs_qcom_dump_mcq_hci_regs()
function. Has it been considered to move the cond_resched() call into
ufs_qcom_dump_regs() such that it occurs only once in this patch?

For the ufs_qcom_dump_mcq_hci_regs() function, a table-based approach
may be appropriate since what that function does is to call
ufs_qcom_dump_regs() repeatedly but each time with different arguments.

Thanks,

Bart.

