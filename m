Return-Path: <linux-arm-msm+bounces-52635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C836A73059
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 12:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E482D8409FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 11:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04EC42139C6;
	Thu, 27 Mar 2025 11:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="1H3Xd/fi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEB12139CB;
	Thu, 27 Mar 2025 11:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743075642; cv=none; b=u1xcvsvITAOc2kIWzYQelAIbNlJCx+stXbCPIJzcysw5eOSFEntlziBlXNY6D/766rDnTWwJmQGqMMyBwpAVALxKsP9Xm8u7RvOnLo7Sd7KEqguqoCR+RwBZnVsmjMlZPrL+oGO1Eq4LHEi0j4qXV+tuJoGZsjD45Ql6GxXC8GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743075642; c=relaxed/simple;
	bh=S48RZoYHyk/F78RaisF4wU1mvUvmUQV3ZyaxG0EY38I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BlqxkFqCJ2/M3co/MD5dC3/E6l5T8zm/DtIow0VIZEExh52fW+MFCmJwLCckIL/ghtkCis48/l55Az39kKNx8U3zCUdFUwa4z9DOC+Q1kg74+Vv7YtariA6aYqaJMiqfm36kygOlMtQPo6PuU6hNT93qoVYxcSE4AIxR9pQvy1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=1H3Xd/fi; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4ZNhYD6FB0zm237G;
	Thu, 27 Mar 2025 11:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1743075631; x=1745667632; bh=/oeeQGjaQtCWhDT/CFgMBosV
	5T1s4yURxoDWqb9Es9k=; b=1H3Xd/fi38oBEe3j67O0R4QnSclNJKw3DnLxS0NH
	dusSgBzJQqf8t0yjYfLox0zigLf4qvwiIpzwFmAsCkBM/2cqtL2hVy1s+B68f2Ar
	UAoqQPPMzMo+RPkOv/EqLQT0zob9yhTTrJBvcSQWQhMKLSjIUHvj/e42PTlfVG57
	4svM9cBhToVYbhCPs0890Zykw0oGwlHctcOx8cgF84ecm0eWvHYTvenK9gkvwPkS
	sJMJHAwHJspDgyOcPlyrsaw1Xtqqe1uYe7KpjpTwJSdz/YvBhwFte4/Q6800Bipw
	QR09t0xOtYZ4mP9nEg/UmM0QIjazl8yKysGaQ8OLJDBA1g==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id L75Lqps1cZX5; Thu, 27 Mar 2025 11:40:31 +0000 (UTC)
Received: from [10.47.187.167] (unknown [91.223.100.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4ZNhY14lBtzm2417;
	Thu, 27 Mar 2025 11:40:20 +0000 (UTC)
Message-ID: <8aff7086-5cf4-4212-b97f-cf0bffd79440@acm.org>
Date: Thu, 27 Mar 2025 07:40:14 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/2] ufs: core: drop last_intr_status/ts stats
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250326-topic-ufs-use-threaded-irq-v2-0-7b3e8a5037e6@linaro.org>
 <20250326-topic-ufs-use-threaded-irq-v2-1-7b3e8a5037e6@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250326-topic-ufs-use-threaded-irq-v2-1-7b3e8a5037e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/25 4:36 AM, Neil Armstrong wrote:
> Drop last_intr_status & last_intr_ts drop the ufs_stats struct,
> and the associated debug code.

Patch descriptions should not only explain what has been changed but
also why a change is being made. In this case, this change prepares for
making an interrupt handler threaded. If this patch series has to be 
resent, please add this information to the patch description. Anyway,
since the patch itself looks good to me:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


