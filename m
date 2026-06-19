Return-Path: <linux-arm-msm+bounces-113827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KvmSIKsRNWpdmgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 11:53:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC06A50EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 11:53:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dTeWe7Q9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ko1pNhJR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113827-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113827-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 155BF30A37AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 09:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C722367F4A;
	Fri, 19 Jun 2026 09:51:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F11336A03B
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 09:51:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781862715; cv=none; b=djPyQVJSZ64eO4qWJU00yfnpnl0eEmfBEzH9BmJ1Pi4JWMr9+AyHRoS3ADYxtCC9YTYkPHX7ZBCWA7U2lMhEgCgAcTx86V7NN8Lk7eN5ogR8vSwNHTOtml5IfgJu4xf6VsOsnEgOOdL67CafwLCqzPx8F5X9H2HM5Xm82jQweTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781862715; c=relaxed/simple;
	bh=/kWU03eUjVye6hhg9NUKgjZ45aHcq/mzn3B0UlaFXtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l39coU8DOWf5ypFDa4tI2DVQ7VJN60H00TX7moLbYfmzpD9DApJyOAk7XVSsdrt2M2QunjfLANwrry0mt28Su9Gruh3eKgwdcfpjkPaWaeqzXb5Mk7QFe0vJaE0rpFPMFXqsBz2wjsAD88Oeo2HJ9fUcV8/Bqfq14ggfuTADBaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dTeWe7Q9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ko1pNhJR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7PASN3708677
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 09:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2h6bbHMCKo8QBg0xCoQbI1gK6dLPx7ToSsyB1dQ41Lo=; b=dTeWe7Q992PCmQNw
	hydDFe4n7/Yo6D2UA/JrjX3/IhxUSmsZVVbk5i1ysZYlHqaCPF3EZ9dMKSL4T1MG
	HJN27oz+qa7jBkUSXofWGEI1FJjmvfcYjn5YM0UjyzKRXZVVCy3aosCS+JRrK4o3
	afPUf9NjyWPv5iey0fT+oUBXfqJReZ+SNAj39a81jlfetUwSOkdU0M2kSyQoz9AA
	BOwMkQ7FjmKgkSdhmlP0KI06EYCtjGyNqEebk85hffhLSPekLwzmm0wMgg7kN1jQ
	j9B+r3lVZgqukv3PBezzIdvanCwccxLXVqrW3/eCKsTqPjVGi2KwHF3bbyHSqega
	Co7BwQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp672nds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 09:51:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf1845bddfso17007105ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 02:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781862707; x=1782467507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2h6bbHMCKo8QBg0xCoQbI1gK6dLPx7ToSsyB1dQ41Lo=;
        b=ko1pNhJRcisz7BTkGVwOMiGhEWfFvCaQvxOn0uLegM6lQzWStCsOVFNtZeYseYSZMr
         IspjEeYMylq4/Dv850al36//Fu/3Y5xrpFlhr/chn6c1uU2ha6FJG+1r2Cwox4u7iM7i
         m6ObkQfRUme+z6jCkGykPkUpovX8Gx+qPcpjMCmOafjI8jPRZtzniPr9rBtGnMIoGGHr
         MQVDc+WygML8nR5bncWuFYCqDaKlnmG+Lbj8EyzJkFWMfZnwwyXVmk1RxN8Qn5m2Bs/n
         zeBRAGrGNZaOK3vZA2mwiJ+laY6AVWTzLMeAZwoRVvQN9OuGzu6wnRdxzyQchNiB0ZBz
         O4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781862707; x=1782467507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2h6bbHMCKo8QBg0xCoQbI1gK6dLPx7ToSsyB1dQ41Lo=;
        b=eAIjK7XQzV+wIAhOONlAL/+iKIUbc0cKq52rKv1ayd6wFUH1PUuWXfPeFE8eisan61
         ebk3gSJUfPGpQXZv9i9HQJYr/ejYi6GYz4UlK+xuGc/+cPFG3YlZ71v3ac2+Km75wmWh
         mtdtwtfedQcGXM/iIpGYXRuRSdBWVjrzo6fuv5Dc1rnaBksUgmzjGYvS3ECzEQJZkb+b
         ZQaifueBg33reXLQfwqsXOpHC1WrhhkZUqjwjLb8GSebWMIiDsmEHrR/1YbkjDILMQaj
         nijE7zTABGIDJL0QH7CSDFXxqBVd8bShDjJeRJASzotO64zlnSD56eLghLrMiiudtJM7
         FcgA==
X-Forwarded-Encrypted: i=1; AFNElJ+COh9OopmuREeGDAVBaplyFHppZXOB90PwFvsKy44ciTsbp/PuAi5UctDLkqD9xQfHH3xG0wF5qmQSAPCY@vger.kernel.org
X-Gm-Message-State: AOJu0YyIctAJqH37f00S3hwoxA4eKj7C7waKa3/I9Ai8tngCDKh46deN
	xuPASYO7CBXROub22kUE2zhWzlICVNKJiicGoz7lLLPJU2rEz1WxqhpUAKQ5TpmN4UthAk28Y8E
	xPeQjyrns6Lyq3ecNK30Ty9jb6+mOfFsufxZpoVeKkg4WHKzRjrG/3ksFDe2oreFRmV3y
