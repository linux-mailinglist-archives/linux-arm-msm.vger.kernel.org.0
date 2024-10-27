Return-Path: <linux-arm-msm+bounces-36074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E869B1C52
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 07:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B78921F21966
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 06:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251B83F8F7;
	Sun, 27 Oct 2024 06:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DrTCq9eQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166703BB24;
	Sun, 27 Oct 2024 06:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730012212; cv=none; b=tqHrOZSq+ZNgIBLnE1+XQ8J02TIGKHVeJnBV4D+G3EAnMZkHFvWOuUKN6KigF8NmlWcY9J1jgdtI56wUuk0SxDum7HpfMcddSeGkHRd0PN6B+ohRREZZ3nw6Xa0buZpFe+cOWYWP938vKmIODUs/6ahIl+2hJct4S9DU8b/6eDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730012212; c=relaxed/simple;
	bh=t+1EGbdg5Tr/L3qAbNlUmuJOgFKkfjJq9tV4mIocn3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GIC5/hihjspXSZ76DUkhAfcM8dfEivC1W2xyMOTk8zFLzOX2p+gHUgUDYtO/C50ZoYYBiJZuQkUU3vt6Wx/QH9uQeegCZ2UwYvHoy3g3WSo8RLxtuv/jBkqiM/KQR75sjYyS4zCCBITOUamWk0pbcfMXojFdGJoFgAHn7MQhZwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DrTCq9eQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49R5hW0O027611;
	Sun, 27 Oct 2024 06:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+c+pYGpOKJ4EGnVFLhxe/tElJxQbTgI+H8lzC6Lfd0=; b=DrTCq9eQ5WfmDBam
	8gXGJudiu3BxPxCrZvK2eMc2Gt9KGU0QPFsGP1CBzhv7jYu+WbAHg+Zjwfd8q5XT
	1f2TRaviFNGp4uuQ7BYGop+wEgkPVBIewBT6OJnyi2fJQ8gnuC77eTgv2lhLc6qX
	SYo7VKLaPm241nKUqFIO7rQSGyEg9E9f1v++2whg6JUN9n1CGfEWOeMjtyNfzjUf
	4MYn1hvPX+7nOi/1SOzgq9Kmf5yvbMs69K3O8VvZ6np6JcJJFdWHIGWudcL/fhJI
	1dbNdqK7TVPHkjt+LBIcdXvY0wZ7t0Qf1i4dZewj0wY1zmlYkOncuHPrKKjOV9uN
	2BFZFQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqcqj4y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Oct 2024 06:56:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49R6udeg027066
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Oct 2024 06:56:39 GMT
Received: from [10.216.2.255] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 26 Oct
 2024 23:56:36 -0700
Message-ID: <9cfa6159-d271-45c8-93dc-8da4072441af@quicinc.com>
Date: Sun, 27 Oct 2024 12:26:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sar2130p: add support for SAR2130P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20241027-sar2130p-dt-v1-0-739d36d31c33@linaro.org>
 <20241027-sar2130p-dt-v1-1-739d36d31c33@linaro.org>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <20241027-sar2130p-dt-v1-1-739d36d31c33@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: n1JtzS5kPRzYjwi1xp97EGUrYPmiccl9
X-Proofpoint-GUID: n1JtzS5kPRzYjwi1xp97EGUrYPmiccl9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410270059



On 10/27/2024 6:54 AM, Dmitry Baryshkov wrote:
> Add DT file for the Qualcomm SAR2130P platform.
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sar2130p.dtsi | 3091 ++++++++++++++++++++++++++++++++
>   1 file changed, 3091 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..a8edbb9e6591265644476623aec36be9147ed7a0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi

[...]

> +
> +		usb_1: usb@a6f8800 {
> +			compatible = "qcom,sar2130p-dwc3", "qcom,dwc3";
> +			reg = <0x0 0x0a6f8800 0x0 0x400>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +				 <&tcsr TCSR_USB3_CLKREF_EN>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi",
> +				      "xo";
> +
> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <200000000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
> +					      //<&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "pwr_event",
> +					  //"hs_phy_irq",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "ss_phy_irq";
> +

I checked the hw specifics and hs_phy_irq is 349.

> +			power-domains = <&gcc USB30_PRIM_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +
> +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> +
> +			interconnects = <&system_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +
> +			status = "disabled";
> +
> +			usb_1_dwc3: usb@a600000 {
> +				compatible = "snps,dwc3";
> +				reg = <0x0 0x0a600000 0x0 0xcd00>;
> +				interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>;
> +				iommus = <&apps_smmu 0x20 0x0>;
> +				phys = <&usb_1_hsphy>,
> +				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +
> +				snps,has-lpm-erratum;
> +				snps,hird-threshold = /bits/ 8 <0x0>;
> +				snps,is-utmi-l1-suspend;
> +				snps,dis-u1-entry-quirk;
> +				snps,dis-u2-entry-quirk;
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_u3_susphy_quirk;
> +				snps,parkmode-disable-ss-quirk;
> +
> +				tx-fifo-resize;
> +				dma-coherent;
> +				usb-role-switch;
> +

Ideally, neither the QAR2130P or customer designs support ID detection 
today. Not that it can't but no one is doing it. Everyone uses it in 
peripheral mode. Also on QAR2130 (which I assume is same as QXR platform 
on downstream, the role switch is provided by BQ256xx battery charger 
driver (apologies if I used the name of the driver wrong), via extcon. 
Since (AFAIK) this support is not there on upstream today and no one 
uses host mode, you can choose to drop role switch here.

Regards,
Krishna,

