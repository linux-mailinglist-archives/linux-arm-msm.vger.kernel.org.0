Return-Path: <linux-arm-msm+bounces-13406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E36872F0C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 07:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB0EEB26097
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 06:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DAE5BAF3;
	Wed,  6 Mar 2024 06:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QQpuPx3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34CF1B816;
	Wed,  6 Mar 2024 06:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709708057; cv=none; b=EPh9jWWzITxmeK8wiiTtPiKuwwKXqCyIRsCH37h/UoMRAMJ67yX7S3Hhh2GsK0JU4lg30gxDW2oVCPkuDMui3fnPdSBN8FIC7qIbFRfpsaniH+8VmG+dRHX+HOtsB40e9ve2I80XgFaQz6iRB7wgCEig5RcEvpoXMaCqMgBG++0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709708057; c=relaxed/simple;
	bh=ta/MCGdharmxfsfnJnDV3TpPjZlHBtdTviF56wdzqcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QopBUrw9R3yOZC2RUHyu6ZGjrcfWoZXnEjkda3LpuXBt/FQVfEu7cRdrHl1Ym21nfiJi3n6dPOJizQj7lPat/cnr+cVP/kHBV3H7VTK64BqiVmfUPZVY1lZ/APJF/r/Y3+ueiX8boSC4DitMlF/zkkEry+L9uUDgyTTXh7otdBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QQpuPx3A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4265qYQT008359;
	Wed, 6 Mar 2024 06:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=IIqLgOy8yrGMbW1vPD3GWnuW80vGl/Kmc6wKpAbv+ho=; b=QQ
	puPx3AfovRM9WcY+WDmHax3B7Rqh4JpSLedAyuDJwdQgcPuTNm7Bh/fHkvteyECB
	nynKNVVAWxcPwoa134V5q25FiXfC8aAB3WpmSBE2Wpv4phXhVDzMfz7Qj8cpdWmw
	GHQahWz1SB8hbcS4W1SBXZaebbtcB92RhlALaLNx08dJfDPpTTKN/UjwtYZXKGGT
	St0/irOgD/qFRQUMoSA4L8TVumkXBx7M5zzd2ayVwoGiBqjbRIFaYTxyMh9q3Wes
	eSLL3/a+cwnYvQXZmHUnXpIH/ZEUGIDaxqIxMxQT1OMiaBqO4Yf19rn6o6TjK8uA
	5v7SdXB579NMBUJSxrdA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wp2bpt940-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 06:54:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4266sBOm028312
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Mar 2024 06:54:11 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Mar
 2024 22:54:07 -0800
Message-ID: <af05dc60-deb6-4fbe-a95d-7649ae57fa94@quicinc.com>
Date: Wed, 6 Mar 2024 12:24:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Update protected clocks list for
 qcm6490 variants
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240208062836.19767-1-quic_tdas@quicinc.com>
 <20240208062836.19767-6-quic_tdas@quicinc.com>
 <7003e28a-c901-4def-be31-a68eb896adb8@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <7003e28a-c901-4def-be31-a68eb896adb8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: v_Z-STAzg-xjus7GOUt2UUkudcI5TMos
X-Proofpoint-ORIG-GUID: v_Z-STAzg-xjus7GOUt2UUkudcI5TMos
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_04,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=922
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060054

Thanks for the review.

On 2/9/2024 10:16 PM, Konrad Dybcio wrote:
> On 8.02.2024 07:28, Taniya Das wrote:
>> Certain clocks are not accessible on QCM6490-IDP and QCS6490-RB3GEN2 boards
>> thus require them to be marked protected.
>>
>> Also disable the LPASS nodes which are not to be used.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
> One patch per board, please

Sure, I will update the same in the next patch series.

> 
>>   arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 54 +++++++++++++++++++-
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 50 +++++++++++++++++-
>>   2 files changed, 102 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> index 03e97e27d16d..425e4b87490b 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: BSD-3-Clause
>>   /*
>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>
>>   /dts-v1/;
>> @@ -415,6 +415,58 @@
>>   	};
>>   };
>>
>> +&gcc {
>> +	protected-clocks = <GCC_AGGRE_NOC_PCIE_1_AXI_CLK> ,<GCC_PCIE_1_AUX_CLK>,
>> +			<GCC_PCIE_1_AUX_CLK_SRC>, <GCC_PCIE_1_CFG_AHB_CLK>,
>> +			<GCC_PCIE_1_MSTR_AXI_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
>> +			<GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
>> +			<GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
>> +			<GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
>> +			<GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
>> +			<GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
>> +			<GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
>> +			<GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
>> +			<GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
>> +			<GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
>> +			<GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
>> +			<GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
>> +			<GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
>> +			<GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
>> +			<GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
>> +			<GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;
> 
> Why on earth are clocks such as USB sleep reserved? How does it work?

On IDP platform these clocks are to be kept protected and no exposure of 
the USB30/PCIE clocks. That was the reason to keep them in the list.

> 
>> +};
>> +
>> +&lpasscc {
>> +	status = "disabled";
>> +};
>> +
>> +&lpass_audiocc {
>> +	qcom,adsp-skip-pll;
>> +	protected-clocks = <LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC>,
>> +		<LPASS_AUDIO_CC_CODEC_MEM0_CLK>, <LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
>> +		<LPASS_AUDIO_CC_CODEC_MEM2_CLK>, <LPASS_AUDIO_CC_CODEC_MEM_CLK>,
>> +		<LPASS_AUDIO_CC_EXT_MCLK0_CLK>, <LPASS_AUDIO_CC_EXT_MCLK0_CLK_SRC>,
>> +		<LPASS_AUDIO_CC_EXT_MCLK1_CLK>, <LPASS_AUDIO_CC_EXT_MCLK1_CLK_SRC>,
>> +		<LPASS_AUDIO_CC_PLL>, <LPASS_AUDIO_CC_PLL_OUT_AUX2>,
>> +		<LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC>,
>> +		<LPASS_AUDIO_CC_PLL_OUT_MAIN_DIV_CLK_SRC>,
>> +		<LPASS_AUDIO_CC_RX_MCLK_2X_CLK>, <LPASS_AUDIO_CC_RX_MCLK_CLK>,
>> +		<LPASS_AUDIO_CC_RX_MCLK_CLK_SRC>;
>> +	/delete-property/ power-domains;
>> +};
> 
> This literally disables all clocks that come out of this controller, why
> not just set status = "reserved"?
> 

We need the resets from the clock controller to be exposed for the audio 
SW driver to be able to perform resets and the rest of the clocks would 
be controlled from the Low Power Audio Firmware.

>> +
>> +&lpass_aon {
>> +	status = "disabled";
>> +};
>> +
>> +&lpass_core {
>> +	status = "disabled";
>> +};
>> +
>> +&lpass_hm {
>> +	status = "disabled";
>> +};
> 
> These three are status = "reserved" by default already, so it's a NOP..
> 

Yes, I see the patch to keep them reserved, I will remove them in the 
next series.

> Konrad

-- 
Thanks & Regards,
Taniya Das.

