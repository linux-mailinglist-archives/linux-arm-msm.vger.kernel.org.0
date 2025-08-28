Return-Path: <linux-arm-msm+bounces-71175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BEAB3AA03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 20:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5954E173348
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 18:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3F8273D7B;
	Thu, 28 Aug 2025 18:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="j+SgAZgk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5D218E377;
	Thu, 28 Aug 2025 18:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756405672; cv=none; b=O/B0UQFNu5MzojZghA/IPksFZtMkHFeDtrEEmhGuLVdC/vpRm4AYns6N8YDF10zFUIYS0I78FkEUyOz7I6f0zGyOphw4PllIq4B8Wq/FUPMks6ahnNdIVGDWUXGBMYj4k5JBYtZj2xFKOVKclU8V+ikd6PpYi+zYPir3M5iwRRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756405672; c=relaxed/simple;
	bh=18LdtOFXKOJg3DyeNVbctOmZ9oWQXbv1iQ5ztloYB9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ARRUIo0O+EKfCaXM5/c266TnCsfjTEatzIKhw7QiNOG3suCwOCXS63RHi4BWp/Wfkx4bHnu3PbkueOBuSofnYtxB5MbclOneJ5s/b02/4uuI8Xc7K5W70z530kx9GRLLxfXA/BeHmLeG0nOWSRIo4J9nBu5HsTuoB4MJgiRLZE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=j+SgAZgk; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cCVJ56flyzm0yVg;
	Thu, 28 Aug 2025 18:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1756405667; x=1758997668; bh=fCFTF+N52C0czaoE9/4vxFQB
	xphUlPInr06EwfDDb9I=; b=j+SgAZgkMBU19DRwZPXuxMzFRgPi0POAgw0g/NOu
	ReCp+FMIqntcO3eOksN1qDUl5NCoS0017rrgDPD/6Yf1LFzu7Fr29slzScEZyGts
	cl/IUVU+VA/LcztImzJqzkTXiQ0Fh1wCszpK/YCPehSxeANj1qo6wfPTOUZoCVVW
	rsKcxYumAfFjfhrFCnOuJ8mTeqKnCF8U2y8e9hQPsSHijwK/MRZ4W3oXQNDMHdrh
	ebepTY2tD5081yAtDSWiTekuxuiKYr6pwptKSo7X9Ny8Wqo8YyG0EXSU7dzgRE3c
	+MLI5ZvcETsj/vpLXFgjBG2pye0EIY1QgotGCWE8tNd+wg==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id D9hLUZSu0D4v; Thu, 28 Aug 2025 18:27:47 +0000 (UTC)
Received: from [172.20.6.188] (unknown [208.98.210.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cCVHq1FqPzm0yVV;
	Thu, 28 Aug 2025 18:27:34 +0000 (UTC)
Message-ID: <1824553d-a038-4ba8-941e-cad64875cb92@acm.org>
Date: Thu, 28 Aug 2025 11:27:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/4] ufs: dt-bindings: Document gear and rate limit
 properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, alim.akhtar@samsung.com,
 avri.altman@wdc.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mani@kernel.org, James.Bottomley@HansenPartnership.com,
 martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250826150855.7725-1-quic_rdwivedi@quicinc.com>
 <20250826150855.7725-2-quic_rdwivedi@quicinc.com>
 <9944c595-da68-43c0-8364-6a8665a0fc3f@acm.org>
 <25844eea-a41c-4a36-b132-8824e629568d@kernel.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <25844eea-a41c-4a36-b132-8824e629568d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/25 10:40 AM, Krzysztof Kozlowski wrote:
> On 26/08/2025 17:35, Bart Van Assche wrote:
>>
>>> +  limit-rate:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum: [1, 2]
>>> +    default: 2
>>> +    description:
>>> +      Restricts the UFS controller to Rate A (1) or Rate B (2) for both
>>> +      TX and RX directions, often required in automotive environments due
>>> +      to hardware limitations.
>>
>> As far as I know no numeric values are associated with these rates in
>> the UFSHCI 4.1 standard nor in any of the previous versions of this
>> standard. Does the .yaml syntax support something like "enum: [A, B]"?
> 
> That's what I also requested and answer was "1" and "2" are coming from
> the spec. So now I am confused.

Ram quoted from the MIPI spec. That's another standard than what I
referred to (UFSHCI).

Bart.

