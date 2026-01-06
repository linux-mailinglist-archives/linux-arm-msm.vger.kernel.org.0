Return-Path: <linux-arm-msm+bounces-87710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C48BCF8E19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 15:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCA763032116
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 14:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7743D32D0CF;
	Tue,  6 Jan 2026 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bAr0MDmy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d6dLLUxk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22FE32D0E1
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710841; cv=none; b=fda4dSDh8GsREssDCJ7PfZja5JvmEZ1CmGQiUfYPsByLEoHhU4HV2LuI9UuZyV7bITEbvipOQ24TTrhRd7qf613YUZaPJszjVjKW4CPbe0nyWMFVYOAOkZvtgd2k785EyhB7q0Qe5EdHY1tj3YosvuTwy3B76d8OgUM3vNnhI4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710841; c=relaxed/simple;
	bh=1BLBAQMk8pTE3hF64+V13g2KSdCDa8b+lx+TiAfkmfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qmn9B+fRBkzY1gbGlvT7ym9n7RsHglj7T3gBhCvko6RW7xv3o6nwcdDpUp5HGsO1y7O0Q6G+c08uJ+x5vuO0kxGJkVKBbuub0pFoM6RiQEPa8TH2UMWCNo2eklQjp7gY7MfjP9AgBMNR2hO2S6LCkASZsRvQdUZVgmojkDIFKa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bAr0MDmy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d6dLLUxk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606CAFUh4048690
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 14:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zcfsFS04VN0Soi3THqaIkbsPmr9ODp+iS17uQAxtAY8=; b=bAr0MDmyIkL6yg9w
	SUhQGeEyloBC+6OLCP+Q9x2cmKDih9Qt2O+RNLsXi+P/5JNviDJTAJAmyG+UW7XS
	8Yc9YKoxhy4wpIJ5o0PBYb+uOceiEHUa/iLd1hDEn0c6mNCIaDsRp0XX0BTVd0h7
	bJ5XZVpd8fyWllMfnz82uX03oAnq5b4xGClzIF52jRziejYayiPJX/yrdy5nY3j7
	7YAnA53HsbgyrLtRNLH+60i6G8UNG4ra7KGvPOw1SJdMS4Xqf7j56B6L3mManify
	wn7cZTudXPInisJ96H0WIkOlaMzv059RiOyYygntr9ulFgv5habNGxs522wp3IMj
	UkSAyg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh25rre0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 14:47:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34cc8bf226cso2667013a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 06:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767710838; x=1768315638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zcfsFS04VN0Soi3THqaIkbsPmr9ODp+iS17uQAxtAY8=;
        b=d6dLLUxkXJ6kY0M/MCiQIRn2/WaW/HxBjUiRqQJp4DHicbr99w5Z4g1wyzHXBWRtWX
         t6i499brNVyFS9gW8fE3tAJ2LGCbyzWDY2fNJR4yybu6hWEPK6MbngY0bV2RCc+NQMit
         LCn0p1gP3X8TwRlFHWrfUEw1qQxPOQdjJzXAOvKyPCGnow8EJTSlwqNwO3x6euH8dyyn
         C89xS64P51kTFG0IYLTBOeR6ajn4L6eZiATW/YFGXXWHMo0iky9qVwet1r1ZYZNdxswA
         HJKRcnDMGdxMlIFqiKYK2ByLMcacmgEXolFb3J9pwprEC5xPaXme/vRiXm3x0Y6Ih/Eu
         WTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710838; x=1768315638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcfsFS04VN0Soi3THqaIkbsPmr9ODp+iS17uQAxtAY8=;
        b=s4rin1nUsymxW87O7E8yFZ92/X/phGVlVFdXUeHYteHglhbZwHDV/myK+SzbTKlIfZ
         s5dM9jnvsl2C9zQk+R9S97N5Op6S0nZv2VVejR80IG/Sz6hgadmz20eedXoBO4nYb7ku
         1I1jKOgZzQJN2wPVf5CkfojJHLClTeu1H6wCFr42Ow084GwXCEP+rFjSDyT4kZG6Tc4z
         7UCHPExIaGM/65h8NV6O0RT+H6Upx1rcXSzLpYWkWdXf3zBoYq4QXO2/Zf8cR+rNnV6P
         jedg5ORWeRXVZPguS34bCLspO7Rwns35WsvMho1ZOO6pEN+86dzCkbrijo+tTPHCQkqS
         Zx1g==
X-Forwarded-Encrypted: i=1; AJvYcCWRxcCLBDYHaU1oQtN2WRwF505AyyDBCawY7y2cvAuNTCJbz0z3JlzCpdYqwS9JkMF07pAiQnNL43amUyWL@vger.kernel.org
X-Gm-Message-State: AOJu0YyF7jLBJEuWfThIWND0SkKe90RiZDbGPp2iMw1pIRhpplf46cad
	FAWiRs3w8zoweSqKrWBiSP45oCUzIYGnsVbl3bHo2LCAc8tK8vK6a6fYivxJLb3zXSHAJqfxFm4
	F8Eoavwu0bhq0FCrdjy6e67J1baaDbHlFANapPX8GYKwMZhhLDPeGgKpCZ4JTMEhsGRCA
