Return-Path: <linux-arm-msm+bounces-61022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A07CAD63FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 01:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DF30189BD33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 23:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C674D2C326E;
	Wed, 11 Jun 2025 23:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uk92e2Re"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D9623A99D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 23:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749685524; cv=none; b=BttyDaKrU3eXRxMfpRz2aXl2IiFaa1qgOph9zaQgPOgTNJ+k4pBBLuci5pftO3b2ToXK8HhPq4WXQwfef1eRw/QFPbVln1ZatTcI5dCHrCmTYvo7+3pV7Ohyws0dMTirw1U6QC+ZB3hBWzCWea7W7bapIDRXOEQZ8U090N7DNZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749685524; c=relaxed/simple;
	bh=rxGnv5efpZB5FQxPCbcbR/DM98Rx425ii/1JrRUCjVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jl8NzGglxuMp9jvWcSzrS8b337FMAJjNqQx1bl2l0QyWpNCG6KdYaljNYrjEOEBZsGfxCZ0L5AnqDVlBERHFgfDb1lORTTKAa+vnbheVZog7TSiGH/4lJ55EcFw+O6ZpFIRV/fB1XnwtUs0QCdTqn6zdSFrWhPTVxkNu4USnos8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uk92e2Re; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BJ3vFK027348
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 23:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kL/Liu/GqjPKUC4NnGw8PIVD+TNpkbMa+VGstZWsdgM=; b=Uk92e2ReIMb6itzQ
	XyMYOmDFaHlbqT8QN2wh6CaJU1Ifca/48IbFjhYf0+tLT2k/ooeR962mAS9uSgn6
	DBV5FAp6c3B42an+/WXAF9p+uIsKm1+2v4BNG7WjwiMjdyvCyrVp9uyysSO6g/xf
	HczRBQrYHaWmK9pVwNKXeKHOKCF9hCS6vi+dtdQl+FLmpy5vNSgx9HWNsklA1AJP
	XxdFs/vJVAzCr701hqw4eR3RE0cIBgJnA24yZhpF+f4cUgjGKHvQ8nGElozBvV6O
	BLZ+YX0+TxXymijBPxCu7AITs8GciqOOUAq/+qdgxb2jKmiEgMkK/IY2U9wf8+5Y
	XB2lBA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrhdmsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 23:45:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3138e671316so242555a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 16:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749685520; x=1750290320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kL/Liu/GqjPKUC4NnGw8PIVD+TNpkbMa+VGstZWsdgM=;
        b=c6ctIuAcKULk8u9O3Y/ZgqBjM9mknaazQu/X1gwvMEqqeTw8r5SIAisownz/dyeA2y
         /xVzUHAFXR+cOWYZg8FEIHYF+yFkPufK4TCssS+VGFJQpTL/lUQYf8uzjePte3ACRErX
         Gt1h4UhwP9LxjqJa58LSJdX2Cb9oHr4ctUa1rfnxB3yk1krUOV0md62FMh407XJebYT3
         L+cnmGnWhzv+0lTjbnqrg1d4VLBtMrwHOXneEEIBYVpPnyWDke91GQiBwMMiw6f4s6+m
         zJQKYiHEABc0TTlqCW0KW3EAfOLrOsiBowEy2xZWhCMFebEUi4ELiqnbTgixMUiZnVL0
         HiLg==
X-Forwarded-Encrypted: i=1; AJvYcCUjzUiwprMkrQSKGLOynP0Lc4S8xbJR2pNptKHshMykSVdAGbRtK1gEc+U17VpJXyIDEaz9ixT6cynWmVUQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwBlyPTCeq3+Tq7yY4aaaKwcdFfYAGHw31Kj6sqUgMHuA+bLji3
	Qw6NkDDIvlj9iBjq42FDX1XoJULt08fvHZTFJXdcQsrAhiIOV34bPJr20G/7cNq3Y7PkDDN4PzD
	LIG2BzX0amikQIB5p/4bJwNzeBsnSPXAtJ/ZIOqREaAOEK6Cu3sujDT6JZrfIkfwt7ig=
