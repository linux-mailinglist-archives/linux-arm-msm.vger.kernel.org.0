Return-Path: <linux-arm-msm+bounces-65333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCC9B081F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 02:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74D0F1C404A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 00:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A675318FC86;
	Thu, 17 Jul 2025 00:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OCNca29K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18561509A0
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 00:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752713750; cv=none; b=L7amxjZyJgIMpC2iClOIvvZPPRANGLJd+x8lgrc1qriNCG+1L4Jx6xVkg7eVzmY7S/nra54394xyCCqD6vV4384EVCh9/Yt+3Tyvlz8RzUvWRllwFrZo5TVR0HQD+Kx3rTpoM4bDv2jESZKaS37RD8O3Lty/riLbRKTjgzeL+Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752713750; c=relaxed/simple;
	bh=Lwd7xExybTot6x05t/ihJ3H+SIWk5GM8UXSeQC6XPKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CDIV9XUX8rs889UAYcETtXeE6IXBeAS6BQG/KZ5hLemAKfKv0UjLfnGA0cSuDuWLixKREhf/K/Zi5uCjxVIyIOMZl0Ls4Hd9oSEPDEfoM50KBJjtF+DUXeH5UntOC817xgy7VfQJ179b2zqLqD/IDsJI6ZOiiJzljTBLhYPM0dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OCNca29K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GGDYQj021709
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 00:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IE2mv/XyFgD4b+TvkQGaKdoVQYDSr2EgRQz4YF0xCJw=; b=OCNca29K4/heGuRI
	EuoPnowCMwoZD2GJk0v9O20MttCKZB0gRAcvZzZPPCbx9Q2uMUzQ21mJgoqzFQjD
	Odfj+DMhJXRXXz3uKKqBhI3F0JEgq4VHi1N+6mY+igTUdBhaTFTcuqu5QecEvyuF
	ztD8SErr+ku9d/WRaz0H8UbZP5ykZGIXd6/M+xHcgYf1WJ0NjWru43SgQT0t7B0t
	zWnHQh0LVS80FQXNkuc14oju7UtxAmzb8SGkj1SsVSjUnsFscUOHJgvuO7R3N0Fi
	LSTVtwEh8b0uR8be32h8vzzSQoXSUQXZS7+2BMLjyuLksnggQO6yEk0qkkf2BmQv
	9SkOzA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8dp25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 00:55:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2c00e965d0so262094a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 17:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752713746; x=1753318546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IE2mv/XyFgD4b+TvkQGaKdoVQYDSr2EgRQz4YF0xCJw=;
        b=BXxbAWmZtxInpm4qZ9qVze4WXRBcbjEevjKahPyHVOuMipYhXb8VIma/ub0wP/Pz/L
         skBHxd0L4SiE7j43QPlTE3PQnA640wK6vgWcUMXhNMJYEIDSVt6/2uHxzzOlpD2qmHaE
         7Aa2mtzwjQ/WVaAYszSlaIASpPbjqEpdrsv1NGA/AG59s43EPSzfVGJKqjjuWaeS1KIx
         pUIIcZXJCVW5LPQusun8px70YVSIu4KBeosd8XdV6sr9aJnfPJoFXz3zTQXPgedJz6rd
         /oc9f/Sh5ySAZklvP2Dblxbi/PPFhSmMkZQkx+FNVqyiWgBvhaAUpznduKWEr00XerNq
         WitA==
X-Forwarded-Encrypted: i=1; AJvYcCUcNzkG/h2M7G7+cX181eDIG4otm34dfAJk9MtoQiGjt/JOUQZtEGa7fME77hy3ri2agoy9gjbApj+n6FTw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7GoPM9aAOquvUaPPQiuhnpfV5ldfjZJf9NOCYGzgB0XlZ0K6e
	w/QXOV4ciZ8pHqEz4hfctfio03El+tkodRwGjLrTZeO+1B8n8Pqmot+8Noe6kSBoA5UIzDOvXMC
	u2CDPggxEJcGACXf8iaEnCB2XEPppkwlBBKGUD2fH/MKjmNe1B/biozzBpRgcACuwk2R8
