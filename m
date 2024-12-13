Return-Path: <linux-arm-msm+bounces-41973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA00A9F0A2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02029283561
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60AA1C3BF9;
	Fri, 13 Dec 2024 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iUR+GAL+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3B41C07F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734087444; cv=none; b=DT6ml4xEAeVxgd7o4YDUJeddO1LeGScdrHYN5JSTJnFiSimxajN+7vWQSgjEo6pCllyc3N2vzZNKwi971q+mtFg+w1qXmeisnkdvYAEFeSV7otu0h2YyegJKgw+6U/Opo/anlTr6pmW5hIYOAUbMaVmwsV2ilzAcqHl2oV7cO6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734087444; c=relaxed/simple;
	bh=zMf6rHS+AqdoONc4cayTqknHAIOrfVfxoxGVoT++gpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nJ662+29gtG6tqUE2QkzFLjmJP10NWusWrSk98eVuqvAZtBF3s4eeMc3XR4OrRry8QfsyAOKzoknrW3Qs5U6r4jD/8Nj//Qjz4cW9QFJIJSfL02TLxqjhiNlJphkH0CbR6ogLu3yIbQqlMGoFw/gyF9Xd8U2S9UYnqVTumj4mok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iUR+GAL+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDAgW8j028137
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 10:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JusCHnvBtzBIGRb/d57GWf9yYHTzp5QMdm9npfIyIzQ=; b=iUR+GAL+yhWTF29b
	ctUXoIJ8p3GpDIML3QTXmY6aHLkYhld3ZJVcsgyj0KjyYFFQbEH23RTOHcl9Sqyl
	m6DzHGEAGIkFOv/cSS1YMby/oDaaFvK+6Etk6zsA/sdih7z8ScIGU3i11mr/RRVh
	NX1zM5HzILUgQ0mCJIqFNszgoI8wRuXDNiyX7aezlapCHh2f3vpHjJoHFLAMgZlv
	CQ0bJy5fhzC3Ff7WritZmhMXWfRYtaxPH4walQ9Z+Am8BJpJj6AW0V9M+61o5IW2
	Zx7HVaoxKN6LrYc+MrmjJLhTBOsppHGssQw6q4qmEJomGR4+rRH8eUM7wfkIttKy
	Q6hWFA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fxw4ucd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 10:57:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467a97dec51so1015151cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 02:57:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734087441; x=1734692241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JusCHnvBtzBIGRb/d57GWf9yYHTzp5QMdm9npfIyIzQ=;
        b=wKDPQL7akZq4X6wi7bQgaYvLQ9zNmbtO2W5Ig76iwK4DcSIhw+0a8zdCBjxIUxA+fQ
         kfATiwtmF2/WBVTN+lcsnZMEKlGkqwtqyGb9uGTWEpHy9PGX/sqxrewmU4np/BrC2e8d
         suc7C92vAw+PiqbgXJTGryefyCiE3gYm2HoYjA0R8yz35O4O05w+YO9IfwPDlAteKcuu
         Kgu3A7saf0UfDiQ5iwEZCDU9+liZ5oufjlnOb5nNPGu4Zh6WKEiVqPsyNsnV4nLdquLK
         a+TRJAaou9WRTQtSH3K7RnbjKi41Va1ppp4RZkXb+ulEJ4hFQkVJGZuIXTxKUfiHupWS
         n98A==
X-Gm-Message-State: AOJu0Yws2VoHeWngvVCMYRk1GsNIs+/15gbIRt8oJtLTAIlyPLOexknz
	uyujtPPyrnlGS8NxOr80rQiKcGpfnFL3MWH7r+QLw5VF+MOBQigbcXrUmP6igplg8bZU/w9Ri0N
	wjPDDxB8vUUGDvAKhaRm/tXZXVecc0JCa5b8Y7122fzhg9XClS8S3HAaElU+hEluB
