Return-Path: <linux-arm-msm+bounces-77848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44439BEC299
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 02:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A2953A62C0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 00:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646BD13D8B1;
	Sat, 18 Oct 2025 00:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MXPI+bT2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7D33770B
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 00:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760746834; cv=none; b=ujKlO0jtvNO28S2UUhVq71uXnBhmYmd7aRCXpzPGdWHpsIcA9ccEQdsxf/iVotdSwQp+xew9n7Y0VN/FbTzE+OgtPOUppcnVlpCsJ2yI5UYMhw/87YbM8BJlMH3ubsWN0AdFv16Tj0fsm5vjQTRSiNt8MFoj+kw9LgBCmvvE27w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760746834; c=relaxed/simple;
	bh=WvLGMq6zaEqJpDFxOd0WICtejDxrRPkTC0W5GIZXWRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YeeVMkbaYhjY+U83x03eeVkaYUiXBy1to9VU27Npb8Fw45LGBRBZJ8qq+uDYNaVE7ZyFOGLmgEn5kPVFIZvVXu/yFj1W5SO2QAJAxfTWOJzL4/I3+Gjbqu3lOh/bdRpTy9wa7bVqGpaJpgvbkyq7wBVvmnu60/y3tM1+65uGFoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXPI+bT2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HJG5jJ004435
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 00:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjsyPZCjZ7kk7o9g7SmG+YtODp+fuqqn2GA/QpUkm0c=; b=MXPI+bT2vhUKjU85
	seAudb4lWbh4zhIYJ4n7mtMLncvAGQy8hEB7AhZh4ouq/KGyZ9aHN1JbfAGLrdVw
	oS7PK7FhCPB0WeiR469ssPCk0xAUOqdNLnLmWBb7CSpTJhDH7fMYcaBtqFHtI1Yo
	sU8wdD9Wr/IY41E3KsiOvIeQr3trmAyhp5EOu7zVQe1SVV46xgHAkTshcpI/K0+M
	YYn0Daz8DLAnXxDpFwt/ayik4CnQ79u9nzUYbaRnK4GZPlQLhuJJAmQoVsBrYe6V
	5NqccF0tXQgtcSlCTiJiVegzQHZoa/hBV3rCdVBj7SZ93XQkVe1zV/EE4LEm3VAr
	teVRDw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5x7tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Oct 2025 00:20:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5516e33800so3411820a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760746830; x=1761351630;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DjsyPZCjZ7kk7o9g7SmG+YtODp+fuqqn2GA/QpUkm0c=;
        b=DnXN8SnArA1N92M8pq4/BlTE8BDdXD3GR1yWZWnw3VGOXO6qoxG3N7+WRgRn6w7Fpy
         u/+0430PvraStHSaG0zVnjG/QAY77odztpYbtWDsDIejPjUYIc07ORRXYO7W8PXD/Xsi
         FXoKf7/m1qDOJexBvUqy8bVyvMTgJKr1lHE8suK8RizQwnMq9rulqnIlA8IpWBNS2q0j
         XgfxSnJsbNP8AS5DAfhiED12PSa+RLnK/rQo4Gn4gsJbgTEk5yVnh0RhLV9v3asn9oPX
         wxY6UsulhJNx/GayvfniYK5VrKdGb3/irwzc+uPp1SaaTlXyjrJFVRU5tAdFmQIVOmzv
         heIg==
X-Gm-Message-State: AOJu0YxbYnZgKWSqftUtZSyVfp6Y9pA3qCUuWKCPm8vLS4et4sojkr9k
	qxoWcSdSKn8+O9Kj+0WAnUoelRMFf1JIjs4dfHKPI4AJXNQSR5RWXbPUo4CFfbmAfPIbxj1pAga
	P+ihHBqeZV1oS728z8BxyoMfxl34g4HfxzU+oaN+zj53Bf7PstfbaXjWM8/ML9EpgDsrqVpYjaQ
	6i
X-Gm-Gg: ASbGncvhGWhYqm5KtrmHAC5nK0kjmKME2RzmkRiW1Ofcat6NCiio4qN5WV5tE/uMYSC
	U10/DqPuJ6sACVXERK9O/xQVBtMVnuHIJNy8icPEgQ/5J7Y8KOheQg34MJIT79aip3hp4JzKoE8
	iD3tQhI23pmu6JiIBO8wYpAGK2xgAStRS6tcUUbjyWZoj0OGCXtTwlHypCBnfuR/hXJKo4nLDhH
	rcDQNIgMgRzpMHOreAOnBFcRQ/NAJLIyA7Id4rn6iVjORal9s/Bhfs8ps0IoCVaPCq26feyjHf5
	aaYnqi2FNsovSa7sS7t/J3u1nGKm6Rnoh9cm8ZXU5k/JQVQtOQJlP5D+9nQnidU+yFGx+H6BQNd
	gbp3QUunCOklCTdruIB2TsAThEJp+GW55fNsP9Pfm
