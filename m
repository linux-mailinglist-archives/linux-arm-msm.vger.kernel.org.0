Return-Path: <linux-arm-msm+bounces-84342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42329CA330E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 11:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CE9530987B9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 10:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AD43358B9;
	Thu,  4 Dec 2025 10:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQdRIHla";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QMcmgRN5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E503328F6
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 10:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764843227; cv=none; b=T1F8819N0cymtRhm6EUW+t6hyHYwF0bEPj88dg38uH1N55X8YO4CybV6Mx7owpwrxGSUBs12n4x2dM42BB7w8IGyIm/Zr1pWIhw+HFOFoo2+HljK4Poc7EOgeJuedYl0+DwbQ+UE52z22XQRfbWTsiQ3kJeDlZ4WS6ll0nfc25Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764843227; c=relaxed/simple;
	bh=26aEcCXe4ao1wpTOpW2bMP9HZYhawrwNGl3YzmPqe7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4hpjt2SQ1NbLKtKNwdr4fhA6lnR1cRYq5iV+S44ZYAba4DNaBx4S+E8s3kJ2srmc4voyi980sBMKr4FWG3ErBYaqRC0vPZog6L7nUkIOrRBuz4AfGe4PGM4DfQApMA144oPnoECCDg+oS+jgPFTHFEuVXY0ySzmNNxA2XY+xQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQdRIHla; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QMcmgRN5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4A02YH893579
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 10:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gFmCNQvfDV8zMZ4aEakyNLHUB0LSRMaEnMZW4uuVM5M=; b=gQdRIHla6fzrdg7o
	wSkQSYiYEHhxHlwoskxpUVNiXokd5YhFxP6L/oFYRcBRHliyJ8ZWdH+lBPLVrRbG
	L8cyZUfbHJJvTcqRoooQrOyVuD1YP5OgPGqrBH8Ua1UcWarobiY5IoVxzmJ80Luv
	PDXI631FHtfiTr+/Sd5RUWzsu7P59immZ4F62EnaWJv9Aj9IaZuTuaZTKmOwA6PS
	sU64lFkQOkfV81Dx+QSkIPXL769hkxL0Jomr7PbfnDiRO+QkgoBoM7rjlv6jj+k0
	Lq2fYhJRNgQR2SMEbtqBMBdOMlMQBMYxYR1boDwkJCwDTUjFn15EIZSuIGvGH3OB
	4BvhiQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au5m30mnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 10:13:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3438744f12fso1860758a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 02:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764843223; x=1765448023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gFmCNQvfDV8zMZ4aEakyNLHUB0LSRMaEnMZW4uuVM5M=;
        b=QMcmgRN5pSiFjc3sXDamG2B9ThP9VtM4O8kcOOkqf2BHueB7CsIO7NVWgQVZ5SGQCW
         zf73YAJvPd0kXCDjdJ3QLGp/BqtbPiBmm3o92QuH2LoWoMecL9Sxx7EM7Jk1Xz+v6xb4
         AmVU/NEwQVtcZ//G4Nvwy0X4EuHLi4liAHfpxcyvTJ9+dTCWXYDRSbCCCWGDTIt/K4Sy
         EB8V33ZxIRN8vjwaBxYip74AmS9hnFsg4XFoG70MLKvhhcBlJXVeIzFRht4X6cbopcPH
         xw80DeZb8cKo5wjSAv65fC4tVLqwI53WFyQG3y3/PUjMRqaNA2rLuwq+huZup7hQhQC7
         aBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764843223; x=1765448023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFmCNQvfDV8zMZ4aEakyNLHUB0LSRMaEnMZW4uuVM5M=;
        b=KZ9moMm7vODARDgThiXLuvIFQ+enkO6DLSxngt3MhvhJQfkcZmYsZBYf5W5gSTeeJD
         sRpYkNQ58Pr+PwDnP+TZbX12bJCV0gNNMC1M52EF8eFnOpAVGqE33xOtM6tBmFZdfqfD
         3XbEJTMEk+kk0qfFeKJ6VlJ34qcAaF4TLSq4vg3swKICeiiWWTXFvswF1ln771beVZIe
         0Dg4u5wYq+8nosdF+hrUmKY7WqjghMe5xbTJLVC5IXNWxzEowLB8RdP4+3HxMMPtafrO
         oSK67gyTDLs3lvkkaRFV8JeFMYK49K6mUsBGc35npRx2ZtP3ADKnt27bVK2Ktndm71kA
         Zy5w==
X-Forwarded-Encrypted: i=1; AJvYcCUsuC7xRHzfirfh6rFtXkvoDbR3xUO3wyGv4XsoKAxj43wetpg5P1fX+//R01uy7r1f77p3UEXiMmhzefb1@vger.kernel.org
X-Gm-Message-State: AOJu0YxY3/mF3cpLkz4dr5fBhPoXr7/AC9xGEjaw9tvBv6VaGZ+rSrpl
	/ngx3dyYQhVX2ALNHg+GHsG865oIDhxIfK2SJDxENCmH/TkPjcbLPlOrMkYR1aczwM24aJS5jaE
	0lISG7P5GuUIA4cHJDLYsoCQ+8NM+je6AnL2bCOLM4ySTWZG/OziKFza+nhjJTegcf5TK
