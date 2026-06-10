Return-Path: <linux-arm-msm+bounces-112284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ChqmIM7VKGqtKgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 05:11:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3486665913
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 05:11:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AZvpFaZG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NXIoYoMw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112284-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112284-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E2AE30DBE4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 03:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE25A340A76;
	Wed, 10 Jun 2026 03:10:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8926B33F5B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 03:10:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781061032; cv=none; b=iIk7xEvPhkeA75eY0ovFncnadOJv2xDfeBbL6UPeseQq74cnKOx1NZl90IysQ3ZNDXalLh51UwC7tjCAiWkPQMsq3rePBeunoJ9rM7/Irn9u5snr0Sm10VncAb2XaAviy8ttqhaRg7ZTdC6B6ffaUnFZo6Kv4hhagjtD5+gW7gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781061032; c=relaxed/simple;
	bh=634BnfYsa7PCxiyercmqvt7DGN4XvxrpkhGybRKzMJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OmZjF+CkIwPPjeO2Sqi9LNEifE1ujrls2/GQB75AktYBK/GqXy2BXsFGOfRjIDAG6wIVFILrnwLc89qdzwfKk6BWkDeh+wwQlbciWsV45A16eX660OVpNljImie6UWVDy1WbZf0+SDuMdTG2NXM/IfYz3zRs1anjJSTGscFE0Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AZvpFaZG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXIoYoMw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2exc4205813
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 03:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9+eFqPsmWaRwlbi0tjndZiwSh3Muv16DZxWChbiNGE4=; b=AZvpFaZGKas/vkxw
	ZaoEYCJF8siap+SM0o3/kr5OMrlfcn2dvsKGv5CkFidMhRfpeTLBKqos0pfEwbVe
	IeAtQoIUuxdUWgF8K4wz6mS8T2RPJthooo03MP59p1jzA+oSoD0NH5urlL+hwmq9
	a63ZaqQud3LAlazUoBPsxaoB9RA7LG1APnf4B6fAlkALAZVwYgwS335EpVEH3Vph
	6lNHv8dFHKO7UxRDV7Cy3t3PcnQq4MkjfvqL6DEmBSmaCJBmQ2NZHhYaUl7e0EGq
	wmjVLGVmuVkHB0De/nDsafPZfKH7xZWgfgMtuZ6hnOYMqWM2bTREJgHiE9oeNXxZ
	iMX07w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4n304-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 03:10:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d985df4cfso7279274a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 20:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781061029; x=1781665829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9+eFqPsmWaRwlbi0tjndZiwSh3Muv16DZxWChbiNGE4=;
        b=NXIoYoMwoYkcyqMb77urlpJcynZELEA4/QzxnN9qWGF8xJ+cBthdd/YhEOV312nR+C
         cIa32NLD8vEQBlIHtx1gy2nCkrpTOT8pCsD2iMXN36+tqmv2tKO+8n3ar/823YTNPhiw
         1HD+O0/A/fdTkH34KSRSoVhk449m2xl4HizkvOUaCbKpLe2VJZYKXBZSJDq5/S/jVuDY
         h9pUMFoARmsAheOcdTy+he9183HTUYphWdc8AqSlu1l6GkJiw7CBn8pcNEjxdR44GbbL
         pF2lMKdJDezAZxFgQISiyW5urBtgH7I9TuW52e9Se+4JVFcM8I66uj90gz4ubeOOW4j7
         nMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781061029; x=1781665829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+eFqPsmWaRwlbi0tjndZiwSh3Muv16DZxWChbiNGE4=;
        b=pqBxwiG336JFsjHOBl0irYKux28y3nxbbMsF9GYBaiNx2Ob8eFyXlY1ArUH0j5/DNz
         LpcBrSy83AFgFFPf6B+MH7xpn2EjKD8tuC+JIL6NrJTxSJaEmJZXiOghnoWNsjtvKRZM
         trS5OAfh2HJCn5AI1W++LDqZkU2uBQuWhQno8y80gn5LnuguGZ4fbCYtbi3borKmz+3t
         RZSwUwivCbd/TWK2f6urSrm00IQxL8o4EdUVE4yivilWR1tqCtDB1MyNPcR35Y2QJJ/8
         NVMG95tBRTOiqUM5f6FJ+4uAiURxf9k3BxzemVDl1eh4DEAFQgrIrMkJ/oI1/G8MXJEN
         svew==
X-Gm-Message-State: AOJu0YzqsinAVSVBfxEE3nX8WkZCop+5yYT6x7OnNbGBMcO+Z0rGIlJF
	5y9vVIuNrPZVYs9OpPuKEWK8yPKO81YbemF4zsmp7DnWqGuoBYz5Jpt2crJ3FoCClCthLHZn3Cc
	+0lrym5HIubaeLY2l+WRx5899GtFE2TDs7z7stx3XnY8ZRF8yE5RPfh7QUdiJga1nZHOD
