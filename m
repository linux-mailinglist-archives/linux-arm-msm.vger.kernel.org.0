Return-Path: <linux-arm-msm+bounces-88023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62768D03ED8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 74F5830EA017
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C19434AB1C;
	Thu,  8 Jan 2026 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/Bb5zSa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mrjhl7Ez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F075349AEE
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 08:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862485; cv=none; b=Lv0krVDsZUY0GskZgw+9uUfOJqbLg6oH+QM/+HdQNmJLiqSdjDwLTGHzhutv8qsQ4TD9nYcp1Vjy+Oj7qaJrFWnqeaLF2oRZFiVyZL4fEJh3ReYukY0LWPA/nM4+ZbbEJacjm7U8cZ95+e1o2L3nqniuYPsVy6gR9EyeuAg8Qik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862485; c=relaxed/simple;
	bh=mVSMXFK7v+Ah1A7LBJUtANrEGYnXVMe+OP0c2TZf/J0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kT/Z7Ij7akP75ekB98S4kXdxlgZq0iq7lpe18DKINk6RW6WQzRghb9bAErIOJd6AEf3WuZCF2X1SuOms8vswJ4CvMAp1DENalmJMx6cwQYm0htqXyYGFbF2K80Ijv1oFOkemuStn26ksczoKcY6jRRQPulkFBvmJXC/Wv1iayBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/Bb5zSa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mrjhl7Ez; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6081DvQ5877533
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 08:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yoe34/R7xZJT8mu6kS6uEUp3vVo/O98wM0lwlPWZ0Hw=; b=Y/Bb5zSaYvFdWnf9
	awnXNWIyId5BHWwCbCccY6ArNvfk2q1nmPmyJx+RNUQGOEQeXZavfE+cWYce/IC9
	omeP7S6yRGQ1dMdbZaMuq8vRsdWQZ8ZJIFXQxaJ47wdOwBWe72+/C0yZKN3ji/ch
	t14YsuAz3ofZ4U7u0kA4lrAUR/inDAV5xxx6A8HMtE2EcAXcgXA+tJ5eEfOM0dAs
	/bnveI08c+Uf1hHIHozvyzhjSNxXwwrHgK0BWe4wXFHc3J2vxhzaK1crRB5eWEo3
	aKmJJKmtKcXoFCvuMGgzBze6OXT48ibkQ5e1IcERJXEcj+lP9riFt7D0/8ukMNIi
	IUNmzA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2r3184s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 08:54:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f357ab5757so9801011cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 00:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767862477; x=1768467277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoe34/R7xZJT8mu6kS6uEUp3vVo/O98wM0lwlPWZ0Hw=;
        b=Mrjhl7EzbXy3I2SqTBflfUT0ptztZTZwu91OLxSv4JFJVVdTsVIQ9CAGAwYHcUvCRy
         phPrnXNdq2QkeM7+e2vZcxeV9jWizyh/+ziQc//MZ7PElu17u0XrszgRTRYOviPzqHHR
         7N5tjbtdQzmsw+luUhku49wsDmBMYMuBb4JhtkM1fImf02qwEca0GK/rQE1gC1NVeEiB
         t7PPvAParvTFF8SSBwIevxIgsDC3hhlxscwZa9j8uD0Q6sOs1VK4v3a8agLohIdjHqi4
         GicoIwJtUMsLBQ7ST4eM80zGP6s8V8i2PFa5gqOUz10HS3fIy8UU+ykZTsPYqo1/LGal
         BfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862477; x=1768467277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoe34/R7xZJT8mu6kS6uEUp3vVo/O98wM0lwlPWZ0Hw=;
        b=nPUrO+sUR9XZJ1sv/Xm+BQDxVaSXHXTAM1iU791Aid22IPNv31z4FoyDNqDoSkFG3b
         OZ+PjcXa+/Oq3SBe8Od6kQY3Aaxfylg9LJSbszXSQ8/ZNVMyc0STHLUvkKk0d+DPvs4R
         HO3SrqW8tVsowXGyz4fPesjzwzX8tbVAY1adGnf2v+0y6XEWUKCSVFIOpBt5oKv1mlCC
         hUrzbvFhwyFf/TiaTRtPt/vGYEEds3lED/uvquO+dovbLUk1dA7XycFq8HJ3Bvl0vRt8
         5qwpJTMYP6X2f3rhq1pqo/yAB5fwyIwzgbF8AyElY7+PFObdQNsf4ZFKYOPKQ+7hlp5R
         w2gw==
X-Forwarded-Encrypted: i=1; AJvYcCUrLb+W0ltBpLqqGozMdqaAF6AApY1k4fVTRjn/f6G92OBwSWbLqeifZfFmr0iMHG5SQ7Lv0YbUfN5b3pez@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqs0pEu1ZL5Lcs/Lo8fGie3JY67BJrI+MVZtVo+rNrIFhsp3OH
	Ep23uSH25McEd+Bs8L3u9acXTIXprKHx85NBRjW1nP4Vc6EN+H6dJtaD2h3vKC6PQkwTr2Ek+Ny
	bYBAQOrt9v2GidJ1mwWdsQJz4ZjZvVqNAmHxBZbAhrrEOdyPFcILENvCrMl9OGS0XHaU9