X-Gm-Gg: AfdE7cnIrCKkX0ynjG0zVDfL/TlVejA1d2X/YV43r4kr1PjNkd7E3osqueKm8a5JgeI
	VicRWEO0vvIdblCZmxd8cb8Y6d5I8KxFPmizSe/Eu1QzMuyU9r9GxYRvzbZZLB0B3cfxAH1lVbd
	tV7VntET09dJVSG5yzvBonPIGizbL2uoqZtzRzpIIds292tscuwQ/Afi1prhcLqD/xbwAfG4ZF2
	IpLnYrjCGdI001gOIN6VtQZX/stwu9ts6FigUTf+wmaw8hXQagOtm3+7g4S0Pt/S21pjGac5UhL
	8hEFKOoFWr8ItE6ROC7bfkqmFCIe/lGc/ig9CWUt/VkyZSUNgeYqryTJNrICGXmEPpaaRVE5Qk2
	BTpXk5yAdgXbhfXLhcNya1sQVNf/brLocdffXUQ==
X-Received: by 2002:a17:902:ec82:b0:2c0:cf44:3b3b with SMTP id d9443c01a7336-2c725d7c843mr21063465ad.24.1781862706868;
        Fri, 19 Jun 2026 02:51:46 -0700 (PDT)
X-Received: by 2002:a17:902:ec82:b0:2c0:cf44:3b3b with SMTP id d9443c01a7336-2c725d7c843mr21063035ad.24.1781862706405;
        Fri, 19 Jun 2026 02:51:46 -0700 (PDT)
Received: from [10.219.56.41] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c720c23b8bsm17913045ad.80.2026.06.19.02.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 02:51:45 -0700 (PDT)
Message-ID: <b8ef8488-7585-4226-9b8b-c79f8caaffeb@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 15:21:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
 <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
 <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
 <3384ecdf-599f-4862-a3c4-9f54b4ddfe63@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <3384ecdf-599f-4862-a3c4-9f54b4ddfe63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jajNOAl7C1PxPc_qtTwYgQhxpefrvULs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA5MSBTYWx0ZWRfX2f8gIgydQ2X+
 HxC307oO0cKyG3cGNGJsAY6SDStWVFoNYzKs4aOr2Dyt91O3XQ3NxyfMqEJZgMapJVhXTl5Sbjz
 ztrOWgCh+vSMZfLoM+kOMCon6HQDFPLGrWlneGx9lYXBayWxcGwwxcNcIJUrAnHvlDFenpCVDtN
 SUCPzZQShU1ZpLKG+zSfpyNCQYbypjqylDq95Y2uFidUDfwbhRWr5uroJUPbUXtx8udUm4J5a5F
 NOOdBF6vq1t2OLocea60LPry8MlqASUHqZBZCrUs3ealCZiYKef+2TCdTqybZnFmw3wkTDXQ6Ce
 EJBeS8LsZKcU3t+OsiP4cqcePqOcns53LIlt1kr8p8LlSV+99IBs8uPYsUU4B5NjiqnQPn4nhRD
 XAii03eOJ5qpx3DUOLvC3E3W7alby62wuECVhaEOHo1GZLTwBs/O65stIIQWtxjyXqN1enI4ZV0
 F5qoP5p2QUCDLA5DpOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA5MSBTYWx0ZWRfXw9nuobIBO5oA
 t+8HkgZiPPaE/0qT3fqZ+lJ6y9rrT7HQMo+uxE9V9Mwi+GQt23ta6m9oTZDTXbLi3H9pDbGL5tg
 DS/35i6U5HdMbUtG0L2SWtd4Lx6RqN4=
X-Proofpoint-GUID: jajNOAl7C1PxPc_qtTwYgQhxpefrvULs
X-Authority-Analysis: v=2.4 cv=TdOmcxQh c=1 sm=1 tr=0 ts=6a351133 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=u9O3v9hlqvzur-BCVJ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113827-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBDC06A50EA



On 6/18/2026 2:56 PM, Konrad Dybcio wrote:
> On 6/8/26 4:37 PM, Bibek Kumar Patro wrote:
>>
>>
>> On 6/8/2026 7:27 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 26, 2026 at 08:12:04PM +0530, Bibek Kumar Patro wrote:
>>>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>>>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>>>> are accessible. Without this vote, the SMMU may become unreachable,
>>>> leading to intermittent probe failures and runtime issues.
>>>>
>>>> Add the required interconnect to ensure reliable register access.
>>>
>>> Does it only concern the GPU SMMU? What about the APPS SMMU? Should it
>>> be voting on other interconnects too? I guess so, because currently I
>>> see that TBUs vote for various interconnects. BTW: should apps_smmu also
>>> vote on the power domains?
>>>
>>
>> This race mainly occurs in GPU SMMU, where the GDSC can have an
> 
> Mainly or exclusively?
> 

It is exclusively in GPU SMMU as of now. We haven't seen any instance on 
other SMMU, e.g pcie AMMU, APPS SMMU.
Also as per my understanding of the architecture which i mentioned 
earlier [1], this issue will only arise in GPU SMMU.

Thanks & regards,
Bibek



> Konrad
> 
>> independent vote on the Adreno SMMU. However, the GEM_NOC vote may
>> already have been removed by the GPU (or any consumer of adreno_smmu,
>> e.g gmu), unless it is explicitly voted by the GPU SMMU (which acts as a
>> supplier for the GPU). This mismatch can lead to SHUB timeouts or NoC
>> errors.
>>
>> Mostly this race reported in suspend/resume cycle (when gpu/gmu devices moves to slumber/suspend state before adreno_smmu powers down
>> and the later doesn't have explicit interconnect voting).
>>
>> In the case of APPS SMMU, such a race is not expected for any known
>> use case. APPS SMMU is part of a shared infrastructure block, and its
>> power is typically kept enabled as long as attached master devices are
>> active. Therefore, explicit power-domain voting from APPS SMMU may not
>> be required.
>>

[1]

>> Thanks,
>> Bibek
>>
>>
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> @@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
>>>>                  power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>>                dma-coherent;
>>>> +            interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>>>> +                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>>            };
>>>>              gfx_0_tbu: tbu@3dd9000 {
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
>>


