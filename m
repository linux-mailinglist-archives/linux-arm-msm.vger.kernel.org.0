Return-Path: <linux-arm-msm+bounces-13408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8070872F10
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 07:54:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FC5D1F27512
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 06:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D485BAF6;
	Wed,  6 Mar 2024 06:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JxZ68c5U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30CE5BADE;
	Wed,  6 Mar 2024 06:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709708064; cv=none; b=dBCCcLIeM4pLNhCpeudlLVjk8dtLUutD8rL2K7AkccOh0J/hOCExrLJARSNonucb/HJwwsJaLRdOCG1abPyTP/g8k6J9ZxRLTt0FwsIlT6B/a2VcnRdkbWxEvKZX+86SBf0UxPG+ndfU6joH6CWFSgyCUGvrMFGoadupNqBEvAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709708064; c=relaxed/simple;
	bh=NNlqouC5fe/PBOlrz35yIz68Q4CCQ3F2MpDor9AFlGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jDGqDicnk1sB1kNvr/siViLivlz8jIo1kSbdj08sY63pPMGBA2BrMJAhLdrAgTj7FS7nuxwEvVZpHCWYLfUgXLIi/HqSn+QmsZQj6kkntu1ioKDRsHe1w8a4YOm9OH0CUmIv0ki0gH4fzPtpe1HI6g/LLZA5TeFNCBnZl/NIwhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JxZ68c5U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4266f9Zx008076;
	Wed, 6 Mar 2024 06:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=JQ6+qIvrwbOQBbVa34cxEPVKueBuP0tkgf1ec+CFjEk=; b=Jx
	Z68c5UKoR18x5fyW2qKYWvEXrmTPjoAhS5SkmBvoLPjRpS/nbLzaMPgaG51rSVXa
	8cqcrz4lT//meQ3iM24G+SO0rBTuTXG8pehDrkQocoocs9mS6raEcu3dAEf4MTyL
	t6uqVFHzUFlEsEjvxgUCsRFw6ThcmgPvn5JGTCwRfcAxTL7lj7icUXfY7Rn38q9P
	9qusU/JW4hGBJptOcKVUEAfBYXGDhS61ujThCUz2yIQKXiXVfqDPA70AHOFpB0r5
	VcFa82Dal5zsGJGzNQ2N+Ke1LZgimrOfKYzmXF+tnRzFHu3O8HsRr6SggenoThB0
	ikbrHZpO4Gfz03m6drQQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wpke380n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 06:54:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4266sH4d001251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Mar 2024 06:54:18 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Mar
 2024 22:54:14 -0800
Message-ID: <1604ed01-62bc-4f86-b69c-f75a9fad9c95@quicinc.com>
Date: Wed, 6 Mar 2024 12:24:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Update protected clocks list for
 qcm6490 variants
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob
 Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240208062836.19767-1-quic_tdas@quicinc.com>
 <20240208062836.19767-6-quic_tdas@quicinc.com>
 <zzxpyvprhgl6f3kkcecmtxfksdplxqoljwsu6wguawlb3if2ym@jiybnvtplijc>
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <zzxpyvprhgl6f3kkcecmtxfksdplxqoljwsu6wguawlb3if2ym@jiybnvtplijc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QYqnYVZx9sr8PKwgyixPs8M-JsJHINHg
X-Proofpoint-GUID: QYqnYVZx9sr8PKwgyixPs8M-JsJHINHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_04,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=984 phishscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060054

Thanks Bjorn for your review.

On 2/9/2024 10:07 PM, Bjorn Andersson wrote:
> On Thu, Feb 08, 2024 at 11:58:36AM +0530, Taniya Das wrote:
>> Certain clocks are not accessible on QCM6490-IDP and QCS6490-RB3GEN2 boards
>> thus require them to be marked protected.
>>
>> Also disable the LPASS nodes which are not to be used.
>>
> 
> Please find a smaller patch, to make the board boot again here:
> 
> https://lore.kernel.org/linux-arm-msm/20240209-qcm6490-gcc-protected-clocks-v1-1-bd3487b2e7b1@quicinc.com/T/#u
> 
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
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
> 
> protected-clocks should mark the clocks that Linux must not access.
> 
> With that in mind, how is listing GCC_PCIE_1_* here compatible with
> Krishna's patch [1], which clearly shows that Linux is expected to use
> pcie1.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20240207-enable_pcie-v1-1-b684afa6371c@quicinc.com/
> 
> Regards,
> Bjorn

I checked the patch and it is only expected to be used on RB3 boards and 
not on IDP platforms.

> 
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
>> +
>>   &qupv3_id_0 {
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 8bb7d13d85f6..1398b84634c3 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: BSD-3-Clause
>>   /*
>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>
>>   /dts-v1/;
>> @@ -413,6 +413,54 @@
>>   	};
>>   };
>>
>> +&gcc {
>> +	protected-clocks = <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
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
>> +
>> +
>>   &qupv3_id_0 {
>>   	status = "okay";
>>   };
>> --
>> 2.17.1
>>

-- 
Thanks & Regards,
Taniya Das.

