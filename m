Return-Path: <linux-arm-msm+bounces-65068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F436B06491
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 18:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88B0E7B4C9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 16:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8A42459C7;
	Tue, 15 Jul 2025 16:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JK8SFQAN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA211D5CE8
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 16:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752597948; cv=none; b=Z5B2wbiqP3muHi0vN0Jy3xzvYIpnVJ8WQHuMWEEdq6t+mM0J0jlrcT/DWDCmdiHms1jix4N0uMIgGX0GmYvRwc4ph/feqsdJIfvCZWHDNwAjCXfzMyM4MQEtUhcX2C9TeMkvoI6ltHVrNJPXWZXdWrEqGHCPEGJZW2Wduk9RnMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752597948; c=relaxed/simple;
	bh=CAvq3xWwlSRxIqDtyRSbsSlWz69i/WFgheviQn0G56M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=aXpSEycdY/1DvOScyei/Uk2eIdUexr7a+Xjp/B1bNgV103tWfQQAxRc0YLm5V81p8Qbspu3D98j8mi55gsqI/51JaTYD5HyZ/Mjh9hSz6Xy1lfyYQDPgWigd+Wu4mT0MaD0EqeX/ZPWY0W+9ybOwTJbQoHlM6KsboRf9ZjrpZuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JK8SFQAN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDDge007235
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 16:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRW2YfXnz75lh2P5jW3xjEn1uoHSrDyBYTGEbDrJ6Pg=; b=JK8SFQANRA7aUyB3
	55eKIFgTgJNs7dRqFY8giImNIdqwHNWCiuchVxwd+3C67IotTkNXRQ/aZL+z8CvW
	DgUBeQ9pQ+YhLYEJ7pwOEL8z6E7WEzDVARYCenu6Eq2lEpeDcmcOpkQukH9c9jrG
	wu5SfTmZVXw8O3IZphJvGdzvrE6m4+6fhhqT6X+u1OgA+7dKwH1HH2pOcOasPq79
	NtO/5yC4jNQDHIrAdOs60lfVIQiS/F47+Nn22qxo8HRiYnE2w4JERJPM4yOiJf8L
	gaTngiqAju7mp5KOVmXiF5sw3nI8A9M7JcDBLBHHoqVp63h2ddXfnMhf5KBeHoC1
	IQJaBA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5s5ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 16:45:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab716c33cdso8672991cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752597944; x=1753202744;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IRW2YfXnz75lh2P5jW3xjEn1uoHSrDyBYTGEbDrJ6Pg=;
        b=XqUN/1Jrea7kj6B1YZ8C2OVVo93szWl0W97DZqINMjZ9bLPIitMXLFUVs5RtzSrxcH
         x7ewpBOMwBgJLEhFD7mYsDYGun9TO7NCsM4GnJOg+RpfTF/248rU639ytwPXtK20sH15
         aeVRQIKcehlplUSvNKr7oCNecPFRmPeAjpMTJTDyJSOh8ZBJtY/Csict6Jjc6s2Y4S3C
         TwPT1kqatuPLkOkdlAKNKZW821yC50Qudap9zI+BcGY/Ethlb4M6lDAnjnWXw8QSBjCo
         VCLiZ80VoN63AiRkxmMFuGNVBsbbXbdDsMVli3e6fZRm/pi9jDaE/JhEbmSSjX00N/4p
         3BMg==
X-Forwarded-Encrypted: i=1; AJvYcCUup6FJWILjEwRwqVC/5eUWtuZPK81VmgQKYgQLgNBAPK8+mSqVYTLamTsFf1oRgcyoFDOVrpFlLsZVcOtd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5dXWTD8uvEp6z+ZcgfRqjKzCuMGEJyEFDpFGcvee1PZIoMhb0
	YfgPMNmFtcPWffNOgjog3E/6JXavvCXE5UphwzgL7v/PcD/w5zeetqTl4hscWZF+6HH6nQXacC/
	ZYzPVwyIR1c+UDkPCJmyL+OVghXOyF9GNv6g0DyHU0V7cDqNbAYsa5PhVarx0gkRYsv6ubaDBdd
	+J
X-Gm-Gg: ASbGncuUXCshgmSjOCFXodmzN5swAoWEsZ1yfAIG0O0NjS7VPl3jIvJCmm9uhh3Xw6F
	6yoKGazc8+g41legXv9uQCc21W2EO2cJfiwjhWHONWAwhEGgVI62VYSZxTKvGYWvX+QTY8oVJ37
	HyMFk7gKEJvxDE8Hmu/4OQk80Dr/bQSpYo5oQ39jLWXS3jJY1jBVYJAxSy7wq3d17hKhvpps2N0
	5uvBzTjJ3f0jN3HZP0f294KQAYh0B/M+8ZR8a9CYCEHdFZRujjWblE5SacJl6jeer+6817aPBLr
	Vwzbiu8S48hTl5+QIWgxSazGGxP1Tggw0PcSe59jl9aJdYluRpPdAhVBmJ58GAOPtmX5xlqQY2T
	VSf/IXvdFSlG4twiFqu9R
