Return-Path: <linux-arm-msm+bounces-29156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 696FF958FC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 23:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24C5F2856A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 21:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FB01C4635;
	Tue, 20 Aug 2024 21:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="dnY3HXXa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9775345008;
	Tue, 20 Aug 2024 21:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724189740; cv=none; b=lZuJ+oPUXOHfm6mjNfAT4CL1rXPBmliobUIacbJh9KFjWf8EKWoekBJ5W5dk7NmH+ZTEhJEvAUgR9G/SwAfiXdUGRNNAcyFWFvF71bmklwbts+j5Sc8EOh6OLVy6naBBzHD6HSdXkdrSVVZdqPy41NBLumJab6mpXWPjMyCoqD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724189740; c=relaxed/simple;
	bh=i5rqn2vM4OTWG/6M3HMWeg3o9+FYajAst04XanAOKsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X2qTxKrmPcAujZAA7rnixl2nEQKdZD172WBma4GsTBC6QphnntO6ivhXzHbeVXrBuU1Ghbc+3LmqR8d40TaR9qLO5Ew7PuxPe9kU9kZxQVMGPKnE/NJvWpd56vc8aWkgugAcLmq0t4WS/LcttFAxbT3+rYpOvXOQfseQjl4s/3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=dnY3HXXa; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4WpN6r39mCzlgVnK;
	Tue, 20 Aug 2024 21:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1724189728; x=1726781729; bh=jha6E+561/esnxyomxwA7fB1
	7GaJz6k51cOkGtKDvJY=; b=dnY3HXXablCCWq7Lylf1lbUrLpHFSsLi+ipwOWMQ
	CvVEC6H+qvzh/d0mqFfGhBFP28C8KmpTNxHDfCuVGi/ghRTBBZfHoISoIgpy8y8z
	o/atFwYGjFVQzC0GP+1KP1WLc8MGTfKdhK1oMZtXzlu1AePWBZSx1YLOozoflPZL
	ZszyV2wisNPXSfkniq09//DowbtxIKdBorfn/tC1CCb7LOeE1r4Fwv+nO7it3KBY
	Dhv6eQTszozV4tMmIi4G1G5I4Cd7afE+quxxf3wcK8TEyxQaEYPj90UUADRXjtHw
	9EO1Xl6k0lMwmz3JsjfhPOBOOjriIw8YgmTVq6s8de+New==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id PDxI-9uhv51p; Tue, 20 Aug 2024 21:35:28 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4WpN6h3LknzlgVnF;
	Tue, 20 Aug 2024 21:35:24 +0000 (UTC)
Message-ID: <7527d15c-9318-47f7-99f8-028c865a698b@acm.org>
Date: Tue, 20 Aug 2024 14:35:22 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] scsi: ufs: ufs-qcom: Apply DELAY_AFTER_LPM quirk for
 Toshiba devices
To: Manish Pandey <quic_mapa@quicinc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_bhaskarv@quicinc.com, quic_narepall@quicinc.com,
 quic_rampraka@quicinc.com
References: <20240820123756.24590-1-quic_mapa@quicinc.com>
 <20240820123756.24590-4-quic_mapa@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240820123756.24590-4-quic_mapa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/24 5:37 AM, Manish Pandey wrote:
> +	{ .wmanufacturerid = UFS_VENDOR_TOSHIBA,
> +	  .model = UFS_ANY_MODEL,
> +	  .quirk = UFS_DEVICE_QUIRK_DELAY_AFTER_LPM },

Isn't three patches a bit much for these changes? I think all three
patches can be combined into a single patch without making it harder for
reviewers to understand what is going on.

Thanks,

Bart.



