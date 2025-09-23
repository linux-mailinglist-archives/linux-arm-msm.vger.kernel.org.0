Return-Path: <linux-arm-msm+bounces-74484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF01B93C47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 03:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 822913A0705
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 01:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82B318A956;
	Tue, 23 Sep 2025 01:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lde4wz/T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5118952F88
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 01:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758589211; cv=none; b=XWBRYcfZmwDx9CtYmOYVUYjqmrzeqQGYJuFfualVp09vMqR0jlLyrUs5L49J3ktQ08230PDnOqX9iiVOLYw6eUFe09wlmt/L0KkNbRyUa7tA0QQjd1FWLlzt+lYf9BBvo4loN+X4K34osUdihFtDP3C3YR9kJcEsGW0QdAQJzps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758589211; c=relaxed/simple;
	bh=dlQdFts8UOM21Z7m6BJhEeiMH5cFC4v6+wXAIsrbMlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlFv4bzsRzA7FcXUvUAnSw7XicwOvZU09tLeZ+VRDJmc6X28DYuTLhJKM5bPTaPpKsnQwpuvDeU9A5itYW/XXVow8lL5oXb29UsoEjZ9i5PdV40Sjyyrn4idS9i5fJC1DxJEc0YsIFan3O7bcB5cCsy9MV6PUMqdXa/AzFbv75c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lde4wz/T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MFfIuf005662
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 01:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XWLc1VvNWjlvWYqGGxKBcg7/p+JOxI4yci5dyPnXzGo=; b=Lde4wz/TlbDmZV/d
	RoQtBSG6l4gjxMIm1vx37YEBU/427uzg/x7fhRLL/SN754dd4f8htIAaWo9oILaz
	UmxWRuJEhTqYSh7OPKE90yVEtwHNGGpY/lXrfpcaMJxBwnh9uhb4o533jeLdV41P
	d82uZrrpCnU0n2U55hH/6tnC+MMcToM+WBbv8a3hoGtKy9oRRNOa2Yx3DFheCQHS
	vfJxozcgNJM7okXNx3cMoXEn4sDHxBoPkzWkUlXbDWzk1en4sqcReln4JH0a7dGt
	l8zI6va5suuJfvrymkyz8mDQurLtM3GVLv3vYMNoM7bVaCXf9A5FH4BX3Co5/qVP
	GbxmMw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98eng5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 01:00:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-272b7bdf41fso26785205ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 18:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758589208; x=1759194008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XWLc1VvNWjlvWYqGGxKBcg7/p+JOxI4yci5dyPnXzGo=;
        b=PaV5f8rk2TrNyXv5XkLWhH68y9KU1zyH+7eL/GX/zxKZ3mePYqcJZBWK7oU91ONWqo
         IcyhmspIiLhDgy8kns8ovdxgIG5WYNCYw32G7KejmNKtwbT8ofJlGYRtH/Dq3F8avJh5
         53UiGNfSxdTll3AwKzpUP1pRBm4XO6DWfdNIlBzCUKSQDjM4McqFuI18MqZmJo2+iHu/
         5v1sOtJE6UCmegFc3DM8uu5U11NHtkaR3n1x3wZIRp4DfWQhdZYXwUs2m5rJlE11S74w
         DPsw5RZ+pF8U9ytG5qgtCqAhKgwPVyioZNgIVrwTDhFE0eAGdJJSipZWyb8F4hhn+C7w
         hyrw==
X-Forwarded-Encrypted: i=1; AJvYcCXcHmRyrzNmUGw6+ZxCoUj/T9J3E+h3GfV5ZcR26RQS6EM9yuwJQJYCmy2+i7B08juJyzON1qko8aNKGlC4@vger.kernel.org
X-Gm-Message-State: AOJu0YwdNCLUKHY4bZtGkIF1xnX3Kuue90eot0oJX/3tYOz6n0SjqD4w
	bJoia/1jVSWTxfLGhGd3IZln934aYJsjrltFnNg2OCFF/IPEVOKk6nnLX6Pc1dIT/rqAKPxqh3/
	VhCLzMx9FC5GH1wZA1HMLMMRBqNyswLv3ODo4ewz9qj7IfFDU22pOnActJygDVhcXGKru
X-Gm-Gg: ASbGnctd1gLXpKUdWRE6fuqAV+qZJ8HOFBU8ToTOy0ZihKG9Lvu9eWrQUyzGNdHRy+h
	a+nXXtfoUYELHIyZGx7Wq+5d4qZpFzp7gSPd7doBcl+x5nKBH0Ji/f9nWOIPLzJAGTJWESZwnE1
	9jzF1hGX0qk1BJustWfFgokflbOKnzEGsSCJk3FtaWK6QECbbN2FOORPv/TpWs/7pisoF8oDcTP
	ZrvpF6Yppj4auaMx8ZLT3wJpHOlTfF4S7PE5yWd00s2XtpW+ZAGykDOnSJP8SucQxWSOVlyhXG6
	ICyEfSV3NH9w0zIkHSrPchjzBjYfZVT4696jVdc7/0jvmKUj0MOLusnBvfGr+rnf1fjJX4a3v7D
	zA4WC6nLoIYNjBnX6Ouys9BzQksFx1CQ=
