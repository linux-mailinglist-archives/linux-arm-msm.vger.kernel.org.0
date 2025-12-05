Return-Path: <linux-arm-msm+bounces-84444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B80F1CA72F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 11:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B76930168C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 10:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871A12FF649;
	Fri,  5 Dec 2025 10:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHVXjdxt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c5t6SJOX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AE72F60A5
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 10:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764930927; cv=none; b=DBwRmQlMinmcf8qVNvz6FjA7Q8WoVJn5jIm2vIAEuo9X3fyvloMJE5TncAt2wYnlwvxYIeUr/Ww6GvZR/tmtsxzCOo5/ulEXQJFwKNkV0o6/7Pjwd5121x1bLyZTaBvzgLEtyjKO3GVjBUEAAN9130kmkv2FfFGpPA9TOW3L7dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764930927; c=relaxed/simple;
	bh=iEjCX0WHvNRwQiv5u6ptP9GiNTVvzPOsit4qqiCgU8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YjzerjElAilDX46MxMQZEHCFNVvWMEhQuKEiPlHRaC3VyBUkfrPDW0IEzEJc6HagjC+UOK1An/0EiyINVsEIIIYycmqF4OZcEG8V04JI3Vz1ryGa6Q/7R50Ws3OD65uwbMvKBGrQykpc2i4lFcFGZycKJqIxi6qdHfHyySQNF5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHVXjdxt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c5t6SJOX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B55cQc91916045
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 10:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ulmvaoJGk+Z3nIb1FPpkW4+qcx3Dy89ZRzvOxAdw7PU=; b=MHVXjdxtVtqHeWZB
	M0LIYgr9eiImIt1YUJCONbcdm9JL4ICOA2dFVocx0rYqBHVU32EkBpD1gqypWKYd
	OX2M+Qe/uYKaXkbYhuyWhI6ZgYVvHoRYu3xVZN+A+fpEXWfePGBer7ilhoN5rn+q
	MUNVlqxW1SLhAVOlpfR/2zGPlS7VTWdjZjrvlw+hH/3Bl9DLeJNuhR6IKL1eXtED
	KhXA6YyWWNHxkRN9soCOxW/0y7jr5wh1zgngtGg1U+SDJiTnS7CD4RAlzUCPSv0h
	ws590kjHozYRWmVcA247bES685gb5TPTEAimnFs/hw2JENuuh+3Fia77M/IymqN1
	qt2l/g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auec1tjcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 10:35:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f030d18ed6so2085391cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 02:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764930914; x=1765535714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ulmvaoJGk+Z3nIb1FPpkW4+qcx3Dy89ZRzvOxAdw7PU=;
        b=c5t6SJOXdM9DOek073FbFG8nqN8O/E+KXMcC68exp3W6dXP97cptruOABhPQLJh2Ea
         0qBIj+xqz8b9Ky3SwWbBFBQzjM8sm+aLWXc9fQPIsRuOlxvwnTLcYm/dgmUEz3/lVpFd
         EBORYdE/bNxVi8GjbSzVgOeTSxYtc0FGPQPZhL/ycZWpfb77em5xskgJDxEFmuyvppXM
         2mGGr/8KXP7glKQ517jfqcoPjOjS+zw1mQzIyCTIDQ1TdrOgHii8tz/QQDJJSvC5Ysn0
         m7OrGFE7E5Di3uNfYZY4iNKnzTdAJdm61s7rztYI9dmSE3cuu8IsyUTx+Qh1J/fLyI3/
         QJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764930914; x=1765535714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulmvaoJGk+Z3nIb1FPpkW4+qcx3Dy89ZRzvOxAdw7PU=;
        b=eubLy235aiyxf2LYRgmyHXR+5QNhazfrEOxIxtLM/jxcSIU/RRPaBCK4X4PCAG0XfY
         uA+UImv5f4PrCIScihjPnScNDZp0xYj0R5NNu5aAzmHW5VA6Yx5r4AE1Zcz1NQTEiQn5
         YqT2EQT7Wm5IxVCIgMPy7rFfIN/XZAqWx82J8SKKHPDv0khgcByPTOLv1fspXAdRwURR
         MfZDPlwQDD+2PTlUWGKcRtilUtusCe1DJnnWhVYv9epPT6fPQhQpNlh8Y2cloy/BkldL
         XCt0Ulq8iy9yPdUiKE5njxYFuB1CaWXl0o9VDsHlx97D0rQO/fUd6tBzmb7ShNzCuS3K
         XhYw==
X-Gm-Message-State: AOJu0Yzg2oNMCpbsBjgQf+YPAbkJRP0ljZYfL1qo8ZdbAVH7nCD6BC1S
	hRtbm8+YQ8n9b4+zpfY5ZQZnXz8HK5F2LuLA+2bNPV1PSaw6Gc5z5Z2N2xfQSa710IMEKzAo0Tb
	hKSAn434MP503X4Ri6h5UfGbrVhQyD4oHXP6V0YRVFqYTnNGcdIxWQCrRhrLgREZnpJua
