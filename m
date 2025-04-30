Return-Path: <linux-arm-msm+bounces-56206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A557FAA4447
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 09:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 029EC16A8D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 07:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722301EDA0E;
	Wed, 30 Apr 2025 07:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPnBdTbt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43BF1E2823
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 07:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999191; cv=none; b=Ruw5YiEl50ELKRGD6xyNPGf8tHi5QxlyeMncyTflwJn7NVDEHXeq7WcKA2/MpgPlVaYLHXaGIbX6K/yrcnR9aDn2UVC3B6MeDiwwxhPcVf3ncriZMzQS1dUQxHE1odWnw+ubk/mYR+oxcQOoafcA+z4v65KlDxubqlkpcQQNXME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999191; c=relaxed/simple;
	bh=CTEjPujSZAqf3P+j1NI3hRXUfVHwxDengmLbAq8TEXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOTEyMxBvuVV24bn/CysWtnVqWZ6i9tmRkV0PE7uGRbVz6615nZ31J8inz1r5KV/OnmfRbPa8o26LaBFmZRoTZNUHqrUMVZKWxlaOgF/nx9KieuGro8Jf4ZvnR/osXVAkXcsLTN9dwt66duCaeAeqirsKT0OOuJEbBd0bU1Ur5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPnBdTbt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLaCFJ032326
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 07:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XcCLzzMlB7ZxM/ezJ4VGPTAmUkXjhMccCtENn84um/A=; b=EPnBdTbt9S8eSEoU
	1mt/l+svodQUGTAy7ITtLDuvP7/1rRy/i1nBHU5AhHgtkqN2kLfCKzPj00AQKv40
	ZM3FjwGOOsb9IrnzETKnLLrOIFjW+y12Uq2liUme9nl1Y8isI7r1Y6m2lJNnlh+I
	iKSLfShghwg4zSG1ks6oeP/mgH9GyG4tLSRsmTJyvmApfWksQS/urUk6gIqQIwUE
	IUbABca6OocyBGPh0AEesl5vwm4lfTpcQ5nnId42e+YmrNt6n9WXRf+mB/AQeV5V
	BcqRTQvcw3Y3njk7Dr6VbbY4V4He0nP7JNQpVIlUOtY65yw2x99pgWivxbZ8LzID
	26NLjw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u298fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 07:46:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47aeab7b918so14541251cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 00:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745999188; x=1746603988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XcCLzzMlB7ZxM/ezJ4VGPTAmUkXjhMccCtENn84um/A=;
        b=YW5TNq5P8ymdQEBiQaTQlQuWTyeb5cB9kmBNEY1dkhMIWITLmHgNTBHLyjWvOHVufM
         38Leo3PZ629ybEqcFQHsxPuyKujvIOiKBWHIR196cbxfIyYqn+7HgAjt/mHYIu7MlJq3
         2uriAKdnJ0sQdvRDZs3K4eAVeJd1tERRXGXSTMJIpzmx2OH8rmqlgFyZtnBcprEEbm2I
         31qghfnpFRoA8BFMpi79VOoMvsUqDddEfjDPMkampGrLccQd9RhqcIpinVSqePgPHn4j
         BkZt0z1Gmi31ehu5AIHrSxeTuEbDobs4HgxTHrDTwhsbKiqDt1llOfVvjdCxB6ZeQD1c
         +BOA==
X-Forwarded-Encrypted: i=1; AJvYcCW/mG3sqpEkeygaJ7NxwgwG+MyzF6QIYEWWAo0dWSSd5IUN1/4orHMQDf95dkAIXP4YlhtxP1HxxJxLjtsy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Ms/vOa+mi21yW4E3T03qzUsOtlqBF9ZD3QvmBQzvGHi4CeFu
	QlHUf6IhaQfoRKTbijdhmryDwN+9Nv/ww1t/ANcV/Q52L0Ac2FzA9BAIS95+l0HRf5sFbRoz4Y3
	LkPvHr35RFJRdBl1aR92+8mvj+rIRAxDmOJMBWlpmUOAw1ohuOx7d2DmUQr01btaZ
X-Gm-Gg: ASbGncvXMRNHq6HduHKiySRNX+ACFj+QpQ1C9dzEvdr/FE74vWz/92/mhZJ2rxAz0n5
	JvfF3MfSOYc8w7HY6rUFvuKtYwTQW0+Oq5vZwbh3AhfQ0pX0aVOH+atL9agxQuwQe/brnvw949z
	a7OEnZkBm1i98fUk/WPVTmC/jLgwmoY6VfUdkupnuAi+IP7YQR+AfwwIkhlqYK+EISg84CQ7Ft+
	Tt3zFQ4LP65dv6njOBD2v3zpBLa6Q39WVKddgF/5WBqB3a4hnBlGkqKTc12WAoq/HQ1rFr4QVGx
	WjxD8lCFDPkboU37VfvJU7b2T8HaVR0r6gyysObU+aK88bOfOWrKYjmNO8IQ3iAE4Z4=
