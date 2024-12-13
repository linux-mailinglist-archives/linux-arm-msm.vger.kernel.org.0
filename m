Return-Path: <linux-arm-msm+bounces-41959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB069F0947
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 769E9284A79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99AB1B4C35;
	Fri, 13 Dec 2024 10:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MUO1xWtq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA66563D;
	Fri, 13 Dec 2024 10:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734085201; cv=none; b=dDZ7RPs+2LFb6M7LElb/PrhZ6vh2URYz4EtoqqBYFgOGmvWNmKXfpu7uhc3X7gk1pim7AE1oPcmCwyXMcEhzosYmMUykH9uSmAJ1+Oh1xTwhqcNEdZCX/yjwlD1NDdeImZQQ80yHORth5SBjSKxU3Y9ZdSRqmGekFyOvwGGEyew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734085201; c=relaxed/simple;
	bh=mIztik0KHt4P+PYZlO/0EFcicfdXCm4F+pDDcCAJbnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qZ6Jzg+DCtpU8skUH+lLmekJnj06f+0gu11P1gKCaNAAEqesRCvW0komjYHzT1BlFCwq1uosHPW3+ZAULqNoU+j/NFUr8q9AJb2MkdmO5SaaKMTZw8lD4ASCD8nST0yx0m0wkaEcqneV56Z1vgY+VOX/FPwuIWg6A+AZy9z837E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MUO1xWtq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9h2N6007034;
	Fri, 13 Dec 2024 10:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQs+AGFMTO97O5R6hUE0mHw8+5TlLZpHfv1SqfOKcTo=; b=MUO1xWtqlE1DVJrg
	eeTbYA6lzlE+E0UHyAiRRREys7iFAjTcoN1U/wK0aGWKz1Wys5RxD/sCLwGn49+P
	+UPkNhr33HCKe4RTODFpaffvJJiZc1h+rrfVQphr4AuuK4/8RR/wh2DTva8Q7Ru6
	lkUj1Aj/bO66FzhIZA1NdHWZiu4XO2hStiPVwEZED7BpXz+7SAc2yd1Ugfrfhs08
	DvkBE5JDSdbgYAWKlp5sIWiv+NqNefjVHl4C78yMH+HoY9Y2TWmzxkgl5ivEgG9z
	3gTWsK1BTJGIntB3B0BTtXtZB037sgBcd1Fi6USS6ktIKsbuFP/9Ix1PWB1ndkcC
	i1VQ0Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g6xusrqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:19:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDAJnfg008946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:19:49 GMT
Received: from [10.235.8.17] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 02:19:43 -0800
Message-ID: <a3ddacc9-73cd-4214-9a39-5aaaa91fc93e@quicinc.com>
Date: Fri, 13 Dec 2024 18:19:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] clk: qcom: Add CMN PLL clock controller driver for
 IPQ SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>
References: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
 <20241107-qcom_ipq_cmnpll-v6-2-a5cfe09de485@quicinc.com>
 <7f0f2ad6-7895-46f8-8f80-0375dde2e763@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <7f0f2ad6-7895-46f8-8f80-0375dde2e763@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _L0bXBXUc9Ftttnz-VjMHWv1-PTyJ-YZ
X-Proofpoint-GUID: _L0bXBXUc9Ftttnz-VjMHWv1-PTyJ-YZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130070



On 12/13/2024 2:30 AM, Konrad Dybcio wrote:
> On 7.11.2024 10:50 AM, Luo Jie wrote:
>> The CMN PLL clock controller supplies clocks to the hardware
>> blocks that together make up the Ethernet function on Qualcomm
>> IPQ SoCs and to GCC. The driver is initially supported for
>> IPQ9574 SoC.
>>
>> The CMN PLL clock controller expects a reference input clock
>> from the on-board Wi-Fi block acting as clock source. The input
>> reference clock needs to be configured to one of the supported
>> clock rates.
>>
>> The controller supplies a number of fixed-rate output clocks.
>> For the IPQ9574, there is one output clock of 353 MHZ to PPE
>> (Packet Process Engine) hardware block, three 50 MHZ output
>> clocks and an additional 25 MHZ output clock supplied to the
>> connected Ethernet devices. The PLL also supplies a 24 MHZ
>> clock as XO and a 32 KHZ sleep clock to GCC, and one 31.25
>> MHZ clock to PCS.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
> 
> [...]
> 
>> +	/* Enable PLL locked detect. */
>> +	ret = regmap_update_bits(cmn_pll->regmap, CMN_PLL_CTRL,
>> +				 CMN_PLL_CTRL_LOCK_DETECT_EN,
>> +				 CMN_PLL_CTRL_LOCK_DETECT_EN);
>> +	if (ret)
> 
> you can streamline these with regmap_set/clear_bits

Ok, thanks, I will update to use it.

> 
>> +		return ret;
>> +
>> +	/*
>> +	 * Reset the CMN PLL block to ensure the updated configurations
>> +	 * take effect.
>> +	 */
>> +	ret = regmap_update_bits(cmn_pll->regmap, CMN_PLL_POWER_ON_AND_RESET,
>> +				 CMN_ANA_EN_SW_RSTN, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	usleep_range(1000, 1200);
>> +	ret = regmap_update_bits(cmn_pll->regmap, CMN_PLL_POWER_ON_AND_RESET,
>> +				 CMN_ANA_EN_SW_RSTN, CMN_ANA_EN_SW_RSTN);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Stability check of CMN PLL output clocks. */
>> +	return regmap_read_poll_timeout(cmn_pll->regmap, CMN_PLL_LOCKED, val,
>> +					(val & CMN_PLL_CLKS_LOCKED),
>> +					100, 100 * USEC_PER_MSEC);
>> +}
> 
> [...]
> 
>> +static int ipq_cmn_pll_clk_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = devm_pm_clk_create(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * To access the CMN PLL registers, the GCC AHB & SYSY clocks
> 
> SYS?
> 
> Konrad

Yes, I will correct it.


