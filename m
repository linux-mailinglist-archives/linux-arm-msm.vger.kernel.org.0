Return-Path: <linux-arm-msm+bounces-96897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCCYL9kjsWkOrQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:12:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ED025EBC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94FE5334A308
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB98C3BD24D;
	Wed, 11 Mar 2026 08:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJj3wygD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="huR3CAPe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B613BD235
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216146; cv=none; b=ST8VdCJ9ouQW5o5JQIAUkEIZXrEMNE1pOIwarm0cy3lDs+abv4dUdEilE6xa+8fiqH+p5IOa4AJlxyEyRyhLSmbPResea+JJNNhZukHjmY2920VpYe45F4m4yshiScKY5dvMhTJBTjq1UG11BskckcEAdWAhUNqmrgu6LO2qWsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216146; c=relaxed/simple;
	bh=Gg2qVP/JCVPl7aHjxZBNC1RDdt08bzMZOcve22bp/BI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZfgpLs2TDt+Kt3oiPnhDdxeozTYKQTPuP67X1W6ZVNYTPTOtZNaF/EeaLWI027k9O7kjkdMBPb7fnZbRtIRyPNiuajIzOQdz0t0gbG+8T9lFl1sqZ0jb7S6O8g70jTnHr2q7KV6Q7c2hqsfnL7GdCBkBdiS0hVxN4qmyCSknuTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJj3wygD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=huR3CAPe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B7jC0s1266034
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eMfOY7NzlzKtupFbA7DicH2UWX1JZ0T9VjBL0owqntE=; b=KJj3wygDG9osWDty
	7BzpPqKR5udxTbnudsyQtQH2uCRi/68vlZzp/agAPHhEt+boKnsi6h4rZC0cqvBH
	b0W2HJFVHNxvj4XGOHlWVLSdADBynTHB0sa+tf7Rj/60fDWR9NaG66iqKQzx+OJs
	zprfruz4QgUmxc+oTBJlzOThDhql45No3kg+z5Yq5mUY4hnNRuwVGxj/LYNEp44s
	l8nOtoZ/hdbBRK0EUf0ZnqGDLhWv7oDiGCXBty5fsnuUihOdGMfjwItKqKw4+7Fb
	J2HBQ+pkLWTG8mZH4/xcD8JruUHvCYy8az/lniPvlc8Lf+T3nL3M74owGyOhxLLI
	sgRX5w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctpkfjx16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:02:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aeaabedbc3so73628435ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773216135; x=1773820935; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eMfOY7NzlzKtupFbA7DicH2UWX1JZ0T9VjBL0owqntE=;
        b=huR3CAPeaID2e92SC4if1etx1XVgLF3CE+jE/GwoayJVfKWMxo7VSnQPUGhTMc2LPk
         Iszo7uufWzjWY+papDhF9rEBcCsGpSxm3Oy2CJeLjC9Yjd1eY3dAFlOYX6kX73mDwK+H
         kjv3trNerpdHcyFdqq4iEV+gecr6rK140iNpgyDTIagf79tpoMvaVm2Qvv6c2Y4hgZbB
         U7/HsuE1THqm9V6CDB91Uz1SZ4XBmhbsgESluTMBCqzHTa9g4hH75xYbZzdRfXfUJnjZ
         oWDhMU34fJN3xM10Dd/k+larmVBOq/xYQ3rePBQD0SKApmn0HBDd6GEbwIldeEAPFp4t
         rFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773216135; x=1773820935;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eMfOY7NzlzKtupFbA7DicH2UWX1JZ0T9VjBL0owqntE=;
        b=erBCLgyvzGpMPqZu9U1OFdwVOUauQxanmNBEE40R4p48qKFIbamHF+4ZILYN93HEa4
         AE/yh/c6OIPOZJNnEnUEX0LyBg1EfEtvlB7NPgbkB3cQLZ2j6XT/pSedw4nUT9xAR+SS
         5FXLAIlaBxT4+QXsyF3OgGNxV08/52MDjbJMJzfwQtHzPiJoAdnme/7iUyONrsTEtOOB
         4qwaE/CdNmSTsakrmDRKj2+ejSC+hFhxiWYV52HTnwJnILCl7MwynmcSUMywZe6+KcZA
         cCfQHrd2tAITEmy1xELevmVQpFlP0YM3EQfmMJavHz50qBQcNcvx7HTtkSuevrwP6COe
         YJ+g==
