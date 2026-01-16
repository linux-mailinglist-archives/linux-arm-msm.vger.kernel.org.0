Return-Path: <linux-arm-msm+bounces-89380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A14D300AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 12:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03966300CF0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 11:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960BB366540;
	Fri, 16 Jan 2026 11:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBkpSpO2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aVKc5/uf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C33346E7D
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 11:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768561419; cv=none; b=QSxGpOBXmNNPyt7zvHIaSy1TckL5dyfnDyvPl64EMvQn7kwvG/r+xn3TJIvTWAQJPOniKfhh4DZ985gu5IHC9WO4hx0oDXzoJ8IpJ7zHkWCSV2dsU34ijJF5B0aY+vEFyxPOESBqGKbIzsmvsHI7XG3Xy7E0mY8QrMvXt/3R6Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768561419; c=relaxed/simple;
	bh=wkttBCxXM8dTQdQm3j+z6AowSIu29ht81aasYp8uVgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+ZRVLv1cc231zu2xUIFq9QFgLC4dBJneUd8+h4eKZeqpvKumSp8JlYwHnBJYkhCWafiP28sCdmRJmm0bbXigKv+djndMxeTdy70EhqTu6q5wkRiWaimF0GD9oH7QWyq9I6ouT4oG32QC/IqEMbBIGHxyP9RMlS22DfOhPANMNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBkpSpO2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aVKc5/uf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8VE0G1240876
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 11:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wkttBCxXM8dTQdQm3j+z6AowSIu29ht81aasYp8uVgc=; b=TBkpSpO2DkrbGZ14
	K5ts32Hoq95Zc6Uki0n5ai5uo0q9aLC5j4DinRI/mEEs8Ib/hYC49jG4g+fUFjoS
	ySbIwPAGZ5sFYs4JBZW/udn4YZHashOZXRqqyuxFt0aE6RAeZJFCdo9jdiYBHshM
	Qh7RNRKI0t4/kIf3EKVFATRluxuYPqRqekQhN0Cm6xE2r7+sdfBLXrbQ5bxa1pm7
	swRLxffrYl06hK8Bg3llf2WkysWFHLzZBCYLs9BL0RtCFYdjZN98JmoSIQqLxA8W
	NBerynusykHi6M2FAtVmY0liLhm7RLnwZC9ONEr9aL2R2uyYtxKEsDQKnqOiS7Ae
	I+hlhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96ssvkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 11:03:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c53892a195so45048885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 03:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768561412; x=1769166212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkttBCxXM8dTQdQm3j+z6AowSIu29ht81aasYp8uVgc=;
        b=aVKc5/ufec3cM580oYPi3FBpiZFEbLcztiYdUPC6d6+8e2XW7Mh+JZ/xrJYpp100qj
         Pvvd0diwZ/VOh5MUVgyl/544RUxp9iaPoDfNcjSNAfFVPiN9YY6TwAecstiWUk9bKqLj
         BTzoADVYfctB2WTdQymCr1t56DZS/GZAazfIluRM8Ab303bdGxuNNjtPjiJgu9lEKcIG
         Bf5uBgMQwYMFyE/norDYRagJuJJvKw0UBkwec5kVjCDQiy2RSc+Xlh85oJ4zCswIyNrm
         S5D7ztz4oNVqo51mYs+HgdWd1PybwDrXKEcdxr1gQm5ceVUKpPG/h6ED9kByV7Tn9nBY
         yFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768561412; x=1769166212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkttBCxXM8dTQdQm3j+z6AowSIu29ht81aasYp8uVgc=;
        b=PMErs2PTXOpNbsIkAsuX3aeeSD8AiDto0IwfwYgsiq+g7LHtrH/i/1IuIM5Rrj9qST
         yJfsHfTzmuKCKA7FcPOGhi5zOZJ+2zzg/uV3Oha5wXhFgJFbABSVA60JuNddO8lqF0aV
         uhmzDa3li5erGt9NgSHRwxXai8Ju2fK5jO4SnvJyEgdnurI/wjGKLvKW8cCIwsGO6dfl
         RO/oCO8hUq9iRhwpOAUmFEh8hpMto4JQ5IMtJJDdtk6kuZaxi7noLX3+g8PbqftCPcAF
         /P3VeEyRmmW3WgbtOZNe9DV+/AbTTueLDyrA+8dHe36spskKYkTO5AMorx7DkPKetu6v
         bhzw==
X-Forwarded-Encrypted: i=1; AJvYcCUs/ZXILt7OyJjXYvPor8U1ISBNgkqjsibtBFuYVBcUWlA/4YpdEyHCUlkU3cF7uSFg/MdGQ4XzR6s5mRhJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyDSM0h6hQOs98uV++eb0wdiZVjPm/skrSOMM8qs/Yj+XTQ5Rp5
	Ld4JJxgIyNKfyS0W/THEHhoMF1ElASx/s2E12JWqWQe/xm2RBs23fyOJiV60cQziGbSjzDPe7JH
	FTp1U16Upjz1aQ1qBpD1lPk57lMS6d9qkD6cpTs3Nbevw6n/enJOMLIT+4nNOCGtpwvD3
