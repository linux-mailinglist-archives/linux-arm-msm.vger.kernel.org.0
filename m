Return-Path: <linux-arm-msm+bounces-48311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41739A38FC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 00:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B99883AA845
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DED61A841E;
	Mon, 17 Feb 2025 23:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dwA/TlOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905901A3164;
	Mon, 17 Feb 2025 23:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739836127; cv=none; b=aso/hlLeZ4jtW5YzoSCm3U8YAmBolB3Kl36WB0ZTeltfMBGD/dbdAC1hl1qWI/WKzm/R70oDeIIJEqX5GcpQ0KwHuORPE94u9WArOjdmeF3XvQ4dLH2Cv8gGYQ/VgqNiHmBjw/JEQO5S7gvu/YkZiCnaUBWVIBttNnZQrKEnTA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739836127; c=relaxed/simple;
	bh=2JifuhMMd/Os+Vu989BYTOBe5OANbDP6cxwPfEUyxh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TwenliaWBeqLWHWp0BUz6oxz34c+H3e6sPvlCrMmGchhBvUavembfsTY6EidqkAMiORjAYxaLKQPf9hWVGWpLVcY/4NsNYFiHB/CwrQyONBhMABI/M3eK5SjaOEc3NDODGnXpx61g9j/EoJYkLYIPJkvEewpI3SdCAr7C74xnMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dwA/TlOl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HAd0YK027323;
	Mon, 17 Feb 2025 23:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mposa2NctlnELMn+32A/HzR4/xUTQbMXeeZYQescYiA=; b=dwA/TlOlMJnITFGp
	vA+iGMrTZLadtocfTgQ3hyLkOj/MhLfHlGHFpTdm8lY+YYmaaJR4ANii4UXkEt2j
	LNnYJ3pe6FHqCl0fwT+HUC65XMuBMBC7iXQF6mBYEtuUP8ll3y1lcz7eL32nrFdT
	jRso4D5CBg0cvPOMz9F1vurFLxph6wMJ3ZYi+iLsTpIHUq04c+VJe//0s52V+xHN
	faDQ58b6B/P4Zt8dZ42dvI+yzQTZZZPTojWxWmg5rJHOStdjnDyvcO/67ropVCST
	k9H400U2n49b+yXNVSjnkUquMLfHW34sH8pzpmMrvXMAGJ6b98mY/nJj+Mo5pvid
	a/UCpA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7sk2qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 23:48:38 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51HNmbrB024790
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 23:48:37 GMT
Received: from [10.4.85.56] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Feb
 2025 15:48:34 -0800
Message-ID: <9f7d50b5-4efd-4e37-b591-a96f765f4bec@quicinc.com>
Date: Tue, 18 Feb 2025 10:48:32 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Sumit Garg <sumit.garg@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
References: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com>
 <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-3-297eacd0d34f@quicinc.com>
 <20250217101003.GB2637163@rayden>
Content-Language: en-US
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
In-Reply-To: <20250217101003.GB2637163@rayden>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uaeuU4og5nSze2xlgucHzsekacf5uXFq
X-Proofpoint-ORIG-GUID: uaeuU4og5nSze2xlgucHzsekacf5uXFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502170180



