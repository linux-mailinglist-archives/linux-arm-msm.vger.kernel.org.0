Return-Path: <linux-arm-msm+bounces-117649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QrI0HktbTmrhLAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:14:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D42572730E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:14:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IsV9nCtk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TPxgsaZP;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117649-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117649-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FF6230A9995
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01572449EB8;
	Wed,  8 Jul 2026 14:09:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C2F3815EF
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:09:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519767; cv=none; b=mqpDlS7B4cprQn5YkEdrPMfl8RwxR8Aaqs1aZyaHwraBAXEftLAUup85jNx60iSyhsYC1dUsocR64jdM/stBvmEx7Lb8+4M90vtswoltbCZCWPmqm4ePiRUByz9vxp1laadEE8RZMxE6PhbqUsov5UNdfdV35rPkyHmwwf3YM+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519767; c=relaxed/simple;
	bh=M+kPnJgis1KlCpWJgIlNur/tgswhBzcaExIdfimmVko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8xpvy4n02YLoS8CDm6Iz9L7RZG3hLGE+oXvZsYLFUDTVcbriQkbP6frhqP7U2OrbaxUcGMsJL4aBtKftju6lcsOEMh3glu2f4tp4tbB3SXAao7LyFwZ0tQ4qJk3JdEBoRGLCzjWvqaB6SRMQS89onJKk3i5exYPiIFpIVEFG8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsV9nCtk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPxgsaZP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3mCY2715660
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 14:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S9+7JwR3cehdU2eLAMAB3QM9HbIAylmwTZgbAV8G6+g=; b=IsV9nCtkKDnu5UcN
	CXEPTUJiQTRUNUB7ePO2xHA8vmGyr2zuMLRy/3V0w7xhpzVC8GHc3XYejVCuHxeJ
	sjWrkBEfF4pxNVsr3un/eca6Zq6lZtYktZi2mDHmv5nZ720Iz7PDnunBMZ9OYsvC
	IsPrMQhuybPeka6zF43WOW6M1fHrxbzbqkal4XH8Gl7/ulwZIkVG/mjKQPLgbyjR
	vv2Vi86hL9wyoRkXaWlQgjRRGUZmyxMTAwbIdJq2g6I7PKP/d0doSk8JfLc1Etge
	qpUtG3vvylc1r0GfvtN1JLHNb5ULSTF1QBFacH95NVfDDTULORzJUiSzzqGaZHwZ
	UdCBGw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd4t0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 14:09:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c110a3b6aso10370361cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783519764; x=1784124564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9+7JwR3cehdU2eLAMAB3QM9HbIAylmwTZgbAV8G6+g=;
        b=TPxgsaZPp/v1cVEbU9IHfvbvLmoBwNsgp0lJWOeA+yLn9S+hBmQdpPHByUji1zxQeV
         Lgd58uk3RziNjIKZQ1dg9ti7BrCbq7OcxT1oiMkMtWvcb5VMoPhDBIOPWlV0AvsoZSjN
         +HdLtxQQ645YyGjkRqunrqBlT4fdPFDFFUtrB4dLdO9l410qlF/JqFrmfiKHZF97InLN
         nSrwqUDNbHDswkU28MF0kmO0fJHHQ6dJ27ib2nuFdnaM6Cv1ikN7fSzbrwDDWFmxLIN6
         LIRQmM5cV6CGe1AOrj+5EZY+ReAmkXE2Qe8vkkouV5MXQGaXfv3zWOp8ZSfQbAduy6Fc
         m32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519764; x=1784124564;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9+7JwR3cehdU2eLAMAB3QM9HbIAylmwTZgbAV8G6+g=;
        b=KLFy0Cob2qGFh3oaTzbStXNcBkyyqgYySkp80ZN4dvzF1rks0E5wDFv/ZeSNtVx1O9
         jc6/wKVkfHLHhQVw+rIiRamoZme0VkcXRmoVWVf5ktecq1eT/xq2MmgNRI6rbPzo/URO
         RhIg0sX3REmy5v1tTYJsSG0V4AKAEkV4QB+Yqw/e5DVFUd2W6v0RfjmOPED98pBrd8cN
         p3CueTSRVqdoX5oa3n3x2KwDfEbtTvoTZe88aTPef+H7ZdkgiS9ciAq2+VN8zbMbLisK
         jzTlErawCNV1ROzKwxIto8++34itXc1kPE54lFcMIgJg+n/50LF4NycKlx0C6qC5llbX
         s5kg==
