Return-Path: <linux-arm-msm+bounces-113539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7nzkCs53Mmq50QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:32:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B67B469885A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:32:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=H61fpqMU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FV6qjScm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113539-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113539-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13F2B3023FBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFEF3101A6;
	Wed, 17 Jun 2026 10:27:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7B73BCD19
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:27:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692077; cv=none; b=L+ffnrYPa/Og+1+TIuEugtx6DdMHJ4Jk9zqnX85PiqCfXYazV0T31A1CVANGmqSet8Lc8UxKnZmqCqpf3TJ9lsX9K8eMif9D0xbZi8Lq/aMDotchBfULJyg4o2r7WlmLsGAWTJ1ivWKWUaDQso+zdhBbU0v4IKxZmgsRvhgRIv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692077; c=relaxed/simple;
	bh=uMFJq4ZfbSMiOOut+gyzl37CUpNR1s0UWSEpTtKaan8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QaM5qDq/L1g8k9R5UCyJmBUbeNAYH5hxjFVk5CBqZpBvwAhSMj2zTvkILxW8/PSe259H2dDq2GDYX8QQgGUV+2cMGo/HrTElEsScqQweOxOHBvO4Zj/QWDEXYvva2V17woBFudJQ6JNFU90R09slSzGsVgck4OxZmAus7DvKb7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H61fpqMU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FV6qjScm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8W1Uk2192320
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8SoV2LMsFe/l9qD9amSUbjKrotuVEZ2v3iIzwP6QfOs=; b=H61fpqMUPAiacihk
	vSK8hneo9JCINKDxRQR13E6o7nSCgLfOPp8pFM7jZZhSXTh0MlpDK38UCopXquqm
	zprb8sDK5BLrQTzMaxtod3nOMPiWNaly6LJR55UDUVx9C1R5ti4eIl5ocl/ltple
	vq38JCkQOKpk178ObKfw6H5hztyV+ji6UtPXlL1K7PJwNrjQDQquqWuzxRlAxpzm
	5O+Mcd2NOW3uyQXNAppSmjmDMFf9IISwfyM8M2LhWmRpHTSbrqhQaAAN/Na6ZE5p
	nOr8lesxFfcVxyvtpJpO9Wqt1O4QPJxTj4CmyWxir+HcWrliBc7GS2kpZw5TVwQA
	5tY95w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesjp8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:27:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8dc4536d42cso549116d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781692074; x=1782296874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8SoV2LMsFe/l9qD9amSUbjKrotuVEZ2v3iIzwP6QfOs=;
        b=FV6qjScmmHLVZaKBmqcS1Dmo7Oy3DUrGo8Y8sDkYwNG1yElVDSqYmU4R3MgkH82e7f
         2wbuNObXDOuOLAzH1FTIsiq3G71OXTHNwIlgHJqGlNAWbnkT4XxNAxYZE9l7Qxml4mDt
         ZIJfoHvqEstuuDuVre4vn/a/r08scaWgcm9F0BH1LAw9DAMqRGw7h+0RXfYefc400tWk
         0Hv2F/ANmIc9d9OyVuWp6WHLPQ+zInjq+DOrZY5ADBc5l1G1J3AGEoFG7SAVjENJ6hTl
         PCT8jbGcpeLscLbIJDfvd3850MH+yJhF9f1zHKERrv24sy4nOE/D4e+JX73gzYsQ9/b4
         LwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692074; x=1782296874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8SoV2LMsFe/l9qD9amSUbjKrotuVEZ2v3iIzwP6QfOs=;
        b=OfQ/116t0ccm/2oXiRTXQkrfFiHTaQ/69f5t0QNxi3upVD7Iq74Tdm5Ud/VH7VqD0T
         nddIawLmTTXlcrKwT12ikpLBCD9RnB4fgC52BHxs+LK6wXufdBVzMX8Js1xRmboZr2vW
         E7vs9YPv2iNDAD5aZHy2o5bJHv290E++ZbqV4g2Ctvi4af9W+j79YFFqlarq2GuTIlY4
         zIPPTQ9FhnWTLrOJLnZC8qMdZdo1gChuZxarwurU+D33o4m+4K4uqvtsc1qAmQ2mz/PV
         cb+CRYTjaX6w3MUFI5rmF3IvyxKyElFinSn0cgPkoQtBNBE6se9GnzMhT8R6mJjSEiPr
         4t4g==
X-Forwarded-Encrypted: i=1; AFNElJ/AjmLqGEz0nrFWFK0gjkb786gzf8jRo2mOydbbJipaEI22rdpCqjcztHHUR4QxAkyJQhdV8n2iHfeaUTCV@vger.kernel.org
X-Gm-Message-State: AOJu0YzdGuY5vDMRd4cXQGoHtYbfMor8Mofy4Jia/AL46OSGYgsX+YZt
	4TXibra2ztIDimhuWskc5lv3fOsh/jiqBlzF5ybSrMvjGq4zKQBdcHT8UtN27wDA7Z3MEycLiUu
	sq7r3T2jPMlHYLLdVD2adNc5XvH/vX5josLRpLMWo1LCoptYaWBlyhfVp/kUr8lCI2KOp
