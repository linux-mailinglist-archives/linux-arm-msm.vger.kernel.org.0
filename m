Return-Path: <linux-arm-msm+bounces-55852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA5BA9E725
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 06:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 962F1188A97B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 04:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DDC13AD38;
	Mon, 28 Apr 2025 04:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ci8uMuXy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D36191F94
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 04:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745815069; cv=none; b=Hre/9S5qTyI9cYVNTK5hCpl82fcfHi+x0p8+fWx7R6xjcHqD4HPTcdjsFLEDb1pb1SuVdnbx5nU1n+iBJQSe9C3FlymHD9XbEKNw749zVdz5eDRax49PFUGbRRR1UsFKqMGzR0K8ruaIA+F7gQEl66Q0vYr4PTPamp7pqWojNIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745815069; c=relaxed/simple;
	bh=NhO2H0cKPYwxGv1qBFmaXlYHTDG2SluKTcvDhT31XcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8HoFpa8VWj3m/L/+Vqzglq4NaFixlWijLdJdb6i7oAsNQ60eV+c8+6yNyMMzkfsXlmkZORr1kOs86DCWkLl/2msKrNpYzHyC5UUv+SBZn5MhXbs2GTKZ4h82Y2dbXTXzUq8SEF92pi3oR+Z5h3dgjjbn9yNFo0p7wnwL+BG4r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ci8uMuXy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53RGNg8P007899
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 04:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tbOEKIUYrgKQBQSPnnyUCbHgYPfMPVYUlQhqefBUiK8=; b=ci8uMuXyCgyou2J2
	jxDbkJBrZqQ6k0Oc9CdA4h8otp4LAnUqChqSXkU3mfCM/AYlp5TjpJUnCaeiKd7P
	S9UCcIsPFP2YDFSUFwoohVbpJ/Yn3wLaAd0rbXiLxteJqig7Xdvo6huRzrQ8zr91
	wQaA0C8iZ89xRg5sMSQaytbxdxOq1Yd9Q6BbglVszW/Wc370SzdkiJksCzSBJQRh
	J0UuC4S1ZsPDMAfcdxoBg8palueH+DgpeaS0wZw5NgrIlLmDOvQUGYd2/9Xkk/9y
	46uICetjd0bbNz1ahz7CxvcK18XBS35EUrj8TfGgoPOY4N+iltmqtUWvHtYFezLT
	BvsI+A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnmwsba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 04:37:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-223fd6e9408so30319465ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Apr 2025 21:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745815066; x=1746419866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tbOEKIUYrgKQBQSPnnyUCbHgYPfMPVYUlQhqefBUiK8=;
        b=A8sTeJXceX545CxgxQ38BCphgEZK3WJOU1gDJK29PC87vJRBx+pnhqCXX8K6cD7UXr
         OGQ6gQC+whqQCTlk4FTd3Q/SGl0/wt9tIwBJcGy0nNm+cSJyFXVVzWfRPvJ62gYzFQYj
         EJVEIjhf6Va2SPZn02FXYjnO20FeLM929oGuumsxhqNPatY7vKpR2F90PV5Xy8rZJEvq
         1GZoaZkp7aDzmcrnoJXm+jQjvTs/7rTqFkfM5FYHSK2ziG+HWNCs48uPghczAAIVQMVY
         L8mc0jBapTrzlulQbC7jD0TgJRqgxuTrXvcJDfpd3xgGoCw1flIkqA4Hu4/i2mB1ODfm
         ZrGg==
X-Forwarded-Encrypted: i=1; AJvYcCXNtYe9oFssXK7KSHz65Ae/l5o71pUPKYX8gyIR7hBcNHHpXLsNXNcKmyqAiVOqkJPHIeDEGj5uAqPRKfru@vger.kernel.org
X-Gm-Message-State: AOJu0YzPmibdDNTsW+ur8N0r4sHSqvoQ5YVt9zTlZFIFeysd4zVoZgxg
	8+pSjbSaUW70bBut8/txK+EiHIrOZG/X+1pM5Lrp7m0ck5uhwTvYr1bVl5d7irx5fWxAfd6XP9m
	vhYS6ION6WTMNd3WzjZ02KXJ1Pn46WyUaCQ//k/PsHl1tOTQ3sT5ADmNO8uVMAHE=
