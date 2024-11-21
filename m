Return-Path: <linux-arm-msm+bounces-38597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D119D4724
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 06:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F1CBB22F3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 05:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF1D1C75E4;
	Thu, 21 Nov 2024 05:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NI0Yc2yf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997FB1A9B38;
	Thu, 21 Nov 2024 05:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732166220; cv=none; b=Cuy4Sh6t3pn7kW6BioqwNaXNeCAWBLAK2MXpx5RVfQMMj26rcN9Jb/U4e4CqCmAf4ypsINIR54jlUnAdVg/D75lowVAQ2SMmPrvcIAVl2L4hUGH2O6D3XbUjDDIxAn6wvstOI15V01sXqnydJwuCpzwcV+mSgvw8xXs7A9sqj1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732166220; c=relaxed/simple;
	bh=YsBy5z55UBaWi1Auf3k2NlIGdjMg56aTiRAXRzA6mu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IOqNpB+7y8SkX8ZdD6A/1Qq7nSjGk2l0vR2iEMFGMbUthNxLwwo3P3qi2/PNULQNgrHR6gZSt1nYLGeNLtKCpHqvmiMJKexKY13YTYHAVv0f7Gp/mggq7ZF6F8iQE6oOFiKtlkARX1X9KVw65ofe6/dUTjIQ9tGTyrvucQILQJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NI0Yc2yf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKSNGI003971;
	Thu, 21 Nov 2024 05:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yt/Q0jUqmCxpRTX/HsuPpVMaJaE+G867/asSnDQT4Eg=; b=NI0Yc2yfGNur9kXY
	lSVmrBl9WC5ce4s6KQkmwANZd5s9VGab9oBx8bgl84fGMEebaT2zP/vifURpwQPK
	2aVWkan+C+7vXOFYTSJRIwLbw5NnrVadGp6GjZOmOYUmvgzWef3HT8GbxP5vyAmb
	WNe69if7BeVx8Bi/kTFkn41uI8adMxgnHIEq4FTXRQVU7JAV9viUrnUUYu15FfNI
	/QusTeYpFo3i3/1w/XgnM6o8Sk92V5udHXRJeOzhnKqE+whaAQzIAqh+C5oNk6Rf
	PPCOZ4uKqUXsl+8jly98x+h/Z8XcGOa9oGYK8xC0q3jX/MibXU2F+MNHb6BKkZyl
	F9yf+A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce3asne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 05:16:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL5GqB1008464
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 05:16:52 GMT
Received: from [10.216.16.63] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 21:16:47 -0800
Message-ID: <c41839b9-36b1-431e-9031-4e57f62b50c2@quicinc.com>
Date: Thu, 21 Nov 2024 10:46:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>, Eric Biggers <ebiggers@kernel.org>
CC: Adrian Hunter <adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_rampraka@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_sachgupt@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_neersoni@quicinc.com>, <quic_gaurkash@quicinc.com>
References: <20241006135530.17363-1-quic_spuppala@quicinc.com>
 <20241023213134.GC3736641@google.com>
 <CAPDyKFo05Hyw9gdEBx7zQq_6P58ittHHsZQLuqmeR1AChyHSHw@mail.gmail.com>
 <20241025025628.GD1781@sol.localdomain>
 <CAPDyKFo5EijkL5Y+MZ0=ZWyGdLfDdSdqTOC0eMsTVY00KP+RAA@mail.gmail.com>
From: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
In-Reply-To: <CAPDyKFo5EijkL5Y+MZ0=ZWyGdLfDdSdqTOC0eMsTVY00KP+RAA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Mz_Kb24kjFEC-JUvY-z0jGMrq4sfh93T
X-Proofpoint-ORIG-GUID: Mz_Kb24kjFEC-JUvY-z0jGMrq4sfh93T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210039



On 10/25/2024 2:12 PM, Ulf Hansson wrote:
> On Fri, 25 Oct 2024 at 04:56, Eric Biggers <ebiggers@kernel.org> wrote:
>>
>> On Fri, Oct 25, 2024 at 01:07:18AM +0200, Ulf Hansson wrote:
>>> On Wed, 23 Oct 2024 at 23:31, Eric Biggers <ebiggers@kernel.org> wrote:
>>>>
>>>> On Sun, Oct 06, 2024 at 07:25:28PM +0530, Seshu Madhavi Puppala wrote:
>>>>> Crypto reprogram all keys is called for each MMC runtime
>>>>> suspend/resume in current upstream design.
>>>>
>>>> Is that correct?  I thought that similar to what is done for UFS, the key
>>>> reprogramming happens only after the MMC controller is reset.  I thought that is
>>>> different from a runtime suspend.
>>>
>>> Looks like Seshu is not really worried about the host's runtime
>>> suspend, but the card's runtime suspend.
>>>
>>> Perhaps there are some out of tree code involved here that makes use
>>> of MMC_CAP_AGGRESSIVE_PM, which is what allows the card to be runtime
>>> suspended?
>>>
>>>>
>>>> If it's in fact triggering more often, maybe that is what needs to be fixed?
>>>
>>> We could extend the runtime PM autosusend timeout for the card, if
>>> that makes sense.
>>>
This change aims to address host side feature by not tying it up to card 
side flag/feature.
>>> Kind regards
>>> Uffe
>>
>> The keyslots are being reprogrammed from mmc_set_initial_state(), which is
>> documented as:
>>
>>      /*
>>       * Set initial state after a power cycle or a hw_reset.
>>       */
>>      void mmc_set_initial_state(struct mmc_host *host)
>>
>> It's called by: mmc_power_up(), mmc_power_off(), _mmc_hw_reset(), and
>> mmc_sdio_sw_reset().
>>
>> Can that mean a power cycle of the card, not a power cycle of the host
>> controller?
> 
> Yes, that's correct.
> 
> Well, indirectly the host is likely to be power cycled too, but not necessarily.
> 
>> The keyslots are part of the host controller, so that may explain
>> the problem.  The keyslots should be reprogrammed only when the host controller
>> is reset, as that is when they are lost.  (And it should not be skipped entirely
>> as this patchset does, as a host controller reset is possible.)
>>

This will be update via a separate patch by invoking reprogram_all_keys 
API from sdhci_msm_gcc_reset() API 
https://github.com/torvalds/linux/blob/master/drivers/mmc/host/sdhci-msm.c#L2363

Thanks,
Seshu

>> I am not an expert in MMC or in the details of how Qualcomm ICE is wired up to
>> the system, so I might have this wrong.  But let me know if it sounds right.
> 
> It sounds reasonable to me, but I also don't know the HW well enough
> to be able to tell.
> 
> Looks like we need some more input from Seshu and the QC folkz to
> understand better.
> 
> Kind regards
> Uffe

