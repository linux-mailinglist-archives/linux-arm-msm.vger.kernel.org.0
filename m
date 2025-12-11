Return-Path: <linux-arm-msm+bounces-85037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A46CB59C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 12:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66182300F5B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 11:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF4F307AF8;
	Thu, 11 Dec 2025 11:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OgWC17zU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i/xUcfIf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AA32FFDDD
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 11:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765451546; cv=none; b=Kw8JFF8wnPEfedooRb+naa3Eo6JfnY94TkoJDqsONMqgjRkuEdNko9YoWE9OcBJ1JPx6XMxLZNwBjhAFOq9g0sN/dzsn1YZRBuxIRXRGJ2DCODchR8KlQoSD/9NMQU5RHfvu4SEQutRwaQ7IdLpcHj3jX33niQTcrCUvJ2jLl9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765451546; c=relaxed/simple;
	bh=HBracrVwnOnwLQQbYawCG3E2RV8u96Dy6acjiCKDltc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqmwWLO7lrjg3G89PTfJrSRbwGm0nKkHJdwBbJyWbQp2ClHL3aUUzJHkdvdoaS44Kv5IVttkl+95zTjZ57WmEleY8p6a6sNES7G8e/eFjjxKx8T8Fkjs8+E12OB/Z+5D20DsbwkRdVj/SK9DbAlFQZ5b07xBytEYvz+VxA3lg48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OgWC17zU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i/xUcfIf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBAXoEI932655
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 11:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYDLFP9b/1c4pXko38MT5KA8qHbxB4jvUIX8uXejm2o=; b=OgWC17zU0zH0nnk/
	iMPBcgfPe8ResLdMrtvvpL9X/AXQAajU6FVAq6w9cTPfdBZTx5YyR0WwCnLT8r1s
	yNZboI4kOX/cfdaWttw58fqMZWRB7X9C93qKdb2m5j+rqg28yiBhnbzkHjpCzrZP
	PSr7oXtXeoyk2ujnZ7ThfSTZhoddLYN7hl+QclFCwmpZfvq024JQrXh3LCnsYq8x
	cN45oUEt77TPILQ5D1hdiCmIOLV5fjjtq/E92+lDKCsRcIsr/dpziw4thr83W1RS
	HLN0wsSKpw2PWm0ONqHX7s1zUrr5b6brFfCTcJX8nWcDqgTd7TxY7rzMix01X+K5
	stHTJw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aym581p6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 11:12:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295952a4dd6so17511135ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 03:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765451543; x=1766056343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nYDLFP9b/1c4pXko38MT5KA8qHbxB4jvUIX8uXejm2o=;
        b=i/xUcfIfrmzzIAEI1WKgbtP8+KKvv9P6TyHyaiCgi5+F14h2NcKph50x/Or7x4BRq6
         uTdJeNRTVUzU2ulccGGZJ2jB1+Ta7OWYTOGT14mPl0F/cxvmPWTjGiFI0NhLI3mhGr7s
         1+u6jki0SLwhJoboAdmaNVC4M6GJFqMOMFJPmHF1DVFzAnKziTHHgatrasmRGcfzhixK
         iUEijt9VJ7c6FmU6XUiuPOGYqKl9CS3SeTPrhYLqghaDpTwUh8D0CY7RMUcqNIomY0/T
         y4/oOxgVpq+e3pt2le0EtPSJ5ojm28YpP7eFHgSS2GoovBn7ePRs/opVGtT398AfF8K/
         V/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765451543; x=1766056343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYDLFP9b/1c4pXko38MT5KA8qHbxB4jvUIX8uXejm2o=;
        b=AvgQSPvknb3drzcOkR9vigvwHyH1sp1W+7Zt/SNaIxBIYX/5dLiiRp0+P8qh6UDWqm
         g4eNhZztkqCo6Z0pghGpdY0nETyyHrbE81sbiF8bMT99cVfwlykKpBoIkDwLWuxWNmKo
         j2CfeYCGecfy/Zc5pV1+HR8Mcy3wu3RpfXBlHRl/o2qqldWXKXGfpschLUkykgQmDixp
         94132QqIqIWp6+YtF9YG6KfZ8a/3DdVfkAzT+1ROw2T9oNCUvTM7Z+WI4DGeBKMg5HQi
         WEWRwZS8B3fiGfRhLV5xZgCWwNZj1pk91tcrEhA5bGtc2QYdgQ6EB8gfd4izJ12Oe3Gd
         gIYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEzp7iWmPwvH7w0qdipcBYg/0ycPit1m15H2yTkfgsf+vV97irt9QiYhqB41LImK6RTAkq2qZh3OxrkJ2I@vger.kernel.org
