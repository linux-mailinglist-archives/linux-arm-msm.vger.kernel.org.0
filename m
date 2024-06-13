Return-Path: <linux-arm-msm+bounces-22596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC9790781A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 18:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFA3028498C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 16:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D7D1448E6;
	Thu, 13 Jun 2024 16:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="2wCXN2VC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6282926AE4;
	Thu, 13 Jun 2024 16:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718295563; cv=none; b=GmWjfnjJX11saRIqUxb+UMIfr67hzlhG1uvfP9BjEQPqMwbMQT22EzR+0PoT3tktFE+xvgxrWAdVlUXtuY+qzSF0GJaoaTRrWijHM6iSTQJ7QaiFwwQDfcwhsXsevT7GzbrympPGSijBtXPM+LWbUi9NuucMlws7rqImbp2q6+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718295563; c=relaxed/simple;
	bh=WpIiOcbHwANqWVqIm5ExegY6R8ZGDJCuGoZEPhc3ft4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ix/NO2cM8wlZCPKVYkJ8+8X0FAZR591MkFE+BGAOZyuZWf4J/sIZ2kYI6IDeSXoJmWMVAsDKrMZU7xvZZQv8xlDVM+3kmZyyQQ0aumGWfZ0jZXOXIRwUBXAk5r3OmvpUUrMRWyzAn3g6vtWGomY3Dc+3llKdR7uK6OE+Zm7PINQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=2wCXN2VC; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4W0SKP5xgrz6Cnk9V;
	Thu, 13 Jun 2024 16:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1718295559; x=1720887560; bh=EqUKSXP8U8eHmlIVt2N2fY/w
	HbGNwccAvAZ1mcqBVuk=; b=2wCXN2VCrLeXob49GZxpU4hKceCTerxYyRVIGhxU
	ZieUosDarLgSXfoyldgJ/5EH+1IC9OVlwfGNB1ZGjUglJDLj9m8TJpVxcd1aKNhi
	VyQuh6SET0wRIE9VmNoSpQMEj9Ftl6mtl+XtUZ15DISzW1U8nTQxg/gMfuQO2u2N
	J7g8ThqhX1B6ZafBPokbmmck4jd5rIZbpT35wxlZWc9vfGO1LR9L+wubE1K7kfgc
	SPczzpJYsnIBM1UxhEHgbEf2t3gHmrDod40tsLuG0CiGgv22q0kO6Bl81EI39KST
	U9asvy4lp2FYbQhv28/1LHHOcNBwb3PbCl7h8vlqO+mtMQ==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id RgN825rfIE8z; Thu, 13 Jun 2024 16:19:19 +0000 (UTC)
Received: from [IPV6:2620:0:1000:5e10:c543:208b:8ce4:f55a] (unknown [104.132.0.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4W0SKK6mj8z6Cnk9Y;
	Thu, 13 Jun 2024 16:19:17 +0000 (UTC)
Message-ID: <132dedc1-ee11-44d8-b684-0ffbf994d164@acm.org>
Date: Thu, 13 Jun 2024 09:19:16 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: ufs: qcom: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Can Guo <quic_cang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20240612-md-drivers-ufs-host-v1-1-df35924685b8@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240612-md-drivers-ufs-host-v1-1-df35924685b8@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/24 9:46 PM, Jeff Johnson wrote:
> +MODULE_DESCRIPTION("QCOM specific hooks to UFS controller platform driver");
>   MODULE_LICENSE("GPL v2");

That sounds weird to me. I think we are better of with no module
description than with the above description.

How about the following description?

"Qualcomm UFS host controller driver".

Thanks,

Bart.

