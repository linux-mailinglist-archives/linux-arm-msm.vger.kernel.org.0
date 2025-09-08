Return-Path: <linux-arm-msm+bounces-72598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D25B493BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0D7E3B755D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8525730ACEF;
	Mon,  8 Sep 2025 15:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kr2tOBst"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011FD2FE05D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757345953; cv=none; b=I6O+7w1P0lpBUMqlgKBimM2lZcPz5EZ2DgdtSwlEvqr2PGzfxCHuYiklvBlNtWlSFCEKgrDZVj8XQOVyExoHPxp2mnx6nrEUjlXwbtEusZbYgexPT4POe94kyLIDwOpOH30TgQwrT2XlGONTFoPmPDv5YQ4W59Qaj+3o16L+39M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757345953; c=relaxed/simple;
	bh=hmxNwUU2zcaMmfH9+5ewG2jsk0T1GNdeIH4b++rXjvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cKdkGK+5E/9ec7RIDzarURVSQDR8oVUzdLFs6hj3DHo5BpuGD5CRLbZXOWmYITlSnHcyuGbBC4qNjmlphuyEqERp9pvXKudTjL4OhbMl8StVKPzXNpriFmqCC2PB+K9IgawjUdDzENqrMa6yvFjaitxWuO2ueehJj+T1oayOOGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kr2tOBst; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588BDnXs013595
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 15:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ix8Lxn9DP2aA0chOL91fW2+iXcks/DUCOCWwGLcOgI=; b=Kr2tOBstZ6FlTNhO
	h+ImuNoASmfh+AhJM9R4LNr1x87C5DPsXFQIwrrXGYlGj9O9/ECKXyEg0g84gRev
	7L8F/8LVRbJuOUv591x2ewQLznBtxspvcp7r2Edaq9Z3xNBLvwhxkc0nupfHMCFW
	NZiLN+Zj2nhn+cqfK1/1+OFhXHokjCmM3a522MndM8IqbRJ2RZcSXwiOlFQmkPva
	VnV05oxNXhw157PBFwTgUbys/c7ixabSE8pE0GzmFLDlAxGyRByhgBvNFY+otpbW
	uuZGfw/DqxL6PyYQ4sSDtCybmI4OxX3CFcfyxZCixulNEAGa3stSv1+HAsRWJRuj
	hFsnpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdsvjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 15:39:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b601ceb41cso9453151cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757345950; x=1757950750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ix8Lxn9DP2aA0chOL91fW2+iXcks/DUCOCWwGLcOgI=;
        b=Ah4khUbNLDKTNNgkv1XYan6e1w5zck9EStHZ0NA+B0nSjvKv5I46XR8Ak4R9u798xj
         7RmSyMNorly0ZkQn7ju959LPaKMA0fyxKGZVH7+G1sLFMkdAA8BFN102ROTEl2Y8Eusl
         DaTozOva1n9FMTcZ5SNxB8DHFdke2wS4/s70/y8jcX4aALpAXR1ARITlprkGymQuBt5C
         uPKvk5gZcELtBXPvq2ppuJBvUcAqxg63p1GvnxU6xrg0orSzg/c4fYfGUloZ4bNODYzJ
         Bj7Rx5kDtW3h9NjPmmwN4t4G3/Fu+SDcaGnOsNH23hKWVh7Ktw1ImWmALJV/rOzzxLkq
         MI/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6UHW00mPOvXkEWTjskfYwSrDwV/1vPFCvFY/te43HYVDl+FCMTTm0rM6/8F8UhE54OnYk2Q4nQmRoxEDX@vger.kernel.org
X-Gm-Message-State: AOJu0YxDnUfilsHKefFQyhHcSI2o/FW4KYMBOoUgc0K6d6gEDVZdNz8y
	t7iUjcKObTqCZBHEhOtLw8cYsTJnV8bzTnXqCUHUN3/lB21Lj3x1nQIjNfTW3gewI/Hm/EdtRYQ
	qlL/6B1eTZAJcInJtouHVvzuulIKTv/u0UPArPkv49h/VZlTB+Z5OvDFyuvB7MuSSezKs
X-Gm-Gg: ASbGncuLVj8n/9j9f21uHThkoAdARJcEyz1MjlZsRif7HA1/sV0El/aJp+CJrROHKaG
	mPf/uYmTOIeUPJpGr5kCG4OULlxT7T3xBjH/id+q3DSbbMFmjJBIOSjqGZVwidE79Q4wfDHtEXx
	xnSvCQjssqeCz1Sg7rCm1vkZPe3DQpDFpFctMAdq5WRd3PegD4Z7rGEvzgTgNxu0eFSBFfrfIhV
	eg//LkML3N/HMcgpiD1F2tlaJouoVZGwaWIyaDtnbmMnhwvCNZ9jnwLt4rZ/Ltm9tH93jM2dodM
	tNs72Yj/XU7g+MKlYjxPh7P0R1kJvgQMBVZA0KzC0njzEr7SRrkQe02XqK48+IiriUoZRmiMITC
	MlhFSj6WCHmw/b738QluMww==
X-Received: by 2002:a05:622a:19a7:b0:4b4:9070:f27e with SMTP id d75a77b69052e-4b5f826059cmr55449021cf.0.1757345949571;
        Mon, 08 Sep 2025 08:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSjAuw3MqqByPMWEwcaVGXJrt8t0L5vdGx6BjurjDCr+ZzKHljYEOvuS1tfcYm8a1jnOKGwQ==
