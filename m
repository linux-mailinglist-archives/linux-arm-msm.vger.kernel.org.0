Return-Path: <linux-arm-msm+bounces-44473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AECA068B7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFA3F3A5BCA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 22:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D8E204696;
	Wed,  8 Jan 2025 22:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OUjVmmwb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A6919EEBF;
	Wed,  8 Jan 2025 22:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736376370; cv=none; b=LGe7HhKBiPle2+42yUn2ONXHtcC97hqQU/RUb3mBTeQ8pcvEuxaKyaM597F3uvV6O2bdcyVX+mt7YK12gHcUe7/pHfJaQxOZO71fREanfHIJQBMwBHRVCuKu4zl4pl1yH/OeFzeUzj10YP2YVFJqAniVd84tlugbibyC7Y8cJVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736376370; c=relaxed/simple;
	bh=w8bxb6ilZ9IDS34HLzXsec2jElmY4SowxIlAaIdcvRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gULIu0NJTqPICJ0SrUNsyoi0Wyeob+xPyR6VnL8X9aoUAR/Z1PzY68UQcVpokR09j7f1qJFitQGBbj89zLZc8caC7jCYLMH/ZCv6U1vQu/71WGKxsdn1kTxsFQoy8JqaJUmhVJQRTx5o1pkgQ99K0ud4zkSDLPDS3MbkdS8kVAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OUjVmmwb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508IgkAZ007921;
	Wed, 8 Jan 2025 22:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bur4ZcCFZ2/H4vqAdIWDy5aNtTYuEzsSM7ryaZvbGH0=; b=OUjVmmwbSwwfy+gP
	TQrVN9iwLkTz+lh++h8t8cN0O1zldCRtWB2Snr6fDdBgan2Bv5p3QO6G+bRR/hv5
	KWtdiqSvuGJs8LW6yxKePGOqXHbCRUOQeS5NQ/73V/RWLqpvWEoTXR+jTjaX9FCs
	aJ5UZw1xEwBU81iK+mrCWNgOvmPEQZ3Mm1NNTkM2nyMuIcRbppmdIm6WC24pW6bP
	E05kxHTryEuwctyCK41g1Op3R5sxdI8EMXCvxWLknYIuHza0BYFy6hs7w92llaYx
	0RV4GVrbjosBdnzIv/5Bv8yuWRokaN6BlnoVJZIf4lNQzywykoHfw9sX2tiJWLjR
	ftBXxQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441xvnrfxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 22:45:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508Mjrbe029304
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 22:45:53 GMT
Received: from [10.216.24.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 14:45:44 -0800
Message-ID: <aa1695ed-729a-4612-b322-3e9d6571264b@quicinc.com>
Date: Thu, 9 Jan 2025 04:15:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 3/4] arm64: dts: qcom: qcs615: Add gpu and gmu
 nodes
To: Bjorn Andersson <andersson@kernel.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jie Zhang <quic_jiezh@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-3-47f3b312b178@quicinc.com>
 <y7rf2klosrpvr5foroilgma5rwmlyq4ux5zymxd5cen7d6yu42@xig34xs6whtg>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <y7rf2klosrpvr5foroilgma5rwmlyq4ux5zymxd5cen7d6yu42@xig34xs6whtg>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AxPjlFkWxZbrL_x6PjbLuB__Y9aoFei4
X-Proofpoint-ORIG-GUID: AxPjlFkWxZbrL_x6PjbLuB__Y9aoFei4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=929 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080186

On 1/9/2025 4:03 AM, Bjorn Andersson wrote:
> On Fri, Dec 13, 2024 at 05:01:05PM +0530, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add gpu and gmu nodes for qcs615 chipset.
>>
> 
> Please resubmit this in a series together with the gpucc patch.

Sure. I will send a new revision.

-Akhil.

> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 88 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 88 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index 8df26efde3fd6c0f85b9bcddb461fae33687dc75..dee5d3be4aa34dd64864b6fe32ad589abac99bb7 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -387,6 +387,11 @@ smem_region: smem@86000000 {
>>  			no-map;
>>  			hwlocks = <&tcsr_mutex 3>;
>>  		};
>> +
>> +		pil_gpu_mem: pil-gpu@97715000 {
>> +			reg = <0x0 0x97715000 0x0 0x2000>;
>> +			no-map;
>> +		};
>>  	};
>>  
>>  	soc: soc@0 {
>> @@ -508,6 +513,89 @@ qup_uart0_rx: qup-uart0-rx-state {
>>  			};
>>  		};
>>  
>> +		gpu: gpu@5000000 {
>> +			compatible = "qcom,adreno-612.0", "qcom,adreno";
>> +			reg = <0x0 0x05000000 0x0 0x90000>;
>> +			reg-names = "kgsl_3d0_reg_memory";
>> +
>> +			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>,
>> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +				 <&gpucc GPU_CC_CX_GMU_CLK>,
>> +				 <&gpucc GPU_CC_CXO_CLK>;
>> +			clock-names = "core",
>> +				      "mem_iface",
>> +				      "alt_mem_iface",
>> +				      "gmu",
>> +				      "xo";
>> +
>> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +			interconnect-names = "gfx-mem";
>> +
>> +			iommus = <&adreno_smmu 0x0 0x401>;
>> +			operating-points-v2 = <&gpu_opp_table>;
>> +			power-domains = <&rpmhpd RPMHPD_CX>;
>> +			qcom,gmu = <&rgmu>;
>> +
>> +			#cooling-cells = <2>;
>> +
>> +			status = "disabled";
>> +
>> +			gpu_zap_shader: zap-shader {
>> +				memory-region = <&pil_gpu_mem>;
>> +			};
>> +
>> +			gpu_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-435000000 {
>> +					opp-hz = /bits/ 64 <435000000>;
>> +					required-opps = <&rpmhpd_opp_svs>;
>> +					opp-peak-kBps = <3000000>;
>> +				};
>> +
>> +				opp-500000000 {
>> +					opp-hz = /bits/ 64 <500000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>;
>> +					opp-peak-kBps = <3975000>;
>> +				};
>> +
>> +				opp-650000000 {
>> +					opp-hz = /bits/ 64 <650000000>;
>> +					required-opps = <&rpmhpd_opp_nom>;
>> +					opp-peak-kBps = <5287500>;
>> +				};
>> +
>> +				opp-745000000 {
>> +					opp-hz = /bits/ 64 <745000000>;
>> +					required-opps = <&rpmhpd_opp_nom_l1>;
>> +					opp-peak-kBps = <6075000>;
>> +				};
>> +
>> +				opp-845000000 {
>> +					opp-hz = /bits/ 64 <845000000>;
>> +					required-opps = <&rpmhpd_opp_turbo>;
>> +					opp-peak-kBps = <7050000>;
>> +				};
>> +			};
>> +		};
>> +
>> +		rgmu: rgmu@506a000 {
>> +			compatible = "qcom,adreno-rgmu";
>> +			reg = <0x0 0x0506a000 0x0 0x34000>;
>> +			reg-names = "gmu";
>> +			power-domains = <&gpucc CX_GDSC>,
>> +					<&gpucc GX_GDSC>;
>> +			power-domain-names = "cx", "gx";
>> +
>> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "hfi", "gmu";
>> +		};
>> +
>>  		gpucc: clock-controller@5090000 {
>>  			compatible = "qcom,qcs615-gpucc";
>>  			reg = <0 0x5090000 0 0x9000>;
>>
>> -- 
>> 2.45.2
>>


