Return-Path: <linux-arm-msm+bounces-66608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B7CB10F5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 18:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3C727A90B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAFD524061F;
	Thu, 24 Jul 2025 16:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="D90XsZn9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4EB1CEADB;
	Thu, 24 Jul 2025 16:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753372991; cv=none; b=lY9veo4m6d1arorzMkjZkogJWmAJ4h4kbib24rWIQDYJlaKp8YYUoVDVym9KStfDUpgIYt1GrHe8YwYvzG+DOVqGOACnVDmuUIAXFxdDFfmKQNo2QU+hweebEdQK66NcBXiH+ggkOjnXbeecp33IbJB3em2Z9JQDfNENPUhofH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753372991; c=relaxed/simple;
	bh=ZKsrlI5uWpnqWyz1pRhE4mVbACa1yRJow6Ieh+v/JKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hx9DM2/gi9IaD3hcclEnh7z9ogP+AlboyaOI01kSQIKCZ9pc7QnSUWWizh5mF3ewWJ151cWW7VddwJ5whn1+8V1mAB/9IlT2GBpIl1mog1KyA+Hsc/vIzuNYkV4FqOOQgu0DggqblgEgyB9AvF3Id+Yv0gpE1Cfm7LZ/o6kvPck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=D90XsZn9; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bnwlJ6zsHzm174F;
	Thu, 24 Jul 2025 16:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1753372986; x=1755964987; bh=1BMWsZb686kkma4GPKSPs+SJ
	x+Nv5KCT8amvwXdBDME=; b=D90XsZn9644qMiYgCc+mSA6IuJniuyGYro8o2Z6T
	bgjjvJYheGPDS0vq79QDU8uQBrsvuOkQlwL4W6Hynj9LNFP009gCJf9vZuR1MjWq
	WKFh6epzYsHlwsug/XWNOtNJP8T4ZLefcijtx6ZzTakykbqnlNfi2k9+ZPJHoEty
	WYrsgCCh5i2hpEC6Rm6JAXdH4v4cVS6DqNQQG1K4geBFoSndZFGQRtqBEMOPP1+4
	XuFgBXrKHViFoo57MwLDRAaUbCQ1vKN7lQKX/wCoNUvtCR0SLFC1xy8kQGGnN9W2
	rtFfJWmDJqvSxbc7g8FiFg8E+MnUoVlvevG9tsXxRQVPbA==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 7j1uGWR_EaaT; Thu, 24 Jul 2025 16:03:06 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bnwl408Mzzm174X;
	Thu, 24 Jul 2025 16:02:55 +0000 (UTC)
Message-ID: <2e7c2be8-dc58-4e18-9297-e8690565583b@acm.org>
Date: Thu, 24 Jul 2025 09:02:54 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: ufs: core: move some irq handling back to hardirq
 (with time limit)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Will McVicker <willmcvicker@google.com>,
 Manivannan Sadhasivam <mani@kernel.org>, kernel-team@android.com,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250724-ufshcd-hardirq-v1-1-6398a52f8f02@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250724-ufshcd-hardirq-v1-1-6398a52f8f02@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 7/24/25 2:54 AM, Andr=C3=A9 Draszik wrote:
> @@ -5656,19 +5689,39 @@ static int ufshcd_poll(struct Scsi_Host *shost,=
 unsigned int queue_num)
>   	WARN_ONCE(completed_reqs & ~hba->outstanding_reqs,
>   		  "completed: %#lx; outstanding: %#lx\n", completed_reqs,
>   		  hba->outstanding_reqs);
> -	if (queue_num =3D=3D UFSHCD_POLL_FROM_INTERRUPT_CONTEXT) {
> -		/* Do not complete polled requests from interrupt context. */
> +	if (time_limit) {
> +		/* Do not complete polled requests from hardirq context. */
>   		ufshcd_clear_polled(hba, &completed_reqs);
>   	}

This if-statement and the code inside the if-statement probably can be
left out. This if-statement was introduced at a time when the block
layer did not support completing polled requests from interrupt context.
I think that commit b99182c501c3 ("bio: add pcpu caching for non-polling
bio_put") enabled support for completing polled requests from interrupt
context. Since this patch touches that if-statement, how about removing
it with a separate patch that comes before this patch? Polling can be
enabled by adding --hipri=3D1 to the fio command line and by using an I/O
engine that supports polling, e.g. pvsync2 or io_uring.

Thanks,

Bart.

