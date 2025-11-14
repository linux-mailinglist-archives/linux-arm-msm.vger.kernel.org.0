Return-Path: <linux-arm-msm+bounces-81848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDFAC5CF77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 12:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 27D6035A999
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 11:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BE0315D26;
	Fri, 14 Nov 2025 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQ6QKvYN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YzaIjVdm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0BC22A4D8
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763121510; cv=none; b=ixKKImtM1JGMmi8uWznhBgo5IXpTqG1IE0XUXkK5AbcZaXYHmPcylJABiPyofenhUjIjFXg7FwBbI3mjBsAhkaVO17p4eahBAZWDnvdXoin2c6T3/dzFM+A5LhOQS9quDUFfHg80aU38P5IfeqG1Oa7Cfxw2OxmWNgwjxIOT1sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763121510; c=relaxed/simple;
	bh=Dt3uOy2VtoFbOLkUEu1yu90om6ClwTmbRrXAEUFSbIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uOALrT4h1jxli/lqdyKsSObojCyUJm/q9WbeHSFOEYu0wO1W5OixPtsGjO2U8vxclNFPxIC/vtiibZVGkwA0kQmaepAas3AisqGcSnI8xRq7LtMdcJc6SSaDmbInjMvqMv4fTopVBb2XeVDeIeKaOkG4dyOa4QpxWGJqo2cAeQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQ6QKvYN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YzaIjVdm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8Pa1N1629391
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRBPuTN4gFHBJkftAyq/mOmIDHNhSyqYwsTcoxYmiII=; b=HQ6QKvYNoWqSK2sP
	/PBXAg78g+s2ZxJ/KSthVlkOY17b2ymCBtgWtOyLzXKET01KsSsOV6/uif8Ck4fk
	ZoXvgzi3pTNy1KuftGT+HpP3g7oCZUVrU/Geti8UI6VtCAMAeApGkUDxFGM3aIjy
	+1YUCWLxzH9DwwJpqmMuVlxgxH09jCWk5W4Eyl5KL+98xn4+jRx3g1bT3uTlaT58
	FXbq8ovnJGl+2e71eiLpLKUkxDXgTdQl+dNvYsitVeYlAHZAykEC3t8o7mFk2NPG
	VEy1uMG3ko5pLdZqryc2rCW0U4viKhfPLv4AMedDZx3WN+VW7hduMwp5jvWNKrRg
	rDxqlA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9da2ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 11:58:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340c0604e3dso2475148a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763121508; x=1763726308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GRBPuTN4gFHBJkftAyq/mOmIDHNhSyqYwsTcoxYmiII=;
        b=YzaIjVdmCEp6TuTzeQvXMvWMWJ/yt6+J/pxGEhcXrMIHHYpx2a/UnIWPfyYlOzHU8D
         SEmJ17cKwQi5ST+A8J9MNTq0vtlngTHwTPPBf8/L/b3h8DgFR8Yn2VO8JrSLvpeFLLtk
         +k5MEUfRVE73l/bNGiH+sULGYH6iD4XK//QaKvttILRrCC7FmdS2+5l4vgyP1i527Puo
         YcEl4U8HeMlnpSz44hCeIUYudtd01Usi1KlHEGjUJpzN0o53rBBnmqSPhuaBj2V2SAqE
         MUmydRK+x8UA7FONLmbNzgXKnodP1BBYF9Xa/Z4yv5Sc+b5WQaomwSpn1sb975ukNYy3
         2u9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763121508; x=1763726308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRBPuTN4gFHBJkftAyq/mOmIDHNhSyqYwsTcoxYmiII=;
        b=cDkjFwAX5xidSowfvCoUzv5ZYWD9fbCo/pNOBa4x4OhuB25hOHPl/+qFGZ5dm++cXo
         4o2LUFebKMkrd5mSJ3cfObwNmsE8m6MootfEnGezX7JRavUR23W5+usr+u0/pSAMO7c8
         zPNrR9BYOkuc38EfxdsMM64YOrgHBBZWKO45HFiyXSzT3xPt90AQ9YijvcH3ILMKfqM1
         wQCu6e8FQvxKI8MQBVELv3r+UGI8BWrC9hGOmrONGA/xfItj0ZoUloo8792nK6kk4dmm
         zO5YzLDlQ35+xOePYOYaKahBuM469P7ARqWmeNBW5nKc4SzvS8oeAPq7/bt/BQK/iNJa
         y6tQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7OUD1UINzlQcEz70vwLyiKCbybp/J9DNjG06ebnw5/JtWcXeI4rm3y+kVNIx97yewSsIaDfZ2GcdMwDtR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8GX17C6RI9iIQwLrnvEWCe2MpUU6fCf3IKCNGXCRBId2zSROo
	jK6rjkwQUMJ6sbJKyFKLx4fixKlnECzXKZGT09ulsAAzlSIUA8Q8XlhQ2JEZYacUfHys3Fd+0ee
	XEnqrZ3Mf6EkQs5nFfTvUQ6NYGfwpV5TsIBf1KiAR2sjjkozAfvcTN2a0uS4W6viMRLqz
