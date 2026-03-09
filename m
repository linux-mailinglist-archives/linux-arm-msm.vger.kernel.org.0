Return-Path: <linux-arm-msm+bounces-96115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA4THI9qrmkgEAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:37:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4276423443A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D16F03055DDA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 06:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68E035CB8B;
	Mon,  9 Mar 2026 06:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AxMKdj71";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T6568o9c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CD82EBBA4
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 06:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773038074; cv=none; b=kgHfrp4YasipiFwz4VcNmyPdzprUqDDvy4cwrJpZWfCJ+xdZK4gd1mO6bTgVqKytWoYdjo5CYdIXyqyJKWgm1u+QjurQtE7u6GkSw8z9JaPWvml2lqIhMQajpKYOZflnYAlDcyh9YaKn8knEjFrUjbsa7gToz6bRv/741LiJr50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773038074; c=relaxed/simple;
	bh=icUBj0qp3uuBRZN/eVTM+2O0OtMd+31sH8uVSKfXz2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lv9LMRtQOSbVpkzcws+lmXQjU3rW24DsLEKQDPL4vwi9+a88mbrW3mA0YvK1Pyt95SMLGoDEudrAiS1l7gjVgFPAU+3h9kByAlY1Dt4BHHQe3d5G4NK8cKnh5IlVrcj82o/LL0x0YnPiw/sA6uSrYHjRGbYVVCM3CVI5AXe/S1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AxMKdj71; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T6568o9c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6295xrZh2464068
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 06:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0I+w+n9z5EIDtru8upH+708VjeIrlFx6quJobrk4ltA=; b=AxMKdj71OJI+PSuM
	iITS9pAwifujzI+mPdbfmNjSAqQNp4EyQVd0d3gfu+sHyJvlMMN+5SI1OeCZfN3k
	0sJ0zywX7Hk6lqyTwsRIXQkUr/3UVGS0DWc5MC0O4suKYDg3OWfPEwTW3Okb0Y5f
	TK38xukZPlc+3S4N9fbGsEyrkTQS8HE22Tz1wFHcmzGtu8bBjeWOq8DW0esVQvYg
	CPmjGRd9P1fn8d86qagTbOIfUfDqPEPA4/U8fBEt+BGkKrIBM3Ijld3LVu4vbu0e
	wDr68ycZFCF9HbNfLafo4Nk0oQpr9Q5TXTWc6t7L0s0JolVfvbQEtfKEnQN8RQ6G
	KKkfTg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrma0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 06:34:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c738563e61eso2941195a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773038071; x=1773642871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0I+w+n9z5EIDtru8upH+708VjeIrlFx6quJobrk4ltA=;
        b=T6568o9cf4omHooslTDxvtCmi3l4cFxoJHcCMr3BTBylyolqVYqiQJeMeq3CHtIiiD
         pUv3Xa3B6YhhKlO/fOvAdOo1HN2fNi6VB9fuV1ddbVW5NkCJKmHJBaetdAJ8DVwZO1vU
         M5hZ07aOdP29rZJoXUB4xCv/w5VrKBFRMjj1fUROpYRfpoXkGOTYKLmHLN2iIUSEi9aA
         mrgDFFMi97tvste6LQStGD597oFXQcG5aEvN2doN6wSnOHX8VXYul0JBaOUKEDvijQu+
         yrf6zOuepwKwD9UzCey+/OJ0R9VMtqMKz4t1oZ/NQjFeyV5t8wQxmGoqHrp1SVzhtPtm
         PKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038071; x=1773642871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0I+w+n9z5EIDtru8upH+708VjeIrlFx6quJobrk4ltA=;
        b=MWJp4jHBgph/5fiKm3DV9TDfXPlLJg2E+XleTGMgvKFbbbqr5EXezELZxcHBjCS4sf
         DIPv6UjRjXgCnyh/fEQ5D2A6GD3QcRyoJoDgBoIufz4J0iG3lczxJBJi5xL9WBcMieDh
         y0JAjUB1k08BpVy0MfUxvtyQNElUVsDlutnq4pSU53qC7b4Xxca4gyoP4Du5KqRhVl++
         CQBxRJYJzJz6GOwY0y+Umhl5qYvuG7ffLet+PwfwY9oACWN8vQSsrzSwWU7MYfNq3MBw
         yy7qhE+b6ZNMFlHlnbHLHfU0v/HotkaXKoY8OF0Pc/v+iqOS3zhqkQDtr+IHblhtgK4G
         +0Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUZJmsL4Pq1pCq6wlsQitwZtNewNedGXpvjn6QlZUvv5go0n3YRuG+fT4H+bNbV8B6lHKWkePN4wRJ5mg+6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn5IkJElY/3xGW2VcjJ7/4YJWnHub1gu8YJzC0BgbxS23DyAr8
	kRAZyuzMjKGyoTJP4jwUZWswxwv+qOL8PdqNuYl5VuQSdatB7zy/aL9jmdFeuUVqc6TyLgQU6Jw
	7LeNGJTeig001DRkvSgoplrNO1qzvlJW4t+Bo2ZHUml90rzJGx7/lg8Mg5fMpmBri3X3K
