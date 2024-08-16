Return-Path: <linux-arm-msm+bounces-28822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CFA954FD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 19:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EDF82875FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 17:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF731BF324;
	Fri, 16 Aug 2024 17:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="GE7pwi/k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7401F52F62;
	Fri, 16 Aug 2024 17:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723828616; cv=none; b=dU7E2iP3JoeEhDB3A4BnkxTt3dEEbzYI5cW2uvZz5mFP4kGum8ppNvO6yItZHySJLyj+8nMreXwvzyTqGqITIdJPLw6gJvfjHX7iSTnhtXxgZtWcQf9wYr0EZtFCqSDpCSozLYv5+b6n7z9XJ4TyrnXGKTQnL0ytTHF6AIEUHzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723828616; c=relaxed/simple;
	bh=JxWcMmDZOzaQF7cGizeD6h0tcJULFDn6lE9WhxTJlwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HXd9IK2iWhIosjy57TOnwNiKBKVL4TraL97CSHO1Hxu0jGquRNXAyvnYq6uvo+wSSNA2eCkprBWT/gTaeA8D7Oz/SQm+QFeYhVoGPkUhyDHfloY4tlNqdORg9qkV2l5tlFf2ctvJxcu3e0JnWVxYrBkPjPPjYBMrA/JgN18TCuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=GE7pwi/k; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4WlpZF6c9hzlgMVQ;
	Fri, 16 Aug 2024 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1723828610; x=1726420611; bh=kSYG2ak77BV7ibnycMsgwUjM
	z96aW/qwSoF/lBrpy0A=; b=GE7pwi/kUevhfih72UyHlA4d+h/L1TN4MncS/c/1
	oIKrXQ3EBPhotSKZq2Jj4Ep/UsnD6ftd8bgyaRJmdYjbk33BJE4RXJn23JJd4ShC
	oZMLA5zh7O3P6i3dynMd9e2Fsv7qhqI9i4Pp5ip+HmQtYxVjQuzfp3qLI65NeMrH
	nUrsy3J27TfcMU4sM40e9PEY4IGIPBfd3QXzifraLN2g1mHJI0Fr644XrwDVEnvW
	E5XghuLE06LNzSpuZuPBS9dET5VcUr4ybUZoo/Z6Qp18eiSE8ka1d/HNRDAwYt4G
	KwKWAts9/Euod/H9Shmfde1LodjEqfgGwPF4rFhK7cCxKw==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 6kuDIXg72ger; Fri, 16 Aug 2024 17:16:50 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4WlpZ96ZG4zlgT1H;
	Fri, 16 Aug 2024 17:16:49 +0000 (UTC)
Message-ID: <36d30039-8e42-4f3d-9812-09f49b3c0e71@acm.org>
Date: Fri, 16 Aug 2024 10:16:48 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] ufs: core: Add a quirk for handling broken LSDBS
 field in controller capabilities register
To: manivannan.sadhasivam@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>,
 Amit Pundir <amit.pundir@linaro.org>
References: <20240816-ufs-bug-fix-v3-0-e6fe0e18e2a3@linaro.org>
 <20240816-ufs-bug-fix-v3-1-e6fe0e18e2a3@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240816-ufs-bug-fix-v3-1-e6fe0e18e2a3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/15/24 11:25 PM, Manivannan Sadhasivam via B4 Relay wrote:
> 'Legacy Queue & Single Doorbell Support (LSDBS)' field in the controller
> capabilities register is supposed to report whether the legacy single
> doorbell mode is supported in the controller or not. But some controllers
> report '1' in this field which corresponds to 'LSDB not supported', but
> they indeed support LSDB. So let's add a quirk to handle those controllers.
> 
> If the quirk is enabled by the controller driver, then LSDBS register field
> will be ignored and legacy single doorbell mode is assumed to be enabled
> always.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>



