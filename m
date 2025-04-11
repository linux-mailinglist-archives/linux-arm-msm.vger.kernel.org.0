Return-Path: <linux-arm-msm+bounces-53943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF16A85535
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 09:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62DCC188EC7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 07:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CB6283CB9;
	Fri, 11 Apr 2025 07:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oC2Acu1I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F751283C8B;
	Fri, 11 Apr 2025 07:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355637; cv=none; b=f8Ejou5UqprlTuE0yqRUCzdL6ZL0T50NueGk/cHwb56dLRgf6/tTS3I6hSGMzyKieVsLJHwXCls6Bk+W0MaqfSkUAudRRcWVgrto4dlzXHvk4cXF9lRSz0xQw8ZS6avdWbiKnhfRIr7CJWuRdVpA4PzcEesH2EjA2u7MXz49P4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355637; c=relaxed/simple;
	bh=azv0aOtySUpuNbzIBRsPhvGNvDucVhkCDkQJmhuMSI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=a6gjoCvRPAGeV2O3wa+6Qri0OhyiSnZITmRfHWEm1pGPEduQUJT9oLxumdfu09jtSaMJeWfehTy/Wxe0Qt3xnZDkFjYKoQ+nvwyjmv3R4t1CPJMApw35W/iDyI1K2wJhZ7e8rCX1RRzcYmqT90amEJWB0eB3mwqszE9Fd/rQmGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oC2Acu1I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5KZYG008265;
	Fri, 11 Apr 2025 07:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2KUBEMT++R8AyuIZKKBKSwUbsPbRbmz5FXqeoOw0R+o=; b=oC2Acu1IKUc7t7nO
	J4HrxIJc8uVOkjR5nvLojcTi3eclDzlLBLQ2pi68wIvs7k7UlWVJhmJoi17Ho6iO
	45eHAITLzzW0LBIQNmQ9kqjEx1QYaw7A5OMbUmYlBYSCdgzYhopNGKAfMw0JLdXv
	427EebsPLwohgFcGv/SP9VmSiyG2ie0SEmeJkWvQ22IBrTYsZ/VYJaJGC4U0yJCz
	zo/BxO84GzDDOLj5OaUw0Ydaec39UajKRyJ/r/LpviuYPjdvGdVvnGTv91g/DRWA
	OCqVYT7q/NHtLhXQkSZ6LDpO7Qe1/oy9zrSPtVHcgAXYFis0YVXpLcE+lzsQ09OA
	BAgchA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd09pbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 07:13:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53B7DnUj001858
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 07:13:49 GMT
Received: from [10.218.22.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Apr
 2025 00:13:42 -0700
Message-ID: <958877e3-3e14-4259-af7d-697c87b141ee@quicinc.com>
Date: Fri, 11 Apr 2025 12:43:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/18] clk: qcom: clk-alpha-pll: Add support for common
 PLL configuration function
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-4-895fafd62627@quicinc.com>
 <ddcaa5e5-b5c5-4d78-b44a-4cea75ec6a77@linaro.org>
 <zyfr7dd3dwfbcyztiaajr6tac7shn6ecrvy5277bfk2uwh3txp@gt4tbxh6xx54>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <zyfr7dd3dwfbcyztiaajr6tac7shn6ecrvy5277bfk2uwh3txp@gt4tbxh6xx54>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _HG16u9yCd5gw9pzUcnkDm1YvcLs7h34
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f8c12e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=a71U0AYrpCg4a1nRiTEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _HG16u9yCd5gw9pzUcnkDm1YvcLs7h34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110049