X-Gm-Gg: ASbGncsr0XWZyO+ZuifhEktqPUiMyGaIH6Nc9kJCnCeBug8hxPyjpjF+yVqwfrYKjGS
	uBHuaEpLXSwC4c8ktJ7+5SbCSz7AypRNMOhZ19mO3KruHweGdh5VbVuB65Pz6Wav1b6XDi4eBxc
	aW7UC0tc7GDjZuxCtYMQCQI+dJZJrgAgBy8Dq8Zzqbimr8bKdtn1Do/KZeeyOxkdqNfhWws5yAA
	KvX/S0sR6EBk3v643z05hRWpzx3E7t3LZ4toGIOLv+x+dZknZUpg5J0vUwUipXzAukVUbZO5vxV
	gyGGDW/07duXciyROTGi6uKUBwiFy25oH3zN0F5ejq0LoC627SIWYuuqWKYAPSkxDhQovvE1tGP
	qGPGOLRAYSS+n4pvNASey
X-Received: by 2002:a17:90b:1d49:b0:311:a5ab:3d47 with SMTP id 98e67ed59e1d1-313bfd7ab92mr1604718a91.1.1749685520259;
        Wed, 11 Jun 2025 16:45:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAMR6wEIIwnne3OpDAIO64Df49wCTs/N/zWmX8iRNFkPwGVeKGubpgXpgrWv1YmWUP5MvRNQ==
X-Received: by 2002:a17:90b:1d49:b0:311:a5ab:3d47 with SMTP id 98e67ed59e1d1-313bfd7ab92mr1604694a91.1.1749685519759;
        Wed, 11 Jun 2025 16:45:19 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b499cbsm200694a91.26.2025.06.11.16.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 16:45:19 -0700 (PDT)
Message-ID: <8f9a7ca7-5098-40c6-94b2-490a857d7dae@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 09:45:10 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/12] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
To: Andrew Davis <afd@ti.com>, Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
 <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-3-024e3221b0b9@oss.qualcomm.com>
 <f686130b-009f-4feb-bae1-022938c85923@ti.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <f686130b-009f-4feb-bae1-022938c85923@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=684a1511 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=ri7p8OPjmTxfXj7m-Z0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: u6xjSMOzOG2y3_c4kAO7GN_J1ve-mLzW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDIwMCBTYWx0ZWRfX9GsDNoAQR7CL
 H9fh2nDMzXD5b6MT5rnQF09hUUZ5q2PD7m/FvHkP64FQ/1D5OpAJnZStLua+/QZ2c1f9P2zeyCE
 2PSDlLbNVzWglMe4h7LaXnLfrj4mYTRLXzw0KU7JZtbT4WP7EI4kwHQXnaIoxVEKi0IvfB+WdX2
 aLLskHtVbXhqWp/cqLPivZ1eKUY/frGOVrPeCiqXQ8W2zlZRJ4cKaluxt2vep4pUt5pKybD8Avx
 XWFLQSVZ8MLlZsM7b5SjLf//J4Q7v8YdWv5GkY0qdobJXCBrPRGGGbhhdELpPzCmBpPeiiWuo7R
 2pjkJ5pRkFor87/9INxL38v5QaOATma5RTxvwVAyavi1J1IN0Nnj6x9p5X1uUGDv0wVcfjJZlb0
 AwNFIvQXCQAtvBJuiW4F3X8dUlhL0rE0wcvFpsW6J6ajsncLHaYlzBST3wZ20NwA7Kaxm+P1
X-Proofpoint-GUID: u6xjSMOzOG2y3_c4kAO7GN_J1ve-mLzW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110200

Hi Andrew,

On 6/12/2025 8:40 AM, Andrew Davis wrote:
> On 5/27/25 1:56 AM, Amirreza Zarrabi wrote:
>> For drivers that can transfer data to the TEE without using shared
>> memory from client, it is necessary to receive the user address
>> directly, bypassing any processing by the TEE subsystem. Introduce
>> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
>> userspace buffers.
>>
> 
> Could you expand on this, what is the issue with normal MEMREF?
> 

QTEE supports two types of data passing: (1) memory objects and (2) buffers.
A memory object can be a normal shared memory (shm) instance. However, a
buffer is an [offset, size] pair referring to the transport memory shared
with QTEE (established at the begining of the invocation).

There is no direct representation of VALUE in the QTEE ABI, so even basic
data types, such as int, must be passed as a buffer [offset, sizeof(int)].
VALUE cannot be used because it only represents a u64 data size. While MEMREF
is an option, it requires additional ioctl calls and memory copies.

For example, if you need to send three integers to QTEE, you would require:
  (1) Three ioctl calls to allocate three shared memory pages.
  (2) Three memcpy operations to copy each integer into its respective shared memory.
  (3) Three memcpy operations to transfer data from shared memory to the
      transport buffer shared with QTEE.

