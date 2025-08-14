Return-Path: <linux-arm-msm+bounces-69121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF649B25D01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03F1516179E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 07:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667A2263F5F;
	Thu, 14 Aug 2025 07:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UJEXMVqL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C677B255F31;
	Thu, 14 Aug 2025 07:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755156066; cv=none; b=NwMLtQog7xsr9e63w5+qe0mWqpBrZdFZfDHYmZjvVecaQxG+eeFHI13EIavbv++RyZPa/Y14pEH9BmMH8WSv7aFBSg5HgugekHzdtuxIrXXfNZzRXMs2BJVSm+8WZiazhh0EFi/FEOjCoBFGpfDmYRtD5o40ieoWTLANNpoZRFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755156066; c=relaxed/simple;
	bh=QVWJfxryv5an2qu/yYFf6jH5snA22fzCZz+X9kWErqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PPqLHBzRplgvJGqzGYfLm6pwfxpmygc2Pwt2Vxntng3GEhBlxUv6nPcbVUPGhqWAEuZ8uv+KpEH/HFSLbnpuo4bvvmY9LMWQu+5CPdMfTLRsP3S4HLsCmzGndTGB6N9Opi7K0zDPGzGFu+8YfgCJjV2bcfyXQSgTGMQsTPy2sfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UJEXMVqL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DLkD4k031974;
	Thu, 14 Aug 2025 07:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RsScPcpy4lyc0qyWfKF/vKWfu+4Gt4nFM/6cBTbAPSw=; b=UJEXMVqLLcZi+p3N
	A2lCRP16sPiscs5eIT/WBC+BLzjgjQz3HwTkUl/mEyfXFs95l3YC3XFmZZaTrWy8
	Z0q26ZpvykYw1yEW5W+wmowIocUU2RWgw1qvoZLNWyyW7D2ZM/GdvDSKt7ZvoeVZ
	DOOXWO8ppvLnUQmnmW9fpe6gSqOarUV/QCxKXX9ULJvQlsSK5ip+gizxxZsZZb+L
	TBiT3oN2bSKldWGUZpa/ABlXTpfTq/7Obfe6VudWCtpAoiqISX3SKc9sU7nCfHEy
	XYJAtk33KfZE3y0atJjlN6rzhF3OrvvTwW2pycCVTO63qp7ZJAhjr3Yr8t1CBK74
	cryiFA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4jq28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 07:20:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57E7KSFX021991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 07:20:28 GMT
Received: from [10.216.15.102] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 00:20:21 -0700
Message-ID: <bc001360-1cfe-4886-a023-367a8edc21c5@quicinc.com>
Date: Thu, 14 Aug 2025 12:50:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dts: describe x1e80100 ufs
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>, <marcus@nazgul.ch>,
        <kirill@korins.ky>, <vkoul@kernel.org>, <kishon@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <andersson@kernel.org>, <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>
References: <20250814005904.39173-1-harrison.vanderbyl@gmail.com>
 <20250814005904.39173-4-harrison.vanderbyl@gmail.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <20250814005904.39173-4-harrison.vanderbyl@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YSxe04GFzNwz5z3pryrGGbxCF4rljt4H
X-Proofpoint-ORIG-GUID: YSxe04GFzNwz5z3pryrGGbxCF4rljt4H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX7ifYVO1VrwO9
 2uaWKsyal7TYIgXXTDi76hHS/MDZcG5/kwWI8LvPyih8rS8SUwv2m9/RdrKv7CB+5QqlgJJu1tI
 kCBeRajqk3vMF041wqz+XxZjZImXndbDYYiJDjSaQjo4At/aOr3NVPliiLTrX5s7Tydf/3u+imt
 XjjlsOaL0mDzFHlzw0q8iogO4Ztdh/L7igK9STf4hMZpJzDzAgJmq3gasMwHEMuclRGDGi8Im7b
 VRPFb68lUDDuCJfXYrdVcy7C7CQ9JVzM88KRCjyk7ThV3sFwcrot+b2dwEnhKmTCzTbWyqWdXPD
 HG7AsZoMs5gTD+plgSe/1u4gW/gqnaq1v76zWo8wTNdLt0ghUYE8pBQvypHJlgdulzFJE8KoSYv
 9op27r2X
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689d8e3d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=bSFmR1_Cq-7rNE1wWKgA:9
 a=Kjs97tkqnXMi_ocT:21 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068



On 8/14/2025 6:29 AM, Harrison Vanderbyl wrote:
> Describe device tree entry for x1e80100 ufs device
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 91 ++++++++++++++++++++++++++
>   1 file changed, 91 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index a9a7bb676c6f..effa776e3dd0 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -2819,6 +2819,97 @@ tsens3: thermal-sensor@c274000 {
>   			#thermal-sensor-cells = <1>;
>   		};
>   
> +
> +		ufs_mem_hc: ufs@1d84000 {
> +			compatible = "qcom,x1e80100-ufshc",
> +			"qcom,ufshc", "jedec,ufs-2.0";
> +			reg = <0 0x01d84000 0 0x3000>;
> +			
> +			
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			phys = <&ufs_mem_phy>;
> +			phy-names = "ufsphy";
> +
> +			lanes-per-direction = <2>;
> +
> +			#reset-cells = <1>;
> +			resets = <&gcc GCC_UFS_PHY_BCR>;
> +
> +			reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
> +			reset-names = "rst";
> +
> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> +
> +			iommus = <&apps_smmu 0x1a0 0x0>;
> +
> +			clock-names = "core_clk",
> +				      "bus_aggr_clk",
> +				      "iface_clk",
> +				      "core_clk_unipro",
> +				      "ref_clk",
> +				      "tx_lane0_sync_clk",
> +				      "rx_lane0_sync_clk",
> +				      "rx_lane1_sync_clk";
> +
> +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> +
> +			freq-table-hz = <100000000 403000000>,
> +					<0 0>,
> +					<0 0>,
> +					<100000000 403000000>,
> +					<100000000 403000000>,
> +					<0 0>,
> +					<0 0>,
> +					<0 0>;
> +
Please use OPP table instead of freq-table-hz.


> +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;

For Config Path, use QCOM_ICC_TAG_ACTIVE_ONLY.

YOu can refer to ICC discussion link for SM8750 - 
https://lore.kernel.org/linux-devicetree/354f8710-a5ec-47b5-bcfa-bff75ac3ca71@oss.qualcomm.com/ 




> +			interconnect-names = "ufs-ddr", "cpu-ufs";
> +
> +			qcom,ice = <&ice>;
> +
> +			status = "disabled";
> +		};
> +
> +		ufs_mem_phy: phy@1d80000 {
> +			compatible = "qcom,x1e80100-qmp-ufs-phy";
> +			reg = <0 0x01d80000 0 0x2000>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
> +
> +			clock-names = "ref",
> +				      "ref_aux",
> +				      "qref";
> +
> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> +
> +			resets = <&ufs_mem_hc 0>;
> +			reset-names = "ufsphy";
> +
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		ice: crypto@1d90000 {
> +			compatible = "qcom,x1e80100-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0 0x1d88000 0 0x8000>;
> +
> +			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> +		};
> +
>   		usb_1_ss0_hsphy: phy@fd3000 {
>   			compatible = "qcom,x1e80100-snps-eusb2-phy",
>   				     "qcom,sm8550-snps-eusb2-phy";


