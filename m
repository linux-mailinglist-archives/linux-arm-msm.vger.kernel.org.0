Return-Path: <linux-arm-msm+bounces-22169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B65C901DDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 11:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77216287D61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 09:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498816F312;
	Mon, 10 Jun 2024 09:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ReHRIupt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1CA6BFA3;
	Mon, 10 Jun 2024 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718010616; cv=none; b=oe4F+W4CWZZoIfP6cE333O9MJyYe/kUI9ysnwkgVp3YAlD1JCHgq5wvwMnFdBxn6WEMxyDO7VchecZ6ZOx5VD+KT7uIDV+9VDWEbYLLjWmA9AENDiNsGYs5rQqJ2pIEmBzGMt+2r5FfgwnQyh7B4R5UGrlj5EEuA3kxg825wDx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718010616; c=relaxed/simple;
	bh=C345klUXtZrZAxW06jijh3nAuUnPKwaUGQ92UcEQLj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DsZr/rWtKvKi4iX/BgkosaSGAnOMccSkfe07XpMs/hSeOLRPMVcLtyzlA4xdNbmYTh9rgnrB++kfvv6seybYyLpi8rVO36p1MDZ4ASyDBUUjUz8HE5TvSSf6ePNyYeZWE9If7LgkHy4M3M1G+xyeEkAZQdvFdSIrYKzQ//4+WF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ReHRIupt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A0C6Mv027516;
	Mon, 10 Jun 2024 09:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9YfPDI025Zw/QOEyDPU62iBIDKgkTNqABcJ1/xGf2c=; b=ReHRIuptdvDCCmjs
	BZOPYQuuDVTIyDkRMjsWJMA8LUFnHVYX0fO6imBO40vZ7bBGSac9QoWl7yhFLYXS
	WiCw/8r5WnfyIgUGBnqxALG4xqSoQdpgp0qzwtO5mCnJPehx59OFSBJMFGEhnZXB
	x9BOh/5fJl8dIfg9duPCiBVL9SbiMwxX9r1H4QcSDF8kRY4WHx03yz6i9sMYkowP
	7tAV/6oRAHhQzkUAgdN0fmXM6SrZahQjEAReglLeessT9lx9G5R0mJS12OzyxJGE
	8b8C69H7aSLdDeSs+ls8Be3vjb1tM+xkaB+lQ3f0k/TONX/zItXa9AkQbhNbYIoY
	/GbgWQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymemgk2j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:10:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45A9A9w8030648
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:10:09 GMT
Received: from [10.218.0.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 02:10:04 -0700
Message-ID: <81e33926-a770-4194-968d-fe7db44ba50b@quicinc.com>
Date: Mon, 10 Jun 2024 14:40:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] clk: qcom: gpucc-sa8775p: Remove the
 CLK_IS_CRITICAL and ALWAYS_ON flags
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-5-quic_tdas@quicinc.com>
 <0f56831e-8572-46f5-89cf-d1e990813a02@linaro.org>
 <woi4vzsc2mgug26rluvzt6ayoawfsus6ow2kqnmfnnqlwf2lty@sirpsaf2anuz>
 <fa7dc574-e431-4a29-951d-1aaf4b86c37d@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <fa7dc574-e431-4a29-951d-1aaf4b86c37d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MI0Yj44KcSBNC3GOEGbFxMkHUklm1jXq
X-Proofpoint-ORIG-GUID: MI0Yj44KcSBNC3GOEGbFxMkHUklm1jXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406100069

On 6/2/2024 8:58 PM, Krzysztof Kozlowski wrote:
> On 02/06/2024 06:12, Bjorn Andersson wrote:
>> On Fri, May 31, 2024 at 11:59:04AM GMT, Krzysztof Kozlowski wrote:
>>> On 31/05/2024 11:02, Taniya Das wrote:
>>>> The gpu clocks and GDSC have been marked critical from the clock driver
>>>> which is not desired for functionality. Hence remove the CLK_IS_CRITICAL
>>>> and ALWAYS_ON flags.
>>>>
>>>> Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>>   drivers/clk/qcom/gpucc-sa8775p.c | 27 +++++++++++----------------
>>>>   1 file changed, 11 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
>>>> index 1167c42da39d..f965babf4330 100644
>>>> --- a/drivers/clk/qcom/gpucc-sa8775p.c
>>>> +++ b/drivers/clk/qcom/gpucc-sa8775p.c
>>>> @@ -1,6 +1,6 @@
>>>>   // SPDX-License-Identifier: GPL-2.0-only
>>>>   /*
>>>> - * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + * Copyright (c) 2021-2022, 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>>
>>> That's not a fix.
>>>
>>>>    * Copyright (c) 2023, Linaro Limited
>>>>    */
>>>>   
>>>> @@ -280,7 +280,7 @@ static struct clk_branch gpu_cc_ahb_clk = {
>>>>   				&gpu_cc_hub_ahb_div_clk_src.clkr.hw,
>>>>   			},
>>>>   			.num_parents = 1,
>>>> -			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>>>> +			.flags = CLK_SET_RATE_PARENT,
>>>
>>> I fail to see why this is a fix. They were marked as critical on
>>> purpose. It was needed, wasn't it?
>>>
>>> Provide jsutification for commits, not just sprinkle Fixes tag all around.
>>>
>>
>> This is indeed a fix, as marking clocks CLK_IS_CRITICAL prevents any
>> power-domain associated with the clock controller from suspending. In
>> other words, the current behavior is broken.
>>
>> @Taniya, "not desired for functionality" does not carry any useful
>> information explaining why this change is made. Please update the commit
>> message.
> 
> Then please provide some sort of bug explanation in the commit msg. I
> assume the clocks were marked critical to solve some particular problem,
> e.g. missing parents, so marking this as fix sounds like both incorrect
> and error-prone when backported. Maybe that's not the case, so this is
> why there is commit msg to explain such details...
> 

Thanks for your review. Sure, I will update the next series with the 
below details.

The GPU clocks/GDSCs have been marked critical from the clock driver
but the GPU driver votes on these resources as per the HW requirement.
We don't require these clocks and GDSC's to be kept always ON which 
would have power impact and also GPU stability/corruptions.
Hence remove the CLK_IS_CRITICAL and ALWAYS_ON flags.

But I am not sure why the original author left the clocks/GDSCs always ON.


> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

