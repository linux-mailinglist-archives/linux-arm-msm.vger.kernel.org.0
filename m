Return-Path: <linux-arm-msm+bounces-107831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPiPG6//BmqVqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:12:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAAA54E2F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03F1F3004DDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B4E410D19;
	Fri, 15 May 2026 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cgE/jV7t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGwT2TVT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDBD3D1AA6
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843528; cv=none; b=XL2nFapJwgNa7wnvPcabYtgAXA70LN5qnpr+CymA8Z+6NdeIKQmdCnNhEwuhlT6nRVW/xt2fWBIJnTe73c6cwDmJRhR3jsD5o3z2kHQYTboIAgkO8GpJxFqycxzdOriTPbfWEzEItb8AqcV0MHlq6/EfZi1mVTOzzR0LaMApUZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843528; c=relaxed/simple;
	bh=PGYLOf4H2QMPbrBU+NXGsXdOedNRm1YfTmB95cYcsNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rsClDNIu7gv7oeeUUp0a63nrgT4sZaHvhF0oNFmC1ctbxnuB2TohiVu2BHZq8qQ5DIASg+PWrx54ZuvWxV9Lfjg/yPktduPg8gw1kS/k1IPW6+ptwXqiSojO1SVgRQTONMXWR23zYzRbwBWZbVPx7hwlJWan0JOiuQacg7uq0LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cgE/jV7t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGwT2TVT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAX64S3219657
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6u7L0Q9dnsKKK3HvrGHppxM7smIumAyVg/mpzy/UTJw=; b=cgE/jV7t8xMKnFVH
	YZkEnvtWnrlbERrnipBi40loNRNCzgU42CBGR/YE3+jUfwcqfus1M++99vnj2BYW
	rocamrHtTAmMpzAmf6ufWQ5xAcKFcvszWmtTMzfG9Yyhd/nzuPC/WgfU4Iu1qkhh
	pkwfqZgfxahzxbVur8CTMjloITWevR/9r//hC+V9Q7HvGlY/kmEmpHgRx+Qx6y+Y
	F1LsWLVIXXfTSxj/TWVZnzKM062ChV5ROaixzujS+O9j1PBC+8QQ/BnJu1plmNU8
	2WAr9F2r8E5fP8bsRcxeNIJvqWqjqGs2tBmlOzZpOJJPg0vrubRFY/aSYzYfzbl3
	oWq6eA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s2yaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:12:06 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63126f42441so636432137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843525; x=1779448325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6u7L0Q9dnsKKK3HvrGHppxM7smIumAyVg/mpzy/UTJw=;
        b=bGwT2TVTqA7Hm7dB/9pQuPjZ5RQYTRnmSaKt5Zy8OIwe5kiR/E1sm3A+CEBRGnDIXn
         jneyjvA4o03/smc00dkppMQ/Ip1j9cfphiJdtumnFOI/MuOllSg767vqJR3Dq8E7IDUH
         LJQA+u8qhrDFPOq9TsCYxrq6xWEdmjeS8+73CHYTT4FpiddACyAqR042rFrUIrAheTRB
         LMRgYAPcyRlBTZLJHqLrKTEHHP8cTIFeH3+Tj/Duy4i6pXIe5gsagBpAP7vWRkkY0Zrk
         PhoqYz17dkwKBc7NYyvKWuSOTdFN1FmYlDQ6624t09Ps7yASVRN/yRJc49hVdQpZptgx
         Akwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843525; x=1779448325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6u7L0Q9dnsKKK3HvrGHppxM7smIumAyVg/mpzy/UTJw=;
        b=ipXuPwKU6dtnyJdSLlReBKnDzIoTY/CTCm5QdgHYSO5zAsaUPyxtsNgWvhd77KQXK9
         vkwdJ61qdi/1YdMMhmwbf1du27CuLLV6bs3hLJuZPRCMLEF5lYXrBw7k3d4+P/162Mis
         r4/UZsaR8vK6iJ2rzdQRu8WhU2oJEhDKzUzOScorqUPhP23Z2caWLd/IukJ8lJSsL6vx
         nBMTHjzu3yTcNR2Es0sZMO7e2rNlso0nvGbEEwDVmehBuJQUr2JENZuzNZf6VSpP9wPh
         XIHbe15o9wA4Ha7z+8cjGyvUGY0g8OMjDmhE314cspdlC6ZdJWSYlHI1YKQ3q08Vn0J6
         sLbQ==
X-Gm-Message-State: AOJu0YzRcQRTtTKaAij8bq9ArmmJP9qnLUqVg2+u3t3cqeUkPVAeK0Kl
	5zIGmIRJ1J48r2ZbuvZclwPghtEhDkRQ84TbFzxrUBsinoQ7V06L9SqCgVTQvnCWRFoK91vusia
	Gr8FyRnc596O/ICW7B4hMXiyAHEPL472OiRKXQz0ZHpU9YEBB+nNGDiTcRqOrHgHjvNOd
X-Gm-Gg: Acq92OHclX+mDh0kt2O2PWnXFgLXuP9HqBKYQz0gVk+fXn75Qtn8GBthMkmNNRSiHw5
	W+8Wd99dQCkbW4ByL+tGDRBuRHiBk1WbTCdbeBuLRuj2bH3c5bUhFxIjwyvZErwFVVgfukgcv3V
	PW3A+IUMk4PL3MJkEKm3gaJky+YNMbC5/OwBn1xNqgOYtaMn19Qn6+7N967bXuudyM1tbCOl89F
	3OODv8/rKkqRy3gxnVcbZ0yOqgpqC+hdMmd52ppv6oQId2MGDaEbtF5+ggO2FMQ9AAuRB2tnKLg
	U+ylRwXR3muWS1WfD37LWXgRPJuDad4a572i+EiCeAUVXGc4dV+IfEgz9YZlePTBN0BshwP7aFN
	HMP2GFE0FZrOTyeGKXWNxAhpM0ofIFOdDMlms3lkSdMLR3z+kjHcPMt3JY5UE243IJ7lj1LXZit
	Mtook=
X-Received: by 2002:a05:6102:30ab:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-63a40dc920cmr389919137.8.1778843525579;
        Fri, 15 May 2026 04:12:05 -0700 (PDT)
X-Received: by 2002:a05:6102:30ab:b0:637:30f8:5cd5 with SMTP id ada2fe7eead31-63a40dc920cmr389918137.8.1778843525034;
        Fri, 15 May 2026 04:12:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4eac613sm206295666b.56.2026.05.15.04.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:12:04 -0700 (PDT)
Message-ID: <62f6c5fd-c952-4bcf-9125-c5fe92fca1dc@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:12:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] interconnect: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
 <20260428-interconnect-qcom-clean-arm64-v1-3-e6bc3f7832db@oss.qualcomm.com>
 <bb02291a-1579-4069-b6b1-757a0b5fb7e6@oss.qualcomm.com>
 <ca6c656c-07a1-466c-9c1f-a2efbf1498d0@oss.qualcomm.com>
 <02578386-a492-4342-95aa-9cfb00c8bacd@oss.qualcomm.com>
 <720715a0-eb4f-4083-a67f-aa380e130d6c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <720715a0-eb4f-4083-a67f-aa380e130d6c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMyBTYWx0ZWRfXzmJ9jryEpquB
 3TswvUPAQQB8OmXTd3aML7M8fPhstU3a8c7u4pqwGzstXIIBNvEJvxRD32cUU29HUMPz6zK+ueG
 /2q9btLYwy+8nemfEWYYPiUynJYtIzWZxCLwYxebuNoeKP1EWva2XatP5RyZgm//M1+dK3YlgPA
 f2L2G7WzBV+qOU7utxqObUdjbeiVqXYSJdfTq8eAny1j+m0US7H9bro6c4aUYvuGgjqNF/kxGYB
 d5fhhhcF1RIE5ZQy6uuYFOu1hpfZbHIluHpEYKIAOD5Fm0t9d7CZ0DH/PTvPpOM9bbLBG1ptJhj
 7ohrDXZQPvWLP2UTkBwT1/VWPpRO9+dfM1NM64GUXOGURQmhY++YL85Gic1gyp+cCbyAdjcimeQ
 /vfWwCJ1zSVd6cbdBdaodbiNgsnHmkPTMJMj54eZWp2wziNzc7kZ2rCvjt71cT3yJzgNSXtsJRs
 ajuvpdt8aYpySqWBQFg==
X-Proofpoint-GUID: Oc_kPnQ3xt16UKZGXF0_ai5pDAv3UNJL
X-Proofpoint-ORIG-GUID: Oc_kPnQ3xt16UKZGXF0_ai5pDAv3UNJL
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a06ff86 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=uUpgVYKiIJP92WW26QwA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150113
X-Rspamd-Queue-Id: BEAAA54E2F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107831-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 1:11 PM, Krzysztof Kozlowski wrote:
> On 15/05/2026 12:54, Konrad Dybcio wrote:
>> On 4/29/26 5:09 PM, Krzysztof Kozlowski wrote:
>>> On 29/04/2026 11:23, Konrad Dybcio wrote:
>>>> On 4/28/26 7:32 PM, Krzysztof Kozlowski wrote:
>>>>> The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
>>>>> basic or fundamental SoC feature: bandwidth management between internal
>>>>> SoC blocks.  SoC can boot without these, but power management or
>>>>> performance will be affected.  These drivers do not represent any sort
>>>>> of buses visible to the board designers/configurators, thus they should
>>>>> be always enabled, regardless how SoC is used in the final board.
>>>>>
>>>>> Kernel configuration should not ask users choice of drivers when that
>>>>> choice is obvious and known to the developers that answer should be
>>>>> 'yes' or 'module'.
>>>>
>>>> I'd say let's make them all `default ARCH_QCOM` - all of these drivers
>>>> are required to boot (minus the OSM_L3 driver which is "only" highly
>>>> desired, so that your CPU's bus isn't heavily bottlenecked)
>>>
>>> So the few of them should not be a module? That's what you want to say?
>>
>> I'm saying that if you only want to shoot yourself in the foot and not
>> in the face, you can make them modules
>>
>> But the L3 driver is required to make the caches run at a reasonable
>> speed, so that they don't bottleneck the rest of the system's mem
>> bandwidth
> 
> okidoki, so I will mark all as default built-in as you said, including
> the OSM_L3, based on your explanation.

Thanks!

Konrad

