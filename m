Return-Path: <linux-arm-msm+bounces-64303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DE4AFFB7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 09:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9889858547A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 07:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9285728B519;
	Thu, 10 Jul 2025 07:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l1yTUzjy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58F728B4E0;
	Thu, 10 Jul 2025 07:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752134348; cv=none; b=UNCGsG778A0lZBwxCakdDGczbWXkSTDyPjDfJsIIKlomA02RfUqnsU9l+wOYyP50LhWVEPeXCfqfDSaSWePi0mPvR7ODpQzI9TZNyghW1m1ZTeMdObvBl35OeAWt8MAJoWh7Tl66H/Yez+7DCbT+C5qKPuBEK7yoQTTl6O45H1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752134348; c=relaxed/simple;
	bh=/b8ziFGdDpEuf8DZiIEsTPibr3pxuE68xuG+bfQLHI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Km9OtrBeZCm+U6sSmzgB6O2DxIomuHE5r2VZUon54qY9HYdYF8f27PeJDDEt0veGqn5zlxoNDv7J1wEMAZZJplkPNNo/IHwNLllJzqF0YR/wZTdC3SIFOOV3v+Ly1MVsjETCZaj62+NfdP8rcYfGSpRR9lNO3cPoIU2dSEaUk2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l1yTUzjy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A1HKQV011316;
	Thu, 10 Jul 2025 07:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOErOWq/REZd642WD4gTAc2u2l5kA/4CfeaP22QXb5A=; b=l1yTUzjyqZYePwtW
	vuzouT64SdF5PsNYDe58+CtiNxFXeEFOZMMr5MPzHo8ZMPDhC6k/uML9qsZjiDLu
	FAYSmdriGJS0Nt1cgIsy1dT+8CrVgAkeqF1t+R2s6yhNA8YhgYSf9sMQF6XjcqHQ
	OD1dxR1TzCA7odXdkMl07oLhpURnmu/upXNQCRIMJrOF62FFux2jvxsmot28s9FB
	zu0xTt1zvnGdo7qtcvJor+TZcHhvBCqyfmP8dLH9dO5oKEJh0i1+dJXlcD+aRXGu
	P16rPHGTue18NyJfCXkt7cV6YFRg0OJ756yEnkHBIil8i7cU5GL8SY1h7hF/k+4u
	w4vYJg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafm1ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 07:59:00 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A7wxmF009487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 07:58:59 GMT
Received: from [10.217.223.199] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 10 Jul
 2025 00:58:51 -0700
Message-ID: <6e7da6f3-3a2c-48be-8fb4-c2377d86efc3@quicinc.com>
Date: Thu, 10 Jul 2025 13:28:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mmc: Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
Content-Language: en-GB
To: Eric Biggers <ebiggers@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <kernel@quicinc.com>, Neeraj Soni <quic_neersoni@quicinc.com>,
        "Ram Prakash
 Gupta" <quic_rampraka@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Sachin Gupta <quic_sachgupt@quicinc.com>,
        Bhaskar Valaboju
	<quic_bhaskarv@quicinc.com>,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>,
        Sarthak Garg <quic_sartgarg@quicinc.com>
References: <20250606104714.1501297-1-quic_dmukhopa@quicinc.com>
 <20250606175909.GB53397@google.com>
From: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
In-Reply-To: <20250606175909.GB53397@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686f72c4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=LfTJMgrNiS4hAUzoDj8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: _u3z_R_9suJgYVM1kEPHAqPGZ417J-kq
X-Proofpoint-GUID: _u3z_R_9suJgYVM1kEPHAqPGZ417J-kq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA2NiBTYWx0ZWRfXyS7psnf9iPaN
 a4MbTF/oKoYhgscWVQE+jY/gGjUHi/dXO6h4us1Ze/JJALtvqIJemwIZyTmw8rnGBGkdTSDjJq7
 9CbnVVVprHRkQmmqkSUQ52NKYwCXEUlE5iyiX3suFYRNkqZNXi3dnA5Wa/hbHe66NXXCQea+TZA
 RVqhaPvS0HxHu8D0i+XhX8FnZ+jyIGPgcQKvbErezIVZLf55Q5KOak2aazPj0mzHKHtt450NYda
 0258jj8gqZ7TZJrdLPvyhvKRqpjHHyeLOt4BRWWzu23nscQG8MIdN+RMWKEDeqmDjzBf4lV/VaI
 wBRWAhJJrMOxEZyfdu6tz4vIqkTXios87VgI+V4a4mzN/dye5SnJQsJfRpp0T+5j4U1PUxQXftQ
 3VDs2PlTHqG0AHXzpa2xlqFK4VMeGpiNrrg+plQNBtXWcYyKxoHXPmt2C6VHgw5EWUZABSB2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100066

Hi Eric,

Thanks for the review.

Clarifications are given inline below.

On 6/6/2025 11:29 PM, Eric Biggers wrote:
> On Fri, Jun 06, 2025 at 04:17:14PM +0530, Debraj Mukhopadhyay wrote:
>> Crypto reprogram all keys is called for each MMC runtime
>> suspend/resume in current upstream design.
> It's called from mmc_set_initial_state(), which is documented as:
>
> /*
>   * Set initial state after a power cycle or a hw_reset.
>   */
>
> Please clarify how that corresponds to "MMC runtime suspend/resume".
As part of suspend/resume, mmc regulators are turned off/on - 
effectively performing a power cycle, and hence mmc_set_initial_state is 
called after runtime suspend/resume.
Call flow:
Suspend: mmc_runtime_suspend() → _mmc_suspend() → mmc_power_off() → 
mmc_set_initial_state()
Resume: mmc_runtime_resume() → _mmc_resume() → mmc_power_up() → 
mmc_set_initial_state()
>> streaming applications have been observed due to this. Add the flag
>> MMC_CAP2_DONT_REPROGRAM as part of host->caps2 to control reprogramming
>> keys to crypto engine for socs which dont require this feature.
> The flag has a different name in the code.
Ack, will be addressed in the v3 patch.
>> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
>> index fec4fbf16a5b..d41672e2856e 100644
>> --- a/drivers/mmc/core/crypto.c
>> +++ b/drivers/mmc/core/crypto.c
>> @@ -15,7 +15,7 @@
>>   void mmc_crypto_set_initial_state(struct mmc_host *host)
>>   {
>>   	/* Reset might clear all keys, so reprogram all the keys. */
>> -	if (host->caps2 & MMC_CAP2_CRYPTO)
>> +	if (host->caps2 & MMC_CAP2_CRYPTO && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
>>   		blk_crypto_reprogram_all_keys(&host->crypto_profile);
> Add parentheses around 'host->caps2 & MMC_CAP2_CRYPTO'
Ack, will be addressed in the v3 patch.
>> +#ifdef CONFIG_MMC_CRYPTO
>> +#define MMC_CAP2_CRYPTO_NO_REPROG	(1 << 29)	/* Host does not support inline crypto key reprogramming */
>> +#else
>> +#define MMC_CAP2_CRYPTO_NO_REPROG	0
>> +#endif
> Well, it does support inline crypto key reprogramming.  It just doesn't want the
> MMC core driver to handle it.  Please update the comment to something like:
> /* Host driver handles crypto key reprogramming */
>
> - Eric

Ack, will be addressed in the v3 patch.

Thanks,

Debraj


