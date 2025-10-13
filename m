Return-Path: <linux-arm-msm+bounces-77062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D21F7BD6C59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 01:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ECE93B9E44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 23:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4618296BD4;
	Mon, 13 Oct 2025 23:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPgki7Z5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01300262FF8
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760399204; cv=none; b=embv0E2okuWZK/NX7LFLnPkK6LNx+HHwIT/A8ODidbvki4qK6s5L339yIyoShpsV5S054241EG6HTxK4rnObTcSxp8337zVt2DJC3zjRZJ2eR435edNHS6UOgPYpsqPPF0sz0Xg8cXvcxM1SuD4sHXQnz70TGE9qQKmdziyCLyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760399204; c=relaxed/simple;
	bh=YnzpM7Y3mBbh8bZ2to50Hng5XokBr3pWjqm6tkmbauI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TCYlworDD2r2MyccMHANIoi/5f2s3q66+tFtUSysOg3rmM3t0N2OWiPFUVKrMM6fnCaMiJoam6iOwK9XDqj7tdtXgdBr2OtR59EYPU1W+XfICXI30RPlUl64eo+zyzQyVOMK8HbmFMAX6HYgqT5Vzz3/cEzzbiDBXm9Ztf4z+fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPgki7Z5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDF51016495
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0gy/eN2/a4rW4UleojofitvwB4RNCpSUHYOp2DX/Fow=; b=hPgki7Z50ZRq9hOS
	T0nU3sRtj5IwJhU54lR2Ukes3zX+phYc0nNsOojUpxwBphdIFvIuAKwxB9/u0kSX
	0gHzwEqq4V7MM6Ua+JNVpUWEloc6KdRMv193ISgAbr9iZrwMh44PbTQgR7kZVChC
	oeWhFKwEqx9Xy/E42igqPdtpgM/Xb+ajdnQ4OcReHQIrARHp9HiPnVo3CBX2y1ST
	mWM+Oe2kKEnltiecr8PjuX9Ji+TJUjuAsADqBCN+ctUMsutIMi8h03NMIJXeYYFX
	Hy9xIo9kT0U5cB3wEPUbFYS2tfnTHOnoh6UAkjCkI7LWhE9ZJFL2g0MPvgZUwzqw
	y27OoQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1aaut2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:46:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-277f0ea6ee6so101122075ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 16:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760399200; x=1761004000;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0gy/eN2/a4rW4UleojofitvwB4RNCpSUHYOp2DX/Fow=;
        b=FNYgjDBoaicSQRqZeuFda2/aBgQnY1qVxlNrGYx1Dl519x1eoK0z1xkcjiLv42A5JB
         Yd5JxpxkYE0I7+csCJHsb2IitnFBZvYFizc7CqMbMvZrCANpyuv1WFtCRD2M1YYZ4Ivg
         qXTIZvIqqDgLFQnViT+q+OASSUJvI5sXINXirIpVL6CJWXglHO+mJXJNNpcUcuICAHJa
         Nm51xnYWlx5RTwZlSVOoHMxt54+J3xelUUmj6233yVltLzRFOSQH3xi4hrsOkXnJija7
         2Op7SovL0WKDhmjlcfQAlIeFTVNfRkDKA2TKegW/qOCW/pDuP09DGEmENMvrKB9f61QI
         Cfng==
X-Gm-Message-State: AOJu0YyP77CzKEO6S6pOv78sT4BSLeafwsImMEhgoG4pYNGdWj93Ze8a
	ly1xyInWannykEsTQ62UGpk7EMyfGlDtPrHWzVulSnDP10uq3ae7l9iaS/o4H3St3SO7B9MV9Gq
	hJGQ7iRToXoEVG1Tz+2dgRipaS/U4lA++tjyoM9RieCc0NK0KZdhpqSuuhTA9dOIXkMl0
X-Gm-Gg: ASbGncsltVcbNmsu0qa3AoyBd41Sc1xKCUDZcgcuJenQKW+jAlloXf6JPsEJikAqhO5
	uWBEi2KQxc8X+CYz1HLcHQ8sQG+d7EM/Kkp7lKUU2zPtEOXRsVidf3YMKSpLhKejfu3vyhckPW7
	SVV1aO7CQxIiTGIEDgzXaU+4gD7FNfVICTsaiQZH2BDPfuR9gU5GS94BwbtoUYYU9K+xOGX+LsT
	Qc4uNOqmqqaA2+0PrN7xDZa5Ld/SsSG7D6IC8c31wdXwOU1TU/YkrL4aT0xPE8wW/fJ9CrLBXcT
	56OTtmpHejaRMyE5DmE8nIwuYTOjIEqBpl5yCgO3LV7VzS+0tM587k+tdceChMidX9+29L/SEVP
	rkicpqQ==