X-Gm-Message-State: AOJu0YwnqUk8Jy7XZe6LTetkXBtfZR1IMMfSxyyjl3IDsce3QRdJH4mC
	LxnVyNnjeTqzCHkcPE18VIYXq3Pjscn6KazF2RCJOvYUqRqTlDT7zlGENOnI2f2mEdxCuPSt1JZ
	O/HQggwBPxvRLZrQzQWA6jIVh7IMHh9ZJNuXbSx2KAR87DkE2PV9XQtE8VYEdQskAdtLO
X-Gm-Gg: AY/fxX6ryQMBF0TDS9DhA7TTCRf7PH59g4fYDe9bl2+UVbomC4D3rRW3R/6vFQNq68/
	FQyPXdUCbtvsbQvAvAHQfbmFU3UR6D6qrrtx5wF5COxNFaqEmf4Cs9HGtwwn4LpoSUmBtfPrutT
	5F3aPuyZGidFHkNG/o8Ej0E5Yb/lHD9Cfvv9aSVjGSNtk90mxnwuFmP+K6km1OzEf10FA1Gru9L
	gJ1eaV8n12lGkcMD/OyiR+614rae7dK6ULXKRMiOPiFxLHDKQQUudRW15s2yLPty13T9+DycLtI
	0oYcoREfDG0p2i5E92qj11jL58AF/ynctqfoe6E/MKrtnQ5s13cbDz/dEyoaXuptAM9YaPUEhAx
	LkvJ/+cnY6volvaYkRkvoHYoFFoKX4eec
X-Received: by 2002:a17:903:228a:b0:290:ad7a:bb50 with SMTP id d9443c01a7336-29eeec1d562mr19896345ad.27.1765451542683;
        Thu, 11 Dec 2025 03:12:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSxcR+t5PTEgJPkTzQ8uhLer5CJXS8Vq8pvl6loFtZkKr35tm0xP60CurwEJc2gIwwdS9J/g==
X-Received: by 2002:a17:903:228a:b0:290:ad7a:bb50 with SMTP id d9443c01a7336-29eeec1d562mr19895715ad.27.1765451541983;
        Thu, 11 Dec 2025 03:12:21 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea03fcd8sm21961715ad.74.2025.12.11.03.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 03:12:21 -0800 (PST)
Message-ID: <57706b2e-becf-47ac-a874-79ce17d12b74@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 16:42:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
 <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
 <9971bd9b-88db-4628-b36b-de50c1619396@oss.qualcomm.com>
 <raj276z7euq7skvhsw7prwzlgsdy6ay7bhm4wgb64mt63q4ot4@eyvhcou7qwgg>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <raj276z7euq7skvhsw7prwzlgsdy6ay7bhm4wgb64mt63q4ot4@eyvhcou7qwgg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SXijyTHxx-p19AouXjQ53Pw4f3pfHBWo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA4NiBTYWx0ZWRfX7PUt5hSk3Fdl
 PSSlMMRhPWYhsGlIfhuN43wTwwWyhaRlaqAh4+l9IxKeoaIDY3DQ20U6b+XY7s24Igaz3qRTbxd
 N4dIDrzgTfYQDBrn8cWO/6YFeed2885pIpB1DokAM5X6TraoVOiATeW61fxiNGQXMn6sKC0UCSI
 h4Nmp8g3wkwtzNqSzS6ZVXt0zcOwpu4yMPM6QlVYI7lNUGrjwmO37BgylT3tTH4hO9VCQqVNy6b
 ZYsfBMI62Bjj/AHpXoncYoFq/RqLWzxOIrji9ylDnOTDK1Rqp61o/2fEP5s7FMWtsPbGcj1POMo
 o4dybDlo8QWQLvMyZUk5chJdlHMuTLNRS3zTYr1g9mqx1z1ptoqC5LLOemC/L5fT08+vqi9ptUk
 P3CsoUfrobtoEGH1Mj40r5Z3BikJjQ==
X-Authority-Analysis: v=2.4 cv=FYU6BZ+6 c=1 sm=1 tr=0 ts=693aa717 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=CcjbiXvC7xLhAd+qVKJczA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=5yBAA5BE7NXvCg71rZ8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SXijyTHxx-p19AouXjQ53Pw4f3pfHBWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110086

