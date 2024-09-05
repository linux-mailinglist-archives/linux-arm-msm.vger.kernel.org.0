Return-Path: <linux-arm-msm+bounces-30971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E1B96DE6F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 17:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B79A81C22D04
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 15:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C0D19DF44;
	Thu,  5 Sep 2024 15:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fMRg+EmM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8CC19B5BE;
	Thu,  5 Sep 2024 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725550389; cv=none; b=RwzV+fiqbMMa4aiGQJ3wTHGPGhHWvqWKP0sO8N0OxiLNtiX/PMlm72K83Bq/kvTc+zp8v1a1yBUUk1PTi8YL5BPt4sJ/9vW2STa6hJ71I5zmpDrXWCxp9jZCj5bYjbvFr8h+c4CxO49GbcrEA61/zbjcSymPIZ6laZKFdh0DBDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725550389; c=relaxed/simple;
	bh=WHiwuLVen3PKlDbNvBjj34sq4l3+Mmohw3vZtu3ZGgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k5NpYZbdXZxSx6IoLE+hmN7bDoJBYDsxtca2j/cQmTyAiwSBGmyxaZKBwoqXoORpgDzp+gZAef6SrhQDF9cOM7oJ7pq1SYFTQwpjuJbqPp0hjxALStsziF/jxbBv5fTQ5bON5kKXEtOE4GIuKXh5XGrx5wi/5fIK2dJj77FtC68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fMRg+EmM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48597l4w004502;
	Thu, 5 Sep 2024 15:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jT0Zr199HyLlj66U5T7JnMsSyMHx/rO+1YN/dr1/Y5c=; b=fMRg+EmML35TDi+B
	UPCXsCg7DrJIqsho2jpZsgl5zZumchIYPDOKb5AZ57/Uj1B5BsGtTgCeL9oKX+Qd
	aWVAnjHiS8f6h5QzhcZ0bB3yie8IblZt7VfZEVvVpJe8hZO+/2EgfLkTEbZNy1w7
	SnbRizPNTCO9mlr5W7YBiqh/JdNXpb57slMbBAqe6zMy/tI7SE8oalf1zo2AoYn4
	5tsjghzX5zipEFo5l6cboV+j2YAhQXkFYhjWibxcWo+mZinwZD8KmnpVYIry3UCi
	KLM+3+lRHLUP9sMBO2LtOPa0EwBxW8rIjKmZDUn0iyiq8bXCuniQ5kwkwHMNvuVL
	MEAW9g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt676h8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 15:32:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485FWnd4008926
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 15:32:49 GMT
Received: from [10.253.14.7] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 08:32:44 -0700
Message-ID: <4107dfca-7beb-403c-880b-bf1df20cae1f@quicinc.com>
Date: Thu, 5 Sep 2024 23:32:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: qcom: Add CMN PLL clock controller driver for
 IPQ SoC
To: Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Michael
 Turquette" <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, "Will
 Deacon" <will@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
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
 <ecc34401-68c2-463f-b630-6a81ad95625e@quicinc.com>
 <6sk7sx4pz2gnne2tg3d5lsphmnp6vqjj2tjogqcop7fwn3yk3r@ftevsz77w6pt>
 <492e3c19-c06d-4faa-8064-e6b73c46b13e@quicinc.com>
 <CAA8EJpqSFp_cETNE_3iiC1viLhPD5TE+H1F=m8UksybEpAvKHQ@mail.gmail.com>
 <c9ffecd72199926fc3d8a8e57208818c.sboyd@kernel.org>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <c9ffecd72199926fc3d8a8e57208818c.sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -P7TH9z9Il1S3VIybf2Cxu578SD4aTLu
X-Proofpoint-GUID: -P7TH9z9Il1S3VIybf2Cxu578SD4aTLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_10,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050115