X-Forwarded-Encrypted: i=1; AJvYcCW49D3L4txxgkMgXmqworrgLbmX3yupIfqViSVqeOHpdV7sauyKgK4M5v7TjjPVRYwf2GE6mWs4NYopwagx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/G+9hKzbjEqCR6D9On3ckQ+tZPaz2vS+s9djE7S4Zrz2ZAxoh
	Y19ET4sMGRQkkNXtjtKPf0oWAwwr+tS77Szz5QBpePK3BucrQt8mFu4WGZpV5zQSmBfAAZmWfhb
	PD+Lq7qGMq92jKn5U/S7fukBwruCO8F7G0SdR8Yy/oP7TEQQs+UUGGe5SLuxA7yQqMaawRsQ1w5
	3m
X-Gm-Gg: ATEYQzx1wDWBqk6K7ZL133xN6l9BYnEY9Tp6UF+aoMHtEkAyVn/96uqi18avOwCvEvX
	aHF9AG+kUtl37eTUT7GG8sz2xC2Z+9jxcbLDJr3HX2yfIuEk+4LBNQ9ueve7R/HukNKhYcVbF9s
	TS+fcchpzVmfo4zCi4yvfBC/W5TS66kChYo26iZ3OX3rbFI6qH48eep/kzgy6rad8fRshIf4JHj
	kPE2Qy0w3J+s5IGi4lUhXaNAL0EOOihmF5sb/ISNWmw3HXkQGHy0TDw024xI2tqkcu88FHJ2K23
	YmeMTKbYl8LdFno/8c0Ah3XXRa/i2r9yApcW1+kD196KZq0vBpbraSbuZJPuym22+XyPbtUkstU
	39GJuyn4gLwC51tZE7kuvZhXGhGCHeHUAe8NV5/fUyUG61cfxt+AWquh8hoElcKU2u9PikV6Etl
	V71zOpwWs3OCk=
X-Received: by 2002:a17:902:f602:b0:2ae:4cd9:7196 with SMTP id d9443c01a7336-2aeae85b2eemr18372795ad.29.1773216134518;
        Wed, 11 Mar 2026 01:02:14 -0700 (PDT)
X-Received: by 2002:a17:902:f602:b0:2ae:4cd9:7196 with SMTP id d9443c01a7336-2aeae85b2eemr18372195ad.29.1773216133725;
        Wed, 11 Mar 2026 01:02:13 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae361326sm14228665ad.70.2026.03.11.01.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 01:02:13 -0700 (PDT)
Message-ID: <63ebce79-d9f3-43f5-8186-5240bc112fa0@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 16:02:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 6/7] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
 <20260309-enable-byte-cntr-for-ctcu-v14-6-c08823e5a8e6@oss.qualcomm.com>
 <f45b9679-857f-4bb2-b683-cd5701ea16de@arm.com>
 <bc05d278-fe28-4503-ac99-fb28904e7343@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <bc05d278-fe28-4503-ac99-fb28904e7343@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CRRNagYXNlgO9QEdgw-BiUqSpzquOUgV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA2NiBTYWx0ZWRfX2G4pzQuIWfQ9
 NIwWnERtQmwQocDAbY5ub2uylkK/uwh9S9fbGd32yK/m2+yd6208DqkOx0z63PGUY65T62OZitn
 SSkvMyzoGEqx7jBHv0HJqklnFSyBTDz49QtIVaz6fo+OyaPUU4MVK8K6kNOrCcC1PhAeUe8c1z0
 yC6t4rAzoj4QaNc/VylIgU4U0uEKj7PxvzZgZ3nldekaFesBaie4RjfQylhbSFXGofTjsL/MrIy
 IkrB+lfPCQiKwsoOPumMz567/Ejb2JHP6tZAURS6XuG4HoNCyUNuHEWQ2EeyV/byAZOE+frg39Q
 p2Mq0zQVmkm0ShmotGiizB5x1ACZCVDb5bWh+NKkiehabm0Np1pHSxoGFM+Y3HPxfBZm0QQKueI
 Uj+CoKnCeXwI4SpptExRX31b4URI4uAZLEOsMVi4ouDNnsdR5Fz+uLjIrDcaC/ZwHKXHb6cJETE
 UnBT2QkLW6Rd5DFpXxQ==
