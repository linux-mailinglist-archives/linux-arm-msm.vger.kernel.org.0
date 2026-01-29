Return-Path: <linux-arm-msm+bounces-91111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG/4KMfyemmXAAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 06:40:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 007F1ABF7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 06:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 539ED300EA91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 05:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439EC2E6CCD;
	Thu, 29 Jan 2026 05:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ed2IbzVp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQ9PF7Da"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA892C11E6
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769665220; cv=none; b=nqocEkTaJI5lZGjiA0jsqXzojGyS2qeJUXGrL65vmnN0e6rZOTlFY8n+xYlZCgsNPbuGn2DhbByhHEnTbrsFCs2ioHSqczHIbiNIC20n6H0n2zDB5Oavlpm+Qkrc7Theag2AoVw+POHjjNvqNIW+sQQI1aeTdPbvpT3t6XL3S+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769665220; c=relaxed/simple;
	bh=zittGDaEvIjaRcE3Cect8ja65nAnr6c5M4dtK4G4lJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sUa9bm/urdF7nVaIhO6ckXgRaUXRjv9hA8Rah4zM+Z1YVeCUVnLZ0yqizYY0ql5CKQHBHmezJ8uq+tKErSeDSBMl/OctSuYdLraWBy+WPMpYxv6XKTRe7yzxhkuEkgZ9PA0vXbw3f0GyH3tB5qUMGUch/NILWVZcQVWU84w7YB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ed2IbzVp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQ9PF7Da; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2ov7I2583571
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+HA2CpCAmJL7x0jYx/L7D8r9FT2aT8ALDvJJGHLIlSk=; b=ed2IbzVp1v7ywrMZ
	RcZTJVJlWvRcxM7d1sb4lb9PLSnWMX+j5tUkBLbOrmyysKfXopnVzh/NPfIl/wKa
	VXblJ9Co6/qb/A1y/BwJ9EPA0i4jqudI0+gO7atJoFYvNPU8i+QC+blfBamQLFAy
	TnvxMQOEvdASx3186utcshWxQvsE2SfOYXcxFY5aVd0EQD4nAQ7PDvO4HU5VJB57
	iDbf/uQa5526DCCigO/1b7TUWKpprbGLEjFQWGpkOhTvqHUmsO5M+teQRFUuKmn9
	n4G3lcLepZVlVjb+TgzTIwG04IT5sYekYcnp/qt5snS7FQfCyee0bNnJCPpq8SVR
	aIrl4g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bype8t3jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 05:40:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34e5a9f0d6aso654951a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 21:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769665217; x=1770270017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+HA2CpCAmJL7x0jYx/L7D8r9FT2aT8ALDvJJGHLIlSk=;
        b=dQ9PF7DaF01bg3zkeBXaqVu+LHZQXb9VuXeAtRThbgNirCPcbZqWd7aqF656dlejya
         bErVln/sV2EYz/o3hMWgMBn7c5jdL9WCX0GA+d4pho7eLJ4tijRafaeEbU4JdnTRtTUj
         V1VUnqXuSJiE/X2V921gS8I2X3dB74pPg6ov4yOO7PwuRTrBF9Vq50AVGF8V+oBqaQaW
         f6GPBBlqWiyfWLX+0e7h9rz1cB8kZwjUDIpFUrnDqOYaZ2JULqowMa4itI2qy7Boxck4
         kbna7VpMBg6VfKJCndOPXDacvXR+6emwOHl2tZpz0xDHaJdNMxrem6byI1D3wBIk/CJP
         fMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769665217; x=1770270017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HA2CpCAmJL7x0jYx/L7D8r9FT2aT8ALDvJJGHLIlSk=;
        b=H4nNlxsBjCLdEZT3z3xrbXBGsy5gaN7W22rG4glK1lnzATILoWuY7V7Cb0k58jMiwD
         LgPS25pn91d3Hp/sTl2031mDENhcw+SlWBUwFvA8TMZc5f75vFTGVJkYE3Uy5QeQMzwe
         K7T4UROOdSH311vyD6XAAZze90MvA5gPbNaHFGKojLXC7BFvG7kMwvqSFxE+OslEof5W
         9qzGWQFerE/3to5OolQlpDWHuHEZBZTVBMRritdx4fySToDt9PW3Eb4nocZcwMdJmPqL
         UlR8eKpG8zsy2gVnJLAuHlbf52/MsIjSlcIKXhmpcAMEjF9aLXk/BLldCSdTqXVhYVon
         25vA==
