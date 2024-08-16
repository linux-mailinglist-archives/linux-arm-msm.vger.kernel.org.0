Return-Path: <linux-arm-msm+bounces-28777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8487595448B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 10:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3559A1F26511
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 08:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843C81411EB;
	Fri, 16 Aug 2024 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CuMNfx1M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCE576056;
	Fri, 16 Aug 2024 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723797277; cv=none; b=LKNRf6TJtgRQWqdSxvSNNywHtxQ61N2zR8ECgXN+vkEoVkPuNAjA4yGcbGG2wmD6WQVEQEkIFaB2GAFGLRkGCTNqZObWhXCqXf2bCgGZprZgyeawP/cf9KDELIBFmLPnFig13pIcy3lgxyLzeeIUM83zIRp0P9ie9QHZRtwJ01U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723797277; c=relaxed/simple;
	bh=slg7Mz/uR9NxJ6yJYvaCR2+orUklYXSMPH1ldn2azCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bNt4AbeZPXsCeb90ODOioXgs6IkuoPjZGN8uuk4qkR3Mo6fqffWoMzj8BrHvVZziUcffNkg5wmlKYn1dDqMQrT0wcZGVDlNSfeLjuo4HdhD2iNgFt9UgrZehn0PDWF5HCYMzKdfhcqv9mq2WLv5UJ4w6F+iBhYi2CqUBEL5QPZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CuMNfx1M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47G5mOTs025079;
	Fri, 16 Aug 2024 08:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WPCZ+v2h/YHhcM9sdW0Y/KTcld6Z1Q95K8izoqgcbK0=; b=CuMNfx1MiZlw9Wod
	Kn0Us0TMPkCqc2NgEFsphMm+VI+rhc77Z3IIZqpz3CaSDNe32/4A6/rkxwnPq4L2
	Lj/B5x8xueqtNwJoh8TlOSUCjVR+maRNogOD3YEKcT5aXJSLui0sNTOrD/BvwW4M
	dI1Ut0d+RdK8yOgCNeL/htYut7p2BIAo5zxYY2JuLrcUCWyZi/a2N0ElRJOMo9QX
	jT8rXBZTDjqAyDCqwB+dVsV35itMRM17erL6wWsC6AAgpXFqKR4IMyG6zLykjOSv
	aMahtl0qO/ZnxQ9YaEujgBBwaQwLiZtSSDDkOJDEtTPyXYK+iy1hA1ZlEy7k79X8
	RUxQeQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410kywpt1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 08:34:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G8YVoU018495
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 08:34:31 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 16 Aug
 2024 01:34:26 -0700
Message-ID: <7fda5617-485a-4218-9cd5-bdb9deee0b56@quicinc.com>
Date: Fri, 16 Aug 2024 14:04:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: qcm6490-idp: Update protected
 clocks list
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <quic_jkona@quicinc.com>,
        <quic_imrashai@quicinc.com>, <devicetree@vger.kernel.org>
References: <20240531102252.26061-1-quic_tdas@quicinc.com>
 <20240531102252.26061-4-quic_tdas@quicinc.com>
 <4dvqegoz45ct5rqknf6vgi6rvh4osaecfyp7fcrs26lcsq4npu@dwoyubuqlbss>
 <3710a210-265c-493d-9d2f-27ebf486d00e@quicinc.com>
 <qiwy4uyxdrzp2omabh5nacdi37plomua22xsduvpatvb2pcp26@il6ncp7iluj6>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <qiwy4uyxdrzp2omabh5nacdi37plomua22xsduvpatvb2pcp26@il6ncp7iluj6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: B3_sqfB9ipmjy1fWWtqPFODhIaXLd1wb
X-Proofpoint-GUID: B3_sqfB9ipmjy1fWWtqPFODhIaXLd1wb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160061



On 6/10/2024 11:51 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 10, 2024 at 03:57:34PM +0530, Taniya Das wrote:
>>
>>
>> On 5/31/2024 5:34 PM, Dmitry Baryshkov wrote:
>>> On Fri, May 31, 2024 at 03:52:51PM +0530, Taniya Das wrote:
>>>> Certain clocks are not accessible on QCM6490-IDP board,
>>>> thus mark them as protected. Update the lpassaudio node to
>>>> support the new compatible as the lpassaudio needs to support
>>>> the reset functionality on the QCM6490 board and the rest of
>>>> the Audio functionality would be provided from the LPASS
>>>> firmware.
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 28 +++++++++++++++++++++++-
>>>>    1 file changed, 27 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>>>> index a0668f767e4b..4eece564331a 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>>>> @@ -1,6 +1,6 @@
>>>>    // SPDX-License-Identifier: BSD-3-Clause
>>>>    /*
>>>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>     */
>>>>    /dts-v1/;
>>>> @@ -688,3 +688,29 @@
>>>>    &wifi {
>>>>    	memory-region = <&wlan_fw_mem>;
>>>>    };
>>>> +
>>>> +&gcc {
>>>> +	protected-clocks = <GCC_AGGRE_NOC_PCIE_1_AXI_CLK> ,<GCC_PCIE_1_AUX_CLK>,
>>>> +			<GCC_PCIE_1_AUX_CLK_SRC>, <GCC_PCIE_1_CFG_AHB_CLK>,
>>>> +			<GCC_PCIE_1_MSTR_AXI_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
>>>> +			<GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
>>>> +			<GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
>>>> +			<GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
>>>> +			<GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
>>>> +			<GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
>>>> +			<GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
>>>> +			<GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
>>>> +			<GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
>>>> +			<GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
>>>> +			<GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
>>>> +			<GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
>>>> +			<GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
>>>> +			<GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
>>>> +			<GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
>>>> +			<GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;
>>>
>>> Is there any reason why this list is significantly larger than a list
>>> for RB3g2 or FP5?
>>>
>>
>> Unfortunately these are all protected on the IDP board and any access would
>> cause a NoC error and then board will fail to boot up.
> 
> Why? I mean, why does it contain the clocks that are allowed to be
> touched on RB3g2 and FP5?
> 

There are some use case level and board functionality changes between 
RB3g2/FP5 vs IDP. Thus these clocks are protected and cannot be accessed.

-- 
Thanks & Regards,
Taniya Das.

