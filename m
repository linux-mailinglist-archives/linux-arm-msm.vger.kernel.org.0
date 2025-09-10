Return-Path: <linux-arm-msm+bounces-72985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB83B5173C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 14:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F5041C82E42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 12:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4464F27603B;
	Wed, 10 Sep 2025 12:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eb/iU509"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF9830FC19
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757508530; cv=none; b=FfjETbsVcyjhCoE9bBXOqcj1eou5O84Tc3jaRcz6q2/Yfx4zoeGZIo90P9NO96SjoJtQjCuwA7ABiJDTdegTRsa67ip+TRmWdVtCEzlsfwPvOH4ma6giksJIceNFHkUYJmWIgHYu+9KVWufK9ykDAv2t8zwCh+NhIvQdq6wioME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757508530; c=relaxed/simple;
	bh=Sa5XlTaknz8Q2bGhSjnRD0BypV8mOQK0jc3f3H4in3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z7W0b6+rFafKyzXiUl1MJzHyNZUN3zlx3FxwEYWHjGjobK4XDmEdYHLgZXh9fr0Zy+uOTucL9PwlxhwQSEa/094INZxbXybpHoS1BEFuBnZT2TprW8qvDnqThngXpeipYi6byhqKBPy2dwMx1qYdQdsskaOM0OaLsIFkygMZNCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eb/iU509; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgGWC023740
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 12:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2hLzDCHQ287+835m55C/xeetdRQfkul00hmOXMYpJPE=; b=eb/iU509PSQTrGCB
	gdxgseS4bxmqf6d5tCf6/BZIv7GJhIiXcJ7IDFYc1VPr0rVPsBaZoFxQckC6ChUO
	8xrxv+71kRnFabbee08/GiUHWb5FIYLLyzEJsb0MFYUZmL/r4FXK0l5oRoiQk4UG
	H1gn7e0SKV37BmH6ssECSBzyWkgnA4Z2UBH6GHV6gQ+Ikfx31PEOlQHbWPxlEQMw
	8XveI8/zo+/rblh0B+Fc5HRAwfRRs2qobZBldpVhJIoLzlq4BUlPzNWVRmsoeSs3
	tbCgv858lHWRhFV3vDyJF1UbWr6b3LbJHfM05+5NMoeddvMGdQbXLrqTX8qBRUak
	4apKKw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m3qhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 12:48:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b613a54072so9908651cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 05:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757508527; x=1758113327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2hLzDCHQ287+835m55C/xeetdRQfkul00hmOXMYpJPE=;
        b=hRN2fJ3FVSNxhmYsaR0aybGYKV/D0l1/mllalXtVyf3MLESNTvh53nVlv19O2QRnLV
         3KgxCpyp6oIsIU6y30rXulDiHJVCVENQe9MXXJKiEeXYJItAcHOkaMhyjfMujF+F11Rm
         SrAllSB1CuBvNP3+vmz1t+U0VCeIWxvP8JtkEFsL+YijGmtkXIADqx46pBR2EJwrbVqv
         Bpw1cHaSoa1zYc1iuWXyVYLFc3WzT1d6bWKThJIu3ulkcGp8zZf72NWI2Ii3fgHhHhv1
         uc4gC1UnZtt0Yw/8Nn3AkGCyfyIH78vanvTAVWBR75yc1i3Ff8Is5BK/qjWNCbgQa6tc
         REgg==
X-Forwarded-Encrypted: i=1; AJvYcCVpnXND8X91aSf00swTFcJgrqBPhpP7I4agxmVMT0py33BOgXQXFdRwHYDoMcg4uCzUjaVUAxE25xeVb5qV@vger.kernel.org
X-Gm-Message-State: AOJu0YwSp/jrXgQnn1LTJ2rTm8RjSSIrlQElQdcLUTtPOJxEL4YhLi6D
	CnDjRPs97KpK2EpdzQJgA/g0EfsQiWI2XYVaB1qKuaI3QuCaq59IQfxULf2LM+/aXdeM0PzYPVK
	pKA6vA0w6on5W3Dj8KpFl3Jwp0Irlg8s2snCjl4eLtheF5EWdL1hOflrfrXJIhccQfO+/
