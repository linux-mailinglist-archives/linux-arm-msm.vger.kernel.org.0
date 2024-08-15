Return-Path: <linux-arm-msm+bounces-28654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 831E79539A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43588287E36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 18:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2BB40862;
	Thu, 15 Aug 2024 18:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="Kb+NEWRb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3428F15CB;
	Thu, 15 Aug 2024 18:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723745356; cv=none; b=huYqUMOhRI5yCCAYO4ou20UN3OKcyfv2xdce489eoHxScBqvzaAdLWjioWJ/PreDe5rfn6fA4X8kBklhEvywi6En4cioa3UeAW/5ZbhCHkLVezqt5F56Tf9ONhODy7Eh+KRurtOLU4lGMCoHTk510c2Fn8nCZDQ6oATiGO5vW90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723745356; c=relaxed/simple;
	bh=frZUOPDI6r4oXtUSJp5jdlWJJUCeFssa+4qiDa7wp8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZL1tRmQXoE/PmK0oTSNd81SuhKPwT7GOjY+Z0u1TKI1X+kmAxApDwi7AQKSBjoM+fz2DttM7mNp6xzWP0K2vvR9HIzCmQhrrretiYRP2zbn3nsMAiKIjD+rtPsnBPMftd/PmocCgBvj6rpxgkTigBupBjbQwhIEsiEhYtc+yzOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=Kb+NEWRb; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4WlCn53pmTz6CmLxd;
	Thu, 15 Aug 2024 18:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1723745348; x=1726337349; bh=PFU6SLEQUuiaU+C9emyBOMa8
	6sRtrTtG40d9yWkPg68=; b=Kb+NEWRb96ItME8hVUcVyvxWbLDhdNSROcqVbF/1
	LV/6kTlJpYcSPJ07c5j8Ox/sXiVV0rfkgWhBlGakmJIGnvJAjBDXTXSXHY003akr
	Y8CDC/IHARTmDHI0jxHauydIrzhsyFcuzoBGJSaTGqaR3mInqW1KsS8MWgNJius5
	ed43//PmsvPb9XXIrnt12epQ2cmzELcvYiDhFcu4ikDcNUn/cjSLxNtjDtfqEiKq
	nQX2dYJpOh2JMgc3hfR3oUoZ3kZ/IKPNqgnFfj9VgbdJAqgeh5TdtW0RpM0HKDDg
	GNhRtipO4pblys88SfUHo1uwdLDG4vMzpyY4K4ggh+qrNA==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 7hXUfC8uDqmY; Thu, 15 Aug 2024 18:09:08 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4WlCmz4fH2z6CmM6d;
	Thu, 15 Aug 2024 18:09:07 +0000 (UTC)
Message-ID: <f339f1be-4d5f-46f4-8d57-473f38901bd8@acm.org>
Date: Thu, 15 Aug 2024 11:09:06 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ufs: core: Rename LSDB to LSDBS to reflect the
 UFSHCI 4.0 spec
To: manivannan.sadhasivam@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>,
 Amit Pundir <amit.pundir@linaro.org>
References: <20240815-ufs-bug-fix-v2-0-b373afae888f@linaro.org>
 <20240815-ufs-bug-fix-v2-1-b373afae888f@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240815-ufs-bug-fix-v2-1-b373afae888f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/24 10:16 PM, Manivannan Sadhasivam via B4 Relay wrote:
>   	/*
>   	 * The UFSHCI 3.0 specification does not define MCQ_SUPPORT and
> -	 * LSDB_SUPPORT, but [31:29] as reserved bits with reset value 0s, which
> +	 * LSDBS_SUPPORT, but [31:29] as reserved bits with reset value 0s, which
>   	 * means we can simply read values regardless of version.
>   	 */

Hmm ... neither MCQ_SUPPORT nor LSDBS_SUPPORT occurs in the UFSHCI 4.0 
specification. I found the acronyms "MCQS" and "LSDBS" in that
specification. I propose either not to modify the above comment or to 
use the acronyms used in the UFSHCI 4.0 standard.

>   	hba->mcq_sup = FIELD_GET(MASK_MCQ_SUPPORT, hba->capabilities);
> @@ -2426,7 +2426,7 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
>   	 * 0h: legacy single doorbell support is available
>   	 * 1h: indicate that legacy single doorbell support has been removed
>   	 */
> -	hba->lsdb_sup = !FIELD_GET(MASK_LSDB_SUPPORT, hba->capabilities);
> +	hba->lsdbs_sup = !FIELD_GET(MASK_LSDBS_SUPPORT, hba->capabilities);
>   	if (!hba->mcq_sup)
>   		return 0;

The final "s" in "lsdbs" stands for "support" so there are now two
references to the word "support" in the "lsdbs_sup" member name. Isn't
the original structure member name ("lsdb_sup") better because it 
doesn't have that redundancy?

>   	MASK_CRYPTO_SUPPORT			= 0x10000000,
> -	MASK_LSDB_SUPPORT			= 0x20000000,
> +	MASK_LSDBS_SUPPORT			= 0x20000000,
>   	MASK_MCQ_SUPPORT			= 0x40000000,

Same comment here: in the constant name "MASK_LSDBS_SUPPORT" there are
two references to the word "support". Isn't the original name better?
Additionally, this change introduces an inconsistency between the
constant names "MASK_LSDBS_SUPPORT" and "MASK_MCQ_SUPPORT". The former
name includes the acronym from the spec (LSDBS) but the latter name not
(MCQS). Wouldn't it be better to leave this change out?

Thanks,

Bart.

