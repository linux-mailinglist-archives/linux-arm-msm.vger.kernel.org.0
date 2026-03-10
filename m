Return-Path: <linux-arm-msm+bounces-96459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LY9LO2Jr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:03:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB51244920
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CA19302571C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA49718AE3;
	Tue, 10 Mar 2026 03:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQhd1wjE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYRsWydf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C166D38F229
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773111694; cv=none; b=ca7KBB/AatObkYuIJFioVkxUU2Isga/slqpNAEKniRocD6Q1oLl7pX0VKNxsEQmCnNJtqmCvfjYiem0LVI0CJSVbamT0roneevbYhg+IwFEGp5p86v/FsIfMMescwjOhdQdvT7/jaZAQuzXSf8DID5w/kAli2lVHlebgp0BF1pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773111694; c=relaxed/simple;
	bh=RaBeebjiWIjkY21md3QQ/jRgkEIv27PCQDb4M39xI0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=leNNC/uK86jDKwqbOMQ+2xNF+CetrmGsTUQ9AEy4YbuVSsCE0jNKwLP2fjPc9ZmfoqdHClct03BS0Fnoqjl5aMkBQpcVodvT3C7SieCL/pgTCzMuHWibpALBa7uuduQI+lpQnP4//60Ba8se/+dGcXu75k13SX8zzJEXskOlyHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQhd1wjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYRsWydf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EGf8246825
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	80xWYVWIvkbVVBh1ke+srjhHsgMaot9MUPuRoadeXkY=; b=BQhd1wjEABdpNf2W
	Ri8bVeTcQarVq6rFPURDMkRs/jR/UlfUsFskd6YvxsiiYHc98UhtMuPvKtgG4yzL
	NFpJftASm/ajwRM8o0h71xgCIEgrG5G/cb6UzUczu0TPkgkssBCp5XQqagFBAzyv
	bOwhWvgCuqiLB8zYWx9VERlpYc46LAI6/84suNxqla/cKR7DYUHPwi2DgNE/dIes
	C6eaBlMJ5ApNi9Ema6c2x6lJJBuOuGZiJaVrM6rgryihQKZTax516dqwfV4ll7YY
	qi3ha4VAY654JDrHLM5DcAyZk//W8TmSgdVlZTGVa1WJ9qz4P1pYbxet1CvzBqjq
	ZAI5IA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8800gpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:01:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35980affbf3so6333850a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773111690; x=1773716490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=80xWYVWIvkbVVBh1ke+srjhHsgMaot9MUPuRoadeXkY=;
        b=MYRsWydfLY7sYOERWIlGGd1RIHwYQxfRqHKt++MlH7ucJ37/MslitUo1QUJSjruykq
         OI0Bv+9ArdJyGdLKBS1vmSDZEh5xkYkqAZzvSyGmtYHkLqmfqGeueEw0OA1m82QC8thN
         d6HKV4jI3sR1oI45qOXIeW2alRCnv2Z2u1AYyA+C8ycy5goZ4HitUtwJ5oMx4XoBVewe
         8QIs/68ID/l7FWoqVxakbfnfYTwC3SQXPk+O/JfGJ6b0qppNIwwX/kHYJz35Oay2LxLV
         BqrydIhhN3NbuogljEAOhIB50fftbZEtSK5xdkBXC1MZiXgsMn6SK+9SSnYjafME6Z2e
         j6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773111690; x=1773716490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80xWYVWIvkbVVBh1ke+srjhHsgMaot9MUPuRoadeXkY=;
        b=t3bC9KjJmRhty8wuHP/BhXTk3cuo7wrC6GxHWEaxlC1GI2iROY1ZRQyJn3Znm5mo0b
         PE7VshreUQ/nEIm7tqXIqcEU0Yqv8p1F8nJ+H8vdrAMFUijGjgduPDuxKAF9ihd9at3c
         JZpVnllpZvotuMl//HxtAiIDKScQ9p0wAf0KwNskbXAtHbDD51Tw39ZVJQNLpdzTN7j1
         G1cPHVcieIU9Ku33VJ3UolHD0SWlwPFvYIoMkhJbVAzB3+ZfFAqlg/55W/YhlJtlPxT4
         Q6g6xctn3jvAxtUcef2lCCWt//O9OwP5t8MkfQtFoJvJNENI5CuXxpxdXLucoC6HnDOE
         Nqvg==
X-Forwarded-Encrypted: i=1; AJvYcCW4EzTlia42XsKDLouUqmC8khdGfrqKNkkso1fvDJ0A1Bnfm4bM3PnyZK4yxUiel0F80n4PFHo6zNNrhYg3@vger.kernel.org
X-Gm-Message-State: AOJu0YzTRYlzTXNt7IA0zaxnCSFfI/t9QguZ5Bcp/QVOT78MXGOujOxT
	wz+LaJEGQb44DzGlnUBnwMqHiFUOGxrJM10LPTFs0YP4WvwINJsmJlPQ/bFZJ6qzCS9BE9vLXwI
	JS3J88pHdAiAASULuca5RnW2+x9sgyAiWgpTwDvby2OkuFTK7PAiCyz7BnpSjkbY37BkG
