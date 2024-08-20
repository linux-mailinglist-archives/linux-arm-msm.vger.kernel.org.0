Return-Path: <linux-arm-msm+bounces-29154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDE6958FB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 23:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 700B81C2099D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 21:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38779157A43;
	Tue, 20 Aug 2024 21:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="LkgU1nJ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930CB14C5A9;
	Tue, 20 Aug 2024 21:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724189543; cv=none; b=UnS+LtDdNrZ745d+V1KcYUtClqehlRGDsTMiAoQoWyISZxJPzM0Ww2QGblEVRt/CpC8MUzl9TFT1QtJrkj29LkNTOgjWGMbTI2mqpHk/M4J3z/jXLnj+FFxcXjpXgw6CBQIx03OisReY/uT9kZ+vV/5SBpfKm0PKQ9oc1NV226Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724189543; c=relaxed/simple;
	bh=4raWcR2wIFJFyJmCb/nSnfbUc/hkHyE6rvin374FYbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PMRaWXe7tgO06zR36Dm5wD3LhZoyxXP+0+0GP0PZHytDKAX1Rmvjb35V2UyLwnYHPptNZn990JKnfaBLeJGwd30rjEGsxW2BskQPMNb7vIl8b60fqByCboO+qG6B9tJqBeSFVbw89n8UwT/TEjPUWz+GSou5f6T05n+sG3obGuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=LkgU1nJ5; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4WpN330H7Xz6ClY9B;
	Tue, 20 Aug 2024 21:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1724189531; x=1726781532; bh=y71kAPXj+t4zUJqrd1840k4A
	utrLWhbkLE0xPH9TH30=; b=LkgU1nJ5j15DYuTK5+KQ6wSheaxKOZmjYLq9lfIp
	ki8ePwiWcQPS72ULBXmF5H1YJmoXrnzQxNBJKY+GYqHrgFZLEg/hPSpX2YEhz1Zc
	+cUIm7V2dM0PNQF6BxVDNsu0bPAK4YZG8mE+w/9rqeZfjkbNGARlxq2mw0lp+Y+8
	JUz8o2Y1pE3agU/jAx/l/N+N5lX37AvVw25aTMURRDiZCZHZehdsWuch9xbXvOv2
	LB+OxEIzDfTp9zg6wZk7xLvs5CKt9/9PMyqEp3TAYRj8Bw7GbrU14k/5M9xClKpk
	xWWPaNyrN6DxR+kQ9KgoxbFLJm+2Cir5/YtigVVaVI9SEw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id krBs-efzR3y3; Tue, 20 Aug 2024 21:32:11 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4WpN2v52f0z6ClY99;
	Tue, 20 Aug 2024 21:32:07 +0000 (UTC)
Message-ID: <f984d1b7-2257-4506-83e0-73d52a10a75b@acm.org>
Date: Tue, 20 Aug 2024 14:32:05 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] scsi: ufs: ufs-qcom: add fixup_dev_quirks vops
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
 <20240820123756.24590-2-quic_mapa@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240820123756.24590-2-quic_mapa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/24 5:37 AM, Manish Pandey wrote:
> +static struct ufs_dev_quirk ufs_qcom_dev_fixups[] = {
> +	/* add UFS device specific quirks */
> +	{}
> +};

Please change the comment into /* UFS device-specific quirks */ and move
it above the array definition. I think that's the style followed by
kernel code.

Thanks,

Bart.

