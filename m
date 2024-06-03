Return-Path: <linux-arm-msm+bounces-21432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 229E68D7B74
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 08:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1EC328137C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 06:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8640922094;
	Mon,  3 Jun 2024 06:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lTlcYo9V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A534A15;
	Mon,  3 Jun 2024 06:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717395354; cv=none; b=U5jATzS/YS64iBCCbStScww5e5cJMGVNgXh6qJaTs40p8gH/sC3rIEvEazqC5s8Riq8zSpxpgIwOJwgMfQRV5FmY0mAEcmkADrwksU9ilZ3XBdi8V/AekLMbvaJSnTjjMQYC01iMs/6LnVQXYLhcylVjN+8YpP5Wa9pQZaf2MFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717395354; c=relaxed/simple;
	bh=7rrHgbScJvACEsDGihRWGyEvBnuyBR/5wuEU9HPnbKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s94JrW++swytiLKBLunsSZmOjsptqpLrSQEIKb7EnShjcv7q9gAx7O3HAQOiv6ZJBl4j6ouyPWOTeAGxR8dAeuXN2Uuv8lC6iwWAD685Zwp/kHD5CXWcvay2YAoouZp0Ec9Yd5NBKNNNgfKWvdP1sBhZG49qOvu5RXDzNw7N5GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lTlcYo9V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 452NYVSs009764;
	Mon, 3 Jun 2024 06:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YT1OBLKs1hF7MPhZTiwA1boBt4jDphai78AphG4pTfI=; b=lTlcYo9V/+cgKuJR
	hz/bYjSjXi0HorZnf3ahZYYWbAZXlw+3g438LJx7Oey2dCYwMxKnZpAVaxulmw6o
	isvqoysxh/i36RrsnJvBMpEGA8HlRkcQJLY0ScPBmcA+XBMXW0Uy/bHgF1D3HzAS
	IazqqCSs9x7BvL/JBJ02Vd2usWDmi1iSxETTGiHdx454HgaH/ZiszAriK16tj1sg
	i5YZZvV5cdpZse4qlf49DRIVjenXTrPVYjyvVeuA/zl0SIuCmUL40fUs3m8hakhc
	1A7pCZYjl1nw7trq19qDbWMhhjj//VPjD23iINSuyLzMnPqZRd+Um5PSx51Bhq4/
	rDOOyA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw3r3ad6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 06:15:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4536FW90008660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 06:15:32 GMT
Received: from [10.204.67.150] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 2 Jun 2024
 23:15:29 -0700
Message-ID: <1272b70e-fe2f-47cd-af77-6d3461b8596c@quicinc.com>
Date: Mon, 3 Jun 2024 11:45:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] misc: fastrpc: Fix DSP capabilities request
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        stable
	<stable@kernel.org>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
 <20240530102032.27179-3-quic_ekangupt@quicinc.com>
 <zcqc4dgc6pippwiysybmkbvogfd6gbinnrw65kiulie3wlup5y@wq4dexvamo7t>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <zcqc4dgc6pippwiysybmkbvogfd6gbinnrw65kiulie3wlup5y@wq4dexvamo7t>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: L8whYWb62P4Lhj66hceOxwq6i9V7tdh_
X-Proofpoint-GUID: L8whYWb62P4Lhj66hceOxwq6i9V7tdh_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-02_15,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030051


On 5/30/2024 4:29 PM, Dmitry Baryshkov wrote:
> On Thu, May 30, 2024 at 03:50:20PM +0530, Ekansh Gupta wrote:
>> Incorrect remote arguments are getting passed when requesting for
>> capabilities from DSP.
> Describe why and how they are incorrect.

Sure, I'll update this information in the next spin.

>
>> Also there is no requirement to update the
>> PD type as it might cause problems for any PD other than user PD.
> Also... means that these are two separate issues. There should be two
> separate commits.

Okay, I'll separate out the PD type change.

>
>> In addition to this, the collected capability information is not
>> getting copied properly to user. Add changes to address these
>> problems and get correct DSP capabilities.
>>
>> Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP capabilities")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>   drivers/misc/fastrpc.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 4028cb96bcf2..61389795f498 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1700,9 +1700,8 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
>>   	args[0].length = sizeof(dsp_attr_buf_len);
>>   	args[0].fd = -1;
>>   	args[1].ptr = (u64)(uintptr_t)&dsp_attr_buf[1];
>> -	args[1].length = dsp_attr_buf_len;
>> +	args[1].length = dsp_attr_buf_len * sizeof(uint32_t);
> As you are skipping first entry, should there be (dsp_attr_buf_len - 1)
> * sizeof(uint32_t).

This was done in the next patch of the series, I'll bring it here.

>
>>   	args[1].fd = -1;
>> -	fl->pd = USER_PD;
>>   
>>   	return fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
>>   				       FASTRPC_SCALARS(0, 1, 1), args);
>> @@ -1730,7 +1729,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>>   	if (!dsp_attributes)
>>   		return -ENOMEM;
>>   
>> -	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES_LEN);
>> +	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
> So it looks like the argument was correct. It was passing length, not
> the number of attributes. The only thing to fix is that args[1].length
> should be dsp_attr_buf_len - sizeof(*dsp_attr_buf).

args[0] is expected to carry the information about the total number of attributes to be copied from DSP
and not the information about the size to be copied. Passing the size information leads to a failure
suggesting bad arguments passed to DSP.

>
>>   	if (err == DSP_UNSUPPORTED_API) {
>>   		dev_info(&cctx->rpdev->dev,
>>   			 "Warning: DSP capabilities not supported on domain: %d\n", domain);
>> @@ -1783,7 +1782,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>>   	if (err)
>>   		return err;
>>   
>> -	if (copy_to_user(argp, &cap.capability, sizeof(cap.capability)))
>> +	if (copy_to_user(argp, &cap, sizeof(cap)))
>>   		return -EFAULT;
>>   
>>   	return 0;
>> -- 
>> 2.43.0
>>