X-Gm-Message-State: AOJu0YxrD7/bDD/iVUGBmbBJcFcVLn/Pp0ZQHEpxkhiP/YxFzTmkfFnJ
	I67nGN8+YLihdwf/7YOUhBqJUXBkEzPfTJfGfgsGUOp5lBTmN6h4+akn/Qb3WV5jk7kZNxzbedJ
	8uNzOebCdZ8/49QRtcZDbteUrdf/nZ1sK7pT4o/1/dXnD72pl4n/kTenCdRh5DeBRIfaW
X-Gm-Gg: AZuq6aJa7q01UFMqyMrxe+48BDy0FlKglbciTQUdNUuRmcWCO18kisJfFU4WngUqdCB
	TVACXTa0a1FSzMuAaB4Xb+2urDdkOxuMnfGa+xJsRcaehn8nZOufPoOUkm8cSZlw62RIZ4W5W63
	5yLJT1pOUGlWyefaRyQtVjMaT8SkkZYjH1crAPC8hOJFXvnvhic5h0j0449PnxysT6N2ALe7FNt
	AJgUSG9qmWNfCvX546A3ela6aMPqN+V9WIhyH1wgHN8QrMCD1pDwNSD0Potv2vXJhW3VXrAWu41
	GpvsE53V4yVRmTtz3tyVGKMvmCadmku0ZyuD0V/dH5War6lYdaRohh+LxPkArL1FA/i0sJ9EDDL
	OcdGtUvR90tYDSGoquX8uCLDu8ghV5gfkwGOSrDua
X-Received: by 2002:a17:90b:4d8c:b0:352:be45:1063 with SMTP id 98e67ed59e1d1-35429ac7eebmr1579448a91.10.1769665217035;
        Wed, 28 Jan 2026 21:40:17 -0800 (PST)
X-Received: by 2002:a17:90b:4d8c:b0:352:be45:1063 with SMTP id 98e67ed59e1d1-35429ac7eebmr1579410a91.10.1769665216453;
        Wed, 28 Jan 2026 21:40:16 -0800 (PST)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6427e9ce16sm3738322a12.11.2026.01.28.21.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 21:40:16 -0800 (PST)
Message-ID: <7033ebe1-34d6-4845-9745-db30ceaf3d82@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 11:10:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] thermal: Add Remote Proc cooling driver
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
        rui.zhang@intel.com, lukasz.luba@arm.com, konradybcio@kernel.org,
        amitk@kernel.org, mani@kernel.org, casey.connolly@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
 <20251223123227.1317244-2-gaurav.kohli@oss.qualcomm.com>
 <ca326a27-a6b0-4935-ae3f-417e0d769045@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <ca326a27-a6b0-4935-ae3f-417e0d769045@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dy3_FX3i1wIA2KnXrSe4ijxX1FycX2BD
X-Authority-Analysis: v=2.4 cv=C5fkCAP+ c=1 sm=1 tr=0 ts=697af2c1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=oMbCw5YLhH7N2QicEbMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAzMyBTYWx0ZWRfX8lJg9C/q+QXV
 fcQFIjgubtoLPA4Fkp8FlCGQmCkhUCP7l6Rav6Xm31MTzkLoBugb+SE10KG6/qIhbKO5a/+ZQSW
 AmuTQaMaBjNUHQovQZVr7IyvbSy2IVZE4wvVeHuAyO4Gbwec99xk2ZWk28OknN91fl+5hHo4dSb
 E2WsYvol1vvUFxx5Q99FrwoE4VNZzYbZY8iuWVdOGZLFBAuM2F+WBkxUCBjl2s8TZaRNfz7/AVc
 Gff7+MhIf5DKcsittMsGtShtPE1dqXshJr6wnc//J7o4Bcd6h+ievXHwTP72choIJUKdECzjEbH
 QPe9P6Bdnr6yv62VrkBWbomNAKlf8lf1VsCWLoSJji1knvaEdPaJxR+StwZYVy8Xwb/pRWZ4tCu
 sI+T7dyFQ/+2E3HfGXK5TcrAakLkK/sfKtLvN+OOevEKU2lYbtA//9PZZ8/uh62SiTx+Ydz6nic
 Z31KE2WWH7l+dCw7qGA==
