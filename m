Return-Path: <linux-arm-msm+bounces-115589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CZHFOfa+RGqv0AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 09:17:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FBC6EA8E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 09:17:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jMSYWtB0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GRM3Nvrm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115589-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115589-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E24D530134B7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 07:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2184C3B637F;
	Wed,  1 Jul 2026 07:16:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969F43B42F9
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 07:16:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890207; cv=none; b=A7MLYCyfzD7XbYPKGPg/qBtjGkq9LsA3P9k3upxu+3sVB0z9rgBwoyiMjnQYKCaR/pd5+1Zl8rjcsIgHkMo16WclDTEQAVoHk9cjM9TLM6aiztgNdwk6wwFkIjvOERWx+RqLPzKCUiME11lh6odFGynvwwPy8klfrt9VnjEPOO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890207; c=relaxed/simple;
	bh=/4LKNeeme3NOffjPb+nNorikshAcZgsjaJkeEGGabWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gb28+GVyRyyMSVb0m3pepKEY46Gams1vbJcHOXftybwolGxVcKAxW3t71HmJzW3XKSaVqVLFkEZFgit1TWaLO9M7Enfhmeuw440cnJQ7C4jSAy8vsOXaiYH+dRVFgbVPnn1va/kT9OCBHKq8ZxuW4vHE/HkO7hhsj2vCqOXWrz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jMSYWtB0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GRM3Nvrm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lZWJ058549
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 07:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X2ckU9DLLAn5LdB48ZpPiIGBrsJhbpkMqNXUETVARFk=; b=jMSYWtB0xETMBELT
	d64Ood69eVceW3Vdxt15j4LqwyEWsYWoqWGnw8R8F3TaAsahMnkJpT0NQUQ0AEus
	1JCqvf0I1ceGHvNYvCLZ8mrj1efo61wSNHxLloP6QB1fhM7vE55E7FCAEWZBFcEd
	tDmI1ZWCU0iqq+9OxAKA9jXigt6WYrT3SjqPhDriM5WQUYsuAkqH6Tgo+60QKiTY
	sGK0oTdchz71fs1Z86+9eXNvGy1maMuHcu1RQbiH9WeE4j203/excc66O68+3gWM
	xlj5uaye/sN1G6ksa00MQzR+Vh3zSFGbx5Wy7wqwOctaVl2hD6CDVicZIOv/5ja3
	+powzQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hfyb855-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 07:16:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37ca4367860so1211059a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 00:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782890200; x=1783495000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X2ckU9DLLAn5LdB48ZpPiIGBrsJhbpkMqNXUETVARFk=;
        b=GRM3NvrmNBPhybpR0HpetIRaWOJV67lYAiVcqIKaoDflJQkNwgstbH6EE7qcGxCAqs
         DTw0NVbTainZzcrYla/4hIxYqXAZlYBK/+Us8ipU1k+5U4Ajcs3zW9M09odFCyhiSMJB
         XpuAz/lD2HtN8SN/sBV1XTICi4x1L9E58KW+ypc0Eyfi334Hesjjt7Bx+5BsjTTBsPCQ
         ojRMqCgLDflr3XAdZAvAWhpMTyY+QC1MrdFL4eTm+YSPUHda/Slg/4L1dt+yF8OAFf+o
         4WRAOVqnm4bQtCMyeJDZ7k9J8jClzsmMrW+gW0G8cny3eIOYQM9GycPpsR+Un9u8bUI1
         0mqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782890200; x=1783495000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2ckU9DLLAn5LdB48ZpPiIGBrsJhbpkMqNXUETVARFk=;
        b=rwgoo2TVrFfllnBPqNpRJPWDOAg468YXM1DHUlUckSFDydDOc6DEODYRb1UIT/inDU
         JkliRekiHMpqDnkjqXQ4LIlM2q+fPE8eKEs278G1lY7rqo6hS3bvBlYPTWjo0qQHNdWl
         GbDIBB/TPmflHBUgNIYp9vd2GwtEOsR5Vn/4dRezcZw3ZTL64QPOau5ECFvb9DrMxrOO
         xw5Ab74VDLZOk7aEnMhVzvyJCVSDiDBUvGN3PejiChtXGKYm3l7hiZk472OViIK2wxUN
         zQ2Ox9ZOwTvRvFHYRaCulGihFd5AxZqx6xbh/prf0RJ2uPpzeM70lO5O7t998BgfjgvJ
         Ep8w==
X-Forwarded-Encrypted: i=1; AHgh+RrSgTibEze+tEG3TveaPSXf2U3RFecNVbPUaRf3j1/PoyZcuPVd75/Nehy099PL2Mu4IBsUhr9hcTNZDCh6@vger.kernel.org
X-Gm-Message-State: AOJu0YxfdrbTMfPcJ2ITCcol/qvFgbCOZ/i6L9uftIA10p3ceWoOtt9m
	R/CrWdyp6qwLX3z3G5PrdQ4MXvpglKkfWY90/0pvWIp/Yh0d8lbmifWcvCA6tsglSQW8X2BH8t1
	yxEar/Vn7fjZuePFjgeevcSow8Z565N7obAE6GnkUNxIfBwfDw5Gp0pgqx71HjQ69x3lE
