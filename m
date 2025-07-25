Return-Path: <linux-arm-msm+bounces-66723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3503CB12065
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 16:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF5974E7EFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 14:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA65822A1EF;
	Fri, 25 Jul 2025 14:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="oi9+E1QU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398D51E766F;
	Fri, 25 Jul 2025 14:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753455313; cv=none; b=HNRZuJGI9RCDER1H/S9D4RrTds1IOlXWzz5VEeOyL6al0+85sDmuZnj2jpjGV9Tgbyi3Enl+nAWY7YOWXMNIokS6lCGW05WPJKtBk46/5ARyp2AZHX4UJ4Fv64h/bFnqUlDE7+vwxc6aXd0ohU3KYCJNR7vJj555bKy6U3DBGko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753455313; c=relaxed/simple;
	bh=ySsrQyQZsReDOvURUlTKLUyfDDo7OmT+KPfcJMZKqvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gbyhAIkcdKHy7gMOsH+16vh8HJLqE7MVlwEHyQyUi7zLUm8mXRCyeBBlvJrztQLmBevGCGm3/ZdGKl23JVtqDNg1d7A9sDGtzuWuBgDJmeV8MiRVRfZAM/w8/k53Wi2A/ygUT1rdv2s2QFiwIA9NCXDlMySXyXv8u0M3yLapvyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=oi9+E1QU; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bpWBK4zvVzm0yVZ;
	Fri, 25 Jul 2025 14:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1753455302; x=1756047303; bh=ySsrQyQZsReDOvURUlTKLUyf
	DDo7OmT+KPfcJMZKqvA=; b=oi9+E1QUrqlM02IzDKeAMW93yVx5BAhLCZCxyAWr
	kVCKJ/+Gg7jsl3WaWERWTi0fF7nneN6KEAVIXD3T5O7nbX2K0gVS/ZkIER/TTj/Z
	Sreme/RjmXFL8VPBlh83v7+agKdok12gwiJFK5vOI7T7BvE551NwflZXNO+3mXRa
	i6FjKdcVYlGjzPML7t9P1Xm8Es1LDVbOGlH1aUkHuV7a80/PxJ0eZJsAjnpcCnNG
	vRAc+gbG/UnJsmbkDTtz0H7GX52vsKBh/AlwsPqoIErBoq4rRBJEvGkAyjp94Wox
	0UBb+rh5/Jm+vyycRdS5kB4Mvf4DNWqUZi+Phslm9ndSog==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id a7xvxFBIoncZ; Fri, 25 Jul 2025 14:55:02 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bpW9t60Xszm0ySc;
	Fri, 25 Jul 2025 14:54:41 +0000 (UTC)
Message-ID: <1989e794-6539-4875-9e87-518da0715083@acm.org>
Date: Fri, 25 Jul 2025 07:54:40 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] scsi: ufs: core: Don't perform UFS clkscale if host
 asyn scan in progress
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>,
 "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
 "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
 "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
 "quic_ziqichen@quicinc.com" <quic_ziqichen@quicinc.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "luca.weiss@fairphone.com" <luca.weiss@fairphone.com>,
 "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
 "junwoo80.lee@samsung.com" <junwoo80.lee@samsung.com>,
 "mani@kernel.org" <mani@kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 =?UTF-8?B?VHplLW5hbiBXdSAo5ZCz5r6k5Y2XKQ==?= <Tze-nan.Wu@mediatek.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250522081233.2358565-1-quic_ziqichen@quicinc.com>
 <5f3911ffd2c09b6d86300c3905e9c760698df069.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <5f3911ffd2c09b6d86300c3905e9c760698df069.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 7/25/25 2:13 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> Could consider luns_avail instead mutex?

That would be wrong. I think it is essential that scan_mutex is used in
this patch. Additionally, the lock inversion is between devfreq->lock
and (c->notifiers)->rwsem so it seems unlikely to me that Ziqi's patch
is the patch that introduced the reported lock inversion.

Bart.

