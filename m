Return-Path: <linux-arm-msm+bounces-45856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F7BA1986E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 19:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 119313A8A0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 18:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAE0214226;
	Wed, 22 Jan 2025 18:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="ucXHSU+v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA82212B0F;
	Wed, 22 Jan 2025 18:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737570628; cv=none; b=rozDyF9g92ItGj4echu8URv2kts4ASbyniYAG9PN8PDqU6grW3H6Gi3PsCNE4I1nfnRTKu5QO10SphTQC7E/qwLyBfF4rlbvYAeRbDQ7ZL+9R1I/s8j0JVkP5MNXwxcp9AwcPVBIElAHm33hkM/DGAlAmhwROWkvXJJLKp0nSZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737570628; c=relaxed/simple;
	bh=xEFCs9WiSvsMH/1wLG8zf1bjDIlWp1a3wAS4404mWdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=er8YzN4gb7tl2x4cDqgJ4o1DLgWOcMsORID+2JcS1cZ8tA56gQT+pjpfL0UtAof1+ZcdAz2dQcPBUv0gDUw0Xd6o0RpQHd8fZK6om3+uXdGSK1bthU6Ir4tdq4EZBRfgTlzZwLiVbYKJJbnkhJ5YodOD/MzWL95p8Vp+HoOvYvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=ucXHSU+v; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YdXgj6W2RzlgMVb;
	Wed, 22 Jan 2025 18:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1737570619; x=1740162620; bh=2nqfdqYVC1qQdZ/0uX5K923Z
	hSZGnJkoom2wAHMbuRA=; b=ucXHSU+v+vzlbPhvybHClBpipQHpyJqFtIb4cXX/
	tv/QgO4twWbmVKt3uj2D8drK8nn0wMfW4Nnc2fStPZtawp155UaFCUutcBV+eXYi
	9sNPCy2/7cgWcrcfOJvtA81yS3r5/i29zVTW7IkNofg377uafClmkIfCKmrIToLH
	RefX/AHz6qjP/SI16rFflVTcrbaSDKkzkjs05Sapq5yW/iCzN0OZPy2w6G0It5sw
	Qg14RmJoqroO2+wqdkJQGaH2X/4GfM6EzskYXnr1xDAVCionw78p3cFeWyVCXfE2
	qon8oGHjpa9sGJxRmS5d0K4IEfHGtkQNub3HfYG+nXnh6g==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 8LJaZKaHBEip; Wed, 22 Jan 2025 18:30:19 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YdXgQ2BbYzlgTWK;
	Wed, 22 Jan 2025 18:30:09 +0000 (UTC)
Message-ID: <a0359746-2cf0-4db3-891d-b4cb4ff6c163@acm.org>
Date: Wed, 22 Jan 2025 10:30:08 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] scsi: ufs: core: Add a vops to map clock frequency
 to gear speed
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 mani@kernel.org, beanhuo@micron.com, avri.altman@wdc.com,
 junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Peter Wang <peter.wang@mediatek.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-4-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250122100214.489749-4-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/25 2:02 AM, Ziqi Chen wrote:
> +static inline int ufshcd_vops_freq_to_gear_speed(struct ufs_hba *hba,
> +						 unsigned long freq,
> +						 u32 *gear)
> +{
> +	if (hba->vops && hba->vops->freq_to_gear_speed)
> +		return hba->vops->freq_to_gear_speed(hba, freq, gear);
> +
> +	return -EOPNOTSUPP;
> +}

Please remove "vops_" from the function name. I don't think this part of 
the function name is useful. Additionally, please return the gear value 
as the function result and remove the "u32 *gear" argument.

Thanks,

Bart.

