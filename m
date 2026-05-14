Return-Path: <linux-arm-msm+bounces-107578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCABIQy1BWqeZwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:42:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FE754122B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9DE13030D7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 11:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617AD3C2BA3;
	Thu, 14 May 2026 11:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ejb/PgHL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdQQwjTB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BECA3C3795
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 11:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758914; cv=none; b=pQ4qzWAjQkot5Yj3aodr8BnWDmnM8RnaAV9EAEtV0RvssCR9yJEsiKEbejlzK0cJH6QKOuhTIBnaJf4JjwUIbTYB7J1Z6YWhuc8HK7x3GJssU2DdAazmGsRW/kPJu1hJs35cr28/W08neaaRrTbPoDtND8Ed+bQcW2hDEdpLm14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758914; c=relaxed/simple;
	bh=ZBNju30QtNx5PO3WA9oP+jix/lPYme6w15d21uQ73ZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3VfWToq/sGS+/yQAnXF3+MyGjTy4P/fuUII950YD7is58cwAnNtM7kJctU2kIa1GxgOA6X3jBHVohus0AFX+aLJ8b6MhaD5KinbY58yJTCodIuMnUVceKiEDJQ5oNH3XB9teW40iDID/3Mq25IaePusLfC/mJfTQf30TxodwLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ejb/PgHL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdQQwjTB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeYR62238424
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 11:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XN/svW0Jt+ncyOKlvvxZnVvpxXsVA9QC86tQ/FOEaIY=; b=Ejb/PgHL4Hh2Pyf1
	vLHN+/6ozUtuCdEpQMd9u4UOr8Kh5EHOCzn0MwqcUrMfF1KY1DfwLwQhvf0fOBmN
	K6qz1qRJQW/7HIfhRTqWXWJ5l5gxw6liZbpJ++KhhNssFQtj5lRz4rVOc65s67+U
	0NaDXs6dqMDYKSqJv2uUmMm4mbhbzHh7B2GIt/o7xyfoYxvUrnnaSkqy8TebPwrr
	NRFFRA/QI8az8+s+YIP1egAr53LTgGu1zaUkg8O8OEUUIQmq3qPBbsvqhUO6gMAa
	viClD+QsJeoZkuQrhA3ljtP3LhvZU/FSFnNWYUFgjq4kldA2KaspJpb4bn+/taxc
	b6ubig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bhkcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 11:41:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd6cc53fd6so3575865ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778758910; x=1779363710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XN/svW0Jt+ncyOKlvvxZnVvpxXsVA9QC86tQ/FOEaIY=;
        b=LdQQwjTBY99PS7PRR2fzAT6vDV1NnXzljcDZBccZWK4qkRX4JqkmmQuWsJLIcpeN2G
         OR+hRXxkaRYJaWCIe7sj3bu1wfO1zqlMKFtaAVAmoGoX7plXDHCbNk/sXrgV6fhF6OYc
         YnFKh/jB0sax1hjV/1Q2xv9b1UflGWwISb5iYOnt+AuytEGU9wRjAawp6sS4Ku8yG+kj
         OFLAMuXeIwIfTWQzS7gwzfEC/Mb1ObYfvq1zgaerppW95nDpeysF4AT8hLRfDxKrirEv
         iU9QOMHWrMoiHws4O5HR/01z3qtT0dqjgJ2K5BrWxuqG3J8Hkw33gqDbOKbbqp1j3s9o
         T2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778758910; x=1779363710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XN/svW0Jt+ncyOKlvvxZnVvpxXsVA9QC86tQ/FOEaIY=;
        b=H1JTtA43rlfycyqLldryHMW0GQ4WELJzEFt2E2jnB5UXNSXyx9rTp6FK2k4eBLXCvd
         wEKNmFnVnHRyY/MiD6351P/9LjHwZlfPw13yohOM1KR2tSb+zo6L5YZ6gD65l2hiLmbh
         Oq6arAbuf3pyOk3+f3sAlBWL/RBbc8dTiA47cRn7jI76U9btc0kQGQr801vEVUkBRH7e
         +7TC9UtL5b1UK8/6jbUUuIszD9Df8jv5lUkfDEDrRqxXOIvSjJroLonatAGMNjLeuS2h
         sT3aBJGsXgmi+/HoguwvbRcgO+t8cGXXa8i0fWw19F5p6IYGyf/l9a9vDmCmz/AyaDLf
         JzQw==
