Return-Path: <linux-arm-msm+bounces-53614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD922A81E20
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 09:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 668664A31A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 07:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0464A25A2A1;
	Wed,  9 Apr 2025 07:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KaBGxeqq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3909D259CB6
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 07:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744183221; cv=none; b=vCu0byauyrWJcEF8gvD5K2v+PCMbpMWH9LlIHKo9f3D2cEx1BwLWj5eEWRMUghhk9e/fCFUkkQBZoPvHjXeb5P44pTzvO0fgmB6lJn0IIPc63EZw6qAQNi4Mjvc7x6IfHU0zTXShUYpsWaRxFYA1ySvyz7dBMEVX6pcP2paCI+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744183221; c=relaxed/simple;
	bh=ZqoYRiPPhpkG4DWzQzpdvmtV6ZetBIyExICzCJaTWsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJyDn2qc3CJ7x4p5RJzL/SFtsn6oxpAYUr3y6Qs4sgxhBJvqoXr+yA3+8lTTS75PNfkfx1pjHJRg244mXI/fa+VEAJKTD2NVsiirRGZOlfl3KusK51DkgI3RapbIO6Ahh7RKAqLe8USHvZMuo7Uh1qr0B9A0YKFZry5reZQW6Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KaBGxeqq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JZmeq024945
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Apr 2025 07:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XnHG1OYCfPPudOSu2HwBIGccZD+wMyHsRnvCxO1mKAo=; b=KaBGxeqq9+rMBoHF
	43Hsiy1cCegeyUwq+P5gohCLRYJpbwBanNYCkw36u4Jj+StAcC5oWhD7fWcTm19p
	3RTs75dwRiMWcWPjbjEgF2fWqSdSudOjcxGCvpTg7CycCa6maICeDiLYajm0Yn7t
	5ADUkgeCnRscvQpYk9U01tySnMJ5gVMP7+eI4bDuCtRkUHroEzHYaWcLSqwAq+yu
	NRqDg3ps0xhyize/s463nrMelqAcilB4JltfgUW5kC3gckkx5Bx1o4Xr0WYagH/0
	k5cWh27sF9gRK3YWenGA7OWf8mw7AoGRqMtMuR7EF25B72qJhj1N8C9S9A8HygFD
	mEa+EQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkjau3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 07:20:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-225505d1ca5so55499385ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 00:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744183217; x=1744788017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XnHG1OYCfPPudOSu2HwBIGccZD+wMyHsRnvCxO1mKAo=;
        b=sjj6k2+egqv8/6kWwZv58teOt6ZNCG9k+QHZYXYa4ISc5nAEt/ckKrVVA+gEzyGbcQ
         1IrOL5/hrG7/RwyeNv1vWvHgKUlu6j5QQCUpYqlal+V/Vbj6kNRTcswHZnRpXhmh0YUu
         TcwX5Y6ocv4CNJRPkrishiFMOu6i3qt4BStweLLok45gUlPRuweo8wICg/lEvPNryhit
         YTtXThlgzXOvIxLuwpaqaCz79d/RwHl4yGQearaM91VgBV16+H+FDW8/OXNvoGh+7kU+
         MQhyuuN/xFVTEswUobSfO9Qwo2cULQ+7Zt0mUafzydSVJ/IAVoVCm+b7facCS7KUBtxD
         Psvw==
X-Forwarded-Encrypted: i=1; AJvYcCWDI+56l9KF6vI6nrCXhuPZ7NyH7cXjdFKfoPm88Z8mH/0eyaWcV/I+kxY6h5hBQm08pyfZPqZm3LsXAH5k@vger.kernel.org
X-Gm-Message-State: AOJu0YwMl08KuN0q/rwAoiGZ2tU1ZXIT7FYbldjJdzLpGewhVVkSIHz3
	WFgCaezQez0XBlZcc9bg2wk4TrS6oVLnD1T6lcMP5s1TXpDAjUoT94evXgJe6qMbvlqYX8Rqi/e
	DNhmgR1yO3ON+88X8n+p1FkGuYWMekbTcUZEbMisoUPGPPEtcuAU/1ojyl7Fd+4E=
X-Gm-Gg: ASbGncsznuUcrkKmYkrV8bEb4mrOmKMkCFngTqVKTzSfbAR9933+o8J7WuYoTphA3iN
	1w369EUB3BV9rOb6KaKD5qJ6UywyvdU0K/53WL1WubR/KfHtKldpL5gBKtH9chSk7vPAJ8ddGk0
	elGc9trO4XwyaYA0e+jL5u3tHOq9GQYGETo/wIJu6o/6AvMoO9l0JxhKaTnU/z1V0wyn4FgfkLv
	0F6mdvv0W3UheuR7TxMWh8ROrrFVCjI92bq/bQYLjDTGLQ4SUWxlYbytt5xGsSYSxMytNA/JWim
	x3eaI65mJ+z4wHFxokMSbhXU7dgR+x5cca1dSS9eQ8n46GWTZvS9kWp2M7R0DczY683KDa5i57B
	D1fOnUCuwrQ==
X-Received: by 2002:a17:902:d4d1:b0:220:eade:d77e with SMTP id d9443c01a7336-22ac2a2dc06mr29218835ad.40.1744183217186;
        Wed, 09 Apr 2025 00:20:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH48eQqBlHLG2LOQMd75giBu4S3n/GO+s+65l9Tu7JVN+Rxfeq5xP7Ob5HmoQCV0KWtQk+8zg==
X-Received: by 2002:a17:902:d4d1:b0:220:eade:d77e with SMTP id d9443c01a7336-22ac2a2dc06mr29218535ad.40.1744183216712;
        Wed, 09 Apr 2025 00:20:16 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b654a2sm5007835ad.49.2025.04.09.00.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 00:20:16 -0700 (PDT)