X-Gm-Gg: ASbGnctzLj4Kz22o1kZJ95sZw/R/Bqro6ltaZJd6m4+9aDduu/d+RHkrYCBHr7E0lt0
	KcxzsQdenFwmcfEYwWnh7P3XWj2BdaBx75X8qXDYS6iI714rEdBOqPWYjzDCclZXpEJPn6IDvDy
	XuwMu82qxDIMOPk599olI2OPCV9j5IhqvdPVyduJjftUuF9dfGZfDuDv9wkMd+qfVDSVDzSfrDO
	ItFCcJhIBv7uFzAvVMyn3Bt1pBxfrRqYCVg+YXQEdYqOM2aMscilsdaO4E78i1XiXg/m9EP15m0
	wpXabOLCelNJeTMPd7JvTHDCskq3wFWFo9dJ9zqtqYX0PeB+URVEV49tSfoKeuSPsfJDOYZIbKn
	AQ8UL2S55rjZSeZrrWTTZ8u0=
X-Received: by 2002:a17:90b:5803:b0:343:653d:31c with SMTP id 98e67ed59e1d1-343f9d901bemr2963735a91.5.1763121507776;
        Fri, 14 Nov 2025 03:58:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFHpQSCtLNHukFVLbxrD8xU34y4COtLfmBvJC0TqavNqnfl88QPHSsjjzeWJeLQ2nAehx0+Q==
X-Received: by 2002:a17:90b:5803:b0:343:653d:31c with SMTP id 98e67ed59e1d1-343f9d901bemr2963689a91.5.1763121507270;
        Fri, 14 Nov 2025 03:58:27 -0800 (PST)
Received: from [192.168.1.8] ([106.222.229.203])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343eac93449sm2826717a91.3.2025.11.14.03.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 03:58:26 -0800 (PST)
Message-ID: <6ebe07ad-cbfe-47e2-99ee-06ad7670e699@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 17:28:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
        devicetree@vger.kernel.org
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-2-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251110-wise-lurking-roadrunner-f0cec3@kuoka>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251110-wise-lurking-roadrunner-f0cec3@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DSOjwBZqRX4N6BhVW4POlJdr2XyoOnQ2
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=69171964 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=UUXEStRZTiKyGgBwSCQbmw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PLUc99ambSscJNFV4OcA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: DSOjwBZqRX4N6BhVW4POlJdr2XyoOnQ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5NSBTYWx0ZWRfX+vzl8qI1djrk
 g/9cJVn+Vh0xRZj/A+RG2FU0B1BQEIhGwZFNnQX01uVjLCgddAQIQ6xD3pszhu/Te6Haa/ORpm5
 gsldZVvwivmL/DJncIdNYAgqxStpz2ED4cqThA55N9TvVUCf8d9enocsHrPQBYBr/hvXSl89POq
 E0DcGmKMF4mxXekDzHqVpujJqMOnITdAUhYcABsZ+BHFsGBY2DiEa/hao3HXegzkARSUiptCmm3
 1O5MV2fi8Zb1l6DdvYQpsTZU93/7vudI7qNPmEWUkQAhCY36DFFm2BUL8b+DDD+HKAYyjStnVDO
 J3O49T4MgqWFQEAxv6vdOydnWkyOMJvNR18Z3L/P4j0ekIKNDC0a00pXFplIF8P2WwSHUs1j/3/
 15clQ4LJcyTtGafRFGNEK4Re7sei0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140095

On 11/10/2025 1:18 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 07, 2025 at 02:20:07AM +0530, Akhil P Oommen wrote:
>> A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
>> which replaces GMU. But it doesn't do clock or voltage scaling. So we
>> need the gpu core clock in the GPU node along with the power domain to
>> do clock and voltage scaling from the kernel. Update the bindings to
>> describe this GPU.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/display/msm/gpu.yaml       | 32 ++++++++++++++++++++--
>>  1 file changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> index 826aafdcc20b..a6bbc88e6a24 100644
>> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
>> @@ -45,11 +45,11 @@ properties:
>>            - const: amd,imageon
>>  
>>    clocks:
>> -    minItems: 2
>> +    minItems: 1
>>      maxItems: 7
>>  
>>    clock-names:
>> -    minItems: 2
>> +    minItems: 1
>>      maxItems: 7
>>  
>>    reg:
>> @@ -387,6 +387,34 @@ allOf:
>>        required:
>>          - clocks
>>          - clock-names
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,adreno-612.0
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: GPU Core clock
>> +
>> +        clock-names:
>> +          items:
>> +            - const: core
>> +
>> +        reg:
>> +          items:
>> +            - description: GPU Reg memory
>> +
>> +        reg-names:
>> +          items:
>> +            - const: kgsl_3d0_reg_memory
> 
> What happened with the second entry? Please describe the hardware
> COMPLETELY (see writing bindings doc).

We can describe cx_mem and cx_dbgc too here. Then it matches the common
schema described at the top of this file. In that case, do we need to
re-describe it here or we can just remove both reg and reg-names
properties here?

-Akhil.

> 
> Best regards,
> Krzysztof
> 