X-Gm-Gg: ATEYQzz41qccutjRagRWEbtSzyNuHVzO2xI4SUEH1LZE1w2GXV/HXV9tZp6G6x78mMQ
	y/cknZ0PPSsd5Nib9LIlrzS7ABR/3uSqISVDZnY4dTmsSwOtHG8fuQfNkZQChOb5/xXXXnZB8Vd
	UwWr1lEB0NR3ssl5lBjpzd0xnXvNdKOCUhtHA7JFWmSHW5vV7RNJLIMNXsCVCpR9lMjqqkexXfy
	fJDIggaPU3l3eABq8vIGAIg5WEM+7pr5xczVjGbJnoqpTw6OJ/ehyIsZxVmTS9Oz1kZ1imFuGGJ
	oGCSKx163uN9UOGq3vHB1YTzr1BrAF+yPCRnjnH4DiWc3pV9S/+oBS2DO8Qa5ehdVqQgm6RKcc6
	59cz8MbJ7VyGc6+1GXkKwEFclQXz7ZzIFtg48AurAKpNB58GQku8=
X-Received: by 2002:a05:6a00:21d4:b0:823:64e:9e52 with SMTP id d2e1a72fcca58-829a2df475fmr7784516b3a.21.1773038070634;
        Sun, 08 Mar 2026 23:34:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:21d4:b0:823:64e:9e52 with SMTP id d2e1a72fcca58-829a2df475fmr7784481b3a.21.1773038070103;
        Sun, 08 Mar 2026 23:34:30 -0700 (PDT)
Received: from [10.218.12.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48b406csm9447886b3a.53.2026.03.08.23.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 23:34:29 -0700 (PDT)
Message-ID: <9cd46129-4cb6-47cf-b59e-454b980e01a1@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:04:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] thermal: Add Remote Proc cooling driver
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
 <20260127155722.2797783-2-gaurav.kohli@oss.qualcomm.com>
 <aaqcE5jk-JCoBVG7@mai.linaro.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <aaqcE5jk-JCoBVG7@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69ae69f7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=a4_5xkhM6FseDPdgHKsA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: XP6ipLjhZ9-YgroS1UBFeQFaPMiaqKIT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA1OSBTYWx0ZWRfX4nvfKIVQzgK6
 XZlFzqVzJojqjhkoUxgl+c3fXLbyhEuipBU4vr/2oFJNRV3cO+GdksH970AYkNjWBCI3zli2Jim
 O9t3m9IloB7YdBVRsFcQkjqmS+7019MU7LgQnDRCxlmQciYxTJplPAiPcjLu2obdtYjeZU/L6Dx
 bRSDSlhXWOHERJXws8lx5eyLFlG+Sctutrr9b20EY+TWJQrqhpsM6DxMvP5/zWHOuMkWEcBxvik
 qS60yxt5xWXgz4OpAICB6oKV7MxMxDWQ6pcphqu65pUzoh782DZbZsG1coKPEQV6QNRSuk0wAje
 dBX0qX4S+fSrs0s08q07+H5X2HuUnWzAA/hric0dG8+JRxZw7jiAHXyinacUxoqi4e1JkXPjoRS
 9VDPHJ9yjg4vQDR1Jl5vTqckVpvT4tpoLQgbi6nikr+QkIGmycXoIbWylbfZsTi0G5ZGCFf1iNA
 Yme4ItLF25pbEFOh2Xw==
X-Proofpoint-GUID: XP6ipLjhZ9-YgroS1UBFeQFaPMiaqKIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090059
X-Rspamd-Queue-Id: 4276423443A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96115-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,arm.com:email,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/6/2026 2:49 PM, Daniel Lezcano wrote:
> On Tue, Jan 27, 2026 at 09:27:15PM +0530, Gaurav Kohli wrote:
>> Add a new generic driver for thermal cooling devices that control
>> remote processors (modem, DSP, etc.) through various communication
>> channels.
>>
>> This driver provides an abstraction layer between the thermal
>> subsystem and vendor-specific remote processor communication
>> mechanisms.
>>
>> Advantage of this to avoid duplicating vendor-specific logic
>> in the thermal subsystem and make it easier for different vendors
>> to plug in their own cooling mechanisms via callbacks.
> 
> These changes add a layer on top of another existing without bringing
> a real benefit. At the first glance, it appears to be an ops calling
> an ops with an extra unneeded lock.
> 
> IMO, a remote proc cooling device should at least group all common
> rproc calls found in the different SoC doing the same thing. Otherwise
> it is not worth to add it.
> 

