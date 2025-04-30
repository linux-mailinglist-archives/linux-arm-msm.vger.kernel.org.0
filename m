Return-Path: <linux-arm-msm+bounces-56301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F920AA4F3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 16:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62E8B4C58C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 14:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B4E1AF0C8;
	Wed, 30 Apr 2025 14:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vp1dXU1F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9041A841A
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 14:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746025116; cv=none; b=p3c9F2j8qE3EVbLY6Su/fFuZKr1sT6aV9Xyxwm6XIJlt60xutC/jNSeVzmfnCT8lQuvMU8cZcxOB2/bioWO0SRNdyP1mvtzEm0bnVaB7CgFqYgzWm7Fym4i+2/HJx7V3k6NM6zZfjwC2f/dKW09tOMoPMeYpDcDM9s9wf7R7IU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746025116; c=relaxed/simple;
	bh=wB6kpIf21q1Qn6YXVNzBxYXe34/WGz8PYw9bqAw7+C0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ml7Omj1y3tXKBc1piFTO90WvumurvhId1s84WqMhnJgc9K4Nz3IrYa1aWAfQ2zQfMg5gF4IvGCvNLBbu0Gi7Km4NtBIWLmG/PFCSpBF5U/I8EapF/3Wzm3bWKsHm2DW9+T+WsmYH2Bj5MJGjdgdgdMGKnB5zvwVh4iSQKMVbp+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vp1dXU1F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U93K9L021071
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 14:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0395qd5yJqamGnAr3MiSAsjGjuJlP7P6P9uGyNSoi0w=; b=Vp1dXU1F0aba3NFg
	3uWHJq72RAyi+rek1JEtvAR8Wj0w9BSEP6vvtZ+MQHWWtvKMZfeJ2eNCU5tzVR/t
	we61iI2nIkqPMZUaQNVjREG3Es/Qdp+x0KVcBi4n/Q6ZHc3esjwQIfQA3wXdNI+s
	aEmz+MkaET7DFpLEuL88AuQxIqcRX17qwTNMoyLrsx9a7qPnD2jgkSv2yiE6AmWB
	W5fq4NzyG/Rh2suQto9lVtMxPYg4pn4mDDZ4tNiiEyfEZDMQZHLZOjL0aqrOJvIF
	fAJG0pQocQybrAxl8Dl+g6qYkKHluIVhUJC4mOLcJ7SEcGEApey+qCshzXHPn38U
	bCeaJQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u1tjdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 14:58:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2242f3fd213so62876615ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 07:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025112; x=1746629912;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0395qd5yJqamGnAr3MiSAsjGjuJlP7P6P9uGyNSoi0w=;
        b=W0bstnnySV5YRbJwfEiCe5kF3W637SaHEYN6k0Z/FaI4mV2RcekpY0sC1YjzJ252Tu
         0bjBAkAxeTQC+GsI7ok0pjngMtCjJqQ5FH8jHhYHjEshLgajDpMVo6pAJ8r8r1cEjlzB
         u/88jq7PAba5iQtSdHUyItCPG1CDuybZeaHWymQdUkbaxbDAliSnJT/ycFuTAVKGqUNz
         yuw7IEMiAo61FtLfr8URttRmuqQ1/uEeB6Z9IV+w2pm69JiVGJiAoW+CErPT09xM6QUu
         0SIFa9CeV/IECTw2DVvueS4sV4IuCEZL+93Qy01RkeFcvTeI4xQScNE6RgaqeiylmdBn
         CQkA==
X-Gm-Message-State: AOJu0YyyIpT6mBTuw63OyQGIjfDgQjOYs7wC3nSOBFMqkgICIWhJeZ7Z
	5d36KTw91FU+7+LW/LLi5YY84reR/73m1JLbF4t5/QWFeR/MYbCEeN/Gj4TRDm5hoOOM81R0RPd
	9lmUCGio94RyjaLmkDmC9haHP76gZWNVV+wji+UAstj2wzt9a4xKKreVMbyjdkIKw
X-Gm-Gg: ASbGnctUk5A9Y+17Fp6iyDTTjFWAN1yD5JD0hAPUaCFr7sDH/csN5I4lRW/gtWSkLyJ
	ud6rUTfdV/xqhU6WYt+X9+Rjhfko0pGR5uh40guUaNrcDtSdO4ah+dedyzXiKMOuZiT/TpHMBcD
	cPtRcZkKL1Xx0LahPuXV/Q8uGAHR8Lkrih6YBtSfyDRPa1tc70kkN/vII14f3giljdweTvI6FKG
	gBka57zTUX24VmSRZ+LGfCwheexCozQ9Oqj/awJxnONKfYBza+J5R8mO5TXyF7faU8E4maslxJY
	k4D0d/bkCsq3efpqQZO5V2rbJ9q5M2AwSTU0nMYQclkgtwdNgx61
