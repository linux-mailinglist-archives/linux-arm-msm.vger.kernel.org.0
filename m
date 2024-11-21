Return-Path: <linux-arm-msm+bounces-38596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D80909D471E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 06:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53424B20E54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 05:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D9A13665B;
	Thu, 21 Nov 2024 05:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="olu2LcoF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505C71BF58;
	Thu, 21 Nov 2024 05:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732166187; cv=none; b=lczoRj0lJQknp5Tat5if3tiqZa3aXnCfvVCECujI8heJwkWElmK12CdD0KTeCq64EBISGsCdmqj1DnGCRuWNPnV14CtWss79NsmK+804AUiXyWH55+uVtsCrRLlM5U2eoQ6/Ue0DrcDw4psqF8YwUcUj5J8BwFqtlJ8zIco6CQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732166187; c=relaxed/simple;
	bh=kK0HjSp9uGUUgTYbpyAsE7rhlJiikxl788ycM+uWszE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XL1fisDqiSheSJHc9IZCy0mlJkekQ7up88US32XAblnRftNixETq4MpSIf3zrlWSxXWNgFa8YrnMhy4NoY18BQ/IdNl830bS8RkrbQO+L3yFzqEtYt2/LImMgkVXNbuPuqD90iUxfMcuqkTLNbgV770vD4A75fT+92zgQU0kydI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=olu2LcoF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKK0Ddj007592;
	Thu, 21 Nov 2024 05:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uELJuvasb1cXZyS0rrMmYbLAY6rbw7wIMoFNtnZxWqw=; b=olu2LcoFZ4qtFZvl
	jsOr5kf3/FppFsunzdrmMYFCL3ZajFAHVTXSH7Nuo7IiWefAXJ7iXegT/XhSVM8Y
	fyTopWSHDo4sBmtfK8kZbAhifOghl9E0qJxuV7WwKlpQ7qTsnCCz0z5kLOrvdT8R
	u32ZmTrnxvUVpVlTkNOM/bxFNAF7GjJ0XKVXkPBYuNUyn9W5R0M7u3c6tMj7bERq
	b13BNoYSSEQ7TYR/Fk6Obs5GyBE+/3g9iRvFPedNAX1OyWdJHQArSA0VknW8pWnh
	SOPYyyttwj9/05srGbbfh3IMcPh6A5hDubZQf28jw0+ArLy+dNVnnDCCFNl/Afld
	f2LAwA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4318uvk9sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 05:16:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL5GHuX015394
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 05:16:17 GMT
Received: from [10.216.16.63] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 21:16:11 -0800
Message-ID: <c3a25f81-dd17-43ca-bfac-363f1f2d3556@quicinc.com>
Date: Thu, 21 Nov 2024 10:46:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 1/2] mmc: core: Add vendor hook to control
 reprogram keys to Crypto Engine
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_rampraka@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_sachgupt@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_neersoni@quicinc.com>, <quic_gaurkash@quicinc.com>
References: <20241006135530.17363-1-quic_spuppala@quicinc.com>
 <20241006135530.17363-2-quic_spuppala@quicinc.com>
 <20241023212834.GB3736641@google.com>
From: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
In-Reply-To: <20241023212834.GB3736641@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9-9qgaWHNPC4WTQXsE9e34BjCFgUwC8g
X-Proofpoint-GUID: 9-9qgaWHNPC4WTQXsE9e34BjCFgUwC8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210039



On 10/24/2024 2:58 AM, Eric Biggers wrote:
> On Sun, Oct 06, 2024 at 07:25:29PM +0530, Seshu Madhavi Puppala wrote:
>> Add mmc_host_ops hook avoid_reprogram_allkeys to control
>> reprogramming keys to Inline Crypto Engine by vendor as some
>> vendors might not require this feature.
>>
>> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
>> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> ---
>>   drivers/mmc/core/crypto.c | 8 +++++---
>>   drivers/mmc/host/sdhci.c  | 6 ++++++
>>   include/linux/mmc/host.h  | 7 +++++++
>>   3 files changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
>> index fec4fbf16a5b..4168f7d135ff 100644
>> --- a/drivers/mmc/core/crypto.c
>> +++ b/drivers/mmc/core/crypto.c
>> @@ -14,9 +14,11 @@
>>   
>>   void mmc_crypto_set_initial_state(struct mmc_host *host)
>>   {
>> -	/* Reset might clear all keys, so reprogram all the keys. */
>> -	if (host->caps2 & MMC_CAP2_CRYPTO)
>> -		blk_crypto_reprogram_all_keys(&host->crypto_profile);
>> +	if (host->ops->avoid_reprogram_allkeys && !host->ops->avoid_reprogram_allkeys()) {
>> +		/* Reset might clear all keys, so reprogram all the keys. */
>> +		if (host->caps2 & MMC_CAP2_CRYPTO)
>> +			blk_crypto_reprogram_all_keys(&host->crypto_profile);
>> +	}
> 
> This should be a simple flag, not an indirect function call which is
> inefficient.
> 
> It could be a bit in mmc_host_ops, though based on the existing code maybe a new
> bit in MMC_CAP2_* would be more appropriate.

I will update this in v2 patchset by adding the flag as part of host->caps2

Thanks,
Seshu
> 
> - Eric