X-Gm-Gg: Acq92OHOZHR2CLTRlTX2gmLccIGfLDxZYOZf/OB1vtG5TMG1hIyWDrj4+Zg/UGZJYG8
	LmXxlW4ztWa3Sxz9hlan5XC5BjCsG5SVFukCcyAc/S8XkmAFwzcd+XWYGv4wPW6eediDGam9P2X
	sEP0jsAQYsJz5HPKnIqb/KeO6pMwdF2lbcL8lmzpIsXkJmBW1ui3ZLOboYQIFv4LlAVLbqMOuuX
	6dwnG9voBsj+S/cFqNKEpJxdRagw8IS8FMu2g+w2Jjqk58xwhJDNgOm/IRdHT2UdacqwjbjcnMF
	lhwDKiwQ4+jzYdisou7UQvqXaToJ3zq8nO/tyIaCf1OHRVIcjPLJE5izqpYZLzosv+r0qxNukOW
	+SYsuhrvDGIfBy02y7PkAXPZ/Iec4OFC+Amk=
X-Received: by 2002:a05:620a:4408:b0:8ee:e440:fae2 with SMTP id af79cd13be357-91dbc52bf48mr244706885a.5.1781692074334;
        Wed, 17 Jun 2026 03:27:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:8ee:e440:fae2 with SMTP id af79cd13be357-91dbc52bf48mr244705885a.5.1781692073900;
        Wed, 17 Jun 2026 03:27:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb844060csm762333866b.46.2026.06.17.03.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:27:53 -0700 (PDT)
Message-ID: <95ac1f08-b381-45bc-9834-18fd1e02dbb1@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:27:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/18] firmware: qcom: scm: Add minidump SRAM support
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-5-mukesh.ojha@oss.qualcomm.com>
 <004d6bd1-2800-42d5-a6be-1fa69a06194c@oss.qualcomm.com>
 <20260611172425.eejrdiv2zvhqkk5a@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260611172425.eejrdiv2zvhqkk5a@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5OCBTYWx0ZWRfX91gj95QmJJXz
 g2gEUqtShA8CEkw6yxLSVYKw6eJckMZFnkPbTesNiGZY6kd8hnUJZe3xIny2bvDu++OSO+/b12U
 kJZORQeGpZerq0DkaclLPxXl39v0fzI8l+dF8f+QRxf2FTC5qKpRYu3L4BBszPzI8HqxtpdQqMU
 laA2+Q2SByTakcQ5c/Ak6JWGql4KIdJJoIjd3xwSJ9U+3gUg20nU5YIy/pocu2Gu5Nk0FyIgoj6
 f+g+4MgdA2Jm83Jd5Pqs8xDCVPXvANTEwkKLnje4/jtZ5qLoiS6+7dXmOV+sjZGYtTZpOCDZvZ+
 uQcMws2OP9FRcvlR+4IqW3cW+dCWOxZxN+2QkFcHVd5LELpkd12LxUR3oKfhqX3vFwUrDiqMXNE
 TCUTCHZfbAfspxNkvQws3z/7JIiaOMDCQCzYxWhfdKQGIDsdXqM+6bDdHZzC17FaVZGenOGThSD
 FIpZSFPxplaWWCtfpAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5OCBTYWx0ZWRfXzd/5ZVG07Mor
 tKfWsArzOdKVuQw6Qrq7N7vJ3d4g4VJqeJs4HeCJvA32rCimilC5TTNwTiAi2gjXMtV1ffrodj/
 mkP1Ih3ewGSpgOH/APBZ/GK5c05RsPI=
X-Proofpoint-ORIG-GUID: ha3zdDeoWGqNWxXDx155qoo5pyk78OG9
X-Proofpoint-GUID: ha3zdDeoWGqNWxXDx155qoo5pyk78OG9
X-Authority-Analysis: v=2.4 cv=ePojSnp1 c=1 sm=1 tr=0 ts=6a3276aa cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1GqaFQT7NjLpQ7b0YJkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-113539-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,chromium.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B67B469885A

On 6/11/26 7:24 PM, Mukesh Ojha wrote:
> On Thu, Jun 11, 2026 at 01:45:53PM +0200, Konrad Dybcio wrote:
>> On 5/22/26 9:49 PM, Mukesh Ojha wrote:
>>> On most Qualcomm SoCs where minidump is supported, a word in always-on
>>> SRAM is shared between the kernel and boot firmware. Before DDR is
>>> initialised on the warm reset following a crash, firmware reads this
>>> word to decide if minidump is enabled and collect a minidump and where
>>> to deliver it (USB upload to a host, or save to local storage).
>>>
>>> The SRAM region is described by a 'sram' phandle on the SCM DT node.
>>> If the property is absent the feature is silently disabled, keeping
>>> existing SoCs unaffected.
>>>
>>> Expose a 'minidump_dest' module parameter (default: usb) so the user can
>>> select the destination. Only the string names "usb" or "storage" are
>>> acceptable values.
>>>
>>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>
>>> +	for (i = 0; i < ARRAY_SIZE(minidump_dest_map); i++)
>>> +		if (sysfs_streq(val, minidump_dest_map[i].name))
>>
>> I'm not sure about sysfs_streq() specifically, but otherwise this lgtm
> 
> It is used in quite a few places for the same purpose. Am I missing something?

Seems like some go left, some go right

anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

