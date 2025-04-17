Return-Path: <linux-arm-msm+bounces-54691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BD8A92CBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 23:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27AB2924438
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 21:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0318E204F8B;
	Thu, 17 Apr 2025 21:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="aovb7p8/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FBD15ADB4;
	Thu, 17 Apr 2025 21:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744925817; cv=none; b=GtmNrq9iRhouxGKF+9Kc012qeG7DzQTmbcJtHP0jfazvGAifDOUtjjJfKN8zWLq3MaVPqxcAdZnzOhgp7E1jCUlN0FUe5XrhGQ1znS2vpEPzNWkIAS+R+AenAxeR6lf1VfGxEh9BN8Z4OAQ95MXI24x8TnAXDl7ZFyvXgkRuq0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744925817; c=relaxed/simple;
	bh=Dm8q0zXFlhieUk322UWtrUVeJ7WyU00tA8FyUuT1SDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=biDRP55aKJ63F3MdD6kaGIB+0ei9Yfv2dB96+/paEzQdfm7OVFDhRhBVZhHu111+0miQaUau2MDrojN89mhbWtWCsEuwhkt+OwZpDALrTMJhx/Yo9HGD04zfDZ2Ss0XC5l7zVQ518sIPgMbtMhfwIizs+fOS9AVBMU7ls3dkch4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=aovb7p8/; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4Zdrng1gt3zm2jWC;
	Thu, 17 Apr 2025 21:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1744925812; x=1747517813; bh=Dm8q0zXFlhieUk322UWtrUVe
	J7WyU00tA8FyUuT1SDA=; b=aovb7p8/AReFPC/Mo2SNpt8e9UuBVdqAb+agrZNH
	n80yoDgAYBK8Jn1z1vP3EvD/JdC8jdCFzjtLNSpdMfpGgrPn4un6kq6zJ4NULwTy
	Nf4udha2kJR5Fqqug0RsT8pFdogynnNU+OlNZqVyXLnwfKULw0y3Y0cPfw4V6E9y
	RzHm9A31/6R6atKkX69aEddjLXzQxlTJDtmPvB80TvR1xdHccGhqHzZsDs4lmRaD
	io2sf7tkiLj3Vf2a4OIPpItxHxYQHiv8t+aq8ZKaZ6nj48lK0mAHcXFhLCfgDicz
	y0GKe5f352jSgkMQkLzLL5BJjq9Ffax7dCl4i4VxmEdqEw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id aCS70688tKXs; Thu, 17 Apr 2025 21:36:52 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4ZdrnM69H8zm286r;
	Thu, 17 Apr 2025 21:36:39 +0000 (UTC)
Message-ID: <ab8e77aa-f39d-43fd-a393-488ea582998d@acm.org>
Date: Thu, 17 Apr 2025 14:36:38 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 0/3] Add support to disable UFS LPM
To: Nitin Rawat <quic_nitirawa@quicinc.com>, alim.akhtar@samsung.com,
 avri.altman@wdc.com, krzk+dt@kernel.org, robh@kernel.org, mani@kernel.org,
 conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
 martin.petersen@oracle.com, beanhuo@micron.com, peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250417124645.24456-1-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250417124645.24456-1-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/17/25 5:46 AM, Nitin Rawat wrote:
> Add support to disable UFS Low Power Mode (LPM) for platforms
> that doesn't support LPM.
This patch series looks good to me.

Thanks,

Bart.

