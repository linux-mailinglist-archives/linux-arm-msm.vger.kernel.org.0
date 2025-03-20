Return-Path: <linux-arm-msm+bounces-52101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF57A6AB11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 17:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CC77468109
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 16:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B3E2147ED;
	Thu, 20 Mar 2025 16:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZZr7APeB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71609223326;
	Thu, 20 Mar 2025 16:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742488208; cv=none; b=U1aZUGGzx4iYQdHPqpW5ttB3HWO2XcOmeMN6SNveTyg6vqDybGSOJs3gIzE0KWS0/luBed/8N08cC4FP43VSuQMIoCaJbsvskhoYjjP20qyAAp6MIdS35qBD76CsKPsKnh+LLaomnG54fPYzp/BBVvGrftAF34fnbeGlO4irjbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742488208; c=relaxed/simple;
	bh=+ktbBaPhcuzYClxjzv3gb0emfQ9G4X+Qef9YofBQeYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C+6Hlu2vV+77Qw6YkMf+xNNpqboZCCX7Z/w7iDe3tggJmGwxMnn+wVHNdTBRzMvN+4W+fGFzrD3lfgZJTIcVQ6UBqZFnN0ZoH/JM1g/mDcl+i0ZwAGUAj8oVIo/6AvxrE3Y5Jf91k4y8f7km7RL5h2fQbUZUBTmFIyfK9UEc30M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZZr7APeB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KDvhnL025028;
	Thu, 20 Mar 2025 16:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCTnMxiSq0WJEgt+zY9JZCeoeskD0a8m1HyqUgBUgk8=; b=ZZr7APeBraxE5tQJ
	Z08mg/mVIUPtm2ZabytZ2XuarHTtbtBC7TDziHz9f0arJUSvVqkMQNl23ImjPfvI
	biiH6u1z30di/624S4Z1b4n4vMPyjfhDUj2oOQbMP/4G3gtflxI/ayMDwwU9VY2A
	oXCVuY5+kL3y8Uky+BODMucvVIyK3h/1ei7FWgDiMdmlPqorJVspp2m5wjSuH9k+
	qoGFNAiGcWjJeEbCpWDyNbjnz2lC1GdA4aPbpgar2rFCxxdXpz1Kmx2l3QsGQ+ha
	wkd35cD+4ym3a0oO1j0cRUjkFcPN01YGxnaomWaLXqWeEl7SwdvBEyJDs7tpWl/U
	0MXNYg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gbngj6a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 16:30:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52KGU1Hn002162
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 16:30:01 GMT
Received: from [10.216.52.115] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Mar
 2025 09:29:56 -0700
Message-ID: <d815584d-96f7-4ff3-8374-7b141afe91d6@quicinc.com>
Date: Thu, 20 Mar 2025 21:59:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] clk: qcom: common: Add support to configure PLL
To: Bjorn Andersson <andersson@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <20250306-videocc-pll-multi-pd-voting-v2-2-0cd00612bc0e@quicinc.com>
 <enbhxe2ewhguebg7hvjadzqajftfff6whd27smkdwfzz4hbvwm@go72ix5c4d6k>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <enbhxe2ewhguebg7hvjadzqajftfff6whd27smkdwfzz4hbvwm@go72ix5c4d6k>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: It6BhY4bK3QXtizPlqt_O2lb7eLEnuTv
X-Authority-Analysis: v=2.4 cv=MJ5gmNZl c=1 sm=1 tr=0 ts=67dc428a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=a-Ujm2vb0zWFPRAAoKoA:9
 a=QEXdDO2ut3YA:10 a=-_B0kFfA75AA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: It6BhY4bK3QXtizPlqt_O2lb7eLEnuTv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_04,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200104



On 3/14/2025 4:09 AM, Bjorn Andersson wrote:
> On Thu, Mar 06, 2025 at 02:25:34PM +0530, Jagadeesh Kona wrote:
>> From: Taniya Das <quic_tdas@quicinc.com>
>>
>> Integrate PLL configuration into clk_alpha_pll structure and add support
>> for qcom_cc_clk_alpha_pll_configure() function which can be used to
>> configure the clock controller PLLs from common core code.
> 
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> starts with "Describe your problem."
> 
> I don't see a problem description here.
> 

Yes, I will update the commit text with problem description in next series.