X-Proofpoint-ORIG-GUID: CRRNagYXNlgO9QEdgw-BiUqSpzquOUgV
X-Authority-Analysis: v=2.4 cv=Gq5PO01C c=1 sm=1 tr=0 ts=69b12187 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0bfajxqiIO4Y75MwKN8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110066
X-Rspamd-Queue-Id: 21ED025EBC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96897-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,desc.dev:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/10/2026 11:01 AM, Jie Gan wrote:
> 
> 
> On 3/9/2026 8:43 PM, Suzuki K Poulose wrote:
>> On 09/03/2026 09:47, Jie Gan wrote:
>>> The byte-cntr function provided by the CTCU device is used to 
>>> transfer data
>>> from the ETR buffer to the userspace. An interrupt is triggered if 
>>> the data
>>> size exceeds the threshold set in the BYTECNTRVAL register. The 
>>> interrupt
>>> handler counts the number of triggered interruptions and the read 
>>> function
>>> will read the data from the synced ETR buffer.
>>>
>>> Switching the sysfs_buf when current buffer is full or the timeout is
>>> triggered and resets rrp and rwp registers after switched the buffer.
>>> The synced buffer will become available for reading after the switch.
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
>>>   drivers/hwtracing/coresight/Makefile               |   2 +-
>>>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 351 ++++++++++ 
>>> + ++++++++++
>>>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 103 +++++-
>>>   drivers/hwtracing/coresight/coresight-ctcu.h       |  76 ++++-
>>>   drivers/hwtracing/coresight/coresight-tmc-core.c   |   8 +-
>>>   drivers/hwtracing/coresight/coresight-tmc-etr.c    |  18 ++
>>>   drivers/hwtracing/coresight/coresight-tmc.h        |   4 +
>>>   8 files changed, 555 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>>> ctcu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>>> new file mode 100644
>>> index 000000000000..6ff1708fb944
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>>> @@ -0,0 +1,8 @@
>>> +What:           /sys/bus/coresight/devices/<ctcu-name>/ 
>>> irq_threshold[0:1]
>>> +Date:           March 2026
>>> +KernelVersion:  7.1
>>> +Contact:        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>; 
>>> Jinlong Mao <jinlong.mao@oss.qualcomm.com>; Jie Gan 
>>> <jie.gan@oss.qualcomm.com>
>>> +Description:
>>> +        (RW) Configure the byte-cntr IRQ register for the specified 
>>> ETR device
>>> +        based on its port number. An interrupt is generated when the 
>>> data size
>>> +        exceeds the value set in the IRQ register.
>>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/ 
>>> hwtracing/ coresight/Makefile
>>> index ab16d06783a5..821a1b06b20c 100644
>>> --- a/drivers/hwtracing/coresight/Makefile
>>> +++ b/drivers/hwtracing/coresight/Makefile

[...]

>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>>> +    if (byte_cntr_data->reading) {
>>> +        ret = -EBUSY;
>>> +        goto out_unlock;
>>> +    }
>>> +
>>> +    byte_cntr_data->reading = true;
>>> +    raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>>
>> All of this can be avoided by retaining the etr_sysf_ops in TMC-> and
>> calling into the CTCU after basic checks.
> 
> Understood. we can rely on the tmc->reading check, jump to CTCU ops 
> after proper check.

Hi Suzuki,

I think we need a new flag to control the byte-cntr read work. Here is 
the reason:

For normal tmc ETR read flow:
tmc_read_prepare -> tmc_read -> tmc_read_unprepare -> tmc_etr_disable_hw

We dont allow disable the ETR device while reading (drvdata->reading).

For byte-cntr continously read flow:

byte-cntr-start -> tmc_read_prepare -> tmc_read (continously read data 
until ETR is disabled or is stopped by userspace) -> tmc_etr_disable_hw 
->tmc_read_unprepare.

With drvdata->reading = true. We cant disable the ETR device. so the 
issue happened.

We can jump to the 
tmc_read_prepare_byte_cntr/tmc_read_unprepare_byte_cntr from 
tmc_read_prepare_etr/tmc_read_unprepare_etr, but we must skip to 
set/reset drvdata->reading.

Thanks,
Jie