X-Gm-Gg: ASbGnctKGBfqQ99tT8FyOIbkF7LgfyW4bFULqvx4qZaNtq2df+pOgnaNGIZ039phsgR
	9T5xzNvDDol+oTKUPF0SGyP9RYIVboAujlOAu3JSddglhxpd36zQwzmszLCVDE+Kk5j8DWqrFQD
	UqP0GlnMG9kTbYv/XfCu11WrqSlr5ZobNFcAZyMSoRbTFKYlh4lsfNE2EfwwStL8Zw56hoBYKI2
	S8c9TngH1dl1D0bNvqNnQiLqxlrhNlGG5GcZawX616s9kNnochDYLR41mjZh6JqJblKBRppYsBl
	lLiXkTMiRGM9+kuqOcjrWowN9+DPxuqVVI+GrqGq2OL9RvKGunHV7yMgheDw4XqD3hwH2zeB2YW
	XCFBd0i/YBg==
X-Received: by 2002:a17:902:ebd1:b0:224:3994:8a8c with SMTP id d9443c01a7336-22db47f40c9mr200585245ad.8.1745815065555;
        Sun, 27 Apr 2025 21:37:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/Ab5a1MLclt9sIvwOqJogk3wzXJajD95HZWDLi2rS6V6ZvOh4pjzpI1zsryM7YXx//DLdpA==
X-Received: by 2002:a17:902:ebd1:b0:224:3994:8a8c with SMTP id d9443c01a7336-22db47f40c9mr200584845ad.8.1745815065099;
        Sun, 27 Apr 2025 21:37:45 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221c8dsm72067675ad.259.2025.04.27.21.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 21:37:44 -0700 (PDT)
Message-ID: <82bdb9e3-dee1-4705-b6a7-2b163f8bdcfa@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 14:37:37 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
 <db3e8182-99ae-4a63-96ca-5d7ebeeb170f@oss.qualcomm.com>
 <aAZFhlLv9GzHqUZc@sumit-X1>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <aAZFhlLv9GzHqUZc@sumit-X1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: p13p-63RP-oQiRL-FxYEFO9uDvwRSI8j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDAzNyBTYWx0ZWRfX/eCeTmexvI3R XGLyzDS5IHEPnIMu/JYRpOEPFkYan/1lUGVxH9uUfAQAP/SsA4mijikP9xSD+NmYhYt59PBYpLF f9SPqvJPqPA41iWCS1buxGvWNdtAAh3kPwvziDySsg8r6sFSijfWSxC857YmJaobem2gM8w/ElM
 esupxI+07HiEkmHZOlq+PZgABWwkgj5NGlmOWp7Khv17l5dNydCNQXGMxDUttYonOIzYdgjZkc1 ccxHsNFEb6wafXR3EU+cxUyRFjKmrpc2oSfE4aC8gUwxkpEDTXIvdxWLDUgJF72TzvzL3610EEX UwzpzEWFUE7/Szdfq5VRVRux8mVIw742PF38zixxhTrv3Q3CBKDBljT/+xDemVJA8D9MRabcXNV
 a7+4lMVBmZOhLv90yzvqoRiMYzm4NzASj0fydmbmbcX3uTInVyeepOIR5tP0daGa5C6Cqowy
X-Proofpoint-GUID: p13p-63RP-oQiRL-FxYEFO9uDvwRSI8j
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=680f061a cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=4h-e5YJLMSmWdqdMP0UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280037

Hi Sumit,

