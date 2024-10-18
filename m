Return-Path: <linux-arm-msm+bounces-35004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BD49A466B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 21:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C2FC281FB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 19:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CF82038BD;
	Fri, 18 Oct 2024 19:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fbFDe/FC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A641919005F;
	Fri, 18 Oct 2024 19:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729278137; cv=none; b=J+BCeiv356dLOkJE1KtQfON6ug51zUe7APYURQqJZnvyJvi2HRzGbhcdeH56IfKsD7ZwGavmslQESvv9EysonMBsXSfRZ2xHPMA71cskFf5Ht7cTFkUk3XpsuNVdpBmjyc+2Swio+n5uZ3G5XtMV9acofPJyIZ+wwu8DMTsOJaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729278137; c=relaxed/simple;
	bh=3qLJGJgwQmZKF7R9v5mGHWf94lA+iHOHhwvE5Re4eEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FeZcmvzyY+l6y6YnhTzDTTG0Gtt0LV8jmnbdFqWgiCvmM/Lm0b6n/ZpBALmGKZXjKYwwafFcuBoRuHaolqMtB+qska61PFUtXVad8Uz4A9SnolCrQxs5MFYRCNiL8bplukgCf1rjBA9UDlsQ3Qgwa4F6rClt1/U6dmpLSMMhpNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fbFDe/FC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IFEgvo010311;
	Fri, 18 Oct 2024 19:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5o28EwKwvwq6Tm7acsHeu9uHZtypZoM4nGj/A4stTiQ=; b=fbFDe/FC8utanOtv
	tW6FLcdIyFxOcjD8q62dUX/ki+cKdAEJeUBTQHxDZGMbC9wFh9jlZM4X6+XEqr1R
	8fgQgBeOAWTOeGh/I0B8Yes8ks1XBbn0rZecGq3K1Le07XePxOSRSnf8bVzEFPF0
	w7OSy4RXIvDrS0JfOgx7CRmE3in3VwIRt4wVTld7pm+Ngujn+Mywb5fe/M1ryjvE
	BVMrXTiRqYqIpIUFwShpn8MpJmAAfvq+E63LV5AlFlTIbkrRxRFAILmA/pXmpxJb
	cEW7y1E71G2UZgYs+p8ayC8VGpZqE8ptXPQKM+7K/Pm/EjTOXD0I3Ha1jnJHbvco
	VkPZZQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bt540k1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 19:02:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IJ26dU014982
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 19:02:06 GMT
Received: from [10.216.16.9] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 12:02:02 -0700
Message-ID: <d58dec6e-f77a-4663-9aca-706a462a5686@quicinc.com>
Date: Sat, 19 Oct 2024 00:31:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] clk: qcom: gcc: Add support for QCS615 GCC clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240920-qcs615-clock-driver-v2-0-2f6de44eb2aa@quicinc.com>
 <20240920-qcs615-clock-driver-v2-4-2f6de44eb2aa@quicinc.com>
 <gokgyvnunjswjdjmbhfvjzvdc6ag7r3dztj2hqk3cglwyz5f5a@aarbe4rrifme>
 <f1080f46-ed96-4360-ae91-0d5b7aa138ce@quicinc.com>
 <kgtg7seem6jhidn4svxttobwvs44uwezsj2f6hydjm7er4qt5d@kehfmwi437wg>
 <bdd2a873-3d5b-4986-a79c-d2bb54997b43@quicinc.com>
 <7bumydtmwbd7tecurxioqqzw4xj4rkm6mpm527fpwgetai5xzh@rdekj226xfbr>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <7bumydtmwbd7tecurxioqqzw4xj4rkm6mpm527fpwgetai5xzh@rdekj226xfbr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AGHmRrbnOVuQvy95MzP4JB2BY6UfLFBv
X-Proofpoint-GUID: AGHmRrbnOVuQvy95MzP4JB2BY6UfLFBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180121