> 
>>
>>> +    /* Setup an available etr_buf_list for byte-cntr */
>>> +    ret = tmc_create_etr_buf_list(drvdata, 2);
>>> +    if (ret)
>>> +        goto out;
>>> +
>>> +    raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>>> +    atomic_set(&byte_cntr_data->irq_cnt, 0);
>>> +    /* Configure the byte-cntr register to enable IRQ */
>>> +    ctcu_cfg_byte_cntr_reg(drvdata, byte_cntr_data->thresh_val,
>>> +                   byte_cntr_data->irq_ctrl_offset);
>>
>> Is there no way of going back to the ctcu_drvdata from byte_cntr_data ?
>> For a starter, we could easily store the ctcu_drvdata in byte_cntr_data
>> and always write straight to the device, rather than always going to the
>> ETR drvdata in ctcu_cfg_byte_cntr_reg() ?
> 
> Understood, will fix it.
> 
>>
>>> +    enable_irq_wake(byte_cntr_data->irq);
>>> +    byte_cntr_data->total_size = 0;
>>> +
>>> +out_unlock:
>>> +    raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>>> +
>>> +out:
>>> +    return ret;
>>> +}
>>> +
>>> +static int ctcu_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata)
>>
>> Same as above. name
> 
> ditto.
> 
>>
>>> +{
>>> +    struct device *dev = &drvdata->csdev->dev;
>>> +    struct ctcu_byte_cntr *byte_cntr_data;
>>> +    unsigned long flags;
>>> +
>>> +    byte_cntr_data = ctcu_get_byte_cntr_data(drvdata);
>>> +    if (!byte_cntr_data)
>>> +        return -EINVAL;
>>> +
>>> +    raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>>> +    /* Configure the byte-cntr register to disable IRQ */
>>> +    ctcu_cfg_byte_cntr_reg(drvdata, 0, byte_cntr_data- 
>>> >irq_ctrl_offset);
>>
>>
>>> +    disable_irq_wake(byte_cntr_data->irq);
>>> +    byte_cntr_data->reading = false;
>>> +    byte_cntr_data->reading_data = false;
>>> +    drvdata->buf_node = NULL;
>>
>>
>>> +    /* Restore the original sysfs_ops */
>>> +    drvdata->sysfs_ops = &etr_sysfs_ops;
>>
>> Please see if you can avoid it.
> 
> Sure, will check other solution.
> 
>>
>>> +    raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>>> +    dev_dbg(dev, "send data total size:%llu bytes\n", 
>>> byte_cntr_data- >total_size);
>>> +    tmc_clean_etr_buf_list(drvdata);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +const struct tmc_sysfs_ops byte_cntr_sysfs_ops = {
>>> +    .read_prepare    = ctcu_read_prepare_byte_cntr,
>>> +    .read_unprepare    = ctcu_read_unprepare_byte_cntr,
>>> +    .get_trace_data    = ctcu_byte_cntr_get_data,
>>> +};
>>> +
>>> +/* Start the byte-cntr function when the path is enabled. */
>>> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct 
>>> coresight_path *path)
>>> +{
>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>> +    struct coresight_device *sink = coresight_get_sink(path);
>>> +    struct tmc_drvdata *tmc_drvdata = dev_get_drvdata(sink- 
>>> >dev.parent);
>>> +    struct ctcu_byte_cntr *byte_cntr_data;
>>> +    int port_num;
>>> +
>>> +    port_num = coresight_get_in_port(sink, csdev);
>>> +    if (port_num < 0)
>>> +        return;
>>> +
>>> +    byte_cntr_data = &drvdata->byte_cntr_data[port_num];
>>
>> instance 2
>>
>>> +    /* Don't start byte-cntr function when threshold is not set. */
>>> +    if (!byte_cntr_data->thresh_val || byte_cntr_data->enable)
>>> +        return;
>>> +
>>> +    guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
>>> +    byte_cntr_data->enable = true;
>>> +    byte_cntr_data->reading_data = false;
>>> +    /* Replace with byte-cntr's sysfs_ops */
>>> +    tmc_drvdata->sysfs_ops = &byte_cntr_sysfs_ops;
>>
>> Why are we hacking this ? This looks *very ugly* and we are doing this 
>> without any locks at the tmc-etr driver !!! ?? Could we not call out
>> from the etr_sysf_ops into the CTCU ops based some checks ?
>> Anyways, please don't change anything in the tmc_drvdata from this
>> driver, especially not the "operations".
>>
> 
> Understood. Will take care of it in next version.
> 
>> Also the locking seems inconsistent. Here we use byte_cntr_data->lock.
>> But in ctcu_read_unprepare_byte_cntr(), we use the TMC-ETR 
>> spinlock :facepalm:
> 
> Sorry for the hack solution here. Will fix it.
> 
> Thanks,
> Jie
> 
>>
>>
>>
>>> +}
>>> +
>>> +/* Stop the byte-cntr function when the path is disabled. */
>>> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct 
>>> coresight_path *path)
>>> +{
>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>> +    struct coresight_device *sink = coresight_get_sink(path);
>>> +    struct ctcu_byte_cntr *byte_cntr_data;
>>> +    int port_num;
>>> +
>>> +    if (coresight_get_mode(sink) == CS_MODE_SYSFS)
>>> +        return;
>>> + +    port_num = coresight_get_in_port(sink, csdev);
>>> +    if (port_num < 0)
>>> +        return;
>>> +
>>> +    byte_cntr_data = &drvdata->byte_cntr_data[port_num];
>>
>> instance 3
>>
>>
>>
>>
>>> +    guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
>>> +    byte_cntr_data->enable = false;
>>> +}
>>> +
>>> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata 
>>> *drvdata, int etr_num)
>>> +{
>>> +    struct ctcu_byte_cntr *byte_cntr_data;
>>> +    struct device_node *nd = dev->of_node;
>>> +    int irq_num, ret, i;
>>> +
>>> +    for (i = 0; i < etr_num; i++) {
>>> +        byte_cntr_data = &drvdata->byte_cntr_data[i];
>>> +        irq_num = of_irq_get(nd, i);
>>> +        if (irq_num < 0) {
>>> +            dev_err(dev, "Failed to get IRQ from DT for port%d\n", i);
>>> +            continue;
>>> +        }
>>> +
>>> +        ret = devm_request_irq(dev, irq_num, byte_cntr_handler,
>>> +                       IRQF_TRIGGER_RISING | IRQF_SHARED,
>>> +                       dev_name(dev), byte_cntr_data);
>>> +        if (ret) {
>>> +            dev_err(dev, "Failed to register IRQ for port%d\n", i);
>>> +            continue;
>>> +        }
>>> +
>>> +        byte_cntr_data->irq = irq_num;
>>> +        init_waitqueue_head(&byte_cntr_data->wq);
>>> +        raw_spin_lock_init(&byte_cntr_data->spin_lock);
>>> +    }
>>> +}
>>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/ 
>>> drivers/hwtracing/coresight/coresight-ctcu-core.c
>>> index e8720026c9e3..60f1db3ab70d 100644
>>> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>>> @@ -15,6 +15,7 @@
>>>   #include <linux/platform_device.h>
>>>   #include <linux/pm_runtime.h>
>>>   #include <linux/slab.h>
>>> +#include <linux/sizes.h>
>>>   #include "coresight-ctcu.h"
>>>   #include "coresight-priv.h"
>>> @@ -43,17 +44,21 @@
>>>   #define CTCU_ATID_REG_BIT(traceid)    (traceid % 32)
>>>   #define CTCU_ATID_REG_SIZE        0x10
>>> +#define CTCU_ETR0_IRQCTRL               0x6c
>>> +#define CTCU_ETR1_IRQCTRL               0x70
>>>   #define CTCU_ETR0_ATID0            0xf8
>>>   #define CTCU_ETR1_ATID0            0x108
>>>   static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
>>>       {
>>> -        .atid_offset    = CTCU_ETR0_ATID0,
>>> -        .port_num    = 0,
>>> +        .atid_offset        = CTCU_ETR0_ATID0,
>>> +        .irq_ctrl_offset    = CTCU_ETR0_IRQCTRL,
>>> +        .port_num        = 0,
>>>       },
>>>       {
>>> -        .atid_offset    = CTCU_ETR1_ATID0,
>>> -        .port_num    = 1,
>>> +        .atid_offset        = CTCU_ETR1_ATID0,
>>> +        .irq_ctrl_offset    = CTCU_ETR1_IRQCTRL,
>>> +        .port_num        = 1,
>>>       },
>>>   };
>>> @@ -62,6 +67,88 @@ static const struct ctcu_config sa8775p_cfgs = {
>>>       .num_etr_config    = ARRAY_SIZE(sa8775p_etr_cfgs),
>>>   };
>>> +void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, 
>>> u32 offset)
>>> +{
>>> +    CS_UNLOCK(drvdata->base);
>>> +    ctcu_writel(drvdata, val, offset);
>>> +    CS_LOCK(drvdata->base);
>>> +}
>>> +
>>> +static ssize_t irq_threshold_show(struct device *dev,
>>> +                  struct device_attribute *attr,
>>> +                  char *buf)
>>> +{
>>> +    struct ctcu_byte_cntr_irq_attribute *irq_attr =
>>> +        container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>> +    u8 port = irq_attr->port;
>>> +
>>> +    if (!drvdata->byte_cntr_data[port].irq_ctrl_offset)
>>> +        return -EINVAL;
>>> +
>>> +    return sysfs_emit(buf, "%u\n",
>>> +            (unsigned int)drvdata->byte_cntr_data[port].thresh_val);
>>> +}
>>> +
>>> +static ssize_t irq_threshold_store(struct device *dev,
>>> +                   struct device_attribute *attr,
>>> +                   const char *buf,
>>> +                   size_t size)
>>> +{
>>> +    struct ctcu_byte_cntr_irq_attribute *irq_attr =
>>> +        container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>> +    u8 port = irq_attr->port;
>>> +    unsigned long val;
>>> +
>>> +    if (kstrtoul(buf, 0, &val))
>>> +        return -EINVAL;
>>> +
>>> +    /* Threshold 0 disables the interruption. */
>>> +    guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
>>> +    /* A small threshold will result in a large number of 
>>> interruptions */
>>> +    if (val && val < SZ_4K)
>>> +        return -EINVAL;
>>> +
>>> +    if (drvdata->byte_cntr_data[port].irq_ctrl_offset)
>>> +        drvdata->byte_cntr_data[port].thresh_val = val;
>>> +
>>> +    return size;
>>> +}
>>> +
>>> +static umode_t irq_threshold_is_visible(struct kobject *kobj,
>>> +                    struct attribute *attr, int n)
>>> +{
>>> +    struct device_attribute *dev_attr =
>>> +        container_of(attr, struct device_attribute, attr);
>>> +    struct ctcu_byte_cntr_irq_attribute *irq_attr =
>>> +        container_of(dev_attr, struct ctcu_byte_cntr_irq_attribute, 
>>> attr);
>>> +    struct device *dev = kobj_to_dev(kobj);
>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>> +    u8 port = irq_attr->port;
>>> +
>>> +    if (drvdata && drvdata->byte_cntr_data[port].irq_ctrl_offset)
>>> +        return attr->mode;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static struct attribute *ctcu_attrs[] = {
>>> +    ctcu_byte_cntr_irq_rw(0),
>>> +    ctcu_byte_cntr_irq_rw(1),
>>> +    NULL,
>>> +};
>>> +
>>> +static struct attribute_group ctcu_attr_grp = {
>>> +    .attrs = ctcu_attrs,
>>> +    .is_visible = irq_threshold_is_visible,
>>> +};
>>> +
>>> +static const struct attribute_group *ctcu_attr_grps[] = {
>>> +    &ctcu_attr_grp,
>>> +    NULL,
>>> +};
>>> +
>>>   static void ctcu_program_atid_register(struct ctcu_drvdata 
>>> *drvdata, u32 reg_offset,
>>>                          u8 bit, bool enable)
>>>   {
>>> @@ -140,11 +227,15 @@ static int ctcu_set_etr_traceid(struct 
>>> coresight_device *csdev, struct coresight
>>>   static int ctcu_enable(struct coresight_device *csdev, enum cs_mode 
>>> mode,
>>>                  struct coresight_path *path)
>>>   {
>>> +    ctcu_byte_cntr_start(csdev, path);
>>> +
>>>       return ctcu_set_etr_traceid(csdev, path, true);
>>>   }
>>>   static int ctcu_disable(struct coresight_device *csdev, struct 
>>> coresight_path *path)
>>>   {
>>> +    ctcu_byte_cntr_stop(csdev, path);
>>> +
>>>       return ctcu_set_etr_traceid(csdev, path, false);
>>>   }
>>> @@ -195,7 +286,10 @@ static int ctcu_probe(struct platform_device *pdev)
>>>               for (i = 0; i < cfgs->num_etr_config; i++) {
>>>                   etr_cfg = &cfgs->etr_cfgs[i];
>>>                   drvdata->atid_offset[i] = etr_cfg->atid_offset;
>>> +                drvdata->byte_cntr_data[i].irq_ctrl_offset =
>>> +                    etr_cfg->irq_ctrl_offset;
>>>               }
>>> +            ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
>>>           }
>>>       }
>>> @@ -209,6 +303,7 @@ static int ctcu_probe(struct platform_device *pdev)
>>>       desc.dev = dev;
>>>       desc.ops = &ctcu_ops;
>>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>>> +    desc.groups = ctcu_attr_grps;
>>>       raw_spin_lock_init(&drvdata->spin_lock);
>>>       drvdata->csdev = coresight_register(&desc);
>>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/ 
>>> hwtracing/coresight/coresight-ctcu.h
>>> index e9594c38dd91..c52cf6a33d2e 100644
>>> --- a/drivers/hwtracing/coresight/coresight-ctcu.h
>>> +++ b/drivers/hwtracing/coresight/coresight-ctcu.h
>>> @@ -5,19 +5,26 @@
>>>   #ifndef _CORESIGHT_CTCU_H
>>>   #define _CORESIGHT_CTCU_H
>>> +
>>> +#include <linux/time.h>
>>>   #include "coresight-trace-id.h"
>>>   /* Maximum number of supported ETR devices for a single CTCU. */
>>>   #define ETR_MAX_NUM    2
>>> +#define BYTE_CNTR_TIMEOUT    (3 * HZ)
>>> +
>>>   /**
>>>    * struct ctcu_etr_config
>>>    * @atid_offset:    offset to the ATID0 Register.
>>> - * @port_num:        in-port number of CTCU device that connected to 
>>> ETR.
>>> + * @port_num:        in-port number of the CTCU device that 
>>> connected to ETR.
>>> + * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
>>> + * @irq_name:           IRQ name in dt node.
>>>    */
>>>   struct ctcu_etr_config {
>>>       const u32 atid_offset;
>>>       const u32 port_num;
>>> +    const u32 irq_ctrl_offset;
>>>   };
>>>   struct ctcu_config {
>>> @@ -25,15 +32,68 @@ struct ctcu_config {
>>>       int num_etr_config;
>>>   };
>>> -struct ctcu_drvdata {
>>> -    void __iomem        *base;
>>> -    struct clk        *apb_clk;
>>> -    struct device        *dev;
>>> -    struct coresight_device    *csdev;
>>> +/**
>>> + * struct ctcu_byte_cntr
>>> + * @enable:        indicates that byte_cntr function is enabled or not.
>>> + * @reading:        indicates that byte-cntr reading is started.
>>> + * @reading_data:    indicates that byte-cntr is reading data from 
>>> the buffer.
>>> + * @thresh_val:        threshold to trigger a interruption.
>>> + * @total_size:        total size of the transferred data.
>>> + * @irq:        allocated number of the IRQ.
>>> + * @irq_cnt:        IRQ count number for triggered interruptions.
>>> + * @wq:            waitqueue for reading data from ETR buffer.
>>> + * @spin_lock:        spinlock of byte_cntr_data.
>>> + * @irq_ctrl_offset:    offset to the BYTECNTVAL Register.
>>> + */
>>> +struct ctcu_byte_cntr {
>>> +    bool            enable;
>>> +    bool                    reading;
>>> +    bool            reading_data;
>>> +    u32            thresh_val;
>>> +    u64            total_size;
>>> +    int            irq;
>>> +    atomic_t        irq_cnt;
>>> +    wait_queue_head_t    wq;
>>>       raw_spinlock_t        spin_lock;
>>> -    u32            atid_offset[ETR_MAX_NUM];
>>> +    u32            irq_ctrl_offset;
>>> +};
>>> +
>>> +struct ctcu_drvdata {
>>> +    void __iomem            *base;
>>> +    struct clk            *apb_clk;
>>> +    struct device            *dev;
>>> +    struct coresight_device        *csdev;
>>> +    struct ctcu_byte_cntr        byte_cntr_data[ETR_MAX_NUM];
>>> +    raw_spinlock_t            spin_lock;
>>> +    u32                atid_offset[ETR_MAX_NUM];
>>>       /* refcnt for each traceid of each sink */
>>> -    u8            traceid_refcnt[ETR_MAX_NUM] 
>>> [CORESIGHT_TRACE_ID_RES_TOP];
>>> +    u8                traceid_refcnt[ETR_MAX_NUM] 
>>> [CORESIGHT_TRACE_ID_RES_TOP];
>>>   };
>>> +/**
>>> + * struct ctcu_irq_thresh_attribute
>>> + * @attr:    The device attribute.
>>> + * @idx:    port number.
>>> + */
>>> +struct ctcu_byte_cntr_irq_attribute {
>>> +    struct device_attribute    attr;
>>> +    u8            port;
>>> +};
>>> +
>>> +#define ctcu_byte_cntr_irq_rw(port)                    \
>>> +    (&((struct ctcu_byte_cntr_irq_attribute[]) {            \
>>> +       {                                \
>>> +        __ATTR(irq_threshold##port, 0644, irq_threshold_show,    \
>>> +        irq_threshold_store),                    \
>>> +        port,                            \
>>> +       }                                \
>>> +    })[0].attr.attr)
>>> +
>>> +void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, 
>>> u32 offset);
>>> +
>>> +/* Byte-cntr functions */
>>> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct 
>>> coresight_path *path);
>>> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct 
>>> coresight_path *path);
>>> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata 
>>> *drvdata, int port_num);
>>> +
>>>   #endif
>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/ 
>>> drivers/hwtracing/coresight/coresight-tmc-core.c
>>> index 110eedde077f..948ea864f2a1 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>>> @@ -293,7 +293,10 @@ static ssize_t tmc_read(struct file *file, char 
>>> __user *data, size_t len,
>>>           return -EFAULT;
>>>       }
>>> -    *ppos += actual;
>>> +    if (drvdata->buf_node)
>>> +        drvdata->buf_node->pos += actual;
>>> +    else
>>> +        *ppos += actual;
>>>       dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
>>>       return actual;
>>> @@ -748,11 +751,12 @@ static const struct tmc_sysfs_ops etb_sysfs_ops 
>>> = {
>>>       .get_trace_data    = tmc_etb_get_sysfs_trace,
>>>   };
>>> -static const struct tmc_sysfs_ops etr_sysfs_ops = {
>>> +const struct tmc_sysfs_ops etr_sysfs_ops = {
>>>       .read_prepare    = tmc_read_prepare_etr,
>>>       .read_unprepare    = tmc_read_unprepare_etr,
>>>       .get_trace_data    = tmc_etr_get_sysfs_trace,
>>>   };
>>> +EXPORT_SYMBOL_GPL(etr_sysfs_ops);
>>>   static int __tmc_probe(struct device *dev, struct resource *res)
>>>   {
>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>>> index f4223215ef8d..8896fb7a9ed3 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>> @@ -1185,6 +1185,10 @@ ssize_t tmc_etr_get_sysfs_trace(struct 
>>> tmc_drvdata *drvdata,
>>>       ssize_t actual = len;
>>>       struct etr_buf *etr_buf = drvdata->sysfs_buf;
>>> +    /* Reading the buffer from the buf_node if it exists*/
>>> +    if (drvdata->buf_node)
>>> +        etr_buf = drvdata->buf_node->sysfs_buf;
>>> +
>>>       if (pos + actual > etr_buf->len)
>>>           actual = etr_buf->len - pos;
>>>       if (actual <= 0)
>>> @@ -1248,6 +1252,20 @@ static void __tmc_etr_disable_hw(struct 
>>> tmc_drvdata *drvdata)
>>>   }
>>> +/**
>>> + * tmc_etr_enable_disable_hw - enable/disable the ETR hw.
>>> + * @drvdata:    drvdata of the TMC device.
>>> + * @enable:    indicates enable/disable.
>>> + */
>>> +void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool 
>>> enable)
>>> +{
>>> +    if (enable)
>>> +        __tmc_etr_enable_hw(drvdata);
>>> +    else
>>> +        __tmc_etr_disable_hw(drvdata);
>>> +}
>>> +EXPORT_SYMBOL_GPL(tmc_etr_enable_disable_hw);
>>> +
>>>   void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>>>   {
>>>       __tmc_etr_disable_hw(drvdata);
>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>>> hwtracing/coresight/coresight-tmc.h
>>> index aaa443abe8e9..183c649b982c 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>>> @@ -260,6 +260,7 @@ struct etr_buf_node {
>>>    *         Used by ETR/ETF.
>>>    * @etr_buf_list: List that is used to manage allocated etr_buf.
>>>    * @sysfs_ops:    Read operations for the sysfs mode.
>>> + * @buf_node:    Available buffer_node for byte-cntr reading.
>>>    */
>>>   struct tmc_drvdata {
>>>       struct clk        *atclk;
>>> @@ -292,6 +293,7 @@ struct tmc_drvdata {
>>>       struct tmc_resrv_buf    crash_mdata;
>>>       struct list_head        etr_buf_list;
>>>       const struct tmc_sysfs_ops    *sysfs_ops;
>>> +    struct etr_buf_node    *buf_node;
>>>   };
>>>   /**
>>> @@ -371,6 +373,7 @@ void tmc_etr_disable_hw(struct tmc_drvdata 
>>> *drvdata);
>>>   extern const struct coresight_ops tmc_etr_cs_ops;
>>>   ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
>>>                   loff_t pos, size_t len, char **bufpp);
>>> +extern const struct tmc_sysfs_ops etr_sysfs_ops;
>>>   #define TMC_REG_PAIR(name, lo_off, hi_off)                \
>>> @@ -480,5 +483,6 @@ struct etr_buf *tmc_etr_get_buffer(struct 
>>> coresight_device *csdev,
>>>   extern const struct attribute_group coresight_etr_group;
>>>   void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
>>>   int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int 
>>> num_nodes);
>>> +void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool 
>>> enable);
>>>   #endif
>>>
>>
> 
> 