X-Received: by 2002:a17:902:da85:b0:26a:f69a:4343 with SMTP id d9443c01a7336-29027216513mr239372555ad.4.1760399200289;
        Mon, 13 Oct 2025 16:46:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnOgt3lwzbUvcJDvzNbU5nzvH3UjGpjKLKhZpUQXp9HGXcUzbD6NyyhTRMy3UAHlSc/tkmkQ==
X-Received: by 2002:a17:902:da85:b0:26a:f69a:4343 with SMTP id d9443c01a7336-29027216513mr239372215ad.4.1760399199808;
        Mon, 13 Oct 2025 16:46:39 -0700 (PDT)
Received: from [10.73.53.19] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29076d7af28sm10202415ad.118.2025.10.13.16.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 16:46:39 -0700 (PDT)
Message-ID: <14bc2a85-0f1d-3834-9b9c-32654348603a@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:46:38 -0700
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
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
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
In-Reply-To: <00408896-2e25-2dd1-6e6e-2195317ee7fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ed8f61 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qShf3X6Dcnx_eSjzdeYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: se0Odz8E4zTNBHL2tyknz2lFh3o62n-L
X-Proofpoint-ORIG-GUID: se0Odz8E4zTNBHL2tyknz2lFh3o62n-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX/+OvszAZwfF3
 ivb2Uh5Vfuv01MnowfBlEIjtgNfe0fxe3HnMrDhGkFnAT7WTj88dapM3+mmoy555w3zXMQZmzgj
 JuN1e1aTBKFSvNh6kpKJEkBEHOlhLfFsEzNLi9YabBtaIBdYbNtPcEZLsJN8V2yDEy2Kv+cZpqE
 fMBD5Qta9SPr0W9sn6Ip84sRZ8dQJWtwzQYlgy+vpzdIq7wksiiEs37QOm/mU6svC5EDwUQ92Q4
 VO+Kxnx6HboRt1dAtuthqirjS0yg47FDxUSVqmH0/ncl2pcP3pS+POJ5mNvD+VUy6K847+A6NXx
 oZC5osADEKjy58+TBbCcmpVf4KGwSIe2RAIacQfSZEXjkuTJRxwFMwZUgXS39DC6J7jn6/yOJNK
 ni1yxTmIX4h3+pQV7gyBQahEGkIOsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035



On 10/13/2025 4:44 PM, Wesley Cheng wrote:
> 
> 
> On 10/10/2025 5:04 PM, Krzysztof Kozlowski wrote:
>> On 07/10/2025 00:19, Wesley Cheng wrote:
>>> The Glymur USB subsystem contains a multiport controller, which utilizes
>>> two QMP UNI PHYs.  Add the proper compatible string for the Glymur 
>>> SoC, and
>>> the required clkref clock name.
>>>
>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>> ---
>>>   .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 35 +++++++++++++++++++
>>>   1 file changed, 35 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>>> index a1b55168e050..b0ce803d2b49 100644
>>> --- 
>>> a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>>> +++ 
>>> b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>>> @@ -16,6 +16,7 @@ description:
>>>   properties:
>>>     compatible:
>>>       enum:
>>> +      - qcom,glymur-qmp-usb3-uni-phy
>>>         - qcom,ipq5424-qmp-usb3-phy
>>>         - qcom,ipq6018-qmp-usb3-phy
>>>         - qcom,ipq8074-qmp-usb3-phy
>>> @@ -62,6 +63,8 @@ properties:
>>>     vdda-pll-supply: true
>>> +  refgen-supply: true
>>> +
>>>     "#clock-cells":
>>>       const: 0
>>> @@ -157,6 +160,25 @@ allOf:
>>>           compatible:
>>>             contains:
>>>               enum:
>>> +              - qcom,glymur-qmp-usb3-uni-phy
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>
>> Missing minItems.
>>
> 
> Hi Krzysztof,
> 
> Won't the minItems be inherited by the base definition?
> 

Ah...are you saying to define minItems to 5 as well, since we need to 
have all 5 clocks handles defined to work?

Thanks
Wesley Cheng

>>> +          maxItems: 5
>>> +        clock-names:
>>> +          items:
>>> +            - const: aux
>>> +            - const: clkref
>>> +            - const: ref
>>
>> What is the difference between these two? Which block INPUTs
>> (important!) they represent?
>>
> 
> clkref is the TCSR reference clock switch, and the ref is the actual CXO 
> handle.
> 
> Thanks
> Wesley Cheng

