Return-Path: <linux-arm-msm+bounces-24675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3E391C6AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 21:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98713284595
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 19:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC48757ED;
	Fri, 28 Jun 2024 19:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="OrGlDFBg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180E475817;
	Fri, 28 Jun 2024 19:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719603267; cv=none; b=VjCi4QJGgIC3IMosNHEJ1A8Yvme8N8bGf+ulbBgr/gmFST/JEuiOzWi+EoBSY3FZefLC815aPohmbi1nses5Y70lvFLWsyio23RVxl4tELObEchAW8VXf3db4R+JjU/ofWCq7Xki2DiK5vQvrlEbY4S3kY8WwDdqYLvGJ2ka89M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719603267; c=relaxed/simple;
	bh=iAEFb35oLFTCo2yTiMK2mj7WuJO99K5w/pJahz9BZYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bUG8suu00v1xcwO3vaQZSH1PJJIznSL+9UkxI/kwUWIJJ3l5XqjqSALHtzISP5pewKXEEpv+fhi2ayC128Z5r05I9dbOE2/WZWm/HASPlUJzbGAkhJMKFGzj9B03u6gXkzVI/2xo+sIpSbtFxadCaT32AyLxyoxj5bTXnBroNeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=OrGlDFBg; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4W9lxY3ynKzlnNry;
	Fri, 28 Jun 2024 19:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1719603261; x=1722195262; bh=SlQ7Rs5iPCIdRs1gRL9mnMHS
	6/Cs9HjGDCtVA9dFewc=; b=OrGlDFBgKXSQhp/Yep1GIIgYSE9uHZ/1BECbrhGn
	67GBTIbjunq5YbtnUnlJ5bs9hBXTl0+a6AUzi+L4V25vGa2W2RMUeqOQN4Gnuol4
	NgGV2OI4JEhv/7n7bAec8z4GXIqTnyRox0na31N2g4qAp3Iy4UyLIUIjDmwRBw4J
	WuRVExqVM8dfNEm4DIKOt0SImkzI93bCqbGKD+vU39DF0fhYdIDDYp+LLvfGK60Q
	Drm2935BSm8XE2ykGKGDvAcYEl6/YVpsfmycRY7wDw6FMZ2eLXAtqnSAvxvS22+4
	twAflTHx12T4TmZoKSOlVAQG6AB2ouFxLGrQjfzA3hCAFQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id P-5wYDRghwpM; Fri, 28 Jun 2024 19:34:21 +0000 (UTC)
Received: from [192.168.50.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4W9lxQ01FQzlfp29;
	Fri, 28 Jun 2024 19:34:17 +0000 (UTC)
Message-ID: <ad0a495d-b1c4-4e87-a9b8-77df2de8927a@acm.org>
Date: Fri, 28 Jun 2024 12:34:16 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/2] Suspend clk scaling when there is no request
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_cang@quicinc.com,
 quic_nguyenb@quicinc.com, quic_pragalla@quicinc.com,
 quic_nitirawa@quicinc.com
References: <20240627083756.25340-1-quic_rampraka@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240627083756.25340-1-quic_rampraka@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/27/24 1:37 AM, Ram Prakash Gupta wrote:
> Currently ufs clk scaling is getting suspended only when the
> clks are scaled down, but next when high load is generated its
> adding a huge amount of latency in scaling up the clk and complete
> the request post that.
> 
> Now if the scaling is suspended in its existing state, and when high
> load is generated it is helping improve the random performance KPI by
> 28%. So suspending the scaling when there is no request. And the clk
> would be put in low scaled state when the actual request load is low.
> 
> Making this change as optional for other vendor by having the check
> enabled using vops as for some vendor suspending without bringing the
> clk in low scaled state might have impact on power consumption on the
> SoC.

For both patches:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

