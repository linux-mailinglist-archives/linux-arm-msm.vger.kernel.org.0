Return-Path: <linux-arm-msm+bounces-103739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKWZFsAH5mkIqgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:02:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C77BC429BA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22297303C51B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924311E5724;
	Mon, 20 Apr 2026 10:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYEUQaMp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kr3i6zKH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A936C126C03
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776682746; cv=none; b=qzRjf+AL7DIPdEgObaxIYMpYAxjQM248soTxBimUETcISCBNiCPb4yGDD2p7XFqhMZ7Mky7qgh6jBhtFWsDpRGHiunjRbflhQx4V+P4/cPMuZkUxoVNJHK4JKdQAvZri4Ke8EMrKANebJ5o2gRumYyAOeljAk25SGwbGw7uIxVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776682746; c=relaxed/simple;
	bh=Kgbx69a7RiyjmmfBGK/p0ZwBmQHZB68iKT4GgFYQVE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GcyGzVLnhQaqOYTkJ4wGNITylCjdDSHcDiw38MfnaMOFT9tVhIvrrpMiMZuya7CgMgXmxgHlbcqBtOLIrKghyS0pSs6eVaV3xUeC0LzeAQwaZ76VbC/ecbMoPINHUKwRpNMnr2hJzZPfuIQaNQ2kGrX8BQop66TDMC0ukRBqnqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYEUQaMp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kr3i6zKH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KA4ITo2980963
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QgY6MV8u8zrLC/Y/isXzi/8HKm38qslcvgo71foq/ig=; b=mYEUQaMpM0ta5eg7
	AGNJjMb16LdpFV5P3meK2b1++9Ga31Vx9HGtBmwdDXXsKqIUjHeC8kqOmUdeztsH
	nZlxcB0gzUNoxMOVVDKfv4ohWVwwSOYaNi1DYSbHoxg7yezSOtn2mf+Lcu/KaPf4
	mig4HNiPuBKHkYomNrtWKFDE1zMFZeCtWu8Mx5JIDfociAydaHJsRXLlRCRYuPUO
	gdQdw0WaNf3e7RZ1Arm7zIbDKEhW4QPSQUZRRO19ZCgGPCp/flQ/HXt+zIvR06hw
	dlKRv81WDeOHrjWIed3sbOz+GPbF+SrGKLh046UxcNr864lDNu+Tp2lkwNmYtW+u
	joyWsA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnj2pr5hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:59:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e62562b6aso1157121cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 03:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776682743; x=1777287543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QgY6MV8u8zrLC/Y/isXzi/8HKm38qslcvgo71foq/ig=;
        b=Kr3i6zKHMA/hPRYNY3Fin1qNtMLmxZ0D+n6ROc3KG8aDPISLxbUVsh3z04jvrnIz5Q
         vh2khc2CFHC0SOmQjb3+kDg4d3obNZCl/tQVBBQG3ZKLtkufN3cm9142neUuSyH9YqJG
         8cH91iJ+VkMhrI4MsG1/8+UWyEiXEzuT4Bxl1BNkP1AJAzef3Spr8Yk65z1plnSjiJvk
         ledpsL5thr+p4T//imdxgUZbIDxS4XW9e6CTlx6Zus1CuspULm0IyLixTxxCXhX7pdLg
         yfIsXXiW2/1CgWI4J6vHDdYyhsiQs+mlq6JPP7QLeUsnNe+wmJxWbRXFSQpp9kkhOKaE
         79oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776682743; x=1777287543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgY6MV8u8zrLC/Y/isXzi/8HKm38qslcvgo71foq/ig=;
        b=BKvzpRJ7/j6K9pk9oFBPZBNxFg2sIbw6dP54UAgqvJDLztvwRsajH+tGesAE4m47Az
         C52+r78m+7ADkx3NHqVMpgv7OFFcRRt15gFg0GX2/SUydLPcFWzENwrSNc05FlyIxZuT
         PNtUI4Ab080SGF6NNztSYBRlmP9tIT10otPdoTs2Yl1s6lZpozC8ZyMHxaywc44e0uuR
         FZxKTZFgAf7A7eN8e9maJ5BSNfISrBJwmLHzYT2Crhx+aZYe0UK8blsWKEIHOF3cLiYi
         wcZGk/KEfXw0XCmSiDxY18qGLBllWr/fER+MLyl9MnU87a6DAzzTiWvLavvaqqFSdfKZ
         Ixkg==