X-Gm-Gg: AY/fxX4NZcEHEjs/BX+Gwrlk2MMUVihg7eFGqtNMsugCTxpA8wzKwZASEOawu+IsphG
	eRDwxHxT82OAp3+CkaJyo6cHayuiloB1CCnRccfkaCNXJ9SJfKTuAn/l9T9c6Bd3oetHbmfpORc
	pFVgsLccbA2hQhVNcV3pXhpDWU0qQEu97tB0z4j3w1CK9uOFAfjQ7UjZzHXW5RrE5lrfNPZBQ1U
	0jj8JhsISgWM4ztep/ZOw3xISHS83z4XTjcQocwsa0efIpqaPp3AAHEeK7RJkKrRC2Yzm5T407s
	n5axsvwwz3frsLC+NIN9HMuJ1CnM5uu+pRoVQsDUgx//jbeo1rdt47TRhP9pg2sE/qXz4tVQGrH
	EB0XStXtyrGhKrdwTQhc2JiTxe0H3kshhEHqjO8bDmAvOJWgf+5RGx8SOGT59IQeS68w=
X-Received: by 2002:a05:620a:448e:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8c6a6787653mr248884685a.7.1768561409840;
        Fri, 16 Jan 2026 03:03:29 -0800 (PST)
X-Received: by 2002:a05:620a:448e:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8c6a6787653mr248879385a.7.1768561409279;
        Fri, 16 Jan 2026 03:03:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a214e8sm204861366b.60.2026.01.16.03.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 03:03:28 -0800 (PST)
Message-ID: <8751c6ff-93db-41cf-919b-8486ed06eb72@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 12:03:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add Redmi Note 8T
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-6-8e4476897638@mainlining.org>
 <ff8fbdb9-dd03-4811-b9cc-4ec0dabf9353@oss.qualcomm.com>
 <4cb609391559a88a4a6f1e2f550f8450@mainlining.org>
 <253d0cbf-f65a-4f60-b874-4191e552c191@oss.qualcomm.com>
 <f2188ad4346e31a679fb6a082c9d32fb@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f2188ad4346e31a679fb6a082c9d32fb@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -hUW5s0QaMWrbnKPbsmLyVv6CGoGYNfT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA4MCBTYWx0ZWRfX5IRo5hNfN0iJ
 wt8nPzxL3bo6FEYKzs7IuwHfli9WtUSjlWw1Hhb2FP4GTERJ0d21uwVvJx9aL4Xz9ok92zw6Fwd
 QRw+dyNC8QgpEflsBW7gbrcj+Pcv9cJfoXx9GS36U7NVzFNxK8Cs1NYtZCrrsq2kXuna23flMxK
 OCEjFsqPQytsLoAVFF9OjLhpVmq+TA4OB9V+NEJAJpONTaIUjm6PaMwz6ijw/f48Vb9388b0KZ5
 YqcRbVYLl8hFZipxPyuI+BI0fOnSYN8Qb8ZOUXIdjr26Z3PhOls1crXM6hRIrhONhij+HKK0D3g
 l+M+vDccUpKxQYE27OWNZC8NynisilCrHcRbkgswSqavoHsxMNRZBK7mB8hBC1vyWnL1q+r2ySk
 knIT7m3bq/mP+6sA4fFU/OJfDg0NJGEWaW5rtsVGDtn5rOsrwHxWFNlhm0BiK6k4o1g69ycXeAj
 7uSDbYuIuioPgTLBtyw==
X-Proofpoint-GUID: -hUW5s0QaMWrbnKPbsmLyVv6CGoGYNfT
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=696a1b04 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=LpNgXrTXAAAA:8
 a=6jRqbQYc-3tA15-qs5wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160080

On 1/16/26 11:51 AM, barnabas.czeman@mainlining.org wrote:
> On 2026-01-16 10:53, Konrad Dybcio wrote:
>> On 1/16/26 7:53 AM, barnabas.czeman@mainlining.org wrote:
>>> On 2026-01-13 10:04, Konrad Dybcio wrote:
>>>> On 1/12/26 9:13 PM, Barnabás Czémán wrote:
>>>>> Redmi Note 8T (willow) is very similar to Redmi Note 8 (ginkgo)
>>>>> the only difference is willow have NFC.
>>>>> Make a common base from ginkgo devicetree for both device.
>>>>>
>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>>>> index 163ecdc7fd6c..70be19357d11 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>>>> @@ -1,304 +1,12 @@
>>>>>  // SPDX-License-Identifier: BSD-3-Clause
>>>>>  /*
>>>>> - * Copyright (c) 2025, Gabriel Gonzales <semfault@disroot.org>
>>>>> + * Copyright (c) 2026, Barnabas Czeman
>>>>
>>>> Is there a reason for you to remove Gabriel's copyright from the 5 LoC
>>>> that remain in this file?
>>> The original file was renamed to sm6125-xiaomi-ginkgo-common.dtsi.
>>> I have not removed it, it is a new file with the old file name but
>>> i can add Gabriel's copyright here also, would that be fine?
>>
>> Well you certainly don't seem to have contributed anything additionally
>> in this specific patch, other than splitting a source file into two
>> source files, so the rule of the land is to generally keep the copyrights
>> as-is
> I have kept the Copyright in the original file. The question is should I add it here also?

This new file that you created is nothing new (i.e. it's still *really* the
original author's work), so I would expect you keep the copyright of the
old file too (as your change isn't copyrightable).

Konrad

