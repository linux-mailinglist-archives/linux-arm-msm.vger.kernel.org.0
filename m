Return-Path: <linux-arm-msm+bounces-50541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA926A55260
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 18:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEA841898E37
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 17:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE51425A652;
	Thu,  6 Mar 2025 17:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="WGgnc136"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8681256C68;
	Thu,  6 Mar 2025 17:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280736; cv=none; b=GuHV6gOjdeh6HvaFVHSlMZ3yv0vV/CDNU4sC0J0VmPDNWA7NcRoArv6RsE/x+vN29C9RqRGqrx1ihdn74kzQBZwh67ED/3EMJFw7Wbjyn0DVMkSutSIUdICdTygdyg+olkrvGpk+7pFlkWIhgXn4NbTQZpsr05nXomJHO5jY1F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280736; c=relaxed/simple;
	bh=3VfLqqlmovthJNuFMZVeB6EtRJFnUlkX4NOlEqhohiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4Qi/s8QEA0NqDNyJ4LRyeIxRO2ICbc16flvcDoRVooadvPAYNoVSLJl8hMeECvVrp/89cC0OP55DeHMIA5QU8LH30jg60BalVVO3cM61QnNBKUl/9X9Xa54IdHBltdof+0HqCj/08qSle7X40SGJ+J7duR9ecLf824p+ekpp5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=WGgnc136; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4Z7wlp2t0dzm0ySG;
	Thu,  6 Mar 2025 17:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1741280724; x=1743872725; bh=A24+KffKtFSUVrYAFQdKne2r
	rxq+xDeCpRePORA+drE=; b=WGgnc1365z+z/MCkk3wq0Ptnoo4oI5To9+nUweQB
	uUe2kjevacnrrWUS/2/oX04FmiJumMOt/HObNkMgiIAYFCuryhzOBSLoR+mfeMEm
	caNirXHPxCGiZgOFMeNAayrqgZR+h3qBRdvUQtuBSQWMgzxXhCW4oG6vBJoYQ6zo
	5C6pmgNc8gGIFA9T0ZWQyEZitEVFa7OQwWiX2W9WzyQmguaFMWYSzrU23C8LMqOu
	1l1jilgsOJtICajy9zk/Obu+VkpJoxeRxBWSCjh4LtOs7OzeIJa71Jf0Of9d/jDd
	1wQfLtSFeWe7Xl7BBghCPbug4DJtdUV5A/BnGt7biTXd+w==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id wqlyNVe4qNmw; Thu,  6 Mar 2025 17:05:24 +0000 (UTC)
Received: from [172.20.25.222] (unknown [192.80.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4Z7wld6Czxzm0yTc;
	Thu,  6 Mar 2025 17:05:16 +0000 (UTC)
Message-ID: <34aa5237-75fb-4cd1-9b90-f0a3f73753f8@acm.org>
Date: Thu, 6 Mar 2025 09:05:15 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/3] scsi: ufs-qcom: Add support for testbus registers
To: Manish Pandey <quic_mapa@quicinc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com,
 quic_cang@quicinc.com, quic_nguyenb@quicinc.com
References: <20250305120355.16834-1-quic_mapa@quicinc.com>
 <20250305120355.16834-4-quic_mapa@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250305120355.16834-4-quic_mapa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/5/25 4:03 AM, Manish Pandey wrote:
> This patch introduces support for dumping testbus registers,
> enhancing the debugging capabilities for UFS-QCOM drivers.
> 
> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
> ---
>   drivers/ufs/host/ufs-qcom.c | 73 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 73 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 7daee416eb8b..c8f95519b580 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1566,6 +1566,75 @@ int ufs_qcom_testbus_config(struct ufs_qcom_host *host)
>   	return 0;
>   }
>   
> +static void ufs_qcom_dump_testbus(struct ufs_hba *hba)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	u32 *testbus = NULL;
> +	int i, j, nminor = 0, testbus_len = 0;
> +	char *prefix;

Shouldn't the declarations be ordered from longest to shortest for new
code?

Has it been considered to annotate the 'testbus' declaration with __free
and to remove the kfree(testbus) call? See also <linux/cleanup.h>

> +		switch (j) {
> +		case TSTBUS_UAWM:
> +			prefix = "TSTBUS_UAWM ";
> +			break;
> +		case TSTBUS_UARM:
> +			prefix = "TSTBUS_UARM ";
> +			break;
> +		case TSTBUS_TXUC:
> +			prefix = "TSTBUS_TXUC ";
> +			break;
> +		case TSTBUS_RXUC:
> +			prefix = "TSTBUS_RXUC ";
> +			break;
> +		case TSTBUS_DFC:
> +			prefix = "TSTBUS_DFC ";
> +			break;
> +		case TSTBUS_TRLUT:
> +			prefix = "TSTBUS_TRLUT ";
> +			break;
> +		case TSTBUS_TMRLUT:
> +			prefix = "TSTBUS_TMRLUT ";
> +			break;
> +		case TSTBUS_OCSC:
> +			prefix = "TSTBUS_OCSC ";
> +			break;
> +		case TSTBUS_UTP_HCI:
> +			prefix = "TSTBUS_UTP_HCI ";
> +			break;
> +		case TSTBUS_COMBINED:
> +			prefix = "TSTBUS_COMBINED ";
> +			break;
> +		case TSTBUS_WRAPPER:
> +			prefix = "TSTBUS_WRAPPER ";
> +			break;
> +		case TSTBUS_UNIPRO:
> +			nminor = 256;
> +			prefix = "TSTBUS_UNIPRO ";
> +			break;
> +		default:
> +			break;
> +		}

Has it been considered to convert the above switch-statement into an
array lookup?

> @@ -1682,6 +1751,10 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
>   			ufs_qcom_dump_mcq_hci_regs(hba);
>   			usleep_range(1000, 1100);
>   		}
> +		ufshcd_dump_regs(hba, UFS_TEST_BUS, 4, "UFS_TEST_BUS ");
> +		usleep_range(1000, 1100);
> +		ufs_qcom_dump_testbus(hba);
> +		usleep_range(1000, 1100);
>   	}
>   }

Please add a comment that explains why the usleep_range() calls are
present.

Thanks,

Bart.



