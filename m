Return-Path: <linux-arm-msm+bounces-103469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBG/CAbE4WndxwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 07:24:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8E54170EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 07:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C85733031AF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 05:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E8C330648;
	Fri, 17 Apr 2026 05:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWcbfert";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIDcTTtU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7540306D26
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 05:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776403455; cv=none; b=J1N4Daruj4YaQ8i9Hi4yEt2WFU/Y1PEIh9nwD2kUYc23tGfeh7BPZ4PgvM0huFwn59pXBG1UFQWcdpuw4E9cBL19E1OpQCg0XGx5bxKnAmaP16y2x9z1YmI4SPbMwCT5DqyQf3vI8T7ePgZvDDr3oSKhwh/XTazrvm4XhxSYZaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776403455; c=relaxed/simple;
	bh=jGOtRlgc7tII7CGpwyewueifmpvFdF9A/vqjXaUAVGY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NRciphGbeqzsGb79uGB9eWu2mJeQJBrwOPHkoXBFFS6mqw+48cWBOXOVM3T2u03NBhdRs75ncat8QpaxAliu8XbeXNBG6t1kcq7HwIDfcPk1IjOpd+BmctDx2hWbdn+gH1XAFogCPh4N/WGtoVjFcOdxPtml5EYSJUisE93bUv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oWcbfert; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIDcTTtU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0g0NU2593781
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 05:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eBieD+yFwPB8d0ibsPHTSSGgmXv2ocvr84vGd67hR8U=; b=oWcbfertka83hM8P
	/eKpkATLUXVVJ70pq3erAT62vdBqLkYhTyg2z9ABoLDDve39fAQqiA3pQzV7mXAj
	M+hJtF639MJCeVymUJmuqWSxvagCw7NcucQtLUtlhWVUgwMgdfzSh1wtQH+Fk9Qb
	u3+FG3untQ2BzddvrGAWryC2I/pDDx+Q2IGiOALcfKXgnL8eszuRe7zLX3DQkhVN
	OdHHjrDDuin0HwidygdfoTCrTQ1UOHOSktYi/auWqRYLjWbNIWYl8FDR1t8elHfl
	RQi30FGk5Tdr067TBVhikVoj9wVdS9d7f9FMQqGXcDXk735t53CNqKWMNLRMIrb9
	4iXZtQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtuym79h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 05:24:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2d83e7461so5274235ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 22:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776403452; x=1777008252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eBieD+yFwPB8d0ibsPHTSSGgmXv2ocvr84vGd67hR8U=;
        b=WIDcTTtUkALlmE3W9Lwm27TUr6eseR1ThMhtbze24OkZ1S8yEWZlxQxMTVKKtbtsKb
         BlaZ6/B6kXPLuwIxOGtaERrYbFqxEXJ7UVbzRvBruZG35d545AWQUW3zX7HkA848ypBj
         lPwE012oZQmwpJC1dC4YoYpDhJYC5h13uJinWV5YX4khE8iCPcJ8vMDTtTI+WknKufl6
         GkTWgyg9VaE7pdIsSc9CAIsR+bpCP3z8D2AC84C1JrQfJoF8aLMriHFSn9EreVfzxaVb
         zp+J+U7OOgYgwk4H6C1lp+TeoimUvIkbw4NyqEG8e/s/5+he+5EANbRz2pC8/xCefu5H
         c8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776403452; x=1777008252;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eBieD+yFwPB8d0ibsPHTSSGgmXv2ocvr84vGd67hR8U=;
        b=GMSdDKylS4ZQTkiVNB7f0knpcufRQHIPs0+13DPJ1OKC5uNU7LiDn+JpAKyRmovk9+
         Ghpl7Z9IsK0OrYTRPbeMs078onXmFvQNOi2pvfkNUU8MucjTNNiZp+DcZKyC5OiXVH4Z
         Ooq4DMat65DoLDLPrnxWLrXnEUsMZS3wyZ3Lv6ZGyMDH+i9U6/XcdiK92PB9L/pc+j0R
         L1CLT1DY29rUDO/dUsdLj13/XOIft+eF5mbX3jCgABQX60496HiY5kTh1Tr/RP/JjF/w
         A24C8n+UCk1wL4GMN9VXnG4P+MOOehl4Ap0BjXMwT2JXjjzV2sukf/N1Q5dqcAl5fYFT
         zb3w==