X-Forwarded-Encrypted: i=1; AFNElJ+G6qUxor3mvl+Y6cXasjOjBrn+92mF6nSN1RrVrYhIUD5vamnRAFj47BPzwpsvynIz1fzAbGsvg/H1eYbP@vger.kernel.org
X-Gm-Message-State: AOJu0YzEb+Ph7I2y26Nkzz17SyZDodjklYxJrn7Gr9r29+44j6soYvT1
	VUomvxPs3AvyIuUMCxjkvbnnV2cJKoNTUw9uTCrmRJeDBK7Z8bv2232ozyMJZ+shUh9ekbhleol
	SeHOyl/ghWF8UmE/9GGWWRGizA1ypaqJNLyOPqY4PJxMOUChAn0Z7DMh6ifOr+BdSX4Mv
X-Gm-Gg: AeBDieu8CUedd2ryIF/knfwVH6ssZJyttWT2XxDrQyODcS6nDjv3byuDXplyQ/tFhv0
	h4qqqmVPlT2JAfOqABlGLGt/NOznMnNK2O+BKgDTI7WB2Xzar1/PNmmRkvY4bmN/6/d9k0WfJtq
	ydaBmHZUDX8FcCnNYiHzt4+w05uZNvXOp/AE56nSONEXs3CCj7caVyWkRGmfhpiGFd8YIMBi4IC
	oZs43UrvB0jXseD98vdTNZ7Msvov98MDyiYLbRjIqSn6CmlMqtYDRRoj4gnBfwQJqeG7Xm9J17j
	OpXhnrJ+XcB2MkJBysGEPYFz13FnEHw0wVAi8KiPbiX0/xP5IsfYbYAC1YaGHNlLgncz1ssXlxa
	aWu+34QUlfgn7cq7bqZGZxhd2uLRqpG1l6dnJmeePxp9bVyLptkwSU2El31goJC2W08kHS4HdOj
	b4l5ym4Hlq1V7YUw==
X-Received: by 2002:a05:620a:462c:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8e7916ad053mr1166919285a.3.1776682742811;
        Mon, 20 Apr 2026 03:59:02 -0700 (PDT)
X-Received: by 2002:a05:620a:462c:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8e7916ad053mr1166917885a.3.1776682742390;
        Mon, 20 Apr 2026 03:59:02 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d67e50sm1809282a12.27.2026.04.20.03.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 03:59:00 -0700 (PDT)
Message-ID: <b6a19ac0-4ebe-4df8-818d-ba42b0a33dc3@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 12:58:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: add several missing pdc
 map entries
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260419173251.1180026-1-mitltlatltl@gmail.com>
 <4abb1626-a0a3-45e1-9289-fee366a8d9f0@oss.qualcomm.com>
 <CAH2e8h4bMve_hfW6VXynBh--DgwW2v8=XuVpAzUoS8N_73ZEhg@mail.gmail.com>
 <b9b58923-40c0-4d3d-991f-52471b29a813@oss.qualcomm.com>
 <CAH2e8h49SxvPtSXB1AWcNNfqC_ZV6-V2YKbN2_rwSemh7G3b6w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h49SxvPtSXB1AWcNNfqC_ZV6-V2YKbN2_rwSemh7G3b6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: noTJA8VI_gSnck8tcwT9U9EdUL9GViI4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEwNSBTYWx0ZWRfX5xdJpgkdUNYm
 54quTN3uXZg+hy43NJ+fGgkYGDLMfo4WwGCnE1OAwBcPEJujCKeH9XWDUIYM/xlBsIR6H0nnTMt
 rd+dZyPBHBQcE3gPFZ57yUxPd1jCO3sHL8WTOm7i43hFBzCm8EMTFzAf4bJFOqhOtX+BiMU8jWx
 cuW7R3KHwvNSXMlZyW7SsgELauLHABbS0urzmkbJ/lgTyxJqd1Glkd6FFbHUKakRPUOaFS9SF7m
 D1MQLR4qD+xFOGpK2SlT0Jo87zBkd8LpuqjjuMcMVjkpt0LzLU3N4n8bGwGBElVsZGVc4yqrkkE
 MaIpZK9UtT+pic7B3yOckCI58roN3SXFwEOzy9hnHOFXFIWE2tLBe/WNSoP2pbrZldFMsidVag+
 JWr6beAsWGZ7ehnFX1Cb8UQmqL8u6CwBscBX8BW+BY2tZxoaWcmsMX9HzgYEfNhLnCF3PJM82ER
 McxL6yVWpX/B2ZzySWg==
