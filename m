Return-Path: <linux-arm-msm+bounces-55984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 558A9A9FC17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 23:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97863189BDAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 21:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1A11FDA8C;
	Mon, 28 Apr 2025 21:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNTaQp8O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A861F4720
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 21:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745875180; cv=none; b=f7CBtuGbrbijgLON2bF7FiXBQIvoHvMJZMh4yWIZhVOO12uRc3lfixYCiUdJtF9CoyrtzxIXixThp91CHb8GYP8MnOoqn7Gu3cRbjFamsQINirqmQEWKWgLIV3hCULrDTAQAmFvpYbhVCNToOaprISv8g1JG46iGd1/X6hK8xYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745875180; c=relaxed/simple;
	bh=bJ/gzAeGT4ZbtCzt+JdrNTwkoS1y+gkxREhjPG/Ab9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ioqCW9pYm8LBXo3MOaqj/0gUemjpEJtf9nyAt93ImGn0iPqHi7QLKau5NTEzMLFFtkDppEX1yMBpp2F4mQW6z4eP/kxFyruMIV9PvnXmXS/8sM0zcqEp5ZrL2qMb56ameYY1hyDF/ijZjMaXJN8FkBZCGOns0qB5XhtKh2MvAiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNTaQp8O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACVh9023775
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 21:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1p0DQQl3Uv/CeewEIX8WmFJDpqWu+zknhFq+jDxcqzs=; b=eNTaQp8OWPZ8bjaJ
	siO4gZnXx47CjAcBmt71c18UjDCk4ZVh/jMyqSEZUJzIvyn/7fefYAXn/pYrF1bl
	p2KMxaJaRMThp2AKhC59qPuHUKcQGa4trnmhLTtIiY/T6e3EOD5T/a1bIHPuplle
	XPySL3CsCCVI21Q0dsmwg8TjaTRk3d2xk+CDoE2Wmci0cdhAR0yNWZtf8sYTQ4CV
	0RiX4tWV2+LjX2zdXzHlspi9TvxrvSPJkeaddZ5dALUxBNAif1H2ySlaJ0MlfiKW
	LSV5Ro3kfMHAOT55MgOnsnVtbBSI234SnKXf1Ns8JdkigwMqJCWzaxtOFUfhwIHS
	h6fGvQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468ptmjdrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 21:19:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476a4a83106so6762761cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 14:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875177; x=1746479977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1p0DQQl3Uv/CeewEIX8WmFJDpqWu+zknhFq+jDxcqzs=;
        b=bflOkrOPng8PgI7tFVNKCoqQ1pN/g5miTsxanIgm5YCkkNiRWF5boKSHhf0wlp5VF8
         s032lApXlWCPT0pFt6eP5gyn4zMmVlziq7vlwbW80ocFP9/bD6L02UvvDgZSId9eFchq
         eMG+jIOOtiwVQ0R9SrcfVt9jGKSPhn0aZNrqO2SOMJ/GaOgLA4kMLCyV7rhHhBpBe+sr
         CwEum6KEXFXj3sg2SmfnLSfXcNlTXMApNpcy74oAABhS/oQbWeJwCQeZsWnHtD7/RQQ7
         jUlUUI/sxQJxNcSCdUywgSyouaVbpAIzI8i6VQsK7o6JoRqBnvwIL6DalOm/pt3P48Ds
         tUiA==
X-Gm-Message-State: AOJu0YyB32PT7reUl105zd+x6xXVCvYvEUX9ht8Y6WVKxQFn9gZo5Fu2
	MBPmCGQNA07NrncKUl3+RXWf7VdsR++IILknnG7eL9FpI91/q2u8YCHjNR40NifjStSS0DZjLzb
	0neyDRsPmDwtYzztbFDybjwtNC8d/l/H+yhx7BlFKurKsveSFJF+kq/ENGkOCirF2