X-Forwarded-Encrypted: i=1; AFNElJ/s0kaQE5B7VHjWoei/pORGB4UqbNqPyZiyXdfdezDXb0CtvLFCfKfuxDgo9GXPHv1VmvuqBT1bk1ZXlN+d@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8b27bRQtesRs96QPF1tZZlzLzfOu0a5pB7fnfTzMWIAGAhLDm
	2K68my8kcXYNH2zbwepuxAdCZlxafsKBSBu2kMfWY2UaPVsf0UZ+ROLX22w2VFpqcfDwrt4nrpD
	kFP9M4CupIX6h8eEUhEV9LbA6trbTHZVUXPdm7iWoR4NUbjXzPCXrKmSib3WTmBhD48SD
X-Gm-Gg: AeBDietFFjJZziYeb2Ex5Efh94NjpmyMetiFtC8jSrNPm4zZr/4YKUCQEOiua5y92Kt
	TAMfCrlnZW33KAxbFRS6Un7ZqlhMUyy+ZvVK8jf4tby8PxKjGcLi8Fc0+z9fbCWzXiNdXGsKHC1
	EIvGcqco0BtkA4iWUkSzSfRCV5JJ5RssSn11PMz3A4oKXISZNgD7slxmBkSFzx+hTM/BF7CFGt9
	NazGVdSxjkDdkypnDG+ArW0uEp3Q725qGn1WsC1Gm8il66znsBaF1Slz/daiT0RX346pLmw6HqF
	sArO4GnbWrHwOzjsdJcL7Nlv9MO2SHVv8yE5lRVMH+kg8UmAJrBRDIFbUokekvisGSyskO0hE5L
	huodYOHaM0lWUYpzbhLX2kDoZVRDYU4dWhVCxLPS8kXjkVrCaUHcN9y6enuXsAboGHvvyB34Edv
	aQsCaLlNE8tz63YEknPRZAMsgsxA==
X-Received: by 2002:a17:903:48e:b0:2b2:aa93:cc5f with SMTP id d9443c01a7336-2b5f9e9a38fmr10441095ad.10.1776403451840;
        Thu, 16 Apr 2026 22:24:11 -0700 (PDT)
X-Received: by 2002:a17:903:48e:b0:2b2:aa93:cc5f with SMTP id d9443c01a7336-2b5f9e9a38fmr10440945ad.10.1776403451333;
        Thu, 16 Apr 2026 22:24:11 -0700 (PDT)
Received: from [10.133.33.249] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa32ad8sm7118215ad.31.2026.04.16.22.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 22:24:10 -0700 (PDT)
Message-ID: <48bbcc34-f5bf-4ada-8210-b115f72ee850@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 13:24:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8.5
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
 <20260401-hawi-spmi-v1-2-c40963041078@oss.qualcomm.com>
 <mxawruvb2p6svks3y4rab7feyn4dhkwe6dosjyc6yt2ozdaual@bvvof6rzm3jo>
 <c5d1578d-729d-4c09-b761-c67e6d3be745@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c5d1578d-729d-4c09-b761-c67e6d3be745@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA0OSBTYWx0ZWRfX6Gou92WHCojN
 6FaFSePwBWkRXDkJk6iAEJPjpP2NbDintrKHxxHFmfBfqEvAPCyeR9MRk9y9SJY7GcDjzb+KH8L
 WKBijHIYWOocq9NAgZ2pYLKeXKb5NOwTtY+k7Be0HMX6DVjBlcI4lC+VhrsettbIFW7R1Tq1gpa
 b7RCAcPo5JiGdCcPnDZFG+2OlYOKa32ZlEz81xEs9qwMIFO8avy33kOh+wL75JlE8u1G9Ijr8fM
 hJTcGvdac0ktNKFzQ39373zwZyLwHsoXAMJw1A6avdb/qU7AqbhS23236cJQ3IZkhfNsSFFlP8D
 VJFILqumkhkdL22Ai84BF20t7DLypBJ89rMxXapxowXa1pg/v7bWHhUZzlB3CuFUvHz4iJAJQNK
 Ml4Wra1gsNJq1UjzmKIUub5A5h9QcpmKzVdlkNRd4wLwvfZA0VhADmV7yP7dECbE8gFf4/oDeix
 BodQBwZsbRyvPxJp7nQ==
