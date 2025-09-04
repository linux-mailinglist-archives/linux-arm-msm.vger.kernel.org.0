Return-Path: <linux-arm-msm+bounces-72090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF82AB44057
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 17:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AA47A06E96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 15:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB07020DD51;
	Thu,  4 Sep 2025 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ErqVU/O2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39751F4CBC
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756999096; cv=none; b=cdMuHtdv9ci2mHcSQ7hTE49iSMELqlO0wf+Pjr/FB0Me54Im8ovA5cxqXnXhBDV2EhiywH+Jdh15xWyHpXin2uWFeaXAPkNtq1GrecQ5Qma6vT/iybDl9+HcKJFfBNbqRdKPHa2N77dWVsqMlFRZptY/qmAMFMHHD55m3NHv19g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756999096; c=relaxed/simple;
	bh=SUVu9jUw+uVnd3+t8fJ6j+XRs/vEdFhHWmcDtBLhs94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KG3ZVgxQRpzT6AQPNlVOwn2mXluglXv7Rj4ljZ6GJCuq9UB4VsjIOOJ9xy+IdumOHpUaqHTI/K6n82euytpws2K9IjPYkU7EvDp2+evlqNvdaLnAmpuvqsMY3Sg5f8/XayCXSStLwHpr8YJGHkKPfin/OF0Z8M3EcF12fXnhXC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ErqVU/O2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X8dO031818
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 15:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U3ag2rCKadxvADtnF0lA84YiUUgGOpF/6W/RI0t67UU=; b=ErqVU/O2w7Aa7wpO
	0KrwlxDKAoSR+Gx0OlPo3uUYE8ed4eYx4Wim5Oyrs/ucuYVjmXuaDrCJh0NOC4Kw
	3I4oHcZbZpsL0Sh5JS9Bpjt2CWRRJPbJqnrfJff/5Eo6lKH06ln7mX6fQJAGRQOh
	h4gYMsqVzWGv1KqC4xvYb7AwnnoI0fRPjDVD2m9JrT4NHSUCVOyOTmlW/X79bnJm
	5QyfYLnvGuSjIkO+iStYl/Kvs17byD2cjB/z6OpPsFkp74Tf79tq3eel8EjUtlay
	DQ1FMP46PrUvipNzQkpHuKb/T3d/zK5dUGw45yC5hzUhp+SaSSeAavWh8L14Gakv
	okXhwA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw07y6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 15:18:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b32dfb5c6fso3877791cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 08:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999092; x=1757603892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3ag2rCKadxvADtnF0lA84YiUUgGOpF/6W/RI0t67UU=;
        b=JlaXEw4e84F+GbTWogEL78KL/rtgqUOkzZzSV95LRsKUNIfKVLmwkuSU164d1oqaRx
         1rn4ipkRPlp/6I8dm3p1YCCSQj1nOHkLBFTDqBUmoaXuU7Lp74EmsFrQcOJufB6oqGW0
         lskT6MEP4Rt/XSNKkBvZAgYOGJ+MMeAxnJVjr12xjisO4Pu5G3X72BRWPfS4E58qYPDO
         l0TnGrmhhQ76CN+VZyJ+wS08vO2WxbCHi9JQtz0ABglljowWnEzWSeYlWi7wjbOaaThd
         nW9CyAhTYBZPXe46B81c9OeK+w8ou51yxVKoAkkj9psSzEX/HH9rE7IEwkLRaXE5Ew+H
         zikQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6TXYu66ikGrgIJDDp+U6N8xvHjCTsiIx0qpJDPUFpSSOQxj5ZErgQJrkNFMiSaHOGgV//sNGRqYTejzjK@vger.kernel.org
X-Gm-Message-State: AOJu0YwnAmGTrK6v/matqbW/qHL8yyFlJI8NEH0nEKfi0/GPBxxkBzzj
	5gKmhS+gsPf0jOPq5feghJ7hl4E9f8fpaSo+lYoyGwBMN0PQBgWh2Z+FR8dSEStRMOgJiuIKOvj
	BDhRpfbGgUy+Kic4cfjB3Gn4eC0qA/RjjYt1QiW+rCMQRHQPYO+gjjBonKvtiRL215oV8
X-Gm-Gg: ASbGncuEAbJqEyNMymtJQ3VfJ/f0ZKuITtBp5gG2A1xLgc2ilbSL0Z2JxKxscmgiQGq
	Gj6M63RJa2qo3XOOQ65EAq0yY/c6H8nQt16Yglduiql4hlb2V+YrewuqwXIIEPzNkaaUYSxf08j
	Ha99/5b9luHsbtBykaohX9eVgwmA+0zmNBcIcUkalpIc7/JaIjqvfEF7ALPPxdcQe8vU/q3Bc8O
	/pAg46ziSj4DdfACQOQwlLcA5u6dQtsEeuDAp3bdAX5EISPr9v+EXAqbLdgUeFGpu2gPaOVxQL4
	B56tgXGymv/xuAWd+wtxNdVlCR5fsczxhfYs7UWDRE3btdO/rfzMRFbyMEQoW5Y+J6eKyPJyCQ2
	1y/MT2Yq1hWxhvDHfb3LmLQ==
