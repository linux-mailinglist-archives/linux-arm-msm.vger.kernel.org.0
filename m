Return-Path: <linux-arm-msm+bounces-30417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA13A968B1C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 17:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56CC6B216C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 15:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF94F13C9C7;
	Mon,  2 Sep 2024 15:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Yop8Mwho"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CDA1CB514;
	Mon,  2 Sep 2024 15:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725291261; cv=none; b=WgugJZyr6Q5xVSL5Ck+mzgE+MLrvLnPvWStdT8AEuYE+6TGgpWkZCc5TOchqWH5h3yzfF4/mwRZ6kAyDvrCpSDXGvBbpsfkfWAQ3UzlJOr2bffwu64hxhI7xhIP96/JGtsKMlIJxkquw0+h3x9yE420tXVd01fW2XFIboG9kqvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725291261; c=relaxed/simple;
	bh=vCcQ9NB0LiNRbZ//WE2/zEZ6PWxPEAu7O9GOLgqE/2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GcsWzt8NMHrxObSdYgcpyoEdrJvOk+BZh7vvQGBypUdNywZkBy12yUz1CvopBoPgHeloLF5fWOkn/pQ5U7opcyVTon+CLG4B8oUgZ7NlnAxNYPVgCcb5hwpgZQqRffZ2JfxNXRyKaTtyHOul4wpJeLh6yVZqoXbmQQVo+cDnJgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Yop8Mwho; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482AxvoR010042;
	Mon, 2 Sep 2024 15:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3DLs52+iwcPCDzJQJkKgEQL73datcOJ1QKKlau+klrM=; b=Yop8MwhoXjwAYRkd
	kAL1JRcXzLEXfYS16Xp5nymjiHtPVB8WHat+ppYhsWr3+nue1aB1zBKto3AfXrZg
	MLO5Od0tPot0ZAS+RHBVBLKRADm49m8wf+PUZkNWetYaj6TvTTvx8WmcWz6x7kkN
	rrnwqul7BUbX2OH2bU1BfbzSo9Wa+goB9GuYc0ns7c+gwPJr3lthsL5U3SoMqKze
	NhPxgEsxqZrW0HBGx6ESbzx/qyslg6rRPpsJEgi8YPuFdh/qT/O0T4GXmTlMPwsp
	pdmlNGXv7hF2yVD356V2nrRWc4v+GZdefi4P2fCMr3A9kwMot6CrNZvawk8YGTeE
	VXBTQw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41brhndckg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 15:34:06 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 482FY4MQ026945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Sep 2024 15:34:04 GMT
Received: from [10.253.79.111] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Sep 2024
 08:34:00 -0700
Message-ID: <ecc34401-68c2-463f-b630-6a81ad95625e@quicinc.com>
Date: Mon, 2 Sep 2024 23:33:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: qcom: Add CMN PLL clock controller driver for
 IPQ SoC
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>
References: <20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com>
 <20240827-qcom_ipq_cmnpll-v3-2-8e009cece8b2@quicinc.com>
 <d7b374670eb2f6d442f351106ab1221a.sboyd@kernel.org>
 <7f4d41a0-b1b9-4b63-8590-63f4fcf1a359@quicinc.com>
 <7736d0d0-634d-403d-b70f-f33b7402456c@quicinc.com>
 <04944b77ce6327ba5f4ec96348a9cda2.sboyd@kernel.org>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <04944b77ce6327ba5f4ec96348a9cda2.sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bOj18FDAbeH-jVO2mgGuJ2irMu9A5k__
X-Proofpoint-ORIG-GUID: bOj18FDAbeH-jVO2mgGuJ2irMu9A5k__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_04,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409020123



On 8/31/2024 6:24 AM, Stephen Boyd wrote:
> Quoting Jie Luo (2024-08-30 09:14:28)
>> Hi Stephen,
>> Please find below a minor update to my earlier message on clk_ops usage.
> 
> Ok. Next time you can trim the reply to save me time.

OK.

> 
>> On 8/28/2024 1:44 PM, Jie Luo wrote:
>>> On 8/28/2024 7:50 AM, Stephen Boyd wrote:
>>>> Quoting Luo Jie (2024-08-27 05:46:00)
>>>>> +       case 48000000:
>>>>> +               val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
>>>>> +               break;
>>>>> +       case 50000000:
>>>>> +               val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 8);
>>>>> +               break;
>>>>> +       case 96000000:
>>>>> +               val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
>>>>> +               val &= ~CMN_PLL_REFCLK_DIV;
>>>>> +               val |= FIELD_PREP(CMN_PLL_REFCLK_DIV, 2);
>>>>> +               break;
>>>>> +       default:
>>>>> +               return -EINVAL;
>>>>> +       }
>>>>
>>>> Why isn't this done with struct clk_ops::set_rate() or clk_ops::init()?
>>>
>>> OK, I will move this code into the clk_ops::init().
>>
>> This code is expected to be executed once for initializing the CMN PLL
>> to enable output clocks, and requires the parent clock rate to be
>> available. However the parent clock rate is not available in the
>> clk_ops::init(). Hence clk_ops::set_rate() seems to be the right option
>> for this. Please let us know if this approach is fine. Thanks.
> 
> Sure. It actually sounds like the PLL has a mux to select different
> reference clks. Is that right? If so, it seems like there should be
> multiple 'clocks' for the DT property and many parents possible. If
> that's the case then it should be possible to have something like
> 
> 	clocks = <0>, <&refclk>, <0>;
> 
> in the DT node and then have clk_set_rate() from the consumer actually
> set the parent index in hardware. If that's all static then it can be
> done with assigned-clock-parents or assigned-clock-rates.

Thanks Stephen. The CMN PLL block always uses a single input reference
clock pin on any given IPQ SoC, however its rate may be different on
different IPQ SoC. For example, its rate is 48MHZ on IPQ9574 and 96MHZ
on IPQ5018.

Your second suggestion seems more apt for this device. I can define the
DT property 'assigned-clock-parents' to configure the clock parent of
CMN PLL. The code for reference clock selection will be added in
clk_ops::set_parent(). Please let us know if this approach is fine.




