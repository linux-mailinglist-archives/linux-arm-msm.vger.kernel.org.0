Return-Path: <linux-arm-msm+bounces-53944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2F7A8553E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 09:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E97DB9A6AEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 07:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9B62853EB;
	Fri, 11 Apr 2025 07:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jS7TwetX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A422283684;
	Fri, 11 Apr 2025 07:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355680; cv=none; b=uNcBcqBmv+r8z+J22+4RWMXrwqs5FWrqmOKwt7ihMmqDONX0lTyXirdHod/TisqXJ3fzA0Tr3MoX7SvvKpBDh0cLLSs/3zuatDwtSBVrVOAOhN5OjWZ7tyE/CcfxYEBrOD8O5KZS+P3db8cP4UbbvE3ZcsxRW5WU+anc2iZ0zKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355680; c=relaxed/simple;
	bh=VV1B37NbYhhln1gs6K8QHSv/jWnFNdrUKwA56AWpweA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XE5ugjYuzaoZmXIk4vzMknT1XM9HAXLezsqMgamiNyT8zSkOHcSfRl5THLEYwct3HuPx5ChO92okydgC5S/eH7bEJ9CwAwFnxW9mA3ykNjDGbngWmM8PCMQ7/Qn6ENP5/+OeR8Rz3xgCcm+4srC9O0gNNNCKkYO7P8H2lNhmJ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jS7TwetX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B102FU001379;
	Fri, 11 Apr 2025 07:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUnjeJizivO05YbD55IZ9XsszWST36nm1PRGBuQO95E=; b=jS7TwetXGTZcsdTp
	f/sfq93sjBgVMogJCB/Ly9ht/kBrwk/hBedtF8QXwDo3tCNLaTEtDrfcBJmpsnp9
	ot+MeWdzkFu1hAEeewXXHhmndVQeXqSG/sw9+6uCUANwEWuzIEPcAe+LySif2IFF
	fCUPtd8gRja0Csgdx0aR7IWYODm8K9K3jVw2iHcoedWW+VssWrGy5kUHRukeTwK5
	I9kV73UysI0pB4OLh8ZVR1ebfaWdUTSbYbM2F5wgTwowu+IhUDWMjnLcSD8iZG+X
	MvDOKY2bDG23DkLnIUiS0lHmsd1disnGebpQ6+qIoZ710lnq4JjT81bf+m7TsQZl
	Zm5UNg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftsaq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 07:14:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53B7EXOp017237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 07:14:33 GMT
Received: from [10.218.22.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Apr
 2025 00:14:26 -0700
Message-ID: <f1125370-c16a-4c20-a01d-2221fb12fdcb@quicinc.com>
Date: Fri, 11 Apr 2025 12:44:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/18] clk: qcom: common: Add support to configure clk
 regs in qcom_cc_really_probe
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
	<krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-6-895fafd62627@quicinc.com>
 <aidlp3iq6pxym52tp63w35tpcctw4443yihvcwsdszk62xbwfp@esqpmsc4e6qd>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <aidlp3iq6pxym52tp63w35tpcctw4443yihvcwsdszk62xbwfp@esqpmsc4e6qd>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f8c15a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=qPmOx_-tzUBKrPr5axYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RTiE0jEH0zF5CzOsz6WkUDLFHZ-VSP56
X-Proofpoint-ORIG-GUID: RTiE0jEH0zF5CzOsz6WkUDLFHZ-VSP56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110049



