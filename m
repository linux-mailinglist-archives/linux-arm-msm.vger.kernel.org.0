Return-Path: <linux-arm-msm+bounces-59538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD509AC4DB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C27617E957
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 11:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64ECC26C3A9;
	Tue, 27 May 2025 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozuEJlbG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D122026983B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345818; cv=none; b=Bgq/8UKVAbDBNWcMnKIhI1S52DdHVVl7lafpkroMU4OTdpNeKJN/ei8+EupDBB15c1rYcmXZl6BQbuM484lE0AQZFCupbHJ0Qrjkslf7R4A9LDsMtBEZFJvR6yOKzfDVYZTHDpf5dFeEPJRhb+SFJh2GWbeHouor6uo0X/SUW+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345818; c=relaxed/simple;
	bh=fvEjZ/8XvmiIw/x1T49zRGL66s1CZIgvsgbv4p02D5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krfO9LOsZkPFCKhPku+GQforxFH2dX7eIuMjgq9CqekOz6LgqJnDUc73M3g+JwxLEzxmdu4lhtblEu24ueo2KS4Wf1+zFV0mkUlQB7nyWKrBpPv5Gx6oKsWlSRVA/0YIdW+PocY+8DfCkIyWTb6E3UfZ7gs39zwutzghLjGS40U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozuEJlbG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R3YFCN024736
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLM+GWekrBtrawNMm2D4lJztX2o4sPffJMDli9j9kAM=; b=ozuEJlbG24ADssOl
	uWUZZ/KEib2FdpiwXYbHvI6ct2aj2WaVAfNQNrrcuB4F9JvzMbVuRCS+t7fCFJh2
	GZulqrY4WSSBlAnTpGT6aR2vBKuYcv2nR7StyUg7JZYfp3BFeLqzYo4MOECFuI2h
	LY9qEEm233lZYigL3v466Q+XhrM1eFCisGhBH+EjyGYduzBONiQj4BrxIIcMb6AI
	V5VNtQ5ra7K5bxylbN+xoORE/n6sm5VzCWl6NMXIL4wcP7RmBXzqfBJWp4Lbr96v
	PnjqiCQT0wdVod1YvDyjx+T4W9ErvpprGnAHV7rLi5qdQrFPuegfxgKfF3dFbr0U
	gvhgcw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjppc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 11:36:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fab2c3c664so787206d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 04:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345814; x=1748950614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLM+GWekrBtrawNMm2D4lJztX2o4sPffJMDli9j9kAM=;
        b=Wp9uGJc3Az3f/hIt1AAHOoOQ3omAgHQaXGEAciLhw0JUFbIH1x+2d50VjsLALr2Zh5
         R9nxIQ85I16al72R4n1O3VN2R78bCeHA3fIsgQMRH27qyR1nNPttRxpqxOIHluPdUaZH
         PeQ71rJLkXhecsvgfibdYLnh+DjSGnEMdgPK87vqI1MLLrZR3gu3swyt0yiF3eqghmuH
         cfoglEMnzXdfuy5Ct1a/DyGEP/cYJhIbpbwRPLfoCUL5lB8kndRi2cYf6ECPmeWge6S7
         hxzY+mbkUbYR4mToMwV3znLhW63n+pUqVRH1k/D0bNTZ3MEGT073OsEeHTGAMxTdgikg
         fLGg==
X-Forwarded-Encrypted: i=1; AJvYcCV9TGVdND1DVcSLgAUNZsPmQc63LAZio/ns42wEgjw10Z84WNUshbhoR88ZjSCntBfhziUD9To2LNhijVgE@vger.kernel.org
X-Gm-Message-State: AOJu0YyA0X4v3FYEGj2XU99OlTnCp423RQLYfOBAz7kiU50oiCLq9IUG
	qewKvcXs8yvBqvDCfdES/5ZzgoxsRh6+DOaeAPAN7jAy9LYe2vQOGyDP8AEvJMlviM1dt6KEwe4
	PGsqVDC4cT7ZSMQU0K9sfsI7gVVbGb12ZCNN8tJKgjGRvBCQJm/GQvI1m0giEiOfleOYd
