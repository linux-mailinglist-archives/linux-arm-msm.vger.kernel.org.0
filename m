Return-Path: <linux-arm-msm+bounces-114532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xUJxNSArPWqAyQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 15:20:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 728E36C6178
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 15:20:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bKLgbtVx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=atcpNZN+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114532-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114532-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0096E30177A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27283326924;
	Thu, 25 Jun 2026 13:20:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13FC320CD9
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 13:20:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782393623; cv=none; b=BXaAx3oe3GrONbKAudu5x7eO5GrGYNkhkGegkzQd6sC6jq1Xlg/8iXdjJ/Ze6RaYJZ1x3gtYDUKjDReUxa+igkheyJVTwd5nnhfZq7lMRCNpllPDIhMAKJttexUs+qFpFMo+NbSFKShynk7YZjHXpYl2aR//nE/+Mo9zoMadVeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782393623; c=relaxed/simple;
	bh=hVd/9vBlCbyUh6zt9JM7gQXmP2qyxhw6kvFctofIbA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYk7aTmTgzxu2+GDwfjvUd+EXAVyMtF1AzwDk2xDMapFjWODLjjzkQGoHV2+ZIrfyJQTLQS4tFFqeZ3Zl/JD6y3pT1zZYdisePthMNpuEW+GS3rwtrgr1SLC6V7AO6Al/hCQ4GQNZa+e3Rzgr+ZZhyfKzHwRClg5s4mAMahZdPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKLgbtVx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=atcpNZN+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9k23o1921324
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 13:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GjQjuigvKFd+Z+gtUv1havxbgca7I7GsAQ/BjMMTbQk=; b=bKLgbtVx0zgQeLSv
	RG1K0NCDSfXhwbVrQCu7661cFTEtJXNLKoLoiURkPowe/nqyPIwyo00TJRxo51s8
	HHQ2uiLRacNOz/oBMAzEh2/6tII4Vc5P2n8D3ySTeQrSpD1PXG6aJVQsZqSbDwuZ
	zL2Ufs/1h5DdLyiCCpQXALBFA7Rb+RfsDYq9QrHLVmSDKuN1gk6rGa6/tScSbuWg
	+oiY3ycPk2u2i8bHvNfUGdAa0BEkwfz8pl/Z42rg58DoXDmisvjPf4F3bfPv1hy3
	EtN771a5eopr8Bsi3rVECixyuDK2Bx1x9UzrhsEOLiFEPaH9dZ+MrZtC4SQ+DxXs
	v9midA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueuab4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 13:20:19 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7346c850ec0so514358137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 06:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782393619; x=1782998419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GjQjuigvKFd+Z+gtUv1havxbgca7I7GsAQ/BjMMTbQk=;
        b=atcpNZN+8lkAjt0PwmUuwTWJPnUEvnXZnOUbuPt2k4hV7h4B7iFeI+Hp10efe4cNpB
         b2aOcSwfIvprWhrFhRuGcFHVrME12y0xgXn2YsnxlwX8bQA34xBT5iwZsMa7oUAcJsy8
         /jUoWv0m210v+tHSuAJQjMjXfeJfoVXhLsjO+GzlP1HP9RWJ88gUROKCmVgZJNhkyIzD
         Kfs52xGjcU803NuVZuARZ94vonSisJSwN41LF9m+ww/go59/xc4mFQx0JnKde/6FVGFf
         /ACJ/L/FZDmRfppL6ZdwrSbwMdh5o275ulw8Tg4kgMShFS7Vt5G34HPgCN48CKzwJJ1D
         wm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782393619; x=1782998419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjQjuigvKFd+Z+gtUv1havxbgca7I7GsAQ/BjMMTbQk=;
        b=VRSfEC3Cj/sCfgfBfLGPx7/ebdsBsXluFcmdvKfdOxNzGbYjqB6m4aiIQYs9eQvMQL
         5R8ge/uTxXHi2OJAhZqkGgHOug8K0vCR4lqQi2LYzDXDnn99Lmj2KYFLaE08C/F/m/N3
         8F1n6jPfm6fUo2h7aAklENjQQq2acRqGkhW0VkuT2dospN8aPEl9uKHwQORm6MAEYCQy
         TC+m2V06/OFPeRpPoS0DIOTl6RqteasdXnI9laLCTS1YLKCFeYi1dcfwTIwG6UHZmttX
         v7ro99rZbsqZvNb3K2e9Psq8agGPAbiptjXdmadBF/blT2W/VLeJ5rypyFi+1EhvGFnQ
         PQZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLaiW1iHzzvyPn8o3Rp7LlRCd8vlQE3FfLpO03pI2OWMo3qFZZ83y3+gLiEt5nVpVkMRAh+vgRa2lWAawZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yztg8cfpu1gfEIsLMs/WCQRTc+aOJ4NDjfn2v5SYQzcnPQ0bYLX
	GcuvegYDHrfLjBSciCbfV9moFWr15NrcE8qgMq5DoSGykqnVLVzPZlP7t2CcIxaLzx7OBED07Ex
	VtCZbfu3p7GTUYCDMUlgS5m72IJeOtIqHyTWpSFvobrKM6w8xqE0tDLnpdHfLbGO5r7C8
