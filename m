Return-Path: <linux-arm-msm+bounces-101609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2L+UI8F3z2kewgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 10:18:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E4C392015
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 10:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 672623012BF0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 08:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8881036681F;
	Fri,  3 Apr 2026 08:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5FrFHlM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3QCa4YA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8D8175A7B
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 08:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204285; cv=none; b=HmGIKhcrjzuqWy6cprpju66voTEQ5CH1nbys29kE0wQrIlosFX90suBLqUgShKXv3MnOuHFEAbGtzO0l8npYOV8aREt4/KhgrgNjVCfvUXx5wqKvXM7+Y+VlsWVTKPw7quXryQA8rNneFeHWIFCgTH59HNgSiLmiJcBfIKJsV4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204285; c=relaxed/simple;
	bh=5qe/yg7HOvLohQOJF1J5Wy1REIdwfIbQmAkIe5REXV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBNWFql7Vr5APGk5v6jM9wSVfvim6Mx47gurRGA9Vjqwwq4htxkPyFpQLnfj7I8eW9/PUWQHdplNeNLE/UDaT4PItvk6f6Pjrad0ULTRUjeIqTsO1G/wSfA6Hw6WdZUVJlrvNxcQ7aTu6srDtwx0tvEgHrwocviKTkxXd5Rq0LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5FrFHlM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3QCa4YA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63372w4S947591
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 08:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BV7K1/0Zkpogt2mGKr6CARDe+OrkUhExaNsYM3POsvM=; b=P5FrFHlMLQOvsXrn
	2s5p0COIyKk//1d2qliScPXGzKNF43W+eu+Pxk1LzOijWW3S7X+WXWjs11t8siQR
	daD+V9gqYopKuFvcTa00ssMq8tFXA3ixQYA3YnrH4lmnCDoyHKuKnArhNHlnqaAL
	bjSYKQrRs6QHRc6KP6RJzc1B5KoxCWOJ4GZ5J3JQCJpcCXpJVCE1jUXgAvb+kzz8
	RKOyZiN54ht/FEqsb/y8U1KQfxp77zNJJGL8zSupVBkmaop3B17u3ZSxoOvu9OLr
	RMm/uMbbaD+eOeham8bnfu5T1TKPKR+61PnyyzJXfaQS1dARZ+RIq7NwdayhWvLW
	UIpfWQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9xwfhup5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 08:18:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c70d1f65aso928701b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 01:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775204283; x=1775809083; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BV7K1/0Zkpogt2mGKr6CARDe+OrkUhExaNsYM3POsvM=;
        b=a3QCa4YA76Ve1YFWFxlwPmMax3oYlSuBcIjKur/DKBMWeQFWGYzK9vddW5czQDpNo5
         qvrZFNcs1WLrRHaIoajMSGbiVycYk7UvIUq8Onjgv0l5nEDD6UJvW8u3XCsjKuRD1maS
         uQT0Fc4xBdM7eF7aSJ2QagdfygDSrQ4RTEsYx7a5iMC8lLXEfeWCvpFRxNsjuVEgRYtI
         YQr5swIyJGZpeLMwNljqxr92Hj22vGpbhZvhpIU+1iRTM6NBZFLtFY6bTk8WcT0/jr06
         0F8UUbMaN3WhvTn2mrC7/gny6MnCqPU29kC9WxAou0wP5R3C/pWpp5nCrNtPn0X7gMrz
         Q6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775204283; x=1775809083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BV7K1/0Zkpogt2mGKr6CARDe+OrkUhExaNsYM3POsvM=;
        b=KAlUq4c7o0vOgbtDm/EJmzWDPlrBP1go7bgHJ6jZBDH7rnm23GQmr7sxonIbVQziKu
         NWodML+T6/Gs9idm65E56XbbXN5thQHom/wRkPqKzVAsKXWKgD+dQQMPPv9aQgmF7MKB
         D3qCQfCpJ19A26KkaPp+IgDG5/LHUc8lBw3gkmNMsKcAkw8Og5UD70Kt1O78NkkGwfpO
         kU1nHUk9/hocOUWsR5TkSmLemFcnV9+OvRJj8moUpjmIRB3D7FXWGEQpJck9ev81liWH
         6o6gc8Coo8/46f4Vfu0sFq/lzFEnyMZ4x+eI43Tg86fgc0x2rcxIHU+e2AoH1z9KjJRP
         cArQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPrSDc8BNrGAO7Ob8r1ZqmnlCPNALqXJG0zc4/Lno/iJhEr7sHUEsHTCCoPapcL5ZDqK0/OOaHA72bZ7tV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+xktV7naY1WrQ13TY8OZ9urnQq/jzVXiRthUM9OYamfTNA7WO
	2kX/P29wxujXgtctF23T/NSoEgUyTfq2yQI3rMLnDv2q2lLQ5gBha+oEj8lQ8OosAfirXNcc1cE
	xj/pkgC3tNVr6kr5IsWduVJIFKKbDhyVZe+1K2p+wasnBcmySSv9xd40Gg/cL4NkYN1O3
