Return-Path: <linux-arm-msm+bounces-41139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4722B9E9E19
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 19:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE8141658DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 18:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA6E165F16;
	Mon,  9 Dec 2024 18:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="EHl6HNng"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9217E14A4DF;
	Mon,  9 Dec 2024 18:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733769354; cv=none; b=VkFSVUZ+rDaoEUqaieKrpA69vpokMPWYS1fO07mrWVOfM6BhN8hv8q7/db9rd7PghHkzDAI/adbTdOIOT6ZphuvHoHhLpKsYME/Pw1K5Lmy3tXtdk3iqrI+Kl3LLEfpztDLsSWInZqiO7QKt56YqVxIiviAmmhqcgRFx8ivHfco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733769354; c=relaxed/simple;
	bh=FikoH/OLAp90CZxx8fi+jVVT/nEKJxV6h3uquUAYhow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxE5sVcEi/JPFcyqZkU+/JIbHeVwVtCg6Dmd24Qsp4J+jgTOw4Hr+FtI/yj3g017ckYbc/eYNSFjEo1k37sBmELT1pmJh5pp1VBGdn4Q9xs3KRVUpoPDFusxq2Y2HyJArmMTaS9bZ1zgHHj7cmeEPn4qnSzUX4nQVSvQOUrj0NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=EHl6HNng; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Y6VtG5scgzlfflk;
	Mon,  9 Dec 2024 18:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1733769346; x=1736361347; bh=BfyQAJGAVo12eipLGdGPpy0O
	2Dp5VbPjMP7VeXdAo8Y=; b=EHl6HNngujAV/9vws1c/1zUHz1gnSU6iwgwA6u2L
	Mdz6wP3H0zQjk1ApGDeJiVNgAwMBUKYNyjpBmKX9wXJkA1hunarorQhEPJszHnND
	6ivvjE1uKCVhoWETAEeTDh9jbknoNDa6268Q4Fz39rimTUBB+XsbeBJ/UpR3eGZT
	Wy5rD/M0vGqB4eaXbzUD3kyePMViV6YzqgO198orvmvWVFAHSK4YQZZGtG5f5FAR
	c8ZXeGuGdHIAXpNtPeoIRUde1w9VpBdIliH5ByjxQWV9r3EwnvD/ObHTplkQhM9A
	lnoAEvqi14HNW5dQyMC/rD+SLzzhueuUKJURKZBzFnohwQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id vdpo-xe8nAIa; Mon,  9 Dec 2024 18:35:46 +0000 (UTC)
Received: from [192.168.50.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Y6Vt62HvvzlfflL;
	Mon,  9 Dec 2024 18:35:41 +0000 (UTC)
Message-ID: <3a850d86-5974-4b2d-95be-e79dad33636f@acm.org>
Date: Mon, 9 Dec 2024 10:35:39 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] scsi: ufs-qcom: Enable Dumping of Hibern8, MCQ, and
 Testbus Registers
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>,
 Manish Pandey <quic_mapa@quicinc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com
References: <20241025055054.23170-1-quic_mapa@quicinc.com>
 <20241112075000.vausf7ulr2t5svmg@thinkpad>
 <cb3b0c9c-4589-4b58-90a1-998743803c5a@acm.org>
 <20241209040355.kc4ab6nfp6syw37q@thinkpad>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20241209040355.kc4ab6nfp6syw37q@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/8/24 12:03 PM, Manivannan Sadhasivam wrote:
> On Tue, Nov 12, 2024 at 10:10:02AM -0800, Bart Van Assche wrote:
>> On 11/11/24 11:50 PM, Manivannan Sadhasivam wrote:
>>> On Fri, Oct 25, 2024 at 11:20:51AM +0530, Manish Pandey wrote:
>>>> Submitting a series of patches aimed at enhancing the debugging and monitoring capabilities
>>>> of the UFS-QCOM driver. These patches introduce new functionalities that will significantly
>>>> aid in diagnosing and resolving issues related to hardware and software operations.
>>>>
>>>
>>> TBH, the current state of dumping UFSHC registers itself is just annoying as it
>>> pollutes the kernel ring buffer. I don't think any peripheral driver in the
>>> kernel does this. Please dump only relevant registers, not everything that you
>>> feel like dumping.
>>
>> I wouldn't mind if the code for dumping  UFSHC registers would be removed.
> 
> Instead of removing, I'm planning to move the dump to dev_coredump framework.
> But should we move all the error prints also? Like all ufshcd_print_*()
> functions?

Hmm ... we may be better off to check which of these functions can be 
removed rather than moving all of them to another framework.

Thanks,

Bart.