X-Gm-Gg: ASbGncsS8QYJ11Sfe3/jJthsDl5TYo7dVfzVUlT0EhZV57IdIlG4DAAl9Tf+aJuPZg3
	vlveW1V0Dc0+afiNbvs4uDXPzS89vm8X/WIlj847s+mXl4Wpt3ydEoWKd9pbrIQ71PV5clvlgHl
	x8GJ5peOptp7sXk38hmnW3U87AsU0UZD6ASmmpxTPu8Rb3/6IYJI3SJKthbvuBW2bjNK/wFRwN+
	LF/EDuOZxNTb51QXBEVeKXQw7CYKD8HleXzCkcqzCQbLYi2ZoxD5C8Lc6ytYOSwII14ZtsVxi4j
	+Jyymhx7+CNE3GLmUHCvpEHsdJg8eDdwbfL4MwSPOkQmw+Ge/Fo8NUb11QkUn9187qOlbzVdRRa
	P7RHdJufU4DWUtldhDELVkilPsNNA65T8Yg==
X-Received: by 2002:a17:90a:d44b:b0:341:8c8b:b8e6 with SMTP id 98e67ed59e1d1-34947da3374mr2797347a91.16.1764843222956;
        Thu, 04 Dec 2025 02:13:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTI+FXsDrWaan75rn1W1zOHKGsnyM2nQAIHGhx3Y/oa38TATUtOTFlY4ZsHtBd5TpA4INomw==
X-Received: by 2002:a17:90a:d44b:b0:341:8c8b:b8e6 with SMTP id 98e67ed59e1d1-34947da3374mr2797316a91.16.1764843222506;
        Thu, 04 Dec 2025 02:13:42 -0800 (PST)
Received: from [192.168.1.4] ([106.222.235.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912a1cb94sm2500275a91.2.2025.12.04.02.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 02:13:42 -0800 (PST)
Message-ID: <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 15:43:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o4fFasGDVCDCSkHwVl3ni4PFngaep0yr
X-Proofpoint-ORIG-GUID: o4fFasGDVCDCSkHwVl3ni4PFngaep0yr
X-Authority-Analysis: v=2.4 cv=esHSD4pX c=1 sm=1 tr=0 ts=69315ed7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=jBSxni06C9HboLYAjQ55wg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=PRsBwnEcORHDhoN9PnoA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA4MyBTYWx0ZWRfX7ko/f1Bv198/
 wdq/M48aeDnwjezGWe14JRIA3pXqlgmJ7SClDeNr7oSVW+jnaFZWeA1Bp19xTKwqTVcSfogeHPJ
 p27sByMqB1S63desB9OHfYsn8obSoPX8K5PLP+RM++LhCzddu3TA/98kZ62BvnAyndyQ7bZaFpm
 ibf8cCtv6q6aZNzG/NAQwb5QNRm1LCn6XXwsEA+LFLVAsBidXusAUCufuuw4m/7NCwEMlbqV//a
 ep9guF3LjlVPFnja7y2MEIkFlRgiB6qiAlT4mI1Y7+dW3Vm3I18VJ3wwVKm+JdAYw8koXKeSHTc
 XeTZMl6ergKqHaJAhgzwiY8XArsTH4YTWy8jVNcO5IVsXhhkqOyPeQMsiQxOCiu3eyBU0xe0WbC
 lvKn7xKyQ9CQEq/NdWNR73LRTOHlWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040083

On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +			gpu_opp_table: opp-table {
>>> +				compatible = "operating-points-v2";
>>> +
>>> +				opp-845000000 {
>>> +					opp-hz = /bits/ 64 <845000000>;
>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>> +					opp-peak-kBps = <7050000>;
>>> +				};
>>
>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>> or mobile parts specifically?
> 
> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
> here.

The IoT/Auto variants have a different frequency plan compared to the
mobile variant. I reviewed the downstream code and this aligns with that
except the 290Mhz corner. We can remove that one.

Here we are describing the IoT variant of Talos. So we can ignore the
speedbins from the mobile variant until that is supported.

-Akhil.


> 
>>
>> [...]
>>
>>> +
>>> +				opp-745000000 {
>>> +					opp-hz = /bits/ 64 <745000000>;
>>> +					required-opps = <&rpmhpd_opp_nom_l1>;
>>> +					opp-peak-kBps = <6075000>;
>>> +				};
>>> +
>>> +				opp-650000000 {
>>> +					opp-hz = /bits/ 64 <650000000>;
>>> +					required-opps = <&rpmhpd_opp_nom>;
>>> +					opp-peak-kBps = <5287500>;
>>> +				};
>>
>> Here the freq map says 700 MHz
>>
>>> +				opp-500000000 {
>>> +					opp-hz = /bits/ 64 <500000000>;
>>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>>> +					opp-peak-kBps = <3975000>;
>>> +				};
>>
>> 550
>>
>> Konrad
> 