X-Proofpoint-GUID: dy3_FX3i1wIA2KnXrSe4ijxX1FycX2BD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290033
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91111-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 007F1ABF7A
X-Rspamd-Action: no action


On 1/8/2026 5:29 PM, Zhongqiu Han wrote:
> On 12/23/2025 8:32 PM, Gaurav Kohli wrote:
>> Add a new generic driver for thermal cooling devices that control
>> remote processors (modem, DSP, etc.) through various communication
>> channels.
>>
>> This driver provides an abstraction layer between the thermal
>> subsystem and vendor-specific remote processor communication
>> mechanisms.
>>
>> Suggested-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                          |   8 ++
>>   drivers/thermal/Kconfig              |  11 ++
>>   drivers/thermal/Makefile             |   2 +
>>   drivers/thermal/remoteproc_cooling.c | 154 +++++++++++++++++++++++++++
>>   include/linux/remoteproc_cooling.h   |  52 +++++++++
>>   5 files changed, 227 insertions(+)
>>   create mode 100644 drivers/thermal/remoteproc_cooling.c
>>   create mode 100644 include/linux/remoteproc_cooling.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 679e5f11e672..c1ba87315cdf 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -25935,6 +25935,14 @@ F:    drivers/thermal/cpufreq_cooling.c
>>   F:    drivers/thermal/cpuidle_cooling.c
>>   F:    include/linux/cpu_cooling.h
>>   +THERMAL/REMOTEPROC_COOLING
>> +M:    Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> +L:    linux-pm@vger.kernel.org
>> +S:    Supported
>> +F:    drivers/thermal/remoteproc_cooling.c
>> +F:    include/linux/remoteproc_cooling.h
>> +
>> +
>>   THERMAL/POWER_ALLOCATOR
>>   M:    Lukasz Luba <lukasz.luba@arm.com>
>>   L:    linux-pm@vger.kernel.org
>> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
>> index b10080d61860..31e92be34387 100644
>> --- a/drivers/thermal/Kconfig
>> +++ b/drivers/thermal/Kconfig
>> @@ -229,6 +229,17 @@ config PCIE_THERMAL
>>           If you want this support, you should say Y here.
>>   +
>> +config REMOTEPROC_THERMAL
>> +    bool "Remote processor cooling support"
>
> Hi Gaurav,
>
> May I know any depends here?


Thanks for review.

Apologies for the late reply,  this was missed on my end.

This does not require a dependency, as error check is there for cooling 
registration api.


>
>> +    help
>> +      This implements a generic cooling mechanism for remote processors
>> +      (modem, DSP, etc.) that allows vendor-specific implementations to
>> +      register thermal cooling devices and provide callbacks for 
>> thermal
>> +      mitigation.
>> +
>> +      If you want this support, you should say Y here.
>> +
>>   config THERMAL_EMULATION
>>       bool "Thermal emulation mode support"
>>       help
>> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
>> index bb21e7ea7fc6..ae747dde54fe 100644
>> --- a/drivers/thermal/Makefile
>> +++ b/drivers/thermal/Makefile
>> @@ -34,6 +34,8 @@ thermal_sys-$(CONFIG_DEVFREQ_THERMAL) += 
>> devfreq_cooling.o
>>     thermal_sys-$(CONFIG_PCIE_THERMAL) += pcie_cooling.o
>>   +thermal_sys-$(CONFIG_REMOTEPROC_THERMAL) += remoteproc_cooling.o
>> +
>>   obj-$(CONFIG_K3_THERMAL)    += k3_bandgap.o k3_j72xx_bandgap.o
>>   # platform thermal drivers
>>   obj-y                += broadcom/
>> diff --git a/drivers/thermal/remoteproc_cooling.c 
>> b/drivers/thermal/remoteproc_cooling.c
>> new file mode 100644
>> index 000000000000..a1f948cbde0f
>> --- /dev/null
>> +++ b/drivers/thermal/remoteproc_cooling.c
>> @@ -0,0 +1,154 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Remote Processor Cooling Device
>> + *
>> + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +
>> +#include <linux/err.h>
>> +#include <linux/export.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/slab.h>
>> +#include <linux/thermal.h>
>> +
>> +#define REMOTEPROC_PREFIX        "rproc_"
>> +
>> +struct remoteproc_cooling_ops {
>> +    int (*get_max_level)(void *devdata, unsigned long *level);
>> +    int (*get_cur_level)(void *devdata, unsigned long *level);
>> +    int (*set_cur_level)(void *devdata, unsigned long level);
>> +};
> It's better to have a document to explain member?
>
> And may I know why double define here(another is in .h file)? should it
> include .h file remoteproc_cooling.h ?
>