X-Gm-Gg: AeBDies+mKSLRlOE3gAkCjfIUvpPVAI+h1JKjSVHhXZYJkpIDG28ZE/nZdOI8AORxU3
	ZWgASPwl9jdPVU4HNgrkpIkLWk9sGLQ7aBHIze7MJpUFxYrPgPK/EKdMv29nprrGF7vE7IT3Oz9
	u+YNv/aUNh+VwyQrIAyV0kKHvJvnsQZthD5JhEPApG6+QTo7FCpKxvgmEdvC7zaFyXVvbaluCic
	qRY8Vlng6Y8tJGxXBA7VHp+Zt8rFGdvTeCFCgbxsmmM80Jej3fRlrErsi9Nf8lp5o9cJm8lFgyw
	QUwFqJjl6nPrszc4w0dShH8gz5behB5WAB/OyY/tJxMA7z0DfnND0TyUfiu76KMSRegdJieTqhf
	rZiBruoB6VgSRblMOVeN6BAILsGTVRenzpjElLF9kbnLwCY2IGbGZ/9u7iQ1Can5iDXfzUJ+Dy6
	GE4/DBjleVfrqSHSCdrg==
X-Received: by 2002:a05:6a00:3902:b0:82c:9fe1:aa4d with SMTP id d2e1a72fcca58-82d0da6d649mr2273776b3a.13.1775204282439;
        Fri, 03 Apr 2026 01:18:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:3902:b0:82c:9fe1:aa4d with SMTP id d2e1a72fcca58-82d0da6d649mr2273747b3a.13.1775204281873;
        Fri, 03 Apr 2026 01:18:01 -0700 (PDT)
Received: from [10.133.33.157] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9a24039sm5313994b3a.0.2026.04.03.01.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 01:18:01 -0700 (PDT)
Message-ID: <02fcb6a0-570c-48c8-814a-85e414659f4d@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 10:03:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/7] qcom-tgu: Add TGU driver
To: Jie Gan <jie.gan@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
 <20260317032639.2393221-3-songwei.chai@oss.qualcomm.com>
 <2ff7aed6-72c0-492e-96d7-f8c30f331a01@oss.qualcomm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <2ff7aed6-72c0-492e-96d7-f8c30f331a01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: i_ZSwCMn3gVRgKc4AAdbJClvLV8NpA_l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3MiBTYWx0ZWRfX115MfUscKxDh
 N5LHGYWMneBRL6576QiMa6Mg+ZJzguRuNM0EVVk+E0UUwFljf6HqfT5rWZxeZgXlxMRDn265Tis
 Q6OObJH/xRZFRdjtZmcOsPvxa9rJgSDo8n4otieaKxtyQy0jVEATzpNdspoqCIEwFmQqPdTvywk
 yzoZNwthdtXbEbXMWorxH17CpS53XEhwS5k3fakRuOEYS0TiAWNbboMZSFLlBXmuQp9Z0zHlcTH
 IqzsRCKAxon/FdjIBY9LwY0Q4NVs+QI64dgeoZ8zw1Gw4Msnek7J2WoFlQJv9kcxBiCh/fv5CNC
 oFdRMPzhMkxzdLn1r0ZWebyD+TqTIhV7lAgK2oN/xKqUcwQxCKSjAX2v7F1pq+CbVRf2vbpbBL2
 H8W9F4xaANN6lUI+qP9o4uZ21EEHVBWuq+aHnbwPqHqUltY8ojyds1jlaWlI8aPBooPRnxE7Bxz
 Xk1TUfBDtnFzOS7XcnA==