X-Gm-Gg: AfdE7cmADvokQviBOLVwydNeymOE6xrveIxpjgzAn+eJjg0EI6BxtnEVTQcCVH7MIhm
	qRTg2DJTLmsibyj9bOhUmz/YKisNjIA5R8ZNRWj0JweQPnCxStJ/YDLybu4GKwXREYpY0B6tHFi
	Dqtod3iDNV4I7GM5xMf4FJLMErhYezbMFlbwaH9pkgfwG1oyCqGXb86ygGLcueK5LWyLh81o1uE
	pKzAu0l23Tb5ijb+ntvi6sSgsHqbDU6wzrhMuYHLDHmZYIilQStRi/ZpyXbra1qq179sDvrKw51
	gdHTUmzPyqrg2yZlBr+MTEcnG6NuaA25L8aK2UZ/1rsmniSWcaqscKVnxbIoIhlNQUwgUDKKsXU
	nZ6dnzj6KwcXEa+QErWN9uTAuqmD1QIDZyd+/2la5J1/7jXXD786x663AA5AIKKgSnJb2QPc=
X-Received: by 2002:a05:6102:80aa:b0:650:94b2:b209 with SMTP id ada2fe7eead31-73433e36b9amr1057830137.4.1782393619083;
        Thu, 25 Jun 2026 06:20:19 -0700 (PDT)
X-Received: by 2002:a05:6102:80aa:b0:650:94b2:b209 with SMTP id ada2fe7eead31-73433e36b9amr1057791137.4.1782393618631;
        Thu, 25 Jun 2026 06:20:18 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:fce5:aedd:3ea4:36f? ([2a05:6e02:1041:c10:fce5:aedd:3ea4:36f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d93cdsm19126758f8f.18.2026.06.25.06.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 06:20:17 -0700 (PDT)
Message-ID: <638eebb6-c03e-4071-8aad-a5da30ddfe3d@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 15:20:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones
 for keyboard skin and charging sensors
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-4-daniel.lezcano@oss.qualcomm.com>
 <ea233160-505d-496d-a321-dc23e7f69d80@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <ea233160-505d-496d-a321-dc23e7f69d80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VrUs8M1Yv0JGPX5BbpySH2S4MPuuLZWy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExNCBTYWx0ZWRfX0qCgdHVJMGkI
 c4XaD2Gq56hND9O/5fzYQbRbabWzsHj1KrXz0jaD8xlODWC/+33Nt9xvOP69YeE0hzVDr4lr17M
 UWcBEk2PlvLsyyn8qMTtUr9sd4fJmho=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExNCBTYWx0ZWRfX/iwoOIvI4Z1H
 U7KjIdq2wdFZqq0IKybCqWibF0VmJPgdMj75kCjAzaiqpb0Qo7loXOU5g+ZSNTLs+MQf4UsQYgX
 ZxFjNN4SwZ3j7CO0t0uz3/YMbgYgbSvACA0dLcj0CvKGS3+Mfi86quy/5EL6fCwp5urkvajOG+C
 LWZKmjqobDjgHztEoLF+0E1vLSibMJWxDGfDo7F94R16xK5kKEa107W8bI3D7DOaqoY4SRf+w4V
 kooPyxW3MUrMAIY5BCnRoJTcmqmfAc1bdQrFh/MWN5cWAk44L2DJn5CaSBpyjtsMqIckfpFKlx4
 /z78r3PojUxiLggdb5eT5nGipTc3dUJ02aJSdhY0WTLmMBhqkeh4zFPKlKcekJnGU5SN4evSY+D
 YgWYiHy41gsQG3l58/qGzNgl/FjoEnl7pxtBCxjE7PK5Jpk1QNhwPlVYPafcj90hjWmiJMcTpea
 8Qqv4hEAyNsrfIcv/rg==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3d2b13 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=jUCef7gqdSedP1EdzSYA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: VrUs8M1Yv0JGPX5BbpySH2S4MPuuLZWy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114532-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 728E36C6178

On 6/25/26 13:36, Konrad Dybcio wrote:
> On 6/24/26 11:08 PM, Daniel Lezcano wrote:
>> Add thermal zone descriptions for the keyboard skin temperature and
>> battery charging circuitry sensors exposed by the embedded controller.
>>
>> Expose the EC as a thermal sensor provider and define two thermal zones
>> using the temperatures reported by the EC:
>>
>>    - a keyboard skin temperature zone with passive and hot trip points,
>>    - a charging circuitry temperature zone with multiple passive trip
>>      points and CPU frequency mitigation levels.
>>
>> The charging thermal zone progressively throttles the different CPU
>> clusters as the charging circuitry temperature rises and triggers a hot
>> condition at the highest trip point.
>>
>> This provides thermal framework integration for the EC temperature
>> sensors and enables platform thermal management through standard thermal
>> zone definitions.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	ec-charging-thermal {
>> +		polling-delay = <5000>;
>> +		polling-delay-passive = <2000>;
>> +
>> +		thermal-sensors = <&ec 3>;
>> +
>> +		trips {
>> +			psv0: trip-point0 {
> 
> "ec_charging_tripN", please - these labels are file-wide, so it's
> better if they're not overly short
> 
>> +				temperature = <55000>;
>> +				hysteresis = <0>;
>> +				type = "passive";
>> +			};
>> +
>> +			alert0: trip-point1 {
>> +				temperature = <63000>;
>> +				hysteresis = <0>;
>> +				type = "hot";
>> +			};
>> +		};
>> +
>> +		cooling-maps {
>> +			map0 {
>> +				trip = <&psv0>;
>> +				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +
>> +			};
> 
> Stray \n above, might also possibly want to throttle the GPU.

At this point, I don't think GPU throttling is needed


