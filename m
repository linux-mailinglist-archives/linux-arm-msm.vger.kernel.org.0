Return-Path: <linux-arm-msm+bounces-37687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4899C5FF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 19:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5792284FCB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 18:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511ED2161F8;
	Tue, 12 Nov 2024 18:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="0FVrwnpo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FF5215C55;
	Tue, 12 Nov 2024 18:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731435017; cv=none; b=RzcZgmZWaXQd1NrdfpucCjBtFKepLphPmEzKxPkZhK/cPg/0jChVyeHXxzbai5sillE6UFzQ+Zbkscle2GL6TuPUQhjQJOoetgzzdu4rbgJ39avmnn/UKJLifOYQNvRqpIebQpYNvyGmYa5qwVRPn/TCST2YMrc8Uw3ByVEAo8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731435017; c=relaxed/simple;
	bh=cQNF8sqDey2exlLOHgSvw5x7MKZ5aOz8+xnxhyeYDy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPS41jeJYGtySirN+kIVNk57Zkj9ovonJsI0O/m3PQbLJWGpkSwhqejs1E4vXMKI6WvvpJCaNecM8fFQK4ETTHKdVNf/AS9fb9otxGqbu54PKI4O7/Fg6xSz+YI/XU8qq2b8vLeHRNYvyz9273dw0yqhzfyE8CnQrZ7sZNbUc88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=0FVrwnpo; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4XnvbB4NKPzlgMVh;
	Tue, 12 Nov 2024 18:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1731435011; x=1734027012; bh=OnTouWYoGANIM6Er2wgBFd/G
	9z2tKXnnqtxhxZfEEyU=; b=0FVrwnpo9hrNXKz9rXENeRTJMNxM6PcM/Y2pTbhn
	NP9sdmBgnKjaZOl8Q6KCaBKKpqte8MAthVoz9QJoEmiDnL09fFnva/V7TWKjNvMz
	JTcKlDWHZHd9D9yFrBnKj1pajYu+CcgWWhfGgOXtD6GWqYRhd6O1LO1XAYcUoqZY
	cyeDwockPKPrpuBttC3kRACzR8rTdnHQG6AlMImVgnqHhh/2tRnsfie1FjyeJ/Hl
	1qN/1qmqg9SE21+nhmf7kn1pJYmK9FQPis3vjuNeHediYUsA7N7bl5SH2fvTDntV
	K1pe8OWcE26YAOQSzxXFECzJgNiTyWjQz623VluZrEYagA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id gbdu87m0IOPq; Tue, 12 Nov 2024 18:10:11 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Xnvb16nBNzlgMVc;
	Tue, 12 Nov 2024 18:10:05 +0000 (UTC)
Message-ID: <cb3b0c9c-4589-4b58-90a1-998743803c5a@acm.org>
Date: Tue, 12 Nov 2024 10:10:02 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] scsi: ufs-qcom: Enable Dumping of Hibern8, MCQ, and
 Testbus Registers
To: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>,
 Manish Pandey <quic_mapa@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com
References: <20241025055054.23170-1-quic_mapa@quicinc.com>
 <20241112075000.vausf7ulr2t5svmg@thinkpad>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20241112075000.vausf7ulr2t5svmg@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/24 11:50 PM, Manivannan Sadhasivam wrote:
> On Fri, Oct 25, 2024 at 11:20:51AM +0530, Manish Pandey wrote:
>> Submitting a series of patches aimed at enhancing the debugging and monitoring capabilities
>> of the UFS-QCOM driver. These patches introduce new functionalities that will significantly
>> aid in diagnosing and resolving issues related to hardware and software operations.
>>
> 
> TBH, the current state of dumping UFSHC registers itself is just annoying as it
> pollutes the kernel ring buffer. I don't think any peripheral driver in the
> kernel does this. Please dump only relevant registers, not everything that you
> feel like dumping.

I wouldn't mind if the code for dumping  UFSHC registers would be removed.

Thanks,

Bart.

