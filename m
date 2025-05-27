Return-Path: <linux-arm-msm+bounces-59634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2E1AC5C21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 23:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06A463A6FA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 21:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A93320F085;
	Tue, 27 May 2025 21:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="lEZgAcxJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAFE29A1;
	Tue, 27 May 2025 21:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748381108; cv=none; b=bPPn1r13JB/WLCxkIdcc9mNRfNo3oh0D3xbHeC4Efj58UEtV8OEVUCxpqiwagQ5TOgHRwwEAY7JmO3Oz7eSk+RM92spLp0okAY3xKlyl95sPDr+ervOu0kLSjjBJsXB1T/zaaWFkv6vRnggrb8wOPNKlPArMNvVRN0L3yTuwB/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748381108; c=relaxed/simple;
	bh=yGb89xEjY3Woi7LpabLSzMNw5oe1bMQc/Fb6oP4wld4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VY4DW6ywqMEy41lMt0WePNnPrBPBjhurU4u843aysjqR8MVUY1M02JPnF+0d6m9U8qtGwqVLs2Td3sf1YivL8Y+U/h+Ajmff8zxtmuDHOAImettPLheiVfx9KuTadbOIo1jMh4w844j41mLSL21MKbcZFqgBQ/1A/vwW7GVERYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=lEZgAcxJ; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4b6QdY6pTLzm0yQ1;
	Tue, 27 May 2025 21:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1748381102; x=1750973103; bh=nWR/Tw1R8H9uMvTSu9ifpTSp
	3GnNEXesJatUEekQH8I=; b=lEZgAcxJT+2CvXmT39VJ1rqw3wso9u/J5Y93OI6P
	0oezKl4PjCxCCvVSKWYb6I44siWKjrtZdEF1q2GyOjuCQ01dBYrIqLbXoIxCxbCE
	vDvYI5V/Qke+KiOunOcu9ttN2mULQQZ3dGAkR4f1cMM1sUK6b/zB0/8Qsi3hjOUE
	oGhwMWnbWGFU6G04m7/J7+mKJmDldJL1jDbJ57OVM+43rPKtXaW9p0opgW2r8MpD
	RRpEvnHo8lIedq35lsWB/znQ7PY+d/k8Td5afPJsJ+mA+6PxRAzg0w1spOCUTRW7
	PjNGc+GPvAV5jdj8K6RL3586LQUduKwHukBdREvm9gfVxw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 03RSyhsk2Bkl; Tue, 27 May 2025 21:25:02 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4b6QdC2ls4zm0xjy;
	Tue, 27 May 2025 21:24:46 +0000 (UTC)
Message-ID: <bfe4b18f-aa09-4b1b-89fb-1cb0cc0a78ed@acm.org>
Date: Tue, 27 May 2025 14:24:44 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] scsi: ufs: core: Don't perform UFS clkscale if host
 asyn scan in progress
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 mani@kernel.org, beanhuo@micron.com, avri.altman@wdc.com,
 junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com, neil.armstrong@linaro.org,
 luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
 peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250522081233.2358565-1-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250522081233.2358565-1-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/25 1:12 AM, Ziqi Chen wrote:
> When preparing for UFS clock scaling, the UFS driver will quiesce all sdevs
> queues in the UFS SCSI host tagset list and then unquiesce them when UFS
> clock scaling unpreparing. If the UFS SCSI host async scan is in progress
> at this time, some LUs may be added to the tagset list between UFS clkscale
> prepare and unprepare. This can cause two issues:
> 
> 1. During clock scaling, there may be IO requests issued through new added
> queues that have not been quiesced, leading to task abort issue.
> 
> 2. These new added queues that have not been quiesced will be unquiesced as
> well when UFS clkscale is unprepared, resulting in warning prints.
> 
> Therefore, use the mutex lock scan_mutex in ufshcd_clock_scaling_prepare()
> and ufshcd_clock_scaling_unprepare() to protect it.
Reviewed-by: Bart Van Assche <bvanassche@acm.org>