X-Received: by 2002:ac8:7e89:0:b0:474:e213:7480 with SMTP id d75a77b69052e-489e64ceed0mr9350741cf.15.1745999188032;
        Wed, 30 Apr 2025 00:46:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmeOMwpptckVk+jetsDOiR+1e4jS5dFJwxeM7DhbyeRAzyOqqNSOpz4xjt7gtRJg3L8eOXmQ==
X-Received: by 2002:ac8:7e89:0:b0:474:e213:7480 with SMTP id d75a77b69052e-489e64ceed0mr9350621cf.15.1745999187615;
        Wed, 30 Apr 2025 00:46:27 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8ca6sm881270266b.118.2025.04.30.00.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 00:46:27 -0700 (PDT)
Message-ID: <59e3e34d-83b6-4f83-be4c-eeaaba9a353e@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 09:46:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP 1/4] arm64: dts: qcom: sm8750: Add display (MDSS)
 with Display CC
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>,
        Abhinav Kumar
 <abhinavk@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>
 <81205948-ae43-44ee-aa07-e490ea3bba23@oss.qualcomm.com>
 <97ae84c6-0807-4b19-a474-ba76cc049da9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <97ae84c6-0807-4b19-a474-ba76cc049da9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jygZqeLcpIeqre68VKjMPYAR_uYusf7n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA1MyBTYWx0ZWRfXy2cyxuVgAyxK /7R6V12uKsGb7xqUzDQQTlZo8vzs9ck2wNjF7B+Rzbmj8Dx5Rsr/EZmGnZnEK0QzofcGVx3k3vh eaEKkhhcVdQMbGQgZaRNtZmQE/02r21OWoi5ECsvypFO1pi47QKqzpW/eIu8VR3xEqjMrD2kwyz
 p4lJnFaX3GYiNw0YGr+xMHha5dcwzgbt0GSkZxi3JIabPjARegMnzJ8mXtlYnjx4P4zYl3q9v3Q meU/plxXvKXO3xh/BR+oG4qP6ryYn9aFZmCl7lGg9YZr6kvXSIhHCALTFRje+MceTacru9op4du Cjd/pPjCzfDpvp84ADGeAyc+7M5giuvfu0m2D57lygtNxBTfjpfhdQtOrg6emnenMKz8kVK31EV
 wqoaglGRCJU1aR518U5sZT/Jptb3HronLVPhPjCTDBFguCJIT07SXfmvuqgtopCFGlqymyhb
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=6811d554 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=bmsyZSe9DYnGDotP4YEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jygZqeLcpIeqre68VKjMPYAR_uYusf7n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300053

On 4/30/25 1:07 AM, Abhinav Kumar wrote:
> 
> 
> On 4/28/2025 2:31 PM, Konrad Dybcio wrote:
>> On 4/24/25 3:04 PM, Krzysztof Kozlowski wrote:
>>> Add device nodes for entire display: MDSS, DPU, DSI, DSI PHYs,
>>> DisplayPort and Display Clock Controller.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>
>> [...]
>>
>>> +                mdp_opp_table: opp-table {
>>> +                    compatible = "operating-points-v2";
>>> +
>>
>> The computer tells me there's also a 156 MHz rate @ SVS_D1
>>
>> Maybe Abhinav could chime in whether we should add it or not
>>
> 
> Yes I also see a 156Mhz for LOW_SVS_D1 but we had a similar entry even for sm8650 and did not publish it in the dt.
> 
> It was present till sm8450.dtsi but dropped in sm8550/sm8650 even though LOW_SVS_D1 is present even on those.
> 
> I think the reason could be that the displays being used on the reference boards will need a pixel clock of atleast >= low_svs and the MDP clock usually depends on the value of the DSI pixel clock (which has a fixed relationship to the byte clock) to maintain the data rate. So as a result perhaps even if we add it, for most displays this level will be unused.
> 
> If we end up using displays which are so small that the pixel clock requirement will be even lower than low_svs, we can add those.
> 
> OR as an alternative, we can leave this patch as it is and add the low_svs_d1 for all chipsets which support it together in another series that way it will have the full context of why we are adding it otherwise it will look odd again of why sm8550/sm8650 was left out but added in sm8750.

I would assume that with VRR even fancy panels at low refresh rate (in
the 1-5 Hz range) may make use of this, so I would be happy to go with
option 2

> 
>> [...]
>>
>>> +                mdss_dsi_opp_table: opp-table {
>>> +                    compatible = "operating-points-v2";
>>> +
>>
>> Similarly there's a 140.63 MHz rate at SVS_D1, but it seems odd
>> with the decimals
> 
> For this one, yes its true that LOW_SVS_D1 is 140.63Mhz for sm8750 but this voltage corner was somehow never used for DSI byte clock again I am thinking this is because for the display resolutions we use, we will always be >= low_svs so the low_svs_d1 will never hit even if we add it.

Alright

Konrad