On 3/27/2025 6:20 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 27, 2025 at 03:22:26PM +0530, Jagadeesh Kona wrote:
>> Add support to configure PLLS and clk registers in qcom_cc_really_probe().
>> This ensures all required power domains are enabled and kept ON by runtime
>> PM code in qcom_cc_really_probe() before configuring the PLLS or clock
>> registers.
>>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> ---
>>  drivers/clk/qcom/common.c | 28 ++++++++++++++++++++++++++++
>>  drivers/clk/qcom/common.h | 19 +++++++++++++++++++
>>  2 files changed, 47 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> index 9cbf1c5296dad3ee5477a2f5a445488707663b9d..c4d980c6145834969fada14863360ee81c9aa251 100644
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
>> @@ -14,6 +14,8 @@
>>  #include <linux/of.h>
>>  
>>  #include "common.h"
>> +#include "clk-alpha-pll.h"
>> +#include "clk-branch.h"
>>  #include "clk-rcg.h"
>>  #include "clk-regmap.h"
>>  #include "reset.h"
>> @@ -285,6 +287,29 @@ static int qcom_cc_icc_register(struct device *dev,
>>  						     desc->num_icc_hws, icd);
>>  }
>>  
>> +static void qcom_cc_clk_pll_configure(const struct qcom_cc_desc *desc,
>> +				      struct regmap *regmap)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < desc->num_alpha_plls; i++)
>> +		qcom_clk_alpha_pll_configure(desc->alpha_plls[i], regmap);
>> +}
>> +
>> +static void qcom_cc_clk_regs_configure(const struct qcom_cc_desc *desc,
>> +				       struct regmap *regmap)
>> +{
>> +	struct qcom_clk_reg_setting *clk_regs = desc->clk_regs;
>> +	int i;
>> +
>> +	for (i = 0; i < desc->num_clk_cbcrs; i++)
>> +		qcom_branch_set_clk_en(regmap, desc->clk_cbcrs[i]);
>> +
>> +	for (i = 0 ; i < desc->num_clk_regs; i++)
>> +		regmap_update_bits(regmap, clk_regs[i].offset,
>> +				   clk_regs[i].mask, clk_regs[i].val);
> 
> I think there are other semantic functions which we don't want to
> convert to offset-mask-val tuples. See drivers/clk/qcom/clk-branch.h.
> I'd suggest to move setup steps to a driver callback. We can improve it
> later on if it is found to make sense, but it won't block this series
> from being merged.
> 

Yes, there are other wrapper functions as well but they are unused in most
clock controllers. We will check more on how we can improve this in a separate
series.

Thanks,
Jagadeesh

>> +}
>> +
>>  int qcom_cc_really_probe(struct device *dev,
>>  			 const struct qcom_cc_desc *desc, struct regmap *regmap)
>>  {
>> @@ -315,6 +340,9 @@ int qcom_cc_really_probe(struct device *dev,
>>  			return ret;
>>  	}
>>  
>> +	qcom_cc_clk_pll_configure(desc, regmap);
>> +	qcom_cc_clk_regs_configure(desc, regmap);
>> +
>>  	reset = &cc->reset;
>>  	reset->rcdev.of_node = dev->of_node;
>>  	reset->rcdev.ops = &qcom_reset_ops;
>> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
>> index 9c10bc8c197cd7dfa25ccd245763ad6acb081523..01b1ae52f2dc580350409d6244578944cce571f0 100644
>> --- a/drivers/clk/qcom/common.h
>> +++ b/drivers/clk/qcom/common.h
>> @@ -25,6 +25,19 @@ struct qcom_icc_hws_data {
>>  	int clk_id;
>>  };
>>  
>> +/**
>> + * struct qcom_clk_reg_setting - Represents miscellaneous clock register settings
>> + * @offset: address offset for the clock register
>> + * @mask: bit mask indicating the bits to be updated
>> + * @val: Encoded value to be set within the specified bit mask
>> + *       (e.g., if writing 7 to bits 4-7, mask = 0xF0 and val = 0x70)
>> + */
>> +struct qcom_clk_reg_setting {
>> +	u32 offset;
>> +	u32 mask;
>> +	u32 val;
>> +};
>> +
>>  struct qcom_cc_desc {
>>  	const struct regmap_config *config;
>>  	struct clk_regmap **clks;
>> @@ -38,6 +51,12 @@ struct qcom_cc_desc {
>>  	const struct qcom_icc_hws_data *icc_hws;
>>  	size_t num_icc_hws;
>>  	unsigned int icc_first_node_id;
>> +	u32 *clk_cbcrs;
>> +	size_t num_clk_cbcrs;
>> +	struct clk_alpha_pll **alpha_plls;
>> +	size_t num_alpha_plls;
>> +	struct qcom_clk_reg_setting *clk_regs;
>> +	size_t num_clk_regs;
>>  	bool use_rpm;
>>  };
>>  
>>
>> -- 
>> 2.34.1
>>
> 

