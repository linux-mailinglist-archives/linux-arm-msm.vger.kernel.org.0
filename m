Return-Path: <linux-arm-msm+bounces-47936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6410CA34B93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 18:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE9091887681
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 17:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E02E202F72;
	Thu, 13 Feb 2025 17:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n8wGfp1k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8183415689A;
	Thu, 13 Feb 2025 17:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739467023; cv=none; b=XokJcihu/BY+zVDUiqXRxBe3WQeQCXYQhLv+mMbfKAiXM2CBgAlhMqYveRk1PP2pzTLkyPb6Za2kxs04C1rzVioo9Dsle8CEJo2NOSXJgc7EA8PFS+MH6bcHe5FHcA8GgQ6Moz2W4V8A8fv+sZo9fbkCQ+Ov6EW85PfGuluFAgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739467023; c=relaxed/simple;
	bh=rwN68ZfFZpS+p7Snpl6+Vm3SkAwnIbf/+yQkfbEaAY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f1dIPeOL7QlQSjthceaOtymcNoWSgl0JmJ3T2m6ulJDNcO1yQfs3KxVz55R4aQVipuauzjdL1hthrujRTk2OCLaWO1gBL7r9ltR2eaLKEYaggfeIehDR5UXX+i2RzJF9RVfH7OiKacV4jdgpV02x7sGmyarbhsFnburef0Q0tyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n8wGfp1k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DGrp5V008337;
	Thu, 13 Feb 2025 17:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wlBFv7Tbou/aWwuZJOkNHqYSnFsBzD7OpLRH3DjcgI=; b=n8wGfp1kx+Ww46ol
	ltmCjQpJU3aOzBoaDeDY4u+maocy7k2uTi82/nUtkufbwtkHKKLndqXaOi9Y2Yt8
	+pTEg8bDooUoEpskn6yVReNONteybJLKgFXjXVZFSWCxufFQICiSBmvTaCCs/Yej
	OJ+uxVpmr5DWivVF8wbVvJCF0sDIq6/HJ5bVq9WmOyYz4MyIyaixYip2YO3aqXvV
	kuNvAewXOkCqMtQbLkxfvIwMyxESmZKzl887iFr30MO2PE2gVQA+FBJA/ga08qeH
	kikHG9YSuY+Ueef5eSeZI0YvRVshrHGb7NhHKlKG9EuXHT6t5foSc+PmKhlDN6WW
	KolIBQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewhbm77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 17:16:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51DHGlHA013022
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 17:16:47 GMT
Received: from [10.216.44.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Feb
 2025 09:16:40 -0800
Message-ID: <30c91617-8307-4ea5-8a56-4b3b987f2bdc@quicinc.com>
Date: Thu, 13 Feb 2025 22:46:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Jie Zhang
	<quic_jiezh@quicinc.com>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-4-993c65c39fd2@quicinc.com>
 <p36nz6p6bbzur7uoitbzc63hv4qf7hhsix3mqa36igarasj67b@evcdfpeybgsh>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <p36nz6p6bbzur7uoitbzc63hv4qf7hhsix3mqa36igarasj67b@evcdfpeybgsh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5TEdcz_SSSncZOitpVLLRmj3C4D-DxYh
X-Proofpoint-GUID: 5TEdcz_SSSncZOitpVLLRmj3C4D-DxYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130123

On 2/13/2025 10:26 PM, Dmitry Baryshkov wrote:
> On Thu, Feb 13, 2025 at 09:40:09PM +0530, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add gpu and gmu nodes for qcs8300 chipset.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 93 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 93 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> index f1c90db7b0e6..2dc487dcc584 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> @@ -2660,6 +2660,99 @@ serdes0: phy@8909000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		gpu: gpu@3d00000 {
>> +			compatible = "qcom,adreno-623.0", "qcom,adreno";
>> +			reg = <0x0 0x03d00000 0x0 0x40000>,
>> +			      <0x0 0x03d9e000 0x0 0x1000>,
>> +			      <0x0 0x03d61000 0x0 0x800>;
>> +			reg-names = "kgsl_3d0_reg_memory",
>> +				    "cx_mem",
>> +				    "cx_dbgc";
>> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>> +			iommus = <&adreno_smmu 0 0xc00>,
>> +				 <&adreno_smmu 1 0xc00>;
>> +			operating-points-v2 = <&gpu_opp_table>;
>> +			qcom,gmu = <&gmu>;
>> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +			interconnect-names = "gfx-mem";
>> +			#cooling-cells = <2>;
>> +
>> +			status = "disabled";
>> +
>> +			gpu_zap_shader: zap-shader {
>> +				memory-region = <&gpu_microcode_mem>;
>> +			};
>> +
>> +			gpu_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-877000000 {
>> +					opp-hz = /bits/ 64 <877000000>;
>> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
>> +					opp-peak-kBps = <12484375>;
>> +				};
>> +
>> +				opp-780000000 {
>> +					opp-hz = /bits/ 64 <780000000>;
>> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
>> +					opp-peak-kBps = <10687500>;
>> +				};
>> +
>> +				opp-599000000 {
>> +					opp-hz = /bits/ 64 <599000000>;
>> +					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
>> +					opp-peak-kBps = <8171875>;
>> +				};
>> +
>> +				opp-479000000 {
>> +					opp-hz = /bits/ 64 <479000000>;
>> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>> +					opp-peak-kBps = <5285156>;
>> +				};
> 
> Does it have no speed bins or are they pending on the nvmem patchset?

Product team hasn't shared the details of GPU SKUs or the SKU detection
mechanism yet. The default assumption is single SKU.

-Akhil.

> 
>> +			};
>> +		};
>> +
> 