X-Received: by 2002:a17:902:ebcd:b0:267:b2fc:8a2 with SMTP id d9443c01a7336-27cc28b71e4mr8498395ad.23.1758589207337;
        Mon, 22 Sep 2025 18:00:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1/GZAeFp7rCGex6eqi3pw2AUQEj40WLJVjcaoY5Pse3ZDm9IPKaBVgK/AuqXdN1xlZJyImw==
X-Received: by 2002:a17:902:ebcd:b0:267:b2fc:8a2 with SMTP id d9443c01a7336-27cc28b71e4mr8498055ad.23.1758589206880;
        Mon, 22 Sep 2025 18:00:06 -0700 (PDT)
Received: from [192.168.1.239] (syn-075-080-180-230.res.spectrum.com. [75.80.180.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269803661cesm145268935ad.147.2025.09.22.18.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 18:00:06 -0700 (PDT)
Message-ID: <4116b593-d36d-df10-6101-4e3539b8b812@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 18:00:04 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/9] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI
 PHY compatible
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-3-wesley.cheng@oss.qualcomm.com>
 <7gvp6pshp4eiugk3qodg2ub3azu365loturidbkxqly6nhtgq7@bxnkxeqzarkv>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <7gvp6pshp4eiugk3qodg2ub3azu365loturidbkxqly6nhtgq7@bxnkxeqzarkv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dsicZJWKX7r_26IzvOujoVjpXNy0ad23
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX1a/vUAATAz/B
 Vqy8W+YsOIXnEfzO9fxottXS4vDC6SD+E3MXP6g+gjSoQuw/aHhFhuUJQP/Io7Qgk86jtD+IDEQ
 7KDT8JY/5fS6iasfllnHYn1Pv4ujme0neY2M9cYS5PujRjmZO/On5oyqWdZAzk7UmOoSmuwPODB
 hpT/jhfXMKB2v2o0jJqhTCBna07Hss9K1P5pX7v1a5K2eVMYfzHytinCiV1RuCIqALcun6y/ynf
 P88fU/3X8e5Nf0iI4OLjiWPPDI5JflnuT5CqVc79PYDb8+z4s1AtONaRZDcOOHmQPl2TRpb9MBX
 u7y1Lm94OQ4AtlBmTUa9rOyLUwn+fT4gAMFr+S7EvPFYB8eVPKOQ5/y+7K1yN/BuD5+dltfGFrR
 jIJzwYg5
X-Proofpoint-ORIG-GUID: dsicZJWKX7r_26IzvOujoVjpXNy0ad23
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d1f118 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=agQD+r7xwyS+FYqxhQjztw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=RTc6a8mmi5jc5_0K4gkA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018



On 9/20/2025 8:22 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 08:21:01PM -0700, Wesley Cheng wrote:
>> The Glymur USB subsystem contains a multiport controller, which utilizes
>> two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.
>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> ---
>>   .../bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml       | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> index a1b55168e050..772a727a5462 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> @@ -16,6 +16,7 @@ description:
>>   properties:
>>     compatible:
>>       enum:
>> +      - qcom,glymur-qmp-usb3-uni-phy
>>         - qcom,ipq5424-qmp-usb3-phy
>>         - qcom,ipq6018-qmp-usb3-phy
>>         - qcom,ipq8074-qmp-usb3-phy
>> @@ -62,6 +63,8 @@ properties:
>>   
>>     vdda-pll-supply: true
>>   
>> +  refgen-supply: true
> 
> You've added it, but it's not referenced as required. Why is it so?
> 

Hi Dmitry,

The refgen clock isn't always required on each and every platform unlike 
the .9v and 1.2v rail/supply, which directly power the QMP PHY.  It only 
really depends on how the refclk/CXO network is built for that 
particular chipset.  The refgen ensures that we're properly voting for 
the supply that is powering our CXO buffer.

>> +
>>     "#clock-cells":
>>       const: 0
>>   
>> @@ -139,6 +142,7 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - qcom,glymur-qmp-usb3-uni-phy
>>                 - qcom,sdm845-qmp-usb3-uni-phy
>>       then:
>>         properties:
>> @@ -147,7 +151,7 @@ allOf:
>>           clock-names:
>>             items:
>>               - const: aux
>> -            - const: cfg_ahb
>> +            - enum: [cfg_ahb, clkref]
> 
> Why is it being placed here? Please comment in the commit message.
> 

Main reason if to avoid having to define another IF/THEN block, but I 
can do that as well if using enum here is not preferred.

Thanks
Wesley Cheng

>>               - const: ref
>>               - const: com_aux
>>               - const: pipe
>> @@ -157,6 +161,7 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - qcom,glymur-qmp-usb3-uni-phy
>>                 - qcom,sa8775p-qmp-usb3-uni-phy
>>                 - qcom,sc8180x-qmp-usb3-uni-phy
>>                 - qcom,sc8280xp-qmp-usb3-uni-phy
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy
> 

