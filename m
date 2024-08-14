Return-Path: <linux-arm-msm+bounces-28539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A5F952117
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 19:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C12CB2628B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510CB1BBBE2;
	Wed, 14 Aug 2024 17:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="1+31M8fD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF5E1B3756;
	Wed, 14 Aug 2024 17:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723656484; cv=none; b=rpty6sfcX6OCxIkXe0Xaw8YTHJ4uD4CX09dpwckNiiz+8ooVckQ4S5KnnihYpz2l1PuSKlaVOLWIDUVpwenVVNTMffivE6XOd+JTRxK4upND7z/Se9Wl2gNbl+JuEBHrV4ZpFeSJZDZ4wCuDkXtdJlTYoLFQF27p3KcZsPi/LaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723656484; c=relaxed/simple;
	bh=62jTZPkfdMAaQWY0bTk3YlljEuAECQw+gJytJ6q+w20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uW28H2vb22eA2DUvff6bsOKmUa0gmar0lxp6fcLHF4dknHIm+HMYFwYQsHTTGa+3+U1tLmkoEOgIZIVxf/lP3AR6buN74G0BlEloI4D/YnR4kBCc4XrKCy7dDg1xry/cl6xoQsPKxohSkBPrXOzHjISdoP5xCOXFEKu/KpPglFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=1+31M8fD; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4WkZvv6HgMz6CmLxT;
	Wed, 14 Aug 2024 17:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1723656472; x=1726248473; bh=zxyu/nsdVkqeNUASywJxCLYy
	DZXbSfBLtcVXWLI9Tio=; b=1+31M8fDZ/jUTA23wgzWef4Bpkvnz3hqlnmrv15l
	JB+i/tfYxymBmI7B/JdQ4VjDPtZnc/ztPMRzbG9FCFX7Jk1ab7fwtjYdu/Rp0pJW
	Ny29MEYdXE6NuISyL3E9BTfgNHfxlDRXjr4CK85a8xJhMu0WuWSmZt26KT/BoCtH
	tJG+f3UUTH7aFT8FiweofrUH2hQ5UyLPC2d9p55Hx18jgYSDpiSkxIwd4wcx2dPM
	Js4Acup0/pqOmOyq2qhS5qBIyx4hTZF6NMheyiV3A/l4QGpr3zPDYJI5fcULyD8R
	7MxOcsM4psTK5OjxetLm/a1Mv5OObkziM2FqWEf+LCr0eA==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id r9w28daP0YpU; Wed, 14 Aug 2024 17:27:52 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4WkZvp48FFz6CmLxR;
	Wed, 14 Aug 2024 17:27:50 +0000 (UTC)
Message-ID: <3e7cf9f9-abab-4249-9e7b-71f237850bdf@acm.org>
Date: Wed, 14 Aug 2024 10:27:48 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ufs: core: Rename LSDB to SDBS to reflect the UFSHCI
 4.0 spec
To: manivannan.sadhasivam@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>
References: <20240814-ufs-bug-fix-v1-0-5eb49d5f7571@linaro.org>
 <20240814-ufs-bug-fix-v1-1-5eb49d5f7571@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240814-ufs-bug-fix-v1-1-5eb49d5f7571@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/24 10:15 AM, Manivannan Sadhasivam via B4 Relay wrote:
> UFSHCI 4.0 spec names the 'Legacy Queue & Single Doorbell Support' field in
> Controller Capabilities register as 'SDBS'. So let's use the same
> terminology in the driver to align with the spec.

If a rename happens, we should use the name from the spec. I found the
following in the UFSHCI 4.0 specification: "Legacy Single DoorBell 
Support (LSDBS)". So please either rename SDBS into LSDBS or drop this
patch.

Thanks,

Bart.

