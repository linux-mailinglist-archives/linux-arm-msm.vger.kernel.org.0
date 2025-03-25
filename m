Return-Path: <linux-arm-msm+bounces-52452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B98A6F5B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 12:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BDE77A5AEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 11:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D172561B7;
	Tue, 25 Mar 2025 11:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="sQFE3dpm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035FD2561C6;
	Tue, 25 Mar 2025 11:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742902994; cv=none; b=LPBASq1g9TZQ4BXIFu1Qmdbu7odDe6NNWWQ0vtMEQ2+0I+jnqJ2Y+kVzKwb5JmOX0sYGeoi5xHa//Rx/1iM3kF1pj5/ffG6r3EbVnaeSEgAaH50qQqQvm/zjwAfokQ87ktwd1Pmkq81EHwwzVmO3V4wEpOpJM+8tsxMvwx78YvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742902994; c=relaxed/simple;
	bh=FT1Qqx606bhJGVCZ1XZfe4LWb4KNQw3rn1mJv9tejME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QeRB3cKgIBrPEs6ewf6IOXv7O+T0H2CNVB7lP0Q+8v2HQAg1V4m3t6/kuhFv70P/JKHUynI67Es6CA+6DCp8Z1WaeRiCRKE0mEExAqxIQrABUmc8lwEwrdU/DPXHU7wNaqodbXmiZVv4G3uZleglkMBZG2At5iiAOyDdJGHa3Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=sQFE3dpm; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4ZMSj56QLjzlnfZK;
	Tue, 25 Mar 2025 11:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1742902984; x=1745494985; bh=BNiUdiP+epirUViNMTGnDH+f
	CGTBkwR40/2dF4B+vp0=; b=sQFE3dpm8Ou4O4sOZdBxEM2VOFMIBFO06eo9B38v
	Eq551y+s9H0KPKmcjr9ckifpyupoIIBAQZQnb8Hg8Smj4sqJbbdHgYOAcw1cPJrJ
	qy9THuVtMYkZPd0oTp7W+R4s0UDUTNAEeikULQfGU3Z51HcaPGmeABXI6gwxDy+m
	MCaf+crRaq3t0LKfxj85G/oKTWvby+U+4xO3itft4hbMXgVqMN9JBRDdEcwV5ZUi
	hQFa0nYN6OCeRRWVeapNiHMuKK0GltTyR2+vpDbfopV4wa294JDR7UFtSC9nhcOD
	5yRnwVyULb11ZZbOgUKUuaemWkoPmi/GwB50QI50EIYVgQ==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 8QgvwYss6EyF; Tue, 25 Mar 2025 11:43:04 +0000 (UTC)
Received: from [172.22.32.156] (unknown [99.209.85.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4ZMShv4yWrzlrwfT;
	Tue, 25 Mar 2025 11:42:54 +0000 (UTC)
Message-ID: <c0691392-1523-4863-a722-d4f4640e4e28@acm.org>
Date: Tue, 25 Mar 2025 07:42:53 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ufs: qcom: Add quirks for Samsung UFS devices
To: Manish Pandey <quic_mapa@quicinc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com,
 quic_bhaskarv@quicinc.com, quic_rampraka@quicinc.com, quic_cang@quicinc.com,
 quic_nguyenb@quicinc.com
References: <20250325083857.23653-1-quic_mapa@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250325083857.23653-1-quic_mapa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/25 4:38 AM, Manish Pandey wrote:
> Introduce quirks for Samsung UFS devices to override PA hibern8 time,
> PA TX HSG1 sync length, and TX_HS_EQUALIZER for the Qualcomm UFS Host
> controller. These adjustments are essential to maintain the proper
> functionality of Samsung UFS devices for Qualcomm UFS Host controller.

Which of these quirks are required for all host controllers and which of
these quirks are only required for Qualcomm host controllers?

> +	equalizer_val = (gear == 5) ? DEEMPHASIS_3_5_dB : NO_DEEMPHASIS;

I think that the parenthesis can be removed from the above statement
without reducing readability of the code.

Thanks,

Bart.