X-Received: by 2002:a05:622a:11c3:b0:4b4:946a:df22 with SMTP id d75a77b69052e-4b4946ae541mr50630301cf.9.1756999091627;
        Thu, 04 Sep 2025 08:18:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT8mTyEJ4P6ECcG4IXEz9vD6IAMkUJ1fj2kQAU8IKBPOb8CPmz+XFCtvntqqARuhsoEFnLhg==
X-Received: by 2002:a05:622a:11c3:b0:4b4:946a:df22 with SMTP id d75a77b69052e-4b4946ae541mr50629731cf.9.1756999090951;
        Thu, 04 Sep 2025 08:18:10 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff0971379esm1517527966b.102.2025.09.04.08.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 08:18:10 -0700 (PDT)
Message-ID: <db5220ad-6153-4f04-89be-5d74838151b1@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 17:18:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp:
 Reference usb-switch.yaml to allow mode-switch
To: Rob Herring <robh@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
 <20250807-topic-4ln_dp_respin-v4-1-43272d6eca92@oss.qualcomm.com>
 <20250822212043.GA475528-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250822212043.GA475528-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EujMZ8YsTR6maPvC8VLqbAJO4XF8zpYr
X-Proofpoint-ORIG-GUID: EujMZ8YsTR6maPvC8VLqbAJO4XF8zpYr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX0toPTPkpmlGa
 dhQjBC3TtEU4GrFlJEgjKxUDjEANAEp6pXcCotR16ZAHRRx3on6cFu8TtrDcq9UDZ6eGolsz1RV
 cni4gmk9tXjVDgLzV+XlMAtw+PXqbgwCQXd4ERQnXGM1yfBbnYTLxBla5ZBdJKY20VXgQbknbvx
 LMZbmJYutkGrdfEu4AczIspD+amgYAOeebpgGYUezBO/0yEVsQAt/RPpDZpEiP5ckxQqJOkR+zZ
 0qhwiMgAtld5+QiZLdVhnasRf+ylObzPxwhxbBKFc1d09sOE/K+lNZ5yEmL0ecnI4eKntNQvRk3
 D2HWMrZ3j2nXsoPc8chjJ/wCLAVrjpLvPS/cNTEKIlopJb79p+gjZ+7cmdFKrgrPkooqivceksa
 80xJeF8l
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b9adb4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uu3TWbf2t8eLHAi7i90A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On 8/22/25 11:20 PM, Rob Herring wrote:
> On Thu, Aug 07, 2025 at 06:33:19PM +0200, Konrad Dybcio wrote:
>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> The QMP USB3/DP Combo PHY can work in 3 modes:
>> - DisplayPort Only
>> - USB3 Only
>> - USB3 + DisplayPort Combo mode
>>
>> In order to switch between those modes, the PHY needs to receive
>> Type-C events, allow marking to the phy with the mode-switch
>> property in order to allow the PHY to Type-C events.
>>
>> Reference usb-switch.yaml as a simpler way to allow the mode-switch
>> property instead of duplicating the property definition.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml     | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> index 38ce04c35d945d0d8d319191c241920810ee9005..c8bc512df08b5694c8599f475de78679a4438449 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> @@ -73,10 +73,8 @@ properties:
>>      description:
>>        See include/dt-bindings/phy/phy-qcom-qmp.h
>>  
>> -  orientation-switch:
>> -    description:
>> -      Flag the PHY as possible handler of USB Type-C orientation switching
>> -    type: boolean
>> +  mode-switch: true
>> +  orientation-switch: true
>>  
>>    ports:
>>      $ref: /schemas/graph.yaml#/properties/ports
>> @@ -106,6 +104,7 @@ required:
>>    - "#phy-cells"
>>  
>>  allOf:
>> +  - $ref: /schemas/usb/usb-switch.yaml#
> 
> As reported already in this thread, this adds a crap load of warnings as 
> it makes ports or port required. Sigh. Can QCom folks pay more attention 
> to this please. Every cycle the number goes up though that's often 
> temporary because there's no coordination of taking .dts files after 
> bindings. But generally, progress on QCom warnings has stalled.
> 
> Here's the top (bottom?) platforms in arm64. The first number is 
> total warnings. The 2nd number is unique warnings (to remove inflated 
> numbers due to lots of boards per SoC).

I'm sorry this happened, Rob.

I assumed this was a solved problem as I picked up this series, but
of course not testing always ends up biting..

Konrad

