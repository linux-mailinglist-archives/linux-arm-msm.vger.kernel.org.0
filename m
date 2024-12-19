Return-Path: <linux-arm-msm+bounces-42819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 345AE9F8100
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 18:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5504316E7AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 17:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC2419AD5C;
	Thu, 19 Dec 2024 17:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="wmLcTpxs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0768515252D;
	Thu, 19 Dec 2024 17:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734627834; cv=none; b=ZPkrKmgLjaqpXfG7m1zWSBLJ4M2j4G5eCSi1pY7bQ1WiPo/9pJZ2ma1UXM91+RmCPw1y0zM3C4liCV5bHf9qbcVcYYkDp5POXWa/5V1Ozj24avB4Bkb5cXYjIEPZGPkIPJ//068XkMNBW/7VEMWuofmdAyvfqi8bYHL0Z/GXy7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734627834; c=relaxed/simple;
	bh=uAXMtWHv3d4Lk0CKVvso/hb3m9Ff781OU+3oVD6YNJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WgVm/RegkN7g8bw3AikzLchCzidJJ0ula0XuTUCbwoMda1JhzhiDNlmD5Jf84Dv9KJ2caR4vqUa80WECDNLTnt9ug8uav8RHzLCrp7Qm8K+1z2W3gCDSqtaIKGKDcdxoKtZN4O1x2Rq3B+BosdnPjdMWFdlfE14s8BCHBifTp+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=wmLcTpxs; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4YDcMQ02pZz6CmM6N;
	Thu, 19 Dec 2024 17:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1734627819; x=1737219820; bh=uAXMtWHv3d4Lk0CKVvso/hb3
	m9Ff781OU+3oVD6YNJw=; b=wmLcTpxsQeOvqhVhoHYPRUPXB55xazJoL94hfLgV
	0tj0wqQ1wG7Is4y+drSHdZRdFs6PmwAqMx7p7hD030iKi9v9Jpvr6lWZztYbiWFT
	oaUokWYpvLOMv5bByu3QEMTg7VmRGtw0IXbL0gc633Uld4ck66YOG9Bt5B/rrU3N
	BjV5AkE1BUwrZMzzmZSF4SeGTQdJKZkHTIbKlwTsaTDqhR7t8xTZHRQEGxAiaNcf
	Oba+Y5DqsDu+47H+v7SaV23LO4++hdnl7WoyiPXBHXSkLjW/9WAruqEwG/3yt+H7
	J1nH7G8+x0UzYbyRDMyTbNe5kXmujC83wqt3qW9uxRT5kw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id a5rbly3ZyWik; Thu, 19 Dec 2024 17:03:39 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4YDcM63jxTz6CmM6L;
	Thu, 19 Dec 2024 17:03:29 +0000 (UTC)
Message-ID: <b444f21f-cec5-40ee-94e8-866ad8a116cd@acm.org>
Date: Thu, 19 Dec 2024 09:03:27 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] scsi: ufs: core: Honor runtime/system PM levels if
 set by host controller drivers
To: manivannan.sadhasivam@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>,
 Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20241219-ufs-qcom-suspend-fix-v3-0-63c4b95a70b9@linaro.org>
 <20241219-ufs-qcom-suspend-fix-v3-2-63c4b95a70b9@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20241219-ufs-qcom-suspend-fix-v3-2-63c4b95a70b9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/24 8:50 AM, Manivannan Sadhasivam via B4 Relay wrote:
> Otherwise, the default levels will override the levels set by the host
> controller drivers.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


