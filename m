Return-Path: <linux-arm-msm+bounces-38757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E2E9D593A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 07:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD7C61F23374
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 06:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D6315B554;
	Fri, 22 Nov 2024 06:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NMiR9sQ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53470376F1;
	Fri, 22 Nov 2024 06:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732255668; cv=none; b=FM6abXwpw7Va9SGZbeAXS4wbsfq35fkoo5Oxd2W7s2lH7tCDW9XdsDhkDvNoHkOiCHpRcG1e4P97pQYrAGvpE6prjWY+0MbxB1IE9zYvbFWFvRn+k3egSQxTGHuS2x+xD0v0ye1oFgIHi5c9Fh9Hs9TV1i10ZGzhIuZ8VhkwEe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732255668; c=relaxed/simple;
	bh=NRx+EUQMbI6onvvuBgklMuUetuKV1RjyJw+1+uiy0K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TqlAQSFrQD4q2R4SpUC7aedxEI6+Wir4jkyWUsW8oCwpuePtwFM16YE1JTi44RdvPX95p01myd/UX4z5qhw97B80z4Yixz19LX8RYHy1vQazNftkmwW/j0DJ0JKxwjX6qXu+jx0bwVt4TYvfw2kjp7F+97qsuxS2BqdDPSIP/SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NMiR9sQ1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM2Muil027713;
	Fri, 22 Nov 2024 06:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/AWrFKiGjI5jrs0RclHK9dtitiixWc5tMJZ/QlOQTs=; b=NMiR9sQ1gv0x2ar2
	cvIUbsw/wFNxaAIGXcGqYyvk4zg1IfNdB/8L47Pz48kDY4tGmPD3YFcA8kqi58Zf
	UCy1RkH2lB/N/vIgpQfhh4nolSDMIVEt1+ruZzcBIZOca0iRch4EYobHwyH+WN1F
	IvItZ1Q43UUr3d6u/hsTmggsL3CICfJnuyCOr+Fs15V7IerGZQrc9WL5SkeB3Qp0
	F4xXoV/EEFa5uuDjbLdTzgFmt2n7lNdF/fcY+OMlRo7U78tTYxreq/bas1QrVqw9
	Wfvhbq122y8Mzg5M781OCTbEFqFZqk6Qm60RB/yuhT+bJtFVaysZsgD2wBkdIR0U
	u7EK0w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432h4dre63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 06:07:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM67GPf029964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 06:07:16 GMT