>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> ---
>>  drivers/clk/qcom/clk-alpha-pll.h |  2 ++
>>  drivers/clk/qcom/common.c        | 55 ++++++++++++++++++++++++++++++++++++++++
>>  drivers/clk/qcom/common.h        |  1 +
>>  3 files changed, 58 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
>> index 79aca8525262211ae5295245427d4540abf1e09a..943320cdcd10a6c07fcd74dccb88be847dc086c2 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.h
>> +++ b/drivers/clk/qcom/clk-alpha-pll.h
>> @@ -81,6 +81,7 @@ struct pll_vco {
>>   * struct clk_alpha_pll - phase locked loop (PLL)
>>   * @offset: base address of registers
>>   * @regs: alpha pll register map (see @clk_alpha_pll_regs)
>> + * @config: array of pll settings
>>   * @vco_table: array of VCO settings
>>   * @num_vco: number of VCO settings in @vco_table
>>   * @flags: bitmask to indicate features supported by the hardware
>> @@ -90,6 +91,7 @@ struct clk_alpha_pll {
>>  	u32 offset;
>>  	const u8 *regs;
>>  
>> +	const struct alpha_pll_config *config;
>>  	const struct pll_vco *vco_table;
>>  	size_t num_vco;
>>  #define SUPPORTS_OFFLINE_REQ		BIT(0)
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> index 9e3380fd718198c9fe63d7361615a91c3ecb3d60..74d062b5da0647f7f2bd8fd7a004ffdb1116c1ea 100644
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/of.h>
>>  
>>  #include "common.h"
>> +#include "clk-alpha-pll.h"
>>  #include "clk-rcg.h"
>>  #include "clk-regmap.h"
>>  #include "reset.h"
>> @@ -284,6 +285,60 @@ static int qcom_cc_icc_register(struct device *dev,
>>  						     desc->num_icc_hws, icd);
>>  }
>>  
>> +static void qcom_cc_clk_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap)
>> +{
>> +	if (!pll->config || !pll->regs)
>> +		return;
>> +
>> +	switch (GET_PLL_TYPE(pll)) {
>> +	case CLK_ALPHA_PLL_TYPE_LUCID_OLE:
>> +		clk_lucid_ole_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_LUCID_EVO:
>> +		clk_lucid_evo_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_TAYCAN_ELU:
>> +		clk_taycan_elu_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_RIVIAN_EVO:
>> +		clk_rivian_evo_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_TRION:
>> +		clk_trion_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_HUAYRA_2290:
>> +		clk_huayra_2290_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_FABIA:
>> +		clk_fabia_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_AGERA:
>> +		clk_agera_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_PONGO_ELU:
>> +		clk_pongo_elu_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_ZONDA:
>> +	case CLK_ALPHA_PLL_TYPE_ZONDA_OLE:
>> +		clk_zonda_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_STROMER:
>> +	case CLK_ALPHA_PLL_TYPE_STROMER_PLUS:
>> +		clk_stromer_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	case CLK_ALPHA_PLL_TYPE_DEFAULT:
>> +	case CLK_ALPHA_PLL_TYPE_DEFAULT_EVO:
>> +	case CLK_ALPHA_PLL_TYPE_HUAYRA:
>> +	case CLK_ALPHA_PLL_TYPE_HUAYRA_APSS:
>> +	case CLK_ALPHA_PLL_TYPE_BRAMMO:
>> +	case CLK_ALPHA_PLL_TYPE_BRAMMO_EVO:
>> +		clk_alpha_pll_configure(pll, regmap, pll->config);
>> +		break;
>> +	default:
> 
> This would be annoying to hit when adding a new PLL type, a BUG(); would
> be useful here.
> 

Yes, will add BUG() here in next series.

>> +		break;
>> +	}
>> +}
>> +
>>  int qcom_cc_really_probe(struct device *dev,
>>  			 const struct qcom_cc_desc *desc, struct regmap *regmap)
>>  {
>> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
>> index 7ace5d7f5836aa81431153ba92d8f14f2ffe8147..2066c8937936235d7bd03ab3225d4b3f4fb08dd0 100644
>> --- a/drivers/clk/qcom/common.h
>> +++ b/drivers/clk/qcom/common.h
>> @@ -18,6 +18,7 @@ struct clk_hw;
>>  #define PLL_BIAS_COUNT_MASK	0x3f
>>  #define PLL_VOTE_FSM_ENA	BIT(20)
>>  #define PLL_VOTE_FSM_RESET	BIT(21)
>> +#define GET_PLL_TYPE(pll)	((pll->regs - clk_alpha_pll_regs[0]) / PLL_OFF_MAX_REGS)
> 
> Why would this go in qcom/common.h, when clk_alpha_pll_regs is defined
> in clk-alpha-pll.h?
> 

Will move the macro to clk alpha pll code in next series.

Thanks,
Jagadeesh

> Regards,
> Bjorn
> 
>>  
>>  struct qcom_icc_hws_data {
>>  	int master_id;
>>
>> -- 
>> 2.34.1
>>

