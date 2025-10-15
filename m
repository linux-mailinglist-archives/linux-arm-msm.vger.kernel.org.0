Return-Path: <linux-arm-msm+bounces-77438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DA0BDF76E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 17:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 368C64FE3B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423CE335BA3;
	Wed, 15 Oct 2025 15:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="49uwCEF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C9B33438C;
	Wed, 15 Oct 2025 15:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760543142; cv=none; b=fg9Y2J0XVRSQ5sakTRVjWVnQ5Lh3VQ7S7NYlj7A3hlGOI2vCtpQCKHi5CGSX+twUjHOK7Vck1zXWQfwF+MhmOcDxmStmPvQMZXI0b5pnfWJukEGC5fmNSC0twaovQyot0EObtRI4odzfUU/e0vrnIMyE6HTECBIAWDB3FbrgMEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760543142; c=relaxed/simple;
	bh=yaz2Z85tZytlPOi/nqyuR3FEP2uD07pWIvLcsG6hU9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mHYFxtmOID8FD8H6UjkX1WJ05DuzO7asf5AXJwq+5XBY0leNzKC6rBGfAWqgngpfMJyphBfymKFRvFSWbZPy+sGpBrr27rZigjZjrjmXb1BjM1SzJEMJc+D9DbxklMO2zeIaspuKESrqcGpQhG0WqFT9ct/8BcvB/W89DjzQfss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=49uwCEF3; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cmwQp6yVhzm16kw;
	Wed, 15 Oct 2025 15:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1760543135; x=1763135136; bh=QyuuKfs99l8LLYj4BWxd1Wj9
	tzofVCbfQMiYUa/Hx7k=; b=49uwCEF3y3Dj6ZyMxsuJUYPhktLVKwzkkMNzSWs+
	L/iPzcEguQfpc8KxFrvq9+xpzexPJNTIbcZOpuy00yga6CGtSkdczrftK+87EFOC
	qCLXLSQabNmlJV5YdKhgNh5BVhoFCt4qW4ZZ/Ly1Yo679E6yeWkP44Qp4YsFevCJ
	7w4/s11OvqBk9NR98q5z1Nz6NlNghY1zrz9WKVkkowuJ4x2d0RLnFJ/WQBAUdKox
	Qj0QOwHs74bfi9YA1EG+SkOZKmChkqZHIa3Ht7nyTYyAMLpkvw62EHutORG4girJ
	jN8uqwLva0Mlp8dXhQp6m4G4fx1eDsFP+E0N4jVx6fu1PA==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id xR_7uzTFA2B9; Wed, 15 Oct 2025 15:45:35 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cmwQS2KXhzm16l9;
	Wed, 15 Oct 2025 15:45:19 +0000 (UTC)
Message-ID: <bb9c7926-4820-4922-a67d-65a6b1bace9a@acm.org>
Date: Wed, 15 Oct 2025 08:45:18 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/2] ufs: ufs-qcom: Disable AHIT before SQ tail update
 to prevent race in MCQ mode
To: Palash Kambar <palash.kambar@oss.qualcomm.com>
Cc: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
 peter.griffin@linaro.org, krzk@kernel.org, peter.wang@mediatek.com,
 beanhuo@micron.com, quic_nguyenb@quicinc.com, adrian.hunter@intel.com,
 ebiggers@kernel.org, neil.armstrong@linaro.org,
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
 quic_nitirawa@quicinc.com
References: <20251014060406.1420475-1-palash.kambar@oss.qualcomm.com>
 <20251014060406.1420475-3-palash.kambar@oss.qualcomm.com>
 <f2b56041-b418-4ca9-a84a-ac662a850207@acm.org>
 <CAGbPq5dhUXr59U_J3W4haNHughkaiXpnc4kAZWXB0SjPdFQMhg@mail.gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CAGbPq5dhUXr59U_J3W4haNHughkaiXpnc4kAZWXB0SjPdFQMhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 7:08 AM, Palash Kambar wrote:
> Since AHIT is a hardware-based power-saving feature, disabling it 
> entirely
> could lead to significant power penalties. Therefore, this patch aims to 
> preserve
> power efficiency while resolving the race condition.
> We have tested this change and observed no noticeable performance 
> degradation.
> Also, adding in RPM callbacks will not solve the power penalty as it 
> autosuspend timer is
> 3 secs in comparision to AHIT timer which is 5ms.

The runtime power management timeout can be modified. Please verify
whether the power consumption with AHIT disabled and the runtime power
management timeout set to 5 ms is acceptable.

Thanks,

Bart.

