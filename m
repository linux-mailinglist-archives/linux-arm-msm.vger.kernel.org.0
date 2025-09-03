Return-Path: <linux-arm-msm+bounces-71870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFDCB421E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D9B77BB6F4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4010730AACE;
	Wed,  3 Sep 2025 13:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7fAWz/r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4463093D2
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 13:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906607; cv=none; b=TRwvQciIkUtyuYEuixrpTrFB9pxUDTbqTmraDkSaatG0fPKWLRhcNJqlx0bP1/Ow6X1ynYLyxn0nZ7mdwpNXF4uDRgBV2L0WfkZ9wAX2HMmlVT3paPIbPUK8VYmVVQV7+VsUkmrvEPGfb8kHXJ0jpUBigWGaMC6qC/uk1d7iXmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906607; c=relaxed/simple;
	bh=hNsS2uc9yOMQ2NSuhnYTKcplUu66M1ylThnjBJY/bbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lOuyKyqag1wt84w8+s4WgE4exWzLFlb1LWbroQD3s/V8lv19RiFlfdlep2xgVMHoye0eX8EIKoNPiRL2fOcyW1S8UOCnR0HCG3H1VPynWeDh6lJaCoMf8YmdiebMvAxcsPbY7aDmq5IFVqVoXOSKuLLwuImnDeI5Sm8lm5WoqsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7fAWz/r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEqoX009341
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 13:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lN8gdknZMrOiQok/7MvQU3sHMt/V6D5KvcciwLonHIE=; b=C7fAWz/rbvK32/ph
	nAkHjns/kz0KodePUhe9V5KmdHJ5AEnJnJyqRlkMQpyXEMZ6OS1uP0tb9jcmByBh
	iv4TAlYU1/i3LW8nUal8SkvnEvJK7aqhA4umZZ4DYWdO5/3Kc+fEC0E+sx1pzLwR
	sIGqboGIVun+G4ER13ZhrKdVqZlcuiBEAmbcRPzm1LW8bJ2pOAxmTq910/s1TnOx
	Rqmdv3ezfaWdGo2bHT1yPXUm62Qfbo3KbJ1AUFA/enB/5xmPOJje+njoYDPF3W+D
	D6dCkoOwRbBB2GWqs/KbMQFGvodjMJnFxcAjycmVk72zQB0N4JXjyJb0TXI1yAKa
	bz6OMw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8us0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 13:36:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b32dfb5c6fso15861691cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 06:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756906603; x=1757511403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lN8gdknZMrOiQok/7MvQU3sHMt/V6D5KvcciwLonHIE=;
        b=jiO/6FjwAoT8ItUFdSSS2SDfV04wJfhAm1SnuAryfkDiAvafm6QMZiL77W79W9FnMO
         rVjPHGZYWEXbmW6mK2GpFxsw78ujkyvMkIKgRW9QHrQAlqkXnQfMu2mAoC4GCR7MemWF
         jXF9pCzvJwXvMaHmBc2StiHOtCO7BDx6iLZXmk7VB6S4WwRlSij4LHSZtXUSgXaTf/2F
         ZkZ/h2iKP/B19koisS//cdOq6++OUA2AghVFWHVPnsM7qpN/f3lthBpXj9fWeQMlI8HM
         uQ5pOR5hTuJPMxFYkVmPNSddhjaetQ3tofu2yY0dArkOOHEOKiGibpbqyveRVoRrcNSv
         T60A==
X-Forwarded-Encrypted: i=1; AJvYcCVvwh/0PAdigDYmzTq9JEvD4OzvBrgmWiQr2RGNWHJ26VNYIKZwMN1PMQlKlagM6vLOmA0w3l0DVNtavBJq@vger.kernel.org
X-Gm-Message-State: AOJu0YywQ9nm3TVx5sSk5TwTPoS3rbraN12nl+uVLzlzIUTRRt7t101q
	7IfjH/vHtGMLQfEo4HG72kt5jUhd8lRthaISBu+Cv7iUeZZjcSiwTg1TQaJPDZL2IjSUnLPiiLQ
	ehQG/bn6MDX3HReMWLtcE5HclOvqka3Kw1j2ffUGgPMtUA0JNWFeuJc1tU9tr2kKDoeGy
