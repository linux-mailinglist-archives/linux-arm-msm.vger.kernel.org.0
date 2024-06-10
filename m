Return-Path: <linux-arm-msm+bounces-22182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B40BC901F65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 12:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B5E9B29AE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 10:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AF87A702;
	Mon, 10 Jun 2024 10:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kFs1QQuA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFD415B3;
	Mon, 10 Jun 2024 10:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718015298; cv=none; b=Trb6+mck/zUY8q/kpDn58WD/duLZcj3xn3ZQxC1f6GNC7ppYcekMbqrCZ1E9YrBhvCadiNofCTLacUWckO2udf1U9AOdy9TnrxSbWK8utqrixrHx0Rd0AcQQIcQKJTCo3FsgiQODdyKNhGFg+n5NNsxVZbQqiaa7ua9lRPT30qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718015298; c=relaxed/simple;
	bh=VppLaZwdIzDPRXgBc45hQUcWc09/PIctN50tY/+9gfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hI/1XnHvwglvpVnw94GvllPfI9ZxuHaWsmzV3PCGG4XSk5ESJPKV0wUku9CX/Islbl4sS2gd/9i6lNkE6K2mq59Iuu3iBt87QwugWq3CnE5q/KgXeGo/zKEZ1zxoFsLELOORAyHXNltSeOyRGkmYFLDDQV5hd5EkRuq6SiQdG3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kFs1QQuA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A1UK8h018769;
	Mon, 10 Jun 2024 10:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g3w2uKhJ8Na0K7GW2N3B7O3jkirD+gODu3mdSz1ngq8=; b=kFs1QQuA+DflrYaE
	ORcAFT8uhMpMxiMuoJaTQmj03Sgi/hio45J3rIvW3Zgvj/uv8rmaVlQWBSY5rzOH
	YuJtbvce65NSAr7mv8IYk7N7SdiPeAClHiFldx5XL4rFsJlCTQZSPW1xf+kACcL3
	ev3oP2paF9u8r8CJZJGDNqImM3C90ccgAM2JBCr7KYlBg3cZgFWmYLjHAmvcpErm
	SBH/Dx1WnGcJDXCK3PmLadUVFxm+868DLZ7Igs6xUjK/wK6JOOPlXxA9YdLg8SHk
	MYM2zMjJbaPWf5tQgi9iHSMBxb2EbYQ8sgI/WkKEJENdmU5Ko0EDVvEe8wG9OmQO
	Wq5ysw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymemgk8ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 10:28:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45AARfWq021590
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 10:27:41 GMT
Received: from [10.218.0.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 03:27:37 -0700
Message-ID: <3710a210-265c-493d-9d2f-27ebf486d00e@quicinc.com>
Date: Mon, 10 Jun 2024 15:57:34 +0530
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
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <4dvqegoz45ct5rqknf6vgi6rvh4osaecfyp7fcrs26lcsq4npu@dwoyubuqlbss>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Pd1bGnX5RXDU_lRTA-PZrwOL6Jid8maJ
X-Proofpoint-ORIG-GUID: Pd1bGnX5RXDU_lRTA-PZrwOL6Jid8maJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406100078



On 5/31/2024 5:34 PM, Dmitry Baryshkov wrote:
> On Fri, May 31, 2024 at 03:52:51PM +0530, Taniya Das wrote:
>> Certain clocks are not accessible on QCM6490-IDP board,
>> thus mark them as protected. Update the lpassaudio node to
>> support the new compatible as the lpassaudio needs to support
>> the reset functionality on the QCM6490 board and the rest of
>> the Audio functionality would be provided from the LPASS
>> firmware.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 28 +++++++++++++++++++++++-
>>   1 file changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> index a0668f767e4b..4eece564331a 100644
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
>> @@ -688,3 +688,29 @@
>>   &wifi {
>>   	memory-region = <&wlan_fw_mem>;
>>   };
>> +
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
> Is there any reason why this list is significantly larger than a list
> for RB3g2 or FP5?
> 

Unfortunately these are all protected on the IDP board and any access 
would cause a NoC error and then board will fail to boot up.

>> +};
>> +
>> +&lpass_audiocc {
>> +	compatible = "qcom,qcm6490-lpassaudiocc";
>> +	/delete-property/ power-domains;
>> +};
> 
> Separate commits, please.

I will separate the commits.

> 
>> -- 
>> 2.17.1
>>
> 

-- 
Thanks & Regards,
Taniya Das.

