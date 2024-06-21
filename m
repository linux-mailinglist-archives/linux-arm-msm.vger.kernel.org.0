Return-Path: <linux-arm-msm+bounces-23632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAF0912BF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 18:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F4FA28B7C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 16:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9AA31662E7;
	Fri, 21 Jun 2024 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V9X8uvnT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EB715AACD;
	Fri, 21 Jun 2024 16:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718989006; cv=none; b=jXdzelD8hhpLgJxHRD10DRhEJHrg4Xc4v+dKI6Pm5TXHBocGeQVG9hm1Zcvrkc/x/J94QMtNR7TFUZZD2L9ywP5YqcsoLj6/ezyaEcBt+QBW2enubRifmWDbmDxcw/dUaGhuajLCbOaKr/I40HzKj8DcilvOM52wzRUNQXzy6NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718989006; c=relaxed/simple;
	bh=n132DwKyYUHj3NiZKzJ2KoW1RQf5gMQTgFtd9SK4ok8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=twExwB9kQlj+frJ65TX0hKbHCV01Ia0EqXtUAC3u41n9IMRXnO3yB/EQ25LAWvj0CsLPv/UQZR2g3Ywl6cPBTYXQ2K9VXw/oG8tVDMowhEUDWpwwzTQQcMBZA3+08YYNU0P0H2SgAu4fWWj0qcpRqvTS/WT+GMciapWdQa+iHgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V9X8uvnT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LEILeA011370;
	Fri, 21 Jun 2024 16:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kUv80vZ6khixWxQQEnBqKp5KLpX7ptf9eFXJ0sTRTyU=; b=V9X8uvnTt3Tdrm9P
	fbc8rv0msVJe6YB6DB2Gn8xPXRoqUUUuOTBAT+shFqiYPME89dMYVv7jUjv7o2w6
	9ioTkbEOMNP8aFwpMubyf2bY0NcDaMjZyfYmPL0C2A5H0H9UriSBcuSTaRwPpklb
	rDOS+JF47GLgOvW/fpDHj3QeeUllI2MBL7zVLfdLQXogi8Y7R/OMG9PWh4REw2Jk
	71fREVSIwTgxkYg6zKt3zjqXdxp0jfCoV0AJmC6/r1knScZEfWoAdnvIsIAHPZKn
	KtyNyn2alhmpg+Re9VTcbmde4J5eGRwd1UnuzU6PVXPSVMtrI824RcrLijpE7SYL
	133TbQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrrcb5g2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 16:56:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45LGudC5031649
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 16:56:39 GMT
Received: from [10.216.44.165] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Jun
 2024 09:56:35 -0700
Message-ID: <7a5dd5a7-b9ad-4ae7-8267-8dc4c221fef2@quicinc.com>
Date: Fri, 21 Jun 2024 22:26:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: qcom: dispcc-sm8650: Park RCG's clk source at XO
 during disable
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen
 Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
 <20240621-topic-sm8650-upstream-fix-dispcc-v1-1-7b297dd9fcc1@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20240621-topic-sm8650-upstream-fix-dispcc-v1-1-7b297dd9fcc1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: m2yYyrm2fqpTLbCrtzEBmeOndlNTu8WU
X-Proofpoint-ORIG-GUID: m2yYyrm2fqpTLbCrtzEBmeOndlNTu8WU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_08,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406210122



On 6/21/2024 7:31 PM, Neil Armstrong wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> 
> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm8650.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
> index c9d2751f5cb8..31c82f791b44 100644
> --- a/drivers/clk/qcom/dispcc-sm8650.c
> +++ b/drivers/clk/qcom/dispcc-sm8650.c
> @@ -339,7 +339,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx0_aux_clk_src = {
>   		.parent_data = disp_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -457,7 +457,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx2_aux_clk_src = {
>   		.parent_data = disp_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -516,7 +516,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx3_aux_clk_src = {
>   		.parent_data = disp_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -560,7 +560,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
>   		.parent_data = disp_cc_parent_data_5,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -575,7 +575,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
>   		.parent_data = disp_cc_parent_data_5,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -647,7 +647,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
>   		.parent_data = disp_cc_parent_data_0,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
>   
> @@ -667,7 +667,7 @@ static struct clk_rcg2 disp_cc_sleep_clk_src = {
>   		.parent_data = disp_cc_parent_data_9,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
Technically not required for this RCG as the source is sleep clock.
>   };
>   
> @@ -682,7 +682,7 @@ static struct clk_rcg2 disp_cc_xo_clk_src = {
>   		.parent_data = disp_cc_parent_data_0_ao,
>   		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0_ao),
>   		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>   	},
>   };
This RCG supports only XO frequency and can be ignored.
>   
> 

-- 
Thanks & Regards,
Taniya Das.

