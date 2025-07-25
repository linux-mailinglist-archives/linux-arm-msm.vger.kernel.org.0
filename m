Return-Path: <linux-arm-msm+bounces-66739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 809C6B125FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 23:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D8EF1CC0A1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 21:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4EA25CC69;
	Fri, 25 Jul 2025 21:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="Pb1/uN8e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22818224225;
	Fri, 25 Jul 2025 21:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753477738; cv=none; b=gm8BphntC+Ni8ELKurBGrtYo4U4OIpfoDr/5N1Y86vo/YJJiDeYpT2iHS1s0rZNCblQJ405dcWFOcEikaJuxljxZpUbhipe2sjPbhz5g8DuO/wvvOk/v2BOMiXgULnwKBUjPSnaNRAN5PpXN/OfZzGrkEriOWTZv+XGfBb3boJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753477738; c=relaxed/simple;
	bh=15RyTr4RmZ9HnrJ3N7IHIqyT4wgzIOUmPBJRpd+Hzoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFngUNjJfq0M3gMX2QA0r2DxeVaK55Tq+V7oo2W3IvTtQohsjNfOYu0Omkn1WDhHYigtI68tBdTTBVAbL7L+JbVfAmjjTA/FFYd3XxDdluuSgkWtnpCqyOqQTUp3AjAZIAc3vk+OBTjpRb7WgJckia6aXcvUOao7pBta7vbAbpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=Pb1/uN8e; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bpgTf6025zm174C;
	Fri, 25 Jul 2025 21:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1753477731; x=1756069732; bh=bRiZPnDhWKDfdU+eRq8PCZeA
	SI8wNiw7DOE1Rlr/5No=; b=Pb1/uN8epUgzcEivLUfApsnXyhMHKXDpnvyDke9Y
	HHwLfr2d+HamUy0Y0ity/gc3+pPqFLm1GWkE1PBCyG2YLHZmC2keMtMGTZhKPnnb
	e77Pd+B2Vvb1+mRseZNH3zKKtP4cS2qWjaSNVXuMw5KuzvZQjroHAxuTZlin2653
	M5Fr6GtrQtjljqrMmkFfoAXSOhw4tkIJ3OvOsaI2KfVR0AkQHaIcEuqx+iVhdUrj
	kddkr5de6Nnp1uKMNKJfQt9fZEPKG2uiLe4u+3fAHpKlNrnbUiwH2D/EUXRDytxP
	xUYIKNUHFZ371ToUwhU2BGouxeCDpMOrUCsKvMCPVtI/Gg==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Y5oojwscMG0B; Fri, 25 Jul 2025 21:08:51 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bpgTN2xV8zm0yQP;
	Fri, 25 Jul 2025 21:08:38 +0000 (UTC)
Message-ID: <c57a2ca7-b0c9-4e52-9d9d-5c06c7f56f1a@acm.org>
Date: Fri, 25 Jul 2025 14:08:37 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] scsi: ufs: core: move some irq handling back to
 hardirq (with time limit)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Will McVicker <willmcvicker@google.com>,
 Manivannan Sadhasivam <mani@kernel.org>, kernel-team@android.com,
 linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250725-ufshcd-hardirq-v2-0-884c11e0b0df@linaro.org>
 <20250725-ufshcd-hardirq-v2-2-884c11e0b0df@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250725-ufshcd-hardirq-v2-2-884c11e0b0df@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 7/25/25 7:16 AM, Andr=C3=A9 Draszik wrote:
> -	for_each_set_bit(tag, &completed_reqs, hba->nutrs)
> +	for_each_set_bit(tag, &completed_reqs, hba->nutrs) {
>   		ufshcd_compl_one_cqe(hba, tag, NULL);
> +		__clear_bit(tag, &completed_reqs);
> +		if (time_limit && time_after_eq(jiffies, time_limit))
> +			break;
> +	}

Has it been considered to use time_is_before_eq_jiffies(time_limit)
instead of open-coding it?

> @@ -5636,15 +5670,34 @@ static int ufshcd_poll(struct Scsi_Host *shost,=
 unsigned int queue_num)
>   	WARN_ONCE(completed_reqs & ~hba->outstanding_reqs,
>   		  "completed: %#lx; outstanding: %#lx\n", completed_reqs,
>   		  hba->outstanding_reqs);
> -	hba->outstanding_reqs &=3D ~completed_reqs;
> +
> +	if (completed_reqs) {
> +		pending =3D __ufshcd_transfer_req_compl(hba, completed_reqs,
> +						      time_limit);
> +		completed_reqs &=3D ~pending;
> +		hba->outstanding_reqs &=3D ~completed_reqs;
> +	}
> +
>   	spin_unlock_irqrestore(&hba->outstanding_lock, flags);
>  =20
> -	if (completed_reqs)
> -		__ufshcd_transfer_req_compl(hba, completed_reqs);

This change moves the __ufshcd_transfer_req_compl() call from outside to
inside the critical section. I expect this to impact performance
negatively because it makes it significantly more likely that the
command submission code will have to wait while the completion code is
holding hba->outstanding_lock. Can this be avoided, e.g. by limiting the
number of commands that are completed instead of the time spent in
interrupt context? usecs_to_jiffies(HARDIRQ_TIMELIMIT) will round up
the time limit anyway from 20 microseconds to 1/HZ (one millisecond?).

Thanks,

Bart.

