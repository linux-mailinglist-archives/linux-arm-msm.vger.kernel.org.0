Return-Path: <linux-arm-msm+bounces-21342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A75F88D6864
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 19:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F1E2288077
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 17:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49BE17B404;
	Fri, 31 May 2024 17:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jS9heyO+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FF5446D1;
	Fri, 31 May 2024 17:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717177607; cv=none; b=B5YONc9uw098/JNq2sPqiplVSgn07Htu3pdasmLaCqU6FKcetZ/H2vr2C0IZ5DnN49VgjtxUYldso8TBbkI67Nyjaz3+XZ8z6VVGvQghTlBwIPUy2lFjTeT2NF9aqUEUO03nJmjMD07UOHg2/v7JLpHAfMv4+fDRo/QUoToBOVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717177607; c=relaxed/simple;
	bh=Jactaw/uaQDCqVlYlCN8SCZA8mfXUF5s7kM6dX3ZtcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pzxmwkqUMT7yVUm4MXYmi7xrltXy5NWSmJ5n4YruAnoZhcrJLKsm85aTrILg7BbHEf0/JXkNcuE+IpiyJcXwm3EIeOx+tmAyGAojRSoo4uTk8p3vr0pNIJbPjL0wX0yIgegIS0j/nACJjSg69DXXiIFskWJKMftgViwqLcto8JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jS9heyO+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V9TDHA012449;
	Fri, 31 May 2024 17:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lojhr8KdZI9iOzBReVoHzeXEE7SevnRJFlYKRMmFYAY=; b=jS9heyO+7eyinRPT
	/9B0oyYAlqplh9wMMZ4pp+c/t/wkyn1DFozbHO1KS+9cUvA5qod2uko3f1WLHzNe
	yGVNR+3Tftvi7MNAdPJLiZd4mSleJyMZ5mL4GlrJ7lPnMZ7Lx5IevKseO8jdl03B
	E7+x0Np1a6TWwhsc4gU+WeKR/FcgS5A40i/6DgTRaPG/Ebo+dF56DW2KUxTDUfPb
	VWOVrxkFLK4YaZzjvgHkbKKhAWC25bqcLtkgqr/hiPXnIUmYBj/fK9gleSP3zFmm
	prFny8NnlonzY8hnvnMlU+SkTxqxCs3r9hYNgK0B1eeL9skni71kabImO08/abMc
	gsCeiw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0qqtv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 17:46:41 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VHke97026694
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 17:46:40 GMT
Received: from [10.110.0.231] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 10:46:39 -0700
Message-ID: <cb1066a9-d3b2-d921-9af6-01300987d37b@quicinc.com>
Date: Fri, 31 May 2024 10:46:39 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 04/13] clk: qcom: gpucc-sa8775p: Remove the
 CLK_IS_CRITICAL and ALWAYS_ON flags
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-5-quic_tdas@quicinc.com>
 <0f56831e-8572-46f5-89cf-d1e990813a02@linaro.org>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <0f56831e-8572-46f5-89cf-d1e990813a02@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: l5C3eVaSej4myDn4eoOJ_JgbrLyCvyng
X-Proofpoint-ORIG-GUID: l5C3eVaSej4myDn4eoOJ_JgbrLyCvyng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310135

On 5/31/2024 2:59 AM, Krzysztof Kozlowski wrote:
> On 31/05/2024 11:02, Taniya Das wrote:
>> The gpu clocks and GDSC have been marked critical from the clock driver
>> which is not desired for functionality. Hence remove the CLK_IS_CRITICAL
>> and ALWAYS_ON flags.
>>
>> Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>  drivers/clk/qcom/gpucc-sa8775p.c | 27 +++++++++++----------------
>>  1 file changed, 11 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
>> index 1167c42da39d..f965babf4330 100644
>> --- a/drivers/clk/qcom/gpucc-sa8775p.c
>> +++ b/drivers/clk/qcom/gpucc-sa8775p.c
>> @@ -1,6 +1,6 @@
>>  // SPDX-License-Identifier: GPL-2.0-only
>>  /*
>> - * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2021-2022, 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> 
> That's not a fix.
> 
>>   * Copyright (c) 2023, Linaro Limited
>>   */
>>  
>> @@ -280,7 +280,7 @@ static struct clk_branch gpu_cc_ahb_clk = {
>>  				&gpu_cc_hub_ahb_div_clk_src.clkr.hw,
>>  			},
>>  			.num_parents = 1,
>> -			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>> +			.flags = CLK_SET_RATE_PARENT,
> 
> I fail to see why this is a fix. They were marked as critical on
> purpose. It was needed, wasn't it?
> 
> Provide jsutification for commits, not just sprinkle Fixes tag all around.

Taniya - please separate fixes into another series? 

-- 
---Trilok Soni