X-Gm-Gg: Acq92OEa/tsxhSs/WqcokIPT3VYS08ayDZIyUq8p4D0oiHxEjzYqUAlPyQdlnuF8dnm
	Bq6/a7XkaR6Hn/BZIKlINQageNOi1DjlUxdRoinOjm8Yq5FhjJuYt2qmR7qq2gy1tF/kuIeV6M/
	GiwLklSOv8ynAOfb+P/F5cg8YheDh5xXTc/6fX2bpW+/HIx571yGxH2OoaE4wYk7Qi8v8TJCyId
	0ENLjCXB6y2xGCngMr9WRZESbBhDLB/fZRBd+/ioIlkv8UYjscOCnxhU7m3OigexZVusxKRAvJe
	VXH3In0vkwaU1roKyLUd0Pz30oOFolFMI8sVOst38XEp4ivbsj9vqsNtnIJUTPFDqzY4vJ68+fZ
	1AuHZnWXnVOIF+Z4e1a689YKKg2LtxG8XKmkayyjMA/KUNJYcwrgLdzoW8iZ4lF4yAl68Rla4R+
	AownUil2nIvBJBrltnT7EdFQ==
X-Received: by 2002:a17:90b:3909:b0:36b:bb66:fbd0 with SMTP id 98e67ed59e1d1-370ee33d069mr22550837a91.4.1781061029346;
        Tue, 09 Jun 2026 20:10:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3909:b0:36b:bb66:fbd0 with SMTP id 98e67ed59e1d1-370ee33d069mr22550806a91.4.1781061028859;
        Tue, 09 Jun 2026 20:10:28 -0700 (PDT)
Received: from [10.133.33.189] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37624a8e7c4sm908882a91.13.2026.06.09.20.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 20:10:28 -0700 (PDT)
Message-ID: <91117dd7-91e1-4c1a-934e-1b6717698377@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:10:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5018: Correct CMN PLL reference
 clock rate
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260521-ipq5018-cmn-pll-rate-fix-v2-1-04b28a92e0f2@outlook.com>
 <cca7e305-bdf0-4ddb-b299-aa25a183e229@oss.qualcomm.com>
 <9ab1340d-72bb-48df-8784-a584a37b5c76@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <9ab1340d-72bb-48df-8784-a584a37b5c76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a28d5a6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=DmDlxQa2pT8N5fOTvVMA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: ri8ZBAAnUAZ2wNKPqOlJoPWBBXhEq4NA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDAyNyBTYWx0ZWRfX7Sz/tcCjMeLG
 V/jcAWPPGMN75+nUG2tDAgHdwS4srnRNw6HSR/GwsOHAcWti+GJz1B4i4y2HlpAeKWhBTdOF4ql
 7Lq2d7GUf4AfEQGZmnR6yG1EcWPA5/KCkSzQQVrIjCXQ+FO5KtT3ZZgfyhHiiT+w5x9Do/RNom+
 O0VdFB2OElu8dG6T+gcBXDZdhEz8VlmBr7yEZYWZqWLna5fabYJMK2JbGYK7ObQS3ivuvWXoAS6
 j9QEMOQ//sChHI87Cwdv5SlYZpgvNJRD5yTIiQr6uSQWBw8PrsxRoDNRPqLNpBGv+uTz1QWdh1P
 HYAf5ZpMsO9t6iHJsXsvdHOu6LSuhuJQJDbmThTqDJYErzb4Wj/QF/FJXETfUhCx4rBuTfJA6SS
 36IDlvOWguwDUjegmYKxMgakxGboc/teJiNBaJFPu2cMDBxufb/f0QGvDxe0KI+fvmuhI+br6Iy
 RFdPBXKau2hrZGWcEsg==
X-Proofpoint-ORIG-GUID: ri8ZBAAnUAZ2wNKPqOlJoPWBBXhEq4NA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100027
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112284-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:george.moussalem@outlook.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,outlook.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jie.luo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.luo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3486665913



On 6/10/2026 12:59 AM, Kathiravan Thirumoorthy wrote:
> 
> On 6/9/2026 8:42 PM, Konrad Dybcio wrote:
>> On 5/21/26 9:55 AM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> The correct CMN PLL reference clock rate for IPQ5018 is 4.8 GHz.
>>>
>>> The CMN PLL driver did not account for the ref clock divider which is 2
>>> for IPQ5018. Therefore, the computed rate was twice the actual output.
>>>
>>> With the driver now accounting for the CMN PLL reference clock
>>> divider (commit: 88c543fff756), set the correct reference clock rate.
>>>
>>> Fixes: c006b249c544 ("arm64: dts: ipq5018: Add CMN PLL node")
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---
>>> Changes in v2:
>>> - Removed line break in commit message between Fixes and SOB tags
>>> - Link to v1: https://patch.msgid.link/20260519-ipq5018-cmn-pll-rate-
>>> fix-v1-1-3c83a173c27f@outlook.com
>>> ---
>> I have no reference for this, but I trust you.. maybe +Kathiravan
>> could double-check
> 
> Thanks Konrad. As per the HW doc and the commit 88c543fff756 ("clk:
> qcom: cmnpll: Account for reference clock divider"), default ref clock
> divider is 1 in IPQ5018.
> 
> @Jie, Can you help here?
> 

Hello Konrad, Kathiravan,
As confirmed on the IPQ5018 RDP board, the ref clock divider is set to 2.

>>
>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad


