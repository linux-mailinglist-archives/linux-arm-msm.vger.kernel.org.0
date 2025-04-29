Return-Path: <linux-arm-msm+bounces-56011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C36FEAA01D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 07:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2C2E3A6575
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 05:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E151C26FA4E;
	Tue, 29 Apr 2025 05:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RUsKp4F7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFBD33991;
	Tue, 29 Apr 2025 05:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745904564; cv=none; b=ihcJIU7s4QqJSjAotJEC0TIBJloLhmMLXh/bx3lA5W+C29147bXUobR6kAf5LJ0t6vvhSp/4lJeJtrio1KzgxP29nBZ0xL9P+Ynxqt9tt4PO4k3/C2S614KhKQhOA77VycOixu76OXaN4VSwzvRTe/spHjhwZiJiucSyT+xuPgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745904564; c=relaxed/simple;
	bh=DWnooSZisXUGuTBqysXae7ajGZ4rfxElf22/6kndtf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kMRO6JuspmY+asANx4LyVKQrgoEAoO8jeQG8VOPaQc9eZ2fvAlG5lodK8biYP/i1rRCcR0fUY7pIbgIMVk5MLKdvmqnNexnX892u4paP8tk746PaJ/4K8ol3Pyhio3A4q1z5md1gbCCP5SA2rX7HQ4//PS2+WfiCLvFjvVFO/DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RUsKp4F7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq3oU011884;
	Tue, 29 Apr 2025 05:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YD5zksmB7I1X+fW3UQmzEm1ZQxDOj3cvQhmL1m2hSJ8=; b=RUsKp4F76jZAesnG
	Lmi8AmeWh+5AQ6wrQjeCcEF7uoik6gLjVwojPEkT4V+U7K7TGrKpeJb3ffmWD9EU
	T2a8LZ4ImQi+p4ILxqe0A3bsRvN2hP5mVGb95/1rtYqKIFHLDWqUlNfMmuXLtga4
	8PVmrxZcz6+PyGslhFQPOBQPzCLULEF07GrSj2fBEAbSVVKJ2jYja18tsWkmqtWO
	qPqzTl3d+DH93k/JwGbItUna+4QpueRm74ARFT5gHonadYCCjlPEmQubueDLd9nd
	M5AyngXQ09/FgacnRbTiWZY2umoDaUDRaXWVV1LfNd15kyUCrRvmV7OEHf647wVB
	TILH7A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q323a6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:29:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T5TH66004716
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 05:29:17 GMT
Received: from [10.253.10.189] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 22:29:13 -0700
Message-ID: <5eb5631f-8f58-44d8-a09f-4bdb4a804803@quicinc.com>
Date: Tue, 29 Apr 2025 13:29:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: qcom: cmnpll: Add IPQ5424 SoC support
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>
References: <20250411-qcom_ipq5424_cmnpll-v2-0-7252c192e078@quicinc.com>
 <20250411-qcom_ipq5424_cmnpll-v2-2-7252c192e078@quicinc.com>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <20250411-qcom_ipq5424_cmnpll-v2-2-7252c192e078@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=681063ae cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EoNoD8iO1MgKQcc7a8EA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Pl3nitARsFZhOdhnopxa6zb_61xV84zF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAzOCBTYWx0ZWRfX/yc+e93SWxap y9vedPW2lPXjIf2TEsq3FtyfWPF7hnADF/U0kGKgouz796wbW1GN8u6SEhHJKrE6TONzPRFKRGy I0rWGclBZ3aMRHc/G7MZY5bO2TLXO7iotfTIBBj4F9c+EnLsCA3joflz7TKdSlKMHD1K2MnKoWz
 SjjW+aJYiw/x39K/JRUuCYsC9qmZDvHDjB5xufxxd8Qm0A/tSXSl27pi9fjwE7vSeyFFX7GWmOL e/bxFTogk+fN6cltY20N1Q7tRAmIyvjMYRmT1J4u2JO71xfj+K4qaaOrkzoICHn9lyh0kv47WwL OHKZVDRHUmS42Rmy2TJVrYXSjDWq/bWzaICTZVyDgMQRc67Ip6awabwJgxQMh+WZepwb8wv48lH
 o7JFO1+1esh7fp2U527Oii4KfjqDBxBto/9Ula/NecCP7OujcPgkjfM5sGjdvvEIvr8jOJ4l
X-Proofpoint-ORIG-GUID: Pl3nitARsFZhOdhnopxa6zb_61xV84zF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290038

Hello Stephen,

Thanks for your review on the first version of this patch series.
Gentle reminder, to re-review the updated patch for any further
comments.