X-Gm-Gg: ASbGnctxgziI12pyTOkHmaN0t6niMM2B4Aou5ndjQkN0EMUveLuL16HcxE2AVqXPrf8
	PrkTzVD+BZeomobyXw29MvFlmtKidYQDTeXm22PJ7MHNkK5S9yHQ3j/3JCVlY0MybCRleSlP3Re
	Fm/IluPJK6PRc2MiuXDhqQySwn+qEhFLlz6skEiA28hIsIAxHbncwBTxu+d98x2Y3LQ3g0I5kSr
	wwnUwwfb8wsFyrQPLPfG/16j2KSzzQzNPgBPv9CLQI+ObjUwzaspJaaNg9w1tYn1ngXJAWYyzKy
	9vOKOBSsiKqU/p7N4nZvQtzp1Lpxq46zY3BBx81CIzM7THVmRYGJHvRINv14aLfeq7l8/qg+qZJ
	3k1XTkMltaH3ZDpq9ymJdUw==
X-Received: by 2002:a05:622a:19a7:b0:4b4:9070:f27e with SMTP id d75a77b69052e-4b5f826059cmr106840861cf.0.1757508525904;
        Wed, 10 Sep 2025 05:48:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQJJlCuiyW/pcIWNAfk0Cxu+p3Dd7IMOZXLW6sjV+Sj7pqR7+0vV4WzKU91XkLNccK+WxwgQ==
X-Received: by 2002:a05:622a:19a7:b0:4b4:9070:f27e with SMTP id d75a77b69052e-4b5f826059cmr106840241cf.0.1757508524991;
        Wed, 10 Sep 2025 05:48:44 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0783049ecbsm163687966b.8.2025.09.10.05.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:48:44 -0700 (PDT)
Message-ID: <9463ba5b-f305-47f4-854e-2ba0dd41bb32@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 14:48:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
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
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
 <20250910-a663-gpu-support-v6-3-5da15827b249@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250910-a663-gpu-support-v6-3-5da15827b249@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX/F05nUgCl++i
 HCMcVNTCgb8F68VRnqJRMkZEs/lp2eRhHXUn3IgXslYDbF+sB3tmRKAgd2jPcIbfF1h/KuTUSiA
 GWIATn8RLGc3WDwcwJp+RMLqedd8sleu3Op0LY1dlnNxvIWSxSsXf0DbbXzn6vTNaHkbh0qWTqc
 FmFpiX8jdMEpDcFSPAynFoCg6pqfDVm+uhxNKDJ0XCZ4YfNfdhLfDe3H7m+UcwCwmBnw0EJsdwN
 GASL5Cv2LvU6Y9m87vkVYFr0fVH5YoErO7JPWgPthGEl+ti9/7ghpmDQgRQM4Ggc/KElkbu/sQ0
 EX6AwdsFiG72QcDvWVsw9KWiLnphj3VitpQ+WfqJWtrbGF2tXa1L/WAWlgSRNQ8SkWfUtOTOO3J
 xx1fJtQL
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c173b0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=EGTmXSwiq2C_3XJcCkUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XFQkT0ewiGbUzAFOgCVQQEU7c4iwPHFN
X-Proofpoint-ORIG-GUID: XFQkT0ewiGbUzAFOgCVQQEU7c4iwPHFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On 9/10/25 1:25 PM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Add gpu and gmu nodes for sa8775p chipset. Also, add the speedbin
> qfprom node and wire it up with GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +		gmu: gmu@3d6a000 {
> +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
> +			      <0x0 0x03de0000 0x0 0x10000>,
> +			      <0x0 0x0b290000 0x0 0x10000>;
> +			reg-names = "gmu", "rscc", "gmu_pdc";
> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hfi", "gmu";
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_AHB_CLK>,
> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;

Akhil mentioned offline that having this clock under the GMU node
is a hw team recommendation that's rather platform-specific

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

