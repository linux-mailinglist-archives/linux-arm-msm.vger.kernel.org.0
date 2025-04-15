Return-Path: <linux-arm-msm+bounces-54418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD2FA89DCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 14:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5857C3B8B0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274091F55ED;
	Tue, 15 Apr 2025 12:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J3nEr8/T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B591FF1B0;
	Tue, 15 Apr 2025 12:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719513; cv=none; b=Ujf5HFXpdIYb7HSeZTOPMc0IHonnv46XJrGunOCr11+FFPU7TAJyyik+4T9o484H5YqqHh/iW+tRbemlxoC7aprrDKO6v/Sf/dARmgf1qIvcCn2c85vyISqc+pU51f1gI/9z21P5PxdgJs3nC45rvIyqF1KI0CONCoirdJMnOvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719513; c=relaxed/simple;
	bh=atFAuwFrqsVLkfoO7LubzvIfTLvQEcb6RWqoGJEiPss=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Yoki3k5jRMjY5sX58WpfOeRENg2O7a7JvV768gpdro4ojaxLC+k/wP6zxYhmmsFCoMTQ/CbmjTiuZI8cNPUwFIMPVpmWEx0GIF8tvkUirdEUwhsgTR6yTK6F3wtv7vQZnGbndu0USr74UUvj+xW3R8WpvzvKWaRgAo+XEXmN7OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J3nEr8/T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tBRD022959;
	Tue, 15 Apr 2025 12:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pH3u8oVUx94lPPJSWYtRRTsZwY4inY7vNjLnJSUYblc=; b=J3nEr8/THWLYg7Ad
	vU/D64XNhXaq6TIYRT4MLrrXCHUrMUs3hOXcJ0nmqBjvtpLToK26VySUG3pHvyS1
	WMY3oa25HjydIEBFSyoQM9rcyzHZAKxnpUnPFMW7VKrG7yCUYc/pAqeYi2AN76lF
	bYJZOSH8AKIGQXypD1h1c/QNCt/kkAimEtvXuQX9u8+G8+k1f4LteUbfmvS4P7i6
	jRADUzLXrZdpdxdfvJa4IipLPo0fKA/pPzrqISJ+YgZBxg46k27FcqgY/JnFGZe3
	MOPfqJLNI0JwUHlkZx64KSTl1UG6t1CdU/5RDciJUl0VMr4h39xCRqGh7HPHjbzc
	/wwNIQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj980bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 12:18:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53FCIQ38030904
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 12:18:26 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Apr
 2025 05:18:22 -0700
Message-ID: <c14863c8-5930-4ab9-8448-947ff5a44dbc@quicinc.com>
Date: Tue, 15 Apr 2025 17:48:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: ipq5424: Add PCIe PHYs and
 controller nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
References: <20250402102723.219960-1-quic_mmanikan@quicinc.com>
 <20250402102723.219960-2-quic_mmanikan@quicinc.com>
 <218c9580-de47-41a6-a3ae-8b7477fafe30@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <218c9580-de47-41a6-a3ae-8b7477fafe30@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ch2tyRC0yCFLeh-7zsS2Z5e-kZ5r-H8A
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fe4e93 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Up9O-4L68c34P-V2CXsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ch2tyRC0yCFLeh-7zsS2Z5e-kZ5r-H8A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150087



On 4/14/2025 4:17 PM, Konrad Dybcio wrote:
> On 4/2/25 12:27 PM, Manikanta Mylavarapu wrote:
>> Add PCIe0, PCIe1, PCIe2, PCIe3 (and corresponding PHY) devices
>> found on IPQ5424 platform. The PCIe0 & PCIe1 are 1-lane Gen3
>> host whereas PCIe2 & PCIe3 are 2-lane Gen3 host.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
> 
> [...]
> 
>> +		pcie0_phy: phy@84000 {
>> +			compatible = "qcom,ipq5424-qmp-gen3x1-pcie-phy",
>> +				     "qcom,ipq9574-qmp-gen3x1-pcie-phy";
>> +			reg = <0x0 0x00084000 0x0 0x2000>;
> 
> This is 0x1000-wide
> 

Okay, sure.

>> +			clocks = <&gcc GCC_PCIE0_AUX_CLK>,
>> +				 <&gcc GCC_PCIE0_AHB_CLK>,
>> +				 <&gcc GCC_PCIE0_PIPE_CLK>;
>> +			clock-names = "aux",
>> +				      "cfg_ahb",
>> +				      "pipe";
>> +
>> +			assigned-clocks = <&gcc GCC_PCIE0_AUX_CLK>;
>> +			assigned-clock-rates = <20000000>;
>> +
>> +			resets = <&gcc GCC_PCIE0_PHY_BCR>,
>> +				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
>> +			reset-names = "phy",
>> +				      "common";
>> +
>> +			#clock-cells = <0>;
>> +			clock-output-names = "gcc_pcie0_pipe_clk_src";
>> +
>> +			#phy-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>> +		pcie1_phy: phy@8c000 {
>> +			compatible = "qcom,ipq5424-qmp-gen3x1-pcie-phy",
>> +				     "qcom,ipq9574-qmp-gen3x1-pcie-phy";
>> +			reg = <0x0 0x0008c000 0x0 0x2000>;
> 
> So is this
> 

Okay, sure.

>> +			clocks = <&gcc GCC_PCIE1_AUX_CLK>,
>> +				 <&gcc GCC_PCIE1_AHB_CLK>,
>> +				 <&gcc GCC_PCIE1_PIPE_CLK>;
>> +			clock-names = "aux",
>> +				      "cfg_ahb",
>> +				      "pipe";
>> +
>> +			assigned-clocks = <&gcc GCC_PCIE1_AUX_CLK>;
>> +			assigned-clock-rates = <20000000>;
>> +
>> +			resets = <&gcc GCC_PCIE1_PHY_BCR>,
>> +				 <&gcc GCC_PCIE1PHY_PHY_BCR>;
>> +			reset-names = "phy",
>> +				      "common";
>> +
>> +			#clock-cells = <0>;
>> +			clock-output-names = "gcc_pcie1_pipe_clk_src";
>> +
>> +			#phy-cells = <0>;
>> +			status = "disabled";
>> +		};
> 
> 
>> +		pcie3: pcie@40000000 {
>> +			compatible = "qcom,pcie-ipq5424", "qcom,pcie-ipq9574";
>> +			reg = <0x0 0x40000000 0x0 0xf1c>,
>> +			      <0x0 0x40000f20 0x0 0xa8>,
>> +			      <0x0 0x40001000 0x0 0x1000>,
>> +			      <0x0 0x000f8000 0x0 0x3000>,
>> +			      <0x0 0x40100000 0x0 0x1000>,
>> +			      <0x0 0x000fe000 0x0 0x1000>;
>> +			reg-names = "dbi",
>> +				    "elbi",
>> +				    "atu",
>> +				    "parf",
>> +				    "config",
>> +				    "mhi";
>> +			device_type = "pci";
>> +			linux,pci-domain = <3>;
>> +			num-lanes = <2>;
>> +			#address-cells = <3>;
>> +			#size-cells = <2>;
>> +
>> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x00100000>,
>> +				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x0fd00000>;
> 
> I think the BAR spaces on all these hosts are only 32 MiB long
> 

I have confirmed with the hardware team that the specified BAR register space is accurate.
256MB for all PCIe controllers.

Thanks & Regards,
Manikanta.