X-Gm-Gg: ATEYQzxgh03R55DVOOHUfu/RhSg3hlsNM3m4i2Sl43F0KBKHlCEFiz0IoAp8Jih/wQg
	aFcQxIQoJiZDy5wlmS+fn7efeBvVtwohKrFQ6hQrGGoyCiGrBit6XEMuG1wZaLa94wsDmVIA4wL
	jXao5+0f+xSjf41CL2wXRJhXx0GN1CUAp9waPKG6xLIdAYwpdwMrv07ep3ZlHOpBtggScrJsp45
	bPEy831d6koJkrWWbrhVcqO+BnAQyOES/Iy6ANmEIhrX35eRHlPyZh/6UU0R3O02EkYXQ6Y1JSf
	qCIYcKdAj4YFJ920tYK128VgHJ8zbN4c2zwAEPEPrm5/Wvp+XIU5Dv3rDcTqbcVTnetiNYXxqAu
	DCxYGMMhGX7W96dMzUsdwNR5eJm76Ylr8s1YWYJbQ4IgkNW6rAtvs8oB8Bg7Q+YMb50uvbjqnLz
	Dj2t4wTGYq7i8=
X-Received: by 2002:a17:90b:17d1:b0:359:8d23:af5f with SMTP id 98e67ed59e1d1-359be384d2fmr11459274a91.35.1773111689943;
        Mon, 09 Mar 2026 20:01:29 -0700 (PDT)
X-Received: by 2002:a17:90b:17d1:b0:359:8d23:af5f with SMTP id 98e67ed59e1d1-359be384d2fmr11459200a91.35.1773111689022;
        Mon, 09 Mar 2026 20:01:29 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f06f79absm1117222a91.6.2026.03.09.20.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 20:01:28 -0700 (PDT)
Message-ID: <bc05d278-fe28-4503-ac99-fb28904e7343@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:01:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 6/7] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
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
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <f45b9679-857f-4bb2-b683-cd5701ea16de@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyMiBTYWx0ZWRfX/m2wlK8vRPyK
 FCs1tsgw8IGvbbLePgvylcqm1vIgldKInoYCCVaM0Hn2EE3FVVEW0ZyCpXVNsN4MsMdNFA4mRcN
 l2g4VMJ3ZPZOq4aLPQvU72jjUJ30Bg5tM/4P1nBkMIfq/t9FGC2/Y5lxL3xxI8aJFgzp1pp9dsI
 X3AsmlHcMZyooDro8NwOsYoZwaEz6A5hp8vd3+2p56yx8gN+nhMKUdA5dQ31XumX1mMfZaQWM+t
 7QcQZ+aDvUrnTEqfYDKnwVxSHWOpRMBrdmZmiSgEh4Tfg4skjP2MJmlttRUcjyBvLdIvqFeMSUc
 lQ37gP8ve7IyUPlu1q5gfNkbUDnCQZObWXZgK91zUMkATG/sRITzQRlBkM52kG7fnjiLmmuYg9n
 RTtN/4R+jK4Krj1+GttpWs7McgqE2Nls5VWEj/sCOal6J3wFDK1zUO/Qf4GKvab+JyQAvdk6vPn
 NxQKFqyGUvC/e16pY2w==
