Return-Path: <linux-arm-msm+bounces-61423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B0AADAE8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 13:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BB683B4E56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 11:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA4929CB48;
	Mon, 16 Jun 2025 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ltHrVmla"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B3D1A5BAE
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073549; cv=none; b=b7JcRljEmAVXBZX1WeR9II0FGY2QXA13QhNTaIyplh5Cz2eNwTtzdrVqLvzZ6H3Te7e+XIUvu871X9TWj6e8QbJSS/JDVkRED6M536syTkde2YI7Lw9kGwq0K8lXFdYS2P+mxy/pAkiK6qUETarTcG5QB+yS18N3TwKs0fRqLAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073549; c=relaxed/simple;
	bh=OM4ukmkvHF3bWa/6MQDtPcqF7cFW5tgL3BM4AR4AZOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOAqZDKCqCXxoNSjL4y2vg8H9pVvysFDzm8yvfkkYFd7Ur5j4ZDpymbseBbdcPZiOHVXEgMViaQbKHyRnl6gkoV2qBprSwwwYg07hFTMQMovJEfOYQk7zN6qogZ6YxDRoV5oTTux+PpzqA3cZz/X7dze2oWKqC4h44lUTVoWIe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ltHrVmla; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8i57w003266
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VhReFJIFGzRzknyzHaRK8EX3c4dPqPcybLOZHXiPHaI=; b=ltHrVmlaevrDM6Yw
	vDwkUIrqFh5TtWieEbQC1jISg4cA4vqe9qAL8rEjWPgMd+7nKkvyTI2vGQZPHX3J
	Ebht9/fAeja80kT38fIzNMbgJDtuIX1bZlc5fS8bpFIVrj7yjLFc7H9Dz1ONNZyo
	IJVa8Z2UnsW88IoOwiLZzC75BZvj73zwO7CEDs3Hzvb4V5L8EYBJkAC9G4H5REE6
	Ml3yJrduYbLAoLtHQad1xeiwOXzgDbkwTH6trNnrOgeNwdZB3dmMhXClZ4BK6Kem
	CPxBhCKqp9xTdPOFo9LV5GEg6u5nCHYBIp8x9V0Vk/i2TfVoEBQBApoNjyEsDUHA
	a2BqtQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5jw28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:32:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c791987cf6so991748585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 04:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750073541; x=1750678341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VhReFJIFGzRzknyzHaRK8EX3c4dPqPcybLOZHXiPHaI=;
        b=QJU4R+1J6cRbB1lusT1ezViYtXAeLqBE6PzrSL8VNU4Za4aOpXjBie4zjK9l5+khX3
         Wvk1dGaD4OAHcNaGOmzCMevkwOxdJP0kJ6YcLtyFgPCEzZT4fIoUUgUG9Yc7CfcDlGU2
         RmZ81Ef88rqlbnjGMp0S1Sph2Qrh/tZoHAox7s6V6GjzColgR7oxATzogKpCnT9tnGjS
         Na6yjsyKpu0mrMIFrSz4YMQq8HLbkNfu0vTP6kh/Sho+hQYU7a6CWrHMEGgOnvSysDji
         ELT/v8LNgKtw4k3b6Zb5YJI+xrAAyrVfRqZ0R1lTavyqA4TOrz9EFV67iM64WG4NkvYf
         ObOg==
X-Forwarded-Encrypted: i=1; AJvYcCU4Wfbzo49a4OpFHwx+3lBcz+Amv0wXQsmnFlx5wwbGGab61OeN3JBXiD7TB4FgqPx+GljaNp4P7bIti3QK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzye28PwXzC+4HVzZEDyaCVTbCft1VPhyNaGYyfQGNYdc22UkQJ
	wVtlqWHG1Sdu3Zl47A2lhdjdctI4Xe/SjMJZyS+2+uXiTaOVizPC9/EOx6CFT7gg++Cw6YOLjeU
	KYYfPj29xUoT8wIH95nUgwSSn1FPAMV8Rcn/t31xuD4Hiimu2eZc8kvtYskBv80UGDxJj
