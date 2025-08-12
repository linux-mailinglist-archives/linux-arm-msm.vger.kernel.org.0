Return-Path: <linux-arm-msm+bounces-68812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB92FB22AAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 16:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5521A42669D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 14:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9B12E9EBF;
	Tue, 12 Aug 2025 14:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnUArB/Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90AC28A3F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 14:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755008770; cv=none; b=W5w3GP+G5zfrOJWXUXp+/gEXqvSMjTsQaGtQsGd/tRkeXmG9uoZ80RSwQeldhDUaKimAAwPp2vv7tXNW9UirmH29AX6YXB80Gln6tjx7X2INgrfDsrOJcB2lqgQvwX0yg1kEzDPOthvz0A7jXrCT/2QUVJre6/1r4r4ZCS6NHAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755008770; c=relaxed/simple;
	bh=EGD+sKUYcqQdiM8+RYCudtofEx7sqJDUQ+6JMPkBXkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k7ZTV2tLU6JdH4NaKr1lGRdHwMIbqffztXRYF601MUVIpn9kLhdjR82cCkqb3cOXi0Y19zNlnqNDIVrc4pX8J8UtYjAIeWTPFNA/TwX6me6SM/vIsumLg8EzAOTGQ4pHlcwu9Rg8hQqV3bDln/mbU1pd0lRtplofOFon4If1lCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnUArB/Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvgjF020444
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 14:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xtXP8sH7GqQPa7UuRkPSokPxFXv4WNFCKY2MoXbtnt4=; b=hnUArB/YoB425YL4
	zcCExCIZGO63312q+tmwrvCgPlZlmj2xA4wcHWzN5k3yVQjRA8goQx74ciqGkqjp
	vIbs6spFPW/pxzZuuV29wV5Nky++2yBmRCMFKDHRCk92j4DkeSo8L0z547LMCS4A
	N2IbpNopvfUM5H9a4fDaLhRm7s4BeKj+xtApugeoeLHShibqSTb2IcArmf/lEDKb
	jK8S+tcA1nGLpjkBDKmQH0mCP/UDAmHdfcdkPf+IajFSHdFyaHHhjpFnwFBpyHBO
	POjxrJkx+2SFnoQmPdrsrZZcISNYfNtpXN/IYIterFeFCCi3PGlgWS0Q/i4QcD/q
	ktZyRw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx6kbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 14:26:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b08f6edcedso15989721cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 07:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755008766; x=1755613566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xtXP8sH7GqQPa7UuRkPSokPxFXv4WNFCKY2MoXbtnt4=;
        b=XqJxHsIKSN77IOeU7+F9I4GceMedb2b2x5ZLjb8iqnHAKflw+92L9S5N4ubgG/Te82
         5zGxRqnJYRXMUpPeSkHuuX78fuJsHChJyVChtoFoUZnrCGj+8tSOWA9rhI/o31bNKCQN
         0+3pncfNWUy/y55zzbDdr3XTNGHyOMbUaJpIPLgLOPSBpjMHoxFWEo54QhKUaXZPUD8H
         RN2YN98pMbanvovZVEO+Pv+jhI6Kqt+LQllJ8WKkQpwt6mtsZguyN4E5Zsbq3sYynNPq
         /B95yhLULUHiU1wG2uIZcTJ40zw8vBPkhD0Yihz97QtHmbtsCl4xoMRVYhTP1AYSNMGc
         N03w==
X-Gm-Message-State: AOJu0Yxn8eWQRVAPvlqPIOJKA9Oq2XahuGr9NZFSfG8C/wm0P6oPAx8F
	cOft5gk7zZDRKwRRxQMTJCndocxcq/Q38xaJ/egE2+qmBrweJY7HmEx/SL8dhTBCpPrUjMh+0Dw
	Qv/Vv3Nn1EsScUlr+o6zbHHW79VM1CbogBqcuKmd4XoLxQSj4alVC1DmMRcrNOy5Txw3a
X-Gm-Gg: ASbGncsY+rdJTdh+/Uobf5CcUC1RWbMQ0BbvtiZvzkDsNldvm71d1SaAy1S1czKyzu8
	l6DAv8GAcOU5P2YJIo0DbI5hhyoe3cr4HpIHk+0w+NZvGcKaM9/Xeg3/HwKZPYs7/yv0OZKJtbW
	EQI57tgwVEjMIKuYbXnnfsZcZXJRC/V7kNNdfxem6ReJ/Y8zgkW3QvepUbE4AU+8HCigWfWDMgk
	NxjCgGbebH3fGJDRjd782g65/6b4FMIDNeIT7pl5EHeu7En8XSRjuWQ9jKX2LmmUhD69RWXIpFn
	Lyf+YDaIuzyIod7xRxHv5azH0mbosHCmkBtfxW5Dcji3p2qz8qPTErbASz3/xoU+JGRY86jEoCk
	G/ckiVpp2osKhXohaNg==