X-Proofpoint-GUID: v-JhoDYZdYDJy7vro4JPF4BVVbZUv5gB
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69af898b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rxpY7AQehirZRGGbaxAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: v-JhoDYZdYDJy7vro4JPF4BVVbZUv5gB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100022
X-Rspamd-Queue-Id: 2AB51244920
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
	TAGGED_FROM(0.00)[bounces-96459-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
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



On 3/9/2026 8:43 PM, Suzuki K Poulose wrote:
> On 09/03/2026 09:47, Jie Gan wrote:
>> The byte-cntr function provided by the CTCU device is used to transfer 
>> data
>> from the ETR buffer to the userspace. An interrupt is triggered if the 
>> data
>> size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
>> handler counts the number of triggered interruptions and the read 
>> function
>> will read the data from the synced ETR buffer.
>>
>> Switching the sysfs_buf when current buffer is full or the timeout is
>> triggered and resets rrp and rwp registers after switched the buffer.
>> The synced buffer will become available for reading after the switch.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
>>   drivers/hwtracing/coresight/Makefile               |   2 +-
>>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 351 +++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 103 +++++-
>>   drivers/hwtracing/coresight/coresight-ctcu.h       |  76 ++++-
>>   drivers/hwtracing/coresight/coresight-tmc-core.c   |   8 +-
>>   drivers/hwtracing/coresight/coresight-tmc-etr.c    |  18 ++
>>   drivers/hwtracing/coresight/coresight-tmc.h        |   4 +
>>   8 files changed, 555 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> ctcu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>> new file mode 100644
>> index 000000000000..6ff1708fb944
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>> @@ -0,0 +1,8 @@
>> +What:           /sys/bus/coresight/devices/<ctcu-name>/ 
>> irq_threshold[0:1]
>> +Date:           March 2026
>> +KernelVersion:  7.1
>> +Contact:        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>; 
>> Jinlong Mao <jinlong.mao@oss.qualcomm.com>; Jie Gan 
>> <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Configure the byte-cntr IRQ register for the specified 
>> ETR device
>> +        based on its port number. An interrupt is generated when the 
>> data size
>> +        exceeds the value set in the IRQ register.
>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/ 
>> coresight/Makefile
>> index ab16d06783a5..821a1b06b20c 100644
>> --- a/drivers/hwtracing/coresight/Makefile
>> +++ b/drivers/hwtracing/coresight/Makefile
>> @@ -55,5 +55,5 @@ coresight-cti-y := coresight-cti-core.o    
>> coresight-cti-platform.o \
>>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>>   obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
>> -coresight-ctcu-y := coresight-ctcu-core.o
>> +coresight-ctcu-y := coresight-ctcu-core.o coresight-ctcu-byte-cntr.o
>>   obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/ 
>> drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>> new file mode 100644
>> index 000000000000..0bf738d6c283
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>> @@ -0,0 +1,351 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/coresight.h>
>> +#include <linux/device.h>
>> +#include <linux/fs.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/uaccess.h>
>> +
>> +#include "coresight-ctcu.h"
>> +#include "coresight-priv.h"
>> +#include "coresight-tmc.h"
>> +
>> +static irqreturn_t byte_cntr_handler(int irq, void *data)
>> +{
>> +    struct ctcu_byte_cntr *byte_cntr_data = (struct ctcu_byte_cntr 
>> *)data;
>> +
>> +    atomic_inc(&byte_cntr_data->irq_cnt);
>> +    wake_up(&byte_cntr_data->wq);
>> +
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +static void ctcu_reset_sysfs_buf(struct tmc_drvdata *drvdata)
> 
> minor nit: This has nothing to do with the CTCU. For what it is worth,
> it must be called, tmc_etr_reset_sysf_buf(). But more on this below,
> and even do we need it, further below.
> 
>> +{
>> +    u32 sts;
>> +
>> +    CS_UNLOCK(drvdata->base);
>> +    tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
>> +    tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
>> +    sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
>> +    writel_relaxed(sts, drvdata->base + TMC_STS);
>> +    CS_LOCK(drvdata->base);
> 
> Could we not keep this function in the tmc-etr.c and invoke from here ?
> 

Sure, will move the function tmc-etr.c

>> +}
>> +
>> +static void ctcu_cfg_byte_cntr_reg(struct tmc_drvdata *drvdata, u32 
>> val, u32 offset)
>> +{
>> +    struct ctcu_drvdata *ctcu_drvdata;
>> +    struct coresight_device *helper;
>> +
>> +    helper = tmc_etr_get_ctcu_device(drvdata);
>> +    if (!helper)
>> +        return;
>> +
>> +    ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
>> +    /* A one value for IRQCTRL register represents 8 bytes */
>> +    ctcu_program_register(ctcu_drvdata, val / 8, offset);
>> +}
>> +
>> +static struct ctcu_byte_cntr *ctcu_get_byte_cntr_data(struct 
>> tmc_drvdata *drvdata)
>> +{
>> +    struct ctcu_byte_cntr *byte_cntr_data;
>> +    struct ctcu_drvdata *ctcu_drvdata;
>> +    struct coresight_device *helper;
>> +    int port;
>> +
>> +    helper = tmc_etr_get_ctcu_device(drvdata);
>> +    if (!helper)
>> +        return NULL;
>> +
> 
> 
> 
>> +    port = coresight_get_in_port(drvdata->csdev, helper);
>> +    if (port < 0)
>> +        return NULL;
>> +
> 
> Please validate that the port_num you get is valid for the CTCU ? That 
> applies to all uses of this construct.
> 

Will validate it before using.

>> +    ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
>> +    byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
>> +    return byte_cntr_data;
> 
> 
> 
> nit:
>      return  &ctcu_drvdata->byte_cntr_data[port]; ?
> 
> Also, why not make this into a helper, as we seem to use this other 
> places too ?
> 

Didnt get the point here. We may run more than one ETR devices 
concurrently. So we should get the proper byte_cntr_data according to 
the port number at runtime.

> 
>> +}
>> +
>> +static bool ctcu_byte_cntr_switch_buffer(struct tmc_drvdata *drvdata,
>> +                     struct ctcu_byte_cntr *byte_cntr_data)
>> +{
>> +    struct etr_buf_node *nd, *next, *curr_node, *picked_node;
>> +    struct etr_buf *curr_buf = drvdata->sysfs_buf;
>> +    bool found_free_buf = false;
>> +
>> +    if (WARN_ON(!drvdata || !byte_cntr_data))
>> +        return found_free_buf;
>> +
>> +    /* Stop the ETR before initiating the switch */
>> +    if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
>> +        tmc_etr_enable_disable_hw(drvdata, false);
>> +
>> +    list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
>> +        /* curr_buf is free for next round */
>> +        if (nd->sysfs_buf == curr_buf) {
>> +            nd->is_free = true;
>> +            curr_node = nd;
> 
>   ---8>--
>> +        }
>> +
>> +        if (!found_free_buf && nd->is_free && nd->sysfs_buf != 
>> curr_buf) {
> 
> --<8---
>          } else if (!found_free_buf && nd->is_free) {
> 

will fix it.

>> +            picked_node = nd;
>> +            found_free_buf = true;
>> +        }
>> +    }
>> +
>> +    if (found_free_buf) {
>> +        curr_node->pos = 0;
>> +        drvdata->buf_node = curr_node;
> 
> Why are we adding something new into the drvdata ? Could we not extend
> the sysfs_buf struct and add the "link" there ? That would make it much
> more simpler ?
> 
>> +        drvdata->sysfs_buf = picked_node->sysfs_buf;
>> +        drvdata->etr_buf = picked_node->sysfs_buf;
>> +        picked_node->is_free = false;
>> +        /* Reset irq_cnt for next etr_buf */
>> +        atomic_set(&byte_cntr_data->irq_cnt, 0);
>> +        /* Reset rrp and rwp when the system has switched the buffer*/
>> +        ctcu_reset_sysfs_buf(drvdata);
> 
> Why do we do this ? Could we not leave this to the __tmc_etr_enable() 
> below ?

Will fix it.

> 
>> +        /* Restart the ETR once a free buffer is available */
>> +        if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
>> +            tmc_etr_enable_disable_hw(drvdata, true);
>> +    }
>> +
>> +    return found_free_buf;
>> +}
>> +
>> +/*
>> + * ctcu_byte_cntr_get_data() - reads data from the deactivated and 
>> filled buffer.
>> + * The byte-cntr reading work reads data from the deactivated and 
>> filled buffer.
>> + * The read operation waits for a buffer to become available, either 
>> filled or
>> + * upon timeout, and then reads trace data from the synced buffer.
>> + */
>> +static ssize_t ctcu_byte_cntr_get_data(struct tmc_drvdata *drvdata, 
>> loff_t pos,
>> +                       size_t len, char **bufpp)
>> +{
>> +    struct etr_buf *sysfs_buf = drvdata->sysfs_buf;
>> +    struct device *dev = &drvdata->csdev->dev;
>> +    ssize_t actual, size = sysfs_buf->size;
>> +    struct ctcu_byte_cntr *byte_cntr_data;
>> +    size_t thresh_val;
>> +    atomic_t *irq_cnt;
>> +    int ret;
>> +
>> +    byte_cntr_data = ctcu_get_byte_cntr_data(drvdata);
>> +    if (!byte_cntr_data)
>> +        return -EINVAL;
>> +
>> +    thresh_val = byte_cntr_data->thresh_val;
>> +    irq_cnt = &byte_cntr_data->irq_cnt;
>> +
>> +wait_buffer:
>> +    if (!byte_cntr_data->reading_data) {
>> +        ret = wait_event_interruptible_timeout(byte_cntr_data->wq,
>> +                ((atomic_read(irq_cnt) + 1) * thresh_val >= size) ||
>> +                !byte_cntr_data->enable,
>> +                BYTE_CNTR_TIMEOUT);
>> +        if (ret < 0)
>> +            return ret;
>> +        /*
>> +         * The current etr_buf is almost full or timeout is triggered,
>> +         * so switch the buffer and mark the switched buffer as reading.
>> +         */
>> +        if (byte_cntr_data->enable) {
>> +            if (!ctcu_byte_cntr_switch_buffer(drvdata, 
>> byte_cntr_data)) {
>> +                dev_err(dev, "Switch buffer failed for the byte- 
>> cntr\n");
>> +                return -EINVAL;
>> +            }
>> +
>> +            byte_cntr_data->reading_data = true;
>> +        } else {
>> +            /*
>> +             * TMC-ETR has been disabled, so directly reads data from
>> +             * the drvdata->sysfs_buf.
>> +             */
>> +            actual = etr_sysfs_ops.get_trace_data(drvdata, pos, len, 
>> bufpp);
>> +            if (actual > 0) {
>> +                byte_cntr_data->total_size += actual;
>> +                return actual;
>> +            }
>> +
>> +            /* Exit byte-cntr reading */
>> +            return 0;
>> +        }
>> +    }
>> +
>> +    /* Check the status of current etr_buf*/
>> +    if (atomic_read(irq_cnt) * thresh_val >= size)
>> +        dev_warn(dev, "Data overwrite happened\n");
>> +
>> +    pos = drvdata->buf_node->pos;
>> +    actual = etr_sysfs_ops.get_trace_data(drvdata, pos, len, bufpp);
>> +    if (actual <= 0) {
>> +        /* Reset flags upon reading is finished or failed */
>> +        byte_cntr_data->reading_data = false;
>> +        drvdata->buf_node = NULL;
>> +
>> +        /*
>> +         * Nothing in the buffer, waiting for the next buffer
>> +         * to be filled.
>> +         */
>> +        if (actual == 0)
>> +            goto wait_buffer;
>> +    } else
>> +        byte_cntr_data->total_size += actual;
>> +
>> +    return actual;
>> +}
>> +
>> +static int ctcu_read_prepare_byte_cntr(struct tmc_drvdata *drvdata)
> 
> Please use "tmc_data" or even "etr_drvdata" to make it easier to read
> the code below

Will fix it.

> 
>> +{
>> +    struct ctcu_byte_cntr *byte_cntr_data;
>> +    unsigned long flags;
>> +    int ret = 0;
>> +
>> +    byte_cntr_data = ctcu_get_byte_cntr_data(drvdata);
>> +    if (!byte_cntr_data)
>> +        return -EINVAL;
>> +
>> +    /*
>> +     * The threshold value must not exceed the buffer size.
>> +     * A margin should be maintained between the two values to account
>> +     * for the time gap between the interrupt and buffer switching.
>> +     */
>> +    if (byte_cntr_data->thresh_val + SZ_16K >= drvdata->size) {
> 
> Whats the magic number SZ_16K ? Comment could explain it.

will add comment if still need it in next version.

> 
>> +        dev_err(&drvdata->csdev->dev, "The threshold value is too 
>> large\n");
> 
> Could the threshold be a percentage of the size used by the ETR (You 
> could always align it to the nearest PAGE_SIZE)? That would make it
> convenient for people to change the ETR size and not  having to bother
> about moving the threshold value with the ETR size.

So we just enable/disable the byte-cntr function via sysfs node. Let the 
ETR buffer size to determine the threshoild value?

> 
>> +        return -EINVAL;
>> +    }
>> +
>> +    raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> +    if (byte_cntr_data->reading) {
>> +        ret = -EBUSY;
>> +        goto out_unlock;
>> +    }
>> +
>> +    byte_cntr_data->reading = true;
>> +    raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> 
> All of this can be avoided by retaining the etr_sysf_ops in TMC-> and
> calling into the CTCU after basic checks.

Understood. we can rely on the tmc->reading check, jump to CTCU ops 
after proper check.

> 
>> +    /* Setup an available etr_buf_list for byte-cntr */
>> +    ret = tmc_create_etr_buf_list(drvdata, 2);
>> +    if (ret)
>> +        goto out;
>> +
>> +    raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> +    atomic_set(&byte_cntr_data->irq_cnt, 0);
>> +    /* Configure the byte-cntr register to enable IRQ */
>> +    ctcu_cfg_byte_cntr_reg(drvdata, byte_cntr_data->thresh_val,
>> +                   byte_cntr_data->irq_ctrl_offset);
> 
> Is there no way of going back to the ctcu_drvdata from byte_cntr_data ?
> For a starter, we could easily store the ctcu_drvdata in byte_cntr_data
> and always write straight to the device, rather than always going to the
> ETR drvdata in ctcu_cfg_byte_cntr_reg() ?

Understood, will fix it.

> 
>> +    enable_irq_wake(byte_cntr_data->irq);
>> +    byte_cntr_data->total_size = 0;
>> +
>> +out_unlock:
>> +    raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +
>> +out:
>> +    return ret;
>> +}
>> +
>> +static int ctcu_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata)
> 
> Same as above. name

ditto.

> 
>> +{
>> +    struct device *dev = &drvdata->csdev->dev;
>> +    struct ctcu_byte_cntr *byte_cntr_data;
>> +    unsigned long flags;
>> +
>> +    byte_cntr_data = ctcu_get_byte_cntr_data(drvdata);
>> +    if (!byte_cntr_data)
>> +        return -EINVAL;
>> +
>> +    raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> +    /* Configure the byte-cntr register to disable IRQ */
>> +    ctcu_cfg_byte_cntr_reg(drvdata, 0, byte_cntr_data->irq_ctrl_offset);
> 
> 
>> +    disable_irq_wake(byte_cntr_data->irq);
>> +    byte_cntr_data->reading = false;
>> +    byte_cntr_data->reading_data = false;
>> +    drvdata->buf_node = NULL;
> 
> 
>> +    /* Restore the original sysfs_ops */
>> +    drvdata->sysfs_ops = &etr_sysfs_ops;
> 
> Please see if you can avoid it.

Sure, will check other solution.

> 
>> +    raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +    dev_dbg(dev, "send data total size:%llu bytes\n", byte_cntr_data- 
>> >total_size);
>> +    tmc_clean_etr_buf_list(drvdata);
>> +
>> +    return 0;
>> +}
>> +
>> +const struct tmc_sysfs_ops byte_cntr_sysfs_ops = {
>> +    .read_prepare    = ctcu_read_prepare_byte_cntr,
>> +    .read_unprepare    = ctcu_read_unprepare_byte_cntr,
>> +    .get_trace_data    = ctcu_byte_cntr_get_data,
>> +};
>> +
>> +/* Start the byte-cntr function when the path is enabled. */
>> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct 
>> coresight_path *path)
>> +{
>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +    struct coresight_device *sink = coresight_get_sink(path);
>> +    struct tmc_drvdata *tmc_drvdata = dev_get_drvdata(sink->dev.parent);
>> +    struct ctcu_byte_cntr *byte_cntr_data;
>> +    int port_num;
>> +
>> +    port_num = coresight_get_in_port(sink, csdev);
>> +    if (port_num < 0)
>> +        return;
>> +
>> +    byte_cntr_data = &drvdata->byte_cntr_data[port_num];
> 
> instance 2
> 
>> +    /* Don't start byte-cntr function when threshold is not set. */
>> +    if (!byte_cntr_data->thresh_val || byte_cntr_data->enable)
>> +        return;
>> +
>> +    guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
>> +    byte_cntr_data->enable = true;
>> +    byte_cntr_data->reading_data = false;
>> +    /* Replace with byte-cntr's sysfs_ops */
>> +    tmc_drvdata->sysfs_ops = &byte_cntr_sysfs_ops;
> 
> Why are we hacking this ? This looks *very ugly* and we are doing this 
> without any locks at the tmc-etr driver !!! ?? Could we not call out
> from the etr_sysf_ops into the CTCU ops based some checks ?
> Anyways, please don't change anything in the tmc_drvdata from this
> driver, especially not the "operations".
> 

Understood. Will take care of it in next version.

> Also the locking seems inconsistent. Here we use byte_cntr_data->lock.
> But in ctcu_read_unprepare_byte_cntr(), we use the TMC-ETR 
> spinlock :facepalm:

Sorry for the hack solution here. Will fix it.

Thanks,
Jie

> 
> 
> 
>> +}
>> +
>> +/* Stop the byte-cntr function when the path is disabled. */
>> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct 
>> coresight_path *path)
>> +{
>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +    struct coresight_device *sink = coresight_get_sink(path);
>> +    struct ctcu_byte_cntr *byte_cntr_data;
>> +    int port_num;
>> +
>> +    if (coresight_get_mode(sink) == CS_MODE_SYSFS)
>> +        return;
>> + +    port_num = coresight_get_in_port(sink, csdev);
>> +    if (port_num < 0)
>> +        return;
>> +
>> +    byte_cntr_data = &drvdata->byte_cntr_data[port_num];
> 
> instance 3
> 
> 
> 
> 
>> +    guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
>> +    byte_cntr_data->enable = false;
>> +}
>> +
>> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata 
>> *drvdata, int etr_num)
>> +{
>> +    struct ctcu_byte_cntr *byte_cntr_data;
>> +    struct device_node *nd = dev->of_node;
>> +    int irq_num, ret, i;
>> +
>> +    for (i = 0; i < etr_num; i++) {
>> +        byte_cntr_data = &drvdata->byte_cntr_data[i];
>> +        irq_num = of_irq_get(nd, i);
>> +        if (irq_num < 0) {
>> +            dev_err(dev, "Failed to get IRQ from DT for port%d\n", i);
>> +            continue;
>> +        }
>> +
>> +        ret = devm_request_irq(dev, irq_num, byte_cntr_handler,
>> +                       IRQF_TRIGGER_RISING | IRQF_SHARED,
>> +                       dev_name(dev), byte_cntr_data);
>> +        if (ret) {
>> +            dev_err(dev, "Failed to register IRQ for port%d\n", i);
>> +            continue;
>> +        }
>> +
>> +        byte_cntr_data->irq = irq_num;
>> +        init_waitqueue_head(&byte_cntr_data->wq);
>> +        raw_spin_lock_init(&byte_cntr_data->spin_lock);
>> +    }
>> +}
>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/ 
>> drivers/hwtracing/coresight/coresight-ctcu-core.c
>> index e8720026c9e3..60f1db3ab70d 100644
>> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/slab.h>
>> +#include <linux/sizes.h>
>>   #include "coresight-ctcu.h"
>>   #include "coresight-priv.h"
>> @@ -43,17 +44,21 @@
>>   #define CTCU_ATID_REG_BIT(traceid)    (traceid % 32)
>>   #define CTCU_ATID_REG_SIZE        0x10
>> +#define CTCU_ETR0_IRQCTRL               0x6c
>> +#define CTCU_ETR1_IRQCTRL               0x70
>>   #define CTCU_ETR0_ATID0            0xf8
>>   #define CTCU_ETR1_ATID0            0x108
>>   static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
>>       {
>> -        .atid_offset    = CTCU_ETR0_ATID0,
>> -        .port_num    = 0,
>> +        .atid_offset        = CTCU_ETR0_ATID0,
>> +        .irq_ctrl_offset    = CTCU_ETR0_IRQCTRL,
>> +        .port_num        = 0,
>>       },
>>       {
>> -        .atid_offset    = CTCU_ETR1_ATID0,
>> -        .port_num    = 1,
>> +        .atid_offset        = CTCU_ETR1_ATID0,
>> +        .irq_ctrl_offset    = CTCU_ETR1_IRQCTRL,
>> +        .port_num        = 1,
>>       },
>>   };
>> @@ -62,6 +67,88 @@ static const struct ctcu_config sa8775p_cfgs = {
>>       .num_etr_config    = ARRAY_SIZE(sa8775p_etr_cfgs),
>>   };
>> +void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 
>> offset)
>> +{
>> +    CS_UNLOCK(drvdata->base);
>> +    ctcu_writel(drvdata, val, offset);
>> +    CS_LOCK(drvdata->base);
>> +}
>> +
>> +static ssize_t irq_threshold_show(struct device *dev,
>> +                  struct device_attribute *attr,
>> +                  char *buf)
>> +{
>> +    struct ctcu_byte_cntr_irq_attribute *irq_attr =
>> +        container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    u8 port = irq_attr->port;
>> +
>> +    if (!drvdata->byte_cntr_data[port].irq_ctrl_offset)
>> +        return -EINVAL;
>> +
>> +    return sysfs_emit(buf, "%u\n",
>> +            (unsigned int)drvdata->byte_cntr_data[port].thresh_val);
>> +}
>> +
>> +static ssize_t irq_threshold_store(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   const char *buf,
>> +                   size_t size)
>> +{
>> +    struct ctcu_byte_cntr_irq_attribute *irq_attr =
>> +        container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    u8 port = irq_attr->port;
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    /* Threshold 0 disables the interruption. */
>> +    guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
>> +    /* A small threshold will result in a large number of 
>> interruptions */
>> +    if (val && val < SZ_4K)
>> +        return -EINVAL;
>> +
>> +    if (drvdata->byte_cntr_data[port].irq_ctrl_offset)
>> +        drvdata->byte_cntr_data[port].thresh_val = val;
>> +
>> +    return size;
>> +}
>> +
>> +static umode_t irq_threshold_is_visible(struct kobject *kobj,
>> +                    struct attribute *attr, int n)
>> +{
>> +    struct device_attribute *dev_attr =
>> +        container_of(attr, struct device_attribute, attr);
>> +    struct ctcu_byte_cntr_irq_attribute *irq_attr =
>> +        container_of(dev_attr, struct ctcu_byte_cntr_irq_attribute, 
>> attr);
>> +    struct device *dev = kobj_to_dev(kobj);
>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    u8 port = irq_attr->port;
>> +
>> +    if (drvdata && drvdata->byte_cntr_data[port].irq_ctrl_offset)
>> +        return attr->mode;
>> +
>> +    return 0;
>> +}
>> +
>> +static struct attribute *ctcu_attrs[] = {
>> +    ctcu_byte_cntr_irq_rw(0),
>> +    ctcu_byte_cntr_irq_rw(1),
>> +    NULL,
>> +};
>> +
>> +static struct attribute_group ctcu_attr_grp = {
>> +    .attrs = ctcu_attrs,
>> +    .is_visible = irq_threshold_is_visible,
>> +};
>> +
>> +static const struct attribute_group *ctcu_attr_grps[] = {
>> +    &ctcu_attr_grp,
>> +    NULL,
>> +};
>> +
>>   static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, 
>> u32 reg_offset,
>>                          u8 bit, bool enable)
>>   {
>> @@ -140,11 +227,15 @@ static int ctcu_set_etr_traceid(struct 
>> coresight_device *csdev, struct coresight
>>   static int ctcu_enable(struct coresight_device *csdev, enum cs_mode 
>> mode,
>>                  struct coresight_path *path)
>>   {
>> +    ctcu_byte_cntr_start(csdev, path);
>> +
>>       return ctcu_set_etr_traceid(csdev, path, true);
>>   }
>>   static int ctcu_disable(struct coresight_device *csdev, struct 
>> coresight_path *path)
>>   {
>> +    ctcu_byte_cntr_stop(csdev, path);
>> +
>>       return ctcu_set_etr_traceid(csdev, path, false);
>>   }
>> @@ -195,7 +286,10 @@ static int ctcu_probe(struct platform_device *pdev)
>>               for (i = 0; i < cfgs->num_etr_config; i++) {
>>                   etr_cfg = &cfgs->etr_cfgs[i];
>>                   drvdata->atid_offset[i] = etr_cfg->atid_offset;
>> +                drvdata->byte_cntr_data[i].irq_ctrl_offset =
>> +                    etr_cfg->irq_ctrl_offset;
>>               }
>> +            ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
>>           }
>>       }
>> @@ -209,6 +303,7 @@ static int ctcu_probe(struct platform_device *pdev)
>>       desc.dev = dev;
>>       desc.ops = &ctcu_ops;
>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>> +    desc.groups = ctcu_attr_grps;
>>       raw_spin_lock_init(&drvdata->spin_lock);
>>       drvdata->csdev = coresight_register(&desc);
>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/ 
>> hwtracing/coresight/coresight-ctcu.h
>> index e9594c38dd91..c52cf6a33d2e 100644
>> --- a/drivers/hwtracing/coresight/coresight-ctcu.h
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu.h
>> @@ -5,19 +5,26 @@
>>   #ifndef _CORESIGHT_CTCU_H
>>   #define _CORESIGHT_CTCU_H
>> +
>> +#include <linux/time.h>
>>   #include "coresight-trace-id.h"
>>   /* Maximum number of supported ETR devices for a single CTCU. */
>>   #define ETR_MAX_NUM    2
>> +#define BYTE_CNTR_TIMEOUT    (3 * HZ)
>> +
>>   /**
>>    * struct ctcu_etr_config
>>    * @atid_offset:    offset to the ATID0 Register.
>> - * @port_num:        in-port number of CTCU device that connected to 
>> ETR.
>> + * @port_num:        in-port number of the CTCU device that connected 
>> to ETR.
>> + * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
>> + * @irq_name:           IRQ name in dt node.
>>    */
>>   struct ctcu_etr_config {
>>       const u32 atid_offset;
>>       const u32 port_num;
>> +    const u32 irq_ctrl_offset;
>>   };
>>   struct ctcu_config {
>> @@ -25,15 +32,68 @@ struct ctcu_config {
>>       int num_etr_config;
>>   };
>> -struct ctcu_drvdata {
>> -    void __iomem        *base;
>> -    struct clk        *apb_clk;
>> -    struct device        *dev;
>> -    struct coresight_device    *csdev;
>> +/**
>> + * struct ctcu_byte_cntr
>> + * @enable:        indicates that byte_cntr function is enabled or not.
>> + * @reading:        indicates that byte-cntr reading is started.
>> + * @reading_data:    indicates that byte-cntr is reading data from 
>> the buffer.
>> + * @thresh_val:        threshold to trigger a interruption.
>> + * @total_size:        total size of the transferred data.
>> + * @irq:        allocated number of the IRQ.
>> + * @irq_cnt:        IRQ count number for triggered interruptions.
>> + * @wq:            waitqueue for reading data from ETR buffer.
>> + * @spin_lock:        spinlock of byte_cntr_data.
>> + * @irq_ctrl_offset:    offset to the BYTECNTVAL Register.
>> + */
>> +struct ctcu_byte_cntr {
>> +    bool            enable;
>> +    bool                    reading;
>> +    bool            reading_data;
>> +    u32            thresh_val;
>> +    u64            total_size;
>> +    int            irq;
>> +    atomic_t        irq_cnt;
>> +    wait_queue_head_t    wq;
>>       raw_spinlock_t        spin_lock;
>> -    u32            atid_offset[ETR_MAX_NUM];
>> +    u32            irq_ctrl_offset;
>> +};
>> +
>> +struct ctcu_drvdata {
>> +    void __iomem            *base;
>> +    struct clk            *apb_clk;
>> +    struct device            *dev;
>> +    struct coresight_device        *csdev;
>> +    struct ctcu_byte_cntr        byte_cntr_data[ETR_MAX_NUM];
>> +    raw_spinlock_t            spin_lock;
>> +    u32                atid_offset[ETR_MAX_NUM];
>>       /* refcnt for each traceid of each sink */
>> -    u8            traceid_refcnt[ETR_MAX_NUM] 
>> [CORESIGHT_TRACE_ID_RES_TOP];
>> +    u8                traceid_refcnt[ETR_MAX_NUM] 
>> [CORESIGHT_TRACE_ID_RES_TOP];
>>   };
>> +/**
>> + * struct ctcu_irq_thresh_attribute
>> + * @attr:    The device attribute.
>> + * @idx:    port number.
>> + */
>> +struct ctcu_byte_cntr_irq_attribute {
>> +    struct device_attribute    attr;
>> +    u8            port;
>> +};
>> +
>> +#define ctcu_byte_cntr_irq_rw(port)                    \
>> +    (&((struct ctcu_byte_cntr_irq_attribute[]) {            \
>> +       {                                \
>> +        __ATTR(irq_threshold##port, 0644, irq_threshold_show,    \
>> +        irq_threshold_store),                    \
>> +        port,                            \
>> +       }                                \
>> +    })[0].attr.attr)
>> +
>> +void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 
>> offset);
>> +
>> +/* Byte-cntr functions */
>> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct 
>> coresight_path *path);
>> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct 
>> coresight_path *path);
>> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata 
>> *drvdata, int port_num);
>> +
>>   #endif
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-core.c
>> index 110eedde077f..948ea864f2a1 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -293,7 +293,10 @@ static ssize_t tmc_read(struct file *file, char 
>> __user *data, size_t len,
>>           return -EFAULT;
>>       }
>> -    *ppos += actual;
>> +    if (drvdata->buf_node)
>> +        drvdata->buf_node->pos += actual;
>> +    else
>> +        *ppos += actual;
>>       dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
>>       return actual;
>> @@ -748,11 +751,12 @@ static const struct tmc_sysfs_ops etb_sysfs_ops = {
>>       .get_trace_data    = tmc_etb_get_sysfs_trace,
>>   };
>> -static const struct tmc_sysfs_ops etr_sysfs_ops = {
>> +const struct tmc_sysfs_ops etr_sysfs_ops = {
>>       .read_prepare    = tmc_read_prepare_etr,
>>       .read_unprepare    = tmc_read_unprepare_etr,
>>       .get_trace_data    = tmc_etr_get_sysfs_trace,
>>   };
>> +EXPORT_SYMBOL_GPL(etr_sysfs_ops);
>>   static int __tmc_probe(struct device *dev, struct resource *res)
>>   {
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index f4223215ef8d..8896fb7a9ed3 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1185,6 +1185,10 @@ ssize_t tmc_etr_get_sysfs_trace(struct 
>> tmc_drvdata *drvdata,
>>       ssize_t actual = len;
>>       struct etr_buf *etr_buf = drvdata->sysfs_buf;
>> +    /* Reading the buffer from the buf_node if it exists*/
>> +    if (drvdata->buf_node)
>> +        etr_buf = drvdata->buf_node->sysfs_buf;
>> +
>>       if (pos + actual > etr_buf->len)
>>           actual = etr_buf->len - pos;
>>       if (actual <= 0)
>> @@ -1248,6 +1252,20 @@ static void __tmc_etr_disable_hw(struct 
>> tmc_drvdata *drvdata)
>>   }
>> +/**
>> + * tmc_etr_enable_disable_hw - enable/disable the ETR hw.
>> + * @drvdata:    drvdata of the TMC device.
>> + * @enable:    indicates enable/disable.
>> + */
>> +void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool enable)
>> +{
>> +    if (enable)
>> +        __tmc_etr_enable_hw(drvdata);
>> +    else
>> +        __tmc_etr_disable_hw(drvdata);
>> +}
>> +EXPORT_SYMBOL_GPL(tmc_etr_enable_disable_hw);
>> +
>>   void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>>   {
>>       __tmc_etr_disable_hw(drvdata);
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>> hwtracing/coresight/coresight-tmc.h
>> index aaa443abe8e9..183c649b982c 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -260,6 +260,7 @@ struct etr_buf_node {
>>    *         Used by ETR/ETF.
>>    * @etr_buf_list: List that is used to manage allocated etr_buf.
>>    * @sysfs_ops:    Read operations for the sysfs mode.
>> + * @buf_node:    Available buffer_node for byte-cntr reading.
>>    */
>>   struct tmc_drvdata {
>>       struct clk        *atclk;
>> @@ -292,6 +293,7 @@ struct tmc_drvdata {
>>       struct tmc_resrv_buf    crash_mdata;
>>       struct list_head        etr_buf_list;
>>       const struct tmc_sysfs_ops    *sysfs_ops;
>> +    struct etr_buf_node    *buf_node;
>>   };
>>   /**
>> @@ -371,6 +373,7 @@ void tmc_etr_disable_hw(struct tmc_drvdata *drvdata);
>>   extern const struct coresight_ops tmc_etr_cs_ops;
>>   ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
>>                   loff_t pos, size_t len, char **bufpp);
>> +extern const struct tmc_sysfs_ops etr_sysfs_ops;
>>   #define TMC_REG_PAIR(name, lo_off, hi_off)                \
>> @@ -480,5 +483,6 @@ struct etr_buf *tmc_etr_get_buffer(struct 
>> coresight_device *csdev,
>>   extern const struct attribute_group coresight_etr_group;
>>   void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
>>   int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int 
>> num_nodes);
>> +void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool 
>> enable);
>>   #endif
>>
> 