X-Gm-Gg: ASbGncsik1VzRU64fGFn/18kaMAkx/KioAD+WB3a313HXNkTDcvfBL2SH/vmJE9He0Y
	RPBEp2vXk0S+KFyWCpbfYonNvmvej2BH3SRcl9FxK+moPdk2I0c5I3LsMlOJIOjvuda6ckqHv09
	NzCOA7kNNJWRj3CA3swj9jzJea9UqdgTDsl/tnuqpST11A7EI/AV7cU62IQjRMRRMju6/u2okRK
	g97m+gUYn0qYkopgs/Bu7WIDk1zPAURFEz3HCwZMAPRUMcHBjHk6m/KiQKqmFyCBGDHxjfyl6Tg
	3BxjeqtyWokZlB9MtjL5cYsIqbSrZN4Z5yFglul/gXVFiptcN1HwPE4ajoPNJp4a87E0LYzF4cY
	5jyGDhEg+uKVMQiSRypGm/yYP01uYhOyAYb0i+Cu714zeJbb0FvMGC3qyvpX7btXVNlw3ZXzPO9
	8=
X-Received: by 2002:a05:6214:3d9c:b0:6fb:3e3e:89da with SMTP id 6a1803df08f44-6fb4776e0e4mr143194906d6.25.1750073540806;
        Mon, 16 Jun 2025 04:32:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwjE7NgqGQJ5dlBHGyGS3GLtFKWMEQiXrYgTad8WhvvEtddvjIxuizLej1JtENs1oh6vFd5Q==