X-Gm-Gg: ASbGncvvp4tc6EIs2lGPF+3K2kCGctgmfYlPzJHidKOQoLFnD0Ct23KuFIgAQMLZ/gk
	fOvB5NsFU9jqMj4BZ0Got3wuK6vsSgTxUW8P5ZQp4w6Iugi4SAl4a276NDrvXb7KXPdZHbbkphM
	/W8V1HM+Df90a9Ec0tjZh4TTPBBmvSuUa5iJOlYFxVlqpVX3fKXR96HDRA7AmdWOblYZbol1wzp
	Bj8R/ZPUvrLckFmi7Jy6UZNqnwLpvDz9GwD40j9Nds5gauDXPFPQJE2cY3PjBzQQb8vCM+oEbcJ
	HbBYcEwuQsmPoosofSuDZR3ckESO0hI9spwf
X-Received: by 2002:ac8:5790:0:b0:467:5931:f6a8 with SMTP id d75a77b69052e-467a586e7c4mr11384801cf.16.1734087441053;
        Fri, 13 Dec 2024 02:57:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSa8UhHBfw+RnGpfBYEd5suCh19lyMpMorCOQaWkpQtF7q4Vveq1D0+NrFe8GAuyzu8dsZ8w==
X-Received: by 2002:ac8:5790:0:b0:467:5931:f6a8 with SMTP id d75a77b69052e-467a586e7c4mr11384521cf.16.1734087440615;
        Fri, 13 Dec 2024 02:57:20 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa686af6709sm701440666b.88.2024.12.13.02.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 02:57:20 -0800 (PST)
Message-ID: <a44027ee-40d3-4552-8f61-bcab77476f68@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 11:57:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcs615: Add gpu and gmu nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com,
        20241022-qcs615-clock-driver-v4-3-3d716ad0d987@quicinc.com,
        20240924143958.25-2-quic_rlaggysh@quicinc.com,
        20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com,
        20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com,
        20241122074922.28153-1-quic_qqzhou@quicinc.com,
        Jie Zhang <quic_jiezh@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-6606c64f03b5@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-3-6606c64f03b5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-3-6606c64f03b5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HrgKmSoiUAS-x2LiXvklT-WFRkCzJzQU
X-Proofpoint-GUID: HrgKmSoiUAS-x2LiXvklT-WFRkCzJzQU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130075

On 13.12.2024 11:35 AM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 88 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 8df26efde3fd..dee5d3be4aa3 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -387,6 +387,11 @@ smem_region: smem@86000000 {
>  			no-map;
>  			hwlocks = <&tcsr_mutex 3>;
>  		};
> +
> +		pil_gpu_mem: pil-gpu@97715000 {
> +			reg = <0x0 0x97715000 0x0 0x2000>;
> +			no-map;
> +		};
>  	};
>  
>  	soc: soc@0 {
> @@ -508,6 +513,89 @@ qup_uart0_rx: qup-uart0-rx-state {
>  			};
>  		};
>  
> +		gpu: gpu@5000000 {
> +			compatible = "qcom,adreno-612.0", "qcom,adreno";
> +			reg = <0x0 0x05000000 0x0 0x90000>;
> +			reg-names = "kgsl_3d0_reg_memory";
> +
> +			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>,
> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +				 <&gpucc GPU_CC_CX_GMU_CLK>,
> +				 <&gpucc GPU_CC_CXO_CLK>;
> +			clock-names = "core",
> +				      "mem_iface",
> +				      "alt_mem_iface",
> +				      "gmu",
> +				      "xo";
> +
> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "gfx-mem";
> +
> +			iommus = <&adreno_smmu 0x0 0x401>;

No LPAC context?


> +			operating-points-v2 = <&gpu_opp_table>;
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			qcom,gmu = <&rgmu>;
> +
> +			#cooling-cells = <2>;
> +
> +			status = "disabled";
> +
> +			gpu_zap_shader: zap-shader {
> +				memory-region = <&pil_gpu_mem>;
> +			};
> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-435000000 {
> +					opp-hz = /bits/ 64 <435000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +					opp-peak-kBps = <3000000>;
> +				};

I'm also seeing 290 MHz @ LOW_SVS

Konrad