Regards.

On 4/11/2025 8:58 PM, Luo Jie wrote:
> The CMN PLL in IPQ5424 SoC supplies the fixed clock to NSS at 300 MHZ
> and to PPE at 375 MHZ. Other output clocks from CMN PLL on this SoC,
> and their rates are same as IPQ9574.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>   drivers/clk/qcom/ipq-cmn-pll.c | 35 ++++++++++++++++++++++++++++++-----
>   1 file changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
> index 432d4c4b7aa6..b34d6faf67b8 100644
> --- a/drivers/clk/qcom/ipq-cmn-pll.c
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   /*
> @@ -16,6 +16,10 @@
>    * are supplied to GCC (24 MHZ as XO and 32 KHZ as sleep clock), and to PCS
>    * with 31.25 MHZ.
>    *
> + * On the IPQ5424 SoC, there is an output clock from CMN PLL to PPE at 375 MHZ,
> + * and an output clock to NSS (network subsystem) at 300 MHZ. The other output
> + * clocks from CMN PLL on IPQ5424 are the same as IPQ9574.
> + *
>    *               +---------+
>    *               |   GCC   |
>    *               +--+---+--+
> @@ -46,6 +50,7 @@
>   #include <linux/regmap.h>
>   
>   #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
> +#include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
>   
>   #define CMN_PLL_REFCLK_SRC_SELECTION		0x28
>   #define CMN_PLL_REFCLK_SRC_DIV			GENMASK(9, 8)
> @@ -115,6 +120,20 @@ static const struct cmn_pll_fixed_output_clk ipq9574_output_clks[] = {
>   	CLK_PLL_OUTPUT(ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL),
>   	CLK_PLL_OUTPUT(ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL),
>   	CLK_PLL_OUTPUT(ETH_25MHZ_CLK, "eth-25mhz", 25000000UL),
> +	{ /* Sentinel */ }
> +};
> +
> +static const struct cmn_pll_fixed_output_clk ipq5424_output_clks[] = {
> +	CLK_PLL_OUTPUT(IPQ5424_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
> +	CLK_PLL_OUTPUT(IPQ5424_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
> +	CLK_PLL_OUTPUT(IPQ5424_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL),
> +	CLK_PLL_OUTPUT(IPQ5424_NSS_300MHZ_CLK, "nss-300mhz", 300000000UL),
> +	CLK_PLL_OUTPUT(IPQ5424_PPE_375MHZ_CLK, "ppe-375mhz", 375000000UL),
> +	CLK_PLL_OUTPUT(IPQ5424_ETH0_50MHZ_CLK, "eth0-50mhz", 50000000UL),
> +	CLK_PLL_OUTPUT(IPQ5424_ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL),
> +	CLK_PLL_OUTPUT(IPQ5424_ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL),
> +	CLK_PLL_OUTPUT(IPQ5424_ETH_25MHZ_CLK, "eth-25mhz", 25000000UL),
> +	{ /* Sentinel */ }
>   };
>   
>   /*
> @@ -297,7 +316,7 @@ static struct clk_hw *ipq_cmn_pll_clk_hw_register(struct platform_device *pdev)
>   
>   static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
>   {
> -	const struct cmn_pll_fixed_output_clk *fixed_clk;
> +	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
>   	struct clk_hw_onecell_data *hw_data;
>   	struct device *dev = &pdev->dev;
>   	struct clk_hw *cmn_pll_hw;
> @@ -305,8 +324,13 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
>   	struct clk_hw *hw;
>   	int ret, i;
>   
> -	fixed_clk = ipq9574_output_clks;
> -	num_clks = ARRAY_SIZE(ipq9574_output_clks);
> +	fixed_clk = device_get_match_data(dev);
> +	if (!fixed_clk)
> +		return -EINVAL;
> +
> +	num_clks = 0;
> +	for (p = fixed_clk; p->name; p++)
> +		num_clks++;
>   
>   	hw_data = devm_kzalloc(dev, struct_size(hw_data, hws, num_clks + 1),
>   			       GFP_KERNEL);
> @@ -415,7 +439,8 @@ static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
>   };
>   
>   static const struct of_device_id ipq_cmn_pll_clk_ids[] = {
> -	{ .compatible = "qcom,ipq9574-cmn-pll", },
> +	{ .compatible = "qcom,ipq9574-cmn-pll", .data = &ipq9574_output_clks },
> +	{ .compatible = "qcom,ipq5424-cmn-pll", .data = &ipq5424_output_clks },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, ipq_cmn_pll_clk_ids);
> 


