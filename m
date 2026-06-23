Return-Path: <linux-arm-msm+bounces-114154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wLzwI5BdOmrg7AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:18:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A1F6B6328
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:18:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=obgNGQwX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WFzUrq7a;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114154-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114154-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9828530D87AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73928370D6D;
	Tue, 23 Jun 2026 10:14:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0131A371877
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:14:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209696; cv=none; b=VRmgo/+E3dNRn2DeQ3LnAvh23ngm7jfiIDqtoINEcuTkLB1RYyAW9cvbtpow10zmSkZ0bGuRQcwGhKQSr/KAPmG1BJ1sB8uhp+888JNF9RjsxN0pxBaMRyNkAJU3GP80fD0LwUobMOKwxXPf+eyIKL1VWjmHurr7nEkw/apy4Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209696; c=relaxed/simple;
	bh=h/l3OOAaPAcU357lUDWxx/hld8kSuU5DLqCXyjmPc0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ib2cIhB0zBcmNnvrssqlqWdmKuWa6WDcTxcVVcBLAsH13UpV8lPmlsOzsFusoLPzfHkJeyzJvUVSvNxfuXw7dy0URh1tdg3V4/8Vx7YTbKRtosotyN2avolHrZWFzXXKreMjyBk8bXRq2BK/l+jrQQ1+t7nY6PDTr12g6zPPe24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obgNGQwX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFzUrq7a; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6d6c73376029
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	450XRmBYB9coVCv15NJUq1Jdx852zTHOAZqDbpHqzRo=; b=obgNGQwX/4KGfduk
	G7YSL/nqDnO+4C71caPRwXRIjqhPSMLd16oDTQhNyGFF4+eGtoibZMOVuzVZZAWY
	gUX070zC3AvaK4qHIAsqX/0FDzASldhd7WElwfABHgxETvNhHwv7mWcqOPkKCe9D
	593YdlRwAX0WAE15seXs9jumiXcx/yRzU4/oWtEA1ZKnG+pj4TyQ8mkTvN1AKJFc
	14txsSZPxBZ6kZjpvsgJkWuSwvN846wEchNsxIiuN4L/GqjL7MGkHUyyWV7rxmUh
	gEnBB81QRJMEzV4Ie5A/6lk9Z68eI26cKFACx+jx7vfDiLNf0GHFD0OqGKy5zPZS
	4Ku4jA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5yec6rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:14:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6a2ee8cc9so49459395ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209693; x=1782814493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=450XRmBYB9coVCv15NJUq1Jdx852zTHOAZqDbpHqzRo=;
        b=WFzUrq7a/bFNnKd3vAq3EFAXwopAWAvBNqkVVap8gI/PLnnfso8htRyAsRyQFhHh6A
         Sims8BfYANYU0FcZxw0mn4ESPvJ857HAKnS9mKnsJuH3SKi1tFZH+oU7A3pqOAy9yR1x
         oM+PjYkMZKEc47PZNLSxuxxF014etOhWOHUOWjxRQochGUGs5xutcf2zePs1BMAJK0fS
         +zdOwetoeDWuH9Rg9jByacaHMdhkOKV9kTsbuwpxvLdkT8TDdBmsisIa6iXMutXg/Ruy
         Y6zLD0rOc6YspVQUbE/2NqGAEI80z43Oe3ntXPq8/qwg2LoJ5NPymKLcerkWxB84Q6HI
         C+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209693; x=1782814493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=450XRmBYB9coVCv15NJUq1Jdx852zTHOAZqDbpHqzRo=;
        b=DZ7P+SrZFgS6vF9XoaXEahJZfqTpoen+dGo4YhmFc39BPD5b21qOXqMj1om5g3kPJg
         3IMtDkmWq6rIcWzYYTb/WhSEnmsgEqNuJiySBK8yBJ4LvUSAgrYrmb4YGGc4wCo4/16T
         PReGiz5waPtfEmI/UnQFJOK9U0qo3mHjzqVVawS0AQS2yQ+E7agVDCmlhm8eNLiCY5ia
         TFRjfdmncuhZJqAnqKqNhFAfSaW9rSB8OdaOBvP/pW3lWihDKnFgbhZGz9so5eazbe//
         UQ9NcNl555e+hgIZAaggBiMDd6Eyo2YA5Hk+oth+7eI80oY43ZYukSSeBFls6lLCKM4C
         q+xg==
