Return-Path: <linux-arm-msm+bounces-50918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 716B8A5BB14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 09:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 159ED3A3D6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 08:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E55226177;
	Tue, 11 Mar 2025 08:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="klKyAtUB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2711E8325;
	Tue, 11 Mar 2025 08:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741682905; cv=none; b=jt45uHyRLxSrGMVvKECCvfhF9FpJkgHIq3lqBPfslsDJTYgLJNIVW7jpeFHc/BgiMmGYB8CWPIxJGePaLUxFzT2868lFcjpzj4vwItIW7dFgh2bX0m3bCYyTBz+TIAUasjKoJOX3HbuYzypVylhIHAJHon/qlfa8ybQXQuEsQz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741682905; c=relaxed/simple;
	bh=5rxzyQzj2vD0w+xZtCtiPCoRq6Vo2KJxgSOCsbBy0kA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JQKjlRp2j6m3dPRgl34JU7tCNDicQmCg9S7p6o8JVTuzDDkZmYQlwG/kN1M9Rr1R2KRtXlSo5W8SA5zPl6MDEtU+7OiUtglgyZDMCo+jZF+gQvoTP+svg+iriQ51muS604IaYcE5XPdpnbEk2dSAQFKLqm2CPpoYxSLiY+i49M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=klKyAtUB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7UEFX021474;
	Tue, 11 Mar 2025 08:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgwc1JxCCvPCLG1f6XwBmqzqB+jHUAMuBLVRYD7uoMA=; b=klKyAtUBHRFfX0OD
	q5ygeYvAh0Z/oQ7eQJ81XmyYsnczAZTeCLXJ+JnvBSZzjmlwKBob4mdkLE3Bw8KX
	yd0uPGPL8zFpdXYhDeoIyH7JS5aS79sNgUmzMYVaxsKgZJjurda8cIWfeg68kCQd
	5ilxL6FS2kgw2z5fv+UlmLoFzM1qZ3BceNh5C+g2OIbhwSbZjJRw7dJIPLm0B+PO
	Jj/rjiqDqbVZd2wf/rCEiyRyygR9Vckl4xxYX5Smy5DeA397SKbEr4Z1aRznym3D
	58M0VeZepdomvOiMTOSTkBxbK2aKUNasrOKr8tTyaUzS/wEcCFaqcaQBsgz23ISj
	XNcdkA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f0w7sgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 08:48:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52B8mJR8027068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 08:48:19 GMT
Received: from [10.218.22.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Mar
 2025 01:48:13 -0700
Message-ID: <13566bd2-927a-44d2-b23c-d4444f6e1615@quicinc.com>
Date: Tue, 11 Mar 2025 14:18:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] clk: qcom: common: Manage rpm, configure PLLs &
 AON clks in really probe
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <20250306-videocc-pll-multi-pd-voting-v2-3-0cd00612bc0e@quicinc.com>
 <1aa77e2e-6bb0-425c-9b5a-64092f8df9a5@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <1aa77e2e-6bb0-425c-9b5a-64092f8df9a5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6akJI1jUP_GHmu98sb4HyL41m3s7N8ET
X-Proofpoint-GUID: 6akJI1jUP_GHmu98sb4HyL41m3s7N8ET
X-Authority-Analysis: v=2.4 cv=MICamNZl c=1 sm=1 tr=0 ts=67cff8d4 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=irIvcRoiqGMu2EweT9MA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110059



On 3/6/2025 6:15 PM, Konrad Dybcio wrote:
> On 6.03.2025 9:55 AM, Jagadeesh Kona wrote:
>> Add support for runtime power management, PLL configuration and enabling
>> critical clocks in qcom_cc_really_probe() to commonize the clock
>> controller probe.
>>
>> The runtime power management is not required for all clock controllers,
>> hence handle the rpm based on use_rpm flag in clock controller descriptor.
>> Also the power domains need to be kept enabled during pll configuration,
>> hence attach all required power domains prior to calling get_sync() on the
>> device.
>>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> ---
> 
> [...]
> 
>> + * struct qcom_clk_cfg - To maintain list of clocks that needs to be
>> + *                       kept ON or misc clock register settings
> 
> I have some reservations about this name, particularly since 'clk_cfg'
> has already been used in the msmbus/interconnect space..
> 
> Perhaps qcom_clk_reg_settings?
> 

Sure, will update.

>> + * @offset: address offset for clock register
>> + * @mask: bit mask to indicate the bits to update
>> + */
>> +struct qcom_clk_cfg {
>> +	unsigned int offset;
>> +	unsigned int mask;
> 
> "u32"
> 
> also, to expand it, we probably want "field" and "val" to replace the
> calls to regmap_update_bits in some drivers
> 
> I think we may keep this /\ struct for things like:
> 
> /* Enable clock gating for MDP clocks */
> regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
> 
> while keeping a separate u32 array of branch clocks to call
> qcom_branch_set_clk_en() on - we would then use 3x less memory
> 
> 

Sure, will take care of these in next series.

>> +};
> 
>> +
>>  struct qcom_cc_desc {
>>  	const struct regmap_config *config;
>>  	struct clk_regmap **clks;
>> @@ -39,6 +50,11 @@ struct qcom_cc_desc {
>>  	const struct qcom_icc_hws_data *icc_hws;
>>  	size_t num_icc_hws;
>>  	unsigned int icc_first_node_id;
>> +	struct qcom_clk_cfg *clks_cfg;
>> +	size_t num_clks_cfg;
>> +	struct clk_alpha_pll **plls;
> 
> Some ancient or "non-standard" SoCs have non-alpha PLLs, please rename
> this to something like alpha_plls
> 

Sure, will update it.

Thanks,
Jagadeesh

> 
> Konrad

