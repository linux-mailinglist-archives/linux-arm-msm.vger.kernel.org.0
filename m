Return-Path: <linux-arm-msm+bounces-53470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F02D2A7F77D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 10:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AB7F3B7C56
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 08:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4684A263F24;
	Tue,  8 Apr 2025 08:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XMcHmseS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A48263C76
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100052; cv=none; b=DsXneygAnzldWl6+fwDBucdA+X1s19sDqkvERpH/NJK0hHG0A1di2L6nrzXG4f02U8QzTewxS9J/kJHMovDedJYEXTyaqTZG8ByNo34S1JHXv/jdMVzk5ruDfY2bqsleZBoukCv+uQQ8uG/FgdfMQo9OcceHp04cb8DZEQukmus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100052; c=relaxed/simple;
	bh=oAS13G1ySo3BTj4AeO+QfsgP1JMQOqQN+NetSQkPYSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZcsSBstObLaxb6LCXM0u6+sohVltvfN2DCB6eWlPPjWOU9NCS3B9049d7rGCpK97SA87JcSGSqDoF1abBuwcMXv3RhnTsrCwoN++8fVxQIDUqh4UiHTLqS3/yqGvtiGaYgkmUtSTbesQAQBODdtN6hKeNjkmvTLcOAH22T8cmks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XMcHmseS; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39149bccb69so4835418f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 01:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744100047; x=1744704847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OSsQQMPTG91ipLO2Lx37iAbnWCmF1lAWx7weRpdCuxs=;
        b=XMcHmseSr+TYW30PhZMRXYd/PY1/D4lg9g6uBxMi7yOtTUPOXb17svSO0zFsSSKVJa
         Rl7yMiXIAxx+LkZYVDftUL79rYL1QLFTVEeJvLicqlpQPYe7fV2T48kttNlpEWJyOtYf
         ce6XWFklX1mu4R2lTmKe3FqG0Mb3nc1Y8+GoUAEAQUApnlh5Gbi59d6MHgumBscRmOYV
         uasVjlGNiQvyGXHJjb9jv5PKao09v7/W+nPCjU7YVpNa8FGTD/vvxovrW/XF0AzwYNVM
         tXD5KYImEdfX5NTSDg4BxKiqjslm2CNOzBoXjcjBTMVwqqXc50x+PWBk6A5Sy72atYdW
         b29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744100047; x=1744704847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OSsQQMPTG91ipLO2Lx37iAbnWCmF1lAWx7weRpdCuxs=;
        b=omApj1AsvbsC0KhYeM98AnB+nRfp6NbmORu9IbyhphdVuWCtusGFDTHNfSZOXOwOvR
         KmKLOuhq3t6vAwliSn+GtB+KyOZHjrJH+Gor7AMxJGclWoVgu+/SBK1uJSIOiXDTsAS1
         t2/RBbMqZoYb/bzA5Qfepy0svaAluRmtRYhZ70czUclCKeEDxCvlnzga02zn3ASmFHA0
         gClAGwMiBCHFOLs5pP/ZrrQz6meGUjYZm5XbZMC1qZnD77T6n14MHlDpNw1HvCz3HjTD
         Cl3YNSmYv8eVXA9pcyOb4FnPA9Djvwab/F62DuJAavOh0/QiJ7wNyYNT2Wu70p8GTKEv
         /W1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtb4G8DWCAQMW08SxaPVtq21XylnSu2mqa17gm4L8gPZsFtpStq8xX7KOkMPP0i64zYVPBNoR7B+RuGgS2@vger.kernel.org
X-Gm-Message-State: AOJu0YwviraOaTWbuHg1qCZ7YPp68EaVZPMpbESfaObNTjFh4V9NKs+v
	VNxveVX7dxY3nlR94kZfDQga8rTy26VA522IoanQglKLJK2eDrGFHqdbadMXOpo=
X-Gm-Gg: ASbGnctUVviQP444Ca/mc4fDO3tqfuB6dV+fwPVDDQfHkVtX7pjpJi56NMB5O+FAQ44
	a29s7xzyGaLk7q6Lii/s5IDFBDIgzuFJUPVdSZl0B2hVoo9daicQg3qiw8F6CZ1TCRyWGjNyM3C
	MCXUcUvaUXI31ufLH7y9WzYJwFuohRNafSqLlkr97fPmg0y9Tb6KVVevlK0/o67+cEJoJJBH6ao
	x9ixUqxFLJCSXD0N2o/n8XDTf6ACHY0Ae39ZVdM91kiueKE8SAS3PYUrLA5wNw8ViR1NAwYXby3
	4HyJfbQtz2ZE7d2pWzPurm6+Za5fcISvckSHiXvr/nq0F84GQfAdq9LxP1ZmYk8=
