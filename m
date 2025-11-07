Return-Path: <linux-arm-msm+bounces-80717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 314FAC3F0E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 10:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAB04188CA64
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 09:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B64FE3168FB;
	Fri,  7 Nov 2025 09:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8q9+gFl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gzQcOfd+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377C82C158D
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762506111; cv=none; b=O3y5HggSWh7Tg8N87cApTLsae6iB4YcCJ4OV+7B8tJrQtahoIBm8QUFBloY4VuCKqYthEF2RYa6/FALuuXdc9g1j1FXgtZ72p42Ydvpe3f/7HnUHvdtgYaRStxMtKrR6SPzNWtz5gKMlQC1gDX8CsLQFlAX2iuzU+Ziot9PHQlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762506111; c=relaxed/simple;
	bh=/aQfrcM2kQKCDTxDcauYRDs0xtHEaIg9neX4Pe6sBlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BwvWgUbilPwoVczwFI+LScLivsGqhJ39pLhUYB2ZPS1wQypVjNY0xc+dNkwTRbS2KxqHm7Uio6a+dS7+Z1HNxl/RoilCzwGFJu3juTmG1WOBwNlQVoGnCCdVlMKg5x0FNQcQ4ZH1uS42q0CLFucvdH6cWXMIyWibHUb1VqP+t0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8q9+gFl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gzQcOfd+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A744mGA2085463
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 09:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Xwdlres7UKZJumX+U/fUtnUAYm89N+blgEZuA7qA+U=; b=I8q9+gFlQqTjsN8F
	KhoD6sB3C3NlEz+F7BhoABfsklg1CZH2Ih0raJ8k5PnWjUq6B5sux54Ow67qkL61
	g0TtnetH8cxQjfldn+drdhMRKmZMDAIHWse9W+2793zrOLb6TTTOUTO4fRAZScnu
	Gtx82Ed2i1XtACO1P62nQ1fj64zrFNTEHLWoAIp5nmGmnEoacdSgUL5dmEbFEV1d
	guk+My7kHsJq2uxOSBv5nrxaGBgrTnCk6Q3X09/70+b3bsJpOYzP5chx8A3KBGTZ
	65FgVZ3KbdbL/MzBx/Vy8p0iJrT1ZsDgcUTx8j/Yyy5dinvabtkhizkL/hht7dj9
	8N1C0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a99e78sb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 09:01:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b1be0fdfe1so19317085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 01:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762506107; x=1763110907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Xwdlres7UKZJumX+U/fUtnUAYm89N+blgEZuA7qA+U=;
        b=gzQcOfd+zYDtLNs/ad/dSPw0hwAfHWF/PYtPwqkgDG/8LbTBkU3w0FVd8+cjWdtEbV
         HHneRQLqh2xmrWs8Mmq6E3z1Q2AFA4b4cAMhAyrAa+L1DcDtutwh8qeDxCMYfZ8+4vA3
         0GuA8FkdBZUaTIHFfUgHiA1VcEll2ujGmIwurH2j4YqBa9INOfEvXeuzJVNsDBSe5Wq8
         Cub5NaTNn9X399RhWgvRQVhkc80aHVnYOmSDPNANi2muGMEql0K2XVrlf4PBM9CSni9K
         stoac6Wzd6VLuTaXb57n+lSo3fUp08gK0elfA2a+4l8U2iNu1PKivrGQMU0Xt3FbcWaR
         D3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762506107; x=1763110907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Xwdlres7UKZJumX+U/fUtnUAYm89N+blgEZuA7qA+U=;
        b=JvCdwIlKiYSvNWNELlBn694dZKBw2XMK8KcOAGIf/dykLRf1ZOj+BN/7ELdEsDnbhJ
         9bgaOtS3ECskFAVziuYxtijmnNik9HhlaU/yVPlx7EQtdBvHPe6ek9U9IjAXbkixu00u
         DggnczWzaepK4OGwnDZ2IZ9NR3gNorGv/5ruvN9zMO2PavlC1KPYUBRz3lEx2YQZz8XT
         eWheAlAnJeHvyWDBRkrncfiNjhins9LVkv1wh+2gSWLBcPj+ubSwm7LHghADkmu3gcEz
         l5a+5aIOquU48TxzWre1Gz6lYHMzoKLm3YIidqggIs1hYbEqRTAAxZgXKsyQQSCqYmw3
         FF/w==
