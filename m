Return-Path: <linux-arm-msm+bounces-26696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B84339388C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 08:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D47891C20CDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 06:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0259617736;
	Mon, 22 Jul 2024 06:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gK7rLvMl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF70175BF;
	Mon, 22 Jul 2024 06:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721628787; cv=none; b=G3hnrhNRU9HkdR9fm4XmF01QGp1fYvSteru9+FRj5h1ITtFk8yORWiWJtIgiArD5jzX8y/p/pA56GrBghRzydb0aU15EBsdcA0SmJhqzzrcTICi4pyaXYWTHVajYVMVlpCAA4857fskF5dAHQDcDOluKuFQ2zZhm+3Qi2Yh7vWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721628787; c=relaxed/simple;
	bh=7JtgglTKEAtn4yfbCf2V2klco71MxBGIsDxCjCeltsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ar2BI8Furzrf16g6nL1sR3YsMRWXm4YESqvPfx0TeB50BT0Yg1Vrwy6wKDNVN6y1UXN4G9K/A0ND7vM/PlLAkesxYrPNZLT1XFwrBNR+q3wHCPD292DqkVpQofJ8NiIs6Jl8I74zUyKAS14iDTMjH1luO3Z0MPNEHJ10aTlThRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gK7rLvMl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46LNeOpb022587;
	Mon, 22 Jul 2024 06:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aGogO1Jxb0LDYElt/HcVnCtW7pF4zZaS4RBUROUZ1wY=; b=gK7rLvMlhKB/bMZV
	evIrc9dJzQ+/6ZgDid2jH93zTQpzXExzTkl4N/VIMY8c1ZT/QuI/XUdnaNHPO391
	YU5PXXePZ8/h7HhtZWbQ5Q/d73mv5RNzj0VhRFcWge5nBAF0lXlC7Px4Do8NeHfr
	hLkh6cYjt1LoRzWb+XB5LffiAXfgTRO4HEOL2hLweQAJre4+4o4IV4p7UpfHOEZT
	xkI/DnnUfG1/6UcOqnIcimbhTxxwL8QRTQsADBAm5wIeRlBc4WjkazkIurlwODhI
	vTCHxMupj4S3eWm0+q7Ql2JbZoscYrkVKyOOGUHD5JL6oYAobhNJ0Q/2XRxXBCE+
	WWEQgw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g6h8tnhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 06:12:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46M6Cwp1028560
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 06:12:58 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 21 Jul
 2024 23:12:55 -0700
Message-ID: <607362f2-8ae5-46bd-a3a4-2d78da98b12a@quicinc.com>
Date: Mon, 22 Jul 2024 11:42:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] misc: fastrpc: Define a new initmem size for user
 PD
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
        <arnd@arndb.de>, stable <stable@kernel.org>
References: <20240722055437.3467900-1-quic_ekangupt@quicinc.com>
 <20240722055437.3467900-2-quic_ekangupt@quicinc.com>
 <2024072234-slug-payer-2dec@gregkh>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024072234-slug-payer-2dec@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -4qDP_L_7BjtmN3sxXoQ4XOcMiIH0ioL
X-Proofpoint-GUID: -4qDP_L_7BjtmN3sxXoQ4XOcMiIH0ioL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_02,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407220047



On 7/22/2024 11:28 AM, Greg KH wrote:
> On Mon, Jul 22, 2024 at 11:24:36AM +0530, Ekansh Gupta wrote:
>> For user PD initialization, initmem is allocated and sent to DSP for
>> initial memory requirements like shell loading. The size of this memory
>> is decided based on the shell size that is passed by the user space.
>> With the current implementation, a minimum of 2MB is always allocated
>> for initmem even if the size passed by user is less than that. For this
>> a MACRO is being used which is intended for shell size bound check.
>> This minimum size of 2MB is not recommended as the PD will have very
>> less memory for heap and will have to request HLOS again for memory.
>> Define a new macro for initmem minimum length of 3MB.
>>
>> Fixes: d73f71c7c6ee ("misc: fastrpc: Add support for create remote init process")
>> Cc: stable <stable@kernel.org>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index a7a2bcedb37e..a3a5b745936e 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -39,6 +39,7 @@
>>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>>  #define FASTRPC_CTXID_MASK (0xFF0)
>>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>> +#define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
> Meta-comment, for a future change, why not tabs to line things up?
Sure, I'll add a comment.
Should I line up all the MACRO definitions? If yes, should I send it as a separate patch?
>
>>  #define INIT_FILE_NAMELEN_MAX (128)
>>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>>  
>> @@ -1410,7 +1411,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>  			goto err;
>>  	}
>>  
>> -	memlen = ALIGN(max(INIT_FILELEN_MAX, (int)init.filelen * 4),
>> +	memlen = ALIGN(max(FASTRPC_INITLEN_MIN, (int)init.filelen * 4),
> You are aligning it this way, but still checking the file size for
> INIT_FILELEN_MAX, so that's not really going to change anything here.
File size is for the fastrpc shell that is to be loaded. This is the size of buffer allocated by user and passed
to the driver. The driver will map this buffer to SMMU before passing it to DSP. Therefore the bound
check on this size is necessary. As for initmem size for remote process on DSP, this size is also inclusive of
initial requirements of DSP size user process(user PD), hence separating it from file size macro.
> How was this tested?
This is tested with fastrpc use cases available in hexagon SDK:
https://developer.qualcomm.com/software/hexagon-dsp-sdk/sample-apps

--Ekansh
> thanks,
>
> greg k-h


