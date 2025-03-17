Return-Path: <linux-arm-msm+bounces-51585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 772AAA641E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 07:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 312377A2479
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 06:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185B2219A94;
	Mon, 17 Mar 2025 06:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZFif/tmq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E80C21931B;
	Mon, 17 Mar 2025 06:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742193633; cv=none; b=BHAgQRb3fT9U8KbitKieFeUjt8EOGHfkpAj/hrEIsyPyxBiPOudb2H66OqYtFLbCKkLgrJVg9Xu94jdH8wt/yIeLf1JzKniPAntknBcpCeIMV9ZxDnO4p1aL+E5rBOVeh2KWYMeUyWYM6YsFjGgAxnpWraUrYUeF4wrw3sqeTNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742193633; c=relaxed/simple;
	bh=kvym4Y1kHMdfeCqHXx/9Lrbd9BjykKpdH9yvTlY4xqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HWyJdDuubGb1hYacgdGpgQgHx+FmwRDTuf+GHZ2z5D/+8Ubj1WWoc0ArNJ6dZF5Cno7e34KB1vnLui9445+paaCdaxgpsZF0Y2O6BZb//eE2hmzsvgNLrJe6YSXQszWeDJFs9s5YDI0Qdhs/R53kjnEWJVdweTc5m1fIJKP3iH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZFif/tmq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52GNUWCF026414;
	Mon, 17 Mar 2025 06:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XqR/8Lr9ciR42DrxgBAE2S1qm0VN83ZWpi0qtm9sFxM=; b=ZFif/tmqasEFFMf8
	70g3dhdk6nwemn7jTCLnU2t5Ez8NR1eaF+E7Uv6hDKiDQ4TDxGpCtMxF8oD5KFg/
	b/f3CZBvzsyDaUmFl+FHsqRRlZfRVmIHB1+z2cga0fIGQRlcyLLQAZMU2rw6Ex6Q
	Q6t8nT+qa4jmtrN0ehu0Z4Ql1FFUJ4S7Kfs43fC1DGqDMEX6H5flvVL0vvLIM8Tv
	QdpUGlxV2BXMWgOLtMk/uXTNKDToVLVzk93QJDg2OGRIzh7t3UPVgXvueXE3XGyw
	1YrSeinynUASIRQ1k0DdO76FnTwOt7ivbvbKDvgC/1N8fAykVX1Ppi3s1IeozuEt
	lUsHiw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1u8bp5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 06:40:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52H6eLiI015440
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 06:40:21 GMT
Received: from [10.217.216.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 16 Mar
 2025 23:40:16 -0700
Message-ID: <fce2fe9e-5c1b-4fa9-b6ca-0a4ab5133e5a@quicinc.com>
Date: Mon, 17 Mar 2025 12:10:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
To: Bjorn Andersson <andersson@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
 <20250313-qcs615-v5-mm-cc-v6-1-ebf4b9a5e916@quicinc.com>
 <r6xikx2idlzwc4xl7doap3v5ug3a6qtg65jwqjuekiv7tvbwzn@5nk4c7nl2zws>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <r6xikx2idlzwc4xl7doap3v5ug3a6qtg65jwqjuekiv7tvbwzn@5nk4c7nl2zws>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jpL48WS3wXSe3L4YA7eOeVEzoPGbocVe
X-Authority-Analysis: v=2.4 cv=c42rQQ9l c=1 sm=1 tr=0 ts=67d7c3d6 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=p-S28tgwJCCmrtNokHgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jpL48WS3wXSe3L4YA7eOeVEzoPGbocVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_02,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170047



On 3/14/2025 5:09 AM, Bjorn Andersson wrote:
> On Thu, Mar 13, 2025 at 12:29:38PM +0530, Taniya Das wrote:
>> The alpha PLLs which slew to a new frequency at runtime would require
>> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
>> which can support the slewing of the PLL to a new frequency.
>>
>> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>  drivers/clk/qcom/clk-alpha-pll.c | 170 +++++++++++++++++++++++++++++++++++++++
>>  drivers/clk/qcom/clk-alpha-pll.h |   1 +
>>  2 files changed, 171 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index cec0afea8e446010f0d4140d4ef63121706dde47..7d784db8b7441e886d94ded1d3e3258dda46674c 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -2960,3 +2960,173 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
>>  	.set_rate = clk_zonda_pll_set_rate,
>>  };
>>  EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
>> +
>> +static int clk_alpha_pll_slew_update(struct clk_alpha_pll *pll)
>> +{
>> +	int ret;
>> +	u32 val;
>> +
>> +	regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_UPDATE, PLL_UPDATE);
>> +	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
>> +
>> +	ret = wait_for_pll_update(pll);
>> +	if (ret)
>> +		return ret;
>> +	/*
>> +	 * Hardware programming mandates a wait of at least 570ns before polling the LOCK
>> +	 * detect bit. Have a delay of 1us just to be safe.
>> +	 */
>> +	mb();
>> +	udelay(1);
>> +
>> +	return wait_for_pll_enable_lock(pll);
>> +}
>> +
>> +static int clk_alpha_pll_slew_set_rate(struct clk_hw *hw, unsigned long rate,
>> +					unsigned long parent_rate)
>> +{
>> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>> +	unsigned long freq_hz;
>> +	const struct pll_vco *curr_vco, *vco;
>> +	u32 l, alpha_width = pll_alpha_width(pll);
>> +	u64 a;
>> +
>> +	freq_hz =  alpha_pll_round_rate(rate, parent_rate, &l, &a, alpha_width);
> 
> Double space here.

Sure, needs a fix.

> 
>> +	if (freq_hz != rate) {
>> +		pr_err("alpha_pll: Call clk_set_rate with rounded rates!\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	curr_vco = alpha_pll_find_vco(pll, clk_hw_get_rate(hw));
>> +	if (!curr_vco) {
>> +		pr_err("alpha pll: not in a valid vco range\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	vco = alpha_pll_find_vco(pll, freq_hz);
>> +	if (!vco) {
>> +		pr_err("alpha pll: not in a valid vco range\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	/*
>> +	 * Dynamic pll update will not support switching frequencies across
>> +	 * vco ranges. In those cases fall back to normal alpha set rate.
>> +	 */
>> +	if (curr_vco->val != vco->val)
>> +		return clk_alpha_pll_set_rate(hw, rate, parent_rate);
>> +
>> +	a = a << (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
> 
> Above this function is written to deal with both alpha bitwidths, but
> here it's assumed to only be one of the cases.
> 
> It would be nice to get this cleaned up somehow, because we now have
> this shift 6 times in slightly different forms.
> 

I will check if I can clean up.

>> +
>> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), a >> 32);
> 
> In a number of places in the driver alpha_width is compared to 32 bits
> to see if this should be written or not. Perhaps that's not applicable
> here, but again, if so then why is it dynamic above?
> 
> 
> Also, how about upper_32_bits() and lower_32_bits() to make it clear
> what's going on here?
> 

Sure.


>> +
>> +	/* Ensure that the write above goes through before proceeding. */
> 
> That's not what mb() does.
> 
> Regards,
> Bjorn
> 
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
>> + */
>> +static int clk_alpha_pll_calibrate(struct clk_hw *hw)
>> +{
>> +	unsigned long calibration_freq, freq_hz;
>> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>> +	struct clk_hw *parent;
>> +	const struct pll_vco *vco;
>> +	u32 l, alpha_width = pll_alpha_width(pll);
>> +	int rc;
>> +	u64 a;
>> +
>> +	parent = clk_hw_get_parent(hw);
>> +	if (!parent) {
>> +		pr_err("alpha pll: no valid parent found\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	vco = alpha_pll_find_vco(pll, clk_hw_get_rate(hw));
>> +	if (!vco) {
>> +		pr_err("alpha pll: not in a valid vco range\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	/*
>> +	 * As during slewing plls vco_sel won't be allowed to change, vco table
>> +	 * should have only one entry table, i.e. index = 0, find the
>> +	 * calibration frequency.
>> +	 */
>> +	calibration_freq = (pll->vco_table[0].min_freq + pll->vco_table[0].max_freq) / 2;
>> +
>> +	freq_hz = alpha_pll_round_rate(calibration_freq, clk_hw_get_rate(parent),
>> +					&l, &a, alpha_width);
>> +	if (freq_hz != calibration_freq) {
>> +		pr_err("alpha_pll: call clk_set_rate with rounded rates!\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Setup PLL for calibration frequency */
>> +	a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
>> +
>> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), a >> 32);
>> +
>> +	regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_VCO_MASK << PLL_VCO_SHIFT,
>> +				vco->val << PLL_VCO_SHIFT);
>> +
>> +	/* Bringup the pll at calibration frequency */
>> +	rc = clk_alpha_pll_enable(hw);
>> +	if (rc) {
>> +		pr_err("alpha pll calibration failed\n");
>> +		return rc;
>> +	}
>> +
>> +	/*
>> +	 * PLL is already running at calibration frequency.
>> +	 * So slew pll to the previously set frequency.
>> +	 */
>> +	freq_hz = alpha_pll_round_rate(clk_hw_get_rate(hw),
>> +			clk_hw_get_rate(parent), &l, &a, alpha_width);
>> +
>> +	pr_debug("pll %s: setting back to required rate %lu, freq_hz %ld\n",
>> +		clk_hw_get_name(hw), clk_hw_get_rate(hw), freq_hz);
>> +
>> +	/* Setup the PLL for the new frequency */
>> +	a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
>> +
>> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), a >> 32);
>> +
>> +	regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_ALPHA_EN, PLL_ALPHA_EN);
>> +
>> +	return clk_alpha_pll_slew_update(pll);
>> +}
>> +
>> +static int clk_alpha_pll_slew_enable(struct clk_hw *hw)
>> +{
>> +	int rc;
>> +
>> +	rc = clk_alpha_pll_calibrate(hw);
>> +	if (rc)
>> +		return rc;
>> +
>> +	return clk_alpha_pll_enable(hw);
>> +}
>> +
>> +const struct clk_ops clk_alpha_pll_slew_ops = {
>> +	.enable = clk_alpha_pll_slew_enable,
>> +	.disable = clk_alpha_pll_disable,
>> +	.recalc_rate = clk_alpha_pll_recalc_rate,
>> +	.round_rate = clk_alpha_pll_round_rate,
>> +	.set_rate = clk_alpha_pll_slew_set_rate,
>> +};
>> +EXPORT_SYMBOL(clk_alpha_pll_slew_ops);
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
>> index 79aca8525262211ae5295245427d4540abf1e09a..1d19001605eb10fd8ae8041c56d951e928cbbe9f 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.h
>> +++ b/drivers/clk/qcom/clk-alpha-pll.h
>> @@ -204,6 +204,7 @@ extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
>>  #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
>>  
>>  extern const struct clk_ops clk_alpha_pll_regera_ops;
>> +extern const struct clk_ops clk_alpha_pll_slew_ops;
>>  
>>  void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>  			     const struct alpha_pll_config *config);
>>
>> -- 
>> 2.48.1
>>


