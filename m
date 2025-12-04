Return-Path: <linux-arm-msm+bounces-84280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A07B0CA2339
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 03:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F0C1302B13E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 02:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FE730507E;
	Thu,  4 Dec 2025 02:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCLCOJLA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYUsVtR3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DC4310631
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 02:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764816583; cv=none; b=uw43qIW7b1dJv4hiSIoVF1T6dPWg5akbrnX+R/qo8wRCFgcN/wTOXAH3Bm8iKfHAW1v22yeOFo2jibu0A1Uok9w2B2J7fbKnuWGh2JJyjvqUaO+JOB+gDF9P0J3pX25LkInB8T29a/BGHDSUyQBIYALoUtPeLXpYWYV3o1oZ0dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764816583; c=relaxed/simple;
	bh=KZvu2EeyWn23SjDJouenWu46nZwWJphUV2VLUfn2VtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LpKeYaL6oR36G/037TSx2xW+5uVMp10dK9HpH8xSrHGS3Ef9/OLbjpWOEzfY/w1ZdLZdiqp/CCjCW59sF1hzfEs00TmV617U1ji3AxdwF0b4dI5ZAtkmRI92jvRn5a83L9Eqn3eSB292hJzfFbjpoqHKBSz0TQyFtQNk8njWeGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCLCOJLA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYUsVtR3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3FqY773147702
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 02:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l18eOETE5eFpQF+4fs95+BgbC2dSm8raFUZecoGWy08=; b=GCLCOJLAfUFmTqLk
	twO1E891y4ojs3GuOZtt8POGpD8LhBeXABIKoBCodQsRz9/OxmvqW5WuM8seycz0
	sX8vihxReWKDtYIolLcIbSP7+5lpYtcUZGN2TFMgEtfRwXAEI/TNWCpR0i0EX/z9
	XWDe1eEn+SVA5PHRAQNLJt7qzVqHa2VyuBQgKnn+hNwDBIy4d+qI0Hpb9llro3ZO
	ek+eQOLJKlNWALvMJPR1l7qODSzhD+lPy46/HCuWGLNR6IFc/wZtxhX8LNqaYL8g
	WoPaiKMo5AebBbjBKXeKBUnLq32q0YnJPyrL65RmDH02bmhs5ZaXH9KHf10tz720
	mv44mQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atr7yhqxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 02:49:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297dfae179bso9715865ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 18:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764816574; x=1765421374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l18eOETE5eFpQF+4fs95+BgbC2dSm8raFUZecoGWy08=;
        b=IYUsVtR32u7kSISCQeyrciEEwY9MFQamCC+IYu8gA9O6RmbNT9MJkDeaTlphw/V4VH
         i10dNJssLFKykSFFHOwGcQoenyj3I2jqmCSqg6HJHNLo/w+vU7lhAVB/rNdJtAsyx9tw
         NGjkKZ0odC53ph6QgPLBIRqhi48s04Co0VMg0Atx84TaJgcS25ADqxHGb72AlMI1QRFZ
         WVfuq+Msxsj1DGcDRT96ZriFaVAeVI3BsHzFh5D7n1Osm0ZP+Cj/dU6szjVJZx39sN6R
         +6wmKrMC8bPswC09QbLErjJvazX3XO0fA3NmcWNr4abAj+TGdAJj4DaP2w23jtGgXNWa
         ogjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764816574; x=1765421374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l18eOETE5eFpQF+4fs95+BgbC2dSm8raFUZecoGWy08=;
        b=Doj9JsYmhuMk4pJBIRTLMcvFGTebQ8/A/YaliN2YtJL1MGBozXbDRricConRuhIkRm
         n+tgugpf41hfbhKQ/hFJ9NDGc9agmKtoU8kSVOJjtm7+zxOFZY7uYbmptbNdi7gBuLiY
         +tYnGDsoWHQY2XxQ1AvYpMn51IkGxAIPudajI6kVWRRnzLaJT4PXtiVhO+OAo5QGe+sr
         W/Hs8kZehTGqoqHxZQwi3Ekkp93PSxS5u2NuAr4zzc9nc4Sv+zc4j6GoLxTxYyEvEZTX
         CLT/HBXy2ZfW9VWm83BfJPKtDeW/P+ou9Mdyh3hl3IzNOc0/nUjvq/imIlUyStGAg+L6
         5ymg==
X-Forwarded-Encrypted: i=1; AJvYcCWYSGvb55LTCCISa6pFusQF3OW/yQ65LlwVz4QBOGpXla6izagLIxkOcSBntBcX7OZTZKfZI1BRowUZ055G@vger.kernel.org
X-Gm-Message-State: AOJu0YyXb1sAe+3ZOybayAiKSE9j0B8DlGox2RbaZDZmJxgvJUo/yYFa
	KdaLxfs1QyhGo7PHNZL54O/ctQStBY6QffECrtLZzm/L8yl01GpzTxsp3r2VnkVp4ZZG7BqIDcD
	FrGYoUziOBWqhceSHKkXIt9DGao+/zmoFxhBxZzYglnZaOfHni6OwqEyUr8ShRizIPtGB