On 4/21/2025 11:17 PM, Sumit Garg wrote:
> On Wed, Apr 09, 2025 at 05:20:08PM +1000, Amirreza Zarrabi wrote:
>>
>>
>> On 4/9/2025 4:41 PM, Jens Wiklander wrote:
>>> Hi Amirreza,
>>>
>>> On Wed, Apr 9, 2025 at 2:28 AM Amirreza Zarrabi
>>> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>>>
>>>> Hi jens,
>>>>
>>>> On 4/8/2025 10:19 PM, Jens Wiklander wrote:
>>>>
>>>> Hi Amirreza,
>>>>
>>>> On Fri, Mar 28, 2025 at 3:48 AM Amirreza Zarrabi
>>>> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>>>
>>>> For drivers that can transfer data to the TEE without using shared
>>>> memory from client, it is necessary to receive the user address
>>>> directly, bypassing any processing by the TEE subsystem. Introduce
>>>> TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
>>>> userspace buffers.
>>>>
>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>> ---
>>>>  drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
>>>>  include/linux/tee_drv.h  |  6 ++++++
>>>>  include/uapi/linux/tee.h | 22 ++++++++++++++++------
>>>>  3 files changed, 55 insertions(+), 6 deletions(-)
>>>>
>>>> Is this patch needed now that the QCOMTEE driver supports shared
>>>> memory? I prefer keeping changes to the ABI to a minimum.
>>>>
>>>> Cheers,
>>>> Jens
>>>>
>>>> Unfortunately, this is still required. QTEE supports two types of data transfer:
>>>> (1) using UBUF and (2) memory objects. Even with memory object support, some APIs still
>>>> expect to receive data using UBUF. For instance, to load a TA, QTEE offers two interfaces:
>>>> one where the TA binary is in UBUF and another where the TA binary is in a memory object.
>>>
>>> Is this a limitation in the QTEE backend driver or on the secure side?
>>> Can it be fixed? I don't ask for changes in the ABI to the secure
>>> world since I assume you haven't made such changes while this patch
>>> set has evolved.
>>>
>>> Cheers,
>>> Jens
>>
>> The secure-side ABI supports passing data using memcpy to the same
>> buffer that contains the message for QTEE, rather than using a memory
>> object. Some services tend to use this approach for small data instead
>> of allocating a memory object. I have no choice but to expose this support.
> 
> Okay, I can see how QTEE supports embedding user buffers in fixed size
> shared memory buffers allocated by the driver with maximum size limits.
> 
> OP-TEE also have support for temporary shared memory where the user
> space client directly passes the buffer to share with OP-TEE. Then the
> libteec [1] handles the underneath copy to and from the shared memory
> allocation automatically.
> 
> So is there a limitation for QCOMTEE user space library [2] to do the
> same? This way we will be able to retain the user-space ABI as well as
> simplicify the kernel driver.
> 
> [1] https://github.com/OP-TEE/optee_client/blob/master/libteec/src/tee_client_api.c#L365
> [2] https://github.com/quic/quic-teec
> 
> -Sumit
> 

Unfortunately, I do not have control over the TA's API. If a TA expects
to receive data in the embedded buffer, then I cannot use a memory
object. To maintain the ABI and avoid the UBUF, I need two copies:
(1) the user data passed to the library is copied to memory allocated
using TEE_ALLOC, (2) in the driver, the data is copied from the tee_shm to
the embedded buffer as expected by QTEE.

- Amir

