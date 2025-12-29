Return-Path: <linux-arm-msm+bounces-86877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA1DCE81B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 21:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44518301355B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 20:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B2F2528FD;
	Mon, 29 Dec 2025 20:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKS8R7U0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMihevzF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F613244675
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 20:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767038975; cv=none; b=DNH5oTRjFZFTAyaMbpbLZ6pF7edeeD7INeAU8OKxy3PS9hYkDyBCnXflIz2U8aiN9LmGiFjrDoFsDA9J6zy3ZdF4+sKMcd1O+MKY9ru2AzQuR1YRDddqQS1Fw3QPIiWWqXa90/XhsAtdSN+9xhpEvEywhgZtbrwVtwGZSfzIlUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767038975; c=relaxed/simple;
	bh=yhRIb5panPmdiq/RTZpc/8+okJ5tM8TCCMxOoRkoV8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z4dwEdGom133NV3jb5crg0776IBIDXGh/CBBgHHwXR5K1pDXL5zp7i0oWs/+AJg/pPacgV4rhQgHYGZjZxWwf2VNZwrF34u5ZLMgwa1yQWsZ+1Es/wQDCNOr7xE5oai1NDGJH0bJ0HelpWbbGcpPXfP/WH5y16m0bPW36N4Lfh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKS8R7U0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMihevzF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTBKI6L3818203
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 20:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9tLp6hB3CCjo6tl7cSfSd8cgyhOHRdEAok0lYgrgqk=; b=WKS8R7U0ELykYWeg
	Rk4296f0hNNWP+N8zzag4y6s1ujDPXjrEDOv0QQV08agymcEPJ5xJqpFvkT4JZyx
	CAS9/LVqE7mLe3aV4ta5mOaaYicWhRjJbb3NeObo2a1/jjv3ObcZN1qsWVD/WV7h
	t9+T+nJhoW6QsfaIXqO2cWeQH/N61XHVGYVNCruZRoNDLh6bjc8HBs6BLW8e5bKH
	MRNEyeRzEocpHfH6jvQkCr1PtaVxspAumvsimH034KNgljQGiq9uwSPKDDEOw6yK
	YunUCiY9gmSnAlA2+zRSaKGARZC1usbGioje+NRHKvrkZu2wj5noFmFgis0G67fF
	GGUMuA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc8ytjm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 20:09:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ede0bd2154so29979501cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767038972; x=1767643772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f9tLp6hB3CCjo6tl7cSfSd8cgyhOHRdEAok0lYgrgqk=;
        b=AMihevzFkJcgv4n56DO5WeewBeWsERB7j25x34Uebq+oJWrcYN94mFusesdXjlW2/p
         hLPlFFOHjAoPc9/yp0egdp30qlGTNVKkOIOFMtqtwP/K/Kpymv/rT3zoRFbRNCHO19a5
         jKjKmRSUdfvL/rriIfuZbeHLfPZnZN0SF4eJKOSkOxZKFSBRuk3Q6+duRUb6/kFjwq1E
         fDO/MH6h3mD2xpHidFMbywxiPrrYxk4i0irhvhvuRqYXrIKY0afXFlH+6TY5uWlB2AXE
         7Y9MK+Q/stQThCIrqxx/+23fjTGpVxwmeZ8Q60FNhCnpXGOYpwBta1oK/0iYDQsl2ppN
         poYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767038972; x=1767643772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9tLp6hB3CCjo6tl7cSfSd8cgyhOHRdEAok0lYgrgqk=;
        b=oM09m0DPSXBRCyZBxrfjCFYC79UBWpmPGYbj5QgAirXzaOF3scL0/7Q3JgE8zYW0+c
         QG3qggIx97+5aqrDyoCzr/UsE1UF+FJU2BLe1QnardAB56Q6g2DnjCb16EWxg5jfzzef
         DjB/bT7yTlGMiHDtplLIzzApVC1axQuZN/s340hRBFtjhvtsQ6wF9C7ezEXpdZSng//d
         He3/g5zVJF0RzfaLpObKar+hjTJqR0/N1A2+KzKItfCfPe1DJDz7YGHJRGTYnMK07ftp
         BuWIGRISV+Zv6GuWIb8ocfmtX/HdBQNPsNV04gQ8RqwA5cIGPXWRQ0ETBWdgVEccUydh
         N1Bw==
X-Forwarded-Encrypted: i=1; AJvYcCU+XBfd7orgxiRacgecMdGDyW883OSgO/HXXRjAxyxCVcJdZllmddG07azgBAIYA3plSbeNUy3GRCYI/iHv@vger.kernel.org
X-Gm-Message-State: AOJu0YxgAdxaEljRD+9NBo+Atp0MZT/UsVV/g0Gb8pD9fFHU4URMMSaL
	Q3i9+YyB+lTRM1UhPd9U8XtogJ6zyEl54s/p/5jZbvp8dWPfy21DR3maLfYy/e+q1JHgNlJWSRu
	GqyzE0ZxxFJ3Zx63e5NxQ1KpAs1+da0TEvgU6sfzmzixKQ7EbEvK8tXQnsS1jF5Ieedf9
X-Gm-Gg: AY/fxX4G6PIfIQkW7+m5wDdCWMxqCS7gtG1Z9t1ikf+4apZevwNwSpuo5ZPe5d2MEa4
	Y4+FpTnHVsDidLj0i9xRw7efbdxSIugM7C0B7lbV3laJdwchDy06wev3KpJLpCfB/e9OdD3snsa
	TwJ33zlunvs1WZ220PFp/rRKNE3A9+7AlxLJCZPfRDoJEcEJEK5zhZkFWzQAAJO5tLcRe87Mne5
	DdhGS5oSs/vA5jQ/Pm4ipV7iqPEzj6GuyXZKmrjtkbBfSNlxUG/JmZSiwLeC22dWixzQCOmuGjf
	PObEGk2eKCKLO6Ef6qJ4gqd7RRh7g8hFI2l7oI/spT1rQslgr6iUWjIkyhd2cwfrAln5Od5Q7Vi
	Ud7Or5AidCmBM9FHwmQsEXuKZRUmdYlyByHYTIzyKx7oAEvkc250v4qEjybLFTnfqww==
X-Received: by 2002:a05:622a:1819:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4f4abdc433cmr358682421cf.8.1767038972469;
        Mon, 29 Dec 2025 12:09:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm0o4PJ1efZdK7cCCaywgTcLp9LChUwOU7faNlTclPAySRBXp99GhA9cWhyaw0KrIm5+FEdA==
X-Received: by 2002:a05:622a:1819:b0:4ee:87e:dedf with SMTP id d75a77b69052e-4f4abdc433cmr358681971cf.8.1767038972051;
        Mon, 29 Dec 2025 12:09:32 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0cb27sm3352659966b.51.2025.12.29.12.09.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 12:09:31 -0800 (PST)
Message-ID: <8a64f70b-8034-45e7-86a3-0015cf357132@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 21:09:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/gpu: Narrow reg and
 reg-names for Adreno 610.0 and alike
To: Krzysztof Kozlowski <krzk@kernel.org>, rob.clark@oss.qualcomm.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
 <CACSVV03H_oii=fuhaeBhUZSJk-2mr08jGqAs30Z_h9tzeDgdtw@mail.gmail.com>
 <2a35d31a-1a3e-4cd4-ac3a-27104ff12801@kernel.org>
 <CACSVV03FfvZVzuKGfaJrsXmE7VVxEF5zN4-R7h1PXA11jOO3gw@mail.gmail.com>
 <8288af85-13da-46e3-8d89-71995fbd17f8@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8288af85-13da-46e3-8d89-71995fbd17f8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE4MyBTYWx0ZWRfXz956OxcE5doE
 Mio086mxdkrTuy1Hq8Csw6d0VPI/4prhWFii3vJTezkeJo/UBRU/5KL3QuemebOWuB6AM2YgbGa
 /DuGkQUVgtJbXkcTukaeTFJ627XsVz3c9Dhvq4fKMmxjxox+gud8W8FWV8CBLGd7jF+PvNYP3fy
 5SbHsBTgvbbnpI4bbhRhzgVwB2Ko8XRc9vNIO2W2WrbueM/yXGsA+bMk38S9plEeH/za47XDVRt
 l8G1MkbUDI9qqckkQb3iwZhJefUajp4py/5MJlWzPMqwN3Mf5Cp55R2wv6oggnDzzkCHZxuWEgU
 W9K7JvJ9XpQ9IO+pDjKR71ZMshqlM4FiQnT+N+5QJHxu+5pCYmwCidWOg2tUAdbZQzc2rIcd/j4
 gurc7X6HbNzkCpgsRtkjeMRr54hKUFgTc4qNOPeR8jQPw3psL1E7uLu9tvTARkuJJb1Bj9fSiHj
 q39sIfAjIqnowoGqQCw==
X-Authority-Analysis: v=2.4 cv=cP7tc1eN c=1 sm=1 tr=0 ts=6952dffd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wQVahuwBDa5KTzDLV_QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: UbdZJjH-HZg7-QEIRJ1_RKbMD3RPlIU8
X-Proofpoint-GUID: UbdZJjH-HZg7-QEIRJ1_RKbMD3RPlIU8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_06,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290183

On 12/29/25 8:23 AM, Krzysztof Kozlowski wrote:
> On 28/12/2025 15:59, Rob Clark wrote:
>> On Sat, Dec 27, 2025 at 11:56 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> On 27/12/2025 23:01, Rob Clark wrote:
>>>> On Sat, Dec 27, 2025 at 3:05 AM Krzysztof Kozlowski
>>>> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>>>>
>>>>> DTS files for qcom,adreno-610.0 and qcom,adreno-07000200 contain only one
>>>>> "reg" entry, not two, and the binding defines the second entry in
>>>>> "reg-names" differently than top-level part, so just simplify it and
>>>>> narrow to only one entry.
>>>>
>>>> I'll defer to Akhil about whether this is actually needed (vs just
>>>> incomplete gpu devcoredump support for certain GPUs).  In general
>>>> cx_dbgc is needed to capture state for gpu devcoredump state
>>>> snapshots, but not directly used in normal operations.  It seems
>>>> similar to the situation with mapping gpucc as part of gmu, ie. not
>>>> something the CPU normally deals with directly, but necessary to
>>>> capture crash state.
>>>
>>> I don't get why binding was added with cx_dbgc, but DTS not. Neither
>>> binding nor DTS depends on actual usage, so I assume someone
>>> intentionally did not want DTS to contain cx_dbgc and binding should
>>> follow. Otherwise we should make the DTS complete and make the binding
>>> strict (leading to warnings if DTS is not updated).
>>
>> I'm not sure about the history.. but I can say that cx_dbgc is only
>> used for gpu state snapshot / devcoredump.  So it would be easy to not
>> notice if it were missing.
>>
>> We have a similar slightly ugly thing where gpucc is included in the
>> gmu map.. only for devcoredump.  Maybe we need a different way to
>> handle these things that are only mapped for state capture?
> 
> No. Either hardware has it or not. If hardware has it, then both DTS and
> binding should have it. If people decided that DTS should not have it
> (for whatever reason), then apparently that's the desired hardware
> description and let's remove it from the binding to match the ABI.

I don't recall why it was never added. It's

<0x0 0x05961000 0x0 0x800>

for both 6115 and 2290 though. I'll send a patch to fix that up.
It seems like (at a glance) that there shouldn't be much of an issue
with the crashdumper, but I'm not super sure either..

Konrad

