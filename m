Return-Path: <linux-arm-msm+bounces-67240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BC2B16F3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 12:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 778844E0A36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 10:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C61729B8E0;
	Thu, 31 Jul 2025 10:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5jlmacJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8C0264616
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 10:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753956744; cv=none; b=Q1qumy3YfcjhKVTeZ07VPZWQy+zpU6rqH6kzDjRmG/DWlN0TfShFD2HjnabDH2Ukva8gFwgRO4+BxpZn2648nMklzy1CNYklOZwjWBh403pHDWwQmkBiOuX23FrD+Ds86346H8ysZTXmicv52dKKBqZkCQhcvIuQa9rOjd5/TCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753956744; c=relaxed/simple;
	bh=vmOuvD2gebJGeJp/mgNi1ZkYn6G8Mc/7lUsj5Pe1NWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DC+FMIUhAwzBZVvd/AWr/yNv1Sq/axAaOtA21EUYMFBBbBSi49euyoR2vnpH5bNavmyWYir4ng40/ge1EtcFKPNVJWMj8F47XgrMZ8G4J5y5EuZMp2LjtAJfnTcca6w1200wFen64BEzvDPf2PTspOkm7VYqEMDyHPHNEkSNdLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5jlmacJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V9fNo6013440
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 10:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qvwHQvvH+17Jwk56yeRVBW4CP7kIswZF13PCDIQvzbY=; b=P5jlmacJR6IUgSxj
	2ccwm+uB1BTp26GbYLVchMrb0DiKrgEf3+rF4Yh6ozIKX19DyJ9LvHOkeIWiXGpG
	wXl4wpT/MCZqhFm0LCPUHDZt5JevuH1JPd8wKoL+K3X0Esm8wesgRDHu8DaYgaau
	Uzdcf7koKug1ZHoxsXkjaK19xrUdCM2pn//fG0hVJ66zNBvoiyNa/RILSkaMm7n4
	9xAJOVB0GJhIXUKvt29+m+Ao61ix1QAt7gxpGV1Pygy7adyleZZdMl277c9IhFWb
	1+2jGqlKON7EvEfBWcaxIgvwWjneKpYcPKVQuozGDhbQrdWs+24MwehcYSQZzYpl
	hKNsdQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2q6gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 10:12:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-707778f7829so202766d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 03:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753956734; x=1754561534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qvwHQvvH+17Jwk56yeRVBW4CP7kIswZF13PCDIQvzbY=;
        b=R2hL0I58ICNNmqvTFqVE1NApkdnvn9zt05piUQDxmtssOgH9nETa+0Hp2T2EH8K4ha
         cUyAABu5WbhKkxHN84jU7ekJGHRvizsaWEqAakTvrp6kdW9ZimMqUVXgHC4nLlRuoo/G
         jEXtid0n1Hbq2iorXQ/Rl+P3F6zPNsjm0mhUCz2ENedB0wa0OXINP7x7S2aQmijLL4Ub
         cZ9deEsofpOTqHhaLC++P+9CmN3c4bn91HpjKf7Ey3mqMEVu0CnHsurXJuqDBEXJtiey
         IM6LPjO40aAX4PbCq0bpdvxP7WfW7E2cCF0AoC3dmqnYxl0y4tOqJirrcdILaVUZCi61
         XNvQ==
X-Gm-Message-State: AOJu0Yx0DU8JSKQMBj4ZaXQBTk4OdPetYxvGzIkSe7m25pj4cslm2lyb
	drJPGbeUinA9Dr9jOQ/wtob2aovek1JdcKjMwjB1JV+yDMsnmeiIHSBJ2bErz8M0Zua5mviIY4S
	qJ11uAHcZ26Dq5LEOT+Ex2N9LGNPbjElmDvTstYpPbMk49S+WbDipAvXLvhrsGPMJqgJW
X-Gm-Gg: ASbGncuuXEc+0xkByWamHO1sKSPSYruFAPwuGHplYa5NRDZIW4e0OTaMTAtcvsUMQK8
	N0PqonxEKbqrfL4yGCgQWkx8te8UmDXTGNzoROvU1GQmjsoa2lpwURcEhyvCTHahcWCq/l1AbQc
	HLYumqJ8vjeVBlj/9asLExYta6kJdy3CNAVJgR3kavjM3PNfGLKkhbq+TeVKeJhILB1aRAfrPM3
	c1xofHHFmX5Z5bolkSOAOyeR3Z3GroyrR4S1l/OLMImgTxKwqBz0M7cj1U3xZiJo8+Ga694pDzD
	F8plpYm6k4p182qIV2/+ugIsGJ9xJKhExP07Ur6HJbZk9LgiYDWkGKuyEqg2J5gLeXcqpF5x02H
	58zH5n/u8GNewYlGP5A==
X-Received: by 2002:a05:6214:dcc:b0:707:4831:b7ed with SMTP id 6a1803df08f44-707672aff59mr37985356d6.8.1753956733667;
        Thu, 31 Jul 2025 03:12:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTlbx2VL/KCLHn6A4JzGJRMYtiFUx6VGYkgtJzm4JIQStIWhLL4lP4KD+QcUQWXTwOXn1wkg==