X-Gm-Message-State: AOJu0Yzre0rbrLLxRkfZrAEeeNNR5/T6ZYwzbtfwXFUbpm1QGwsXLDF9
	Sjwz+T1BAV3OEMhTc+fQZeokUMVnV+lzwOg3WL1jDS5Xq4jqAYSG/RSghlrFxjLOHFKErT48Pde
	Hz43HPQCLmmJo8qyHpNyhKb/4jrYXqhxYRYtYkp7yNTSE6muyUJO6AdNK8lONrD6GCs4n
X-Gm-Gg: AfdE7cndiIeniY62o8X5K7sitDJoyBrtHX0uhodrqxFXw3wrGc7yS9lfWgxYgu2QQ6O
	JMxenr3vDFSALnQRUhKsYYcLoG2gN8W9aO9Ke7wK2UTYwJXOxGFHLKtp375v+X0w+WWPRjkggRs
	Ph5nyBJDkduGTJeSIpB3FaVWnc5tBwBPtGbTsf0mYrXbGOmXZDYZtbJ5M18fnptdTQzqyhPVk09
	daVVlzWKe7pRggH8f5dXnwKqJNPu9slA7mmQyxIQg5jxaTAlw/L0QMKaAahRU5DX6FYG+hRFQ45
	tKJCWYxWIEcdeXE/3EUz3Yfo/E/qL9EGYYY//qadRhO93vbZfQmer4vbgkuHItOw34+Rx2HHwln
	kiUQpteAw0Zv7qkMl31jh5T2o3SDo0pCxyaVJmB8=
X-Received: by 2002:a17:903:1a26:b0:2c0:f807:9bf3 with SMTP id d9443c01a7336-2c7423d65cemr145303355ad.10.1782209692786;
        Tue, 23 Jun 2026 03:14:52 -0700 (PDT)
X-Received: by 2002:a17:903:1a26:b0:2c0:f807:9bf3 with SMTP id d9443c01a7336-2c7423d65cemr145303055ad.10.1782209692306;
        Tue, 23 Jun 2026 03:14:52 -0700 (PDT)
Received: from [10.92.171.15] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfe785sm99740775ad.66.2026.06.23.03.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:14:51 -0700 (PDT)
Message-ID: <4d0f96d7-3848-4442-a8e9-243a6c4a3495@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 15:44:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: qcom: Add support for Qualcomm MBG thermal
 monitoring
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones
 <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
 <20260601-spmi-mbg-driver-v1-2-b4892b55a17f@oss.qualcomm.com>
 <7478c540-a5fc-4238-bba0-5b04547f57c7@oss.qualcomm.com>
 <487f0ed1-dfc2-4f7b-94ce-60045017a663@oss.qualcomm.com>
 <5ad33cf2-3168-44f2-89fe-a7fe1420f8f4@oss.qualcomm.com>