On 9/4/2024 5:36 AM, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2024-09-03 07:08:07)
>> On Tue, 3 Sept 2024 at 17:00, Jie Luo <quic_luoj@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 9/3/2024 2:39 AM, Dmitry Baryshkov wrote:
>>>> On Mon, Sep 02, 2024 at 11:33:57PM GMT, Jie Luo wrote:
>>>>>
>>>>>
>>>>> On 8/31/2024 6:24 AM, Stephen Boyd wrote:
>>>>>> Quoting Jie Luo (2024-08-30 09:14:28)
>>>>>>> Hi Stephen,
>>>>>>> Please find below a minor update to my earlier message on clk_ops usage.
>>>>>>
>>>>>> Ok. Next time you can trim the reply to save me time.
>>>>>
>>>>> OK.
>>>>>
>>>>>>
>>>>>>> On 8/28/2024 1:44 PM, Jie Luo wrote:
>>>>>>>> On 8/28/2024 7:50 AM, Stephen Boyd wrote:
>>>>>>>>> Quoting Luo Jie (2024-08-27 05:46:00)
>>>>>>>>>> +       case 48000000:
>>>>>>>>>> +               val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
>>>>>>>>>> +               break;
>>>>>>>>>> +       case 50000000:
>>>>>>>>>> +               val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 8);
>>>>>>>>>> +               break;
>>>>>>>>>> +       case 96000000:
>>>>>>>>>> +               val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
>>>>>>>>>> +               val &= ~CMN_PLL_REFCLK_DIV;
>>>>>>>>>> +               val |= FIELD_PREP(CMN_PLL_REFCLK_DIV, 2);
>>>>>>>>>> +               break;
>>>>>>>>>> +       default:
>>>>>>>>>> +               return -EINVAL;
>>>>>>>>>> +       }
>>>>>>>>>
>>>>>>>>> Why isn't this done with struct clk_ops::set_rate() or clk_ops::init()?
>>>>>>>>
>>>>>>>> OK, I will move this code into the clk_ops::init().
>>>>>>>
>>>>>>> This code is expected to be executed once for initializing the CMN PLL
>>>>>>> to enable output clocks, and requires the parent clock rate to be
>>>>>>> available. However the parent clock rate is not available in the
>>>>>>> clk_ops::init(). Hence clk_ops::set_rate() seems to be the right option
>>>>>>> for this. Please let us know if this approach is fine. Thanks.
>>>>>>
>>>>>> Sure. It actually sounds like the PLL has a mux to select different
>>>>>> reference clks. Is that right? If so, it seems like there should be
>>>>>> multiple 'clocks' for the DT property and many parents possible. If
>>>>>> that's the case then it should be possible to have something like
>>>>>>
>>>>>>      clocks = <0>, <&refclk>, <0>;
>>>>>>
>>>>>> in the DT node and then have clk_set_rate() from the consumer actually
>>>>>> set the parent index in hardware. If that's all static then it can be
>>>>>> done with assigned-clock-parents or assigned-clock-rates.
>>>>>
>>>>> Thanks Stephen. The CMN PLL block always uses a single input reference
>>>>> clock pin on any given IPQ SoC, however its rate may be different on
>>>>> different IPQ SoC. For example, its rate is 48MHZ on IPQ9574 and 96MHZ
>>>>> on IPQ5018.
> 
> How many input pins are there on the hardware block? It makes sense that
> only one pin would be used in practice, but I'm wondering if there are
> multiple pins in general. Why is the field called CMN_PLL_REFCLK_INDEX
> if it's not picking the reference clk desired (i.e. the pin that is
> actually connected)?

We double confirmed with our HW design team today, there is only one
input PIN to CMN PLL hardware block which is always sourced from the
internal Wi-Fi hardware block.

Let me provide more details below on the function of this block, to
provide a clear picture of the clock functions involved.

Input clock
-----------
This input clock rate at the pin is usually 48 MHZ, but an input rate of
96 MHZ at this pin is also supported by the block. Below is a picture
showing how input clocks are used in CMNPLL.

48mhz(or 96mhz)--->IN-clk-pin--->IN-clk-divider->(final-IN-clk)-->
CMNPLL HW logic-->out-clks

As per the input reference clock at the pin, the divider value is
configured on it. The register field CMN_PLL_REFCLK_INDEX is only used
to configure the final input clock rate (after the divider is applied)
to the CMNPLL HW logic.

So in summary, there is only one input clock pin. The register field
name CMN_PLL_REFCLK_INDEX (from hardware register description) may be
confusing, but it is actually only used to indicate the final input
clock rate to the CMNPLL hardware logic. I will clarify this with
additional comments in the code.

Core clock
-----------
The CMNPLL hardware block runs at 12 GHZ clock. It is automatically
derived from the input clock and no configuration required.

Output clock
------------
The CMNPLL block generates the all the output clocks (For ex: the 353
MHZ clock to PPE) without any software configuration required. The
driver only configures the input clock rate as described above.

