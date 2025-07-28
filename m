Return-Path: <linux-arm-msm+bounces-66805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7FAB132C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 03:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1435D188A851
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 01:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359B616A95B;
	Mon, 28 Jul 2025 01:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kyth0jA/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D20C12E1CD
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 01:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753664947; cv=none; b=PVzPvYlobT5e5OzOlu7900pOLiRdgUR4ByE9MV5rFc5R5IqMBhM0AcXGMigirna++WL+jl4F7wED5NaF/p0GJF291PS8emkJbjsu6Oq+SSQ/V/P0X2ESr0j7qM7OpmTAXXOBk/2+MDPDUJ5yazjnOPGGxBoTfcxzZXcd+Tov4HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753664947; c=relaxed/simple;
	bh=FjK326jnHvjwFx808KFt5yd2WXN/sAEkFru3nBqH234=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y5/jWqBDyv3uZ0p0Zjtvg2qxR7zgqMmF4QmXgw9MAUrJ4ZODhx+eEU+LAQZcPExjaZYnu2xTUI3XvnODwEhl7Xj0if8KH/lun/dJg4FceMgkQB4yWEBzvDmQYDdiVU2Ji41o+M+1oT6Uom1OMZ4i3LD9QyZ1TT7qHfo8rb+BHog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kyth0jA/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RNqmk7028376
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 01:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+yvE7Zc9m9grQX8Who+7K4FyDxflGcLsbflzzwtT3k=; b=Kyth0jA/gnFttWj9
	JIXmsod7UCWDn1iTISYqHJTV123OhHBQ+Vs1kzCnSm5R3AU4dlFAes+bGSq61T1d
	GczUKUXSnqEEiKdvA4VDWiaMX9VD6uNBs6n2ikORaimTexAlbPAfBozQ90zcIAJ/
	tTOvyRLzZG9/SYJ8kpUWRNQAOW8uo07OzOPQs86nbjte1tWcknKnn4NcGDDdGo2G
	zZ4Dd5UftMtomtRz7uxcGBPXAqv6C1flc0LVZ3CTBNFnyhCpzWf6RahaF3buThXg
	CC0Ewav4diYz76BmTwr6ALD7b1Qifs7CwgpfuYT/ytFMQx2GRCS2JSbfMr+fWubC
	WIKtSA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcr331q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 01:09:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23fe26e5a33so15086605ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Jul 2025 18:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753664943; x=1754269743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+yvE7Zc9m9grQX8Who+7K4FyDxflGcLsbflzzwtT3k=;
        b=T6LHi57AibFFFlEagw0fHv++/XnF7vlvKQ4KHIftxA7lanHU9y3hXGj45Kzh+cR4Hl
         GjbTi371XU4fITnFkNhjEClUxn4X0MZo8uxBrUnkWDnd/UTJQk2ssm1kxVMeBMOL4vuc
         IcuaKmAGR8+Vgek2NlR1g1TdjnuMJ1LVQ1nde3QMR7+9OCYx5x+GpDElmvQ7xLqNdnZt
         f91GniqRfBjihGbfHZRPaC9vOKjipU2NbhqMK3eNPP7djEEnn4iLL2zX4SU4Hdz5MJUq
         Z9o7cp61isxMuI/Cj32Tsa1UyMOvLX04+xfCGkkG3f45vCP/IdG8IvxfmjQwxPG8wwom
         FPvw==
X-Forwarded-Encrypted: i=1; AJvYcCVjwNcVP2BqdlXHSKaGCZiVba1afPFoFSDUeyv3xRJCsgOG0mUpv88rCVpvlEnIR4mpiCJzm6F5v1zn/1xZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr9pnw9jPPTPZUs7cdZLY5tHERUpoZArLb6NHSIWLCxY4KNvwQ
	/AVTCueDgAE+SoUOSwCfrkocgDj/RlzLQYJHecfbKHAchMUq4U7+jmw2OlLYBnU8VsTXGBmFO9p
	FhdsttV5IGygheVdpzT2+wOFIg3ZF/T8fm6Rr/1FcmuBoJdy0/3UlpWTqtfGLJZrhizj1p6jbEg
	+o