X-Forwarded-Encrypted: i=1; AHgh+RqJzjWh+0SUgo/1mh7cOznM8z+14Nzmqd8qogUsJyfDbg+Zeynck4aPaXqJ60TAUPMBbacTnz0ZNrzWO6MI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9g1uEkbRNEFfMs8hC3Pvopvo+vXzV46vM19KaHiehuFAeUd8n
	Hi9QccNVnN6ODN+Yo4r0dVWk+/XNTtmYoidJCxvf8ndIKIYgDmgeGiYbui3Ldq2F/Fxf3TaB7HP
	y6gQ2rtU0gvEfrzr9FoGKZ1SmEjQrH6dwXAMfyDSbjmgZgga5X8Ik3zTjVidhSpifrKVk
X-Gm-Gg: AfdE7cnABBXPspvO7fwK2A2PT8Bcl62E6d2xAzRLTyw0nfuz1UGzep0u4dNFp5v4v+o
	tFB3teFmlcGZ2RkodIO/HzTaQ1CH31QjigbAODTceDak8nfRwt6SO+1iW4j33lhd+yK+/p1mr5R
	fJLkZTVU2pMrsyoARDcTTNj93alrXmXplNSpCaT5kolff/H/0P4ECAiVl0aLNAnHFXx+rBI6i9v
	rbfVW8V4OgtX07GVfbcq0XmMJ6XxHmSthmP9Eqn1pba5u6Oq4ND5qw1U/8h1iirXURPOrdO7/eb
	Fh7G62e4UlkaEuGCDyQeTR6p00XcJFH3oaCgW/ncSURofoRjy23ldby67bNugpNZWkLY3eAkCjh
	oJKijE15X+tY1F/dgmha0bjR12mj976B9UWJdTngyhhGQ3nRFXc7jgIECo00KMW4CpHcqCXLl7w
	==
