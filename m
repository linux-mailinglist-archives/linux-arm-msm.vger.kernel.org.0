Return-Path: <linux-arm-msm+bounces-26143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9BC931231
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 12:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFB601C22546
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 10:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC80187553;
	Mon, 15 Jul 2024 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Re/uVVtL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9B818735C;
	Mon, 15 Jul 2024 10:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721039019; cv=none; b=awGOA650xB44e68o73cJyZVFCAxMglAdy/PGJvqFnglXS//dT0gjkI/1G64ov1MAkpYMKsYYxmVTpC4nBLktO1F8raEodWfcgqaahcFVhNV3qaD7pfdEmuadne2SgiN5S7uqv6WB4Ar4h/CO2u6gAFS8mDqK2CtHYm7VWolw6l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721039019; c=relaxed/simple;
	bh=qQQW60sjapLz/YaRqlnPupUF8fBVH0c+3KCxXriXV6s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=d13EdaeKA6I3ncWiKYirUOwjK8RyVdTXsuvsDlxrGCL5FcVD3o3QjYmKE6uXaV23jo1cWJ3eeTuuxVIDWUgf9couKOSMT4tJu1IwNdFyzrxfzBTFqxhi8+vE5eiEUXsGOTLTpEgNZ1jI10djGVbxXr4dCu+JV1qKaNdocYbQBu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Re/uVVtL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46F2dErR003170;
	Mon, 15 Jul 2024 10:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/EKdWAxwi8X/z7x3RZyNHctleqpG36KK6n8CH6XjAKc=; b=Re/uVVtLEZrCqBfd
	6tL8Lk0uLS9hrPxAy2Gohtby0Pmy9+HOR5uNCOT7mPQOX8Sy9scP5UTbl65lde9p
	o1t7JgkTqEhD/nQRlm01+VVB9KfsMmw2CEW2fi4ygY4yIdHoJJzor/r8eEBoJ/5V
	qT9Grjj7TBY26dNj6kEUgXNQzKcfIRXHbrwTOaQPBQd35FprzQKdJz+bW94bEkUd
	gYeWUi8sS0v3HRisUZ/T3mhkDJTmtq50yYOdZsmnCe6wtdIwX1iZ4IkIoqCyWnqP
	vMeIlo0hKz6s34dEaYIcrpaY8KIesq3j/AfEoanx2lyp9PQb9IqEFzA2H/IGO86r
	0cbcxQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bhy6un3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 10:23:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46FAN4tH010797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 10:23:04 GMT
Received: from [10.216.4.154] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 15 Jul
 2024 03:22:57 -0700
Message-ID: <e235f19f-26b5-2cf7-ebb7-36e4dabe9b9b@quicinc.com>
Date: Mon, 15 Jul 2024 15:52:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
Subject: Re: [PATCH v2 5/6] clk: qcom: Add camera clock controller driver for
 SM8150
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
 <20240702-camcc-support-sm8150-v2-5-4baf54ec7333@quicinc.com>
 <xbe7kmaxhfwy26qzxrmwgiijaaiap4kdkruaxjs6ymihaw5taf@hvj57wyncfea>
 <cc1957af-17bc-cd71-e6da-013e3a740014@quicinc.com>
 <CAA8EJpqmJZJfd2famarx-FKFb1_+-nZM3N+FwK_hiOurG8n9=A@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAA8EJpqmJZJfd2famarx-FKFb1_+-nZM3N+FwK_hiOurG8n9=A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PIfqfjWbiZmZWdZfWtX92pJi-W229tWh
X-Proofpoint-ORIG-GUID: PIfqfjWbiZmZWdZfWtX92pJi-W229tWh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_06,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407150081


On 7/11/2024 3:40 AM, Dmitry Baryshkov wrote:
> On Tue, 9 Jul 2024 at 13:53, Satya Priya Kakitapalli (Temp)
> <quic_skakitap@quicinc.com>  wrote:
>> On 7/3/2024 3:50 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 02, 2024 at 09:20:43PM GMT, Satya Priya Kakitapalli wrote:
>>>> Add support for the camera clock controller for camera clients
>>>> to be able to request for camcc clocks on SM8150 platform.
>>>>
>>>> Reviewed-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>>>> Signed-off-by: Satya Priya Kakitapalli<quic_skakitap@quicinc.com>
>>>> ---
>>>>    drivers/clk/qcom/Kconfig        |    9 +
>>>>    drivers/clk/qcom/Makefile       |    1 +
>>>>    drivers/clk/qcom/camcc-sm8150.c | 2159 +++++++++++++++++++++++++++++++++++++++
>>>>    3 files changed, 2169 insertions(+)
>>> The patch mostly LGTM, several quesitons:
>>>
>>> - There are no cam_cc_sleep_clk and no cam_cc_xo_clk_src. Why?
>> These are not required for camcc sm8150 hence not modelled.
>>
>>
>>> - Why is cam_cc_gdsc_clk not modelled in the clock framework?
>> This clock is kept enabled from probe, hence not required to be modelled
>> explicitly.
> Yes, I'm asking why it's kept up enabled from probe rather than via
> clock framework?


>>> - I see that most if not all RCG clocks use rcg2_shared ops instead of
>>>     using simple rcg2 ops, could you please clarify that?
>> As per the HW design recommendation, RCG needs to be parked at a safe
>> clock source(XO) in the disable path, shared_ops is used to achieve the
>> same.
> Does it apply to SM8150? For example, on SM8250 RCG2s are not parked.


Yes, it applies to SM8150.


>>> - RETAIN_FF_ENABLE has been used for GDSCs for sc7280, sc8280xp, sm8550,
>>>     sm8650 and x1e8 platforms. Should it really be set for sm8150? If so,
>>>     should it also be added to other camcc drivers (if so, for which
>>>     platforms)?
>> I have rechecked this in downstream and seems it is not really needed
>> for sm8150, I'll drop in next post.
>>

