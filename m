Return-Path: <linux-arm-msm+bounces-22166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0472B901DCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 11:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 836282870BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 09:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D6174048;
	Mon, 10 Jun 2024 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OHolfTcY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8090E71B45;
	Mon, 10 Jun 2024 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718010403; cv=none; b=lfiAotFKwICSuaDJXHx0IHHpTj2mM0oBvGrKM4DM+KWdazygWn7+g+G3IcF9JyvRJy+k9gex5TY9wFo7U2PTwjqBE7eE7t7cplk5PP/5giZmk3AM8TGFzxPA8K69ygQmxmiDwbZPnV7UC0CebhfrNHd7sPSXVwiI2Vl231PG4qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718010403; c=relaxed/simple;
	bh=cXpIQwdOFwpRYDgMZICQtx7dUPNMhEGu7oF1UszN0eA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=twbC8FXU0CcF/EWB3+xdOytNlBtevIHYgzVr2fkRSacDXSmXt/6SeNBTEd+cEr88W78G/W+Xye518RQ7+5bvpb/378CxBkqaYLZlo1m9/KEutk/KeIFW6SYRsoRFH+j9m4h+2mcY2hGglfehfbErU6PL5i/KdwBPwf/AkKqurl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OHolfTcY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A1SKiA011284;
	Mon, 10 Jun 2024 09:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OG3gmwLRMUSXGx3g0muu5+EjfPbltY+dr20vMWIqfyw=; b=OHolfTcYe7kdiAUH
	vX5Wj7btu2IS3jO3LZQx26D5usFnwrBvCty9WcyKNWB/10DAag5neIWIRaYxmcfc
	tzHykg2WYgJWjKcksQWWZpjyZw2zp1zvkmgSiKZN2UJgIb3RYI+B+eskdH1MMfYN
	r6xRQR3OadFo2tutCBr7WMrgkcnkbDJPazBo7O9npsdPMNmTox+lthAN/TzsYSjK
	c75GInFBov1DSDsVhY5K1pseKss2ogFUP/gKldPZG6tdO1Rke29PH0eN3HDWEUlg
	dOD6WAT3xkUuDE9Wj7kJAvoPEDZFK8xf8kegs2+9WlPJaXQnpmZ8hZOcDS9olG6N
	btwZpw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymcnmu1r0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:06:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45A96Zk4023950
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:06:35 GMT
Received: from [10.218.0.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 02:06:31 -0700
Message-ID: <4b7ed171-2669-43cb-a58c-381c76ee1e85@quicinc.com>
Date: Mon, 10 Jun 2024 14:36:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] clk: qcom: gpucc-sa8775p: Remove the
 CLK_IS_CRITICAL and ALWAYS_ON flags
To: Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
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
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <woi4vzsc2mgug26rluvzt6ayoawfsus6ow2kqnmfnnqlwf2lty@sirpsaf2anuz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W_LeSTjDFhJk_MgZSu8Kj9mvzzCPElWs
X-Proofpoint-ORIG-GUID: W_LeSTjDFhJk_MgZSu8Kj9mvzzCPElWs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100069



On 6/2/2024 9:42 AM, Bjorn Andersson wrote:
> On Fri, May 31, 2024 at 11:59:04AM GMT, Krzysztof Kozlowski wrote:
>> On 31/05/2024 11:02, Taniya Das wrote:
>>> The gpu clocks and GDSC have been marked critical from the clock driver
>>> which is not desired for functionality. Hence remove the CLK_IS_CRITICAL
>>> and ALWAYS_ON flags.
>>>
>>> Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>>   drivers/clk/qcom/gpucc-sa8775p.c | 27 +++++++++++----------------
>>>   1 file changed, 11 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
>>> index 1167c42da39d..f965babf4330 100644
>>> --- a/drivers/clk/qcom/gpucc-sa8775p.c
>>> +++ b/drivers/clk/qcom/gpucc-sa8775p.c
>>> @@ -1,6 +1,6 @@
>>>   // SPDX-License-Identifier: GPL-2.0-only
>>>   /*
>>> - * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
>>> + * Copyright (c) 2021-2022, 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>
>> That's not a fix.
>>
>>>    * Copyright (c) 2023, Linaro Limited
>>>    */
>>>   
>>> @@ -280,7 +280,7 @@ static struct clk_branch gpu_cc_ahb_clk = {
>>>   				&gpu_cc_hub_ahb_div_clk_src.clkr.hw,
>>>   			},
>>>   			.num_parents = 1,
>>> -			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>>> +			.flags = CLK_SET_RATE_PARENT,
>>
>> I fail to see why this is a fix. They were marked as critical on
>> purpose. It was needed, wasn't it?
>>
>> Provide jsutification for commits, not just sprinkle Fixes tag all around.
>>
> 
> This is indeed a fix, as marking clocks CLK_IS_CRITICAL prevents any
> power-domain associated with the clock controller from suspending. In
> other words, the current behavior is broken.
> 
> @Taniya, "not desired for functionality" does not carry any useful
> information explaining why this change is made. Please update the commit
> message.
> 

Sure, Bjorn, will update the commit in the next series.

The GPU clocks/GDSCs have been marked critical from the clock driver
but the GPU driver votes on these resources as per the HW requirement.
We don't require these clocks and GDSC's to be kept always ON which 
would have power impact and also GPU stability/corruptions.
Hence remove the CLK_IS_CRITICAL and ALWAYS_ON flags.

> Regards,
> Bjorn
> 
>>
>> Best regards,
>> Krzysztof
>>

-- 
Thanks & Regards,
Taniya Das.