X-Gm-Gg: ASbGncshxvYRVzo5D49CA6+SXHin6MhhyeX9NeOPJq+kgwNmkcqYGpkZeL0wlI2fTyU
	bntVKSefh175SgcT0wJAKgPpvmJ05Le6P/sUGVbyT+Dohk+1nla8z9ozJFWIVlsESBEsXgb3D0j
	d681lx8SwZKZpGn9GXA/sE2DmR49Hvv99lsnORZYYykqW1hX+lDpf9AdDp2t+sGnYmrrOxj8FTz
	BFHgmAjsKOqQtoSvpAfOlR4uv1vQXzYKX5roVfKp4dkvwryOkVxDvdSDaArCfB+f3CnkEAcwbLM
	s4zTFrZ0zwazFYc9FFlS6+UL9fS8aqBaNGWa3gKH1Yf6Zc0CdwyNpMJXdHd0jJrUs3YVjLqyLzR
	2fBntE+JCNnNDeDryn94PcyTnIGQF+uhRDjL8/7Ka8GOG8p08pno5UXpyM9+pfORHAlaz8CdbYv
	0=
X-Received: by 2002:a17:903:1590:b0:297:f527:a38f with SMTP id d9443c01a7336-29d683634fcmr54201555ad.18.1764816574199;
        Wed, 03 Dec 2025 18:49:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOXhEDM4lGPiChS+i/tHVgNqoj4qvaobNrbo6Alylr+7d/T0hWbeTiG9c4DjXOLOjZGdHH/w==
X-Received: by 2002:a17:903:1590:b0:297:f527:a38f with SMTP id d9443c01a7336-29d683634fcmr54201235ad.18.1764816573728;
        Wed, 03 Dec 2025 18:49:33 -0800 (PST)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cfcfasm2815175ad.41.2025.12.03.18.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 18:49:33 -0800 (PST)
Message-ID: <dd87fd82-9ea7-4205-88b2-1af2eaadac06@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 10:49:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: Mike Leach <mike.leach@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-6-1db9e621441a@oss.qualcomm.com>
 <CAJ9a7VitqEix7dumLq2ND=6+PU_eCkm8=YkHB0n7iHdJ8iKeVA@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VitqEix7dumLq2ND=6+PU_eCkm8=YkHB0n7iHdJ8iKeVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WSLTeFdPqvHMseHA8mHKc7WzfuPpN0aC
X-Proofpoint-GUID: WSLTeFdPqvHMseHA8mHKc7WzfuPpN0aC
X-Authority-Analysis: v=2.4 cv=ZMTaWH7b c=1 sm=1 tr=0 ts=6930f6bf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=bsiB8u-D1x4h01OLYjIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAyMCBTYWx0ZWRfX2JSewNE5OOtd
 TkKHbkQNVI8AB0+zgaKYZFUz9l905lOG9Fy68/vurZl6Ho+LfWcgsQbx8GGBa1Wot2i7p9VJQh7
 NiQN1EBiw5N+fcf5TFRtcEavmuNnwZbC3Evngp3noj8Kb2x3dnlySuPL+4uPKL24EK+sp48iWd5
 EYK8DH+QnOViNLuIw/GAhzo6ta4zMcKyN9sySKrKQ2/0rmVhggv1atm/bAa9TZi8WDS72mzwgkb
 NohhW9Z7bnwSeXLhQYk/ODFk2pvNBCMCBfhGG/325Ohq31Hpi2WxlY8TktQqeOfxw0Og5D0SBxM
 zR8cIU+UVy6j0YQPVIGRDUXHMRXvMpKYVwG70u9/QNtmNgKmYwCf5zMWfRJCUepiBOnqBlUqY88
 rbAso8b9EhrcupWmwHPO46VtKrYFiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040020



On 12/3/2025 10:30 PM, Mike Leach wrote:
> On Mon, 8 Sept 2025 at 03:02, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Add an interrupt property to CTCU device. The interrupt will be triggered
>> when the data size in the ETR buffer exceeds the threshold of the
>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
>> of CTCU device will enable the interrupt.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> index 843b52eaf872..ea05ad8f3dd3 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> @@ -39,6 +39,16 @@ properties:
>>       items:
>>         - const: apb
>>
>> +  interrupts:
>> +    items:
>> +      - description: Byte cntr interrupt for etr0
>> +      - description: Byte cntr interrupt for etr1
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: etr0
>> +      - const: etr1
>> +
>>     in-ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>>
>> @@ -56,6 +66,8 @@ additionalProperties: false
>>
>>   examples:
>>     - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>>       ctcu@1001000 {
>>           compatible = "qcom,sa8775p-ctcu";
>>           reg = <0x1001000 0x1000>;
>> @@ -63,6 +75,11 @@ examples:
>>           clocks = <&aoss_qmp>;
>>           clock-names = "apb";
>>
>> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
>> +        interrupt-names = "etr0",
>> +                          "etr1";
>> +
>>           in-ports {
>>               #address-cells = <1>;
>>               #size-cells = <0>;
>>
>> --
>> 2.34.1
>>
> Not sure if you need me to review this purely DT hardware description
> update but...

Hi Mike,

I am very glad to have you for reviewing, appreciate for your time.

Thanks,
Jie

> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> 