On 2/17/2025 9:10 PM, Jens Wiklander wrote:
> On Sun, Feb 02, 2025 at 06:43:31PM -0800, Amirreza Zarrabi wrote:
>> For drivers that can transfer data to the TEE without using shared
>> memory from client, it is necessary to receive the user address
>> directly, bypassing any processing by the TEE subsystem. Introduce
>> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
>> userspace buffers.
>>
>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
>> ---
>>  drivers/tee/tee_core.c   | 27 +++++++++++++++++++++++++++
>>  include/linux/tee_drv.h  |  6 ++++++
>>  include/uapi/linux/tee.h | 22 ++++++++++++++++------
>>  3 files changed, 49 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>> index 721522fe5c63..9f4b9a995e16 100644
>> --- a/drivers/tee/tee_core.c
>> +++ b/drivers/tee/tee_core.c
>> @@ -386,6 +386,16 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>>  			params[n].u.value.b = ip.b;
>>  			params[n].u.value.c = ip.c;
>>  			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +			params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
>> +			params[n].u.ubuf.size = ip.b;
>> +
>> +			if (!access_ok(params[n].u.ubuf.uaddr, params[n].u.ubuf.size))
> 
> This line is over 80 columns,
> https://docs.kernel.org/process/coding-style.html#breaking-long-lines-and-strings
> 
>> +				return -EFAULT;
>> +
>> +			break;
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -454,6 +464,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
>>  			    put_user(p->u.value.c, &up->c))
>>  				return -EFAULT;
>>  			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +			if (put_user((u64)p->u.ubuf.size, &up->b))
>> +				return -EFAULT;
>> +			break;
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>  			if (put_user((u64)p->u.memref.size, &up->b))
>> @@ -654,6 +669,13 @@ static int params_to_supp(struct tee_context *ctx,
>>  			ip.b = p->u.value.b;
>>  			ip.c = p->u.value.c;
>>  			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +			ip.a = (u64)p->u.ubuf.uaddr;
>> +			ip.b = p->u.ubuf.size;
>> +			ip.c = 0;
>> +			break;
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -756,6 +778,11 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
>>  			p->u.value.b = ip.b;
>>  			p->u.value.c = ip.c;
>>  			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +			p->u.ubuf.uaddr = u64_to_user_ptr(ip.a);
> 
> Is this needed? Compare with how TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_* is
> handled below. If it's indeed needed, please add an access_ok() check.
> 

Yes, it is needed. Unlike the MEMREF which is a fixed memory range, UBUF
can be any user memory range, for instance if it is comming from a readonly
secion, it is easier for user to update the address, size pair rather than copying
it.

Sorry I missed the access_ok here. I'll add. 

>> +			p->u.ubuf.size = ip.b;
>> +			break;
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>  		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>  			/*
>> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>> index d5f0c70ac95c..130782d4d5f6 100644
>> --- a/include/linux/tee_drv.h
>> +++ b/include/linux/tee_drv.h
>> @@ -82,6 +82,11 @@ struct tee_param_memref {
>>  	struct tee_shm *shm;
>>  };
>>  
>> +struct tee_param_ubuf {
>> +	void * __user uaddr;
>> +	size_t size;
>> +};
>> +
>>  struct tee_param_value {
>>  	u64 a;
>>  	u64 b;
>> @@ -92,6 +97,7 @@ struct tee_param {
>>  	u64 attr;
>>  	union {
>>  		struct tee_param_memref memref;
>> +		struct tee_param_ubuf ubuf;
>>  		struct tee_param_value value;
>>  	} u;
>>  };
>> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
>> index d0430bee8292..4a1dcfb4290e 100644
>> --- a/include/uapi/linux/tee.h
>> +++ b/include/uapi/linux/tee.h
>> @@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
>>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT	6
>>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT	7	/* input and output */
>>  
>> +/*
>> + * These defines userspace buffer parameters.
>> + */
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT	8
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT	9
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT	10	/* input and output */
>> +
>>  /*
>>   * Mask for the type part of the attribute, leaves room for more types
>>   */
>> @@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
>>  /**
>>   * struct tee_ioctl_param - parameter
>>   * @attr: attributes
>> - * @a: if a memref, offset into the shared memory object, else a value parameter
>> - * @b: if a memref, size of the buffer, else a value parameter
>> + * @a: if a memref, offset into the shared memory object,
>> + *     else if a ubuf, address into the user buffer,
> 
> address _of_ the user buffer?
> 
> Thanks,
> Jens

Ack.

Thanks,
Amir

> 
>> + *     else a value parameter
>> + * @b: if a memref or ubuf, size of the buffer, else a value parameter
>>   * @c: if a memref, shared memory identifier, else a value parameter
>>   *
>> - * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is used in
>> - * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
>> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE_NONE
>> - * indicates that none of the members are used.
>> + * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
>> + * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
>> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
>> + * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
>> + * are used.
>>   *
>>   * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
>>   * identifier representing the shared memory object. A memref can reference
>>
>> -- 
>> 2.34.1
>>


