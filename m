Return-Path: <linux-arm-msm+bounces-54211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B69EA87D2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 12:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D8823BABEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 10:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240252676C3;
	Mon, 14 Apr 2025 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TT1h/IjK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DBE266B42;
	Mon, 14 Apr 2025 10:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625363; cv=none; b=joNNXwV9UbGnyin0bphUUm8q6MAqhGQVHXqfn5kyILcXKBagIhPmLvSHMluyKUZW0eDPcf23EyYOFcXIpKLJ7KsoRtiFyQa/h3xXoaAfvyjirQv1L3+jO1bklWavtmUrmQZ+ZFl8eSKGkgS61V5lPZFwY0YSQ8bBvD8jmTcGSQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625363; c=relaxed/simple;
	bh=aUq8W3G9onRt3bSXFhEouZArmCCiY8IhU0Kx/aGl0Wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d7vbnfM0T+6bfjbLAIJCtNaOEDXBLeHna3aFQn2SO/W+rN7E57qz4U2IGPEIngxj8v7bYMu8o0uVkhhSs5QafvkRohJb+pUJ7e9QiEnJviRYX6SY+fU0pmnkoWiCJ+VImv8ufwrem0W5jsNCp6RMKiG77OtmUhwkQFSNKMtwNFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TT1h/IjK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99rZB016340;
	Mon, 14 Apr 2025 10:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dWPDlV0aqyLqi0ktAVzjEBr7Msw8l78IaAlVD9PFxiY=; b=TT1h/IjKHMqUlljX
	+6unZDH3zP3QfJXQAvRWDRmvjc7P4aBw/ju84Jx3lEAfA2D6NAAjvdrp17CmlTfs
	VePq3rZDINXxTfCSflQnrbA/G0WyVKxWxfQ+ynov26U3XSfY1VhWoVYTy+hmxTqj
	Oy/Akebe2L9tSLwSLBHAIFzvcUdTaOmkZnvcf0t7BfPjRta4WgFhkd0dIrU7gk7D
	6UWQwJcRppPZQhkelRmIsLr1+vkixMsOGjqmKk7aa2UvoSouVRDdhBlP6fFdI0hP
	HbrTUOLW6p2j7dTeUPFFf4Mlq9nOm/r5lHd7/N9xAqEg84A9a9n6tXBsa7f+IZvV
	XtTHXw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjc5b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 10:09:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53EA9DnE012261
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 10:09:13 GMT
Received: from [10.218.22.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 03:09:07 -0700
Message-ID: <efe91d3f-a2e3-4bee-a7e5-36ea4fc0968a@quicinc.com>
Date: Mon, 14 Apr 2025 15:39:04 +0530
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
 <f1125370-c16a-4c20-a01d-2221fb12fdcb@quicinc.com>
 <CAO9ioeWmuPhBPivthidXTFfnXRBx9rd=iX5aqjB4bMcCKueXeg@mail.gmail.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <CAO9ioeWmuPhBPivthidXTFfnXRBx9rd=iX5aqjB4bMcCKueXeg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: X9NEYt8utD8CHYrA1nJQiVSqsh-Msqn2
X-Proofpoint-ORIG-GUID: X9NEYt8utD8CHYrA1nJQiVSqsh-Msqn2
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fcdeca cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=x0jix2-gbSxKepSfYNQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140072



On 4/11/2025 2:21 PM, Dmitry Baryshkov wrote:
> On Fri, 11 Apr 2025 at 10:14, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>>
>>
>>
>> On 3/27/2025 6:20 PM, Dmitry Baryshkov wrote:
>>> On Thu, Mar 27, 2025 at 03:22:26PM +0530, Jagadeesh Kona wrote:
>>>> Add support to configure PLLS and clk registers in qcom_cc_really_probe().
>>>> This ensures all required power domains are enabled and kept ON by runtime
>>>> PM code in qcom_cc_really_probe() before configuring the PLLS or clock
>>>> registers.
>>>>
>>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>>> ---
>>>>  drivers/clk/qcom/common.c | 28 ++++++++++++++++++++++++++++
>>>>  drivers/clk/qcom/common.h | 19 +++++++++++++++++++
>>>>  2 files changed, 47 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>>>> index 9cbf1c5296dad3ee5477a2f5a445488707663b9d..c4d980c6145834969fada14863360ee81c9aa251 100644
>>>> --- a/drivers/clk/qcom/common.c
>>>> +++ b/drivers/clk/qcom/common.c
>>>> @@ -14,6 +14,8 @@
>>>>  #include <linux/of.h>
>>>>
>>>>  #include "common.h"
>>>> +#include "clk-alpha-pll.h"
>>>> +#include "clk-branch.h"
>>>>  #include "clk-rcg.h"
>>>>  #include "clk-regmap.h"
>>>>  #include "reset.h"
>>>> @@ -285,6 +287,29 @@ static int qcom_cc_icc_register(struct device *dev,
>>>>                                                   desc->num_icc_hws, icd);
>>>>  }
>>>>
>>>> +static void qcom_cc_clk_pll_configure(const struct qcom_cc_desc *desc,
>>>> +                                  struct regmap *regmap)
>>>> +{
>>>> +    int i;
>>>> +
>>>> +    for (i = 0; i < desc->num_alpha_plls; i++)
>>>> +            qcom_clk_alpha_pll_configure(desc->alpha_plls[i], regmap);
>>>> +}
>>>> +
>>>> +static void qcom_cc_clk_regs_configure(const struct qcom_cc_desc *desc,
>>>> +                                   struct regmap *regmap)
>>>> +{
>>>> +    struct qcom_clk_reg_setting *clk_regs = desc->clk_regs;
>>>> +    int i;
>>>> +
>>>> +    for (i = 0; i < desc->num_clk_cbcrs; i++)
>>>> +            qcom_branch_set_clk_en(regmap, desc->clk_cbcrs[i]);
>>>> +
>>>> +    for (i = 0 ; i < desc->num_clk_regs; i++)
>>>> +            regmap_update_bits(regmap, clk_regs[i].offset,
>>>> +                               clk_regs[i].mask, clk_regs[i].val);
>>>
>>> I think there are other semantic functions which we don't want to
>>> convert to offset-mask-val tuples. See drivers/clk/qcom/clk-branch.h.
>>> I'd suggest to move setup steps to a driver callback. We can improve it
>>> later on if it is found to make sense, but it won't block this series
>>> from being merged.
>>>
>>
>> Yes, there are other wrapper functions as well but they are unused in most
>> clock controllers. We will check more on how we can improve this in a separate
>> series.
> 
> Please do it the other way around. Implement a generic callback, then
> we can check how to sort things out.
> 

Yeah, but since this series doesn't require any misc register settings update, I
will remove the above regmap_update_bits() code for now. I will check further on
this and post a separate series for it.

Thanks,
Jagadeesh

>>
>> Thanks,
>> Jagadeesh
>>
>>>> +}
>>>> +
>>>>  int qcom_cc_really_probe(struct device *dev,
>>>>                       const struct qcom_cc_desc *desc, struct regmap *regmap)
>>>>  {
>>>> @@ -315,6 +340,9 @@ int qcom_cc_really_probe(struct device *dev,
>>>>                      return ret;
>>>>      }
>>>>
>>>> +    qcom_cc_clk_pll_configure(desc, regmap);
>>>> +    qcom_cc_clk_regs_configure(desc, regmap);
>>>> +
>>>>      reset = &cc->reset;
>>>>      reset->rcdev.of_node = dev->of_node;
>>>>      reset->rcdev.ops = &qcom_reset_ops;
>>>> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
>>>> index 9c10bc8c197cd7dfa25ccd245763ad6acb081523..01b1ae52f2dc580350409d6244578944cce571f0 100644
>>>> --- a/drivers/clk/qcom/common.h
>>>> +++ b/drivers/clk/qcom/common.h
>>>> @@ -25,6 +25,19 @@ struct qcom_icc_hws_data {
>>>>      int clk_id;
>>>>  };
>>>>
>>>> +/**
>>>> + * struct qcom_clk_reg_setting - Represents miscellaneous clock register settings
>>>> + * @offset: address offset for the clock register
>>>> + * @mask: bit mask indicating the bits to be updated
>>>> + * @val: Encoded value to be set within the specified bit mask
>>>> + *       (e.g., if writing 7 to bits 4-7, mask = 0xF0 and val = 0x70)
>>>> + */
>>>> +struct qcom_clk_reg_setting {
>>>> +    u32 offset;
>>>> +    u32 mask;
>>>> +    u32 val;
>>>> +};
>>>> +
>>>>  struct qcom_cc_desc {
>>>>      const struct regmap_config *config;
>>>>      struct clk_regmap **clks;
>>>> @@ -38,6 +51,12 @@ struct qcom_cc_desc {
>>>>      const struct qcom_icc_hws_data *icc_hws;
>>>>      size_t num_icc_hws;
>>>>      unsigned int icc_first_node_id;
>>>> +    u32 *clk_cbcrs;
>>>> +    size_t num_clk_cbcrs;
>>>> +    struct clk_alpha_pll **alpha_plls;
>>>> +    size_t num_alpha_plls;
>>>> +    struct qcom_clk_reg_setting *clk_regs;
>>>> +    size_t num_clk_regs;
>>>>      bool use_rpm;
>>>>  };
>>>>
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
> 
> 
> 

