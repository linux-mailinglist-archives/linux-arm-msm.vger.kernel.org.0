Return-Path: <linux-arm-msm+bounces-57405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ACDAB0DDA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 10:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83EAC1730F5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 08:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1C72741BE;
	Fri,  9 May 2025 08:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A2AJc1qN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE73207A08
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 08:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780849; cv=none; b=N99O/q/qeQbbE6UVPmHWQ0sQNIPxhZeLj8WWtggocqSAPGpKj5wIMaKMQa4iB1KXfOaVsVUMbJ+yAyovZKgyVICr0/EBieHEAECyKa2Jwt7WcFcx4tLX9CEL4qK6Jb7bTI3f5X9PXGXOqLLdtFRtcQtMabf2Firyzlw0CID8dao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780849; c=relaxed/simple;
	bh=OmNQjmyPp6Z636I5uUjUoUqHm3MUQ4+t+kb9qveiRHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kJJ3rI0l1Y03xSPG9Qn12JiVtyVr8RO85LM3YvHSXmkXuq7hEhjmmpETqZQnQmi9q3hBUGP6yWtXJNdQsSDRAbxKnSU2tABy7K2czIDMD6n8Hhn9v2w6y76Aj/58tixQczDVJuf+Va5iyW1YHcyX08jimodCQbzqO0V3W93nUXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A2AJc1qN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5491g1ha016559
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 08:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IV0D8yzLQVRBQnd1oWrr/dIt7LcIbiRjDinSoGOBI8E=; b=A2AJc1qNusIAE7xI
	qjQA4HRPlAVjmd7TRXJw85IGyhazSu4EnETJcer+0zi3LKrWg2UuBo4JPyGDPJNy
	BeIRFGsbOGiX6ibkldPHI+HoZvZkT//7QeBanFsNWBxMSIkEWBgRFCUlPcxjkEI4
	DS2gsuWuFRGrgPBdtMvmA81XwdT7g7o6bkddJy9Y/ahDh5O+m+pKfzqxno2uH+Qk
	mMkB8aUHsS6CO+pGq12mWJhFSBz2vDUR9MjPjg0/4YGtoO3u7vymrfAR0kcB/Qwe
	Uyvb4wY7VNW5B+BwMF14Q+W6KjYL6OnvOPOkhT2p3S0hEWwuU9mO6YwfuDbpLdoo
	Nl4H6A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8v06g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 08:54:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f6e71d6787so1270416d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 01:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746780846; x=1747385646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IV0D8yzLQVRBQnd1oWrr/dIt7LcIbiRjDinSoGOBI8E=;
        b=rfzEoGTQMg6UWJHJ2xGChvzCJb5cQ58ZIrzX/QcEUxx9WP4Q8fZyoXAj0fem9z/N08
         Is2yqR1yBi3LYIurBQ+ZZlJXxmY2pJD6DDKC3KTdzASRu9OiZJ5OOGyLCuVtBP+Tghoi
         twP4fdaZTUbnEaE5WTjx/c9Bu3TH1+m/jZ0Ls9eIVBTKraLRx3ggHMhBDLirxgO807ZY
         JwyO1GUH/1FvBe2WoqIVPkypTmgvcL7LQ3IM0D2Wmxq9Th1/O3+cba4sv2w7cUrWxuD2
         YL6OZaywAkh17tQvDY57Iy5ueymmUTPuT6Uvg26+oeP0uabEFbLTkY52OmYxxTFOMnrq
         6maQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm02J5yUQ2OQm3CfE0M5ukxO7mQdcBfP5l+KIMgC+DuLiVzqy5ucX0KtenVf39tOSRuJ2CfdCRnSIcTsMd@vger.kernel.org
X-Gm-Message-State: AOJu0YyKyEyAayroL6xDUA7EBX8p42v/6j/sGQuyIbTLoSYul8EWYFYF
	aSihi7KdJyLRe9xZcx083ebMAT9p4GAATHtHtu1a/5Axd+wgOKnuKvjuw/gqlOQAUnq2U01G2mT
	C7zteYQjv40KjG/+Wn/3SIONEIXZabQXVmO+sInXJE0whtN1ikDVREITx7btAebop