X-Gm-Message-State: AOJu0Ywjrsle1O3Gni7CkqgZ6ma3TMmSggLW3e23ySTxZ2LRQpPirti/
	Ot/LPPpRHlIngxy4Qh2kW/6Ih3zHHcVo82aTo33pDbvdt203InxWnHw3CPSZK684AZiFJKB3LwH
	epndeldRHg3ceo4yKHIWuGZQFDFDNyV0nj6Jm+7JqimrcI6H7Kjzdx/V1J+3el+F0b1e1
X-Gm-Gg: Acq92OHZsNOY6cVzK2SfCWmV3F3VApY7JrKUXMpbGTiouxmyV3TtNfJjvj7TOxjc8nL
	tpLD9RgIU3F0BxEtNAnvhV09S7GusZ22pH94/7z6ahtXCRT3ecq0IMaoct3irkCv65l6Kiq8vHv
	Fh/qdx1Y6otUbD9ckt2Hw55/+/Pr+1snZEDnwqbPulyob4PrUMgCVEOBOlH4e5pTmF/268PPe0A
	0VEVT548Z1MrH9iF/z5NhHQ4zewPAieO7IWVpsPHCJ+ivHOxXd1X3WjzfN6uEM/yQvQroT9nxz9
	InCLOaR30X28J5qIbA/TdL2IG4KENRyAQzXq8yWj56h7tC4bw5vNPANOAexsEsyrtC80QEKZG8G
	nHfMluiY70KRcU69Dvp3jUaIGVddVUsYxvf4SOVd2G0Cc76N25Kp986OcyDkLZzNMBm9VBQW4ZT
	lKqhxpBG6R0Tj8faqj9/aHqDT5psfhH/NppVQOg0E=
X-Received: by 2002:a17:902:f54f:b0:2bd:7ca:e67d with SMTP id d9443c01a7336-2bd276dfda1mr85598105ad.29.1778758910258;
        Thu, 14 May 2026 04:41:50 -0700 (PDT)
X-Received: by 2002:a17:902:f54f:b0:2bd:7ca:e67d with SMTP id d9443c01a7336-2bd276dfda1mr85597715ad.29.1778758909638;
        Thu, 14 May 2026 04:41:49 -0700 (PDT)
Received: from [10.190.200.238] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd384sm24879805ad.65.2026.05.14.04.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 04:41:49 -0700 (PDT)
Message-ID: <5494a379-1e49-4551-a5f0-50d0bd7cd7d0@oss.qualcomm.com>
Date: Thu, 14 May 2026 17:11:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V6 0/8] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        sudeep.holla@kernel.org, konradybcio@kernel.org,
        myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, cristian.marussi@arm.com,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, jonathanh@nvidia.com,
        thierry.reding@kernel.org, digetx@gmail.com, conor+dt@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
 <436ce846-bd9e-45bb-bdc2-d2a0fd00dc25@arm.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <436ce846-bd9e-45bb-bdc2-d2a0fd00dc25@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: drRnZnpHeSWQTEk0_6y3H7V38QEdeHr_
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a05b4ff cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=2dUMNUc8cBhmsmHMSX8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDExNyBTYWx0ZWRfXyDmGfSIOT/g2
 knlTFztK+vSgOcPbGH2NEb8Y9zBQrURxbtMan6RUIhy+lZCjwRfaDvww4VNU5NrcHW1VvSRdoLo
 D5fBEgZ/JVSMag5oF0ljoRiewiofAhY1YpD0y+dGmaq7WvWoP8T4m867qlRQYuDC2nKWp+uMmpI
 tjPd05VLh1QJnQEYYMGYNtaWbmrYCwIIWj4lOBBfzzQqfv/mHTnJdwEVf/TFOeYOSbMqAJVs7Gk
 GAAspNE1vItWvzPjp6Z0HpYAJDOE45EPyB1GeYYYQB4r4Y2nBtaueL58emrFyA3Ysn6H6zNB0eW
 pkd5jyvpUZVkVhd/m/wjSyL5ekwAFUMBsyarJeqpi3MoRmuGI/+6W3zOmbqXB4xjvCQ1Vs9479X
 gAVqzYgqcgVE3BLyGWdnKYXrpmmEojRf0XFl2cn64YzMZNt4tovsDcK6tAQjqdsuCooWWOuPmNb
 dl9/E6xl5uqeuUC7YNA==