X-Received: by 2002:a17:902:f691:b0:278:bfae:3244 with SMTP id d9443c01a7336-290cba4382amr68118975ad.54.1760746829958;
        Fri, 17 Oct 2025 17:20:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh0Fb6P08hVeeiHZb3EJs27ayrDuP/pdtr+A0nVEst6kPRjwP0b3hwHB5SCbsS0Kix1+iX4w==
X-Received: by 2002:a17:902:f691:b0:278:bfae:3244 with SMTP id d9443c01a7336-290cba4382amr68118775ad.54.1760746829523;
        Fri, 17 Oct 2025 17:20:29 -0700 (PDT)
Received: from [10.73.53.19] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fcbe80sm7840285ad.29.2025.10.17.17.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 17:20:28 -0700 (PDT)
Message-ID: <da34ecf0-c2eb-2afa-bd4d-9dc30fbe5cf5@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 17:20:26 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 02/10] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB
 UNI PHY compatible
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, krzk+dt@kernel.org,
        conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
 <20251006222002.2182777-3-wesley.cheng@oss.qualcomm.com>
 <f5e4ae02-b8fa-4406-b2e0-3602b07b7e23@kernel.org>
 <00408896-2e25-2dd1-6e6e-2195317ee7fb@oss.qualcomm.com>
 <14bc2a85-0f1d-3834-9b9c-32654348603a@oss.qualcomm.com>
 <387c707e-613d-433b-a76d-16ef10dabc59@kernel.org>
 <2a70f878-269c-1b40-2e8c-77b5851de9a1@oss.qualcomm.com>
 <99ab26d3-eb44-401d-8a7c-1d9efd2a1a10@kernel.org>
 <b2b68430-5127-5eca-6bd8-4af31eb9fbed@oss.qualcomm.com>
 <bb299df0-58b9-4a6e-9625-305785d38eb4@kernel.org>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <bb299df0-58b9-4a6e-9625-305785d38eb4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OnqtnwhAIFnjfWgjX8DbID5ZNmCccFPe
X-Proofpoint-ORIG-GUID: OnqtnwhAIFnjfWgjX8DbID5ZNmCccFPe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX6FlPPEjLcNS8
 NcjYov2lduzzymnjqaLGyVHPLpFTIhtXvCb7R8MXzCqBbo2Vi00yEEVP/kcWUuwdr6NhAUPEIsA
 Z8jCihR6V+YOLKNuv0/Gyod1l2GhCzcGV/zLriMud/jtaQA4ohffAqezFqywt88n0iA4NDGQmWw
 0qQ03e5itxwLkxtpOhEPb5Jo3tj7EmrWhQ2+eYY+tkcbbRhvrOyX8CxGuHwBv+S3fZl+xIK8afs
 hK5YS5USz8uR1HfaDWtrHi5sw5AqDQLGsqIkauIOs/4AFq9SNvrIcsJiGt4kCkSPUoYmUK3WC5G
 N5w751zAEebevy8dOIozlvIwyHOJhL5tWnqvQe8hun+/X6XhbNdAqGOELRGzwWLXMktGr6Zlam4
 QfYXku9FY2A/i1cQzl9HE4O3lADYXg==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f2dd4f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JAPtGALJ81qCqeSEnE8A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020



On 10/16/2025 9:41 PM, Krzysztof Kozlowski wrote:
> On 17/10/2025 02:15, Wesley Cheng wrote:
>>>> Technically its all handling the same clock branch (CXO), we have the
>>>> TCSR clkref register that allows us to gate the CXO to the USB PHY, as
>>>
>>>
>>> Ah, exactly. Then clkref is not a clock. You need rather proper clock
>>> hierarchy.
>>>
>>>> CXO is shared across several HW blocks, so it allows us to properly
>>>> powerdown the PHY even though other clients are voting for CXO on.  Then
>>>> we obviously have to remove our vote to the overall CXO, so that it can
>>>> potentially be shutdown.
>>>>
>>>> Maybe we can rename it to "clkref" for the CXO handle and
>>>> "clkref_switch" for the TCSRCC handle?
>>>
>>> Naming is better, but it is still not correct. This is not independent
>>> clock signal. It is the same clock.
>>>
>>
>> Hmmm... I guess that's why I kept the same clkref tag, to denote that
>> its the same clock, but one is a switch/gate for it.  Would you happen
>> to have any suggestions you might have that makes it clearer for
>> everyone to understand?
> To me it looks like:
> 
> |-----|            |-----------|           |------------------|
> |clock|------------|TCSRCC gate|-----------|clkref to this dev|
> |-----|            |-----------|           |------------------|
> 
> So you need proper clock controller for TCSR (TCSR Clock Controller, in
> short TCSRCC, what a surprise!) which will take input, add gate and
> produce clock for this device.
> 
> Nothing non-standard, all Qualcomm SoCs have it, every other platform
> has it in some way.
> 

Hi Krzystof,

Yes, the design is exactly how you outlined it above.  How about clkref 
for the clock and tcsrcc_switch for the clkref switch?  That removes any 
notation that the gate/switch is an actual clock...

Thanks
Wesley Cheng