X-Gm-Gg: ASbGncu8X9vOTNYSjMraHEP7fJG/yGtFU0WZkf6iqZiY/gje22H7/0pqbuVMCMEE9hn
	MwS5sYveUA1E6fdGatyIFjs2UHM6UXZPPHtbq+mcFBkzW+23m36qPxWJqc/uafKSkbXhiLDr8WN
	iRKrYJzo/Z9NkSLg34N5JFxdIVX54GfQiaHkvQQLsEpgKKaqZGfscHwRVKe44+IzSZ45Cu9C7VP
	x3+Tck1HZEcQXrdL93C0MMSZ3UhSquATFctxbCgXLNExl6cATu6Zn2HOri6Cnmn9biNEGIUvXE8
	geWDGHvtVMRrgWFcG6s8lwWW1M++YRSp7tgNt/0lx47aO/oyqwtlJraOvsisP2Xggo0Fox+Htkc
	xw/H1++Uxu5iLWb3Aeb5x+2cT
X-Received: by 2002:a05:6a20:431b:b0:215:efed:acfc with SMTP id adf61e73a8af0-237d5f28f06mr9124564637.7.1752713745960;
        Wed, 16 Jul 2025 17:55:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsusfkryQNV4zgPxlZ3pgSGcpHupRiF5HVteLlYpaFodV/KYUSAfdyKsskldFXBYJwvAiNtA==
X-Received: by 2002:a05:6a20:431b:b0:215:efed:acfc with SMTP id adf61e73a8af0-237d5f28f06mr9124527637.7.1752713745535;
        Wed, 16 Jul 2025 17:55:45 -0700 (PDT)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd7d1sm14379656a12.35.2025.07.16.17.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 17:55:44 -0700 (PDT)
Message-ID: <4850a2a5-dbeb-43f4-9005-1cc022545dcd@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 08:55:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 01/10] coresight: core: Refactoring
 ctcu_get_active_port and make it generic
To: Mike Leach <mike.leach@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
 <20250714063109.591-2-jie.gan@oss.qualcomm.com>
 <CAJ9a7VjyWtopbnTirRnd4-486PrdQH00cvUR0kcPde2hxCUH-A@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VjyWtopbnTirRnd4-486PrdQH00cvUR0kcPde2hxCUH-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDAwNiBTYWx0ZWRfXyTkMjdkZNUze
 M2Gka5/ZdX87kMARijMF2gbXj1EdsgDmuhq/sun24T3rtihTDfgq3/6dHxDJAaHg7H0hzLC3SFn
 6FF6Q14/6pdwFfzEvrf6ehsjk5e9L7JzS+b0tJEJHECoK+GFjFbQ96OtZJevEwE893zXSbFOuOA
 GHX2H8ncCJRWfPNZt4UzUxsqvqZNblJh2vatvJ1RDHxo2ljH2dEkHQFr2T9jonXTP4ChLoMakCv
 hVsln7rfzvbXdc5vMtnhmRyH/amJ21hbkHm+5VRtSzBHYvIjDCdZ7PBZ9V8QPkmjMuP8Us+T2WZ
 NRKC2TO5FNeMgRFSrq0pL5gH71PcLGoT/IS22IAbpniaMULGzMSBFY0u2kU2xyeQUNEy95AnYe2
 Wy+sOPIQkDYsMSqv4Er5laqE04+uNpss7xPh69HcgyqEhILnMB6TiYdQH4tEpKiyPgqCQfDj
X-Proofpoint-ORIG-GUID: gogLeN0FX2l5J3OJWWePIE-RDe_wJZo9
X-Proofpoint-GUID: gogLeN0FX2l5J3OJWWePIE-RDe_wJZo9
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68784a13 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=CCvaVWANnUWFBPVUepYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_05,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170006