X-Received: by 2002:a05:6214:dcc:b0:707:4831:b7ed with SMTP id 6a1803df08f44-707672aff59mr37985156d6.8.1753956733016;
        Thu, 31 Jul 2025 03:12:13 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a911451csm863783a12.60.2025.07.31.03.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 03:12:12 -0700 (PDT)
Message-ID: <0cf62b7f-624c-4751-a126-f0a0b4a6d82d@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 12:12:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Add ACD levels for GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250729-topic-sm8650-upstream-gpu-acd-level-v1-1-258090038a41@linaro.org>
 <63da4872-2365-40eb-9b2e-d3393ddd9b68@oss.qualcomm.com>
 <a88b22b6-4be5-4176-95b0-0a03530bfd76@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a88b22b6-4be5-4176-95b0-0a03530bfd76@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: w2ItZ0Mxv4aMyO3aKGp6Q5Gd5aBwAin3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA2OSBTYWx0ZWRfX2hfNi6evD4EQ
 BlpOM58BOrWgUgCP6EoJR5ctr4HITKHjcAGY48wngoUCcQkuZLiU4jMOKJuhkRTUeBGcGW1yalB
 5Q02CQNEAH+UYTbPaXzoVFPfEcbNAfrz64vnz+hMzhCs7is4wENDE2IVxfpstRZtCtpdJ/ZHxxy
 pjXMgyI+bJKxlHz/oMO0tMJU1spZfiBaOu2GKKNM48so9VfstEbYGqU9e6pEWS+seIfgQluqH1z
 y1nsXNP3PSyPmMw6yS79Rl/ZrBqjBQ79v/PJAAupBJboxhu0zfi8LSWAjYsNNuxHfnh1DEby0uJ
 UkaeEWMNVJgKKn2heP16f6Pto6jxNbbI611+GbYQSryg4aGRxapNCw97Yq+3mcCx8JT14X8Hcd2
 +OnQvYcQQKZOnqmLsFgm4GoKCJKWN25HvP4gQmyH6iOoGhvUHNfG5iBLN7/6IF4JvUWm3FP+
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688b417e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=dJUZX_0qjHRVC8eAntkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=fsdK_YakeE02zTmptMdW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: w2ItZ0Mxv4aMyO3aKGp6Q5Gd5aBwAin3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310069

On 7/30/25 4:28 PM, Neil Armstrong wrote:
> On 30/07/2025 12:00, Konrad Dybcio wrote:
>> On 7/29/25 4:40 PM, Neil Armstrong wrote:
>>> Update GPU node to include acd level values.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 +++++++++++++-
>>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> index 495ea9bfd008500dd2c9f46ceca94cf5f972beca..4cd933219ce008bd1c603c87778e210b6332e29c 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> @@ -4127,72 +4127,84 @@ zap-shader {
>>>                 /* Speedbin needs more work on A740+, keep only lower freqs */
>>>               gpu_opp_table: opp-table {
>>> -                compatible = "operating-points-v2";
>>> +                compatible = "operating-points-v2-adreno",
>>> +                         "operating-points-v2";
>>>                     opp-231000000 {
>>>                       opp-hz = /bits/ 64 <231000000>;
>>>                       opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
>>>                       opp-peak-kBps = <2136718>;
>>> +                    qcom,opp-acd-level = <0xc82f5ffd>;
>>>                   };
>>>                     opp-310000000 {
>>>                       opp-hz = /bits/ 64 <310000000>;
>>>                       opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
>>>                       opp-peak-kBps = <2136718>;
>>> +                    qcom,opp-acd-level = <0xc82c5ffd>;
>>>                   };
>>
>> https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/graphics-devicetree/-/blob/gfx-devicetree-oss.lnx.1.0.r1-rel/gpu/pineapple-v2-gpu-pwrlevels.dtsi?ref_type=heads
>>
>> doesn't set ACD for D1/D2
>>
>>>                     opp-366000000 {
>>>                       opp-hz = /bits/ 64 <366000000>;
>>>                       opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
>>>                       opp-peak-kBps = <6074218>;
>>> +                    qcom,opp-acd-level = <0xc02e5ffd>;
>>
>> And other values differ too
>>
>> What release did you grab these from?
> 
> A much more recent non-public release with different gpu-pwrlevels for different SKU codes,
> all sets ACDs for D1/D2, and the ACD values are:
> 
> #define ACD_LEVEL_TURBO_L1    0x882a5ffd
> #define ACD_LEVEL_TURBO       0x882a5ffd
> #define ACD_LEVEL_NOM_L1      0x882a5ffd
> #define ACD_LEVEL_NOM         0x882a5ffd
> #define ACD_LEVEL_SVS_L2      0x882a5ffd
> #define ACD_LEVEL_SVS_L1      0x882a5ffd
> #define ACD_LEVEL_SVS_L0      0x882a5ffd
> #define ACD_LEVEL_SVS         0x882c5ffd
> #define ACD_LEVEL_LOW_SVS_L1  0xc02a5ffd
> #define ACD_LEVEL_LOW_SVS     0xc02d5ffd
> #define ACD_LEVEL_LOW_SVS_D0  0xc02e5ffd
> #define ACD_LEVEL_LOW_SVS_D1  0xc82c5ffd
> #define ACD_LEVEL_LOW_SVS_D2  0xc82f5ffd

I found sources confirming this, thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