Content-Language: en-US
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
In-Reply-To: <5ad33cf2-3168-44f2-89fe-a7fe1420f8f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lEgNxtsYsBSKO5-te5ekLOYrYOpMpPJ4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX7L1Ej1HdHRz6
 dEx+W4vpGhV3xPxli+dD8OVUqOB++nldAWB+aKBQgAYqSxI51KXMuKu/ACP1Q3mp0/W/CJNb+1n
 dsYNFEud2PbePQrcZ7nAXY4XK9Mer48=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX+QIjmPYNQe+Y
 rhCgmB+paa40N/3hQSmdC+v4mT6acSRXAaiB5HeLE1GprcjYLk8oOrtnOGlZdCNBJUyEMrFeeMX
 u8CWbVKv9VfhdGYf/2cGsDGxKW4FJHOaVYiIe0uE7HtRiHz72xYrsRZY90hHEnCZdj///IxAjDB
 tVTceRrPdmIQoZvl10RA9Eva6eE5R4nAkWnyoYrROBYH/xj7evXrcj432os23hRAmjjruSzAW5U
 6j+mDSd/Lq/lZoXM4eUhWaMSVx/Z3FYdSh0UErgHO7AOfwglSvPYXZoYWxN4V7ULHw65tSrmDxb
 ez4mZO2+4mmLkCIBR/1O4UBRsI7sFhaNyud7cYWCAi9B2jclWNQm6Flj+CSjSty/uTrtVQAK14m
 0FyMM+NzTi4murc3xHAsuoO3koowicmOoZzubfWmvJCyrybmMyheWnePa0w49Buh/Uxx3/2SKwX
 lKgCaAdTFOI5WUoaskA==
X-Proofpoint-GUID: lEgNxtsYsBSKO5-te5ekLOYrYOpMpPJ4
X-Authority-Analysis: v=2.4 cv=YpI/gYYX c=1 sm=1 tr=0 ts=6a3a5c9d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=oS_SqjwSy1YzO6rVN58A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230083
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114154-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,intel.com,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:sboyd@kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_skakitap@quicinc.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sachin.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sachin.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: D4A1F6B6328



On 6/19/2026 5:44 PM, Konrad Dybcio wrote:
> On 6/19/26 8:45 AM, Sachin Gupta wrote:
>>
>>
>> On 6/16/2026 3:40 PM, Konrad Dybcio wrote:
>>> On 6/1/26 1:01 PM, Sachin Gupta wrote:
>>>> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>>>
>>>> Add driver for the Qualcomm MBG thermal monitoring device. It monitors
>>>> the die temperature, and when there is a level 1 upper threshold
>>>> violation, it receives an interrupt over spmi. The driver reads
>>>> the fault status register and notifies thermal accordingly.
>>>>
>>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>>> Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>>>> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>> +    /*
>>>> +     * Configure the last_temp one degree higher, to ensure the
>>>> +     * violated temp is returned to thermal framework when it reads
>>>> +     * temperature for the first time after the violation happens.
>>>> +     * This is needed to account for the inaccuracy in the conversion
>>>> +     * formula used which leads to the thermal framework setting back
>>>> +     * the same thresholds in case the temperature it reads does not
>>>> +     * show violation.
>>>> +     */
>>>> +    chip->last_temp = temp + MBG_TEMP_CONSTANT;
>>>
>>> Will this work fine if the user tries to set the max temp supported
>>> by the hardware (i.e. is there headroom for max+1)?
>>>
>>
>> In the current implementation, temp == MBG_MAX_SUPPORTED_TEMP is not accepted (temp < MBG_MAX_SUPPORTED_TEMP), so the last_temp = temp + MBG_TEMP_CONSTANT path is never taken at absolute max. For accepted trips (strictly below max), there is headroom for the +1C adjustment.
> 
> You check for `temp < MBG_MAX_SUPPORTED_TEMP` and there's:
> 
> #define MBG_MAX_SUPPORTED_TEMP 160000,
> 
> so passing temp=159999 is "valid" and after the addition it becomes 160999,
> which in my understanding is outside the range
> 
> Konrad

chip->last_temp is only a software cache used in one place, 
mbg_tm_get_temp(), to return a synthetic “trip violated” reading once 
after the IRQ. It is not programmed into any hardware register. So temp 
+ MBG_TEMP_CONSTANT exceeding MBG_MAX_SUPPORTED_TEMP does not cause a 
hardware out-of-range condition.

Do you see this as an issue?

Thanks,
Sachin