On 7/16/2025 6:20 PM, Mike Leach wrote:
> Hi,
> 
> On Mon, 14 Jul 2025 at 07:31, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Remove ctcu_get_active_port from CTCU module and add it to the core
>> framework.
>>
>> The port number is crucial for the CTCU device to identify which ETR
>> it serves. With the port number we can correctly get required parameters
>> of the CTCU device in TMC module.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c  | 24 +++++++++++++++++++
>>   .../hwtracing/coresight/coresight-ctcu-core.c | 19 +--------------
>>   drivers/hwtracing/coresight/coresight-priv.h  |  2 ++
>>   3 files changed, 27 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
>> index 1accd7cbd54b..5297a5ff7921 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -580,6 +580,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_get_sink);
>>
>> +/**
>> + * coresight_get_port_helper: get the in-port number of the helper device
>> + * that is connected to the csdev.
>> + *
> 
> As written this looks at all connections, not just those that are
> helpers. That is fine, so perhaps rename as such.
> 
> e.g. coresight_get_in_port_dest
> 
> and name the input parameters src , dest respectively.

Make sense for me, will update in next version.
Thanks for the suggestion.

> 
>> + * @csdev: csdev of the device that is connected to helper.
>> + * @helper: csdev of the helper device.
>> + *
>> + * Return: port number upson success or -EINVAL for fail.
> 
> sp: upon/upson
> 
>> + */
>> +int coresight_get_port_helper(struct coresight_device *csdev,
>> +                             struct coresight_device *helper)
>> +{
>> +       struct coresight_platform_data *pdata = helper->pdata;
>> +       int i;
>> +
>> +       for (i = 0; i < pdata->nr_inconns; ++i) {
>> +               if (pdata->in_conns[i]->src_dev == csdev)
>> +                       return pdata->in_conns[i]->dest_port;
>> +       }
>> +
>> +       return -EINVAL;
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_get_port_helper);
>> +
>>   u32 coresight_get_sink_id(struct coresight_device *csdev)
>>   {
>>          if (!csdev->ea)
>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> index c6bafc96db96..28ea4a216345 100644
>> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> @@ -118,23 +118,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
>>          return 0;
>>   }
>>
>> -/*
>> - * Searching the sink device from helper's view in case there are multiple helper devices
>> - * connected to the sink device.
>> - */
>> -static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
>> -{
>> -       struct coresight_platform_data *pdata = helper->pdata;
>> -       int i;
>> -
>> -       for (i = 0; i < pdata->nr_inconns; ++i) {
>> -               if (pdata->in_conns[i]->src_dev == sink)
>> -                       return pdata->in_conns[i]->dest_port;
>> -       }
>> -
>> -       return -EINVAL;
>> -}
>> -
>>   static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
>>                                  bool enable)
>>   {
>> @@ -147,7 +130,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
>>                  return -EINVAL;
>>          }
>>
>> -       port_num = ctcu_get_active_port(sink, csdev);
>> +       port_num = coresight_get_port_helper(sink, csdev);
>>          if (port_num < 0)
>>                  return -EINVAL;
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
>> index 33e22b1ba043..07a5f03de81d 100644
>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>> @@ -156,6 +156,8 @@ void coresight_remove_links(struct coresight_device *orig,
>>   u32 coresight_get_sink_id(struct coresight_device *csdev);
>>   void coresight_path_assign_trace_id(struct coresight_path *path,
>>                                     enum cs_mode mode);
>> +int coresight_get_port_helper(struct coresight_device *csdev,
>> +                             struct coresight_device *helper);
>>
> rename here too

will do.

Best Regards,
Jie

> 
>>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>>   int etm_readl_cp14(u32 off, unsigned int *val);
>> --
>> 2.34.1
>>
> 
> regards
> 
> Mike