X-Proofpoint-ORIG-GUID: ZfaOR7i06mmGXQ77oEq5QpElxM1yv1WR
X-Authority-Analysis: v=2.4 cv=Ipgutr/g c=1 sm=1 tr=0 ts=69e1c3fc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nEY8QQf2np8axcGL7LcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ZfaOR7i06mmGXQ77oEq5QpElxM1yv1WR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170049
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103469-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F8E54170EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/2/2026 12:18 PM, Fenglin Wu wrote:
>
> On 4/1/2026 7:22 PM, Dmitry Baryshkov wrote:
>> On Wed, Apr 01, 2026 at 02:41:24AM -0700, Fenglin Wu wrote:
>>> PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
>>> the definition of the channel status register bit fields. Add support
>>> to handle this difference.
>>>
>>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>> ---
>>>   drivers/spmi/spmi-pmic-arb.c | 69 
>>> ++++++++++++++++++++++++++++++++++++++------
>>>   1 file changed, 60 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/spmi/spmi-pmic-arb.c 
>>> b/drivers/spmi/spmi-pmic-arb.c
>>> index 69f8d456324a..deeaa39bb647 100644
>>> --- a/drivers/spmi/spmi-pmic-arb.c
>>> +++ b/drivers/spmi/spmi-pmic-arb.c
>>> @@ -28,6 +28,7 @@
>>>   #define PMIC_ARB_VERSION_V5_MIN        0x50000000
>>>   #define PMIC_ARB_VERSION_V7_MIN        0x70000000
>>>   #define PMIC_ARB_VERSION_V8_MIN        0x80000000
>>> +#define PMIC_ARB_VERSION_V8P5_MIN    0x80050000
>>>   #define PMIC_ARB_INT_EN            0x0004
>>>     #define PMIC_ARB_FEATURES        0x0004
>>> @@ -63,11 +64,34 @@
>>>   #define SPMI_OWNERSHIP_PERIPH2OWNER(X)    ((X) & 0x7)
>>>     /* Channel Status fields */
>>> -enum pmic_arb_chnl_status {
>>> -    PMIC_ARB_STATUS_DONE    = BIT(0),
>>> -    PMIC_ARB_STATUS_FAILURE    = BIT(1),
>>> -    PMIC_ARB_STATUS_DENIED    = BIT(2),
>>> -    PMIC_ARB_STATUS_DROPPED    = BIT(3),
>>> +struct pmic_arb_chnl_status_mask {
>>> +    u8    done;
>>> +    u8    failure;
>>> +    u8    crc;
>>> +    u8    parity;
>>> +    u8    nack;
>>> +    u8    denied;
>>> +    u8    dropped;
>>> +};
>>> +
>>> +static const struct pmic_arb_chnl_status_mask chnl_status_mask = {
>>> +    .done        = BIT(0),
>>> +    .failure    = BIT(1),
>>> +    .crc        = 0,
>>> +    .parity        = 0,
>>> +    .nack        = 0,
>>> +    .denied        = BIT(2),
>>> +    .dropped    = BIT(3),
>>> +};
>>> +
>>> +static const struct pmic_arb_chnl_status_mask chnl_status_mask_v8p5 
>>> = {
>>> +    .done        = BIT(0),
>>> +    .failure    = BIT(1),
>>> +    .crc        = BIT(2),
>>> +    .parity        = BIT(3),
>>> +    .nack        = BIT(4),
>>> +    .denied        = BIT(5),
>>> +    .dropped    = BIT(6),
>> Would it be better to extract generation-specific callback to decode the
>> error rather than defining the list of masks?
>
> Are you proposing to add a callback in pmic_arb_ver_ops, like 
> '*check_chnl_status', and create separate implementations for PMIC 
> arbiter versions before and after v8.5?
>
> This approach would add more extensive code changes with some code 
> duplication, especially for handling common error bits shared across 
> all versions—even if they only print error messages and return an 
> error code. Is that a concern?
>
> Fenglin 

Hi Dmitry,

Please let me know if this your preferred way and if you are fine with 
the concern that I mentioned.

I can come up with this approach and post a new patch.

Thanks

Fenglin


