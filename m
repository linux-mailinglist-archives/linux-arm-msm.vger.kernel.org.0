Return-Path: <linux-arm-msm+bounces-76306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B5DBC355F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 06:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B67AE4EE961
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 04:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852CC2BEFFB;
	Wed,  8 Oct 2025 04:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxpc0Ia3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DD42BEC42
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 04:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759898513; cv=none; b=lVCOZ2SaHWqaHer1XlxamP2zt7nggAWn39HGh7Kt6M4SnugK8GtHx9Npa7OZ9UNOAmRBjLqPcovH0w5pm2kRZdWYqshBOmmQBVK5XAfjsbCa7mVtTh4WDg24U+xKHa2O6+vulvECYAJhIM6A3cxxmiwVHWGlYUJSLTxA0349FDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759898513; c=relaxed/simple;
	bh=BEIvSnXjfTLBvwC1TuedJxn6RJZw5URTYCCThWdH4AQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hq32estBfsAGThbDMPcDgGrk/0sZkD78yA8S7FczAnHbimx6ncNbAAHw3Hdq8ZgrV5SrNhMZyraTDWrb5zQSpZbnwJwCktxO5VzquE8zVFIZOHZrRMnSa+DfiRO7R4+FL7otkcztKvFxAFeNZJNuY43bx7Pkizjf3jL/D7CYsas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nxpc0Ia3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803u2r018589
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 04:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kl9FQtdDoWYC1CLHaQ1C3HdDRsoZX1tc+qXEa04V6l0=; b=nxpc0Ia30PtHCrlF
	CUaPtQ+Wo2TyOcrz09k+6DCX7wWas+gGXJsRvKgC3iVxtQ5U2RrGtrDbCjUDphWk
	Lbjehh5k/TfHEsIvJCdcLTpOirQ2kM4E9h3EK/xVKBBsn8wCt5r8Nv7t9iZg4RLj
	a7jVh4ejCZo21LajK5c/TQ5p9/9+lvzBtgvfbrS2KXtV7tSJ/iOUbBb4csQNmAes
	E2+uPz54Tts+H0NmaH/S4NWN1+Hh0MDSoZSqWce/40ITBJQZssCX56K6aw/yd8Pg
	c++sw75vax/U1kqpttB1xm511nH0coqm/gUwq/5RcztsCt6hghJnseS3u4pLw/8j
	E8DtbA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0n365-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:41:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-272ed8c106eso45073505ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 21:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759898508; x=1760503308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kl9FQtdDoWYC1CLHaQ1C3HdDRsoZX1tc+qXEa04V6l0=;
        b=fUeWdQcy2mS+4zoZXw3aOKZ3U6czln+Fq432rTOsYpruTqcHtr3vDGTs+JTwrMKzNv
         kzThVS8rJSoZAonb60a7w5+arYPyDeTwev5Ku+V06b3ly47h4yguLBpRQS1ENUPQeD0a
         MP/vadRYIOJdnHZRNxKl4CHqMqOhumm1LkLXwWpudIFxNrnyftfwj4SyM0KPI/kuC0uY
         72v1zBmjWDBRHlYkCTl0jSQptOkJCwRBMvP3t+x/znmOSUN3g77QdxuT2jz3il9qD4vZ
         sKCZ+5gvw7M9AJrXPjb8+AWYLygxj81YYjp5Qf7UPo9Jtg6ilqYEoeL4Xk8KSpX8HZaU
         PL7A==
X-Forwarded-Encrypted: i=1; AJvYcCXD8k0y++56CQHt35H5bKSQND7k0vwbnHaMI2ADOFc8xwXumJD+5OMdg9yL1Ub/mFLnYFUsdasBL635XpPG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxof71LficO/h7n+r8s5I+izaxQXCWk1+ptE73jL3wNc/r1d8q5
	DbGQTGYQ3zymhoZgFOES9QIsQAgZr4G+hmKxvOnSQcoVauNDNMEDyPsA9t2A4/igKZWnItSZtUW
	yn2R8KMvmXeZ5Ov/lEXbTdrTNg2FsME8HEnDeJAJwHLjRwAWnql0r1FRlHMKNJxOVzrj9
X-Gm-Gg: ASbGncvzUMbb/xYqIhaw6j9U6ryXKXyBNqr0hYLNiFsV61+Cz939o2Uvqii3d6o59i9
	JW/8jP5D+4q8hqv3xTvfIi12VL1VVwmd0zLx3T6NAm4chLy2VMF1lfHwix9napEGA3oB/v1Ri1u
	Cp8Qz41UfCC3QhOZnZJJrLzvm27c1ahovjGXSCcjv7FRAxK17IT+gcEC+t8BmODziJrX4ADQtXW
	8iwVCB+lC9WuXu2pvLg59Qux3lIngNH1WMiCjlqoEW9KDFQ3+F6R7UxHUMXQnpPu9GW7+ZrWLPj
	moDOvO+cQ1dzPB1LIbH1iVVYqyimVxrfQ1b4uSPX7eufk3O0F+Mzek06WSJ8402Mmcxs/ZsK4OE
	qRTQ=