X-Gm-Gg: ASbGncvqSiRkDlFIS0vpAxRb92hQvPH06aGZwhgSqiis7j8cyWeGWRq6zGId++yGHJs
	lK7yNp4UM1v4zdqGAwYsD2WGw3Y1kSPaycnM4pGgL6shog+yOpuwMp/YC3QtzaIaFy3NYkuHL95
	tN37dP+3/TmRQ6pblRQPfRRV7e46wOt7O9D7HOufHMmBSdruxXW1AVjLwns3ads6E5m9qhBSDVy
	CwffwcrmFH+wHTwvH7uS0XZzszxmLMsLWnBCKufHFoHlyTK67aCSVPdw/ke4M7DaRBoOB0iXTsW
	woe5cux4d9geXUNfqlsjfHNpno239mW0IuqOUQXZHQAp4LjJS5wmGW6XPWh5ZN2pcYsK6EkyJdU
	XUsmBnUAlW+ymmhmvSMnhCHA=
X-Received: by 2002:a17:902:e541:b0:23f:8bcc:e4f3 with SMTP id d9443c01a7336-23fb30ab8bbmr165783185ad.32.1753664942907;
        Sun, 27 Jul 2025 18:09:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYCOfj1YqosY7nSWEJrErxiJ8bZl5MREmTEz579acUrZUOuf481S+vvg1qLmm7Mee+b84wXg==
X-Received: by 2002:a17:902:e541:b0:23f:8bcc:e4f3 with SMTP id d9443c01a7336-23fb30ab8bbmr165782755ad.32.1753664942447;
        Sun, 27 Jul 2025 18:09:02 -0700 (PDT)
Received: from [10.133.33.67] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2401e95208bsm12447405ad.112.2025.07.27.18.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jul 2025 18:09:01 -0700 (PDT)
Message-ID: <c6f74d55-6ea8-498f-a05a-000599f93ac6@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 09:08:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
 <c7cca483-f1d3-45b4-abef-ec5019ad57dd@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <c7cca483-f1d3-45b4-abef-ec5019ad57dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDAwNiBTYWx0ZWRfX8xyLodk0bvPw
 9uJQlY8VOxHQj1sbddetfDCd9nyTFylhDOI0A3Yolc1pUkjiRmwgag5rN6v00qC+s3ERDJOqgQz
 kAbh0FwlgRUs4YjT7JlomFXgQSa8S0KEVLMVb0RkEkE1vUE5EOwDNkhU0lG+0HdbpD3gaJE+Lv9
 J4rlNNvZlJCnr4WUa0+AC5apI9L6YR2QMW3Vjp8rnS0R5d1svqYYDWD01okRWWWxpXPEtjf9Xtb
 mmfU9AJUfJ6MvlSIw0ovoaYh1GrZUSotES2/fSXxtolH/npxv1DKCIsJ6muIbSRAuwMrOzO+Q6N
 f8FR5+AfDsIAUDOSt/1S2YEPQa8y/c3/ubIMSIv4gVsBlWpJ1LnnlwxfcyEf/LtmE0C6AdhAit0
 LsSFizgX1mMtK5EwW/rP0Catw8nrgL5O3kXJe3Dsklr1/i7CKeHLUxmortYks2pxJdT7w22l
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=6886cdb0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gW6MYXlkPblPBwbZtHMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: EoHU3T_buu1m5wYCvIa2GCNeDhx8XPfz
X-Proofpoint-ORIG-GUID: EoHU3T_buu1m5wYCvIa2GCNeDhx8XPfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=952 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280006



On 7/15/2025 8:41 AM, Jie Gan wrote:
> 
> 
> On 6/24/2025 5:59 PM, Jie Gan wrote:
>> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in 
>> binding to utilize
>> the compitable of the SA8775p platform becuase the CTCU for QCS8300 
>> shares same
>> configurations as SA8775p platform.
> 
> Gentle ping.

Gentle ping.

Thanks,
Jie

> 
> Hi Suzuki, Mike, James, Rob
> 
> Can you plz help to review the patch from Coresight view?
> 
> Thanks,
> Jie
> 
>>
>> Changes in V2:
>> 1. Add Krzysztof's R-B tag for dt-binding patch.
>> 2. Add Konrad's Acked-by tag for dt patch.
>> 3. Rebased on tag next-20250623.
>> 4. Missed email addresses for coresight's maintainers in V1, loop them.
>> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1- 
>> jie.gan@oss.qualcomm.com/
>>
>> Jie Gan (2):
>>    dt-bindings: arm: add CTCU device for QCS8300
>>    arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
>>
>>   .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
>>   2 files changed, 160 insertions(+), 2 deletions(-)
>>
> 
> 


