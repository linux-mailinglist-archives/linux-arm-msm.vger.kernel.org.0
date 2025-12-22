Return-Path: <linux-arm-msm+bounces-86186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 300C3CD5640
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3159E300CA02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D167923645D;
	Mon, 22 Dec 2025 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dK/f6JAq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aMc9hrWi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D60C1BD9D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766396992; cv=none; b=S5sJ5KPspjRoJa316/qzKqxn6hC4qFMTV2PxtIvtK6jUK6UFdHDLOdyTN1zk/ZPiiHnfj5Thrsfi5JkYa/0Tr9SRNpoE197VmzC3WzekMJSZSc1dXu9gO7q3S4LqxS1HQZzf3jqH7hdZEq6gsXQreVuDWm6qGP6xtvlN7ise8+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766396992; c=relaxed/simple;
	bh=jZ1gy20BI+hPZbCo6LxsQGFErVJ08MmN3NyvoXuIrcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oASeAYsS/cFv1+ZzfshVVJ25SdoCviWMDL/lXfpnuyxew1A6k7jJl4XcXB8udtFjEmShDUVE/oXXtQzMrl/SD6XcBN9pvla5LWYhwKDp2XiYXs0WX7DVoMfB5S6R85Wv8FGi3hygRQ4iTxzecWITWrwq9s3wdy03HZG2eOA2KNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dK/f6JAq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aMc9hrWi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM824WQ3586371
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QikoOVKOAaU3VQD1Nx/2DEE9L5YAA7S9otjAkNFCgvQ=; b=dK/f6JAqxdisNshh
	yZy280dhJZ9LAb0ucnZDp+jiADxDiU1YFslj+Oemdcg6tkOGq1to86vLJ7kQyv5s
	93r/YJjs3crpuusRTlD3RA6U8XQbl8Usk3Z8Bv1gLgK8VcZb/lut7S+sMmC65ufB
	hVn3YMMnK5PrJtmvi+AZ3ORymugMv1UNfegvRy9TXZrjshjl5vO7LPpP2cupc7Ro
	TTDdt2L/+zHuogi5Puuh7V4iav9XW2Z10af5sSpe6o6DI5S9zPh/uMaWqqghjHUx
	lDFqM0gOEEA71wwA8bOBGKAydruPT3UhGc83pTS8kLD845rroCq1sarwsFe2f6US
	HMDXtA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b69ahjubn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:49:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b1be0fdfe1so164408885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 01:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766396988; x=1767001788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QikoOVKOAaU3VQD1Nx/2DEE9L5YAA7S9otjAkNFCgvQ=;
        b=aMc9hrWi+ZH4bWfZkZ0/Wzgsg+noEdGUJ6Iobmxb4KocdmuY0bUPfUHowl+B2xiMri
         P2cISLeY4LtHmVezxLZgkjCWg4uZnQ99594SbFMnyMDk+gD/FLA0ukbw/JDCyObCrdc+
         RIZEVmWvgqfQYfa/xH89BTCZexAig1c31DY5RBBt4Lw0KTC3DwYSCf9hDF3psxgLRP8o
         HlAh++HdFxklxcYy1bkk+FgODPXHxiIPhkWQUCPTj5wkm9vHaby2+fDAwYM17/2eVMlc
         FhSLpriLQE7D7Tfn2mEiWdzbfoC6VHQms2iycuzdSBfeDDTIYFkDNX/NHvEtsl8nZGsz
         S9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766396988; x=1767001788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QikoOVKOAaU3VQD1Nx/2DEE9L5YAA7S9otjAkNFCgvQ=;
        b=j0npXg7qrXoCz6duROPITgBOlvmWFQ/teDcSX39nk+io5w8gwz+PF1iteXEA6e1Xou
         f+Di9PksAMeNyns7laTnQxcWJ0AgZAzUYtVaOacq76RSCDOW4XCBcLNMHtXKIulsZSRe
         0i0AoDF3Sk4xC0/9kDAqNRjtd9FqRcWozNn99cO/v34UeY590/ou13ZatOtCuMhKtmow
         2Iu9V5AL8dxQFvwcD8Qzid8Mnj7uNswm/jMPM+qKffQoY6T/GGIz8GGzQ8YmdPugRRe1
         h/z/dRcmFrh8Wh4uDQLBjzMre9Mk9XtV3QAU2O5HhEbw8kJB37xJUnVdcp31QM9lSY0C
         VMxw==
X-Gm-Message-State: AOJu0Ywvx3TnznFHWqflZAkCCPct6apopzPJTpr2VphXd5oXxVZ8sdMG
	tUfj5v7J+RaNc9lmJYiODkG3Kf09b6IsrsKzBwTPVSI6tZ9bUzsSSw/f0NAIbl7z2JPwvpDtIg7
	ref1THPvU+OllTDxmTRFzy7h8tnBNEL099yZMfnqoQWJ4+TZ4zIVPG6Cp5v5zpplxxRNH