X-Received: by 2002:a17:903:1b26:b0:248:e3fb:4dc8 with SMTP id d9443c01a7336-290272c045bmr26411995ad.39.1759898507480;
        Tue, 07 Oct 2025 21:41:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbLgyaHnQnCYg1mkuvqGXZAuilnklbWsbGEyJCe1zpX8JiOQVqb233kzye9667JEzQiFkP2Q==
X-Received: by 2002:a17:903:1b26:b0:248:e3fb:4dc8 with SMTP id d9443c01a7336-290272c045bmr26411785ad.39.1759898506997;
        Tue, 07 Oct 2025 21:41:46 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d125e9fsm183251915ad.36.2025.10.07.21.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 21:41:46 -0700 (PDT)
Message-ID: <4d586f0f-c336-4bf6-81cb-c7c7b07fb3c5@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 10:11:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm8750: Add PCIe PHY and
 controller node
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
References: <20250826-pakala-v3-0-721627bd5bb0@oss.qualcomm.com>
 <20250826-pakala-v3-2-721627bd5bb0@oss.qualcomm.com>
 <aN22lamy86iesAJj@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <aN22lamy86iesAJj@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SlO90mE_W7rCFT_c3C_DjXeg46dF3007
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e5eb8e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AkHrb9cOowbY_nbVBZgA:9 a=lTNlEBf13bCQAnnw:21 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: SlO90mE_W7rCFT_c3C_DjXeg46dF3007
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX8wBPzNXKkBeu
 NqaHaqBbrftbdf3mSpQjTcnYIRiKUqhE1P8XoVpcBgoXOlrbnnFtpPyOX46T56fBsxWFt+Sr327
 aC9CM3aDZSzx9SG8g0lJq8HCiuhUcTrzCXKy9FKVnDOCajcz0x1qo+27MgytrFv4Czwi9CYQzSC
 1NXbgja5Wzt03WOPr+BukMYJ1TIJHiYOOmOPaed3T4UWvkLulAZ8gsX76JKuHMeF4eIu/BNIxE4
 t05gq5IVurDuCOHmw5TUj58IIfLJmGck30ehCDmn2LQP8rgLKNBjW9bVRmJbZ71hmT9HZB3ftXJ
 FAtaVW9Ew4mkLR3pPP2uT4VjP5WBZ2Ax43P128u5V/g30yG0OGn+ujbhdENOFZln82OjmZTBM6M
 ETgtwVXOQL6Aaa63D+OXiCfOREfM+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123



On 10/2/2025 5:07 AM, Bjorn Andersson wrote:
> On Tue, Aug 26, 2025 at 04:32:54PM +0530, Krishna Chaitanya Chundru wrote:
>> Add PCIe controller and PHY nodes which supports data rates of 8GT/s
>> and x2 lane.
>>
> 
> I tried to boot the upstream kernel (next-20250925 defconfig) on my
> Pakala MTP with latest LA1.0 META and unless I disable &pcie0 the device
> is crashing during boot as PCIe is being probed.
> 
> Is this a known problem? Is there any workaround/changes in flight that
> I'm missing?
> 
Hi Bjorn,

we need this fix for the PCIe to work properly. Please try it once.
https://lore.kernel.org/all/20251008-sm8750-v1-1-daeadfcae980@oss.qualcomm.com/