X-Gm-Gg: ASbGncvibflHu3rFNTnriLJwRgZRhTpSb8B+krZBrjmhhhx4zzu9FraFguFBwKUSsGN
	6A+hmebtSST2L3aNBHBMDgIdicpWng2N0st8nu22fWVtxiAedZVOMnG6uLh0WVO0W0891N/z9FH
	h6BCTGqED4Q/jkqN6nPm+roluz0fivgz95KM81CTj/RggO/h2iTFF7cU1UlOvvFIg82de/2xhUk
	J4vq3O49zc697aktsdpJbqc/cNdBHxBvrUBJs8rQRE4sOGiIvvW9xarxhLQIEIc1c+aA/Grwxzl
	zaomI+LCTYiQBlFHvysQxpeDRCKVFEMHEYGmqHCmSvtWF7V63H3Hj9ZLEBcCHko29w==
X-Received: by 2002:a05:6214:2586:b0:6f7:d0b9:793b with SMTP id 6a1803df08f44-6fa9d34ba15mr66049866d6.8.1748345813615;
        Tue, 27 May 2025 04:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwP18XRKy8jlsk+tWNpk1oV00GPmvN6UNYhfqRCLVDbAvK7pSH3h1WanmxrHiy5RUbYnfabQ==
X-Received: by 2002:a05:6214:2586:b0:6f7:d0b9:793b with SMTP id 6a1803df08f44-6fa9d34ba15mr66049676d6.8.1748345813242;
        Tue, 27 May 2025 04:36:53 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d439655sm1854813666b.92.2025.05.27.04.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:36:52 -0700 (PDT)
Message-ID: <e7ee4653-194c-417a-9eda-2666e9f5244d@oss.qualcomm.com>
Date: Tue, 27 May 2025 13:36:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/3] dt-bindings: sram: qcom,imem: Allow
 modem-tables
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Alex Elder <elder@riscstar.com>
References: <20250527-topic-ipa_imem-v2-0-6d1aad91b841@oss.qualcomm.com>
 <20250527-topic-ipa_imem-v2-1-6d1aad91b841@oss.qualcomm.com>
 <97724a4d-fad5-4e98-b415-985e5f19f911@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <97724a4d-fad5-4e98-b415-985e5f19f911@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6835a3d7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8
 a=zoJKnCTf_W_lU4eZxPEA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: p9595nJbuvx5fOJZp7m6CgfRDSL3gjlc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5NCBTYWx0ZWRfXywLcRDHQf2xe
 yCqLuCh1OK1xRfGdhkYHG72yxjzdJwuKLrlZLz5ttx67ltNrnn+QyHohG4ccxiW5Ui40p1hQ8+v
 NB9LBtPHidKBaExeLvE9PkPWGGbgFIOhDe8K4KRQEkZ3RAtSeGs7IXNsr1bTtTzqiPLSWwHWprN
 c8g5i9QdhZLCOVbaCRRoBe4xXtha9GSulig7QQYHmOGoeXBULddM0lpiWJldqWwmIO72prOfL9i
 9rSVW8PBKXExSLQn8mFaAqyKbrxChZomg6YvSJco46yFQXKyp1JhzdRWZ0Zh6wFmYmfYtBHdYRI
 Ix3x192dJraP3Qkj+XSElkZ9ISd+q0cY5binlf0td+kJqGyPS5R7Mw0VLp2S5H7Ebz2tALSMMoA
 x82WLjDK9aOfZYA3PBALu9bBoc2tDVXJRxguKdidF/YyvP/AgSE95N77aIraXVsm1033N6WP
X-Proofpoint-GUID: p9595nJbuvx5fOJZp7m6CgfRDSL3gjlc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270094

On 5/27/25 1:35 PM, Krzysztof Kozlowski wrote:
> On 27/05/2025 13:26, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The IP Accelerator hardware/firmware owns a sizeable region within the
>> IMEM, ominously named 'modem-tables', presumably having to do with some
>> internal IPA-modem specifics.
>>
>> It's not actually accessed by the OS, although we have to IOMMU-map it
>> with the IPA device, so that presumably the firmware can act upon it.
>>
>> Allow it as a subnode of IMEM.
>>
>> Reviewed-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> index 2711f90d9664b70fcd1e2f7e2dfd3386ed5c1952..7c882819222dc04190db357ac6f9a3a35137cc9e 100644
>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> @@ -51,6 +51,9 @@ properties:
>>      $ref: /schemas/power/reset/syscon-reboot-mode.yaml#
>>  
>>  patternProperties:
>> +  "^modem-tables@[0-9a-f]+$":
>> +    description: Region reserved for the IP Accelerator
> 
> Missing additionalProperties: false, which would point you that this is
> incomplete (or useless because empty).

How do I describe a 'stupid' node that is just a reg?

Konrad