On 10/19/2024 12:16 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 18, 2024 at 11:14:00PM +0530, Taniya Das wrote:
>>
>>
>> On 10/16/2024 3:46 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 16, 2024 at 09:40:07AM +0530, Taniya Das wrote:
>>>>
>>>>
>>>> On 9/20/2024 4:33 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, Sep 20, 2024 at 04:08:18PM GMT, Taniya Das wrote:
>>>>>> Add the global clock controller support for QCS615 SoC.
>>>>>>
>>>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>>>> ---
>>>>>>     drivers/clk/qcom/Kconfig      |    9 +
>>>>>>     drivers/clk/qcom/Makefile     |    1 +
>>>>>>     drivers/clk/qcom/gcc-qcs615.c | 3035 +++++++++++++++++++++++++++++++++++++++++
>>>>>>     3 files changed, 3045 insertions(+)
>>
>>>>>> +};
>>>>>> +
>>>>>> +static struct clk_alpha_pll gpll0 = {
>>>>>> +	.offset = 0x0,
>>>>>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>>>>>> +	.clkr = {
>>>>>> +		.enable_reg = 0x52000,
>>>>>> +		.enable_mask = BIT(0),
>>>>>> +		.hw.init = &(const struct clk_init_data) {
>>>>>> +			.name = "gpll0",
>>>>>> +			.parent_data = &(const struct clk_parent_data) {
>>>>>> +				.index = DT_BI_TCXO,
>>>>>> +			},
>>>>>> +			.num_parents = 1,
>>>>>> +			.ops = &clk_alpha_pll_ops,
>>>>>> +		},
>>>>>> +	},
>>>>>> +};
>>>>>> +
>>>>>> +static struct clk_fixed_factor gpll0_out_aux2_div = {
>>>>>> +	.mult = 1,
>>>>>> +	.div = 2,
>>>>>> +	.hw.init = &(struct clk_init_data) {
>>>>>> +		.name = "gpll0_out_aux2_div",
>>>>>> +		.parent_data = &(const struct clk_parent_data) {
>>>>>> +			.hw = &gpll0.clkr.hw,
>>>>>> +		},
>>>>>> +		.num_parents = 1,
>>>>>> +		.ops = &clk_fixed_factor_ops,
>>>>>> +	},
>>>>>> +};
>>>>>
>>>>> Should it be clk_alpha_pll_postdiv_foo_ops ?
>>>>>
>>>>
>>>> This is not the PLL output, but it is a fixed divider which is placed as
>>>> input to the RCG.
>>>> That is the reason to use the fixed factor.
>>>
>>> Usually OUT_AUX2 is the PLL output, isn't it? Even by its name. See
>>> gcc-qcm2290 / gcc-sm6115 and most of other clock controller drivers,
>>> except gcc-sm6125. Maybe I don't understand the difference between the
>>> two usecases. Is there a difference in the GCC / PLL design?
>>>
>>
>> Yes, your understanding is correct out_aux2/out_main are the PLL leaf
>> outputs. But on QCS615 the PLL dividers are not used and thus the aux2 and
>> the other leaf outputs are at the same frequency as the main output of the
>> VCO and instead there was a fixed divider placed after the PLL to divide the
>> VCO output. There was a GCC design change required to meet timing closures.
> 
> Ack, please add a comment that this PLL uses fixed divider instead of
> a normal postdiv (and to other out_aux2 clocks too).
> 

Thank you. Sure, will update the comment in the next patch set.

>>>>>
>>>>>> +
>>>>>> +static struct clk_branch gcc_pcie_0_pipe_clk = {
>>>>>> +	.halt_reg = 0x6b024,
>>>>>> +	.halt_check = BRANCH_HALT_SKIP,
>>>>>> +	.clkr = {
>>>>>> +		.enable_reg = 0x5200c,
>>>>>> +		.enable_mask = BIT(4),
>>>>>> +		.hw.init = &(const struct clk_init_data) {
>>>>>> +			.name = "gcc_pcie_0_pipe_clk",
>>>>>> +			.ops = &clk_branch2_ops,
>>>>>> +		},
>>>>>> +	},
>>>>>> +};
>>>>>
>>>>> No corresponding gcc_pcie_0_pipe_clk_src?
>>>>>
>>>>
>>>> On QCS615 the pipe clock source is not required to be modelled as the mux is
>>>> default Power on reset is set to external pipe clock.
>>>
>>> And do we need to toggle the source of the clk_src together with the
>>> GDSC toggling?
>>>
>>
>> AFAIR, QCS615 didn't require toggling for GDSC, as even on downstream kernel
>> we do not have the pipe_clk_src modelled in our driver.
> 
> OK, thanks for the explanation.
> 

-- 
Thanks & Regards,
Taniya Das.