X-Gm-Gg: ASbGncvZOzsOU/T0lMASETovPs3yf3/QtfxnbjFlq9xy2XyJo9M984MXH7866q35ql3
	yiM6ftv64DJm1uzfT48XBT1Ra5DNfJXy3RO9E5tf/KMyKyqdBuBaoX6BT2S1iDRkg5Xh4vwZjoR
	k1iJLpyC2NNuUMs2sPvckxIxzzR9/s0+LFJlosjiMF+hKs3NDNwyC7s+b3/MPY1yoYEcWb09jPI
	tJziV/E9pIdl6vWoNkyD125D/0BvYbRRFZZoXdah3MUAdnd5WjBvsTZ/LtkYe5urZLdA29WeUrS
	xMioegYYOaRRyTwpdYkiwim/KmSYZMwbokCOs9PNOtiYQYpnU44XprGkkC6SoJQ/3Zc=
X-Received: by 2002:a05:620a:4245:b0:7c3:e399:3289 with SMTP id af79cd13be357-7cd010f666fmr137576585a.4.1746780845774;
        Fri, 09 May 2025 01:54:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+J/MkT6NQsYDL7XSlUAYiFpI2bUxkR6fZJcPuGNLv0URPMJ0peP3i2w8xGWlPulpMsyQ3OA==
X-Received: by 2002:a05:620a:4245:b0:7c3:e399:3289 with SMTP id af79cd13be357-7cd010f666fmr137574785a.4.1746780845419;
        Fri, 09 May 2025 01:54:05 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219348762sm120339466b.69.2025.05.09.01.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 01:54:04 -0700 (PDT)
Message-ID: <f81b3f81-b14d-41c1-9968-2d473e1f0947@oss.qualcomm.com>
Date: Fri, 9 May 2025 10:54:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-4-52ac6cb43a39@quicinc.com>
 <64893588-544f-4cb0-8c0b-7eef588468d5@oss.qualcomm.com>
 <c0ab504c-2b27-45cd-be8f-1176230b8bfd@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c0ab504c-2b27-45cd-be8f-1176230b8bfd@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Eg0Nc3h4jJTvxkeTfT2cdShYxRIpYd8Y
X-Proofpoint-ORIG-GUID: Eg0Nc3h4jJTvxkeTfT2cdShYxRIpYd8Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4NSBTYWx0ZWRfX6YHpfPhUgT6M
 hULrXzWWez2TMbZn+9JSVcA+JAoya7WAB8BfdJaGbgdXKKT35H2TpOuV0Aockb8FLn9LuaOXwYE
 wIPkfUPdIT7DEdRbdbuY6XJdp8//5QUaskMlA7Lzr1qcxRQIuB/ppigf2+B+gl3ygFHdlBLT+wX
 +DYypcykBh+lQEGVMDORdR1Y5UToAgdzFFkiypwNnC/h3mmxr1719p5ptPhUK+5opvhKaRDJVOt
 qJKW2o08AyczmnKFDmYR3OxhAnSKvjl9vrlMrkZ3dDzzV71Ag/JwQ5I1xCxeltUVlf7zTZhpXLR
 93BBbULLOOW3T9M0D4EN86DCvhTqSZLrUe/Yab+lRqZ835qH9RYXSBiqLP6LorpDyQ9pkJgE1Zz
 cH501fYii0gqlyuB6ZWvznG8XtF3DFsViTjs4+oNzssMHzTsvKgBtTjAvBUxBiXhTFcLFl7i
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681dc2ae cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=0LysrvarD7n8M2PFuPIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090085

On 5/9/25 9:37 AM, Lijuan Gao wrote:
> 
> 
> 在 5/8/2025 10:41 PM, Konrad Dybcio 写道:
>> On 5/7/25 12:26 PM, Lijuan Gao wrote:
>>> Add a simple-mfd representing IMEM on QCS615 and define the PIL
>>> relocation info region as its child. The PIL region in IMEM is used to
>>> communicate load addresses of remoteproc to post mortem debug tools, so
>>> that these tools can collect ramdumps.
>>>
>>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> index 53661e3a852e..fefdb0fd66f7 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> @@ -3266,6 +3266,20 @@ sram@c3f0000 {
>>>               reg = <0x0 0x0c3f0000 0x0 0x400>;
>>>           };
>>>   +        sram@146aa000 {
>>> +            compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
>>> +            reg = <0x0 0x146aa000 0x0 0x1000>;
>>
>> 0x14680000 0x2c000
> 
> I checked the latest datasheet, the Shared IMEM address is 0x146aa000 and its size is 0x1000, 0x14680000 is the start address of IMEM layout. The shared IMEM is used for debugging purposes, while the others parts are dedicated.

Even if we don't use the entirety of it, it's good to describe
the whole block

Konrad

