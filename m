Return-Path: <linux-arm-msm+bounces-78445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 320DDBFF2B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 06:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1811A4F2FAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461D8248F51;
	Thu, 23 Oct 2025 04:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIcSRWEF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B01D254864
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761195018; cv=none; b=YD/pzs2vaUM1f0CVjyGBMQcE1MwUwuxgC4WSspUzEFVhrWlQUECUOEpTcLUEkQ5iX6xLcXDbMQ6wv3QLqctGFjaOUY5QbpIUadVnoPm+cp+iOfA1tsK6yjhe6HkKLEt2B1N5Pga8tI7vHJ4XpTHRyOtRuARBJwfsOHws+nEjwoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761195018; c=relaxed/simple;
	bh=pUxLY0dYOpUEVJeLtaYHGI3zA5xCDpr07EK9bK62Xg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EmVC2uwyevdZ2HbqZXcLIseu2NFvreEh3XepbM+xAeXpOA1tij/+dM4M2aPHN8FaqGV5cnSzXLnXEDG183wSgx+GipnIq4KhuAQjUKyd8lRrkogPSlUHIIlzhyNOQ8QZixpDt9PVYH0yZjb+Z1uBpTvLKDfTiq3ZzcRKZYFnXvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nIcSRWEF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MK1KSb027193
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILH2Noyb/0pcF89WfVFMs9McJHKzcr01cOg5psDy5yo=; b=nIcSRWEFb7aEhO+D
	q6Z+7bd6h3rxMt5LxnPxQbTmDBCYHOqF0a2m5IO2Vml819e6lWWsUDbj769GE+t7
	CF08aLfjQ7L7kOMh1odWpJKIfP9yMfnGanczhZ12rJ94HMu+5XiAS14Qgg3Oy52L
	d6BwRafCPlqhx8CM/S2fl7yUpxcENWIX8JGV0qhyKzdsdPq0ySH9aL3qau+/RKbI
	6fzTJGkcyjKkqlH39vRh/MMKnzcuIVNTkdgfhf683FlPFdyWYxDoTBZIgBZWOI9U
	CNcY4Gg57FZgQX2DK973udaTKSnCHW5h/C+hyxt+3FEjskbSCQ7/WUKZX7cARB+2
	JaPl1w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8h3j8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:50:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-26b3e727467so2028545ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 21:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761195009; x=1761799809;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ILH2Noyb/0pcF89WfVFMs9McJHKzcr01cOg5psDy5yo=;
        b=qbq3qP30s3i4844Kdf4dSpI0a6cdBC0BaB3vZX5Ys85v3T0BWzUeS7d2XK0iUZd7D8
         5vkr6ukNh1xI6PFBTMSaIG1ZpSQLKkrnXKzjKMr8R90J4EGEXRz64sCuGeTPYY53Bj91
         FTNh7JlWBS/e9UTEkEEDqxmflA64u2aCSLOwZ2AhE+CdKiU3V0gcLbOr8suYi40oFoOv
         Q3EU+6WyAiXTRRH0/oXoN4fVutUYM9uvxZ2D4rA2giXwCdl1fx/sCU6YwCX8RicBkYCh
         2PlWh0pR9RgHIWjy43Ym/D0itXOl5xDsAHn3s5RuLLzRaWMjwMjh/M7zUDx1a+99zLHy
         1tDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW08UHq2WVBpsGHXGHr4jUClo2x3NI9phTgg+t/dKbFYJ3BSeRBkEqOu4kvXG82bEXJcq30/9U4q7cbZx+A@vger.kernel.org
X-Gm-Message-State: AOJu0YwrNYKfpkwm6afP4uRXBaw/vxF3B7dcfBVPqYGv1C50d2ffR9kA
	kmIxmuY5U5/n/9IIK1pua1+dY2nWpkucNzzXWIwDDFqQ1v5Icd3WI/oBPCXlFPa4w0o2musCn+I
	i9zTlybwPDc5IOp95Escrly3CQV90p2KV8O1hjk76nU+yhu9vK/kE8CPFIKfE8O/XSTiR
X-Gm-Gg: ASbGnct3wPICAk5Fp3dw0qGsrLmqX27hnXlqiZoZP1Iiogmwfww5eZd0OXacDlm8mxF
	kzC+0fJiDBtRS3bam6qWu7s6DPATbNwox5ZUMSpWvjN/tJDkmXLPp+5U+L/UJud9j3XWMR0KrP5
	dJk67S3Lf195+/T+9EizoPGMwf1zC6QI+orqEc2MoYVFjuwhsNBsk+1CDovEIccgROj1wNrVJAE
	7lc00H24Rng8cL7OiZOS63p++7cb14+WX0c9jZ+U2JOKA57f2w3Vm0PQocr68Z3weShtFozp+m4
	cazxYTxKcjtffC7v3VybArjaFrJoqgHBcahxQiqLmYbB8IFJ24DWqfx7+mVyATexWzhg2FBkGPI
	/bJM2KNXyQ2BsuFajgBwbOWyXcEPi2l/P4bD++Lkwo5X7pPN0Q7TNXkTP5Y2wr22Z1T2rtw==
