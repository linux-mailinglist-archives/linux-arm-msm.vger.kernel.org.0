Return-Path: <linux-arm-msm+bounces-41171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7C99EA251
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 00:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABF25282264
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 23:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1642D19F421;
	Mon,  9 Dec 2024 23:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m/Nsf/qf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E3019F13B;
	Mon,  9 Dec 2024 23:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733785258; cv=none; b=UXGluuFru6DkaUQCMtXlSU9RizlkqclAZYvQGtK826JfqZUYH99mY+2JGE+CaFQnf2hiNmXcqiPhZ42QfC1RyX8xD+Yi7rCr2X0H9SkVHLikpVjCuAlCyxQjMl8TYK8bUxDLp+4oUWlGgjvId6Pl5zXLy7agurA6JZDD7O7kxI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733785258; c=relaxed/simple;
	bh=cWBSulf0fQno5+t6thUiJdaghxDbSCl+9ViNwrb0+wY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l1FEbqTyEV+Try6mFoBaqptTgNCleizkZECPK9iauug2HFpaCJvzbKOULAde4ityRFG2SevagFiOiGt1vPd7ts6Xe2WrSw8ZDOV7AsOtMGF7DA0PlpeGdljgb57kga9i1aqKXZrhQUGdoRkssdjj78FuUuCrLdEXvHn1aCfPbJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m/Nsf/qf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9GnRlw023398;
	Mon, 9 Dec 2024 23:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NAuKrMbDopwaoZZJtuSjTggUNBIyj4rtYk3o27a46J0=; b=m/Nsf/qf7wlXJ2Dh
	RABuW1l3qsKfOgA+4p5/nO7tqzU9a0T5lVZ0luBzSGpZdE515oCibA7fFyQcJkgt
	sFw67o5LByXsJOsxJWjYiiV5rVVBj/J/GQPjsdaEO81Kj6JDI3N/1my/ryEI/RGx
	3nuunmsVZWNItJenzKwP+UanvhprDdtflTEKQgygRF78iHiLhUyaeOZrZQcRPNZS
	kpMcXZ3VoeDxzPN6D2ZkbChyzA/6Ud3xeE7aBW8OVcfibQ4CAE129X2U9v9dKSRv
	CBvOOI5TwirH+Gar5eTFWos7Z9fP8xKhnzqh+msC/8wEwJy935xttid04ETUa5T5
	ry1E1A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ceetpj5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 23:00:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9N0maq026552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 23:00:48 GMT
Received: from [10.4.85.9] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 15:00:45 -0800
Message-ID: <72e113e7-c1be-48c0-9018-2580f654667a@quicinc.com>
Date: Tue, 10 Dec 2024 10:00:42 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF
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
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
 <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-2-f502ef01e016@quicinc.com>
 <CAHUa44GxY=nZP9O6XpO-nRKJ_wUnK66h-QEnFPJ9myFGydBZYw@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
In-Reply-To: <CAHUa44GxY=nZP9O6XpO-nRKJ_wUnK66h-QEnFPJ9myFGydBZYw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HsVkGMPasLElsgq_B9TdnnWbRhpkzkEk
X-Proofpoint-ORIG-GUID: HsVkGMPasLElsgq_B9TdnnWbRhpkzkEk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090178

Hi Jens.

On 12/10/2024 2:46 AM, Jens Wiklander wrote:
> Hi Amirreza,
> 
> On Tue, Dec 3, 2024 at 5:20 AM Amirreza Zarrabi
> <quic_azarrabi@quicinc.com> wrote:
>>
>> For drivers that can transfer data to the TEE without needing shared
>> memory from client, it is necessary to receive the user address
>> directly, bypassing any processing by the TEE subsystem. Introduce
>> TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INPUT/OUTPUT/INOUT to represent
>> userspace buffers.
> 
> Internally you allocate a bounce buffer from the pool of shared memory
> and copy the content of the user space buffer into that.
> Wouldn't it be fair to replace "without needing shared memory" with
> "without using shared memory"?
> 