X-Received: by 2002:a05:622a:1805:b0:519:5680:1b5 with SMTP id d75a77b69052e-51c8b3d49ecmr26616541cf.21.1783519764024;
        Wed, 08 Jul 2026 07:09:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1805:b0:519:5680:1b5 with SMTP id d75a77b69052e-51c8b3d49ecmr26615621cf.21.1783519763286;
        Wed, 08 Jul 2026 07:09:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:2110:e352:d7b8:8bf2? ([2a05:6e02:1041:c10:2110:e352:d7b8:8bf2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa09608d4sm44231184f8f.25.2026.07.08.07.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 07:09:22 -0700 (PDT)
Message-ID: <a9cffc04-63c0-4630-be78-dba8f8c3d7d5@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:09:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] Lenovo ThinkPad T14s EC thermal monitoring and
 thermal zone integration
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <ak48gsxhVW492C7H@linaro.org>
 <76b55f79-010d-46a8-a7c6-a47d18ce2143@oss.qualcomm.com>
 <ak5S9D85t6g3Nhfq@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <ak5S9D85t6g3Nhfq@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzOSBTYWx0ZWRfX5QUafKH29ZAU
 tlTDWsIc0M7xCkOurCHKvrO8cnrRLrCsuf/OZJyIF5LVewgzBUKO3XMHs+0StzQ6pjxMMAoW1+4
 Y12kK6u5/AdcpbHdwF5hfOwswlO1B1f041bOhfHYJ7dmxCouQZsFNC+QHW6oCnV4BTQAGTWlMEc
 WycA3cZ0EF4tIvDy7LURt4EgCIu1Hm4Kkpek7s7GZWDWEjpIK/4xQot4KTxkZtgjtSM3O4f+p+1
 VV10fvSgh/Oqw5VdFgq2CqrFN/RQNq/Zv9vEygprJT5ju/OQ4TbFwn1dvXYadhxEVTE+xHCcJnI
 eR0NYpF0znqj+ArL/3SP2ouQldRNgRS9I1GAVl+tJ9VdP4fPC/sz6yyWei2cMSPYfAoUD0laGLd
 9h/4LUGbBkuReWBFmsrY27z1exWEePUw1EWZW2d+2buki/cSPyZ/MtdkDj3NrRyuA8OItYmXul0
 f1C93Y9jDOOwx6PJ++g==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4e5a14 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7Jf4kJHaAAAA:8
 a=8k6WQxmsAAAA:8 a=sC-6kl4urHpWDUBhYdIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22 a=B30mOkiisUNQCrgcu9ts:22
X-Proofpoint-ORIG-GUID: 8p0SNbdlAztI8nEDupJtKBtsyQHtDFaz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzOSBTYWx0ZWRfX2qgaeTRe0ZHP
 efAiKKhXxKiSPRN8FFzzVpywMSLz5AR3+n08TAGEkagpMK+eIBRwJpGAtQqo0f8mndcRbpPyMKY
 SYMT6yjtwQ2yCsI/P3tQ4c0nYIKYe1U=
X-Proofpoint-GUID: 8p0SNbdlAztI8nEDupJtKBtsyQHtDFaz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117649-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D42572730E

On 7/8/26 15:39, Stephan Gerhold wrote:
> On Wed, Jul 08, 2026 at 03:16:20PM +0200, Daniel Lezcano wrote:
>> On 7/8/26 14:03, Stephan Gerhold wrote:
>>> On Tue, Jul 07, 2026 at 09:22:25PM +0200, Daniel Lezcano wrote:
>>>> This series extends the Lenovo ThinkPad T14s embedded controller driver
>>>> with environmental monitoring capabilities and integrates the exposed
>>>> sensors into the Linux thermal framework.
>>>>
>>>> The EC provides access to several platform temperature sensors
>>>> covering the SoC, keyboard area, bottom cover, charging circuitry, QTM
>>>> module and SSD. These sensors are currently used by the firmware for
>>>> thermal management but are not exposed to Linux.
>>>>
>>>> The first patch adds hwmon support for the EC temperature sensors.
>>>>
>>>> The second patch exposes the EC as a thermal sensor provider in the
>>>> device tree and defines thermal zones for the keyboard skin
>>>> temperature and the charging circuitry temperature. This allows the
>>>> generic thermal framework to react to EC-reported temperatures and
>>>> apply standard Linux thermal mitigation policies.
>>>>
>>>> As the EC protocol is not fully decoded, the passive trip points
>>>> get/set actions are missing, so it is not possible to program a
>>>> threshold and receive an interrupt when crossed the way up or
>>>> down. Consequently, the thermal zone related to the charging circuitry
>>>> is polled every two seconds until we can set the trip points in the
>>>> EC.
>>>>
>>>> This series fixes critical thermal issues happening on this platform
>>>> where a kernel compilation, or heavy workloads, lead to a system
>>>> reboot.
>>>>
>>>
>>> Thanks for working on this! I have a few comments/questions about this:
>>
>> Thanks for jumping in the discussion
>>
>>> 1. EC vs PMIC temperature sensors
>>>
>>> AFAIK, the T14s (and actually most X1E laptops) have two sets of
>>> thermistors in each location: One is connected to the PMIC (called
>>> SYS_THERMx), and the other set is connected to the EC.
>>
>>  From the schematics I have in my possession, the SYS_THERMx are connected to
>> the EC, at least this is how they are named. May be it is the other set with
>> different numbers.
>>
>> I'm curious to know why this mirroring ?
>>
> 
> AFAICT the SYS_THERMx thermistors all go to the PMC838C PMIC on the
> T14s. The EC thermistors are on a separate page, search for "RT8203" for
> example.
> 
> I'm not sure why this mirroring exists, but even QC's Hamoa/X1E CRD has
> that. IIRC it is not always there though, the Purwa/X1P CRD has the
> sensors only connected to the EC (maybe for some minor cost savings?).
> 
> I believe on some devices the OS (Windows/Linux) even needs to send
> temperatures (e.g. CPU/GPU temperature) to the EC for it to work
> correctly. Not sure if the T14s needs/uses that though. I was mostly
> looking at the CRD thermal setup a year ago...
> 
>>> The SYS_THERMx sensors connected to the PMIC have been enabled for the
>>> T14s already over a year ago [1]. The reason this is not upstream is
>>> that we now been waiting 3 years for the corresponding ADC/thermal code
>>> to land upstream [2]. It seems pretty close now, the ADC part has landed
>>> and there is only the thermal part left [3].
>>
>> Right, I have to pick this one.
>>
>>> The PMIC thermistor setup is likely going to be similar for most X1E
>>> laptops, so I think it would be preferable to use that instead of the EC
>>> sensors to implement additional temperature throttling. It also supports
>>> interrupts/trip points already, so it doesn't need polling.
>>
>> I definitively second that
>>
>>> The most recent proposed patch actually adds the SYS_THERMx thermal
>>> zones to all X1E-based devices [4], although I'm not sure if it would be
>>> better to keep that device-specific...
>>>
>>> [1]: https://github.com/stephan-gh/linux/commit/c0ddc9fa96667d6b32d690ce6a3dcfc76aaabad6
>>> [2]: https://lore.kernel.org/linux-arm-msm/20230708072835.3035398-1-quic_jprakash@quicinc.com/
>>> [3]: https://lore.kernel.org/linux-arm-msm/20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com/
>>> [4]: https://lore.kernel.org/linux-arm-msm/20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com/
>>>
>>> 2. EC sensor mapping vs PMIC sensor mapping
>>>
>>> In PATCH 2/3 you define:
>>>
>>> 	{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
>>> 	{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
>>> 	{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
>>> 	{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
>>> 	{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
>>> 	{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
>>>
>>> I'm not sure if this is correct. When comparing this with the data read
>>> from the sensors connected to the PMIC:
>>>
>>> | Sensor          | PMIC Channel | EC (hwmon)   | PMIC (thermal)  | Delta    |
>>> |-----------------|--------------|--------------|-----------------|----------|
>>> | SOC             | SYS_THERM0   | 79.0°C       | 78.7°C          | +0.3°C   |
>>> | Keyboard        | SYS_THERM1   | 68.0°C       | 70.1°C          | -2.1°C   |
>>> | Base / Back     | SYS_THERM2   | 66.0°C       | 64.6°C          | +1.4°C   |
>>> | Charging        | SYS_THERM3   | 73.0°C       | 73.8°C          | -0.8°C   |
>>> | West / QTM      | SYS_THERM6   | 64.0°C       | 62.6°C          | +1.4°C   |
>>> | SSD             | SYS_THERM7   | 31.0°C       | 67.1°C          | -36.1°C  |
>>> | Modem           | SYS_THERM4   | N/A          | 31.6°C          | N/A      |
>>> | East            | SYS_THERM5   | N/A          | 70.3°C          | N/A      |
>>>
>>> The SSD delta of 36°C is definitely suspicious. I think
>>> "ssd"/T14S_EC_SYS_THERM7 in your EC driver patch is actually the modem
>>> sensor (SYS_THERM4).
>>
>> Yes probably, it was unclear from the documentation. I may have mixed some
>> info.
>>
>> The SoC sensor seems to be hotter than the Charging sensor. I'm a bit
>> surprised because I've always seen charging hotter than the rest.
>>
> 
> I captured the above while actively stressing the CPU, so presumably the
> SoC was heating up more quickly than the charging in that situation.
> Just a few minutes earlier it was like this in idle state with charging
> indeed warmer than SoC:
> 
> | Sensor          | EC (hwmon)   | PMIC (thermal)  | Delta    |
> |-----------------|--------------|-----------------|----------|
> | SOC             | 35.0°C       | 35.8°C          | -0.8°C   |
> | Keyboard        | 32.0°C       | 33.0°C          | -1.0°C   |
> | Base / Back     | 33.0°C       | 31.9°C          | +1.1°C   |
> | Charging        | 37.0°C       | 38.2°C          | -1.2°C   |
> | West / QTM      | 31.0°C       | 35.7°C          | -4.7°C   |
> | SSD             | 25.0°C       | 34.0°C          | -9.0°C   |
> | Modem           | N/A          | 26.2°C          | N/A      |
> | East            | N/A          | 33.1°C          | N/A      |
> 
>>
>>> If you look at a picture of the T14s mainboard
>>> (https://www.notebookcheck.net/fileadmin/_processed_/d/c/csm_DSC_0003_aadae1ddd2.jpg)
>>> and zoom in to the unpopulated modem sub-board left to the fan you can
>>> see the two thermistors RT601 and RT301. The SSD on the other hand sits
>>> almost directly next to the SoC on the right, so I wouldn't expect it to
>>> stay > 30°C cooler than its surroundings.
>>>
>>> However, there are also two thermistors next to the SSD, see e.g. this
>>> close-up picture of the mainboard:
>>> https://download.lenovo.com/Images/Parts/5B21P83385/5B21P83385_A.jpg
>>> This means that the SSD is probably one of the other mappings. If the
>>> thermistors are consecutively numbered in the EC firmware, the SSD
>>> (RT8203) might be actually the third sensor ("base"/T14S_EC_SYS_THERM2).
>>> I'm not sure how to figure out the proper mapping.
>>>
>>> The back of the mainboard is completely covered with tape
>>> (https://download.lenovo.com/Images/Parts/5B21P83377/5B21P83377_B.jpg)
>>> so it's impossible to see anything there.
>>>
>>> 3. Active vs passive throttling
>>>
>>> Are you matching the Windows cooling/throttling setup here? If not, have
>>> you considered how this interacts with the fan control applied by the
>>> EC? I'm a bit worried that this might lead to unexpected performance
>>> regressions if we start throttling before the EC runs the fan at full
>>> speed.
>>
>> For the moment, I would say fixing the critical issue is the highest
>> priority. With the 'charging' sensor with a 55°C trip point, AFAICT the fan
>> is at full speed before this trip is reached.
> 
> Agreed.
> 
> I'm not sure about the fan speed, I never checked properly but my gut
> feeling is that the fan runs faster in Windows and never runs full speed
> in Linux. (Are there fan profiles maybe? Not sure. Maybe I'm imagining
> it. :-))

When I did some tests with the EC and the fan rpm count, it reports a 
constant augmentation of RPM up to 3600 when starting a CPU workload. So 
I guess 3600 is the max but may be it can go above. I don't know.

Or Windows has control of the fan and is more aggressive by going to 
3600 RPM more often so giving the illusion it turns faster.

Without technical details, it is hard to say.

>> Then we may want to take control of the fan and add active trip and passive
>> trip.
>>
>> This autonomous EC / PMIC mix sounds a bit strange to me :/
>>
> 
> Right, it's all quite complicated. :/ Ideally, we would be able to
> figure out the exact thresholds for the fan control in the EC firmware,
> so that we can set the throttling temperature to be shortly above that..

Perhaps, with a dual boot Windows / Linux, we can read the i2c transfer 
between windows and the EC to figure it out. Unfortunately, I don't have 
enough bandwidth to investigate that now