On 3/27/2025 11:50 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 27, 2025 at 03:51:33PM +0000, Bryan O'Donoghue wrote:
>> On 27/03/2025 09:52, Jagadeesh Kona wrote:
>>> From: Taniya Das <quic_tdas@quicinc.com>
>>>
>>> To properly configure the PLLs on recent chipsets, it often requires more
>>> than one power domain to be kept ON. The support to enable multiple power
>>> domains is being added in qcom_cc_really_probe() and PLLs should be
>>> configured post all the required power domains are enabled.
>>>
>>> Hence integrate PLL configuration into clk_alpha_pll structure and add
>>> support for qcom_clk_alpha_pll_configure() function which can be called
>>> from qcom_cc_really_probe() to configure the clock controller PLLs after
>>> all required power domains are enabled.
>>>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> ---
>>>   drivers/clk/qcom/clk-alpha-pll.c | 63 ++++++++++++++++++++++++++++++++++++++++
>>>   drivers/clk/qcom/clk-alpha-pll.h |  3 ++
>>>   2 files changed, 66 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>>> index cec0afea8e446010f0d4140d4ef63121706dde47..8ee842254e6690e24469053cdbd99a9953987e40 100644
>>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>>> @@ -63,6 +63,8 @@
>>>   #define PLL_OPMODE(p)		((p)->offset + (p)->regs[PLL_OFF_OPMODE])
>>>   #define PLL_FRAC(p)		((p)->offset + (p)->regs[PLL_OFF_FRAC])
>>> +#define GET_PLL_TYPE(pll)	(((pll)->regs - clk_alpha_pll_regs[0]) / PLL_OFF_MAX_REGS)
>>> +
>>>   const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
>>>   	[CLK_ALPHA_PLL_TYPE_DEFAULT] =  {
>>>   		[PLL_OFF_L_VAL] = 0x04,
>>> @@ -2960,3 +2962,64 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
>>>   	.set_rate = clk_zonda_pll_set_rate,
>>>   };
>>>   EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
>>> +
>>> +void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap)
>>> +{
>>> +	const struct clk_init_data *init = pll->clkr.hw.init;
>>> +	const char *name = init->name;
>>> +
>>> +	if (!pll->config || !pll->regs) {
>>> +		pr_err("%s: missing pll config or regs\n", name);
>>> +		return;
>>> +	}
>>
>> Seems like a strange check - you are calling this function in a loop which
>> looks like
>>
>> for (i = 0; i < desc->num_alpha_plls; i++)
>> 	qcom_clk_alpha_pll_configure(desc->alpha_plls[i], regmap);
>>
>> Can num_alpha_plls be true but alpha_plls be NULL and why is regmap
>> considered valid ?
>>
>> I think you can drop this check.
>

The regmap check is already performed in qcom_cc_map() before we reach this
point.

It is not possible for num_alpha_plls to be true when alpha_plls is NULL, as
num_alpha_plls is derived using SIZE_OF(alpha_plls).

Including the above check is beneficial to catch any errors in case we missed
adding the necessary config/regs fields to the PLL structure in the CC code.
 
> I think pll->config should be moved to a calling code.
>
Yes, I can move above checks to calling code in next series. 

Thanks,
Jagadeesh

>>
>>> +
>>> +	switch (GET_PLL_TYPE(pll)) {
>>> +	case CLK_ALPHA_PLL_TYPE_LUCID_OLE:
>>> +		clk_lucid_ole_pll_configure(pll, regmap, pll->config);
>>> +		break;
>>> +	case CLK_ALPHA_PLL_TYPE_LUCID_EVO:
>>> +		clk_lucid_evo_pll_configure(pll, regmap, pll->config);
>>> +		break;
>>> +	case CLK_ALPHA_PLL_TYPE_TAYCAN_ELU:
>>> +		clk_taycan_elu_pll_configure(pll, regmap, pll->config);
>>> +		break;
>>> +	case CLK_ALPHA_PLL_TYPE_RIVIAN_EVO:
>>> +		clk_rivian_evo_pll_configure(pll, regmap, pll->config);
>>> +		break;
>>> +	case CLK_ALPHA_PLL_TYPE_TRION:
>>> +		clk_trion_pll_configure(pll, regmap, pll->config);
>>> +		break;
>>> +	case CLK_ALPHA_PLL_TYPE_HUAYRA_2290:
>>> +		clk_huayra_2290_pll_configure(pll, regmap, pll->config);
>>> +		break;
>>> +	case CLK_ALPHA_PLL_TYPE_FABIA:
>>> +		clk_fabia_pll_configure(pll, regmap, pll->config);
>>> +		break;
>>> +	case CLK_ALPHA_PLL_TYPE_AGERA:
>>> +		clk_agera_pll_configure(pll, regmap, pll->config);
>>> +		break;
>>> +	case CLK_ALPHA_PLL_TYPE_PONGO_ELU:
>>> +		clk_pongo_elu_pll_configure(pll, regmap, pll->config);
>>> +		break;
>>> +	case CLK_ALPHA_PLL_TYPE_ZONDA:
>>> +	case CLK_ALPHA_PLL_TYPE_ZONDA_OLE:
>>> +		clk_zonda_pll_configure(pll, regmap, pll->config);
>>> +		break;
>>> +	case CLK_ALPHA_PLL_TYPE_STROMER:
>>> +	case CLK_ALPHA_PLL_TYPE_STROMER_PLUS:
>>> +		clk_stromer_pll_configure(pll, regmap, pll->config);
>>> +		break;
>>> +	case CLK_ALPHA_PLL_TYPE_DEFAULT:
>>> +	case CLK_ALPHA_PLL_TYPE_DEFAULT_EVO:
>>> +	case CLK_ALPHA_PLL_TYPE_HUAYRA:
>>> +	case CLK_ALPHA_PLL_TYPE_HUAYRA_APSS:
>>> +	case CLK_ALPHA_PLL_TYPE_BRAMMO:
>>> +	case CLK_ALPHA_PLL_TYPE_BRAMMO_EVO:
>>> +		clk_alpha_pll_configure(pll, regmap, pll->config);
>>> +		break;
>>> +	default:
>>> +		WARN(1, "%s: invalid pll type\n", name);
>>> +		break;
>>> +	}
>>> +}
>>> +EXPORT_SYMBOL_GPL(qcom_clk_alpha_pll_configure);
>>> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
>>> index 79aca8525262211ae5295245427d4540abf1e09a..7f35aaa7a35d88411beb11fd2be5d5dd5bfbe066 100644
>>> --- a/drivers/clk/qcom/clk-alpha-pll.h
>>> +++ b/drivers/clk/qcom/clk-alpha-pll.h
>>> @@ -81,6 +81,7 @@ struct pll_vco {
>>>    * struct clk_alpha_pll - phase locked loop (PLL)
>>>    * @offset: base address of registers
>>>    * @regs: alpha pll register map (see @clk_alpha_pll_regs)
>>> + * @config: array of pll settings
>>>    * @vco_table: array of VCO settings
>>>    * @num_vco: number of VCO settings in @vco_table
>>>    * @flags: bitmask to indicate features supported by the hardware
>>> @@ -90,6 +91,7 @@ struct clk_alpha_pll {
>>>   	u32 offset;
>>>   	const u8 *regs;
>>> +	const struct alpha_pll_config *config;
>>>   	const struct pll_vco *vco_table;
>>>   	size_t num_vco;
>>>   #define SUPPORTS_OFFLINE_REQ		BIT(0)
>>> @@ -237,5 +239,6 @@ void clk_stromer_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>>   			       const struct alpha_pll_config *config);
>>>   void clk_regera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>>   			     const struct alpha_pll_config *config);
>>> +void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap);
>>>   #endif
>>>
> 