X-Forwarded-Encrypted: i=1; AJvYcCVJmxvzA0xvi6rLgbbWLF8+/4i3zV5+XeYZ0vVRBLjVezHTRhOBcamETuJu8xVDsa7XEUGPBUgC6MG7qH+9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz73aGGJOKkj+AriNQDQfir4bOccEEdp1itJzmH0Q85PG4NSbr9
	mkyn5AnB9ztaLpwI5/9ZbzEL7sXxIn4BMD+dEN1owD04AzwAPftblcoTAlfrseZGWH/lTV60tgv
	BVjk/sUhqRby/6161BhoMPGZ8+PWKq3HQe5GCKEAboQWC68/m1yTgC6imXglJBLxJKqFW
X-Gm-Gg: ASbGnculca0OE9E5vJxobWSH3W1Hg3O0SdZdtbDZWgqPmXgL9RFfUvmXUtuSZ4s7F4n
	jC+UrnpN8zWc/3snd2mAxoWTaK8voNzP7CGFlk4Rifx6gK+B4Gdgl7F3WN2T3PiDikS0jrMOCpJ
	oKXn/4F7WrvBd+YNITrLGbya72i7AvaCi+zX5Xvr1+MYO3nThg/3orZlwTooPqp5MPmSxAd6bpA
	GDktdlQ8IGXSkMIwswdre3L2sKrAvlGEBfBSY/kLS2JHoj6FRbFZPh7/jRC7gB6wXr+3hX6p6mJ
	omPy7CnGM5B3KmTD1q8h+x53he2vUeFBbO+/+y9uoj/jVTmx3k+FK/agi/ETQIib2Lv3Xsz+21U
	YFYm1HFdHzYu+hBa35/DF2hZLOxPKjCEHRwc0rWJXRk9EOpjxapY06pXH
X-Received: by 2002:a05:622a:181c:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ed949225d6mr17918041cf.2.1762506107427;
        Fri, 07 Nov 2025 01:01:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBs2ARbegNGfxVipaDHjwLs6J9evX5dbivnH5xxAvdhKWOJJB0eRECaR784rSXA0QDalhnCg==
X-Received: by 2002:a05:622a:181c:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ed949225d6mr17917561cf.2.1762506106773;
        Fri, 07 Nov 2025 01:01:46 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d43bsm191672866b.45.2025.11.07.01.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 01:01:46 -0800 (PST)
Message-ID: <defc450a-1699-4682-a41e-59035bafccbe@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 10:01:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <quic_jiezh@quicinc.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-5-a2d7c4fbf6e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-5-a2d7c4fbf6e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA3MSBTYWx0ZWRfX28ZiDi2yanhE
 KJnG04K0B3ejqEEwwSq6Qql4WJh/0cXnhNGnbXfjKAPZKAbmlmc8cRiheqOQlI+aJOkCsmdyNLk
 AIqBlGVr0VjpRMNGcVCQEPCmlN4WYAHa4dmFOBq6MQLxcXUb8DTEYF3Xm/RPNLIw9IhdI2w4Bdb
 mGXvtgKEreGWl3UzJIlsa+xeXm8zGmXIyElIeInjZ1nPJizlS4tQQ4PxO1SWS7IFrbiw57yUTeI
 sy5At+eyV6Tv5ptc239McVKyQ3pM5pW86Lcm1IY0+/usQlozIUInkLt6UsYc0ZkF+hiyxuwYYGe
 rnxTb5f3s5Pbt0j76dCTEL2v8iPF4dfmg6e++2bH/fLKrCEp3+iAZDRoltTfvTEXTDpkl5PZslO
 orvH32fC2kQZhHjQkrL0JUKiMHBJuQ==
X-Proofpoint-ORIG-GUID: H5FI5DZJlaeVR-mD_piSBJzxzoOw8_yC
X-Authority-Analysis: v=2.4 cv=A+hh/qWG c=1 sm=1 tr=0 ts=690db57c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=mufC2ag2MkhLk2B-SdYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: H5FI5DZJlaeVR-mD_piSBJzxzoOw8_yC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070071

On 11/6/25 9:50 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and rgmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +		rgmu: rgmu@506a000 {
> +			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
> +			reg = <0x0 0x0506a000 0x0 0x34000>;
> +			reg-names = "gmu";
> +
> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;

Is this last clock really necessary?

Konrad