Sure, i will add comment for each callback and will fix this double 
definition.


>
>> +
>> +/**
>> + * struct remoteproc_cdev - Remote processor cooling device
>> + * @cdev: Thermal cooling device handle
>> + * @ops: Vendor-specific operation callbacks
>> + * @devdata: Private data for vendor implementation
>> + * @np: Device tree node associated with this cooling device
>> + * @lock: Mutex to protect cooling device operations
>> + */
>> +struct remoteproc_cdev {
>> +    struct thermal_cooling_device *cdev;
>> +    const struct remoteproc_cooling_ops *ops;
>> +    void *devdata;
>> +    struct device_node *np;
>> +    struct mutex lock;
>> +};
>> +
>> +
>> +/* Thermal cooling device callbacks */
>> +
>> +static int remoteproc_get_max_state(struct thermal_cooling_device 
>> *cdev,
>> +                    unsigned long *state)
>> +{
>> +    struct remoteproc_cdev *rproc_cdev = cdev->devdata;
>> +    int ret;
>> +
>> +    if (!rproc_cdev || !rproc_cdev->ops)
>> +        return -EINVAL;
>> +
>> +    mutex_lock(&rproc_cdev->lock);
>> +    ret = rproc_cdev->ops->get_max_level(rproc_cdev->devdata, state);
>> +    mutex_unlock(&rproc_cdev->lock);
>> +
>> +    return ret;
>> +}
>> +
>> +static int remoteproc_get_cur_state(struct thermal_cooling_device 
>> *cdev,
>> +                    unsigned long *state)
>> +{
>> +    struct remoteproc_cdev *rproc_cdev = cdev->devdata;
>> +    int ret;
>> +
>> +    if (!rproc_cdev || !rproc_cdev->ops)
>> +        return -EINVAL;
>> +
>> +    mutex_lock(&rproc_cdev->lock);
>> +    ret = rproc_cdev->ops->get_cur_level(rproc_cdev->devdata, state);
>> +    mutex_unlock(&rproc_cdev->lock);
>> +
>> +    return ret;
>> +}
>> +
>> +static int remoteproc_set_cur_state(struct thermal_cooling_device 
>> *cdev,
>> +                    unsigned long state)
>> +{
>> +    struct remoteproc_cdev *rproc_cdev = cdev->devdata;
>> +    int ret;
>> +
>> +    if (!rproc_cdev || !rproc_cdev->ops)
>> +        return -EINVAL;
>> +
>> +    mutex_lock(&rproc_cdev->lock);
>> +    ret = rproc_cdev->ops->set_cur_level(rproc_cdev->devdata, state);
>> +    mutex_unlock(&rproc_cdev->lock);
>> +
>> +    return ret;
>> +}
>> +
>> +static const struct thermal_cooling_device_ops 
>> remoteproc_cooling_ops = {
>> +    .get_max_state = remoteproc_get_max_state,
>> +    .get_cur_state = remoteproc_get_cur_state,
>> +    .set_cur_state = remoteproc_set_cur_state,
>> +};
>> +
>> +struct remoteproc_cdev *
>> +remoteproc_cooling_register(struct device_node *np,
>> +                 const char *name, const struct 
>> remoteproc_cooling_ops *ops,
>> +                 void *devdata)
>> +{
>> +    struct remoteproc_cdev *rproc_cdev;
>> +    struct thermal_cooling_device *cdev;
>> +    int ret;
>> +
>> +    if (!name || !ops) {
>> +        return ERR_PTR(-EINVAL);
>> +    }
>> +
>
> May I know which ops callbacks are required and which are optional?
> If the callback is optional, should we check for null before calling it?
>

Actually all are mandatory for cooling api, will put null check for all 
to be on safer side.


>
>> +    rproc_cdev = kzalloc(sizeof(*rproc_cdev), GFP_KERNEL);
>> +    if (!rproc_cdev)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    rproc_cdev->ops = ops;
>> +    rproc_cdev->devdata = devdata;
>> +    rproc_cdev->np = np;
>> +    mutex_init(&rproc_cdev->lock);
>> +
>> +    char *rproc_name __free(kfree) =
>> +        kasprintf(GFP_KERNEL, REMOTEPROC_PREFIX "%s", name);
>
> It should have a NULL check when alloc memory.
>
>

Thanks for pointing this, will update this.


>> +    /* Register with thermal framework */
>> +    if (np) {
>> +        cdev = thermal_of_cooling_device_register(np, rproc_name, 
>> rproc_cdev,
>> +                              &remoteproc_cooling_ops);
>> +    }
>> +
>> +    if (IS_ERR(cdev)) {
>> +        ret = PTR_ERR(cdev);
>> +        goto free_rproc_cdev;
>> +    }
>> +
>> +    rproc_cdev->cdev = cdev;
>> +
>> +    return rproc_cdev;
>> +
>> +free_rproc_cdev:
>> +    kfree(rproc_cdev);
>> +    return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL_GPL(remoteproc_cooling_register);
>> +
>> +void remoteproc_cooling_unregister(struct remoteproc_cdev *rproc_cdev)
>> +{
>> +    if (!rproc_cdev)
>> +        return;
>> +
>> +    thermal_cooling_device_unregister(rproc_cdev->cdev);
>> +    mutex_destroy(&rproc_cdev->lock);
>> +    kfree(rproc_cdev);
>> +}
>> +EXPORT_SYMBOL_GPL(remoteproc_cooling_unregister);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Remote Processor Cooling Device");
>> diff --git a/include/linux/remoteproc_cooling.h 
>> b/include/linux/remoteproc_cooling.h
>> new file mode 100644
>> index 000000000000..ef94019d220d
>> --- /dev/null
>> +++ b/include/linux/remoteproc_cooling.h
>> @@ -0,0 +1,52 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Remote Processor Cooling Device
>> + *
>> + * Copyright (c) 2025, Qualcomm Innovation Center
>> + */
>> +
>> +#ifndef __REMOTEPROC_COOLING_H__
>> +#define __REMOTEPROC_COOLING_H__
>> +
>> +#include <linux/thermal.h>
>> +
>> +struct device;
>> +struct device_node;
>> +
>> +struct remoteproc_cooling_ops {
>> +    int (*get_max_level)(void *devdata, unsigned long *level);
>> +    int (*get_cur_level)(void *devdata, unsigned long *level);
>> +    int (*set_cur_level)(void *devdata, unsigned long level);
>> +};
>> +
>> +struct remoteproc_cdev;
>> +
>> +#ifdef CONFIG_REMOTEPROC_THERMAL
>> +
>> +struct remoteproc_cdev *
>> +remoteproc_cooling_register(struct device_node *np,
>> +                 const char *name,
>> +                 const struct remoteproc_cooling_ops *ops,
>> +                 void *devdata);
>> +
>> +void remoteproc_cooling_unregister(struct remoteproc_cdev *rproc_cdev);
>> +
>> +#else /* !CONFIG_REMOTEPROC_THERMAL */
>> +
>> +static inline struct remoteproc_cdev *
>> +remoteproc_cooling_register(struct device_node *np,
>> +                 const char *name,
>> +                 const struct remoteproc_cooling_ops *ops,
>> +                 void *devdata)
>> +{
>> +    return ERR_PTR(-EINVAL);
>> +}
>> +
>> +static inline void
>> +remoteproc_cooling_unregister(struct remoteproc_cdev *rproc_cdev)
>> +{
>> +}
>> +
>> +#endif /* CONFIG_REMOTEPROC_THERMAL */
>> +
>> +#endif /* __REMOTEPROC_COOLING_H__ */
>
>