X-Gm-Gg: AfdE7cnZOFQxIecGecEq+p/SaDA8+p57F8dPgbqrQUGm8zJs+ZnPKthBTdzqEvm6Vzy
	k096MaTx88TtG8yBlnUG8txhY0ZhK3fWZm799eEjgpOxOOTFDjKqsVCAt7dEmS8yzvEWjGhxlSc
	aSFPvDSOeRtmQNrJGZOHccchNm7511FxTqyVxNvozGN4XbcQxxxQov8wnpc8J8Nc5s/FYn20EQz
	kcMIJjw+ExoYOFhTvdrhfu1k4Augb1UHdqUKCVyqsN9EjbtgMyPnMk8zcasy2Ey2+YMsFfGJSmb
	j/1uOPZflNESZDOffpa4/PgxqTlOf5y5jKM2MMMkP4jOXtw5J/FMqLqkhSWraJdkXtapKoQsvRn
	tVfncJkgzOmSZWA6zayjALjJH8k2N0aGAXeYl8bfjxBVzxi/QMu3JUybfF4cKEHSN6fXh/ajDcX
	c=
X-Received: by 2002:a17:90b:1d49:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-380674340d2mr4032529a91.4.1782890199815;
        Wed, 01 Jul 2026 00:16:39 -0700 (PDT)
X-Received: by 2002:a17:90b:1d49:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-380674340d2mr4032489a91.4.1782890199337;
        Wed, 01 Jul 2026 00:16:39 -0700 (PDT)
Received: from [10.133.33.76] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbcd9f5acsm2795438a12.10.2026.07.01.00.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:16:38 -0700 (PDT)
Message-ID: <4117c406-0d75-4eb1-842e-1d346b7fbf99@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:16:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
 <20260701-stirring-piculet-of-vastness-a361e5@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260701-stirring-piculet-of-vastness-a361e5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J5OaKgnS c=1 sm=1 tr=0 ts=6a44bed8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=GqxzKewt3drvE_C864MA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 1DI9IWLWkarjioTZ6pnxvn50-2xo9v2k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3MyBTYWx0ZWRfX0qT/apBcYHym
 tefk2SAD2pRVE4moV7i5B3Y3C6PxPsWl/tLWBYf+PQ3G3tWpLzgj60z9lJICP2zOyATSD53S2sA
 z86+v0/1dtovRKrTQyT4tZrGClBPpHQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3MyBTYWx0ZWRfX24Gg5WF+TXxB
 Qz4qS+u3650epxu9QqKfWfrXa0yKefRcqhIbjmYN5dUcSS983vzoAPuU7MnG9TW+kmgRfqg8q7A
 5vrj4XMN1gI816Pehnut39wRb+8tlg4O+vZlHZn0p8iUyJF6F2e8sNIjklRKMcXP4A+geIzDGYE
 cRLVL5JtYtSKCGIlKq/kGGGvQ8ZNZIYmm52rZmjCfeverj0p1ZEUIvxmlqqPinhBYOMc5w0cKgk
 e1u7GS2+38epML5bshxksP43mEYRAflnkU/0UNvqY9y66senJS3Jx6wqOCXp/kdN4kRZCFHzcO1
 BseydILaToxhfkm7a5MdnMk0vFC0SnSJX2R0Dc01ER7L2xpynuuw25UvPx/Y9QzZCLaqHWZ+mad
 QhXwpLqyxyfe8Y4AL9o/RmtRXHL30Ek5jAcqtzX+zGKEsBzF7inzEuQ67CGoOwq4qWmBziL956j
 0Z32iKM/sZFAhHiQObQ==
X-Proofpoint-GUID: 1DI9IWLWkarjioTZ6pnxvn50-2xo9v2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010073
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
	TAGGED_FROM(0.00)[bounces-115589-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6FBC6EA8E6



On 7/1/2026 2:57 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
>> The TNOC compatible previously only allowed the two-string AMBA form
>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>> AMBA bus.
>>
>> Convert the compatible to a oneOf and add a standalone
>> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
>> standalone string carries no "arm,primecell" entry, so the device is
>> created on the platform bus instead of the AMBA bus.
> 
> That's a Linux driver specific reason, so not a valid one.
> 
> Describe the hardware instead.
> 
> Also, you do not get other compatible for the same device.

The device is intended to be discovered and probed via the AMBA bus. 
However, due to a hardware issue, AMBA probing does not work correctly. 
While adding the arm,primecell-periphid property would allow the 
existing AMBA driver to bind, but I think that's a temp WA. As 
Suzuki/Leo pointed out, we should not add the property to pretend the 
device as an AMBA device.

Instead, I introduced a dedicated compatible string so the device can be 
handled by the existing platform driver without relying on the missing 
AMBA primecell identification. The purpose of the new compatible is to 
clearly distinguish this platform-specific case from the standard 
AMBA-based implementation. Or shall I re-use the existing compatible 
"qcom,coresight-tnoc" as platform standalone compatible?

We already have a similar pattern for the interconnect TraceNoC device, 
which uses the platform-specific compatible string qcom,coresight-itnoc.

Thanks,
Jie

> 
> Best regards,
> Krzysztof
> 