X-Received: by 2002:a05:6214:3d9c:b0:6fb:3e3e:89da with SMTP id 6a1803df08f44-6fb4776e0e4mr143194396d6.25.1750073540332;
        Mon, 16 Jun 2025 04:32:20 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a4:c3fb:c59f:e024:c669:a69b? (2001-14bb-a4-c3fb-c59f-e024-c669-a69b.rev.dnainternet.fi. [2001:14bb:a4:c3fb:c59f:e024:c669:a69b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1c1195sm1509064e87.141.2025.06.16.04.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:32:19 -0700 (PDT)
Message-ID: <cdf0accd-82dd-49e5-a8e5-1b4865e97356@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 14:32:17 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
To: Ling Xu <quic_lxu5@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, quic_ekangupt@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
 <e2a8528b-fa18-471f-9cb8-da64bb488f2a@quicinc.com>
 <07bfc5f3-1bcb-4018-bd63-8317ec6dac48@linaro.org>
 <5f70a482-6e61-4817-afdb-d5db4747897a@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <5f70a482-6e61-4817-afdb-d5db4747897a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JUkzBHbrB5svheYE-djcWS0Kjju0wXmK
X-Proofpoint-ORIG-GUID: JUkzBHbrB5svheYE-djcWS0Kjju0wXmK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MSBTYWx0ZWRfXxYbUAuxpmQ5Z
 peo6X39HekcN81AQ1GwrqvenKBTHfePb9ijDnPaDUWb+kB+K8umrMT6w4tTjbta/9lRw47GvjWu
 F+BlgunzaX2dOxdSQaZsxaP3J91DOvtuCzxy7AwxnZkw1QWSv3nZLYaZ5gZX9VJWPn13enBUs3O
 eCc6AZGpuSYtwD0IGngM+O6q7+xRhYNxG7L/6owR2+cJ7nD2yJ53ZKmj/mgoThR/pXaTpqO3Wk8
 y2CKlq3P6dm674eh84+LqWD2FT6xoKy0kvTn6E3AB1ulEI1jVvfF7eNySIh+PVDVklx7ER/5jJU
 ab6dmSKcfqQIgl82iYEhOL5JKNkLnd8e4+eFFBlWziPZDA8bJYtC5RU6WIswnZciIE2vd6d0ngS
 4POtvu7cRIqEHwnnipeBtDu1JcgAzMkeXr8eHnQHPKW7PsEShVMaAwVPCWTVGcRnejdv9cWG
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=685000ca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=iV2O8m49h_L4xXlhIwoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160071

On 16/06/2025 14:28, Ling Xu wrote:
> 在 4/8/2025 4:14 PM, Srinivas Kandagatla 写道:
>>
>>
>> On 07/04/2025 10:13, Ling Xu wrote:
>>> 在 3/21/2025 1:11 AM, Srinivas Kandagatla 写道:
>>>>
>>>>
>>>> On 20/03/2025 09:14, Ling Xu wrote:
>>>>> The fastrpc driver has support for 5 types of remoteprocs. There are
>>>>> some products which support GPDSP remoteprocs. Add changes to support
>>>>> GPDSP remoteprocs.
>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>>>>> ---
>>>>>     drivers/misc/fastrpc.c | 10 ++++++++--
>>>>>     1 file changed, 8 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>>> index 7b7a22c91fe4..80aa554b3042 100644
>>>>> --- a/drivers/misc/fastrpc.c
>>>>> +++ b/drivers/misc/fastrpc.c
>>>>> @@ -28,7 +28,9 @@
>>>>>     #define SDSP_DOMAIN_ID (2)
>>>>>     #define CDSP_DOMAIN_ID (3)
>>>>>     #define CDSP1_DOMAIN_ID (4)
>>>>> -#define FASTRPC_DEV_MAX        5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>>>>> +#define GDSP0_DOMAIN_ID (5)
>>>>> +#define GDSP1_DOMAIN_ID (6)
>>>>
>>>> We have already made the driver look silly here, Lets not add domain ids for each instance, which is not a scalable.
>>>>
>>>> Domain ids are strictly for a domain not each instance.
>>>>
>>>>
>>>>> +#define FASTRPC_DEV_MAX        7 /* adsp, mdsp, slpi, cdsp, cdsp1, gdsp0, gdsp1 */
>>>>>     #define FASTRPC_MAX_SESSIONS    14
>>>>>     #define FASTRPC_MAX_VMIDS    16
>>>>>     #define FASTRPC_ALIGN        128
>>>>> @@ -107,7 +109,9 @@
>>>>>     #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>>>>       static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>>>>> -                        "sdsp", "cdsp", "cdsp1" };
>>>>> +                        "sdsp", "cdsp",
>>>>> +                        "cdsp1", "gdsp0",
>>>>> +                        "gdsp1" };
>>>>>     struct fastrpc_phy_page {
>>>>>         u64 addr;        /* physical address */
>>>>>         u64 size;        /* size of contiguous region */
>>>>> @@ -2338,6 +2342,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>>>>             break;
>>>>>         case CDSP_DOMAIN_ID:
>>>>>         case CDSP1_DOMAIN_ID:
>>>>> +    case GDSP0_DOMAIN_ID:
>>>>> +    case GDSP1_DOMAIN_ID:
>>>>>             data->unsigned_support = true;
>>>>>             /* Create both device nodes so that we can allow both Signed and Unsigned PD */
>>>>>             err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
>>>>
>>>>
>>>> Can you try this patch: only compile tested.
>>>>
>>>> ---------------------------------->cut<---------------------------------------
>>>>   From 3f8607557162e16673b26fa253d11cafdc4444cf Mon Sep 17 00:00:00 2001
>>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>> Date: Thu, 20 Mar 2025 17:07:05 +0000
>>>> Subject: [PATCH] misc: fastrpc: cleanup the domain names
>>>>
>>>> Currently the domain ids are added for each instance of domain, this is
>>>> totally not scalable approch.
>>>>
>>>> Clean this mess and create domain ids for only domains not its
>>>> instances.
>>>> This patch also moves the domain ids to uapi header as this is required
>>>> for FASTRPC_IOCTL_GET_DSP_INFO ioctl.
>>>>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>> ---
>>>>    drivers/misc/fastrpc.c      | 45 ++++++++++++++++++++-----------------
>>>>    include/uapi/misc/fastrpc.h |  7 ++++++
>>>>    2 files changed, 32 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index 7b7a22c91fe4..b3932897a437 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -23,12 +23,6 @@
>>>>    #include <uapi/misc/fastrpc.h>
>>>>    #include <linux/of_reserved_mem.h>
>>>>
>>>> -#define ADSP_DOMAIN_ID (0)
>>>> -#define MDSP_DOMAIN_ID (1)
>>>> -#define SDSP_DOMAIN_ID (2)
>>>> -#define CDSP_DOMAIN_ID (3)
>>>> -#define CDSP1_DOMAIN_ID (4)
>>>> -#define FASTRPC_DEV_MAX        5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>>>>    #define FASTRPC_MAX_SESSIONS    14
>>>>    #define FASTRPC_MAX_VMIDS    16
>>>>    #define FASTRPC_ALIGN        128
>>>> @@ -106,8 +100,6 @@
>>>>
>>>>    #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>>>
>>>> -static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>>>> -                        "sdsp", "cdsp", "cdsp1" };
>>>>    struct fastrpc_phy_page {
>>>>        u64 addr;        /* physical address */
>>>>        u64 size;        /* size of contiguous region */
>>>> @@ -1769,7 +1761,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>>>>            return  -EFAULT;
>>>>
>>>>        cap.capability = 0;
>>>> -    if (cap.domain >= FASTRPC_DEV_MAX) {
>>>> +    if (cap.domain >= FASTRPC_DOMAIN_MAX) {
>>>>            dev_err(&fl->cctx->rpdev->dev, "Error: Invalid domain id:%d, err:%d\n",
>>>>                cap.domain, err);
>>>>            return -ECHRNG;
>>>
>>> I tested this patch and saw one issue.
>>> Here FASTRPC_DOMAIN_MAX is set to 4, but in userspace, cdsp1 is 4, gdsp0 is 5 and gdsp1 is 6.
>>
>>
>> Why is the userspace using something that is not uAPI?
>>
>> Why does it matter if its gdsp0 or gdsp1 for the userspace?
>> It should only matter if its gdsp domain or not.
>>
> 
> Give an example here:
> In test example, user can use below API to query the notification capability of the specific domain_id,
> (actually this will not have any functional issue, but just return an error and lead wrong message):
> request_status_notifications_enable(domain_id, (void*)STATUS_CONTEXT, pd_status_notifier_callback)
> 
> this will call ioctl_getdspinfo in fastrpc_ioctl.c:
> https://github.com/quic-lxu5/fastrpc/blob/8feccfd2eb46272ad1fabed195bfddb7fd680cbd/src/fastrpc_ioctl.c#L201
> 
> code snip:
> 	FARF(ALWAYS, "ioctl_getdspinfo in ioctl.c domain:%d", domain);
> 	ioErr = ioctl(dev, FASTRPC_IOCTL_GET_DSP_INFO, &cap);
> 	FARF(ALWAYS, "done ioctl_getdspinfo in ioctl.c ioErr:%x", ioErr);
> 
> and finally call fastrpc_get_dsp_info in fastrpc.c.
> 
> if I use the patch you shared, it will report below error:
> 
> UMD log:
> 2025-01-08T18:45:03.168718+00:00 qcs9100-ride-sx calculator: fastrpc_ioctl.c:201: ioctl_getdspinfo in ioctl.c domain:5
> 2025-01-08T18:45:03.169307+00:00 qcs9100-ride-sx calculator: log_config.c:396: file_watcher_thread starting for domain 5
> 2025-01-08T18:45:03.180355+00:00 qcs9100-ride-sx calculator: fastrpc_ioctl.c:203: done ioctl_getdspinfo in ioctl.c ioErr:ffffffff
> 
> putty log:
> [ 1332.308444] qcom,fastrpc 20c00000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: Error: Invalid domain id:5, err:0
> 
> Because on the user side, gdsp0 and gdsp1 will be distinguished to 5 and 6.
> so do you mean you want me to modify UMD code to transfer both gdsp0 and gdsp1 to gdsp just in ioctl_getdspinfo?

No, we need to modify the kernel code to ignore cap.domain here. The 
user has already open the particular FastRPC device. All queries should 
be target that device and that domain. As such, cap.domain doesn't make 
sense and should be ignored by the kernel.

>>
>> --srini
>>
>>
>>> For example, if we run a demo on gdsp0, cap.domain copied from userspace will be 5 which could lead to wrong message.
>>>
>>> --Ling Xu
>>>
>>>> @@ -2255,6 +2247,24 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
>>>>        return err;
>>>>    }
>>>>
>>>> +static int fastrpc_get_domain_id(const char *domain)
>>>> +{
>>>> +    if (strncmp(domain, "adsp", 4) == 0) {
>>>> +        return ADSP_DOMAIN_ID;
>>>> +    } else    if (strncmp(domain, "cdsp", 4) == 0) {
>>>> +        return CDSP_DOMAIN_ID;
>>>> +    } else if (strncmp(domain, "mdsp", 4) ==0) {
>>>> +        return MDSP_DOMAIN_ID;
>>>> +    } else if (strncmp(domain, "sdsp", 4) ==0) {
>>>> +        return SDSP_DOMAIN_ID;
>>>> +    } else if (strncmp(domain, "gdsp", 4) ==0) {
>>>> +        return GDSP_DOMAIN_ID;
>>>> +    }
>>>> +
>>>> +    return -EINVAL;
>>>> +
>>>> +}
>>>> +
>>>>    static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>>>    {
>>>>        struct device *rdev = &rpdev->dev;
>>>> @@ -2272,15 +2282,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>>>            return err;
>>>>        }
>>>>
>>>> -    for (i = 0; i < FASTRPC_DEV_MAX; i++) {
>>>> -        if (!strcmp(domains[i], domain)) {
>>>> -            domain_id = i;
>>>> -            break;
>>>> -        }
>>>> -    }
>>>> +    domain_id = fastrpc_get_domain_id(domain);
>>>>
>>>>        if (domain_id < 0) {
>>>> -        dev_info(rdev, "FastRPC Invalid Domain ID %d\n", domain_id);
>>>> +        dev_info(rdev, "FastRPC Domain %s not supported\n", domain);
>>>>            return -EINVAL;
>>>>        }
>>>>
>>>> @@ -2332,19 +2337,19 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>>>        case SDSP_DOMAIN_ID:
>>>>            /* Unsigned PD offloading is only supported on CDSP and CDSP1 */
>>>>            data->unsigned_support = false;
>>>> -        err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
>>>> +        err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>>>>            if (err)
>>>>                goto fdev_error;
>>>>            break;
>>>>        case CDSP_DOMAIN_ID:
>>>> -    case CDSP1_DOMAIN_ID:
>>>> +    case GDSP_DOMAIN_ID:
>>>>            data->unsigned_support = true;
>>>>            /* Create both device nodes so that we can allow both Signed and Unsigned PD */
>>>> -        err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
>>>> +        err = fastrpc_device_register(rdev, data, true, domain);
>>>>            if (err)
>>>>                goto fdev_error;
>>>>
>>>> -        err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
>>>> +        err = fastrpc_device_register(rdev, data, false, domain);
>>>>            if (err)
>>>>                goto populate_error;
>>>>            break;
>>>> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
>>>> index f33d914d8f46..89516abd258f 100644
>>>> --- a/include/uapi/misc/fastrpc.h
>>>> +++ b/include/uapi/misc/fastrpc.h
>>>> @@ -133,6 +133,13 @@ struct fastrpc_mem_unmap {
>>>>        __s32 reserved[5];
>>>>    };
>>>>
>>>> +#define ADSP_DOMAIN_ID (0)
>>>> +#define MDSP_DOMAIN_ID (1)
>>>> +#define SDSP_DOMAIN_ID (2)
>>>> +#define CDSP_DOMAIN_ID (3)
>>>> +#define GDSP_DOMAIN_ID (4)
>>>> +
>>>> +#define FASTRPC_DOMAIN_MAX    4
>>>>    struct fastrpc_ioctl_capability {
>>>>        __u32 domain;
>>>>        __u32 attribute_id;
>>>
> 


-- 
With best wishes
Dmitry