X-Proofpoint-ORIG-GUID: i_ZSwCMn3gVRgKc4AAdbJClvLV8NpA_l
X-Authority-Analysis: v=2.4 cv=fOo0HJae c=1 sm=1 tr=0 ts=69cf77bb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MSq3_QDDgX4y9XyO_xYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030072
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[30];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101609-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[songwei.chai@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B5E4C392015
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/27/2026 10:35 AM, Jie Gan wrote:
>
>
> On 3/17/2026 11:26 AM, Songwei Chai wrote:
>> Add driver to support device TGU (Trigger Generation Unit).
>> TGU is a Data Engine which can be utilized to sense a plurality of
>> signals and create a trigger into the CTI or generate interrupts to
>> processors. Add probe/enable/disable functions for tgu.
>>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
>>   drivers/Makefile                              |   1 +
>>   drivers/hwtracing/Kconfig                     |   2 +
>>   drivers/hwtracing/qcom/Kconfig                |  18 ++
>>   drivers/hwtracing/qcom/Makefile               |   3 +
>>   drivers/hwtracing/qcom/tgu.c                  | 183 ++++++++++++++++++
>>   drivers/hwtracing/qcom/tgu.h                  |  51 +++++
>>   7 files changed, 267 insertions(+)
>>   create mode 100644 
>> Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>   create mode 100644 drivers/hwtracing/qcom/Kconfig
>>   create mode 100644 drivers/hwtracing/qcom/Makefile
>>   create mode 100644 drivers/hwtracing/qcom/tgu.c
>>   create mode 100644 drivers/hwtracing/qcom/tgu.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu 
>> b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> new file mode 100644
>> index 000000000000..ead237bb7d89
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -0,0 +1,9 @@
>> +What:        /sys/bus/amba/devices/<tgu-name>/enable_tgu
>> +Date:        March 2026
>> +KernelVersion    7.1
>
> missed ":" in all patches.
Thanks Jie, it will be updated in next version.
> Thanks,
> Jie
>
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set/Get the enable/disable status of TGU
>> +        Accepts only one of the 2 values -  0 or 1.
>> +        0 : disable TGU.
>> +        1 : enable TGU.
>> diff --git a/drivers/Makefile b/drivers/Makefile
>> index 53fbd2e0acdd..82b712a12a26 100644
>> --- a/drivers/Makefile
>> +++ b/drivers/Makefile
>> @@ -177,6 +177,7 @@ obj-$(CONFIG_RAS)        += ras/
>>   obj-$(CONFIG_USB4)        += thunderbolt/
>>   obj-$(CONFIG_CORESIGHT)        += hwtracing/coresight/
>>   obj-y                += hwtracing/intel_th/
>> +obj-y                += hwtracing/qcom/
>>   obj-$(CONFIG_STM)        += hwtracing/stm/
>>   obj-$(CONFIG_HISI_PTT)        += hwtracing/ptt/
>>   obj-y                += android/
>> diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
>> index 911ee977103c..8a640218eed8 100644
>> --- a/drivers/hwtracing/Kconfig
>> +++ b/drivers/hwtracing/Kconfig
>> @@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
>>     source "drivers/hwtracing/ptt/Kconfig"
>>   +source "drivers/hwtracing/qcom/Kconfig"
>> +
>>   endmenu
>> diff --git a/drivers/hwtracing/qcom/Kconfig 
>> b/drivers/hwtracing/qcom/Kconfig
>> new file mode 100644
>> index 000000000000..d6f6d4b0f28e
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/Kconfig
>> @@ -0,0 +1,18 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# QCOM specific hwtracing drivers
>> +#
>> +menu "Qualcomm specific hwtracing drivers"
>> +
>> +config QCOM_TGU
>> +    tristate "QCOM Trigger Generation Unit driver"
>> +    help
>> +      This driver provides support for Trigger Generation Unit that is
>> +      used to detect patterns or sequences on a given set of signals.
>> +      TGU is used to monitor a particular bus within a given region to
>> +      detect illegal transaction sequences or slave responses. It is 
>> also
>> +      used to monitor a data stream to detect protocol violations 
>> and to
>> +      provide a trigger point for centering data around a specific 
>> event
>> +      within the trace data buffer.
>> +
>> +endmenu
>> diff --git a/drivers/hwtracing/qcom/Makefile 
>> b/drivers/hwtracing/qcom/Makefile
>> new file mode 100644
>> index 000000000000..5a0a868c1ea0
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +obj-$(CONFIG_QCOM_TGU) += tgu.o
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> new file mode 100644
>> index 000000000000..58c19f12f3d7
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -0,0 +1,183 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/amba/bus.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include "tgu.h"
>> +
>> +static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>> +{
>> +    TGU_UNLOCK(drvdata->base);
>> +    /* Enable TGU to program the triggers */
>> +    writel(1, drvdata->base + TGU_CONTROL);
>> +    TGU_LOCK(drvdata->base);
>> +}
>> +
>> +static int tgu_enable(struct device *dev)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +    guard(spinlock)(&drvdata->lock);
>> +    if (drvdata->enabled)
>> +        return -EBUSY;
>> +
>> +    tgu_write_all_hw_regs(drvdata);
>> +    drvdata->enabled = true;
>> +
>> +    return 0;
>> +}
>> +
>> +static void tgu_do_disable(struct tgu_drvdata *drvdata)
>> +{
>> +    TGU_UNLOCK(drvdata->base);
>> +    writel(0, drvdata->base + TGU_CONTROL);
>> +    TGU_LOCK(drvdata->base);
>> +
>> +    drvdata->enabled = false;
>> +}
>> +
>> +static void tgu_disable(struct device *dev)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +
>> +    guard(spinlock)(&drvdata->lock);
>> +    if (!drvdata->enabled)
>> +        return;
>> +
>> +    tgu_do_disable(drvdata);
>> +}
>> +
>> +static ssize_t enable_tgu_show(struct device *dev,
>> +                   struct device_attribute *attr, char *buf)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    bool enabled;
>> +
>> +    guard(spinlock)(&drvdata->lock);
>> +    enabled = drvdata->enabled;
>> +
>> +    return sysfs_emit(buf, "%d\n", !!enabled);
>> +}
>> +
>> +/* enable_tgu_store - Configure Trace and Gating Unit (TGU) 
>> triggers. */
>> +static ssize_t enable_tgu_store(struct device *dev,
>> +                struct device_attribute *attr,
>> +                const char *buf,
>> +                size_t size)
>> +{
>> +    unsigned long val;
>> +    int ret;
>> +
>> +    ret = kstrtoul(buf, 0, &val);
>> +    if (ret || val > 1)
>> +        return -EINVAL;
>> +
>> +    if (val) {
>> +        ret = pm_runtime_resume_and_get(dev);
>> +        if (ret)
>> +            return ret;
>> +        ret = tgu_enable(dev);
>> +        if (ret) {
>> +            pm_runtime_put(dev);
>> +            return ret;
>> +        }
>> +    } else {
>> +        tgu_disable(dev);
>> +        pm_runtime_put(dev);
>> +    }
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(enable_tgu);
>> +
>> +static struct attribute *tgu_common_attrs[] = {
>> +    &dev_attr_enable_tgu.attr,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group tgu_common_grp = {
>> +    .attrs = tgu_common_attrs,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group *tgu_attr_groups[] = {
>> +    &tgu_common_grp,
>> +    NULL,
>> +};
>> +
>> +static int tgu_probe(struct amba_device *adev, const struct amba_id 
>> *id)
>> +{
>> +    struct device *dev = &adev->dev;
>> +    struct tgu_drvdata *drvdata;
>> +    int ret;
>> +
>> +    drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> +    if (!drvdata)
>> +        return -ENOMEM;
>> +
>> +    drvdata->dev = &adev->dev;
>> +    dev_set_drvdata(dev, drvdata);
>> +
>> +    drvdata->base = devm_ioremap_resource(dev, &adev->res);
>> +    if (IS_ERR(drvdata->base))
>> +        return PTR_ERR(drvdata->base);
>> +
>> +    spin_lock_init(&drvdata->lock);
>> +
>> +    ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>> +    if (ret) {
>> +        dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    drvdata->enabled = false;
>> +
>> +    pm_runtime_put(&adev->dev);
>> +
>> +    return 0;
>> +}
>> +
>> +static void tgu_remove(struct amba_device *adev)
>> +{
>> +    struct device *dev = &adev->dev;
>> +
>> +    sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
>> +
>> +    tgu_disable(dev);
>> +}
>> +
>> +static const struct amba_id tgu_ids[] = {
>> +    {
>> +        .id = 0x000f0e00,
>> +        .mask = 0x000fffff,
>> +    },
>> +    { 0, 0, NULL },
>> +};
>> +
>> +MODULE_DEVICE_TABLE(amba, tgu_ids);
>> +
>> +static struct amba_driver tgu_driver = {
>> +    .drv = {
>> +        .name = "qcom-tgu",
>> +        .suppress_bind_attrs = true,
>> +    },
>> +    .probe = tgu_probe,
>> +    .remove = tgu_remove,
>> +    .id_table = tgu_ids,
>> +};
>> +
>> +module_amba_driver(tgu_driver);
>> +
>> +MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
>> +MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
>> +MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
>> new file mode 100644
>> index 000000000000..dd7533b9d735
>> --- /dev/null
>> +++ b/drivers/hwtracing/qcom/tgu.h
>> @@ -0,0 +1,51 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _QCOM_TGU_H
>> +#define _QCOM_TGU_H
>> +
>> +/* Register addresses */
>> +#define TGU_CONTROL        0x0000
>> +#define TGU_LAR        0xfb0
>> +#define TGU_UNLOCK_OFFSET    0xc5acce55
>> +
>> +static inline void TGU_LOCK(void __iomem *addr)
>> +{
>> +    do {
>> +        /* Wait for things to settle */
>> +        mb();
>> +        writel_relaxed(0x0, addr + TGU_LAR);
>> +    } while (0);
>> +}
>> +
>> +static inline void TGU_UNLOCK(void __iomem *addr)
>> +{
>> +    do {
>> +        writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
>> +        /* Make sure everyone has seen this */
>> +        mb();
>> +    } while (0);
>> +}
>> +
>> +/**
>> + * struct tgu_drvdata - Data structure for a TGU (Trigger Generator 
>> Unit)
>> + * @base: Memory-mapped base address of the TGU device
>> + * @dev: Pointer to the associated device structure
>> + * @lock: Spinlock for handling concurrent access to private data
>> + * @enabled: Flag indicating whether the TGU device is enabled
>> + *
>> + * This structure defines the data associated with a TGU device,
>> + * including its base address, device pointers, clock, spinlock for
>> + * synchronization, trigger data pointers, maximum limits for various
>> + * trigger-related parameters, and enable status.
>> + */
>> +struct tgu_drvdata {
>> +    void __iomem *base;
>> +    struct device *dev;
>> +    spinlock_t lock;
>> +    bool enabled;
>> +};
>> +
>> +#endif
>