X-Proofpoint-GUID: drRnZnpHeSWQTEk0_6y3H7V38QEdeHr_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140117
X-Rspamd-Queue-Id: 31FE754122B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,samsung.com,arm.com,lists.freedesktop.org,oss.qualcomm.com,nvidia.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-107578-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/13/2026 10:30 PM, Lukasz Luba wrote:
>
>
> On 5/7/26 07:22, Sibi Sankar wrote:
>> The QCOM SCMI vendor protocol provides a generic way of exposing a 
>> number of
>> Qualcomm SoC specific features (like memory bus scaling) through a 
>> mixture of
>> pre-determined algorithm strings and param_id pairs hosted on the SCMI
>> controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor 
>> and the
>> mechanism to control the various caches and ram is hosted on the CPU 
>> Control
>> Processor (CPUCP) and the method to tweak and start the governor is 
>> exposed
>> through the QCOM SCMI Generic Extension Protocol.
>>
>> This series introduces the devfreq scmi client driver that uses the 
>> memlat
>> algorithm string hosted on QCOM SCMI Generic Extension Protocol to 
>> detect
>> memory latency workloads and control frequency/level of the various 
>> memory
>> buses (DDR/LLCC/DDR_QOS). The DDR/LLCC/DDR_QOS are modelled as devfreq
>> devices, with the governor set to remote devfreq governor. This 
>> serves as
>> a way to get a basic insight into the device operation through 
>> trans_stat
>> and provides for ways to further tweak the parameters of the remote
>> governor.
>>
>> Transtat data for DDR/LLCC/DDR_QOS is now available in this series:
>>
>> #cat llcc/trans_stat
>>> From  :   To
>> 315000000 479000000 545000000 725000000 840000000 
>> 95900000010900000001211000000   time(ms)
>> 315000000:         0         3         6         6 6         
>> 7         0        30    143956
>> 479000000:         2         0         7         1 1         
>> 1         0         3       356
>> 545000000:         7         6         0         5 5         
>> 0         0        10      1200
>> 725000000:         3         0         5         0 6         
>> 1         0         6      2172
>> 840000000:         8         2         3         2 0         
>> 4         0        12      1188
>> 959000000:         3         0         1         2 2         
>> 0         0        13       272
>> 1090000000:         0         0         0         0 0         
>> 0         0         0         0
>> 1211000000:        35         4        11         5 11         
>> 8         0         0     21684
>> Total transition : 253
>>
>> QCOM SCMI Generic Vendor protocol background:
>> It was found that a lot of the vendor protocol used internally was
>> for debug/internal development purposes that would either be super
>> SoC specific or had to be disabled because of some features being
>> fused out during production. This lead to a large number of vendor
>> protocol numbers being quickly consumed and were never released
>> either. Using a generic vendor protocol with functionality abstracted
>> behind algorithm strings gave us the flexibility of allowing such
>> functionality exist during initial development/debugging while
>> still being able to expose functionality like memlat once they have
>> matured enough. The param-ids are certainly expected to act as ABI
>> for algorithms strings like MEMLAT.
>>
>> Thanks in advance for taking time to review the series.
>>
>

Hey Lukasz,

Thanks for taking time to review the series!

> Based on this description I have a few questions:
> 1. Why we don't use SCMI notifications for this purpose?


This is an attempt to retrofit firmware, that is already out in the wild 
running
on X1E laptops and Glymur which continues to use the same firmware, into
generic linux frameworks, so that it provides some useful information to 
user
rather than it being a complete black box. We already have a ton of firmware
changes suggested by Sudeep/Cristian that will be taken into account for the
next generation of SoCs, will make sure this is accounted for as well :)

> 2. Is it safe to assume that there was no extra frequency change
>    during that polling sampling period?

Yup, there is expected to be at most one transition of DDR/LLCC/DDR-QOS
per polling cycle.

> 3. Shouldn't we sample 2x faster than the changes that we try to
>    observe?

Yup, that makes sense. Will fix this in the next re-spin.

> 4. IIRC there was some extension in the SCMI protocol for performance
>    domains which allows to expose the stats like the one above but in
>    the shared memory. Why we couldn't use this? It would be more robust.

Same answer as the first point, since the current firmware provides to no
such provisions :(

-Sibi




