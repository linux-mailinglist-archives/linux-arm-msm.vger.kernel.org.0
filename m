Return-Path: <linux-arm-msm+bounces-63327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1658AAF0E42
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 10:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2407B1C20218
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 08:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706FD23ABB9;
	Wed,  2 Jul 2025 08:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OnKdYIJO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA9C23A995;
	Wed,  2 Jul 2025 08:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445817; cv=none; b=lAdx9wzKkVwbwVtoG+SHrTWEH8ml53slJK/9oTaxLrRzChqvYG6luv7c3ggkNFRh8dEpxHTWS0BAmlAeNgnDcM5Sl9tuEIPL1YUULIL5kLmMUbBuQdwlos6uiEA2x0z3hQsU2dksov93+TzpA3eEDxTDO9X31Ge4sFVEkn/vtbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445817; c=relaxed/simple;
	bh=/Mj9IbvLmcEdXds6zDfjwnUJ2vNA7j8nuWO6n4VjrAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Kr09WIohx0Fgyi7Q5V8r4kKqylv91z99UE5Lp/ptv09iVosSmB8s1XjFi1EptNe/RvNrOHikzymALXP+nHtmM/Q5UhU8ARl0h4J8SGWbvd24jsahvUxaamp2iXo9LY3sOuDCSIs5uvo13GghhbpfL9ek14YZwNzz16GW13WV0y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OnKdYIJO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5622U1Sk020544;
	Wed, 2 Jul 2025 08:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5RbAHSbae8Jj29ZSVUOTUguuPqjViFL1e6ZVXS1jCfM=; b=OnKdYIJOX6kzgIG8
	FV16+1iUUADbnb2TMJxRqharHmeXLLVOUrxS7d+YgGmVfKsXerCrndtTsDldyAvz
	kxumGv5iYwwat7kIxw2wulzNc9VT8Zp5Zrk1+/C1UUSx2zThH/20yt/rWonQE3Oz
	k0f6W5XaOi7lJK352QnAcjtoP1X8eB+BNiUsZXzWa5HKRr+uBLVXtw73bO4gTZ+4
	7DQ23C2tcEaRtctCutfQBom1elKcfPwJp+sHGG9iAEFuF8LoYehusXtydKbUEv+7
	LVYR19vjPc99RLUeYnnmGsr4VO2pHpFY8hN45HuPRe54LIIq5NOXlPCwfUZTaAzR
	kilxNA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn2h0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 08:43:25 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5628hOmg031410
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 08:43:24 GMT
Received: from [10.217.217.109] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 2 Jul
 2025 01:43:19 -0700
Message-ID: <4884d189-e43a-4932-af52-e1987bd7106c@quicinc.com>
Date: Wed, 2 Jul 2025 14:13:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit
 Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
 <20250625-qcs615-mm-v10-clock-controllers-v10-1-ec48255f90d8@quicinc.com>
 <trwdfk2oz2udtbiqxh3ybuqbvasfqywmqxgi4xyvsknz6svs2r@icpp7snpq6c5>
 <44dddd3f-d2d2-4d4b-831a-21e6d9050445@quicinc.com>
 <667ac51f-d19d-4832-9aa6-97d9a86e0068@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <667ac51f-d19d-4832-9aa6-97d9a86e0068@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA2OSBTYWx0ZWRfX8VcgtUhyolYE
 VzR1RXp2VdwzTnrCopUKekm8qLZdpBh04QtuOXo8dJbDQSw6Xdzy5vJXf0uwXBd0gE1aa6GsjHo
 Eq+UP46sNtfjAeq0r6rmQR+hFAGW8QHhIQPsFG02d9wVQjZEnsWHUlimx8kgUQDz2Tx5T08bBWz
 uNuIKtPGXHKOL3uraFUOsUTvmz3poHoZ/yUzl+H9asmRwnfqfQeWF1I+IZP50hIQ6VxFYyaAR5E
 wHEV9PYb8SU80DNxm+H//JlkA2n8jatGeYH2Ki3+D62sWbv1C1iLh3PLNmC2LKwriw7ZwchtZJ3
 akOnR5a/x4eHFOkcnUDFkP2mUp9EVM0qKDSMkb2FV4YNUnZBDbCmxJ22apKKaBEJCiPm6e8Oyip
 1H+wf4BEMLPTPrqbZXcRldcfRexN0Anbj//UTVeDhHD33hH2BmEQxNhIAj9P1m0NaToa5yMR
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6864f12d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=O75FsbJ6qr0OxAJT8SUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: z_qDogjY66KuJUuri63Fz3YxX51oqibx
X-Proofpoint-GUID: z_qDogjY66KuJUuri63Fz3YxX51oqibx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020069



On 6/27/2025 6:07 PM, Dmitry Baryshkov wrote:
> On 27/06/2025 13:13, Taniya Das wrote:
>>
>>
>> On 6/25/2025 5:17 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jun 25, 2025 at 04:13:26PM +0530, Taniya Das wrote:
>>>> The alpha PLLs which slew to a new frequency at runtime would require
>>>> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
>>>> which can support the slewing of the PLL to a new frequency.
>>>>
>>>> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>>   drivers/clk/qcom/clk-alpha-pll.c | 169 +++++++++++++++++++++++++++
>>>> ++++++++++++
>>>>   drivers/clk/qcom/clk-alpha-pll.h |   1 +
>>>>   2 files changed, 170 insertions(+)
>>>>
>>
>>>> +    /*
>>>> +     * Dynamic pll update will not support switching frequencies
>>>> across
>>>> +     * vco ranges. In those cases fall back to normal alpha set rate.
>>>> +     */
>>>> +    if (curr_vco->val != vco->val)
>>>> +        return clk_alpha_pll_set_rate(hw, rate, parent_rate);
>>>> +
>>>> +    a <<= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
>>>> +
>>>> +    regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
>>>> +    regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll),
>>>> lower_32_bits(a));
>>>> +    regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll),
>>>> upper_32_bits(a));
>>>
>>> We have code that does this in __clk_alpha_pll_set_rate() and now you
>>> are adding two more copies. Please extract PLL_L_VAL, PLL_ALPHA_VAL and
>>> PLL_USER_CTL / PLL_VCO_MASK into a helper function.
>>>
>>
>> Dmitry, I was thinking of implementing the following as a reusable
>> helper since it can be leveraged by most of the functions. I'd
>> appreciate your suggestions or feedback.
> 
> The code below looks good to me. Please use 'alpha' instead of 'a'.

Thanks, I will use 'alpha' in the next patch.


Taniya