You can optimize this slightly by making a single ioctl call for shared
memory allocation. However, the backend still needs to inspect the shared
memory, parse it, and extract the data and size information.

With UBUF user pass user address and size, and ther is only one copy_from_use
in the backend.

Regards,
Amir  

> Andrew
> 
>> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>   drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
>>   include/linux/tee_drv.h  |  6 ++++++
>>   include/uapi/linux/tee.h | 22 ++++++++++++++++------
>>   3 files changed, 55 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>> index b9ea5a85278c..74e40ed83fa7 100644
>> --- a/drivers/tee/tee_core.c
>> +++ b/drivers/tee/tee_core.c
>> @@ -387,6 +387,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>>               params[n].u.value.b = ip.b;
>>               params[n].u.value.c = ip.c;
>>               break;
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +            params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
>> +            params[n].u.ubuf.size = ip.b;
>> +
>> +            if (!access_ok(params[n].u.ubuf.uaddr,
>> +                       params[n].u.ubuf.size))
>> +                return -EFAULT;
>> +
>> +            break;
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -455,6 +466,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
>>                   put_user(p->u.value.c, &up->c))
>>                   return -EFAULT;
>>               break;
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +            if (put_user((u64)p->u.ubuf.size, &up->b))
>> +                return -EFAULT;
>> +            break;
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>               if (put_user((u64)p->u.memref.size, &up->b))
>> @@ -655,6 +671,13 @@ static int params_to_supp(struct tee_context *ctx,
>>               ip.b = p->u.value.b;
>>               ip.c = p->u.value.c;
>>               break;
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +            ip.a = (u64)p->u.ubuf.uaddr;
>> +            ip.b = p->u.ubuf.size;
>> +            ip.c = 0;
>> +            break;
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -757,6 +780,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
>>               p->u.value.b = ip.b;
>>               p->u.value.c = ip.c;
>>               break;
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +        case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +            p->u.ubuf.uaddr = u64_to_user_ptr(ip.a);
>> +            p->u.ubuf.size = ip.b;
>> +
>> +            if (!access_ok(params[n].u.ubuf.uaddr,
>> +                       params[n].u.ubuf.size))
>> +                return -EFAULT;
>> +
>> +            break;
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>           case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>               /*
>> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>> index a54c203000ed..78bbf12f02f0 100644
>> --- a/include/linux/tee_drv.h
>> +++ b/include/linux/tee_drv.h
>> @@ -82,6 +82,11 @@ struct tee_param_memref {
>>       struct tee_shm *shm;
>>   };
>>   +struct tee_param_ubuf {
>> +    void * __user uaddr;
>> +    size_t size;
>> +};
>> +
>>   struct tee_param_value {
>>       u64 a;
>>       u64 b;
>> @@ -92,6 +97,7 @@ struct tee_param {
>>       u64 attr;
>>       union {
>>           struct tee_param_memref memref;
>> +        struct tee_param_ubuf ubuf;
>>           struct tee_param_value value;
>>       } u;
>>   };
>> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
>> index d0430bee8292..3e9b1ec5dfde 100644
>> --- a/include/uapi/linux/tee.h
>> +++ b/include/uapi/linux/tee.h
>> @@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
>>   #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT    6
>>   #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT    7    /* input and output */
>>   +/*
>> + * These defines userspace buffer parameters.
>> + */
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT    8
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT    9
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT    10    /* input and output */
>> +
>>   /*
>>    * Mask for the type part of the attribute, leaves room for more types
>>    */
>> @@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
>>   /**
>>    * struct tee_ioctl_param - parameter
>>    * @attr: attributes
>> - * @a: if a memref, offset into the shared memory object, else a value parameter
>> - * @b: if a memref, size of the buffer, else a value parameter
>> + * @a: if a memref, offset into the shared memory object,
>> + *     else if a ubuf, address of the user buffer,
>> + *     else a value parameter
>> + * @b: if a memref or ubuf, size of the buffer, else a value parameter
>>    * @c: if a memref, shared memory identifier, else a value parameter
>>    *
>> - * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is used in
>> - * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
>> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE_NONE
>> - * indicates that none of the members are used.
>> + * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
>> + * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
>> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
>> + * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
>> + * are used.
>>    *
>>    * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
>>    * identifier representing the shared memory object. A memref can reference
>>


