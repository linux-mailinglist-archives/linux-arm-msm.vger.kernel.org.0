Return-Path: <linux-arm-msm+bounces-57284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE63AAFFEA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C5B04E0842
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF9927CB18;
	Thu,  8 May 2025 16:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="xPehbiMa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D14227AC47;
	Thu,  8 May 2025 16:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746720411; cv=none; b=F4jPC5QONamblWAxRYbhgRcmS/6Dz0T1p8EmdQdojRxGOqU9cKYPMicOPqBuAfrGgYuLYeA9m70tOpuzWLaYlGkOgQWK9Ax0Y6Mq0ZlyLdpx8unbTdIkeIQE8ikdLO60tjTQDOVRlJEINh9YHTrzoBdRkcI4Df9+Nl5pDZZjD6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746720411; c=relaxed/simple;
	bh=OyskF42LM6Bxn6mh3FqN4hvTQ2IPXptkR5h/ItWp4+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VfPhDw94MC1kZqCS9eXvYDgqS6PbhpuiDAVX9S624xgUgVWqyGRggGMjp2ikgP7yo+dYYIAA0Uu1aCoOPEH7iJ03G7TQOsrGdi0l8evJ0EX2Ev/7y6v97kHrLPRp3owm5XXTFOhpgR9dOy4frAbcdXT1938+Px4UVQJwaJA8G0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=xPehbiMa; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4ZtcT46L4Nzlnfx6;
	Thu,  8 May 2025 16:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1746720405; x=1749312406; bh=CQV5mSzjgEnmWgEB9C9eBlg0
	5iQfM1JglqUd5jyRaCM=; b=xPehbiMaEnzZjy25zBHGqux/ZU6vkcDWgggsvUH4
	xzaNbUoLrhQE15jdntRDvLKjB1N+EtLzXi36iP+Hl7I8SxrwvzWaqEIVN7lFwSOJ
	xBiEI5ypd4XWqllaQr8KAUjONPPKtxBe3HU8OokcRQFP8CUu6te1zdtsYM87nx7Q
	f1TYgkPa3Cn+b3EHKp+z3iT96+3bqXEmqDGIFRIb2u+MLh+7YgAQNNzfIOoPE9+E
	ssd/w1m2SCDZCEOipdGMYgFhmThf8Bvj8omZduRGTtCdsGD1cwnONWGpg7jGLEnG
	HdST4kX/sWLK2NxvXGDHX2fs73YngPt8dE1bjkb2seFqRA==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 2AIYu1_hzvfV; Thu,  8 May 2025 16:06:45 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4ZtcSj1w5wzlssn9;
	Thu,  8 May 2025 16:06:28 +0000 (UTC)
Message-ID: <fd13e179-f2d8-4085-86da-c6b0fce2de5b@acm.org>
Date: Thu, 8 May 2025 09:06:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] scsi: ufs: core: skip UFS clkscale if host
 asynchronous scan in progress
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
References: <20250508093854.3281475-1-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250508093854.3281475-1-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/25 2:38 AM, Ziqi Chen wrote:
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 1c53ccf5a616..04f40677e76a 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -1207,6 +1207,9 @@ static bool ufshcd_is_devfreq_scaling_required(struct ufs_hba *hba,
>   	if (list_empty(head))
>   		return false;
>   
> +	if (hba->host->async_scan)
> +		return false;

Testing a boolean is never a proper way to synchronize code sections.
As an example, the SCSI core could set hba->host->async_scan after this
check completed and before the code below is executed. I think we need a
better solution.

Bart.

