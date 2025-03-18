Return-Path: <linux-arm-msm+bounces-51800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1872A67B4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 18:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C68A17950F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10AB211A1E;
	Tue, 18 Mar 2025 17:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="yEa4G9e8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13A2211A07;
	Tue, 18 Mar 2025 17:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742320014; cv=none; b=dVyLL2rRdqb5GS7SDBPNCQssOyK6AX7Du97gT4iv+TnKGDt8xm/KocezPWA8PNTnlk6UqwoGbDXyWqcCIuV8/rURxdov/+DLV7V3FUfwRCD6tEiFFMv+d6OZL3o/D1r+DoSQ2fX6OpZ/2qdNMvBmGq3DGElRZKgBc0w7HH1kxCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742320014; c=relaxed/simple;
	bh=RT7MNTyreFUKvAnS7dr7bcWoq7i3nz8ReBWFi7q959g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YM+1xUcjSAb7viOxHhUWzA9ZmRcbuPKvfUcbTfZR05Tb79NMr8+fKsqK5A6RqVxubVjSvdqS/g7jgRzpMhLEbY3hzd086kqzc/LwlefDsg6LPJDLzRrqJtqGNLvM9apzLUhFt7yHbWfJC/kA1EWPHYohHFZCgW/wunRzs1jwhw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=yEa4G9e8; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4ZHK5x5JfQzm1Hbd;
	Tue, 18 Mar 2025 17:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1742320003; x=1744912004; bh=IfsXZoAxPbyHlHWYzXvSpS4j
	nPi0L2iXINNY123rmho=; b=yEa4G9e8L/okwvGV6oZf0OTrnJAV8E2D71CDSwjz
	9lRjH4aYHZiicR+R0heDD2RY2xqDtcgo1gWCx25vMe+5Y+ApwugqkfNkntNf8sU0
	e5RrFAWI+ZoyubJbV5J+HtzaS5h1jZruQS+fkue1VHhnff1dwkTsgXK9UkHyzjGF
	jxdqb+9mPy/fT5fyL4Apk5ALpmHjfF3bth3kC38nC9GJcpwC96+FI8/Afqq9+EWm
	KC9ZkFrNJyFXYs+Vi8X5Em2x3lQj5oPgBt9PPXpR+FT0Y0lu7mQ0lJlXljtDbaoE
	STObvvpjE9vxjt8lV6FnC/soNNW5EvlPFmhu8rnJY2H+Mw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ekEOqjzEKUDY; Tue, 18 Mar 2025 17:46:43 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4ZHK5k6bHpzm1HcC;
	Tue, 18 Mar 2025 17:46:33 +0000 (UTC)
Message-ID: <adb6f7cb-36b1-47d8-8fa1-00fcf5242699@acm.org>
Date: Tue, 18 Mar 2025 10:46:32 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 6/6] scsi: ufs: host : Introduce phy_power_on/off
 wrapper function
To: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
 kishon@kernel.org, manivannan.sadhasivam@linaro.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, Can Guo <quic_cang@quicinc.com>
References: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
 <20250318144944.19749-7-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250318144944.19749-7-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/25 7:49 AM, Nitin Rawat wrote:

Just like the other patches in this series, the subject of this patch
should have the prefix "scsi: ufs: qcom:" instead of "scsi: ufs: host:"

> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index d0e6ec9128e7..3db29fbcd40b 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -252,6 +252,10 @@ struct ufs_qcom_host {
>   	u32 phy_gear;
> 
>   	bool esi_enabled;
> +	/* flag to check if phy is powered on */
> +	bool is_phy_pwr_on;
> +	/* Protect the usage of is_phy_pwr_on against racing */
> +	struct mutex phy_mutex;
>   };

Please reorder the above two structure members. Synchronization objects
should occur before the data members protected by these synchronization
objects in structure definitions.

It seems to me that phy_mutex not only serializes is_phy_pwr_on accesses
but that it also serializes phy_power_on() / phy_power_off() calls. If
this is the case, please mention this.

Thanks,

Bart.