X-Received: by 2002:a17:902:cec2:b0:261:500a:5742 with SMTP id d9443c01a7336-292d3fd9a38mr72508975ad.10.1761195008589;
        Wed, 22 Oct 2025 21:50:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJqjQ5VJXt3VI85Iu5u10F0hg2Fj8UlcAw7hs/Onz/30KSLJIC0RZtQJ73mpgOW8HVaN7wLA==
X-Received: by 2002:a17:902:cec2:b0:261:500a:5742 with SMTP id d9443c01a7336-292d3fd9a38mr72508645ad.10.1761195008139;
        Wed, 22 Oct 2025 21:50:08 -0700 (PDT)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946f681eabsm7873065ad.15.2025.10.22.21.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 21:50:07 -0700 (PDT)
Message-ID: <8d4184a8-4e32-43ce-a487-a195e97fa874@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 12:50:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
 <20251021-add-displayport-support-to-qcs615-devicetree-v5-1-92f0f3bf469f@oss.qualcomm.com>
 <fh7daiy5p5taaz7ifymbivfktjqngs5oashhd3osrtzspsac2z@nswaeyh3kkhi>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <fh7daiy5p5taaz7ifymbivfktjqngs5oashhd3osrtzspsac2z@nswaeyh3kkhi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: t_exCWRoPUYwGnhojhm0BVPrKlyQFLlj
X-Proofpoint-GUID: t_exCWRoPUYwGnhojhm0BVPrKlyQFLlj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX8CdSvY77qhnd
 OpFUiOZkwPV8go9D4P3EHbAzNjitAi5Y32DyAN3wNQNsFa5My5eWnqE8AJfLDvGlsuLbjMEW3em
 86RPmNOkiuUbk1IMCXBrJ3BPWGtfMWan3Nz74LSO1dSFgyiiyi4QMO9p47+YT4428tKMjSlZxN2
 Xw+X20c/J6cFa5Os+3cO+cNcoQai7Jfclfzo1Jx0q0RsEVpuFn1djDriFb5kNfTpzU7vXUHaKfL
 ROPxPTc3x1zhuwBiV8+LaPoPcHDFOBsdjpuA7Mk3K8VwDAEJ+wKEwQXS4boUY4ySBJhA3DVZiM4
 GVH/8qQ+Si+xU2wXWIvOxQQ1BfZwZi3Y1nBWUuT9H5qItVVdpHxJKfGe7hP7TBWt18tVay3klKV
 koLdzZQDXXoixVXu+4bvry/G0+XNYA==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68f9b407 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WzllQ2DKJnOsbc1lEq8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164


On 10/22/2025 11:07 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 21, 2025 at 11:18:07AM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> SM6150 uses the same DisplayPort controller as SM8150, which is already
>> compatible with SM8350. Add the SM6150-specific compatible string and
>> update the binding example accordingly.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml   | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..89852af70de97a9025079107b838de578778c049 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> @@ -51,6 +51,16 @@ patternProperties:
>>        compatible:
>>          const: qcom,sm6150-dpu
>>  
>> +  "^displayport-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - const: qcom,sm6150-dp
>> +          - const: qcom,sm8150-dp
>> +          - const: qcom,sm8350-dp
>> +
>>    "^dsi@[0-9a-f]+$":
>>      type: object
>>      additionalProperties: true
>> @@ -132,13 +142,14 @@ examples:
>>                  port@0 {
>>                    reg = <0>;
>>                    dpu_intf0_out: endpoint {
>> +                    remote-endpoint = <&mdss_dp0_in>;
> Why?


Oh, I think I misunderstood the “messed up indentation” comment from Krzysztof.
It seems the two-space indentation under port@X and opp-x is the actual issue.

However, that part was not introduced in this patch.
I will split a separate patch to fix the indentation there.


>>                    };
>>                  };
>>  
>>                  port@1 {
>>                    reg = <1>;
>>                    dpu_intf1_out: endpoint {
>> -                      remote-endpoint = <&mdss_dsi0_in>;
>> +                    remote-endpoint = <&mdss_dsi0_in>;
> Why?


Ack.


>>                    };
>>                  };
>>              };
>>
>> -- 
>> 2.34.1
>>
>>