X-Gm-Gg: AY/fxX5QC4KTBWd3hM3x9v8yZNN9pVLH8LgRYexro2Yf4xxc9AwS0Y7zU55onROo2Fz
	BtEMZxnmCEUSBFgNUp1eVKNGXClVP9Znsli9sv+cmDETmzkgwpaGBavtEEJIl+3xJOt9CLt+6RV
	LCjxzjJlyPWoTHpH6dOv+qA5lL3xZl+TaNdvy7gc+8Gvf+l8PcKDfMza9NmI9aag+QV7wB4CMa2
	JLvl6YpsARz0zcPy2EzhUgLDuq9CQSf9en/AD5zumiBmaJ0JiH9iTXrsHc+ol1bydC3+KmX6rSJ
	PXMO9MQl7lTjUIyJrr0A0BY5E6wtKh+4IUP1fy3hZscCIvN+/z9Q8BndayVntNWYl38FQ2Yxybo
	r8rsNVlKioRadpcDF9UsYBM4Q9KGQ79A8A8IztDmaARM=
X-Received: by 2002:a17:90b:4f88:b0:32e:5646:d448 with SMTP id 98e67ed59e1d1-34f5f30038bmr2743074a91.21.1767710838408;
        Tue, 06 Jan 2026 06:47:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNSDUxkQhO/yV3l5ELdMmGOkQbRz1mErp+pZNgrdUbiWyRnlViktR5bVwFxL5b/wwflX2M1A==
X-Received: by 2002:a17:90b:4f88:b0:32e:5646:d448 with SMTP id 98e67ed59e1d1-34f5f30038bmr2743028a91.21.1767710837911;
        Tue, 06 Jan 2026 06:47:17 -0800 (PST)
Received: from [10.216.40.68] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29521sm2634999a12.23.2026.01.06.06.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:47:17 -0800 (PST)
Message-ID: <107b43ab-85fe-8b09-a622-854f9672f45f@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 20:17:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v19 01/10] power: reset: reboot-mode: Remove devres based
 allocations
Content-Language: en-US
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-1-ebb956053098@oss.qualcomm.com>
 <CAMRc=McEB+yVYxropzsqLExZCU5Pd_iy_=5N3pTxu28-ZX=7_w@mail.gmail.com>
 <acbb37a1-3189-4d4e-5c05-55b13cd40a7f@oss.qualcomm.com>
 <cvmtn335gwnl6rvmlm4vgyablsj735rknga4ffv53gpk4k7d6g@tt7ebuyusocu>
 <e4b01dc7-02dc-060e-d1a6-abd2c801a78a@oss.qualcomm.com>
 <CAMRc=MfaCKe2-Eca6fZ00NQkdLqJV-NH0XAsTKHkU3N7P7pnEA@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MfaCKe2-Eca6fZ00NQkdLqJV-NH0XAsTKHkU3N7P7pnEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: i2xHTuqCC-K1blHgoss1kQeAmLSdY5UU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEyOCBTYWx0ZWRfX0MVlK+rs9DWb
 RGXMnNbXIjrvH1YJx9SBgTFOHGkoYcgOgzZ19FXQribmre2/7PoNNkXFRAW+8LkkmiH1/7ZM+lx
 retf/FS4CJ0fOZgGaU24mKuroS+vXxDtFCN3BR4Lz57g1QiBawQXKyFrTzf/tje78htNyMkoumU
 rnLpW0W+5kKHIQzSdviqkuXqyvYYebL8ieNJvy+vtAVLdG6ecBe9w3/urU6lcdbD7pHaKv9YbaQ
 t4cIV3JYd16fR/RBFxoQlIp21lZLiofLMIF+NzDZc0F8kb0zczhNjGtH+ON16pX9+8cwXP6LBmI
 fa3zLCPOl3KZ8pMFdnKATewQOLHOJZ3MINOTt3xzEU/dHduKcvrHdf5Dq5wO4Z9keCklWd9/eQD
 Vql1CSLxdtbkwwbSTpPxW6IovQmVCgh1PyRnxrTlINDCSYr7AcuhBeQ2OMg2l+Gu58fhCIk1MTZ
 bH8UXNJuBLigcFr7QJQ==
X-Proofpoint-ORIG-GUID: i2xHTuqCC-K1blHgoss1kQeAmLSdY5UU
X-Authority-Analysis: v=2.4 cv=G48R0tk5 c=1 sm=1 tr=0 ts=695d2077 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uBB1BXs7VCbqA7mTJTUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060128



On 1/6/2026 6:00 PM, Bartosz Golaszewski wrote:
> On Tue, Jan 6, 2026 at 7:31 AM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 1/6/2026 3:01 AM, Dmitry Baryshkov wrote:
>>> On Mon, Jan 05, 2026 at 11:46:40PM +0530, Shivendra Pratap wrote:
>>>>
>>>>
>>>> On 1/2/2026 3:35 PM, Bartosz Golaszewski wrote:
>>>>> On Sun, Dec 28, 2025 at 6:20 PM Shivendra Pratap
>>>>> <shivendra.pratap@oss.qualcomm.com> wrote:
>>>>
>>>> [snip]
>>>>
>>>>>
>>>>>> +                       pr_err("reboot mode %s without magic number\n", prop->name);
>>>>>
>>>>> If this is an error, shouldn't we bail out?
>>>>>
>>>>>> +                       continue;
>>>>
>>>> This is not an error as per original design of reboot-mode framework.
>>>> The code as of now says, if the reboot-mode node has an entry without
>>>> proper magic value, ignore it, and, process the next.
>>>
>>> Then why are you using error level for the message printout?
>>
>> I have changed from dev_err to pr_err. Can make it pr_info. Will
>> that change need a mention in commit text?
>>
> 
> If we can ignore something safely, then I'd just use pr_debug().

Ack.

thanks,
Shivendra