X-Google-Smtp-Source: AGHT+IHMcM/JRxPbct9OPzdKglXYqGvT+2iz/IgWsDMqHapPmd+z3PyGamR9WaSnQe0LD/KLTcKXeQ==
X-Received: by 2002:a05:6000:2281:b0:39c:cc7:3c97 with SMTP id ffacd0b85a97d-39d6fd3646cmr7346835f8f.50.1744100047362;
        Tue, 08 Apr 2025 01:14:07 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec342a3dfsm155505145e9.4.2025.04.08.01.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 01:14:06 -0700 (PDT)
Message-ID: <07bfc5f3-1bcb-4018-bd63-8317ec6dac48@linaro.org>
Date: Tue, 8 Apr 2025 09:14:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
To: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, quic_ekangupt@quicinc.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
 <e2a8528b-fa18-471f-9cb8-da64bb488f2a@quicinc.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <e2a8528b-fa18-471f-9cb8-da64bb488f2a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 07/04/2025 10:13, Ling Xu wrote:
> 在 3/21/2025 1:11 AM, Srinivas Kandagatla 写道:
>>
>>
>> On 20/03/2025 09:14, Ling Xu wrote:
>>> The fastrpc driver has support for 5 types of remoteprocs. There are
>>> some products which support GPDSP remoteprocs. Add changes to support
>>> GPDSP remoteprocs.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>>> ---
>>>    drivers/misc/fastrpc.c | 10 ++++++++--
>>>    1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>> index 7b7a22c91fe4..80aa554b3042 100644
>>> --- a/drivers/misc/fastrpc.c
>>> +++ b/drivers/misc/fastrpc.c
>>> @@ -28,7 +28,9 @@
>>>    #define SDSP_DOMAIN_ID (2)
>>>    #define CDSP_DOMAIN_ID (3)
>>>    #define CDSP1_DOMAIN_ID (4)
>>> -#define FASTRPC_DEV_MAX        5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>>> +#define GDSP0_DOMAIN_ID (5)
>>> +#define GDSP1_DOMAIN_ID (6)
>>
>> We have already made the driver look silly here, Lets not add domain ids for each instance, which is not a scalable.
>>
>> Domain ids are strictly for a domain not each instance.
>>
>>
>>> +#define FASTRPC_DEV_MAX        7 /* adsp, mdsp, slpi, cdsp, cdsp1, gdsp0, gdsp1 */
>>>    #define FASTRPC_MAX_SESSIONS    14
>>>    #define FASTRPC_MAX_VMIDS    16
>>>    #define FASTRPC_ALIGN        128
>>> @@ -107,7 +109,9 @@
>>>    #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>>      static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>>> -                        "sdsp", "cdsp", "cdsp1" };
>>> +                        "sdsp", "cdsp",
>>> +                        "cdsp1", "gdsp0",
>>> +                        "gdsp1" };
>>>    struct fastrpc_phy_page {
>>>        u64 addr;        /* physical address */
>>>        u64 size;        /* size of contiguous region */
>>> @@ -2338,6 +2342,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>>            break;
>>>        case CDSP_DOMAIN_ID:
>>>        case CDSP1_DOMAIN_ID:
>>> +    case GDSP0_DOMAIN_ID:
>>> +    case GDSP1_DOMAIN_ID:
>>>            data->unsigned_support = true;
>>>            /* Create both device nodes so that we can allow both Signed and Unsigned PD */
>>>            err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
>>
>>
>> Can you try this patch: only compile tested.
>>
>> ---------------------------------->cut<---------------------------------------
>>  From 3f8607557162e16673b26fa253d11cafdc4444cf Mon Sep 17 00:00:00 2001
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Date: Thu, 20 Mar 2025 17:07:05 +0000
>> Subject: [PATCH] misc: fastrpc: cleanup the domain names
>>
>> Currently the domain ids are added for each instance of domain, this is
>> totally not scalable approch.
>>
>> Clean this mess and create domain ids for only domains not its
>> instances.
>> This patch also moves the domain ids to uapi header as this is required
>> for FASTRPC_IOCTL_GET_DSP_INFO ioctl.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/misc/fastrpc.c      | 45 ++++++++++++++++++++-----------------
>>   include/uapi/misc/fastrpc.h |  7 ++++++
>>   2 files changed, 32 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 7b7a22c91fe4..b3932897a437 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -23,12 +23,6 @@
>>   #include <uapi/misc/fastrpc.h>
>>   #include <linux/of_reserved_mem.h>
>>
>> -#define ADSP_DOMAIN_ID (0)
>> -#define MDSP_DOMAIN_ID (1)
>> -#define SDSP_DOMAIN_ID (2)
>> -#define CDSP_DOMAIN_ID (3)
>> -#define CDSP1_DOMAIN_ID (4)
>> -#define FASTRPC_DEV_MAX        5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>>   #define FASTRPC_MAX_SESSIONS    14
>>   #define FASTRPC_MAX_VMIDS    16
>>   #define FASTRPC_ALIGN        128
>> @@ -106,8 +100,6 @@
>>
>>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>
>> -static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>> -                        "sdsp", "cdsp", "cdsp1" };
>>   struct fastrpc_phy_page {
>>       u64 addr;        /* physical address */
>>       u64 size;        /* size of contiguous region */
>> @@ -1769,7 +1761,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>>           return  -EFAULT;
>>
>>       cap.capability = 0;
>> -    if (cap.domain >= FASTRPC_DEV_MAX) {
>> +    if (cap.domain >= FASTRPC_DOMAIN_MAX) {
>>           dev_err(&fl->cctx->rpdev->dev, "Error: Invalid domain id:%d, err:%d\n",
>>               cap.domain, err);
>>           return -ECHRNG;
> 
> I tested this patch and saw one issue.
> Here FASTRPC_DOMAIN_MAX is set to 4, but in userspace, cdsp1 is 4, gdsp0 is 5 and gdsp1 is 6.


Why is the userspace using something that is not uAPI?

Why does it matter if its gdsp0 or gdsp1 for the userspace?
It should only matter if its gdsp domain or not.



--srini


> For example, if we run a demo on gdsp0, cap.domain copied from userspace will be 5 which could lead to wrong message.
> 
> --Ling Xu
> 
>> @@ -2255,6 +2247,24 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
>>       return err;
>>   }
>>
>> +static int fastrpc_get_domain_id(const char *domain)
>> +{
>> +    if (strncmp(domain, "adsp", 4) == 0) {
>> +        return ADSP_DOMAIN_ID;
>> +    } else    if (strncmp(domain, "cdsp", 4) == 0) {
>> +        return CDSP_DOMAIN_ID;
>> +    } else if (strncmp(domain, "mdsp", 4) ==0) {
>> +        return MDSP_DOMAIN_ID;
>> +    } else if (strncmp(domain, "sdsp", 4) ==0) {
>> +        return SDSP_DOMAIN_ID;
>> +    } else if (strncmp(domain, "gdsp", 4) ==0) {
>> +        return GDSP_DOMAIN_ID;
>> +    }
>> +
>> +    return -EINVAL;
>> +
>> +}
>> +
>>   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   {
>>       struct device *rdev = &rpdev->dev;
>> @@ -2272,15 +2282,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>           return err;
>>       }
>>
>> -    for (i = 0; i < FASTRPC_DEV_MAX; i++) {
>> -        if (!strcmp(domains[i], domain)) {
>> -            domain_id = i;
>> -            break;
>> -        }
>> -    }
>> +    domain_id = fastrpc_get_domain_id(domain);
>>
>>       if (domain_id < 0) {
>> -        dev_info(rdev, "FastRPC Invalid Domain ID %d\n", domain_id);
>> +        dev_info(rdev, "FastRPC Domain %s not supported\n", domain);
>>           return -EINVAL;
>>       }
>>
>> @@ -2332,19 +2337,19 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>       case SDSP_DOMAIN_ID:
>>           /* Unsigned PD offloading is only supported on CDSP and CDSP1 */
>>           data->unsigned_support = false;
>> -        err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
>> +        err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>>           if (err)
>>               goto fdev_error;
>>           break;
>>       case CDSP_DOMAIN_ID:
>> -    case CDSP1_DOMAIN_ID:
>> +    case GDSP_DOMAIN_ID:
>>           data->unsigned_support = true;
>>           /* Create both device nodes so that we can allow both Signed and Unsigned PD */
>> -        err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
>> +        err = fastrpc_device_register(rdev, data, true, domain);
>>           if (err)
>>               goto fdev_error;
>>
>> -        err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
>> +        err = fastrpc_device_register(rdev, data, false, domain);
>>           if (err)
>>               goto populate_error;
>>           break;
>> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
>> index f33d914d8f46..89516abd258f 100644
>> --- a/include/uapi/misc/fastrpc.h
>> +++ b/include/uapi/misc/fastrpc.h
>> @@ -133,6 +133,13 @@ struct fastrpc_mem_unmap {
>>       __s32 reserved[5];
>>   };
>>
>> +#define ADSP_DOMAIN_ID (0)
>> +#define MDSP_DOMAIN_ID (1)
>> +#define SDSP_DOMAIN_ID (2)
>> +#define CDSP_DOMAIN_ID (3)
>> +#define GDSP_DOMAIN_ID (4)
>> +
>> +#define FASTRPC_DOMAIN_MAX    4
>>   struct fastrpc_ioctl_capability {
>>       __u32 domain;
>>       __u32 attribute_id;
> 