Received: from [10.64.68.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 22:07:10 -0800
Message-ID: <c9971277-bc93-4e53-b20a-a6aac6df9023@quicinc.com>
Date: Fri, 22 Nov 2024 14:07:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: qcs615: add UFS node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        "Kishon Vijay Abraham I" <kishon@kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche
	<bvanassche@acm.org>,
        "Andy Gross" <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <quic_jiegan@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_tingweiz@quicinc.com>, <quic_sayalil@quicinc.com>
References: <20241119022050.2995511-1-quic_liuxin@quicinc.com>
 <20241119022050.2995511-3-quic_liuxin@quicinc.com>
 <45cb4thpg6mrtxiwdb333w2jxgtpw426akik2l3f7qv57dvwmm@kma6vrglbrjh>
From: Xin Liu <quic_liuxin@quicinc.com>
In-Reply-To: <45cb4thpg6mrtxiwdb333w2jxgtpw426akik2l3f7qv57dvwmm@kma6vrglbrjh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Q3ijIbtUjn_N8OD4cNVIln5lLAvnoS0E
X-Proofpoint-GUID: Q3ijIbtUjn_N8OD4cNVIln5lLAvnoS0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 clxscore=1011 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220049



在 2024/11/22 1:00, Dmitry Baryshkov 写道:
> On Tue, Nov 19, 2024 at 10:20:49AM +0800, Xin Liu wrote:
>> From: Sayali Lokhande <quic_sayalil@quicinc.com>
>>
>> Add the UFS Host Controller node and its PHY for QCS615 SoC.
>>
>> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
>> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 112 +++++++++++++++++++++++++++
>>   1 file changed, 112 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index 590beb37f441..ceceafb2e71f 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -458,6 +458,118 @@ mmss_noc: interconnect@1740000 {
>>   			qcom,bcm-voters = <&apps_bcm_voter>;
>>   		};
>>   
>> +		ufs_mem_hc: ufshc@1d84000 {
>> +			compatible = "qcom,qcs615-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
>> +			reg = <0x0 0x01d84000 0x0 0x3000>, <0x0 0x01d90000 0x0 0x8000>;
> 
> Please consider splitting to have one entry per line (and reg-names
> too).
Thank you for your comments. I will fix it next version.
> 
>> +			reg-names = "std", "ice";
>> +
>> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
>> +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
>> +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
>> +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
>> +				 <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
>> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
>> +			clock-names = "core_clk",
>> +				      "bus_aggr_clk",
>> +				      "iface_clk",
>> +				      "core_clk_unipro",
>> +					  "core_clk_ice",
> 
> Wrong indentation
> 
> Other than that LGTM.
> 
Thank you for your comments. I will fix it next version.
> 
>> +				      "ref_clk",
>> +				      "tx_lane0_sync_clk",
>> +				      "rx_lane0_sync_clk";
>> +
>> +			resets = <&gcc GCC_UFS_PHY_BCR>;
>> +			reset-names = "rst";
>> +
>> +			operating-points-v2 = <&ufs_opp_table>;
>> +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>> +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
>> +			interconnect-names = "ufs-ddr",
>> +					     "cpu-ufs";
>> +
>> +			power-domains = <&gcc UFS_PHY_GDSC>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +
>> +			iommus = <&apps_smmu 0x300 0x0>;
>> +			dma-coherent;
>> +
>> +			lanes-per-direction = <1>;
>> +
>> +			phys = <&ufs_mem_phy>;
>> +			phy-names = "ufsphy";
>> +
>> +			#reset-cells = <1>;
>> +
>> +			status = "disabled";
>> +
>> +			ufs_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-50000000 {
>> +					opp-hz = /bits/ 64 <50000000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <37500000>,
>> +						 /bits/ 64 <75000000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>;
>> +					required-opps = <&rpmhpd_opp_low_svs>;
>> +				};
>> +
>> +				opp-100000000 {
>> +					opp-hz = /bits/ 64 <100000000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <75000000>,
>> +						 /bits/ 64 <150000000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>;
>> +					required-opps = <&rpmhpd_opp_svs>;
>> +				};
>> +
>> +				opp-200000000 {
>> +					opp-hz = /bits/ 64 <200000000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <150000000>,
>> +						 /bits/ 64 <300000000>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>,
>> +						 /bits/ 64 <0>;
>> +					required-opps = <&rpmhpd_opp_nom>;
>> +				};
>> +			};
>> +		};
>> +
>> +		ufs_mem_phy: phy@1d87000 {
>> +			compatible = "qcom,qcs615-qmp-ufs-phy", "qcom,sm6115-qmp-ufs-phy";
>> +			reg = <0x0 0x01d87000 0x0 0xe00>;
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>> +				 <&gcc GCC_UFS_MEM_CLKREF_CLK>;
>> +			clock-names = "ref",
>> +				      "ref_aux",
>> +				      "qref";
>> +
>> +			power-domains = <&gcc UFS_PHY_GDSC>;
>> +
>> +			resets = <&ufs_mem_hc 0>;
>> +			reset-names = "ufsphy";
>> +
>> +			#clock-cells = <1>;
>> +			#phy-cells = <0>;
>> +
>> +			status = "disabled";
>> +		};
>> +
>>   		tcsr_mutex: hwlock@1f40000 {
>>   			compatible = "qcom,tcsr-mutex";
>>   			reg = <0x0 0x01f40000 0x0 0x20000>;
>> -- 
>> 2.34.1
>>
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy
> 


