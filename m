Return-Path: <linux-arm-msm+bounces-21230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2398D5E6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDA201F23451
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E595485626;
	Fri, 31 May 2024 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OREKyfsA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687E7823C3;
	Fri, 31 May 2024 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717148105; cv=none; b=XIR6N0CYfNd/LLLMVTtPZqvEuhaqQ877Kwb0WA6bJK49xAjI+lyL4ymu5tEq8rQQSLFP7iZyD/lY0iwgrDQWvMQniDDzaU+FM94FZqSnQ/IXMZIBsWFkMAl/9E166NHmvaM7F1khu9cP4CrVa1nBLdgv4cLovc9y+SR7+B8N+m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717148105; c=relaxed/simple;
	bh=Cw6NjBZ2byZb0Evs0+ZgeDKCI22umh672J6NIRogw9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MHf7o31WSquUo1uHYMmZVH50SVQA1Wu9Nqx/HCjKStUCDezeRHTw7JZ5LFWGZNeWgMoNG3YGWjO+vUdPIxmsKJ1+XMyI98EAl6CQB4RNqPiQTTrxg54tzEhi2HlEZ6kAWrbvuv2b6dVl5kMrWskzXllZIahNB7w2HnIdmIFcNKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OREKyfsA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V8tmgx016230;
	Fri, 31 May 2024 09:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+JsPFS9PrUULdkHBchZWT/X6kJBuEOj4JVqpMgktZkU=; b=OREKyfsAHXmN+uut
	hRKBME4gt0NjqociwYw14Rl2LToMqE36ndCne2lXvakH6fNLomXrpKm2wkthR26u
	mj1UBYJzXxrNbHp14QPc7VDXzOHDiH8bakYIttjic8czKFIzGb8K3hLhOZITDY/6
	WDZGy8xJqL2tIkOfxSzTzBV5FC7BBW/XKRU2p05z1s8av4h06l5WZJAiaB6F5C8K
	yGE0ySAPiTd/6f4Ko9NmHHG3F9Qf2Fs8p0DrDIqyne0Duz/SLojCbGGVJX4eaavm
	9DEig8TMuebtomXYlQ2lqmjxo2s3/ApkN8ObyB0RFJc1A15I1O2JMKVdEvOXJGMv
	uCSLDA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yb9yjekxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:35:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V9YwAO002284
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:34:58 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 02:34:54 -0700
Message-ID: <9a2a4e55-e123-4f41-bfaa-563cf2e04f5a@quicinc.com>
Date: Fri, 31 May 2024 15:04:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: qcm6490-idp: Update protected
 clocks list
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd
	<sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
 <20240318053555.20405-8-quic_tdas@quicinc.com>
 <06c08855-3965-4d57-8bec-fba8544dee7d@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <06c08855-3965-4d57-8bec-fba8544dee7d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -VHo6E-qrod3w86Q0CzwEmxGe5eE_cK-
X-Proofpoint-ORIG-GUID: -VHo6E-qrod3w86Q0CzwEmxGe5eE_cK-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_05,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310069



On 3/18/2024 1:24 PM, Krzysztof Kozlowski wrote:
> On 18/03/2024 06:35, Taniya Das wrote:
>> Certain clocks are not accessible on QCM6490-IDP board,
>> thus mark them as protected. Update the lpassaudio node to
>> support the new compatible.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
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
>> +};
>> +
>> +&lpass_audiocc {
>> +	compatible = "qcom,qcm6490-lpassaudiocc";
> 
> What? Why do you override compatible for given board? This is a SoC
> block, not board!

On QCM6490-IDP and QCS690-RB3Gen2 boards, the HLOS Audio driver requires 
the support for the reset functionality only from the LPASS region.
Rest of the clocks functionality is controlled from LPASS firmware.

Hence, in the earlier series we marked all the clocks as protected and 
introduced new "qcom,adsp-skip-pll" flag to skip PLL configurations.
But as the flag was also not approved and the ask was to use the 
compatible string, we went ahead with this approach.

> 
> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