X-Authority-Analysis: v=2.4 cv=XMoAjwhE c=1 sm=1 tr=0 ts=69e606f7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=HiuIrkTBTQer7cJPyS8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: noTJA8VI_gSnck8tcwT9U9EdUL9GViI4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103739-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C77BC429BA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 12:47 PM, Pengyu Luo wrote:
> On Mon, Apr 20, 2026 at 6:21 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/20/26 11:53 AM, Pengyu Luo wrote:
>>> On Mon, Apr 20, 2026 at 4:32 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 4/19/26 7:32 PM, Pengyu Luo wrote:
>>>>> pdc 215, 256, 257 are missing, but we can find tlmm pin 103, 84, 90
>>>>> are mapped to them respectively, so add the map entries from pdc to
>>>>> gic. These entries are reversed from .data section of qcgpio.sys
>>>>>
>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>>> ---
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Konrad
>>>>
>>>> The below change on top will fully align it with the data in the docs
>>>> (no functional change)
>>>>
>>>
>>> Glad to know. Could you please help to check the tlmm map too? When I
>>> was parsing the binary, I found
>>>
>>> tlmm 65535 => pdc 70 => gic 520
>>> tlmm 65535 => pdc 174 => gic 733
>>> tlmm 65535 => pdc 175 => gic 734
>>> tlmm 65535 => pdc 176 => gic 735
>>> tlmm 65535 => pdc 177 => gic 736
>>> tlmm 65535 => pdc 178 => gic 737
>>> tlmm 65535 => pdc 184 => gic 743
>>> tlmm 65535 => pdc 185 => gic 744
>>> tlmm 65535 => pdc 186 => gic 745
>>> tlmm 65535 => pdc 187 => gic 746
>>> tlmm 65535 => pdc 188 => gic 747
>>> tlmm 65535 => pdc 194 => gic 753
>>> tlmm 65535 => pdc 195 => gic 754
>>> tlmm 65535 => pdc 196 => gic 755
>>> tlmm 65535 => pdc 197 => gic 756
>>> tlmm 65535 => pdc 198 => gic 757
>>> tlmm 65535 => pdc 199 => gic 416
>>> tlmm 65535 => pdc 204 => gic 462
>>> tlmm 65535 => pdc 205 => gic 264
>>>
>>> If 65536 means the pin is missing, I will send v2 to remove the tlmm
>>> map together with the pdc removal.
>>
>> These seem to be LPASS/SSC GPIOs
>>
>> There are missing pairs of:
>>
>> TLMM 151 -> PDC 264 -> GIC 191
>> TLMM 143 -> PDC 261 -> GIC 402
>>
>> and very interestingly, GPIO 190 has two mappings:
>> PDC 70 -> GIC 552
> 
> PDC 70 is connected to swr2, which is wakeable. Speaking of this, in
> qcom,pdc.yaml
> 
> Drivers requiring wakeup capabilities of their device interrupts
> routed through the PDC, must specify PDC as their interrupt controller
> and request the PDC port associated with the GIC interrupt.
> 
> But swr2 specifies GIC.
> 
> I wonder, when should we use tlmm, when pdc, when gic?

I would assume "pdc, whenever available"

Konrad