X-Received: by 2002:a17:903:238e:b0:216:794f:6d7d with SMTP id d9443c01a7336-22df5838d24mr48531965ad.48.1746025112005;
        Wed, 30 Apr 2025 07:58:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqTq6PHUfdr6lYeZjfMfQgeitmCQj1xj6u1g5wc8lHhOeu4N6jAXqIdsqmrbeggeTxMbY6nQ==
X-Received: by 2002:a17:903:238e:b0:216:794f:6d7d with SMTP id d9443c01a7336-22df5838d24mr48531545ad.48.1746025111693;
        Wed, 30 Apr 2025 07:58:31 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.87.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102ddcsm122866445ad.190.2025.04.30.07.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 07:58:31 -0700 (PDT)
Message-ID: <a9c8cfe2-2889-4f75-ac5f-10dcd564808e@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 20:28:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] watchdog: qcom: add support to read the restart
 reason from IMEM
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
 <20250416-wdt_reset_reason-v2-5-c65bba312914@oss.qualcomm.com>
 <4e9621c2-f347-4cba-9422-b14f96ee4c0b@oss.qualcomm.com>
 <0a774c34-e82d-4ff0-aa3f-4f348f4c2296@oss.qualcomm.com>
 <f6f17489-19ec-4956-ace4-47ec93081359@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <f6f17489-19ec-4956-ace4-47ec93081359@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=68123a99 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=wj/iefQKNY9P1RSDfSoyGA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=ZnTUR88OqGoCr7JtRBMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDEwNiBTYWx0ZWRfX6dY2gn5xkLn/ M0JkmpUHQS86t35PGSYHVNSwYWRjceu9ClZpxv4HZmtenY9AJaIvMGeYGC0rIsANWX1KE0v0l58 kv+m48xwO2VZiOwoRWlWaBATltmx2+INvTBICyL8jXVxDBuHKjmSy/hILXgn/miFr9kR9vriom8
 9i0gH/sfJ0EJAqNSRlYtmfCDPXb+HuRTJWSsnVFaH99TttYO+9WiI8l01hXBcf2xaSqCqhEte4L LsQ0OkfL91I7G0xLvIfz/O6omvBaagVn+YZ39e/ZnX5KuN4JYtK2d5IuAZRVDCx/nZHB+xlJU2j 4MLg5KCQoejmna2QCAs85avvAluKnv6trs+tcVLbG+JforyYSKiMnycMeM+XGOllXAiA2p/BmBt
 78WtsMZfVzF3tlBg1GHG+Z/2yjlpesA6PP7CEsqVpXh6gRDoCuKOGVeSV5cn7M2xm5uqAKiU
X-Proofpoint-GUID: N4UA7KMaFmvdI8rHeuKDfje8PJ44b8kY
X-Proofpoint-ORIG-GUID: N4UA7KMaFmvdI8rHeuKDfje8PJ44b8kY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300106


On 4/30/2025 7:58 PM, Konrad Dybcio wrote:
> On 4/17/25 8:19 AM, Kathiravan Thirumoorthy wrote:
>> On 4/16/2025 8:21 PM, Konrad Dybcio wrote:
>>>>        .max_tick_count = 0xFFFFFU,
>>>>    };
>>>>    +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>>> double space> +                    const struct qcom_wdt_match_data *data)
>>>
>>> Please align this
>>
>> Ack.
>>
>>
>>>> +{
>>>> +    struct regmap *imem;
>>>> +    unsigned int val;
>>>> +    int ret;
>>>> +
>>>> +    imem = syscon_regmap_lookup_by_compatible(data->compatible);
>>> I still think nvmem could be better here, as it allows to plug in
>>> more magic values
>>
>> Sure, I will be on vacation next week. I shall check on how to use nvmem here once I'm back.
> We talked offline and I learned that IMEM is not in fact non-volatile, so
> while good looking, the nvram APIs are probably not really fit for it.
>
> Let's continue with the syscon approach.


Thanks Konrad for the discussion.


>
> Konrad