You are right. I'll update it.

>>
>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
>> ---
>>  drivers/tee/tee_core.c   | 26 ++++++++++++++++++++++++++
>>  include/linux/tee_drv.h  |  6 ++++++
>>  include/uapi/linux/tee.h | 22 ++++++++++++++++------
>>  3 files changed, 48 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>> index 24edce4cdbaa..942ff5b359b2 100644
>> --- a/drivers/tee/tee_core.c
>> +++ b/drivers/tee/tee_core.c
>> @@ -381,6 +381,16 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>>                         params[n].u.value.b = ip.b;
>>                         params[n].u.value.c = ip.c;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INOUT:
>> +                       params[n].u.membuf.uaddr = u64_to_user_ptr(ip.a);
>> +                       params[n].u.membuf.size = ip.b;
>> +
>> +                       if (!access_ok(params[n].u.membuf.uaddr, params[n].u.membuf.size))
>> +                               return -EFAULT;
>> +
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -449,6 +459,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
>>                             put_user(p->u.value.c, &up->c))
>>                                 return -EFAULT;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INOUT:
>> +                       if (put_user((u64)p->u.membuf.size, &up->b))
>> +                               return -EFAULT;
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>                         if (put_user((u64)p->u.memref.size, &up->b))
>> @@ -649,6 +664,12 @@ static int params_to_supp(struct tee_context *ctx,
>>                         ip.b = p->u.value.b;
>>                         ip.c = p->u.value.c;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INOUT:
>> +                       ip.a = (u64)p->u.membuf.uaddr;
>> +                       ip.b = p->u.membuf.size;
>> +                       ip.c = 0;
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -751,6 +772,11 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
>>                         p->u.value.b = ip.b;
>>                         p->u.value.c = ip.c;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INOUT:
>> +                       p->u.membuf.uaddr = u64_to_user_ptr(ip.a);
>> +                       p->u.membuf.size = ip.b;
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>                         /*
>> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>> index a54c203000ed..b66e611fece4 100644
>> --- a/include/linux/tee_drv.h
>> +++ b/include/linux/tee_drv.h
>> @@ -82,6 +82,11 @@ struct tee_param_memref {
>>         struct tee_shm *shm;
>>  };
>>
>> +struct tee_param_membuf {
> 
> I would prefer tee_param_ubuf to better describe what it is.
> 

Ack.

>> +       void * __user uaddr;
>> +       size_t size;
>> +};
>> +
>>  struct tee_param_value {
>>         u64 a;
>>         u64 b;
>> @@ -92,6 +97,7 @@ struct tee_param {
>>         u64 attr;
>>         union {
>>                 struct tee_param_memref memref;
>> +               struct tee_param_membuf membuf;
>>                 struct tee_param_value value;
>>         } u;
>>  };
>> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
>> index d0430bee8292..fae68386968a 100644
>> --- a/include/uapi/linux/tee.h
>> +++ b/include/uapi/linux/tee.h
>> @@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
>>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT        6
>>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT 7       /* input and output */
>>
>> +/*
>> + * These defines memory buffer parameters.
> 
> user space buffer
> 
>> + */
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INPUT 8
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_OUTPUT        9
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INOUT 10      /* input and output */
> 
> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_*
> 

Ack.

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
>> + *     else if a membuf, address into the user buffer,
>> + *     else a value parameter
>> + * @b: if a memref or membuf, size of the buffer, else a value parameter
>>   * @c: if a memref, shared memory identifier, else a value parameter
>>   *
>> - * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is used in
>> - * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
>> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE_NONE
>> - * indicates that none of the members are used.
>> + * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, membuf, or value is
>> + * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
>> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_MEMBUF_*
>> + * indicates membuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
>> + * are used.
>>   *
>>   * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
>>   * identifier representing the shared memory object. A memref can reference
> 
> Please update the comment above with UBUF and ubuf as needed.
> 

Ack.

> Cheers,
> Jens
> 

Best Regadrs,
Amir

>>
>> --
>> 2.34.1
>>

