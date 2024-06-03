Return-Path: <linux-arm-msm+bounces-21441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A25D58D7C26
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 09:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A4F01F22B87
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 07:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FC23A29F;
	Mon,  3 Jun 2024 07:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="citrhnIt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F7038DF9;
	Mon,  3 Jun 2024 07:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717398355; cv=none; b=WaBlCdR8AlrRpsb+LQnr+HVHYkdF0SdfLGbRhUcccnFkeUPgoBphthwAxMLFGsZQFJ3bsw5ScNi7zy2+z5WbTiMyb//us0q6Elg+RpSi5Xm3wa7n7EK7yzZMt0NfNXCVsCYYjqANhOCCx/cnAyudji2KeOgkaAp3rVZ15QzeuK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717398355; c=relaxed/simple;
	bh=ttICkqoSC11UNFdnvMl8nl57VJdDNwXaIH2tA6j08ZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DTJepUYfVgBmPdWR+CZ1RY9S7B/5RoQaybQfvsDS2J4fvmJ7ULZaeYQZ1Ya6k5G9Iej1edMMkty5vWTt84o8Z26LAhNK4JZH0sbSO8BaFec7xQSUWS7QoSo1JaOwN8K2xi9FCQfF9RRNcvL3PTc/a/XFOmgz88hdsufUL5ccOgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=citrhnIt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4531tFAS014135;
	Mon, 3 Jun 2024 07:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ttICkqoSC11UNFdnvMl8nl57VJdDNwXaIH2tA6j08ZI=; b=citrhnItrVvJ6q30
	LYUft5hvMyahQDnbVxE3p9TpDwxE6RMGCVla11JAeSU/5edYcS6dilFPCOv5fBnw
	pLJrEY7Z5iT8avNsipxWuDCawWxA01LgxtopEW4eNj679eGw/Zept2PzLg04RsiY
	pEpkwEHLcdNaQVNu+d9NMAegunOq034oZ84aR5pPcdwFKR6nPx4ZePNwD518HogQ
	Uj1lql/Avjr+GLN2oolRQcEhfE4imc7nK/zcqVDmHVJv0oqmUQ6g8mEDY062MITf
	lohX+FNeU5ZqTslRxpvr+MKSxDbzej0PHuexE1OP2MT1RxyOLMKOLwaQTAmN1VtO
	4wuu0g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw42u5fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 07:05:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 45375jmw032687
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 07:05:45 GMT
Received: from [10.204.67.150] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 00:05:43 -0700
Message-ID: <7e316c16-47a3-4a87-81da-529bb857f4db@quicinc.com>
Date: Mon, 3 Jun 2024 12:35:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] misc: fastrpc: Fix DSP capabilities request
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
 <20240530102032.27179-3-quic_ekangupt@quicinc.com>
 <32750882-2e4c-44b7-af6d-a1ec0857b69a@linaro.org>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <32750882-2e4c-44b7-af6d-a1ec0857b69a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SpyguWXz4PkUYPT4WNKDY-QmIEnMIIpQ
X-Proofpoint-ORIG-GUID: SpyguWXz4PkUYPT4WNKDY-QmIEnMIIpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030058



On 5/31/2024 3:03 PM, Srinivas Kandagatla wrote:
>
>
> On 30/05/2024 11:20, Ekansh Gupta wrote:
>> Incorrect remote arguments are getting passed when requesting for
>> capabilities from DSP. Also there is no requirement to update the
>> PD type as it might cause problems for any PD other than user PD.
>> In addition to this, the collected capability information is not
>> getting copied properly to user. Add changes to address these
>> problems and get correct DSP capabilities.
>>
>> Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP capabilities")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>   drivers/misc/fastrpc.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 4028cb96bcf2..61389795f498 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1700,9 +1700,8 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
>>       args[0].length = sizeof(dsp_attr_buf_len);
>>       args[0].fd = -1;
>>       args[1].ptr = (u64)(uintptr_t)&dsp_attr_buf[1];
>> -    args[1].length = dsp_attr_buf_len;
>> +    args[1].length = dsp_attr_buf_len * sizeof(uint32_t);
> This does not look correct,
>
> we have allocated buffer of size FASTRPC_MAX_DSP_ATTRIBUTES_LEN which is
> already (sizeof(u32) * FASTRPC_MAX_DSP_ATTRIBUTES)
>
> now this patch multiplies with again sizeof(uint32_t), this is going to send dsp incorrect size for buffer and overrun the buffer size.
As the argument passed to this function is number of attributes instead of length, this won't cause another multiplication with (uint32_t).
>
>
>
>>       args[1].fd = -1;
>> -    fl->pd = USER_PD;
> another patch may be.
Sure.
>
>>         return fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
>>                          FASTRPC_SCALARS(0, 1, 1), args);
>> @@ -1730,7 +1729,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>>       if (!dsp_attributes)
>>           return -ENOMEM;
>>   -    err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES_LEN);
>> +    err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
>
> You change this again to send FASTRPC_MAX_DSP_ATTRIBUTES instead of FASTRPC_MAX_DSP_ATTRIBUTES_LEN but why?
Copying the comment sent to Dmitry's queries:
args[0] is expected to carry the information about the total number of attributes to be copied from DSP
and not the information about the size to be copied. Passing the size information leads to a failure
suggesting bad arguments passed to DSP.
>
>
>>       if (err == DSP_UNSUPPORTED_API) {
>>           dev_info(&cctx->rpdev->dev,
>>                "Warning: DSP capabilities not supported on domain: %d\n", domain);
>> @@ -1783,7 +1782,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>>       if (err)
>>           return err;
>>   -    if (copy_to_user(argp, &cap.capability, sizeof(cap.capability)))
>> +    if (copy_to_user(argp, &cap, sizeof(cap)))
>
> Why are we copying the full struct here? All that user needs is cap.capability?
as argp sent from user during ioctl is the capability structure, the same argp is copied to a local fastrpc_ioctl_capability structure(cap) to get the domain and attribute_id information. Copying just the capability member to argp will cause problem when the user tries to read the capability. While testing the capability, I was observing this failure and it is resolved once we copy the information properly.
>
>
>
> --srini
>
>
>>           return -EFAULT;
>>         return 0;
>


