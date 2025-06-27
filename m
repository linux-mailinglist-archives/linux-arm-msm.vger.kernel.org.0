Return-Path: <linux-arm-msm+bounces-62747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D6DAEB422
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 12:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FF8C7B819E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 10:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949D629A32A;
	Fri, 27 Jun 2025 10:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IyM2L3Rw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2961299A93;
	Fri, 27 Jun 2025 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019251; cv=none; b=gIM56plqA5rmfAa+u60tbU0MfKtZTKZk4J8zw6U62BZOYoq2hfzVDu5605uBfimY7HVCIVZ5IKtfF2uGP9l+fVwpJMXK3uwq1OkWBv/bwryMokyzBq/lsrodYsZI1o7ptYQi0joBYMbD+ZHMaUPns0K+F1SRw98WsI6UifrI70c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019251; c=relaxed/simple;
	bh=8BWuLnGZyNe1IdI4PvN5SHysfziaBNx00RMaZBO2Z64=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=m0Vo0XKbBEwNk8JuP88hIYTN5OmcZAsqGx2uXuu0xErfuf8VYvXIH/Dqy65ywLR527K1TfGhYwXs72MdgSJv4dib8KPDA/K9gxmnN7k6cc/Rl05iqVDfoWLzyw/UV0wCK/dh92fvDs0yuSXYP3x8y3CxEnnju0y4Gz8SYai87G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IyM2L3Rw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4D2UE027381;
	Fri, 27 Jun 2025 10:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o9gExB8qngC32GYREHosqCK0Ok2ayEYAjcDkJDPTGGs=; b=IyM2L3Rw+7gMNeTt
	qHyjo+jyAnNc6fn2mSYg+5bnLbUoKABJR3a8/pO9qjLTAr9pLYySYHPZZIi1TJlf
	92bSO4df5TyRRhrF173AcscW5HcLSNyDXSbk3G2ua+GxQOj16drKfzPTuUJuSYof
	S+B1yrfzuHqooGfZA6FRucdoefKO+anNGc32H1XgQKaaXKArhx3Z+yZ64ht7BzB3
	G/RB+HvkTvw/SskE1klXcTHGdxZXCe97E6OoSFwa0odIry5IyBYJZheoyVs3fKOA
	8GBPpYDBuNfCUOBK34NrJMFUPwYkOPIaF2pzMsVdhVd3PIJNiFjtxHseNSAMFCeY
	6hfZ2Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26gu7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 10:14:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RADxfB032595
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 10:13:59 GMT
Received: from [10.217.217.109] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Jun
 2025 03:13:54 -0700
Message-ID: <44dddd3f-d2d2-4d4b-831a-21e6d9050445@quicinc.com>
Date: Fri, 27 Jun 2025 15:43:49 +0530
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
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <trwdfk2oz2udtbiqxh3ybuqbvasfqywmqxgi4xyvsknz6svs2r@icpp7snpq6c5>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDA4MyBTYWx0ZWRfXxDbfDPh9Gw4w
 QQLNMYHi4qFHyxMn7xxfy4p1gRsc3ksdmHLT5Q9wZ9T1hskLSYVH3MQQyKjicJLi794AVtmBgLv
 hu/ne5ZPeHGv+1QANVvbly8f5+uvlWTNYL+bIle/9ch6cPyUZY914wgGL11HUgmSHLaxgtpHjDw
 xwb1QFSlU5BRY59jvoLjyky+I15UAIzNWSZgRqr8zDCn1d/0pKeH6QJv9/ZeKGdVw6Dqi92FvqY
 NGjd/XIA8HMFqxzEituAcf2jluLbQa5DnhGUhTugtIK6AVFQ6/t0hNCPBXL2KBh2Fp+5DI8AqHl
 3jI5FuBvf/3+gXrYOI6wdU7CMiRTcP9ZRFvzLrD4g1Jp8jy6etiMCR4bnGhsWPtIrY/+a1K3BaV
 2Hdm3S1PkHAYdumjSSVItsqsOWvc9u++niSgHvxNIfDtNJcI9YBubDPh6AZDL/ZuYFin6Ubf
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685e6ee8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=25x4RPGbu_Wr1P5MSWYA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 600Aztl8yIgBolypmsQcXWRCeJsUqr6X
X-Proofpoint-ORIG-GUID: 600Aztl8yIgBolypmsQcXWRCeJsUqr6X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_03,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270083



On 6/25/2025 5:17 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 25, 2025 at 04:13:26PM +0530, Taniya Das wrote:
>> The alpha PLLs which slew to a new frequency at runtime would require
>> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
>> which can support the slewing of the PLL to a new frequency.
>>
>> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>  drivers/clk/qcom/clk-alpha-pll.c | 169 +++++++++++++++++++++++++++++++++++++++
>>  drivers/clk/qcom/clk-alpha-pll.h |   1 +
>>  2 files changed, 170 insertions(+)
>>

>> +	/*
>> +	 * Dynamic pll update will not support switching frequencies across
>> +	 * vco ranges. In those cases fall back to normal alpha set rate.
>> +	 */
>> +	if (curr_vco->val != vco->val)
>> +		return clk_alpha_pll_set_rate(hw, rate, parent_rate);
>> +
>> +	a <<= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
>> +
>> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
> 
> We have code that does this in __clk_alpha_pll_set_rate() and now you
> are adding two more copies. Please extract PLL_L_VAL, PLL_ALPHA_VAL and
> PLL_USER_CTL / PLL_VCO_MASK into a helper function.
> 

Dmitry, I was thinking of implementing the following as a reusable
helper since it can be leveraged by most of the functions. I'd
appreciate your suggestions or feedback.

static void clk_alpha_pll_update_configs(struct clk_alpha_pll *pll,
const struct pll_vco *vco, u32 l, u64 a, u32 alpha_width, bool alpha_en)
{
	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);

	if (alpha_width > ALPHA_BITWIDTH)
		a <<= alpha_width - ALPHA_BITWIDTH;

	if (alpha_width > 32)
		regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));

	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));

	if (vco) {
		regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
				   PLL_VCO_MASK << PLL_VCO_SHIFT,
				   vco->val << PLL_VCO_SHIFT);
	}

	if (alpha_en)
		regmap_set_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_ALPHA_EN);
}


>> +
>> +	/* Ensure that the write above goes before slewing the PLL */
>> +	mb();
>> +
>> +	if (clk_hw_is_enabled(hw))
>> +		return clk_alpha_pll_slew_update(pll);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Slewing plls should be bought up at frequency which is in the middle of the
>> + * desired VCO range. So after bringing up the pll at calibration freq, set it
>> + * back to desired frequency(that was set by previous clk_set_rate).

>>
> 