X-Gm-Gg: ASbGncvOREhdxHh+cXR8U/oopE2H+sOQIoWiicSdTnAViQMePl/YJrXnJjv+DywBYSI
	gx5bIdDBTcZIcssKf5G1XW5Vf4JfmjbgNxWSsHf+Sz/PszMhLIDcAlqUyuGKuw8mtIVzLDgn7tl
	8MfH9cNuFe2rz99+1DtTXiMjQeB5UDhed+8NWfX1OeUYveneADt8zRXgV5BLFTgg0wCcCxF232U
	VpbucikkP0YFk0evVJvJuuOt+aGx+kpL6T2arSzE6GKGhRFfVgkkn/2eT6aODqV9u7EjwqmyCpb
	9+K15/2tj9Mn+zS2t8PuOn/nwlOW7KTCMO/TYqOnCWyCRZDC7ZjxRD2piNvsaP1yLuR677bEeor
	Aebb5dveQMtDuGX/x7NT7YA==
X-Received: by 2002:a05:622a:4506:b0:4b3:4590:ab74 with SMTP id d75a77b69052e-4b34590ba5bmr55006811cf.13.1756906603087;
        Wed, 03 Sep 2025 06:36:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErXOAvUamYTNZwdXsoIgSgCVJyJNUAEhsmG6GIw8r9rMGaKeXaF6CVWYD77CBPNPOt2y9/Dg==
X-Received: by 2002:a05:622a:4506:b0:4b3:4590:ab74 with SMTP id d75a77b69052e-4b34590ba5bmr55006561cf.13.1756906602636;
        Wed, 03 Sep 2025 06:36:42 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0423ed35e4sm805734266b.25.2025.09.03.06.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 06:36:42 -0700 (PDT)
Message-ID: <f169be5a-faa5-4824-861e-27bd2083b9cf@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 15:36:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
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
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
 <exkrgx6rdotfrrsnklsd7zk4ydehsk5vaoevibpqisyq2dwbd4@sa4kgnuexlna>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <exkrgx6rdotfrrsnklsd7zk4ydehsk5vaoevibpqisyq2dwbd4@sa4kgnuexlna>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5hWywF1aRNaCW4IclxG1l2Ny6Z-T8xsY
X-Proofpoint-GUID: 5hWywF1aRNaCW4IclxG1l2Ny6Z-T8xsY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX5MpCl9XZmAqr
 JN6v5QjgE9wwekGDKEw7m2aKwvDjAR7lg/nGD50f7PM2b5QniWPQx6xPVPKb3MN56C8Vm2LDulV
 Lxu0H10+PcMZXuBLr1kAYyY0f8kmyMDPJjdrtUsZ+oNrbpEITSSEBhmaMO0LPOLNBOKzgUO9cVc
 c6+7v4HfRMO/OwFyeZQ095lXB1rrTz/JevTux6qHfhvw6XFSYDDy9/zF2eTe5vRN8CrWfcv4Ar0
 nVNT1tCA3ZqiW7/nngWio4fqVID6yVkPRbqKLfp82RahWitvbE0O3JTNGag2zMpUkcyGYHZtkgr
 EvU9rOhn6MZpmEnNZCL2rhZzmvCZKwiWYYK6WlKSzLmkhWLFvRnI88ySqUnGOY9dLZceeSBLPTG
 viIziTX5
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b8446c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=azIdKaGB62pXRnNptYYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On 9/3/25 2:39 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 03, 2025 at 02:26:30PM +0200, Konrad Dybcio wrote:
>> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>
>>> Add gpu and gmu nodes for sa8775p chipset. As of now all
>>> SKUs have the same GPU fmax, so there is no requirement of
>>> speed bin support.
>>>
>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
>>>  1 file changed, 116 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
>>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>>> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
>>>  			#mbox-cells = <2>;
>>>  		};
>>>  
>>> +		qfprom: efuse@784000 {
>>> +			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
>>> +			reg = <0x0 0x00784000 0x0 0x2410>;
>>
>> len = 0x3000
>>
>> [...]
>>
>>> +		gmu: gmu@3d6a000 {
>>> +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
>>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
>>
>> This bleeds into GPU_CC, len should be 0x26000
> 
> gpucc is in the middle of GMU, see other platforms.

This is not the case here

Konrad

