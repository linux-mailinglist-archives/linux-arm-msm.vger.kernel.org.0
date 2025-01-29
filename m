Return-Path: <linux-arm-msm+bounces-46550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8ABA2241A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 19:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3117F1678F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 18:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BA71E1041;
	Wed, 29 Jan 2025 18:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b2inzRpq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F1618FDC5;
	Wed, 29 Jan 2025 18:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738176214; cv=none; b=q6Y9aLqPBEGU8H6PVy6PObqauUZbJS+L1pRL6RleeK3EuxQ2aG1gSVHyj1fJbYXXiByz76EzgAEl8/vXQSYsHA3sddf/pPIldmwvlvGiuoznN5KGGJisNEZVDxq9lAUz2kOb0SHrQhCKv5nIlnM2i91GhYsbfp7NLnE/WWAeAGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738176214; c=relaxed/simple;
	bh=YOELrXPf8z4ANTH8fctGS3PLrp32Tu4IHcD/fjnkwAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r2ayL9/i2h/ZllvcMpKwDqlsy4cgJmbURK6dfUDYYWY4VLdVfL/0pIq8q5/asxbmsOHzezGeByNvKxnkRIT2283hL8xo5M3IT3tYf/eBhwNgikLsGPF4WtDgV5YjB2WMPUeyBNeRYpjV0KGZalqh5tBhAqVXHNiUIxHko9GNpwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b2inzRpq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TEqhqf004511;
	Wed, 29 Jan 2025 18:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xm1Z+TeuIAmNDVrsterdveTQA0h+8LX64tVWfsTC4FE=; b=b2inzRpqzijBO8yk
	51Zzoy9syLrQxhHISx2FiPowBQVzkTBHu391cq3Cyduxuzv4bskZcp7BUA8TguLG
	FGQ4b+JWzyy7YdwOfbQOG7Qgfs6WYJMrIohHf9MEakaQSLlbTC/BG7bnS5WENbc2
	mtXnIZzO5Li+6S3P53TWZWhR8TJZKUaiGwTh9G1G8L1gdOkZpf9wwQGL/Vp7FtdE
	3QKmPDrae7OLHO+w98tM4UsCrDGIOmvptMrqY4r/BSYNKyQI7NSH+DIaTQN8asTM
	BACl31FHnqUOwDVms4/5s/iQVxKKjYwq1BcHcl0H+I8TP+dfuRq9ucQgCWJ6+a2N
	4fi2ig==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fpfu8gx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 18:43:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50TIhSFn017246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 18:43:28 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 Jan
 2025 10:43:28 -0800
Message-ID: <4761c8ad-6f02-45bf-8fc1-87e40b7702fe@quicinc.com>
Date: Wed, 29 Jan 2025 10:43:21 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-sm8750: Drop incorrect
 CLK_SET_RATE_PARENT on byte intf parent
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen
 Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250129154519.209791-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250129154519.209791-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HoxU2DFGhxenA6KQ85beXwYbRfTUj1mj
X-Proofpoint-ORIG-GUID: HoxU2DFGhxenA6KQ85beXwYbRfTUj1mj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_04,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=896 impostorscore=0 suspectscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290146



On 1/29/2025 7:45 AM, Krzysztof Kozlowski wrote:
> The parent of disp_cc_mdss_byte0_intf_clk clock should not propagate up
> the rates, because this messes up entire clock hierarchy when setting
> clock rates in MSM DSI driver.
> 
> The dsi_link_clk_set_rate_6g() first sets entire clock hierarchy rates
> via dev_pm_opp_set_rate() on byte clock and then sets individual clock
> rates, like pixel and byte_intf clocks, to proper frequencies.  Having
> CLK_SET_RATE_PARENT caused that entire tree was re-calced and the byte
> clock received halved frequency.  Drop CLK_SET_RATE_PARENT to fix this
> and align with SM8550 and SM8650.
> 
> Fixes: f1080d8dab0f ("clk: qcom: dispcc-sm8750: Add SM8750 Display clock controller")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Fix for v6.14-rcX.
> ---
>   drivers/clk/qcom/dispcc-sm8750.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
> index 0358dff91da5..e9bca179998b 100644
> --- a/drivers/clk/qcom/dispcc-sm8750.c
> +++ b/drivers/clk/qcom/dispcc-sm8750.c
> @@ -827,7 +827,6 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
>   			&disp_cc_mdss_byte0_clk_src.clkr.hw,
>   		},
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_regmap_div_ops,
>   	},
>   };
> @@ -842,7 +841,6 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
>   			&disp_cc_mdss_byte1_clk_src.clkr.hw,
>   		},
>   		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
>   		.ops = &clk_regmap_div_ops,
>   	},
>   };

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

