Return-Path: <linux-arm-msm+bounces-49555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A55A469F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 19:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 186EE3A3F78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 18:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3199522D794;
	Wed, 26 Feb 2025 18:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="ZQkU8DK9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428BF2222CF;
	Wed, 26 Feb 2025 18:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740595260; cv=none; b=nMzXkUS8a7okGoWm/TcJUDahBVzaPobaFN6p3g5sUOzwAWD9iJtUdRbPWA5aQqoIoB2xgs9aGKSObZA6It2vEpEswbIzKH7i/FgZyFJTchB0i7JduR8BU1rPP4SQxeyPF4zo3l6nikqlja+U72WYN2JU66iJvgGAKZyNBZ3Vl7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740595260; c=relaxed/simple;
	bh=XDo3dXB3ZepMkRvo5YjK5g4NfObnn16Macr8zt68RMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=udL108SLbOTPt97c7khlakddzLJQRcqrm0iH1LuoSTkVey8mcX0miEVIG2gVZUrleSzeFm/YUdb++OvsPIGNgbTpBi/VcTY5xa+SIneX5fR9+PFgoLd4zyDLGC18H28Zy7BWNSVYcah53Gks3wrYigTYS4/EiYokQGkV9sRr504=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=ZQkU8DK9; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Z33Fj4mxNzlm4Yd;
	Wed, 26 Feb 2025 18:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1740595256; x=1743187257; bh=egOgaD1Wy/xQmlMQKt5dzZhV
	EvaTAscpf2ST+vETF70=; b=ZQkU8DK9G2NgT6E4oJk9OcmTtOTG71QBNvuYIR32
	/5kftq6h+AfSPcR2P0tOxsCqVaUKhWTSLON7vpCRDwJAcS4yLtCoRMc1oq/jnWod
	H/YXaw6GTqVpzts5ozwnH0I9lu54owIEeADPa/kQdDGPr6TdI0EOpgry+Q4lXrmM
	EsgtLjhUaTfGAZxF3YtGrbAYJ2WqOVlbnZSFR+VoQo3kEwzKzNCjywCcUN3hjZ7Q
	L+EcNv+cKNznPAPKpqxT7HUt61bY8HNJt2VQA/K4RuYsobmKsX7EhQ1w3M0oE6+v
	CJxWmd+7fJXbXmovqseRF2H42h+sG+ziEeAR/1m7GfV4gA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id EQd11jh3aRYl; Wed, 26 Feb 2025 18:40:56 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Z33Fd6S6Hzlsfvx;
	Wed, 26 Feb 2025 18:40:53 +0000 (UTC)
Message-ID: <6eb9ec05-96f1-41d2-b055-56e34d5722ae@acm.org>
Date: Wed, 26 Feb 2025 10:40:51 -0800
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
 <3a850d86-5974-4b2d-95be-e79dad33636f@acm.org>
 <20250226053019.y6tdukcqpijkug4m@thinkpad>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250226053019.y6tdukcqpijkug4m@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/25/25 9:30 PM, Manivannan Sadhasivam wrote:
> On Mon, Dec 09, 2024 at 10:35:39AM -0800, Bart Van Assche wrote:
>> On 12/8/24 12:03 PM, Manivannan Sadhasivam wrote:
>>> On Tue, Nov 12, 2024 at 10:10:02AM -0800, Bart Van Assche wrote:
>>>> On 11/11/24 11:50 PM, Manivannan Sadhasivam wrote:
>>>>> On Fri, Oct 25, 2024 at 11:20:51AM +0530, Manish Pandey wrote:
>>>>>> Submitting a series of patches aimed at enhancing the debugging and monitoring capabilities
>>>>>> of the UFS-QCOM driver. These patches introduce new functionalities that will significantly
>>>>>> aid in diagnosing and resolving issues related to hardware and software operations.
>>>>>>
>>>>>
>>>>> TBH, the current state of dumping UFSHC registers itself is just annoying as it
>>>>> pollutes the kernel ring buffer. I don't think any peripheral driver in the
>>>>> kernel does this. Please dump only relevant registers, not everything that you
>>>>> feel like dumping.
>>>>
>>>> I wouldn't mind if the code for dumping  UFSHC registers would be removed.
>>>
>>> Instead of removing, I'm planning to move the dump to dev_coredump framework.
>>> But should we move all the error prints also? Like all ufshcd_print_*()
>>> functions?
>>
>> Hmm ... we may be better off to check which of these functions can be
>> removed rather than moving all of them to another framework.
> 
> devcoredump turned out to be not a good fit for storage drivers. And I can't
> figure out another way. And Qcom is telling me that these debug prints are
> necessary for them to debug the issues going forward.
> 
> Your thoughts?

Does this mean that printk() is the best alternative we have available?

Thanks,

Bart.