X-Received: by 2002:a05:622a:428c:b0:4ab:72c1:cf31 with SMTP id d75a77b69052e-4ab90c78a06mr692791cf.11.1752597944367;
        Tue, 15 Jul 2025 09:45:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUSbiaD5h7FFwcgr9nByxMFm6MOpok7tf+ZKTIqSFYmdLyYC4qhDAeOW31yQu16CpuN+mf4g==
X-Received: by 2002:a05:622a:428c:b0:4ab:72c1:cf31 with SMTP id d75a77b69052e-4ab90c78a06mr692581cf.11.1752597943667;
        Tue, 15 Jul 2025 09:45:43 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91c81sm1035358266b.37.2025.07.15.09.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 09:45:43 -0700 (PDT)
Message-ID: <3d4a1f7b-dabb-4402-9eac-6f3d93d17ff4@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 18:45:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add bindings for IQ8 EVK
 board
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
 <20250623130420.3981916-2-umang.chheda@oss.qualcomm.com>
 <aFy7wEmP0EzGUHX+@hu-bjorande-lv.qualcomm.com>
 <39d6a38d-6728-4998-aca2-23138677123b@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <39d6a38d-6728-4998-aca2-23138677123b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=687685ba cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=-Hz8NQWEh57Cco_qSV0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: yO1DMscyT0R1muzggByFNu-5zcgU7Ts3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE1NCBTYWx0ZWRfX3ogUgfkgOKcZ
 W9ZHik2ULwqHQjcxrRpMlFW76soTfZsbbhl23o/EgQh+I3Qhw7eXGPWhHW91k0hd6U3g69aWDwV
 d2/DUL4GRGok3fVXfcNGj0oLM/dItzamqr0oxKIxvRmCIoVASGlAbDRvkVTGQn1I3cqbXvMbewO
 P8owLTYABZlXUx/qgNwFoAMXNSBUiOjoDkggG3mSavZgXlkl/rh0EOu17Y5N5nX4CJ4babC9i+h
 Hb5elvPIwymwfbtoFmrYjyxUJQm33CtIZ9syOrKWZZ4qAVX/PnUM1KsJmoqZWh5T8zoHb84eCMH
 pLL99hBwBg9HZSup1ksZ7oPO19TfIHTsrXDOR3g3WkX9zfG1s7OFQIOQOdxrGlNcavddcpI4+AZ
 OqrU8I68VjV4d/AovxIz+Pjb8ggVO+gZB8exAhyagJzRtwZZFOC7hsz/EPjMWNCZEUjY4oZQ
X-Proofpoint-ORIG-GUID: yO1DMscyT0R1muzggByFNu-5zcgU7Ts3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150154

On 6/26/25 10:38 AM, Konrad Dybcio wrote:
> 
> 
> On 6/26/25 5:17 AM, Bjorn Andersson wrote:
>> On Mon, Jun 23, 2025 at 06:34:19PM +0530, Umang Chheda wrote:
>>> QCS8275 is another SoC under IQ8 series of SoCs. Unlike QCS8300
>>> which has safety features, it doesn't have safety monitoring feature
>>> of Safety-Island(SAIL) subsystem, which affects thermal management.
>>>
>>
>> QCS8300 and QCS8275 are both the "Monaco" SoC, with some differences in
>> which nodes are "okay" and "disabled", and as you say here some side
>> effects thereof.
>>
>> Describing these as "Monaco" and "Monaco with Sail" would lend itself
>> for a better structure.
>>
>>> qcs8275-iq-8275-evk board is based on QCS8275 SOC.
>>>
>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>> ---
>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> index b14206d11f8b..19823bc91a3b 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> @@ -54,6 +54,7 @@ description: |
>>>          msm8998
>>>          qcs404
>>>          qcs615
>>> +        qcs8275
>>
>> Please add "monaco" instead.
>>
>>>          qcs8300
>>>          qcs8550
>>>          qcm2290
>>> @@ -935,6 +936,12 @@ properties:
>>>            - const: qcom,qcs404-evb
>>>            - const: qcom,qcs404
>>>  
>>> +      - items:
>>> +          - enum:
>>> +              - qcom,qcs8275-iq-8275-evk
>>
>> Please use the qcom,monaco- prefix. Is qcom,monaco-evk unique enough?
>> We can sync up offline on this.
>>
>>> +          - const: qcom,qcs8275
>>> +          - const: qcom,qcs8300
>>
>> Please replace these two with just qcom,monaco.
> 
> We could in theory keep the SKU id as a penultimate entry in the top
> level compatible, but I'm not sure it makes sense given what we want
> to achieve (just thinking out loud) - exposing soc_id through
> qcom_socinfo & sysfs seems to be enough, and if it's not, we can
> handle the odd cases separately.
> 
> All in all, let's go with Monaco.

We iterated on this internally and the general agreement is to keep
the numerical name for existing platforms (because drivers or anything
else may be matching against it) and introducing a second label for the
same SoC could spark a situation where a driver checks for qcom,monaco
while older DTs lack it.

We'll go codename-only with future SoC submissions.

tldr:
compatible = "vendor,boardname", "qcom,qcs8300".
filename: codename-boardname.dts

Konrad

