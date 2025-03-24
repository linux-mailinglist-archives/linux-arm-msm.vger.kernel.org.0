Return-Path: <linux-arm-msm+bounces-52308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F896A6D8CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 12:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FA8316AC52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 11:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217DA1487D1;
	Mon, 24 Mar 2025 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="yOI7/oRW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA252C80;
	Mon, 24 Mar 2025 11:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742814160; cv=none; b=bWC6rx4e3O+0lS/t9n9LfCoZmFgf4BV4GsIoCMwqoXaLyAC1CsKW4P9BvTT0hc+AU3QA6sRAaoj1nOOdLkAHnTFKr9VBMCg7C335rF/NOMyRB466XnSy8CCwGlLS0eAKN+k+b8BEC0whvZmWAZOcZN3cXt6Dt1JNiRxA+q4IVf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742814160; c=relaxed/simple;
	bh=1JesYhBF8Hs5fgCeMj1bwvbhhCqj11DO9tdHIVFb1Do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BUg+qhRjEF/aoeNSQzbpNmxIgveuNr8fmx+Zl7GoapYBY9riOZ/XoN2lN4n7HubKnvsX/3Y5GXMshR+1lKsLxjHt9BwqJXQrwMC6jrFdUe55Xy/0B6TYvnMreBcKj6tARvqAvPRrAqTBeOrBDuVSgvtSh6Qi1e1iOd138Wwty1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=yOI7/oRW; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4ZLqrs2LSTzlrnRb;
	Mon, 24 Mar 2025 11:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1742814155; x=1745406156; bh=AHVZb8o6xuG6edhOIrcokBGX
	1qq9SAaDQUp+MtVAobs=; b=yOI7/oRWbEdY8h+Q2AzHj84P2zpRfC8oEyrPGWLr
	RdHKQYpLEX7Knunn/C6wVaby9+vXfAjkqXwLa9+ZT9T2F3xsuqBBV0eSH4uzEr8W
	7vf7rZczG/+wz4WZN2GHs95Dk91ZP09uxYatS1giQIJJnhbsmfdhlg8q4f+fCUmN
	hqPY0Zp6DpD85Ld/snXwHs0s626II3qnciP1kfwCB3QBTddHZH0X2cDrwIRS23uD
	X+009ZfA92wyuZAR8O+F63ENcQLhvD/F9QFYiBoPfmS6iLaBfdXdSadWiyQQASte
	sfx1lihrPUK2UOzLM3PtEBiYYwIsf+ulPHqXGa1bFWBZlA==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Sv3ohFgoL4sO; Mon, 24 Mar 2025 11:02:35 +0000 (UTC)
Received: from [172.22.32.156] (unknown [99.209.85.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4ZLqrh17H8zm8kvP;
	Mon, 24 Mar 2025 11:02:26 +0000 (UTC)
Message-ID: <e9f33f59-da1f-426b-8bdd-3c47397abf29@acm.org>
Date: Mon, 24 Mar 2025 07:02:25 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] ufs: delegate the interrupt service routine to a
 threaded irq handler
To: neil.armstrong@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250321-topic-ufs-use-threaded-irq-v1-1-7a55816a4b1d@linaro.org>
 <31b46812-72d5-4f9d-b55d-16a6e10afe7d@acm.org>
 <d084e50e-8b2b-4820-a5e7-25ec440d128e@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <d084e50e-8b2b-4820-a5e7-25ec440d128e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 3/24/25 5:31 AM, Neil Armstrong wrote:
> On 21/03/2025 17:20, Bart Van Assche wrote:
>> - Instead of retaining hba->ufs_stats.last_intr_status and
>> =C2=A0=C2=A0 hba->ufs_stats.last_intr_ts, please remove both members a=
nd also
>> =C2=A0=C2=A0 the debug code that reports the values of these member va=
riables.
>> =C2=A0=C2=A0 Please also remove hba->intr_en.
>=20
> Hmm ok so no need for the IRQ debug code anymore ? I guess this should
> be in a separate cleanup patch.

Hi Neil,

There are two reasons why I propose to remove that code:
- I don't think that it is possible to keep that code and switch to
   threaded interrupts without a measurable negative performance impact.
- That debug code is primarily useful for hardware (SoC) debugging,
   something that falls outside the scope of the UFS driver.

Thanks,

Bart.