Message-ID: <db3e8182-99ae-4a63-96ca-5d7ebeeb170f@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 17:20:08 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
 <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-3-7f457073282d@oss.qualcomm.com>
 <CAHUa44GRBiRr6CsFWxJhyzf1cRSEP66m5K7uFntOv3oYWTHWgQ@mail.gmail.com>
 <5de2a378-77cf-4373-b3ae-faeebb931e2d@oss.qualcomm.com>
 <CAHUa44F-t29Hu0o3+0vFLjtrnA8ZGycPFcUTXEOmms9B=cZ6XA@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAHUa44F-t29Hu0o3+0vFLjtrnA8ZGycPFcUTXEOmms9B=cZ6XA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TsY-Lomm0SjIv2_Fu2XFQn-gRR3EsboX
X-Proofpoint-ORIG-GUID: TsY-Lomm0SjIv2_Fu2XFQn-gRR3EsboX
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f61fb2 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=AUF5Mc4sii5JqdCOvnQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090031



On 4/9/2025 4:41 PM, Jens Wiklander wrote:
> Hi Amirreza,
> 
> On Wed, Apr 9, 2025 at 2:28 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> Hi jens,
>>
>> On 4/8/2025 10:19 PM, Jens Wiklander wrote:
>>
>> Hi Amirreza,
>>
>> On Fri, Mar 28, 2025 at 3:48 AM Amirreza Zarrabi
>> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> For drivers that can transfer data to the TEE without using shared
>> memory from client, it is necessary to receive the user address
>> directly, bypassing any processing by the TEE subsystem. Introduce
>> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
>> userspace buffers.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
>>  include/linux/tee_drv.h  |  6 ++++++
>>  include/uapi/linux/tee.h | 22 ++++++++++++++++------
>>  3 files changed, 55 insertions(+), 6 deletions(-)
>>
>> Is this patch needed now that the QCOMTEE driver supports shared
>> memory? I prefer keeping changes to the ABI to a minimum.
>>
>> Cheers,
>> Jens
>>
>> Unfortunately, this is still required. QTEE supports two types of data transfer:
>> (1) using UBUF and (2) memory objects. Even with memory object support, some APIs still
>> expect to receive data using UBUF. For instance, to load a TA, QTEE offers two interfaces:
>> one where the TA binary is in UBUF and another where the TA binary is in a memory object.
> 
> Is this a limitation in the QTEE backend driver or on the secure side?
> Can it be fixed? I don't ask for changes in the ABI to the secure
> world since I assume you haven't made such changes while this patch
> set has evolved.
> 
> Cheers,
> Jens

The secure-side ABI supports passing data using memcpy to the same
buffer that contains the message for QTEE, rather than using a memory
object. Some services tend to use this approach for small data instead
of allocating a memory object. I have no choice but to expose this support.

Throughout the patchset, I have not made any change to the ABI but
tried to provide support for the memory object in a separate,
independent commit, distinct from the UBUF.

Best regards,
Amir

> 
>>
>> Best Regards,
>> Amir
>>
>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>> index 22cc7d624b0c..bc862a11d437 100644
>> --- a/drivers/tee/tee_core.c
>> +++ b/drivers/tee/tee_core.c
>> @@ -404,6 +404,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>>                         params[n].u.value.b = ip.b;
>>                         params[n].u.value.c = ip.c;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +                       params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
>> +                       params[n].u.ubuf.size = ip.b;
>> +
>> +                       if (!access_ok(params[n].u.ubuf.uaddr,
>> +                                      params[n].u.ubuf.size))
>> +                               return -EFAULT;
>> +
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -472,6 +483,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
>>                             put_user(p->u.value.c, &up->c))
>>                                 return -EFAULT;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +                       if (put_user((u64)p->u.ubuf.size, &up->b))
>> +                               return -EFAULT;
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>                         if (put_user((u64)p->u.memref.size, &up->b))
>> @@ -672,6 +688,13 @@ static int params_to_supp(struct tee_context *ctx,
>>                         ip.b = p->u.value.b;
>>                         ip.c = p->u.value.c;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +                       ip.a = (u64)p->u.ubuf.uaddr;
>> +                       ip.b = p->u.ubuf.size;
>> +                       ip.c = 0;
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>> @@ -774,6 +797,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
>>                         p->u.value.b = ip.b;
>>                         p->u.value.c = ip.c;
>>                         break;
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>> +                       p->u.ubuf.uaddr = u64_to_user_ptr(ip.a);
>> +                       p->u.ubuf.size = ip.b;
>> +
>> +                       if (!access_ok(params[n].u.ubuf.uaddr,
>> +                                      params[n].u.ubuf.size))
>> +                               return -EFAULT;
>> +
>> +                       break;
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>                         /*
>> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>> index ce23fd42c5d4..d773f91c6bdd 100644
>> --- a/include/linux/tee_drv.h
>> +++ b/include/linux/tee_drv.h
>> @@ -82,6 +82,11 @@ struct tee_param_memref {
>>         struct tee_shm *shm;
>>  };
>>
>> +struct tee_param_ubuf {
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
>> +               struct tee_param_ubuf ubuf;
>>                 struct tee_param_value value;
>>         } u;
>>  };
>> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
>> index d0430bee8292..3e9b1ec5dfde 100644
>> --- a/include/uapi/linux/tee.h
>> +++ b/include/uapi/linux/tee.h
>> @@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
>>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT        6
>>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT 7       /* input and output */
>>
>> +/*
>> + * These defines userspace buffer parameters.
>> + */
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT   8
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT  9
>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT   10      /* input and output */
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
>> + *     else if a ubuf, address of the user buffer,
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