X-Received: by 2002:a05:622a:19a7:b0:4b4:9070:f27e with SMTP id d75a77b69052e-4b5f826059cmr55448481cf.0.1757345948792;
        Mon, 08 Sep 2025 08:39:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0423ed35e4sm1961096966b.25.2025.09.08.08.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 08:39:08 -0700 (PDT)
Message-ID: <5bbe77f0-185f-4905-8097-8769f0d5f518@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:39:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: rob.clark@oss.qualcomm.com, Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
 <exkrgx6rdotfrrsnklsd7zk4ydehsk5vaoevibpqisyq2dwbd4@sa4kgnuexlna>
 <f169be5a-faa5-4824-861e-27bd2083b9cf@oss.qualcomm.com>
 <t5pxum74q3fwf6wgcbaeaginjvtjfn357pkfswvafsggtmvxfv@jl5qjfhpmmow>
 <c3de911c-e80a-429d-8a5c-c693546d4abf@oss.qualcomm.com>
 <14b5db9f-8b31-4baa-a03d-12112425fbbe@oss.qualcomm.com>
 <CACSVV02h8AUX8WtEuu5w-g2XnfBkfozHQQ15zGK6+LVX_w=d1g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV02h8AUX8WtEuu5w-g2XnfBkfozHQQ15zGK6+LVX_w=d1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: agcaT8Fab9XpX5PrcRwsZiNPuHfC_FTy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfXw4NnXcx6bG89
 GSGEcDS/2SnqDUY47r94Ma2aGBevL6XEu5lnqXR9LiBhfBYMTKOX2lGiMsgogE7MrHhi/SFP5eJ
 C2+w+TMcBQONubIFm7R8GMndz7d+v/s4KYuEAhUUt6gr4j7fqXipgUCUZmNIWGyMozTArpzMVLr
 LxT1sBdK6EmfVcBgke+NcBBvTohS0Dh/4AmPRi/B4eNo/iNtPv8SXaDkXysbpaPPSMTGVGvipfk
 M4LV6ojaxr4B1TJHYMPHZROJh+YiiGZr096TI8wnqMkVT8ODMb5xuLWsYDoD34iymgrwUeb35QW
 PwEb1TOta9ohIAbAa2WFlMNLIkdJsBkpetM2aZfBDgklvfBjw8mUAemZmB0UDjMSuoairntTzBP
 n09coKEt
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68bef89f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=am1a1fgwjgo6KoPeU6gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: agcaT8Fab9XpX5PrcRwsZiNPuHfC_FTy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

On 9/7/25 1:02 AM, Rob Clark wrote:
> On Sat, Sep 6, 2025 at 1:56 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 9/3/2025 8:44 PM, Konrad Dybcio wrote:
>>> On 9/3/25 4:00 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Sep 03, 2025 at 03:36:34PM +0200, Konrad Dybcio wrote:
>>>>> On 9/3/25 2:39 PM, Dmitry Baryshkov wrote:
>>>>>> On Wed, Sep 03, 2025 at 02:26:30PM +0200, Konrad Dybcio wrote:
>>>>>>> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
>>>>>>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>>>>>
>>>>>>>> Add gpu and gmu nodes for sa8775p chipset. As of now all
>>>>>>>> SKUs have the same GPU fmax, so there is no requirement of
>>>>>>>> speed bin support.
>>>>>>>>
>>>>>>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>> ---
>>>>>>>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
>>>>>>>>  1 file changed, 116 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>>>> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
>>>>>>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>>>>>>> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
>>>>>>>>                          #mbox-cells = <2>;
>>>>>>>>                  };
>>>>>>>>
>>>>>>>> +                qfprom: efuse@784000 {
>>>>>>>> +                        compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
>>>>>>>> +                        reg = <0x0 0x00784000 0x0 0x2410>;
>>>>>>>
>>>>>>> len = 0x3000
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>> +                gmu: gmu@3d6a000 {
>>>>>>>> +                        compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
>>>>>>>> +                        reg = <0x0 0x03d6a000 0x0 0x34000>,
>>>>>>>
>>>>>>> This bleeds into GPU_CC, len should be 0x26000
>>>>>>
>>>>>> gpucc is in the middle of GMU, see other platforms.
>>>>>
>>>>> This is not the case here
>>>>
>>>> Why? I think GPU CC is a part of the GMU by design: GMU accesses GPU CC
>>>> registers directly from the firmware.
>>>
>>> Correct, however this is only a similarly sounding argument - the DT
>>> describes the hardware from the main Arm cluster POV. The GMU Cortex-M
>>> core has its own address map etc.
> 
> but the firmware is part of how the hardware appears to the main arm cluster
> 
>> We have been keeping GPUCC region in the GMU's reg range in all chipsets
>> for the purpose of coredump.
>>
>> Can we leave this as is until we have a mechanism to dump these into gpu
>> coredump (via gpucc driver??)? I recall you proposed something similar
>> sometime back.
> 
> IMO we should keep this in the GMU range.. if in the future we have
> some other mechanism to dump gpucc state, then for future platforms we
> can start using that (ie. new dt but old kernel should be a thing we
> at least pretend to try to keep working), but for current/past
> platforms we should stick with keeping this in the GMU's range

Eh, right, sorry, we discussed this with I think x1e, let's keep it
as-is until more infra is in place

Konrad

