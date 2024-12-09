Return-Path: <linux-arm-msm+bounces-41060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC5E9E9391
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C833165221
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F0B227588;
	Mon,  9 Dec 2024 12:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AGBr6oI7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFFE227581;
	Mon,  9 Dec 2024 12:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746301; cv=none; b=k+Tkx+OG3rdkWe+KG5RSagNmP3XmzSRvMQpqRGL6bWRQMGnHYHkDRVeHUmqFg7fUhOcMSOgj5insn/EEYXswUCEJyrQp7lIttIlrI7zRrtV0b+ht3i06qFk4WYMeaGzf6kGXUwM61IVBVbt7obCqpnY5PTCjaPOlWduN2iq3+xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746301; c=relaxed/simple;
	bh=9XibONZU9a9Q8okfbU0WP6mWeKHcWBaE3xTZhD6aJdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AiDYERaMbT40tsZyZ5o3ks1zxb+ExM8p2O9ZQvCbC6oOeDzHJF5antjcKfCEA+lMIaVcEcF6xvAhCGKVeM9cnvLvxNn0BeF+9QnIFB6nT4OY3a5VlhjzuRS7Yu/AUWe7qRL5+xPQsXiD78LZmrVr4KcKqxKk/xVHCH0EqDTu+QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AGBr6oI7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9Aaf9e023581;
	Mon, 9 Dec 2024 12:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2d1epkqFH3jvvmJ4YNIHzTpA7APESqdOMC6Q17ONsSw=; b=AGBr6oI7A6/jsCi0
	T8mbTgjMd8DGoZXsgdKP09BnXagrXpzPAVQVpewUYjiDAie8ByXqDmwjnH01+mp3
	qMYMhtVRfztTjFVGJS89LkyE7sfx9iVxPesJMizSdzZuRzQ+qFRJc33jHkkzzDf5
	kMMSIOu5vi5QnxOE1zbYJHf7A5qCO0llmCr19UiP413Umery9QlssZwbXAzyTMfA
	T3PFz5uzRrapjYjr/z/MLj66Mk+84duX6kZlK9DoGGIZNYlVs4IhuFody7AxzQGL
	3Nfhq038mC+E/U9fCsUzp30CXG/ine8sbZjc9KrIE4n4U0FihubHNde0jNJICtKy
	oS3img==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cfhkchys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 12:11:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9CB6Ma032414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 12:11:06 GMT
Received: from [10.253.38.68] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 04:11:00 -0800
Message-ID: <25619909-90c2-40a8-9e49-83ab26b6cf79@quicinc.com>
Date: Mon, 9 Dec 2024 20:10:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] Add CMN PLL clock controller driver for IPQ9574
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
References: <20241106-qcom_ipq_cmnpll-v6-0-9d398db2fe0f@quicinc.com>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <20241106-qcom_ipq_cmnpll-v6-0-9d398db2fe0f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nB23Cp8rjEWwJoZ9YLt_mk0m4rYZYATy
X-Proofpoint-GUID: nB23Cp8rjEWwJoZ9YLt_mk0m4rYZYATy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090096



On 11/6/2024 6:52 PM, Luo Jie wrote:
> The CMN PLL clock controller in Qualcomm IPQ chipsets provides
> the clocks to the networking hardware blocks that are internal
> or external to the SoC, and to the GCC. This driver configures
> the CMN PLL clock controller to enable the output clocks. The
> networking blocks include the internal blocks such as PPE
> (Packet Process Engine) and PCS blocks, and external hardware
> such as Ethernet PHY or switch. The CMN PLL block also outputs
> fixed rate clocks to GCC, such as 24 MHZ as XO clock and 32 KHZ
> as sleep clock supplied to GCC.
> 
> The controller expects the input reference clock from the internal
> Wi-Fi block acting as the clock source. The output clocks supplied
> by the controller are fixed rate clocks.
> 
> The CMN PLL hardware block does not include any other function
> other than enabling the clocks to the networking hardware blocks
> and GCC.
> 
> The driver is being enabled to support IPQ9574 SoC initially, and
> will be extended for other SoCs.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
> Changes in v6:
> - Rename the reference clock of CMN PLL to ref_48mhz_clk.
> - Add the patch to update xo_board_clk to use fixed factor clock.
> - Link to v5: https://lore.kernel.org/r/20241028-qcom_ipq_cmnpll-v5-0-339994b0388d@quicinc.com
> 
> Changes in v5:
> - Move the hardware configurations into set_rate() from determine_rate().
> - Remove the dependency on IPQ_GCC_9574.
> - Correct the header files included.
> - Update reference clock of CMN PLL to use fixed factor clock.
> - Link to v4: https://lore.kernel.org/r/20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com
> 
> Changes in v4:
> - Rename driver file to ipq-cmn-pll.c
> - Register CMN PLL as a 12 GHZ clock.
> - Configure CMN PLL input ref clock using clk_ops::determine_rate().
>    Add the additional output clocks to GCC and PCS.
> - Update the same information in dtbindings.
> - Use PM clock APIs for input clock enablement.
> - Link to v3: https://lore.kernel.org/r/20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com
> 
> Changes in v3:
> - Update description of dt-binding to explain scope of 'CMN' in CMN PLL.
> - Collect Reviewed-by tags for dtbindings and defconfig patches.
> - Enable PLL_LOCKED check for the stability of output clocks.
> - Link to v2: https://lore.kernel.org/r/20240820-qcom_ipq_cmnpll-v2-0-b000dd335280@quicinc.com
> 
> Changes in v2:
> - Rename the dt-binding file with the compatible.
> - Remove property 'clock-output-names' from dt-bindings and define
>    names in the driver. Add qcom,ipq-cmn-pll.h to export the output
>    clock specifier.
> - Alphanumeric ordering of 'cmn_pll_ref_clk' node in DTS.
> - Fix allmodconfig error reported by test robot.
> - Replace usage of "common" to "CMN" to match the name with the
>    hardware specification.
> - Clarify in commit message on scope of CMN PLL function.
> - Link to v1: https://lore.kernel.org/r/20240808-qcom_ipq_cmnpll-v1-0-b0631dcbf785@quicinc.com
> 
> ---
> Luo Jie (5):
>        dt-bindings: clock: qcom: Add CMN PLL clock controller for IPQ SoC
>        clk: qcom: Add CMN PLL clock controller driver for IPQ SoC
>        arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock controller
>        arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
>        arm64: dts: qcom: Update IPQ9574 xo_board_clk to use fixed factor clock
> 
>   .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  85 ++++
>   arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |  23 +-
>   arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  27 +-
>   arch/arm64/configs/defconfig                       |   1 +
>   drivers/clk/qcom/Kconfig                           |   9 +
>   drivers/clk/qcom/Makefile                          |   1 +
>   drivers/clk/qcom/ipq-cmn-pll.c                     | 436 +++++++++++++++++++++
>   include/dt-bindings/clock/qcom,ipq-cmn-pll.h       |  22 ++
>   8 files changed, 601 insertions(+), 3 deletions(-)
> ---
> base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
> change-id: 20241014-qcom_ipq_cmnpll-bde0638f4116
> 
> Best regards,

Hello Bjorn, Stephen, Dmitry,

Gentle reminder, to re-review the updated patch series V6 at your
convenience to let me know if this patch series is fine to be merged.
Thanks in advance.

