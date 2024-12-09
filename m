Return-Path: <linux-arm-msm+bounces-40973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 868909E8CAF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 08:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48BEC164B9C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 07:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC36E215171;
	Mon,  9 Dec 2024 07:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pii0iYuF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC5821516D;
	Mon,  9 Dec 2024 07:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733731013; cv=none; b=L3DccL/xldxQRuC8m9VB04EXUy2iWK4sfqMrX2ldIkl+XboUMO78YCAKJKBXKpC3s4WKbmSQX1Qp5woD9hlLgWV/ZY1y1j8x41h7I62bkimr/9qGTy/5ZppeOGDvNifPIfI8ORfJH8jkA6GNQamNIiNsuHc+pG5QfoiQmQMizpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733731013; c=relaxed/simple;
	bh=gG2Y3+aeTdOP8f/7CLet/ESHYKiFA5sPQqqjSmZQd1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WfhmS3jGSjds1UQf+IkH7ocO5Cr7o8HrCfxDtQZtyloeVb90xNurMDekmbtAOQJl952QfSP+NaUAJYo7hSWTea59qlhjapOL54o7UWNpqg0NZQMYxqWF5xzfAk/Bl9O7WfAyr2pwRFxCjWiTxhbBIU/1PutFxpOCaxHWzJmUsw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pii0iYuF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8NHupS027535;
	Mon, 9 Dec 2024 07:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	//fyAi5zWyKw6AlYlMQlperLUy5r1PNdg265IdOPf3I=; b=pii0iYuF6CfLIWnm
	fJSWkR5b0XDIZIdEe3BZPqUO4ZDF+x/BkWr2ovOxRRp3qGzgYxpz9fNrz74uyCcy
	ahFlRRc6NhrExD5575dhvqfRPI7N+qQ8Vq66qRc0LWPXXC2cJGJhSt+8RPMiXzy9
	nFaYi07iC3b2lAjIon5ktYDtnW7CaG6wwBPIQMCVuCakLHIIYbPeg/Ptm/9lp669
	Vx9ui+GcexLvnOkF/FmdOhtriRrgc8j3a7K2SWbtWo7crqb9uVo6Vk966FPuOFHN
	CTjAn8qjIzqIbpahcQ1gg9qemoAO1wKbV2DAy/JIOqCVMS6YUQRO+AfL630CtJrX
	nAx4Jw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdxxbswb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 07:56:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B97uL0V012615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 07:56:21 GMT
Received: from [10.64.68.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Dec 2024
 23:56:15 -0800
Message-ID: <677251eb-d3c3-48e1-ba79-fb8ec1e29c6f@quicinc.com>
Date: Mon, 9 Dec 2024 15:56:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: qcs615: add UFS node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <quic_jiegan@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_sayalil@quicinc.com>
References: <20241122064428.278752-1-quic_liuxin@quicinc.com>
 <20241122064428.278752-3-quic_liuxin@quicinc.com>
 <d4f7ca97-b37e-4b8f-918c-9976e4a9cf41@oss.qualcomm.com>
From: Xin Liu <quic_liuxin@quicinc.com>
In-Reply-To: <d4f7ca97-b37e-4b8f-918c-9976e4a9cf41@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fhcH6imOFbF_y0RnyThXz3P6qCy6QLoS
X-Proofpoint-GUID: fhcH6imOFbF_y0RnyThXz3P6qCy6QLoS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090060



在 2024/12/6 5:21, Konrad Dybcio 写道:
> On 22.11.2024 7:44 AM, Xin Liu wrote:
>> From: Sayali Lokhande <quic_sayalil@quicinc.com>
>>
>> Add the UFS Host Controller node and its PHY for QCS615 SoC.
>>
>> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
>> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>> ---
> 
> [...]
> 
>> +
>> +			operating-points-v2 = <&ufs_opp_table>;
>> +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>> +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
> 
> QCOM_ICC_TAG_ACTIVE_ONLY for the cpu path
I need to ask you for advice. I have reviewed the ufs_mem_hc of many 
devices and found that all of them use QCOM_ICC_TAG_ALWAYS for their 
interconnects cpu path. Why do I need to use QCOM_ICC_TAG_ACTIVE_ONLY here?
> 
>> +			interconnect-names = "ufs-ddr",
>> +					     "cpu-ufs";
>> +
>> +			power-domains = <&gcc UFS_PHY_GDSC>;
>> +			required-opps = <&rpmhpd_opp_nom>;
> 
> this contradicts the levels in the OPP table:
The required-opps here corresponds to opp-200000000 in the opp_table 
below. Similarly, I referred to sm8550.dtsi, whose required-opps also 
corresponds to the opp table.
> 
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
> 
> Konrad