X-Gm-Gg: ASbGncvdsa+jekXkA1UDqzBg5WSwilt0MpkIwE0qjcoZuLRtmsb7YpDJw6CmlakdR6z
	ITDFe1wjAaUBVw2uKlfRBhkMsNyD3f95s5RBd+r1Vfwp7UPdOuMMMj8Yn3hPyXWpUrrY0qB1JKo
	5k7EMmyLlxA2wCvHuhz7aLRWSponoJb3xT1G3x0kmFaP7QvqCW/dREqyEBPqw+321nT0t4gwiGz
	SOFyyYPzivvjm+/siUSoN3Bxz1icorcvDzyX7ovfx70I68Fqw2a5jRBfDCfycN5TXATNnZYAxri
	AtU8zMwPeXhRINmcBRFPosGkuoIDTvGTVLwS8TybQOO7K6Sz4PPNAu7wkbtTVOT4r9UoItLCHzc
	AHYI3VxIXVe+TbkBPX6L/O5ok7Uld1OwZjvdTM3ap8dIMf8sPNSI+YJD5GQr+BuXNkw==
X-Received: by 2002:a05:622a:1aaa:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f0174e90a6mr98778731cf.1.1764930914428;
        Fri, 05 Dec 2025 02:35:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfGsjnWMKGmrhFyJ1oVsKt96PNqbVZSMd9kS+e52FE/3ti3b5lmWx+ywE9mcyx5XE1O1F2+g==
X-Received: by 2002:a05:622a:1aaa:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f0174e90a6mr98778511cf.1.1764930913923;
        Fri, 05 Dec 2025 02:35:13 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4975dcesm332867266b.34.2025.12.05.02.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:35:13 -0800 (PST)
Message-ID: <9b3f2adc-bd64-4f6f-8a40-9e2884e46782@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 11:35:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
 <20251203-judyln-dts-v5-10-80c1ffca8487@postmarketos.org>
 <84a17875-0542-47cf-ac4b-5af7bbdc5edf@oss.qualcomm.com>
 <7909626f3116fcb9feb25b77820a98da56e1283a@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7909626f3116fcb9feb25b77820a98da56e1283a@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HeAZjyE8 c=1 sm=1 tr=0 ts=6932b563 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Gbw9aFdXAAAA:8
 a=T4PGsqDLbnwIIwvigI4A:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3NyBTYWx0ZWRfX/AB/bBdVK26B
 xQUQdmB/nyst7uvVRDKF3CFsjgFmpI/QIxkPKDjQZAAvFy/MZ/v2ovhVyuZWCc89PKOmgaNSLtF
 yqc2qauu51Dtj+vJ6hi9xhtUQQSaUMM0w7NealfHuXmdxaSsXDZOgkxK/5VDXHvXs5GXTwzM73w
 Qq1VkrOSSRMA53i6uMFgaxVMa5LFZYjQji6e7tNy938EUae9Q0MhBLf7aVtc2iv29B2zd5xmn7I
 NhHwybDgoRFUnnr/OFDEYlhbwtHXQ7Vbcaa4Qq1kmN/lsexrnJRKjksDqI4y1QnKBNlkVpn7BIs
 WICwisJJwt0+QUMG+v4BSmrnw966SQnQfFz6LqvhhhyvLe+tX3AYzZZ8wEcWkG/aHaq+nDXYgXb
 Pbdng5W2A675FGvT7t/n0C2QAIvHoA==
X-Proofpoint-ORIG-GUID: cZ634oR1udxzeEvDfpBUoIg9yA3TFcl1
X-Proofpoint-GUID: cZ634oR1udxzeEvDfpBUoIg9yA3TFcl1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050077

On 12/4/25 7:47 PM, Paul Sajna wrote:
> December 4, 2025 at 12:50 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> 
> 
>>
>> On 12/3/25 10:40 AM, Paul Sajna wrote:
>>
>>>
>>> These regulators are required for the LCD
>>>  
>>>  Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>>>  ---
>>>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 17 +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>  
>>>  diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>>>  index 8b88f75b36af..cdaf84de5e6c 100644
>>>  --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>>>  +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>>>  @@ -56,10 +56,27 @@ zap-shader {
>>>  };
>>>  };
>>>  
>>>  +&ibb {
>>>  + regulator-min-microvolt = <5500000>;
>>>  + regulator-max-microvolt = <5700000>;
>>>
>> These ranges seem much more reasonable, although I would still
>> expect there's a single operational voltage - unless the panel driver
>> is supposed to call regulator_set_voltage() in some different power
>> modes?
>>
>> Konrad
>>
> 
> So min/max both 55? Or is there another property I should use?
> I wasn't sure if that would be physically hard for the regulator to maintain such precision, so I cross-referenced some other DTs in the qcom folder and found this 200mv allowance in one of the sony devices.

These regulators are very accurate - set it to 5.5

Konrad

