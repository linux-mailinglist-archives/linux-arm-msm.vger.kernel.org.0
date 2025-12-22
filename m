Return-Path: <linux-arm-msm+bounces-86234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31510CD5F07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 13:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF436301B817
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 12:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7B22765F8;
	Mon, 22 Dec 2025 12:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bu8l7sgq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ObJ6O55C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0124239567
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 12:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766405543; cv=none; b=EnQQUl395UT8h1npUsM5VdCzpjuzpj4FqGxNX9avrM75Mql7LEkjH24ZW9ZGqcLnk92W0K2TdeUh4kFB/jPWyWJ8zF1ynlW9LKcKSR8SwL+afrLJoBmNuaj2EGWhwxzeNq5Id8WKWTW68fcClmxiloNEAYTiKmQSZ4vNJd9M3JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766405543; c=relaxed/simple;
	bh=AA/H1AwMu0/+HGYb42u80iYLOfuHJUzLVpfiRBlUCl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YIWb3Hk1lOARhJlcPZeuovTS/+uOtgDB8st7GLQBS40shBrMuF6TNkffrMpXIKQ9bu8LpouomtJJ5ItApX2944gHmbgItPucqFUIUC2/EznM/E2+fUq3bAQwv9fohn1yyahanKeQAhdC3q7yhQpt6QewcsMC4yQmsC+sZc4aT3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bu8l7sgq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ObJ6O55C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMB5boc1501717
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 12:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9A2rpTt2uE3PjipyspjAkGmTHHrWLfeNYFHtdiCOzY=; b=Bu8l7sgqGSTJp37b
	6auUGnrwa5A71zvgLn9RENLm5UTQKAnt80WFqnU4AZjZvnb4m6rw1vOEl2e24Y2z
	SmNgU6KhbAtwR0p4mr5IWsXzIWOvmQwCK/s/Tjx+DoVEBQqS8WsD6RVi+VyqW84X
	OZvwh+vYMUFOGl8TfnK/e3i8hw+TogjBWt0YdJGluPVfr2UYkmgTRrx1xmnArrCn
	Yiq6GZ1lo+6NPqmCyBOFrV8BegGeiPEJdKoHeLOJEdu9TkuBWEIH0njZki1Pr/Xv
	3VZqXEG9P+6wgMMH1lSVo9rQ+EbsOXNhRp5FkNfihMtgQL2F6pxoAIip7kvYpOO6
	ka9DeQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b74tag54m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 12:12:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed69f9ce96so128192911cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 04:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766405540; x=1767010340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w9A2rpTt2uE3PjipyspjAkGmTHHrWLfeNYFHtdiCOzY=;
        b=ObJ6O55CZ9EwT0BqmmkFgfMO+IM1ECVErvneqx1prSRBOgMPM/XJDoYio0sOII6UD1
         1vppv/Q1Flq2DFhMaZwAgMDQH4ePP+FaOtB9ofluWKudlMO1mwPHFNl3s9+k6+moz0MZ
         LVmWFpJ+wY5Yb+J9RJk1ItRuRtcyzoYu4YJvk0Ha0Npw+rH0TDTFyMZxTJ3cZU1L1BMn
         fGEoRysq1Ndhs7e/XMo55v1LikU87vDGmvSz73zpoZVG4lUbA0JBZLaG8zB2/PqVMVGM
         SVi3Ll9FEzRyohj9kL0jm8jJeF9f9pqNnpYa0FgwwdSHQWcuttNL99Pkq5iLJeiNFKDI
         xL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766405540; x=1767010340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9A2rpTt2uE3PjipyspjAkGmTHHrWLfeNYFHtdiCOzY=;
        b=eL8mwDKQA3+Vpv9y9Z3XX7sTCynza0IPBFkEjB+9AE8ZlN+yM4AhZltF7LMbLeb4dy
         owj+v5g1w7GKNjUKJNDhS2IfFK1dBrjHXTmMlXlTmyM5Y7xKj7/gYfkI7eZYB4SW1Yl3
         xS0doQXtiGXyBEnGKLcyAXMB2gidSQmAxmRIoMhQDWQZ4NE/WuDO4+NBIw/CqKC74S4p
         ahs7zGUp/VNUQt01djZ/vP9gQCoQjxZFGf3i2J8H+9LHlL4Ip3bOM4e7Lg97Say1Fazf
         dpmBKDPx8qEgJixvmOaodbEE7CHquNBmBcLsk3gX1sVnNzdTl4HLinSSYChb+TOYKXzW
         BQNg==
X-Gm-Message-State: AOJu0Yzule8dpHkI8+bSMDlxXPS6tWVn/dKpchwzWlg69tnYaiRTIIq3
	JJRJEZoLIPQi17jOhGNuePAEnOGFZ64z+JhVvIeGZAA/lFYMdK0SBRNnZegvhq7f6iEdDKy1sgo
	aL16QHciozXIY8w6qS+0FjRFzqlZx3lw7G3j0dQJW345XL5p2pDPEujeM5wO/quXApMc1
