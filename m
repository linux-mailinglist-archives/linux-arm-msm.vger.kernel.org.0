Return-Path: <linux-arm-msm+bounces-42830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC899F83C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3294F188B76E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 19:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F2C1A9B35;
	Thu, 19 Dec 2024 19:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TyfdPLYK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F1B1A2632
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 19:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734635202; cv=none; b=hv0Hrd7Hlvgxqzpr1IqFBn9AyNCQK9/LKoR3vzhaXh8jCTcJXTQZtsGVy/1XTkUIUlrw49twD7gV9Fe7W6sj7sKFKul5CEv/6yNacl50HxqgzuZjFyqZT71QLGb3xXkltPN2eFXTUTj2LTG20H9pRUErAFkzhqaF0+wO+BNrzFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734635202; c=relaxed/simple;
	bh=miKz4Lq8b27Bo3nvZE/oEwtbz8gqti8YbPGWfvTe/P8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvNXE0e+ajSkMbmJ39vNU/reRhwXyiRoDNsRvRgg5f9b+N1PfWMW5uXbOEPeMOr1m+1o8gScP8NaPXfeP0t+TqbAjTIK0ZTBDrodZgys8nU8sRrvMfx1MEn16qfIYqrgPR3b5T4B3kdJ2WmZhl2ExGeZOGtGIEcZGQgZK3RoLDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TyfdPLYK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJGJ4KQ006258
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 19:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UWZ6vfFZXZOnn8Rj5pWSW2pSt+O0bU6UJnoyNmvkHEI=; b=TyfdPLYK7xrCUmiv
	YL0g9YeZeo92wDd7G3lM5IZPWHtdXeLQuPiVzQLsPNV+JXNSmlOp2HfvThIaiFpn
	oCK7sqvjM/oPWbdXoKdjiGSvSXoDQJ/7H3ejcHnRFpQlCeNf9ljdOZ78912H44lm
	Ae35tIaZCRwv+7ZgcDAA/uy6pUcuO5CrU7mlPFASmcoADbEyGeYD7/utC9oW6V2v
	7HoK4GVCYjzgfrnLaROih1wxEAQuSuKJTQIdv8PkWIPi1e4B0k7U0unTHzNCCCo2
	pRez/pTyxoakCtMVb0/oLAHLEcG4/HZUqRMY1SUXuHGgA9nLBJ8GyHQynIB6XFdL
	2J0Q6Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mpw60dw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 19:06:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467a97dec51so295771cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 11:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734635198; x=1735239998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UWZ6vfFZXZOnn8Rj5pWSW2pSt+O0bU6UJnoyNmvkHEI=;
        b=WmXL93q+139AQGomZAg9Sm4hINVZG2O9uJrSyztkWuePpIBNdtoI6YTNdkBsNQbUE3
         ze7sDoX6xpii7NYZWkhR5v38WxC6z/piT2F/LYmsllM4BJYyI/wPKu6Zkrg05W5qPAnD
         0e7X+wLJynNWmudjmAP4RpA2LMU2Ivu116/KPtrx+6zNDRHK4VuiemKozhV81HlUAeaC
         5u+PoRVfvPD5dvJwbVCpo/EGey/QSJjn0+9O3qgpkWsVHdXzNsxCeYObVkbIkEVEiyoJ
         yWloP0ZMhp8c/BaNlIHK1alHTAr/+M1+XoXK0xDn1GzoScb7fvfdH79R03fOEfxe3OWE
         THkA==
X-Forwarded-Encrypted: i=1; AJvYcCXZH7kRV9QAJQgTdkvInZopv7GIbGOpeesttrvBPwJcnc7kBiShCg6cIGAYB9V3TLRj8QTnIrOqc7uk4vvq@vger.kernel.org
X-Gm-Message-State: AOJu0YwtnVz3s/g3K9zdipeYzNZPVNqxrD0XGN52EOY/WVIkkfIa9srr
	w850rR05Z/DRp59lzdGZFi7IsBmbOHZnarGuZs9bWSgAPqyIPFqYSJtw6dPXH4FB8b1Ae2/qRuo
	UJPc4yEdk+Mg12c7r53aXJri72K+fyazlrkrNSYC1MKCcSCxIOZEy5L3G37/OTO1j
X-Gm-Gg: ASbGnctrfhpCkRJVOdvu5O8JAcypX7YKPF3zPgEIIqgHqv2OUIci8tLLxvfFnt5M+7y
	UV8EyaWRYpd0S9gI+V1nEmGdsaOArA5D1qh6Lxdhq101B9axCWxMcPU3jAJDBQ3Hlynur08UlQI
	w5sOH87lmjbnedIh9qiGoyGUbl0woec7Nf7pLuihBhwCwB/JXfiIeKcRsneNsARED4NL/1qlKUX
	GObkrnPPMloG8/WxmxSUQYFOqrMeerou4+HMXpVLDaUtITXrEalSWodMHYILEEGtVkHdBVy2gTv
	sH1ocKVL3xCZLNcedgF7H/S8dkQWcTSOSrg=
X-Received: by 2002:a05:622a:586:b0:461:4467:14bb with SMTP id d75a77b69052e-46a4a8b7e47mr854901cf.2.1734635198131;
        Thu, 19 Dec 2024 11:06:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7a+DlVQKkqn/PJw0dZDP1rNN4h3Og1DclMhN5A+YbI0DOWhNTu1aJqt/TQmvgKz06Gf28kg==
X-Received: by 2002:a05:622a:586:b0:461:4467:14bb with SMTP id d75a77b69052e-46a4a8b7e47mr854701cf.2.1734635197741;
        Thu, 19 Dec 2024 11:06:37 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8954bfsm96578066b.60.2024.12.19.11.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 11:06:37 -0800 (PST)
Message-ID: <99cf5f7e-43f6-4ac4-a4a2-dc731b695572@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 20:06:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-5-quic_vikramsa@quicinc.com>
 <22479c27-9265-4994-8974-9739ecbae5ee@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <22479c27-9265-4994-8974-9739ecbae5ee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 14iQlP3c-KBRg4rjcRZMkmUvlxWypbvj
X-Proofpoint-GUID: 14iQlP3c-KBRg4rjcRZMkmUvlxWypbvj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=922
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412190152

On 17.12.2024 3:40 PM, Vladimir Zapolskiy wrote:
> On 12/17/24 16:06, Vikram Sharma wrote:
>> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
>> Enable the IMX577 on the vision mezzanine.
>>
>> An example media-ctl pipeline for the imx577 is:
>>
>> media-ctl --reset
>> media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
>> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>>
>> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
>>
>> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

>> +        rst-pins {
>> +            pins = "gpio78";
>> +            function = "gpio";
>> +            drive-strength = <2>;
>> +            bias-pull-down;
>> +            output-low;
>> +        };
> 
> I have doubts that it's proper to embed a reset gpio into driver's
> pinctrl suspend/resume power management.
> 
> Konrad, can you please confirm that it's really accepted?
> 
> I'd rather ask to remove this reset pin control.

There's certainly some appearances of this in the tree.

You could make the argument that it makes sense to prevent misconfiguration
(i.e. the bootloader may set the pin in input mode), but then the counter
argument is that the (Linux) gpiod APIs request OUT_LOW/HIGH, and we would
expect that the driver uses that if the GPIO is requested through
e.g. reset-gpios.

I'm not particularly sure what to recommend here. Krzysztof?

Konrad

