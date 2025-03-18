Return-Path: <linux-arm-msm+bounces-51830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A16A67E29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 21:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 219F43AF7EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 20:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D7A1DE8A6;
	Tue, 18 Mar 2025 20:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ys/qtZN+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19E5DDC5;
	Tue, 18 Mar 2025 20:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742330759; cv=none; b=sVPlJ1fngkYuMO1iFIv3XCd5by/yLCav/ahw1fTtPHGRxDTf9kcO8vYl59lFRNktuZ/OGDlKgyzN3VeraxJqVRq8sSpLhNOLkJE6NRf2mLGgNvN0vGLPo16OYN34rGL7nouG4p0Q0/dDNi2FyqPkI+my4e91Qs7xajOty2OsZ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742330759; c=relaxed/simple;
	bh=Ww/CmrPaLUPl0pU8wVGr/0Vf5lblXEcIb1B/7SlZ0CY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Eyyk3Jj5I7fEY1b7DhPOki+8zyy/5XUwDmH6VTENopnbRLESuJ7yLZg/V0hDZ13UamACwceXH0Pq9+fHJPwQA3YS9jqIcsyUG8TFVjpaLWpXr4YyCmJdIKuERUOD7r+UGNjtJzvEj9d1qWlmLoQTUvKpzo5zLJfHT4Dkrm9VcXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ys/qtZN+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ICeCUP029922;
	Tue, 18 Mar 2025 20:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+JCvgkzNThz1hf8hNzsnQUDSkHaYz3SwncuZ+rmg82o=; b=Ys/qtZN+5Rbs0ohA
	OU5D2VvcZpc3Lwe+fuA+Ur2sECpS19A/lHipmtAWzWahYwKeal+T0RPWvaUAbqeb
	ruoJxGE2E+Ht6tNU/+KWLGPD/EAG4roN7KqsITowKZpJryeDLnCnsFgojMylLNTe
	5rMls8VGJC2VxBKajOacKaTsx/in11+b5JVN01fU2M7f/hfulIEaKmxOPbDyRBiv
	nNRs0zVtu4gCGEv0hg9z6BehwHeiuW8yy2UimnOXNusoqnXa1KwXOBWrURe+GNbD
	48mMQ8MXHbyPZEFu9gsoNS3VhxJJuMcahBFE2ZI4pw19zwrw62jHwnlRXk8WKPC3
	vLlsPw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45f91t1a3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 20:45:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52IKjZt1027943
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 20:45:35 GMT
Received: from [10.110.120.126] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Mar
 2025 13:45:35 -0700
Message-ID: <2448dd34-25e6-4d4f-8c13-d98debc0753e@quicinc.com>
Date: Tue, 18 Mar 2025 13:45:34 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: sm8750: Add UFS nodes for SM8750
 SoC
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        "Manish Pandey" <quic_mapa@quicinc.com>
References: <20250310-sm8750_ufs_master-v2-0-0dfdd6823161@quicinc.com>
 <20250310-sm8750_ufs_master-v2-4-0dfdd6823161@quicinc.com>
 <20250318052841.bdiqbzxrpzwqf7h7@thinkpad>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <20250318052841.bdiqbzxrpzwqf7h7@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: J5jzGRzhnljgSotgqMER08QiY3fZwYfh
X-Authority-Analysis: v=2.4 cv=Xrz6OUF9 c=1 sm=1 tr=0 ts=67d9db70 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=4sn12QoEtl80kFXXyQYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: J5jzGRzhnljgSotgqMER08QiY3fZwYfh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_09,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180150



On 3/17/2025 10:28 PM, Manivannan Sadhasivam wrote:
> On Mon, Mar 10, 2025 at 02:12:32PM -0700, Melody Olvera wrote:
>> From: Nitin Rawat <quic_nitirawa@quicinc.com>
>>
>> Add UFS host controller and PHY nodes for SM8750 SoC.
>>
>> Co-developed-by: Manish Pandey <quic_mapa@quicinc.com>
>> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 106 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 106 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index 529e4e4e1d0ea9e99e89c12d072e27c45091f29e..72f69e717ce049bb0c524aa389d837ecd1459535 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -13,6 +13,7 @@
>>   #include <dt-bindings/power/qcom,rpmhpd.h>
>>   #include <dt-bindings/power/qcom-rpmpd.h>
>>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/gpio/gpio.h>
> Sort includes alphabetically.

Ack.

>
>>   
>>   / {
>>   	interrupt-parent = <&intc>;
>> @@ -2675,6 +2676,111 @@ gic_its: msi-controller@16040000 {
>>   			};
>>   		};
>>   
>> +		ufs_mem_phy: phy@1d80000 {
>> +			compatible = "qcom,sm8750-qmp-ufs-phy";
>> +			reg = <0 0x01d80000 0 0x2000>;
> Use 0x0 for consistency.

Ack.

>
>> +
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +				<&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>> +				 <&tcsrcc TCSR_UFS_CLKREF_EN>;
> Please align the clocks.

Ack.

>
>> +
>> +			clock-names = "ref",
>> +				      "ref_aux",
>> +				      "qref";
>> +
>> +			resets = <&ufs_mem_hc 0>;
>> +			reset-names = "ufsphy";
>> +
>> +			power-domains = <&gcc GCC_UFS_MEM_PHY_GDSC>;
>> +
>> +			#clock-cells = <1>;
>> +			#phy-cells = <0>;
>> +
>> +			status = "disabled";
>> +			};
> Here too.

I'm assuming you mean the curly brace; ack.

>
>> +
>> +		ufs_mem_hc: ufs@1d84000 {
>> +			compatible = "qcom,sm8750-ufshc",
>> +				     "qcom,ufshc",
>> +				     "jedec,ufs-2.0";
> Compatibles can be ordered in the same line.

Ack.

>
>> +			reg = <0 0x01d84000 0 0x3000>;
> 0x0

Ack.

>
>> +
>> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
>> +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
>> +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
>> +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
>> +				 <&rpmhcc RPMH_LN_BB_CLK3>,
>> +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
>> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
>> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
>> +			clock-names = "core_clk",
>> +				      "bus_aggr_clk",
>> +				      "iface_clk",
>> +				      "core_clk_unipro",
>> +				      "ref_clk",
>> +				      "tx_lane0_sync_clk",
>> +				      "rx_lane0_sync_clk",
>> +				      "rx_lane1_sync_clk";
>> +
>> +			operating-points-v2 = <&ufs_opp_table>;
>> +
>> +			resets = <&gcc GCC_UFS_PHY_BCR>;
>> +			reset-names = "rst";
>> +
>> +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +			interconnect-names = "ufs-ddr",
>> +					     "cpu-ufs";
>> +
>> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +
>> +			iommus = <&apps_smmu 0x60 0>;
>> +			dma-coherent;
>> +
>> +			lanes-per-direction = <2>;
>> +
>> +			phys = <&ufs_mem_phy>;
>> +			phy-names = "ufsphy";
>> +
>> +			#reset-cells = <1>;
>> +
>> +			status = "disabled";
>> +
> Extra newline

Will remove.

Thanks,
Melody