X-Gm-Gg: AY/fxX6RAkOCmyh1sSJdbqQpmXknDKl/EaekNtDD2h43OKN+BfpiiGv4tUo+FIUAsS6
	N4UWIpS5K30+cJ29wDw6+3wjiyewkjj4pEOcojk73pJr9vEUucIh68X6nKug3kbWypGjCrNNu2V
	2vWCC+CiiTr4iXZxRCjhcrCU+rt2gYNWeg72z2UypsI0Dk9JONrMFbuhXoTVdvrAVxL0WbrQwDg
	WsLx/Hh2BN7b7rxi1XXKL3pXAD9Zlh0n+IBAETJIAXSrXLFPpJDIskeUHfIW2RdDUDhFpvKsV38
	XcUpGVKxuLi0WiW5Yk57ObORt47apSXwUGdyGCXwY+cPEwqlXfUKJHcCEY4OqlSjk1bSVk1jQnX
	cVFggjCZEeEnzSBQKXvCqGyr9pqvI259wOxIFawwf/wbSlOy9iUyTXFbmtfhWgFOlAqWlU5vA
X-Received: by 2002:a05:622a:1c0a:b0:4f0:2378:59a1 with SMTP id d75a77b69052e-4f4abdba1e1mr143600861cf.72.1766405540142;
        Mon, 22 Dec 2025 04:12:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEetvXA37qUNAKlm0YVtJ0qQ13Cm52fDVIhm0qqQAfEAJpzxHGDJOG+J/9gsIp6zMV8sNDsAQ==
X-Received: by 2002:a05:622a:1c0a:b0:4f0:2378:59a1 with SMTP id d75a77b69052e-4f4abdba1e1mr143600481cf.72.1766405539785;
        Mon, 22 Dec 2025 04:12:19 -0800 (PST)
Received: from [10.38.247.176] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aeebesm79120156d6.35.2025.12.22.04.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 04:12:19 -0800 (PST)
Message-ID: <8b265a82-4470-4f13-9959-0dec32cd99c9@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 20:12:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
 <20251222-sm6150_evk-v1-1-4d260a31c00d@oss.qualcomm.com>
 <43efa6fd-53c3-4680-8aca-7b37089ca295@kernel.org>
 <68dffe33-fe4a-4c4b-890e-87e0229d84bf@oss.qualcomm.com>
 <196d6884-4ad2-4b74-8aee-01ba252072c2@kernel.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <196d6884-4ad2-4b74-8aee-01ba252072c2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DPiCIiNb c=1 sm=1 tr=0 ts=694935a4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_QOpqvZ3r_VspIhoNjUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: bLdzPIescNq-FfsyKjY65IiUdpc2MvtC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDExMCBTYWx0ZWRfX6eGCxOlMO2PB
 +BWe+USoI1M8o3VVSxLqBu/wjBr6/99z9B28wR4mdR6Peh/U4mMhNKajrz3AiFpQd9rPFGGrXsX
 tO4ksZi2I4qxkzsjtxLxzTlEaU+4O1LT6wzCnodJh5ssvZbK0lRjdclp/tyvqm5FPfevnOVmV8V
 vDFUVZV7R9xt+6/QuYbu/LWHWFUymjEViVLSd/mZUPTweC0Hig/l7p0GaYDCpYJk/r3j8Y+Io40
 aNN9k/1lA7PBJGoEqjiPeq0PHAguVwEH4KyfADuSmWcAR7Tnv0Y5olRkK9N6ixjfxl2MbogG8iR
 XRh4ya+ASXxXxImHnxKGzIb0s5BpsrZuYHHbgA819u7GShEK0MIeS90aUOMogOxUCczvnYJCghX
 qfpv5DqIIy6jPtpiidseCH0IyO738wEsXU+G4gphBPA1Xh5KkV2JFXoOVLJQAmou9sluLK0Ahyl
 Y5ZzkT15QGz7sXlNPVw==
X-Proofpoint-ORIG-GUID: bLdzPIescNq-FfsyKjY65IiUdpc2MvtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220110



On 12/22/2025 7:58 PM, Krzysztof Kozlowski wrote:
> On 22/12/2025 10:13, Wenmeng Liu wrote:
>>
>>
>> On 12/22/2025 4:58 PM, Krzysztof Kozlowski wrote:
>>> On 22/12/2025 09:44, Wenmeng Liu wrote:
>>>> Add the sm6150 CCI device string compatible.
>>>>
>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>> ---
>>>>    .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..cb5e6fd5b2ad1de79a9b29d54869d093c952d778 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>> @@ -33,6 +33,7 @@ properties:
>>>>                  - qcom,sc8280xp-cci
>>>>                  - qcom,sdm670-cci
>>>>                  - qcom,sdm845-cci
>>>> +              - qcom,sm6150-cci
>>>>                  - qcom,sm6350-cci
>>>>                  - qcom,sm8250-cci
>>>>                  - qcom,sm8450-cci
>>>> @@ -263,6 +264,23 @@ allOf:
>>>>                - const: cpas_ahb
>>>>                - const: cci
>>>>    
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - qcom,sm6150-cci
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 3
>>>> +          maxItems: 3
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: soc_ahb
>>>
>>>
>>> Isn't this just camnoc_axi for this device (pay attention: to this device)?
>>>
>>
>> On this SOC, both soc_ahb and camnoc_axi exist.
> 
> Hm? That's not the question. Pay attention to the part called "pay
> attention". I emphasized it on purpose and you just ignored it.

--- Isn't this just camnoc_axi for this device (pay attention: to this 
device)?

For this, yes, I think so.
Also tested replacing soc_ahb with camnoc_axi for the CCI device, but 
the hardware did not function correctly with that configuration.


Thanks
Wenmeng