X-Received: by 2002:a05:622a:189f:b0:4b0:8cfa:a507 with SMTP id d75a77b69052e-4b0f4ccd933mr8824141cf.10.1755008765550;
        Tue, 12 Aug 2025 07:26:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8LS3Zr7v6eg7PJPhic5KbiS+w16SpOf6m2iTrYCjLH0hf8ZvRoSmzx2RInkE8544/GXw8/A==
X-Received: by 2002:a05:622a:189f:b0:4b0:8cfa:a507 with SMTP id d75a77b69052e-4b0f4ccd933mr8823581cf.10.1755008764930;
        Tue, 12 Aug 2025 07:26:04 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3e80sm2226480566b.47.2025.08.12.07.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 07:26:04 -0700 (PDT)
Message-ID: <6ffa8d6f-d5fb-4a94-ab7c-1a923cae1332@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 16:26:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org>
 <20250806-b4-sm8750-iris-dts-v2-1-2ce197525eed@linaro.org>
 <e414163e-e171-466f-965d-afb9203d32fa@oss.qualcomm.com>
 <be5f18d9-a642-4b4e-bf69-e0108e988faf@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <be5f18d9-a642-4b4e-bf69-e0108e988faf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX7WG/Za36xrUm
 817oL+jGagx7UAGNCrre/Etbf4MlImOk73Qw+w6RnvIp1Ht9+yCIJAntwFB51CTY9W963b/K6JF
 mfCC8H/VM7DO2Hcdahtg2fW2v3VaTi19Ow7hjngI38Y4mrzsI/Nx7WaT78L/Onc+FtvGLaSVph7
 9N9CFy944IYljkm1bM8DZIv7OMEfzkVx1IGWcUA4t6INvtdHadysCGdpm1XmDshnRtGugedoekO
 qP2xxsSX4zUZ0nGFBIwQSTMox9uS/K2O3nAar9vEzvavbKvdE671eWGk4vKdwc4iZOcYoGHlP2x
 EeUiHNJi7XZ+1pXrLz2g+l28kYNh6wX8w1Gx238QfcAkGoeQmiZFOTm41ep4iyVe35cVhdowZ9I
 8kgtVkYg
X-Proofpoint-GUID: w85lX9K-mRwoDIY6naXBk2zJRSBeI2wg
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689b4efe cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=9XIazU3Zd_7FZfIRWW0A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: w85lX9K-mRwoDIY6naXBk2zJRSBeI2wg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On 8/12/25 4:24 PM, Krzysztof Kozlowski wrote:
> On 12/08/2025 16:21, Konrad Dybcio wrote:
>> On 8/6/25 2:38 PM, Krzysztof Kozlowski wrote:
>>> Add Iris video codec to SM8750 SoC, which comes with significantly
>>> different powering up sequence than previous SM8650, thus different
>>> clocks and resets.  For consistency keep existing clock and clock-names
>>> naming, so the list shares common part.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>
>> [...]
>>
>>> +			iris_opp_table: opp-table {
>>> +				compatible = "operating-points-v2";
>>> +
>>> +				opp-240000000 {
>>> +					opp-hz = /bits/ 64 <240000000>;
>>> +					required-opps = <&rpmhpd_opp_low_svs_d1>,
>>> +							<&rpmhpd_opp_low_svs_d1>;
>>> +				};
>>> +
>>> +				opp-338000000 {
>>> +					opp-hz = /bits/ 64 <338000000>;
>>> +					required-opps = <&rpmhpd_opp_low_svs>,
>>> +							<&rpmhpd_opp_low_svs>;
>>> +				};
>>> +
>>> +				opp-420000000 {
>>> +					opp-hz = /bits/ 64 <420000000>;
>>> +					required-opps = <&rpmhpd_opp_svs>,
>>> +							<&rpmhpd_opp_svs>;
>>> +				};
>>> +
>>> +				opp-444000000 {
>>> +					opp-hz = /bits/ 64 <444000000>;
>>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>>> +							<&rpmhpd_opp_svs_l1>;
>>> +				};
>>> +
>>> +				opp-533333334 {
>>> +					opp-hz = /bits/ 64 <533333334>;
>>> +					required-opps = <&rpmhpd_opp_nom>,
>>> +							<&rpmhpd_opp_nom>;
>>> +				};
>>
>> There's an additional OPP: 570 MHz @ NOM_L1
>>
>> +Dmitry, Vikash, please make sure you're OK with the iommu entries
> 
> 
> That opp has troubles with clock, so would need some fixed in videocc or
> iris, AFAIK. Otherwise you will just PM OPP failures. I can add it
> though, at the end  DTS should be independent of drivers. :)

Weird, there's an entry in the frequency table for it (well, * 3 the
rate) and it comes out of the same PLL as other ones.. what sort of
opp failures do you see?

Konrad