X-Gm-Gg: ASbGncupTSytqi7EUnx8IdTltiDTI0Z3GalAMy+fqapMXe2647dPFBOOvDkinnX96C7
	5gnDbAps9vxeCxJonHJxkZOcBxZTD/9hwQr7fQhZagvuaFPrkGt6dtlLy0PdJwFIj25tEjJ8P2F
	KUjrgwi2iOvZfuOG7voVZPgaGsrtEg42X2i2OpW3MrvEz4UayNGA5pIHyCBLHSGhwkl+PqbU5vq
	oS4/p5qTozy2nXDwDs4IrK0QjhOrytNby0pC9SlpRzNEcombypUnXv+06/dOPJ+7Ktw+tcgEDW1
	zzJJsqjdGTk5fzMha4FGVHPZx1xBeudb54A74p7g3oRWfAsunE6kxb8XhdCWTZanpQ==
X-Received: by 2002:ac8:5d43:0:b0:47a:e81b:cca6 with SMTP id d75a77b69052e-4801e5ef61bmr86239971cf.10.1745875177214;
        Mon, 28 Apr 2025 14:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHGM4Gsyyf3DoqVCxTr5c/Fx29SX0hifWAwRSJIcxlPqb02dtB8cwcCNR+5BkrZ9k/UWtLcg==
X-Received: by 2002:ac8:5d43:0:b0:47a:e81b:cca6 with SMTP id d75a77b69052e-4801e5ef61bmr86239641cf.10.1745875176771;
        Mon, 28 Apr 2025 14:19:36 -0700 (PDT)
Received: from [192.168.65.47] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41c431sm693197766b.18.2025.04.28.14.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:19:36 -0700 (PDT)
Message-ID: <41df5398-79f6-484a-8ad3-f3488eb1b71c@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:19:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-5-aea654ecc1d3@quicinc.com>
 <e22daaae-57fc-4523-b594-87d202d255f3@oss.qualcomm.com>
 <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aa8ebd50-683b-4043-9494-5675a2d9a01e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j0rCGKfDzfbQI2I60mPokibXe2G4wtbR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE3MSBTYWx0ZWRfX44mQzW3JouW5 3nXMTjOdAldCfeYw5FwpwN51Ybg1zK4BYwwBNzujzbhgR1B4APqXcWlEIuO3C5IkNKcvuu4eFsR LeggOMApBUTuap8UcHAxYVdW8qgdjk0xY2wiYpjsNKa0dm4VVP3tFH5KIADUILGm4YFh4xIacht
 OiYMIkdxM+GgOX5Yu3q9dPtcQrRKtHA3QW3q2MrooEWCHLEj2DitMuBu0EcbEW2gJT1mIjcDopx f2i5vj2+9GcICeEItMfsANkJ6ViqbFn11uND/REiarDfX5FaIVxr9f321JIPjCjULwcNw3PXy// TFnFB4q+8i4zu4xdbGrYFBckmQ8ZxzR5VSU7FuZVuH1rDFj6ObYW4V5mvvl3BK4eMVRs/4CxcY1
 jCcnZhUbgCLEmQrKP05O7rXqWODY9OR8Yzo39MHkiIDxPuZgjv16GxUKL0QUpzf7VHwR2fiv
X-Proofpoint-GUID: j0rCGKfDzfbQI2I60mPokibXe2G4wtbR
X-Authority-Analysis: v=2.4 cv=DKWP4zNb c=1 sm=1 tr=0 ts=680ff0e9 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=dalwKpVopYczjXflRRgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=663 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280171

On 4/28/25 12:44 PM, Akhil P Oommen wrote:
> On 4/14/2025 4:31 PM, Konrad Dybcio wrote:
>> On 2/27/25 9:07 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Add gpu and gmu nodes for qcs8300 chipset.
>>>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +		gmu: gmu@3d6a000 {
>>> +			compatible = "qcom,adreno-gmu-623.0", "qcom,adreno-gmu";
>>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
>>
>> size = 0x26000 so that it doesn't leak into GPU_CC
> 
> We dump GPUCC regs into snapshot!

Right, that's bad.. the dt heuristics are such that each region
is mapped by a single device that it belongs to, with some rare
exceptions..

Instead, the moderately dirty way would be to expose gpucc as
syscon & pass it to the GPU device, or the clean way would be
to implement an API within the clock framework that would dump
the relevant registers

Konrad