> 
>>>>>
>>>>> Your second suggestion seems more apt for this device. I can define the
>>>>> DT property 'assigned-clock-parents' to configure the clock parent of
>>>>> CMN PLL. The code for reference clock selection will be added in
>>>>> clk_ops::set_parent(). Please let us know if this approach is fine.
>>>>
>>>> What is the source of this clock? Can you call clk_get_rate() on this
>>>> input?
>>>>
>>>
>>> The source (parent clock) for CMN PLL is always from on-board Wi-Fi
>>> block for any given IPQ SoC.
>>>
>>>   From the discussion so far, it seems there are two approaches possible
>>> which I would like to summarize below to be clear. Please let us know
>>> if this understanding or approach needs correction. Thanks.
>>>
>>> 1. clk_get_rate() requires the parent clock instance to be acquired by
>>> devm_clk_get(). Per our understanding from Stephen's previous comment,
>>> it is preferred that a clock provider driver (this) does not use the
>>> _get_ APIs on the parent clock to get the rate. Instead the parent rate
>>> should be passed to the clk_ops using parent data.
> 
> struct clk_parent_data doesn't pass parent rate information to the
> clk_ops. I'd like you to not use any clk consumer APIs (clk.h) if
> possible.

OK.

> 
>> So the parent clock
>>> should be specified in the DT using assigned-clock-parents property, and
>>> can be accessed from the clk_ops::set_parent(). This seems like a more
>>> reasonable method.
> 
> Yes, this makes sense if the clk actually has multiple possible parents.
> Don't read the rate of the clk in the clk_ops::set_parent() callback
> though. The callback should only program the hardware to select the
> parent based on the index passed to the clk_op.

OK, understand. However it seems like set_parent() method may not be an
option since there is only one parent clock input pin.

> 
> If the clk only has one possible parent then it's different. I'd do it
> through clk_ops::set_rate() and use assigned-clock-rates or just let the
> first child clk of the PLL set the rate and configure the PLL by having
> the PLL's determine_rate() callback figure out if the parent rate is
> valid.

Given the description above on the input clock function and the fact
that there is a single parent clock, could you suggest whether the
clk_ops::set_rate()/'assigned-clock-rates' method can be used to
configure the input clock rate?

We also looked at the determine_rate() method suggested, and felt that
this may not be feasible for this hardware model. This is because there
are more than one possible input clock rates (48 MHZ and 96 MHZ), and
hence it would not be feasible to derive a required input clock rate
from the core clock rate (12 GHZ).

> 
> That register field with "index" makes me suspicious that this is a mux
> that we're trying to hide behind the parent rate. Quite possibly that's
> actually a hardware multiplier, i.e. l-val, and we need to set the index
> to pick which multiplier is used to achieve whatever frequency is
> desired for the PLL itself. I assume the 353MHz output clk is actually
> the one that is deciding what the index should be, and the other ones
> all fall out of the PLL somewhere else through a post-divider or
> something.

As described previously, there is only input clock pin with two possible
input clock rates (48 MHZ and 96 MHZ), and the index field only selects
the final input clock rate after applying the divider. There is no mux
function in the hardware.

The CMNPLL block generates the all the output clocks for a given SoC
without any software configuration required. The output clocks and their
rates are different on the different IPQ SoC. For example, the output
clock to PPE (Packet Process Engine hardware block) is 353 MHZ on
IPQ9574 and 200 MHZ on IPQ5332. The input clock rate of CMN PLL on
these two IPQ SoC is the same, but the internal logic of CMN PLL
which differs per SoC type ensures that the right output clocks are
generated for the given SoC. There is no provision or need for
multiplier configuration by software, to generate the output clocks.

> 
> What frequency does the PLL run at?

The CMN PLL core clock runs at 12 GHZ.

> 
>>
>> assigned-clock-parents is necessary if there are multiple possible
>> parents. As you wrote that there is just one possible parent, then
>> there is no need to use it.
>> Stephen, your opinion?
>>
>>> 2. Alternatively, if it is architecturally acceptable to use
>>> devm_clk_get() and clk_get_rate() in this clock provider driver, we can
>>> save this parent clock rate into a local driver data structure and then
>>> access it from clk_ops::init() for configuring the PLL.
>>
> 
> No, it isn't acceptable.