>>
>> Throughout the patchset, I have not made any change to the ABI but
>> tried to provide support for the memory object in a separate,
>> independent commit, distinct from the UBUF.
>>
>> Best regards,
>> Amir
>>
>>>
>>>>
>>>> Best Regards,
>>>> Amir
>>>>
>>>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>>>> index 22cc7d624b0c..bc862a11d437 100644
>>>> --- a/drivers/tee/tee_core.c
>>>> +++ b/drivers/tee/tee_core.c
>>>> @@ -404,6 +404,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
>>>>                         params[n].u.value.b = ip.b;
>>>>                         params[n].u.value.c = ip.c;
>>>>                         break;
>>>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>>>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>>>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>>>> +                       params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
>>>> +                       params[n].u.ubuf.size = ip.b;
>>>> +
>>>> +                       if (!access_ok(params[n].u.ubuf.uaddr,
>>>> +                                      params[n].u.ubuf.size))
>>>> +                               return -EFAULT;
>>>> +
>>>> +                       break;
>>>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>>> @@ -472,6 +483,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
>>>>                             put_user(p->u.value.c, &up->c))
>>>>                                 return -EFAULT;
>>>>                         break;
>>>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>>>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>>>> +                       if (put_user((u64)p->u.ubuf.size, &up->b))
>>>> +                               return -EFAULT;
>>>> +                       break;
>>>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>>>                         if (put_user((u64)p->u.memref.size, &up->b))
>>>> @@ -672,6 +688,13 @@ static int params_to_supp(struct tee_context *ctx,
>>>>                         ip.b = p->u.value.b;
>>>>                         ip.c = p->u.value.c;
>>>>                         break;
>>>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>>>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>>>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>>>> +                       ip.a = (u64)p->u.ubuf.uaddr;
>>>> +                       ip.b = p->u.ubuf.size;
>>>> +                       ip.c = 0;
>>>> +                       break;
>>>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
>>>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>>> @@ -774,6 +797,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
>>>>                         p->u.value.b = ip.b;
>>>>                         p->u.value.c = ip.c;
>>>>                         break;
>>>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>>>> +               case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
>>>> +                       p->u.ubuf.uaddr = u64_to_user_ptr(ip.a);
>>>> +                       p->u.ubuf.size = ip.b;
>>>> +
>>>> +                       if (!access_ok(params[n].u.ubuf.uaddr,
>>>> +                                      params[n].u.ubuf.size))
>>>> +                               return -EFAULT;
>>>> +
>>>> +                       break;
>>>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
>>>>                 case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
>>>>                         /*
>>>> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>>>> index ce23fd42c5d4..d773f91c6bdd 100644
>>>> --- a/include/linux/tee_drv.h
>>>> +++ b/include/linux/tee_drv.h
>>>> @@ -82,6 +82,11 @@ struct tee_param_memref {
>>>>         struct tee_shm *shm;
>>>>  };
>>>>
>>>> +struct tee_param_ubuf {
>>>> +       void * __user uaddr;
>>>> +       size_t size;
>>>> +};
>>>> +
>>>>  struct tee_param_value {
>>>>         u64 a;
>>>>         u64 b;
>>>> @@ -92,6 +97,7 @@ struct tee_param {
>>>>         u64 attr;
>>>>         union {
>>>>                 struct tee_param_memref memref;
>>>> +               struct tee_param_ubuf ubuf;
>>>>                 struct tee_param_value value;
>>>>         } u;
>>>>  };
>>>> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
>>>> index d0430bee8292..3e9b1ec5dfde 100644
>>>> --- a/include/uapi/linux/tee.h
>>>> +++ b/include/uapi/linux/tee.h
>>>> @@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
>>>>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT        6
>>>>  #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT 7       /* input and output */
>>>>
>>>> +/*
>>>> + * These defines userspace buffer parameters.
>>>> + */
>>>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT   8
>>>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT  9
>>>> +#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT   10      /* input and output */
>>>> +
>>>>  /*
>>>>   * Mask for the type part of the attribute, leaves room for more types
>>>>   */
>>>> @@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
>>>>  /**
>>>>   * struct tee_ioctl_param - parameter
>>>>   * @attr: attributes
>>>> - * @a: if a memref, offset into the shared memory object, else a value parameter
>>>> - * @b: if a memref, size of the buffer, else a value parameter
>>>> + * @a: if a memref, offset into the shared memory object,
>>>> + *     else if a ubuf, address of the user buffer,
>>>> + *     else a value parameter
>>>> + * @b: if a memref or ubuf, size of the buffer, else a value parameter
>>>>   * @c: if a memref, shared memory identifier, else a value parameter
>>>>   *
>>>> - * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is used in
>>>> - * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
>>>> - * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE_NONE
>>>> - * indicates that none of the members are used.
>>>> + * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
>>>> + * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
>>>> + * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
>>>> + * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
>>>> + * are used.
>>>>   *
>>>>   * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
>>>>   * identifier representing the shared memory object. A memref can reference
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>
>>