X-Gm-Gg: AY/fxX6cmGblE8yOq7hTcNM3zZGzJ1w+lxuEeYaprzQL5o0G0L1oMq4+E3A+wZFqD+A
	1q4ONNegyaP2/e5WgwtlvbR5G60hV7ZCdVvCLL/55U3EvgU9ejxK+tC/N6aYZwGsWmln/4ZeepI
	gGF2ZHHSxq4X7CQRb7oRzxehpuWF6exz1V0SMkRpQWiI74pJQzcM0QvORqUS9VaqyHyhZBNfG4U
	iwpigNExkqoxoK/bJIGI+3xw3DMgsf3+TOjmA5hskdZ/aAMp77JPYlX7H7YVSLMOu7GEodRdWL0
	CITHjYnmCT/GZ5IozE4npIBOVjyx5v6R+hRen6OBPw9JrlGXLfW2VzbcxDSqutEXazukuhWhDSo
	E4Te9B2gJ7t8QXUAdYSTtdQn1rBStdmL3zOA548Pk0JD8iQ/D50MTTqylzqzF/mpTRg==
X-Received: by 2002:a05:622a:1993:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4f4abcd2349mr117197621cf.2.1766396988313;
        Mon, 22 Dec 2025 01:49:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWSVlfXTRSKe1NNCeLCnGxRG2+Y6FML/3XAhkgPNY70pmRHX8af0w7w0Znk0rJD5e92DcYuA==
X-Received: by 2002:a05:622a:1993:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4f4abcd2349mr117197441cf.2.1766396987919;
        Mon, 22 Dec 2025 01:49:47 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ddffc7sm1040818566b.43.2025.12.22.01.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:49:47 -0800 (PST)
Message-ID: <b96c10a5-942d-446e-b67e-a566a7d09274@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:49:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <68dffe33-fe4a-4c4b-890e-87e0229d84bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JuH8bc4C c=1 sm=1 tr=0 ts=6949143d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KwbCpzI-l7fhGBOHbL8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Ze27n_hLMAcPhLyfl5yLNPgCpSJzIc8I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4OCBTYWx0ZWRfXwaeIPlnhMVoD
 wCYxWWfgkBd4YxLrPunqxMdYlQ1wJ7CQ+KFIhlx1fRhwyckHIgCEqyGBYKSJ2Vg+yrl1F5jhHd5
 oqJCswLnYu5BTVKRh3W9XEWpZ+mbNHZWb8l9ROs0aTyxdOA/IgG5igXabVfINs4XaU9AHplhR06
 8pfcak6QgF+jkRKMQm7p9Nwm3qQEx9GLhswAZhOAmSlXW9Qw9sZkL9HiDeX8aiQL3n724GI+ECV
 Dt5oM0bpKLOTZYVpwidzhsZ6OhaDNCOhRoB20v9dT1pCQ+TVshNK9+B+ErlLG8oIRRKTsigLCGy
 /4p6YHdfDPe2mfKueKQpx6id0FMgFgG3grtJBGu2odIJVTXS2lt8uOKtJrnJhH6tevjy8mgLwi+
 4UyGuNGOwZWM/FbHg76/gPnimj27yfFuLzi3bg1wFfegoyBMtTCq90kRGpE/mpPqkQMzfjiA7AU
 4thl19rXucsq6lRLJnw==
X-Proofpoint-GUID: Ze27n_hLMAcPhLyfl5yLNPgCpSJzIc8I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220088

On 12/22/25 10:13 AM, Wenmeng Liu wrote:
> 
> 
> On 12/22/2025 4:58 PM, Krzysztof Kozlowski wrote:
>> On 22/12/2025 09:44, Wenmeng Liu wrote:
>>> Add the sm6150 CCI device string compatible.
>>>
>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>>>   1 file changed, 18 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..cb5e6fd5b2ad1de79a9b29d54869d093c952d778 100644
>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> @@ -33,6 +33,7 @@ properties:
>>>                 - qcom,sc8280xp-cci
>>>                 - qcom,sdm670-cci
>>>                 - qcom,sdm845-cci
>>> +              - qcom,sm6150-cci
>>>                 - qcom,sm6350-cci
>>>                 - qcom,sm8250-cci
>>>                 - qcom,sm8450-cci
>>> @@ -263,6 +264,23 @@ allOf:
>>>               - const: cpas_ahb
>>>               - const: cci
>>>   +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - qcom,sm6150-cci
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 3
>>> +          maxItems: 3
>>> +        clock-names:
>>> +          items:
>>> +            - const: soc_ahb
>>
>>
>> Isn't this just camnoc_axi for this device (pay attention: to this device)?
>>
> 
> On this SOC, both soc_ahb and camnoc_axi exist.
> Is it suggested that I use the existing ones below?
>  - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - qcom,sdm670-cci
>     then:
>       properties:
>         clocks:
>           minItems: 4
>           maxItems: 4
>         clock-names:
>           items:
>             - const: camnoc_axi
>             - const: soc_ahb
>             - const: cpas_ahb
>             - const: cci

Are both AXI and the two AHB clocks necessary for the CCI to operate?
It wasn't the case on other similarly-aged platforms

Konrad

