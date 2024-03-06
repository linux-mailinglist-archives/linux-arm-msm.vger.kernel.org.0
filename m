Return-Path: <linux-arm-msm+bounces-13407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A6C872F0D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 07:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A3561F2752F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 06:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BFC5BAE9;
	Wed,  6 Mar 2024 06:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Yuy7mlmm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD091B816;
	Wed,  6 Mar 2024 06:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709708064; cv=none; b=T4fQPwTiOM0ACzzrNUXV739qBEJ4TG9zxNC2paQYGEamvRkOrmIfid+BO8OCg2QIJVfp4fvq+9rcxpIKJI9iFUxB/McemNDQL6jgIgAQ4L2wJs12mnqTMZIL7ayWp43aoIgMgP7Ds0Vku5n3MRMPUDS6lBCH/n5DPzIAgRHaAWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709708064; c=relaxed/simple;
	bh=eSe8IP9KO2w/kukFtSz0NxQg0hUf3A+jPfLz9IOrwGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sD+Z1XDZHdGwr9zoNOudrLITnVV2j6CK6hbAduVqkMdhFDKHBJwn0Wc4ZiOR24osB8RbGuSiXAD0+to5M/O8mjZVlKoN4anMuMu8JsFSQ1hnAPUVZGWdrOkpar6NAYXTZZRSf6hcWMx3+H1WJFGocdFUl8L1saiPsLRA8JmJZhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Yuy7mlmm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4266Mt1T007664;
	Wed, 6 Mar 2024 06:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=b14IrkxhCLs7e2l1z8QNI98FZvxkkKNaYw/HtKsnao4=; b=Yu
	y7mlmmA1guE7/GHcwC7Ib6h4fATj1eDyms+47a3yc7+Mhcl32etC6h2+RDZpLPvd
	FhpIl/p9AKSb4+RmnCmbtssA75sFCVpG7KMjz96Dg1d2QEopufoP9UgZabYPcOJV
	vznuIFoIiWVcWiaee+1HwYwImdfxy1iRCkgD8ERVrPGBQ0s9gcdLzly1vy0hKEpO
	m43gJf7DtQF0IwDYADDlxefouDks/SC1iX2uteh7EzeY7DhvYyaidi+Vz7tmZ7FE
	IiqerF7YGUTQoy4tCo7NHndTZrUDeEd6xQd3j1/8V17W6k+dRDbYMTC0oZNZL+rI
	o4/II/HKm0OFc3ymZthw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wpepc8jtj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 06:54:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4266sH4c001251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Mar 2024 06:54:17 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Mar
 2024 22:54:13 -0800
Message-ID: <c7ddbb39-a9df-485b-87d3-2ad992f24086@quicinc.com>
Date: Wed, 6 Mar 2024 12:24:13 +0530
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
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad
 Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240208062836.19767-1-quic_tdas@quicinc.com>
 <20240208062836.19767-6-quic_tdas@quicinc.com>
 <CAA8EJpq4YfX+1mYBS3AMWFp+7pYGdY6bvTUGsvYeqfNOo1KbAg@mail.gmail.com>
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <CAA8EJpq4YfX+1mYBS3AMWFp+7pYGdY6bvTUGsvYeqfNOo1KbAg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UuKY9Fu_mQEypgGJOp5rtTHKtJ7n4UoL
X-Proofpoint-ORIG-GUID: UuKY9Fu_mQEypgGJOp5rtTHKtJ7n4UoL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_04,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403060054

Thanks for your review Dmitry.