On 12/11/2025 6:06 AM, Dmitry Baryshkov wrote:
> On Thu, Dec 11, 2025 at 02:40:52AM +0530, Akhil P Oommen wrote:
>> On 12/6/2025 2:04 AM, Dmitry Baryshkov wrote:
>>> On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
>>>> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
>>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>>
>>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>
>>>>>>>> [...]
>>>>>>>>
>>>>>>>>> +			gpu_opp_table: opp-table {
>>>>>>>>> +				compatible = "operating-points-v2";
>>>>>>>>> +
>>>>>>>>> +				opp-845000000 {
>>>>>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>>>>>> +					opp-peak-kBps = <7050000>;
>>>>>>>>> +				};
>>>>>>>>
>>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>>>>> or mobile parts specifically?
>>>>>>>
>>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>>>>> here.
>>>>>>
>>>>>> The IoT/Auto variants have a different frequency plan compared to the
>>>>>> mobile variant. I reviewed the downstream code and this aligns with that
>>>>>> except the 290Mhz corner. We can remove that one.
>>>>>>
>>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>>>>> speedbins from the mobile variant until that is supported.
>>>>>
>>>>> No, we are describing just Talos, which hopefully covers both mobile and
>>>>> non-mobile platforms.
>>>>
>>>> We cannot assume that.
>>>>
>>>> Even if we assume that there is no variation in silicon, the firmware
>>>> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
>>>> wise to use the configuration that is commercialized, especially when it
>>>> is power related.
>>>
>>> How does it affect the speed bins? I'd really prefer if we:
>>> - describe OPP tables and speed bins here
>>> - remove speed bins cell for the Auto / IoT boards
>>> - make sure that the driver uses the IoT bin if there is no speed bin
>>>   declared in the GPU.
>>>
>>
>> The frequency plan is different between mobile and IoT. Are you
>> proposing to describe a union of OPP table from both mobile and IoT?
> 
> Okay, this prompted me to check the sa6155p.dtsi from msm-4.14... And it
> has speed bins. How comes we don't have bins for the IoT variant?
> 
> Mobile bins: 0, 177, 187, 156, 136, 105, 73
> Auto bins:   0, 177,      156, 136, 105, 73
> 
> Both Mobile and Auto chips used the same NVMEM cell (0x6004, 8 bits
> starting from bit 21).
> 
> Mobile freqs:
> 0:         845M, 745M, 700M,       550M,       435M,       290M
> 177:       845M, 745M, 700M,       550M,       435M,       290M
> 187: 895M, 845M, 745M, 700M,       550M,       435M,       290M
> 156:             745M, 700M,       550M,       435M,       290M
> 136:                         650M, 550M,       435M,       290M
> 105:                                     500M, 435M,       290M
> 73:                                                  350M, 290M
> 
> Auto freqs:
> 0:         845M, 745M, 650M, 500M, 435M
> 177:       845M, 745M, 650M, 500M, 435M
> 156:             745M, 650M, 500M, 435M
> 136:                   650M, 500M, 435M
> 105:                         500M, 435M
> 73:                                      350M
> 
> 290M was a part of the freq table, but later it was removed as "not
> required", so probably it can be brought back, but I'm not sure how to
> handle 650 MHz vs 700 MHz and 500 MHz vs 550 MHz differences.
> 
> I'm a bit persistent here because I really want to avoid the situation
> where we define a bin-less OPP table and later we face binned QCS615
> chips (which is possible since both SM and SA were binned).

Why is that a problem as long as KMD can handle it without breaking
backward compatibility?

> 
> Also I don't see separate QFPROM memory map definitions for Mobile, IoT
> and Auto SKUs. If you have access to the QCS615 hardware, what is the
> value written in that fuse area?
> 
>> Another wrinkle we need to address is that, so far, we have never had a
>> dt binding where opp-supp-hw property exist without the speedbin cells.
>> And that adds a bit of complexity on the driver side because, today, the
>> KMD relies on the presence of speed bin cells to decide whether to
>> select bin via opp_supp_hw API or not. Also, we may have to reserve this
>> combination (opp bins without speedbin cells) to help KMD detect that it
>> should use socinfo APIs instead of speedbin cells on certain chipsets.
If it is a soft fuse, it could fall into an unused region in qfprom. On
other IoT chipsets like Lemans, Product teams preferred a soft fuse
instead of the hard fuse. The downside of the hard fuse that it should
be blown from factory and not flexible to update from software later in
the program.

-Akhil.

> 
> We already have "machine" as another axis in the GPU catalog. I'd
> suggest defining separate speed bins for mobile and auto/IoT in the DT
> (0x1 - 0x20 for mobile, 0x100 - 0x1000 for auto) and then in the driver
> mapping those by the machine compat.
> 