Thanks, Daniel, for the review.

Since this cooling driver is only invoked after the remote processor 
(rproc) has started, there are no additional callbacks to consolidate. 
The only interaction remaining is the registration with the thermal 
cooling framework.

>> Suggested-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                          |   7 ++
>>   drivers/thermal/Kconfig              |  10 ++
>>   drivers/thermal/Makefile             |   2 +
>>   drivers/thermal/remoteproc_cooling.c | 143 +++++++++++++++++++++++++++
>>   include/linux/remoteproc_cooling.h   |  52 ++++++++++
>>   5 files changed, 214 insertions(+)
>>   create mode 100644 drivers/thermal/remoteproc_cooling.c
>>   create mode 100644 include/linux/remoteproc_cooling.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 414f44093269..5ebc7819d2cf 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -26169,6 +26169,13 @@ F:	drivers/thermal/cpufreq_cooling.c
>>   F:	drivers/thermal/cpuidle_cooling.c
>>   F:	include/linux/cpu_cooling.h
>>   
>> +THERMAL/REMOTEPROC_COOLING
>> +M:	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> +L:	linux-pm@vger.kernel.org
>> +S:	Supported
>> +F:	drivers/thermal/remoteproc_cooling.c
>> +F:	include/linux/remoteproc_cooling.h
>> +
>>   THERMAL/POWER_ALLOCATOR
>>   M:	Lukasz Luba <lukasz.luba@arm.com>
>>   L:	linux-pm@vger.kernel.org
>> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
>> index b10080d61860..dfc52eed64de 100644
>> --- a/drivers/thermal/Kconfig
>> +++ b/drivers/thermal/Kconfig
>> @@ -229,6 +229,16 @@ config PCIE_THERMAL
>>   
>>   	  If you want this support, you should say Y here.
>>   
>> +config REMOTEPROC_THERMAL
>> +	tristate "Remote processor cooling support"
>> +	help
>> +	  This implements a generic cooling mechanism for remote processors
>> +	  (modem, DSP, etc.) that allows vendor-specific implementations to
>> +	  register thermal cooling devices and provide callbacks for thermal
>> +	  mitigation.
>> +
>> +	  If you want this support, you should say Y here.
>> +
>>   config THERMAL_EMULATION
>>   	bool "Thermal emulation mode support"
>>   	help
>> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
>> index bb21e7ea7fc6..ae747dde54fe 100644
>> --- a/drivers/thermal/Makefile
>> +++ b/drivers/thermal/Makefile
>> @@ -34,6 +34,8 @@ thermal_sys-$(CONFIG_DEVFREQ_THERMAL) += devfreq_cooling.o
>>   
>>   thermal_sys-$(CONFIG_PCIE_THERMAL) += pcie_cooling.o
>>   
>> +thermal_sys-$(CONFIG_REMOTEPROC_THERMAL) += remoteproc_cooling.o
>> +
>>   obj-$(CONFIG_K3_THERMAL)	+= k3_bandgap.o k3_j72xx_bandgap.o
>>   # platform thermal drivers
>>   obj-y				+= broadcom/
>> diff --git a/drivers/thermal/remoteproc_cooling.c b/drivers/thermal/remoteproc_cooling.c
>> new file mode 100644
>> index 000000000000..f958efa691b3
>> --- /dev/null
>> +++ b/drivers/thermal/remoteproc_cooling.c
>> @@ -0,0 +1,143 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Remote Processor Cooling Device
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
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
>> +#define REMOTEPROC_PREFIX		"rproc_"
>> +
>> +struct remoteproc_cooling_ops {
>> +	int (*get_max_level)(void *devdata, unsigned long *level);
>> +	int (*get_cur_level)(void *devdata, unsigned long *level);
>> +	int (*set_cur_level)(void *devdata, unsigned long level);
>> +};
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
>> +	struct thermal_cooling_device *cdev;
>> +	const struct remoteproc_cooling_ops *ops;
>> +	void *devdata;
>> +	struct mutex lock;
>> +};
>> +
>> +/* Thermal cooling device callbacks */
>> +
>> +static int remoteproc_get_max_state(struct thermal_cooling_device *cdev,
>> +				    unsigned long *state)
>> +{
>> +	struct remoteproc_cdev *rproc_cdev = cdev->devdata;
>> +	int ret;
>> +
>> +	mutex_lock(&rproc_cdev->lock);
>> +	ret = rproc_cdev->ops->get_max_level(rproc_cdev->devdata, state);
>> +	mutex_unlock(&rproc_cdev->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int remoteproc_get_cur_state(struct thermal_cooling_device *cdev,
>> +				    unsigned long *state)
>> +{
>> +	struct remoteproc_cdev *rproc_cdev = cdev->devdata;
>> +	int ret;
>> +
>> +	mutex_lock(&rproc_cdev->lock);
>> +	ret = rproc_cdev->ops->get_cur_level(rproc_cdev->devdata, state);
>> +	mutex_unlock(&rproc_cdev->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int remoteproc_set_cur_state(struct thermal_cooling_device *cdev,
>> +				    unsigned long state)
>> +{
>> +	struct remoteproc_cdev *rproc_cdev = cdev->devdata;
>> +	int ret;
>> +
>> +	mutex_lock(&rproc_cdev->lock);
>> +	ret = rproc_cdev->ops->set_cur_level(rproc_cdev->devdata, state);
>> +	mutex_unlock(&rproc_cdev->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct thermal_cooling_device_ops remoteproc_cooling_ops = {
>> +	.get_max_state = remoteproc_get_max_state,
>> +	.get_cur_state = remoteproc_get_cur_state,
>> +	.set_cur_state = remoteproc_set_cur_state,
>> +};
>> +
>> +struct remoteproc_cdev *
>> +remoteproc_cooling_register(struct device_node *np,
>> +			    const char *name, const struct remoteproc_cooling_ops *ops,
>> +			     void *devdata)
>> +{
>> +	struct remoteproc_cdev *rproc_cdev;
>> +	struct thermal_cooling_device *cdev;
>> +	int ret;
>> +
>> +	if (!name || !ops)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	rproc_cdev = kzalloc(sizeof(*rproc_cdev), GFP_KERNEL);
>> +	if (!rproc_cdev)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	rproc_cdev->ops = ops;
>> +	rproc_cdev->devdata = devdata;
>> +	mutex_init(&rproc_cdev->lock);
>> +
>> +	char *rproc_name __free(kfree) =
>> +		kasprintf(GFP_KERNEL, REMOTEPROC_PREFIX "%s", name);
>> +	/* Register with thermal framework */
>> +	if (np)
>> +		cdev = thermal_of_cooling_device_register(np, rproc_name, rproc_cdev,
>> +							  &remoteproc_cooling_ops);
>> +	else
>> +		cdev = thermal_cooling_device_register(rproc_name, rproc_cdev,
>> +						       &remoteproc_cooling_ops);
>> +
>> +	if (IS_ERR(cdev)) {
>> +		ret = PTR_ERR(cdev);
>> +		goto free_rproc_cdev;
>> +	}
>> +
>> +	rproc_cdev->cdev = cdev;
>> +
>> +	return rproc_cdev;
>> +
>> +free_rproc_cdev:
>> +	kfree(rproc_cdev);
>> +	return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL_GPL(remoteproc_cooling_register);
>> +
>> +void remoteproc_cooling_unregister(struct remoteproc_cdev *rproc_cdev)
>> +{
>> +	if (!rproc_cdev)
>> +		return;
>> +
>> +	thermal_cooling_device_unregister(rproc_cdev->cdev);
>> +	mutex_destroy(&rproc_cdev->lock);
>> +	kfree(rproc_cdev);
>> +}
>> +EXPORT_SYMBOL_GPL(remoteproc_cooling_unregister);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Remote Processor Cooling Device");
>> diff --git a/include/linux/remoteproc_cooling.h b/include/linux/remoteproc_cooling.h
>> new file mode 100644
>> index 000000000000..721912d1a5ec
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
>> +	int (*get_max_level)(void *devdata, unsigned long *level);
>> +	int (*get_cur_level)(void *devdata, unsigned long *level);
>> +	int (*set_cur_level)(void *devdata, unsigned long level);
>> +};
>> +
>> +struct remoteproc_cdev;
>> +
>> +#ifdef CONFIG_REMOTEPROC_THERMAL
>> +
>> +struct remoteproc_cdev *
>> +remoteproc_cooling_register(struct device_node *np,
>> +			    const char *name,
>> +			     const struct remoteproc_cooling_ops *ops,
>> +			     void *devdata);
>> +
>> +void remoteproc_cooling_unregister(struct remoteproc_cdev *rproc_cdev);
>> +
>> +#else /* !CONFIG_REMOTEPROC_THERMAL */
>> +
>> +static inline struct remoteproc_cdev *
>> +remoteproc_cooling_register(struct device_node *np,
>> +			    const char *name,
>> +			     const struct remoteproc_cooling_ops *ops,
>> +			     void *devdata)
>> +{
>> +	return ERR_PTR(-EINVAL);
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
>> -- 
>> 2.34.1
>>
> 