On 2/8/2024 12:44 PM, Dmitry Baryshkov wrote:
> On Thu, 8 Feb 2024 at 08:29, Taniya Das <quic_tdas@quicinc.com> wrote:
>>
>> Certain clocks are not accessible on QCM6490-IDP and QCS6490-RB3GEN2 boards
>> thus require them to be marked protected.
>>
>> Also disable the LPASS nodes which are not to be used.
>>
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
>>          };
>>   };
>>
>> +&gcc {
>> +       protected-clocks = <GCC_AGGRE_NOC_PCIE_1_AXI_CLK> ,<GCC_PCIE_1_AUX_CLK>,
>> +                       <GCC_PCIE_1_AUX_CLK_SRC>, <GCC_PCIE_1_CFG_AHB_CLK>,
>> +                       <GCC_PCIE_1_MSTR_AXI_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
>> +                       <GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
>> +                       <GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
>> +                       <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
>> +                       <GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
>> +                       <GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
>> +                       <GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
>> +                       <GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
>> +                       <GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
>> +                       <GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
>> +                       <GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
>> +                       <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
>> +                       <GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
>> +                       <GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
>> +                       <GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
>> +                       <GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;
> 
> This looks like a huge variety of clocks. Are they really not
> accessible or are you trying to make Linux stay away from all those
> clocks to keep bootloader settings?
> 

These clocks are protected and accessing them from Linux will cause Bus 
error (NoC) and thus this list grows sometimes.

>> +};
>> +
>> +&lpasscc {
>> +       status = "disabled";
>> +};
>> +
>> +&lpass_audiocc {
>> +       qcom,adsp-skip-pll;
>> +       protected-clocks = <LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC>,
>> +               <LPASS_AUDIO_CC_CODEC_MEM0_CLK>, <LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
>> +               <LPASS_AUDIO_CC_CODEC_MEM2_CLK>, <LPASS_AUDIO_CC_CODEC_MEM_CLK>,
>> +               <LPASS_AUDIO_CC_EXT_MCLK0_CLK>, <LPASS_AUDIO_CC_EXT_MCLK0_CLK_SRC>,
>> +               <LPASS_AUDIO_CC_EXT_MCLK1_CLK>, <LPASS_AUDIO_CC_EXT_MCLK1_CLK_SRC>,
>> +               <LPASS_AUDIO_CC_PLL>, <LPASS_AUDIO_CC_PLL_OUT_AUX2>,
>> +               <LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC>,
>> +               <LPASS_AUDIO_CC_PLL_OUT_MAIN_DIV_CLK_SRC>,
>> +               <LPASS_AUDIO_CC_RX_MCLK_2X_CLK>, <LPASS_AUDIO_CC_RX_MCLK_CLK>,
>> +               <LPASS_AUDIO_CC_RX_MCLK_CLK_SRC>;
> 
> This almost looks like a separate compatible.

We need to use the reset from this controller, rest all will be 
controlled via the Low Power Audio Firmware.

> 
>> +       /delete-property/ power-domains;
>> +};
>> +
>> +&lpass_aon {
>> +       status = "disabled";
> 
> Should this be "reserved", controlled by ADSP? See how this was
> implemented in sc7180.dtsi / sc7180-trogdor.dtsi.
> Please consider inverting the logic. Generic ADSP implementation
> should be present in sc7280.dtsi and then the non-default ChromeOS
> implementation should be a part of sc7280-chrome-common.dtsi.
> 

This I will take care in the next series.

>> +};
>> +
>> +&lpass_core {
>> +       status = "disabled";
>> +};
>> +
>> +&lpass_hm {
>> +       status = "disabled";
>> +};
>> +
>>   &qupv3_id_0 {
>>          status = "okay";
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
>>          };
>>   };
>>
>> +&gcc {
>> +       protected-clocks = <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
>> +                       <GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
>> +                       <GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
>> +                       <GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
>> +                       <GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
>> +                       <GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
>> +                       <GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
>> +                       <GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
>> +                       <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
>> +                       <GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
>> +                       <GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
>> +                       <GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
>> +                       <GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;
>> +};
>> +
>> +&lpasscc {
>> +       status = "disabled";
>> +};
>> +
>> +&lpass_audiocc {
>> +       qcom,adsp-skip-pll;
>> +       protected-clocks = <LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC>,
>> +               <LPASS_AUDIO_CC_CODEC_MEM0_CLK>, <LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
>> +               <LPASS_AUDIO_CC_CODEC_MEM2_CLK>, <LPASS_AUDIO_CC_CODEC_MEM_CLK>,
>> +               <LPASS_AUDIO_CC_EXT_MCLK0_CLK>, <LPASS_AUDIO_CC_EXT_MCLK0_CLK_SRC>,
>> +               <LPASS_AUDIO_CC_EXT_MCLK1_CLK>, <LPASS_AUDIO_CC_EXT_MCLK1_CLK_SRC>,
>> +               <LPASS_AUDIO_CC_PLL>, <LPASS_AUDIO_CC_PLL_OUT_AUX2>,
>> +               <LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC>,
>> +               <LPASS_AUDIO_CC_PLL_OUT_MAIN_DIV_CLK_SRC>,
>> +               <LPASS_AUDIO_CC_RX_MCLK_2X_CLK>, <LPASS_AUDIO_CC_RX_MCLK_CLK>,
>> +               <LPASS_AUDIO_CC_RX_MCLK_CLK_SRC>;
>> +       /delete-property/ power-domains;
>> +};
>> +
>> +&lpass_aon {
>> +       status = "disabled";
>> +};
>> +
>> +&lpass_core {
>> +       status = "disabled";
>> +};
>> +
>> +&lpass_hm {
>> +       status = "disabled";
>> +};
>> +
>> +
>>   &qupv3_id_0 {
>>          status = "okay";
>>   };
>> --
>> 2.17.1
>>
>>
> 
> 

-- 
Thanks & Regards,
Taniya Das.