X-Gm-Gg: AY/fxX48/4DZPwGxjR/ztSiyuumhpwyJ32XPUBpovKcbT6CBmlZ/JwASTIhttP8bIAV
	PxUQ+jBygVTk0E1YD5pQ78nsul9EWMjL/yNr9r96UXGhinul7DtKmKBOv3AWMoUtjjCxhSecXVc
	ugbr5p2p6/FPSo4TuQCfxWzSm+IcH/Kh8aG7C+xVFoJ8oC0U3la23DGUZwB/g0c7HbTDrktVY60
	9CEiff4Jba2ZbtJ1aWGu82WHI3V33fC76CiVZqCEFHJ77VDEBdqTxWqNp9HWrhYdG34bR/TInzt
	f/Mj3uVpZlnQ3gzE8fr9TlIldzS8jBsxScuPKTeOoczzAUBED2q6TMxdaAqZUf44YhzKz6M6W28
	6WtKMkcxBXtXdOhL9xWq1HF2AveknD/ShRuCMHXNHl/GG4rEtDtDQtNpAr6PXK9z4gc4=
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ffb487595amr54667851cf.4.1767862477050;
        Thu, 08 Jan 2026 00:54:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9Zu4B4c1u8CU9ENDyOwL5KHQpxYNvhOydpv0jjl8YDszapOdfdCaPnmBYxJ0lXpbM7zjfFQ==
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ffb487595amr54667601cf.4.1767862476596;
        Thu, 08 Jan 2026 00:54:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5absm6893952a12.33.2026.01.08.00.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 00:54:36 -0800 (PST)
Message-ID: <45a2b510-c825-4191-975a-1389f4f18903@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 09:54:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8994
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
        Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Gianluca Boiano <morf3089@gmail.com>,
        Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX11w/emCWRnd+
 bQb7nT39FFVQm59ONgrb+gvzG3qQyfH/mCGdY1MBL/AU8mKG9ESQ0jeUiw7+jAi3XFrf0YAecvU
 WwG1id0FxWgvqToIFwetPKYbBSJi7F88KJsnn/YuFZCITrPWqJJw4m2GDcZbTyUEdTII2eXEopI
 Vb3zRojphpJSprptxaGXZvjkOfAf9+w6skb+aWucI161eMvyecYzzIy3t/fzs4Airai13WlnrZ4
 uzq/Sip8pGEPuXocfTKKgql3RuIqngWNf2zX1a5hFVWRt5ZISNOmlhVhQv1RfLLjirQkaaQbJFu
 d9WGiTu6H96T5XVQwxp1g49OZHGyYlFhaTz2rfGNeFXqtYamVE/MuHrFbSXdZT6XkuvrlnvT4IQ
 o60u5VW1Vzf9XnI33ofJ3z5R9uvWFB/SDikzOPFz4yPMoiiP+Tkdt5f7F2OZe/exPq0Kf3LQgO+
 QOzJIOrmZMtdxHw9LvA==
X-Proofpoint-ORIG-GUID: xYgonA5OxSyl6qGApt9YigR4NS2BmGYU
X-Proofpoint-GUID: xYgonA5OxSyl6qGApt9YigR4NS2BmGYU
X-Authority-Analysis: v=2.4 cv=S4nUAYsP c=1 sm=1 tr=0 ts=695f70ce cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=RLX663m6bzWGV7rLlMIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080059

On 1/8/26 4:43 AM, Barnabás Czémán wrote:
> Document ovp values supported by wled found in PMI8994.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I reviewed a version of this that said PMI8950, which is very much
not the same..

Let me try and get some more docs to confirm or deny what you're
saying..

Konrad

> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.yaml         | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> index a8490781011d..19166186a1ff 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> @@ -98,8 +98,8 @@ properties:
>      description: |
>        Over-voltage protection limit. This property is for WLED4 only.
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [ 18100, 19600, 29600, 31100 ]
> -    default: 29600
> +    minimum: 17800
> +    maximum: 31100
>  
>    qcom,num-strings:
>      description: |
> @@ -239,6 +239,24 @@ allOf:
>            minimum: 0
>            maximum: 4095
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,pmi8994-wled
> +
> +    then:
> +      properties:
> +        qcom,ovp-millivolt:
> +          enum: [ 17800, 19400, 29500, 31000 ]
> +          default: 29500
> +
> +    else:
> +      properties:
> +        qcom,ovp-millivolt:
> +          enum: [ 18100, 19600, 29600, 31100 ]
> +          default: 29600
> +
>  required:
>    - compatible
>    - reg
> 

