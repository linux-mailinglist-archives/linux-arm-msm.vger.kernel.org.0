Return-Path: <linux-arm-msm+bounces-51090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EE0A5D706
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 08:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5304E7A6F11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 07:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158C61E991D;
	Wed, 12 Mar 2025 07:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ffHeZJMa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA7618FC75;
	Wed, 12 Mar 2025 07:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741763603; cv=none; b=I5t/KQFrZpB2mKJDFcKCFzXmo076m1x9cxDoHkzKLCngxNbU9XAFq8COkDQrstMuOFvjJN9lvUr+28T9SbtzRnvhBWqGu8vFzM59iN93pFGaklF73pCIJAI1BR3v4G0P02QIverpMZNgxZ5DSa9Wy67blScJXJRHHOTx53eWlEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741763603; c=relaxed/simple;
	bh=z4Q7b3C6wTUPMC5kCAvjtgiJ+iyfnpo2KBw2odAcM6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BrjNmKgDaiLRPvDnU/hNDW1ycO8FIpynt1mbMq/4p+svQW1l7SE7pDajiVaDpR95LoNHaQX4QsuiCWIYlqhkGTKVvPa7zddYJSW4IifACd4GOGhf3H1reZLMcWskvco63Z+HiLOo3ZO4BQostSsaFtz9G/aciJd89eamRneMMnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ffHeZJMa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BMHDBc017694;
	Wed, 12 Mar 2025 07:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oxGp/9F1znkwlSIvliYFcd2DEGvSXkzd9Km8furHq8U=; b=ffHeZJMa78wA+ZQR
	CknUbBonlOukr+Js5CCO6TQpO/c0WyI/tbiy0ApyMRdRjNvNwveluZVRAhqV4ND2
	VZhmhdPlXj9JkQbQGNaN+xOMxQZo2LnL/1BtdRh41hqGiRqbcFdafOvVA6t7x2if
	L7+N5xor7YpIT19K1DMoDPiNt2BvOblq7nly0GoIQqnx6kSED+EOjCB06R7ohwCh
	0SPYEDE3TKPjxbxeue0ruQlFPUB3/LbQvS/ww5Mfbay3OjDh1it/NduXd2H+v+fo
	vTx6l98ysJEQhYj/iy3NiL/xbIdpC2N74VgJHyaj+eSmuj9ub5YPQfeIdE52lhaf
	pGJrzw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au509fb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 07:13:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52C7DFBK010952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 07:13:15 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 00:13:09 -0700
Message-ID: <4ab44b17-5077-4090-9e34-3e508b08f4f9@quicinc.com>
Date: Wed, 12 Mar 2025 12:43:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] clk: qcom: Add support to attach multiple power
 domains in cc probe
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
References: <CMTYKKilQJYeHUYYKvlqnwv4Q2P-58Ic1v1ndS9HQ8Yhq2xpHuNThibFDjXDEQ1PyNbx__f9BVBr0peoTUdvPg==@protonmail.internalid>
 <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <5a45fd25-74ed-46e3-b0e3-5adf92b5e9f7@linaro.org>
 <46d4f090-3e31-414f-abfc-3d1018913c56@linaro.org>
 <9e6fdcfe-3c6d-44c7-95a3-7652c0650bf4@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <9e6fdcfe-3c6d-44c7-95a3-7652c0650bf4@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Cj0rMxQ_jUR2IhBK787Ft3AnjoKz7Z-n
X-Proofpoint-ORIG-GUID: Cj0rMxQ_jUR2IhBK787Ft3AnjoKz7Z-n
X-Authority-Analysis: v=2.4 cv=a4ow9VSF c=1 sm=1 tr=0 ts=67d1340c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=5qUKsjWsxUhzIGqX9SEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1011 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120047



On 3/11/2025 5:40 PM, Bryan O'Donoghue wrote:
> On 11/03/2025 10:12, Vladimir Zapolskiy wrote:
>> On 3/11/25 11:52, Bryan O'Donoghue wrote:
>>> On 06/03/2025 08:55, Jagadeesh Kona wrote:
>>>> In some of the recent chipsets, PLLs require more than one power domain
>>>> to be kept ON to configure the PLL. But the current code doesn't enable
>>>> all the required power domains while configuring the PLLs, this leads
>>>> to functional issues due to suboptimal settings of PLLs.
>>>>
>>>> To address this, add support for handling runtime power management,
>>>> configuring plls and enabling critical clocks from qcom_cc_really_probe.
>>>> The clock controller can specify PLLs, critical clocks, and runtime PM
>>>> requirements in the descriptor data. The code in qcom_cc_really_probe()
>>>> ensures all necessary power domains are enabled before configuring PLLs
>>>> or critical clocks.
>>>>
>>>> This series updates SM8450 & SM8550 videocc drivers to handle rpm,
>>>> configure PLLs and enable critical clocks from within qcom_cc_really_probe()
>>>> using above support, so video PLLs are configured properly.
>>>>
>>>> This series fixes the below warning reported in SM8550 venus testing due
>>>> to video_cc_pll0 not properly getting configured during videocc probe
>>>>
>>>> [   46.535132] Lucid PLL latch failed. Output may be unstable!
>>>>
>>>> The patch adding support to configure the PLLs from common code is
>>>> picked from below series and updated it.
>>>> https://lore.kernel.org/all/20250113-support-pll-reconfigure- v1-0-1fae6bc1062d@quicinc.com/
>>>>
>>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>>> ---
>>>> Changes in v2:
>>>>    - Added support to handle rpm, PLL configuration and enable critical
>>>>      clocks from qcom_cc_really_probe() in common code as per v1 commments
>>>>      from Bryan, Konrad and Dmitry
>>>>    - Added patches to configure PLLs from common code
>>>>    - Updated the SM8450, SM8550 videocc patches to use the newly
>>>>      added support to handle rpm, configure PLLs from common code
>>>>    - Split the DT change for each target separately as per
>>>>      Dmitry comments
>>>>    - Added R-By and A-By tags received on v1
>>>> - Link to v1: https://lore.kernel.org/r/20250218-videocc-pll-multi- pd-voting-v1-0-cfe6289ea29b@quicinc.com
>>>>
>>>> ---
>>>> Jagadeesh Kona (7):
>>>>         dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
>>>>         clk: qcom: common: Manage rpm, configure PLLs & AON clks in really probe
>>>>         clk: qcom: videocc-sm8450: Move PLL & clk configuration to really probe
>>>>         clk: qcom: videocc-sm8550: Move PLL & clk configuration to really probe
>>>>         arm64: dts: qcom: Add MXC power domain to videocc node on SM8450
>>>>         arm64: dts: qcom: Add MXC power domain to videocc node on SM8550
>>>>         arm64: dts: qcom: Add MXC power domain to videocc node on SM8650
>>>>
>>> This list looks sparse.
>>>
>>> - camcc is missing
>>> - x1e is missing
>>> - sm8650 and sm8750 and both also missing
>>>
>>
>> Since there are concerns about DT bindings ABI change of CAMCC given by
>> Krzysztof, likely CAMCC changes shall not be inserted into this series.
>>
>> -- 
>> Best wishes,
>> Vladimir
> 
> drivers/clk/qcom/camcc-sm8650.c
> drivers/clk/qcom/camcc-x1e80100.c
> 
> In fact we appear to be amending the dts but not the driver for the 8650 here.
> 
> @Jagadeesh please follow up.
> 

SM8650 videocc is just reusing the SM8550 videocc driver, so no separate changes
are required for SM8650. Will add support for above camcc drivers in next series.

Thanks,
Jagadeesh
 
> ---
> bod