- Krishna Chaitanya.
> Regards,
> Bjorn
> 
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 180 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 179 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index 4643705021c6ca095a16d8d7cc3adac920b21e82..b47668a64bcead3e48f58eeb2e41c04660493cb7 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -631,7 +631,7 @@ gcc: clock-controller@100000 {
>>   			clocks = <&bi_tcxo_div2>,
>>   				 <0>,
>>   				 <&sleep_clk>,
>> -				 <0>,
>> +				 <&pcie0_phy>,
>>   				 <0>,
>>   				 <0>,
>>   				 <0>,
>> @@ -3304,6 +3304,184 @@ gic_its: msi-controller@16040000 {
>>   			};
>>   		};
>>   
>> +		pcie0: pcie@1c00000 {
>> +			device_type = "pci";
>> +			compatible = "qcom,pcie-sm8750", "qcom,pcie-sm8550";
>> +			reg = <0x0 0x01c00000 0x0 0x3000>,
>> +			      <0x0 0x40000000 0x0 0xf1d>,
>> +			      <0x0 0x40000f20 0x0 0xa8>,
>> +			      <0x0 0x40001000 0x0 0x1000>,
>> +			      <0x0 0x40100000 0x0 0x100000>,
>> +			      <0x0 0x01C03000 0x0 0x1000>;
>> +			reg-names = "parf",
>> +				    "dbi",
>> +				    "elbi",
>> +				    "atu",
>> +				    "config",
>> +				    "mhi";
>> +
>> +			#address-cells = <3>;
>> +			#size-cells = <2>;
>> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
>> +				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x23d00000>,
>> +				 <0x03000000 0x4 0x00000000 0x4 0x00000000 0x3 0x00000000>;
>> +			bus-range = <0x00 0xff>;
>> +
>> +			dma-coherent;
>> +
>> +			linux,pci-domain = <0>;
>> +
>> +			msi-map = <0x0 &gic_its 0x1400 0x1>,
>> +				  <0x100 &gic_its 0x1401 0x1>;
>> +			msi-map-mask = <0xff00>;
>> +
>> +			num-lanes = <2>;
>> +
>> +			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "msi0",
>> +					  "msi1",
>> +					  "msi2",
>> +					  "msi3",
>> +					  "msi4",
>> +					  "msi5",
>> +					  "msi6",
>> +					  "msi7",
>> +					  "global";
>> +
>> +			#interrupt-cells = <1>;
>> +			interrupt-map-mask = <0 0 0 0x7>;
>> +			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
>> +				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
>> +				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
>> +				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
>> +				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
>> +				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
>> +			clock-names = "aux",
>> +				      "cfg",
>> +				      "bus_master",
>> +				      "bus_slave",
>> +				      "slave_q2a",
>> +				      "ddrss_sf_tbu",
>> +				      "noc_aggr",
>> +				      "cnoc_sf_axi";
>> +
>> +			interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>> +					 &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ALWAYS>;
>> +			interconnect-names = "pcie-mem",
>> +					     "cpu-pcie";
>> +
>> +			iommu-map = <0x0   &apps_smmu 0x1400 0x1>,
>> +				    <0x100 &apps_smmu 0x1401 0x1>;
>> +
>> +			resets = <&gcc GCC_PCIE_0_BCR>;
>> +			reset-names = "pci";
>> +
>> +			power-domains = <&gcc GCC_PCIE_0_GDSC>;
>> +
>> +			operating-points-v2 = <&pcie0_opp_table>;
>> +
>> +			status = "disabled";
>> +
>> +			pcie0_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				/* GEN 1 x1 */
>> +				opp-2500000 {
>> +					opp-hz = /bits/ 64 <2500000>;
>> +					required-opps = <&rpmhpd_opp_low_svs>;
>> +					opp-peak-kBps = <250000 1>;
>> +				};
>> +
>> +				/* GEN 1 x2 and GEN 2 x1 */
>> +				opp-5000000 {
>> +					opp-hz = /bits/ 64 <5000000>;
>> +					required-opps = <&rpmhpd_opp_low_svs>;
>> +					opp-peak-kBps = <500000 1>;
>> +				};
>> +
>> +				/* GEN 2 x2 */
>> +				opp-10000000 {
>> +					opp-hz = /bits/ 64 <10000000>;
>> +					required-opps = <&rpmhpd_opp_low_svs>;
>> +					opp-peak-kBps = <1000000 1>;
>> +				};
>> +
>> +				/* GEN 3 x1 */
>> +				opp-8000000 {
>> +					opp-hz = /bits/ 64 <8000000>;
>> +					required-opps = <&rpmhpd_opp_nom>;
>> +					opp-peak-kBps = <984500 1>;
>> +				};
>> +
>> +				/* GEN 3 x2 */
>> +				opp-16000000 {
>> +					opp-hz = /bits/ 64 <16000000>;
>> +					required-opps = <&rpmhpd_opp_nom>;
>> +					opp-peak-kBps = <1969000 1>;
>> +				};
>> +
>> +			};
>> +
>> +			pcieport0: pcie@0 {
>> +				device_type = "pci";
>> +				reg = <0x0 0x0 0x0 0x0 0x0>;
>> +				bus-range = <0x01 0xff>;
>> +
>> +				#address-cells = <3>;
>> +				#size-cells = <2>;
>> +				ranges;
>> +				phys = <&pcie0_phy>;
>> +			};
>> +		};
>> +
>> +		pcie0_phy: phy@1c06000 {
>> +			compatible = "qcom,sm8750-qmp-gen3x2-pcie-phy";
>> +			reg = <0 0x01c06000 0 0x2000>;
>> +
>> +			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
>> +				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
>> +				 <&tcsrcc TCSR_PCIE_0_CLKREF_EN>,
>> +				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
>> +				 <&gcc GCC_PCIE_0_PIPE_CLK>;
>> +			clock-names = "aux",
>> +				      "cfg_ahb",
>> +				      "ref",
>> +				      "rchng",
>> +				      "pipe";
>> +
>> +			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
>> +			assigned-clock-rates = <100000000>;
>> +
>> +			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
>> +			reset-names = "phy";
>> +
>> +			power-domains = <&gcc GCC_PCIE_0_PHY_GDSC>;
>> +
>> +			#clock-cells = <0>;
>> +			clock-output-names = "pcie0_pipe_clk";
>> +
>> +			#phy-cells = <0>;
>> +
>> +			status = "disabled";
>> +		};
>> +
>>   		ufs_mem_phy: phy@1d80000 {
>>   			compatible = "qcom,sm8750-qmp-ufs-phy";
>>   			reg = <0x0 0x01d80000 0x0 0x2000>;
>>
>> -- 
>> 2.34.1
>>

