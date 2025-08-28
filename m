Return-Path: <linux-arm-msm+bounces-71169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4393FB3A7C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 19:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F5001898184
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 17:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2D6335BB5;
	Thu, 28 Aug 2025 17:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="1gEKM/4C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA78176ADB;
	Thu, 28 Aug 2025 17:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756401770; cv=none; b=gx9HA4n0irOYksnk8db7/jh1M4g5CQS41zIvKU7N/oeBDQuIVlbPRmEJp7MmyAmtAh6vkYftJv8V2apAUbj6+6UoyDD3tgVy6PzRcMg3S51CYcajRfQPcUjSaQX3FgZ6QlTvGjg2whDawfjjmQSl5AIzHU+hQZ8hiZ7QuatySQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756401770; c=relaxed/simple;
	bh=C/gaTXy/0JJk7IW23NxiY1BKmydsHm3y9ndN33TgeAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hd+vQDZvKfNIXYtltESMx6WR6g11N0dNQ3Gk4fMYIEo/5ePEOinT/Bt7a6gyza9ZxWINSh9Hlw3TLVLv/SFhsWSf4+CE36xGlriEDCjdIBnnCRrJq/Vx1yw8o0YcSOBZYaybTwiBIS04PW0q4fyJuRXxJz23zTxtWcZxQb39mrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=1gEKM/4C; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4cCSs36WM0zlgqxy;
	Thu, 28 Aug 2025 17:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1756401765; x=1758993766; bh=C/gaTXy/0JJk7IW23NxiY1BK
	mydsHm3y9ndN33TgeAg=; b=1gEKM/4CY6RyW3OdXjJPaTq1TkHT+ExfLr+9Ib5T
	2S5wHT1ITqnJFQUs3XXqGc0OFT0DWnLFIVzElfHyzK9pV7cdj/j7GdCZiXbw58ft
	FDQrzD4MOJ9JnmdcSJ4eZJTIqWrfzUdh9jt+PJZSBJhZOEz5MuqGexiINFr0CARR
	PUldR39rOaOlpwbU7tPQ57ykVX5kaZ5CFuJmhnp2pCtO2TxlZLMRlPaRKSS3k/rc
	tEWaztWOJE8y7JVnuyk7i4u3h4l+o63BXQwxnfM/Ju0GbNLqVxhagMvqv5onwPQ7
	SDse7ap3anu8g7eCWyxb4E0PpG1iM2fUdXCXyK1qr/YcNw==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id LeCwucKU7Rnb; Thu, 28 Aug 2025 17:22:45 +0000 (UTC)
Received: from [172.20.6.188] (unknown [208.98.210.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4cCSrk656mzlgqxj;
	Thu, 28 Aug 2025 17:22:29 +0000 (UTC)
Message-ID: <cf203807-77ab-463c-b0b0-4a1cec891fe6@acm.org>
Date: Thu, 28 Aug 2025 10:22:28 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/4] ufs: dt-bindings: Document gear and rate limit
 properties
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, alim.akhtar@samsung.com,
 avri.altman@wdc.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mani@kernel.org, James.Bottomley@HansenPartnership.com,
 martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250826150855.7725-1-quic_rdwivedi@quicinc.com>
 <20250826150855.7725-2-quic_rdwivedi@quicinc.com>
 <9944c595-da68-43c0-8364-6a8665a0fc3f@acm.org>
 <8d705694-498a-4592-b93a-7df6a1dd5211@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <8d705694-498a-4592-b93a-7df6a1dd5211@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 8/28/25 9:45 AM, Ram Kumar Dwivedi wrote:
> On 26-Aug-25 9:05 PM, Bart Van Assche wrote:
>> On 8/26/25 8:08 AM, Ram Kumar Dwivedi wrote:
>>> +=C2=A0 limit-rate:
>>> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
>>> +=C2=A0=C2=A0=C2=A0 enum: [1, 2]
>>> +=C2=A0=C2=A0=C2=A0 default: 2
>>> +=C2=A0=C2=A0=C2=A0 description:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Restricts the UFS controller to Rate =
A (1) or Rate B (2) for both
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TX and RX directions, often required =
in automotive environments due
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to hardware limitations.
>>
>> As far as I know no numeric values are associated with these rates in
>> the UFSHCI 4.1 standard nor in any of the previous versions of this
>> standard. Does the .yaml syntax support something like "enum: [A, B]"?
> Hi Bart,
>=20
> As per the MIPI UniPro spec:
>=20
> In Section 5.7.12.3.2, the hs_series is defined as:
> hs_series =3D Flags[3] + 1;
>=20
> In Section 5.7.7.1, Flags[3] is described as:
> Set to =E2=80=980=E2=80=99 for Series A and =E2=80=981=E2=80=99 for Ser=
ies B (PA_HSSeries).
>=20
> While issuing the DME command from the UFS driver to set the rate,
> the values 1 and 2 are passed as arguments for Rate A and Rate B
> respectively. Additionally, the hs_rate variable is of type u32.

Hi Ram,

Thanks for having looked this up.

Since it is much more common to refer to these rates as "Rate A" and
"Rate B" rather than using numbers for these rates, please change the
enumeration labels into something like "Rate_A" and "Rate_B".

Thanks,

Bart.

