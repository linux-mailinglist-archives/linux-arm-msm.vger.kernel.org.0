Return-Path: <linux-arm-msm+bounces-34939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C109A3CC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 13:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A284281159
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 11:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC462022E2;
	Fri, 18 Oct 2024 11:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EFBBx2Bb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B7E18C938;
	Fri, 18 Oct 2024 11:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729249384; cv=none; b=gh70UV5JguACdfFP5ZPM7Wesgfiyo8K6PRp7L+TdiReJo1RIaKyCvZw9S4EJHhFVc/YMvqV4doQLrDOTpcXWql+vg90XsK9ahkLV8NZqXFGOEFil8BAjIpAM7KO8L84UYAoLLaSa2Xl0Ha+Gm3Wd/NHknNVyiVxuYefTPOv1MtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729249384; c=relaxed/simple;
	bh=LR/c3xU4hDfFgXjw04gG6uCX3S4OvhfEfnZZalGUYUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YXaNDHfDynbbQQZUwoVfIcLa3TG2yqvImgIO0bHWq7wIbPqcWRgSiXIAKyNdm8bHNlHR8GKt78OUuGvpWnbnsT3TkH2CZICss40PVlA8vVbidM3i3AvzGKDpHLPdWGuvkb/rqf+De01Rwqa8sRYMblPGvut0s+1HEsTt+vBGOEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EFBBx2Bb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I9M7w7006477;
	Fri, 18 Oct 2024 11:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ot9s+3Q8ivE3sA0acLWxoXDq4Fga1oL1hf003eoy9vM=; b=EFBBx2Bb4j13BDXa
	vw7Kg9maieitixWfXGiPDfPU4vuEj6Jm7WL+khG5ZlwP3w7mCwDbqPDvsvrfVP5l
	UgiTfG/RJhNyZSth0LZ3Ooz1rVntmIBuCgd+VZolXv/IGfgTT6ZBz7CBm/PjcQxF
	Q4phCjMcAGzSqC/nTTjbwK9e7gr9v/dQkXdbgotYutli1DJ3WnNqpO+wdO34bNTY
	+j+6fTq2x6Q7sEm9QTRtebrJ7WF5uXKesrZ3QXjHhBEfPrm6/bzhW0hjZO3d0fyf
	rYjw7IiYnyFL9EKiPmeSSydWU1YPUdeipmlYMkTajLX1WsAZJBrJILGQ+1ST2yNK
	NNZVDQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bmys8cgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 11:02:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IB2t76030966
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 11:02:55 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 04:02:50 -0700
Message-ID: <dfafb945-69f7-4378-9bb0-72eee37de235@quicinc.com>
Date: Fri, 18 Oct 2024 16:32:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] clk: qcom: clk-branch: Add support for
 BRANCH_HALT_POLL flag
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd
	<sboyd@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Kalpak Kawadkar
	<quic_kkawadka@quicinc.com>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-6-f75e740f0a8d@linaro.org>
 <d7989a770f0eb35a5ba346beb5e7548c.sboyd@kernel.org>
 <jcjncf5k5syvcvwxoopksisjvvmw4cvxo35nieqf63mquj57io@fumh4jnh2e4p>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <jcjncf5k5syvcvwxoopksisjvvmw4cvxo35nieqf63mquj57io@fumh4jnh2e4p>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: svb31PHtab0PIb2He5odXbQq4fIFbKIH
X-Proofpoint-ORIG-GUID: svb31PHtab0PIb2He5odXbQq4fIFbKIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410180070



On 10/18/2024 3:35 AM, Dmitry Baryshkov wrote:
> On Thu, Oct 17, 2024 at 11:03:20AM -0700, Stephen Boyd wrote:
>> Quoting Dmitry Baryshkov (2024-10-17 09:56:56)
>>> From: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
>>>
>>> On some platforms branch clock will be enabled before Linux.
>>> It is expectated from the clock provider is to poll on the clock
>>
>> Unfortunately 'expectated' is not a word. The sentence is also
>> grammatically incorrect.
>>
>>> to ensure it is indeed enabled and not HW gated, thus add
>>> the BRANCH_HALT_POLL flag.
>> [...]
>>> diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
>>> index 229480c5b075a0e70dc05b1cb15b88d29fd475ce..c4c7bd565cc9a3926e24bb12ed6355ec6ddd19fb 100644
>>> --- a/drivers/clk/qcom/clk-branch.c
>>> +++ b/drivers/clk/qcom/clk-branch.c
>>> @@ -76,6 +76,7 @@ static int clk_branch_wait(const struct clk_branch *br, bool enabling,
>>>                  udelay(10);
>>>          } else if (br->halt_check == BRANCH_HALT_ENABLE ||
>>>                     br->halt_check == BRANCH_HALT ||
>>> +                  br->halt_check == BRANCH_HALT_POLL ||
>>
>> The name is confusing. The halt check is already "polling", i.e. this
>> isn't a different type of halt check. This is really something like
>> another branch flag that doesn't have to do with the halt checking and
>> only to do with skipping writing the enable bit. Maybe we should
>> introduce another clk_ops for these types of clks instead.
> 
> SGTM. All clocks with this flag use clk_branch2_aon_ops, so it is easy
> to switch to a separate clk_ops.
> 

The basic requirement here is to just poll in both enable/disable, but 
HLOS cannot update the CLK_ENABLE bit. The clock could be gated by the 
bandwidth vote and thus to ensure the clock is in good state before the 
consumers start using the subsystem.

We can definitely think for a different ops, I think it is better we 
have a good name to the flag.

>>
>>>                     (enabling && voted)) {
>>>                  int count = 200;
>>>   
>>> @@ -97,6 +98,10 @@ static int clk_branch_toggle(struct clk_hw *hw, bool en,
>>>          struct clk_branch *br = to_clk_branch(hw);
>>>          int ret;
>>>   
>>> +       if (br->halt_check == BRANCH_HALT_POLL) {
>>
>> Remove braces
>>
>>> +               return  clk_branch_wait(br, en, check_halt);
>>
>> Remove extra space      ^
>>
>>> +       }
>>> +
> 

-- 
Thanks & Regards,
Taniya Das.

