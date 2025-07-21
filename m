Return-Path: <linux-arm-msm+bounces-65921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 910F6B0C797
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 17:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A49094E5FA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 15:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D4F2DEA9E;
	Mon, 21 Jul 2025 15:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="fANFAole"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7218B2DECB2;
	Mon, 21 Jul 2025 15:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111731; cv=none; b=M9l6lZypEA0C1ml2AJrOyknpqXNp07aRJA5YOq2mn0uPWYP9MyniiF/O5R5CB0i7XpSkaKL0MT+/tWxZUL53t6TRKNTyD6jVCNq7CMYeVbD2+GOh0WLfuqAX/bfJ75VZ52caJnALVMK9BjxXOUdan5qixgILpRO4klDC7oRNb54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111731; c=relaxed/simple;
	bh=qqmbmcrOjka51xLhIcPsLGIfhKlqhd0jwPSb+EkrSNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iyJFMAGCDwvQm/7oZn2bJ9gErnc3N3mOV1iBGveY7yGK+y8NeqExpMMe6DFGzg3Ukn/SoV0xE2g4Ib1dCQTwn9pDR635A/NHYD6uqZB3ORmW9sQxcLuwHQu0QqpWAcGT1thoHMmRVVps8PTb8BgCHhUY4pp/bUnoK8y2xbQHp9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=fANFAole; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4bm4741d1XzlrxVk;
	Mon, 21 Jul 2025 15:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1753111725; x=1755703726; bh=qqmbmcrOjka51xLhIcPsLGIf
	hKlqhd0jwPSb+EkrSNo=; b=fANFAoleWArKz24oHo5Yz2I7qWGBwKRzVJn1gSwg
	Q3VxtoJD40S9hhoHSnmDVNeOHoDHlR6yPfHT2p7Dz4TPgLuGNGpIHA2d3emWpHr5
	LtOYaCYVL8WOi9bgeaFH8p5AnBCqH+Unk8leWerhLcJOGgmVgRwVYs17KKmKO8yw
	Fn2k3+bgT//RYy3juuWRbFpo+2GA+kqNihBHXO4ptdpjGHs9P74lMCUKOjxEoScU
	cnTpJ0gfa5ygr2c6OgfDrmZEVUEhfG0JSWWK6AOHWsz17x/q0UY74saa0gjXW7Q4
	2noqbq+JVESQD9cx6aXiYiytWjDC8teaNHXiFjBbBtHsEw==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id b7AQks_1BQdy; Mon, 21 Jul 2025 15:28:45 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4bm46l01VVzlrwfh;
	Mon, 21 Jul 2025 15:28:29 +0000 (UTC)
Message-ID: <68631d36-6bb2-4389-99c1-288a63c82779@acm.org>
Date: Mon, 21 Jul 2025 08:28:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 3/3] ufs: core: delegate the interrupt service
 routine to a threaded irq handler
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 Tudor Ambarus <tudor.ambarus@linaro.org>
References: <20250407-topic-ufs-use-threaded-irq-v3-0-08bee980f71e@linaro.org>
 <20250407-topic-ufs-use-threaded-irq-v3-3-08bee980f71e@linaro.org>
 <1e06161bf49a3a88c4ea2e7a406815be56114c4f.camel@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1e06161bf49a3a88c4ea2e7a406815be56114c4f.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 7/21/25 5:04 AM, Andr=C3=A9 Draszik wrote:
> I don't know much about UFS at this stage, but could the code simply
> check for the controller version and revert to original behaviour
> if < v4? Any thoughts on such a change?

I'm not sure that's the best possible solution. A more elegant solution
could be to remove the "if (!hba->mcq_enabled || !hba->mcq_esi_enabled)"
check, to restrict the number of commands completed by=20
ufshcd_transfer_req_compl() and only to return IRQ_WAKE_THREAD if more
commands are pending than a certain threshold.

Thanks,

Bart.

