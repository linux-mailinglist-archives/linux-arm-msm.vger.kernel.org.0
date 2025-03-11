Return-Path: <linux-arm-msm+bounces-50919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E2CA5BB19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 09:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 510833A8EE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 08:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D936E22652D;
	Tue, 11 Mar 2025 08:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qabwpljv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550E61EB182;
	Tue, 11 Mar 2025 08:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741682941; cv=none; b=Ppc0n9d2xT4XOMKgsHs8vhmzfkSthutuVCuVV/8+etzESLCQ1fPM4TcJ9H68Ob0HEcvLyTatcoNqEgzyoCYqRDE61WAQJLfpbJ75lgEIXlHsUPV74HW2sCIqKVRkN+5TTnhEHJuYL2LWeXExA6kH9RMBmfLyD2kqrmMQjEYDs/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741682941; c=relaxed/simple;
	bh=lZb28N03X0S2hIMg88gGhuBcYf72l4ssx7+BdSIf/U0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MCw1KmWFgVkFP6UPO9ITMYk8hNTkAQviOnVoC+tPTFEmWXXMOOGthBvq36h67rPqyP6wQ60W2jDislMDnCI2IaBHkBAZvFF7YHkb4bbXDRx+mw7EgNnk8tf5Ak1RKHC3KTzGDTG6sPVcd++lFyYutWY7r9lZLqLbEaD4mhjTPvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qabwpljv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B19vgi007482;
	Tue, 11 Mar 2025 08:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6eApMgDUk4XNwgwqmIHqreNVzxZrHWN+L6LNkuPw36A=; b=QabwpljvBrq5CNlO
	tBONSWJFkbhy4bB4IAvgLgjn/JxHCfX/GHZmai9Mcn452toMQvtzm64lL12PAQSC
	DkvpBYvFJO4Gangwm8YcmaqeN6O13X6nfuuCZm4vwZDVW2oeGTjexPPXAHTVflky
	LzMqlhoviz1tnmLk//g5Jcgzc1n5hxv/zzrG54XIJNnZhIQrlCYcuH+mGVYGlmkP
	I3yMxpfPRSFn6yLVOynshlu7Ef+NoIsr/lE+Gud2yNzf30ffHvmMP2YeOYa+it74
	H6vVvHiX3G7Qg4AaVMtZpCtMDc0RThPj3twJB2HllE+2VKcZPkmui+/zG1bhntcX
	cWbPxw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ab95h5c5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 08:48:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52B8mtut007769
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 08:48:55 GMT
Received: from [10.218.22.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Mar
 2025 01:48:49 -0700
Message-ID: <8bc65a73-876e-4063-8e7a-7a54e6e4c096@quicinc.com>
Date: Tue, 11 Mar 2025 14:18:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] clk: qcom: common: Manage rpm, configure PLLs &
 AON clks in really probe
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Taniya
 Das" <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <20250306-videocc-pll-multi-pd-voting-v2-3-0cd00612bc0e@quicinc.com>
 <vmxwmunmlknwp7elhp5zayoraccunxw5fex2hse2w4nwhuxzu5@atbcrfp2jgdm>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <vmxwmunmlknwp7elhp5zayoraccunxw5fex2hse2w4nwhuxzu5@atbcrfp2jgdm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: akzZagIWj4VqenqHZAUwBEuURKiL2BVv
X-Authority-Analysis: v=2.4 cv=fvgmZE4f c=1 sm=1 tr=0 ts=67cff8f8 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=IeHSON8_HjXeqkJcNh0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: akzZagIWj4VqenqHZAUwBEuURKiL2BVv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110059



On 3/7/2025 2:17 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 06, 2025 at 02:25:35PM +0530, Jagadeesh Kona wrote:
>> Add support for runtime power management, PLL configuration and enabling
>> critical clocks in qcom_cc_really_probe() to commonize the clock
>> controller probe.
> 
> Please split this into two commits: one for the runtime PM and another
> one for clock configuration, because ...
> 

Sure, will split this in the next series.

>>
>> The runtime power management is not required for all clock controllers,
>> hence handle the rpm based on use_rpm flag in clock controller descriptor.
>> Also the power domains need to be kept enabled during pll configuration,
>> hence attach all required power domains prior to calling get_sync() on the
>> device.
>>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> ---
>>  drivers/clk/qcom/common.c | 45 ++++++++++++++++++++++++++++++++++++---------
>>  drivers/clk/qcom/common.h | 16 ++++++++++++++++
>>  2 files changed, 52 insertions(+), 9 deletions(-)
> 
> [...]
> 
>> +
>> +	for (i = 0; i < desc->num_plls; i++)
>> +		qcom_cc_clk_pll_configure(desc->plls[i], regmap);
>> +
>> +	for (i = 0 ; i < desc->num_clks_cfg; i++)
>> +		regmap_update_bits(regmap, clks_cfg[i].offset,
>> +				   clks_cfg[i].mask, clks_cfg[i].mask);
>> +
> 
> ... just calling regmap_update_bits() looks like a step backwards. In
> the past several years we got several sensible wrappers and helpers. I
> suggest having a callback instead of a fixed 'update bits' table.
> 

Sure, will check and add a callback to handle all these clock config settings.

Thanks,
Jagadeesh

>>  	reset = &cc->reset;
>>  	reset->rcdev.of_node = dev->of_node;
>>  	reset->rcdev.ops = &qcom_reset_ops;
> 
> The RPM part is fine with me.
>

