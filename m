Return-Path: <linux-arm-msm+bounces-42923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F019F8CE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 07:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E2D2164528
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 06:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DA618A6B8;
	Fri, 20 Dec 2024 06:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H0ieImpB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D1325765;
	Fri, 20 Dec 2024 06:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734677049; cv=none; b=iC/ysxAZ2V6yiHpARK7O3qKOXCh/bj+J14eqzBtI7FeflzLXUHlnHwp7xsyCojubJsfNZ74oanlb/AJx0Bhx5Yfw0GPvDZW36FbuRqc6cmeOHZsmIcIp3F1vvcVydPgGcA6wzOvdP/vPqUXZHLFbDkjsftYFwG0IuWAMhy1AEVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734677049; c=relaxed/simple;
	bh=+XZqY7Czl0Dc6v9pigdmhhDRlR9SmSMlfzTPM4Q/yyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=do6MVBLB3rreaJbfs3bUvJkuMZVWfvN5EHoi9KFTY1MsE0HuSfKb4kOcHYB7KmZ1q9Et+NLVa+PVS4tWlriWlsxnEQWE8nzrrzort9yiwxqcAh2hkKTTZU9KAdmy2rRCZMI52wb6FPN/JQRllr5hOsoJaPe2hr93hVZQw0lun7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H0ieImpB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK5ejHP005092;
	Fri, 20 Dec 2024 06:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vtFBXkqVj1dep+GtPPs1kNMNrl/cJ0RdGXwT5VL7VeI=; b=H0ieImpBVKhwGwlr
	GrJQn4qi67a3vmu3h70DL3iFW75tAsTqZuevLEjpdZsiWPkF68GDtVMmjY0oaG47
	pFZxrwhGRR/QKm0w8KFaBDjYq7oiKYV7gX8chi2XYoMUtzohwaHI+/yKWYznKGHw
	1RRCByuniB78qXODFuvo/WwEQM3z45KgW3w2j3BjsCltGLPrW8Bo23RDywCz2foA
	eEBVMmvSqPbyD78imfWyofVcMv3q/hTI8O4ffeI/NYthUNotzHhC/KH9JOOjno3D
	ne0dAf0++qVrXmDTM8g2tisGdTnhvhgpaPSl3P5eyC9WI97BCogREurZGvG6pOch
	kekHIA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n2n5r4t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 06:43:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK6hwhd022279
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 06:43:58 GMT
Received: from [10.253.34.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Dec
 2024 22:43:54 -0800
Message-ID: <f6930a4c-6d31-4cd9-a9ba-d6ff50e274e2@quicinc.com>
Date: Fri, 20 Dec 2024 14:43:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: Update IPQ9574 xo_board_clk to
 use fixed factor clock
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>
References: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
 <20241107-qcom_ipq_cmnpll-v6-5-a5cfe09de485@quicinc.com>
 <0776a26e-56cd-4838-9b52-210ae9a1f281@oss.qualcomm.com>
 <8063460d-18ad-4e54-8232-716bad9d37c3@quicinc.com>
 <2456ab36-f48e-4aa3-88e1-aeb7895c9816@quicinc.com>
 <fb9d117e-77bd-4a01-a738-f72d07f6b84c@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <fb9d117e-77bd-4a01-a738-f72d07f6b84c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gY6dZNpW44EhaxGfjAfgtSKNPqoRNL7Y
X-Proofpoint-GUID: gY6dZNpW44EhaxGfjAfgtSKNPqoRNL7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200055



On 12/20/2024 5:28 AM, Konrad Dybcio wrote:
> On 18.12.2024 12:17 PM, Jie Luo wrote:
>>
>>
>> On 12/13/2024 6:30 PM, Jie Luo wrote:
>>>
>>>
>>> On 12/13/2024 2:33 AM, Konrad Dybcio wrote:
>>>> On 7.11.2024 10:50 AM, Luo Jie wrote:
>>>>> xo_board_clk is fixed to 24 MHZ, which is routed from WiFi output clock
>>>>> 48 MHZ (also being the reference clock of CMN PLL) divided 2 by analog
>>>>> block routing channel.
>>>>>
>>>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 7 ++++++-
>>>>>    arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 3 ++-
>>>>>    2 files changed, 8 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/ arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>>> index 78f6a2e053d5..9a8692377176 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>>>>> @@ -174,8 +174,13 @@ &ref_48mhz_clk {
>>>>>        clock-mult = <1>;
>>>>>    };
>>>>> +/*
>>>>> + * The frequency of xo_board_clk is fixed to 24 MHZ, which is routed
>>>>> + * from WiFi output clock 48 MHZ divided by 2.
>>>>> + */
>>>>>    &xo_board_clk {
>>>>> -    clock-frequency = <24000000>;
>>>>> +    clock-div = <2>;
>>>>> +    clock-mult = <1>;
>>>>>    };
>>>>>    &xo_clk {
>>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/ dts/qcom/ipq9574.dtsi
>>>>> index 8246a00a3e3e..25aed33e9358 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>>>> @@ -32,7 +32,8 @@ sleep_clk: sleep-clk {
>>>>>            };
>>>>>            xo_board_clk: xo-board-clk {
>>>>> -            compatible = "fixed-clock";
>>>>> +            compatible = "fixed-factor-clock";
>>>>> +            clocks = <&ref_48mhz_clk>;
>>>>
>>>> This must be squashed with the previous patch, you can't introduce
>>>> code and replace it immediately afterwards.
>>>>
>>>> Konrad
>>
>> Hi Konrad,
>>
>> Looking at this comment again, there may have been some
>> misunderstanding. We are not introducing xo_board_clk in patch 4 of this
>> series. xo_board_clk is a pre-existing node.
>>
>> As part of this additional patch 5, we wanted to address Dmitry's
>> comment earlier in v5 (reference to comment below), by converting the
>> xo_board_clk as well to a fixed-factor clock. So it is better to keep
>> this change as a separate patch in my view. Hope this is OK.
> 
> Oh okay..
> 
> What's the difference between xo_board_clk and xo_clk then, if the
> divider is accounted for in xo_board_clk?
> 
> Konrad

Here is the clock chain for the relationship between the clocks:
xo_clk (48 MHZ or 96 MHZ)-->WiFi (mul/div)--> 48 MHZ-->CMN PLL
				               |
					       +-->fixed factor(div by 2) --> xo_board_clk (24 MHZ)

So there are two dividers (fixed factor clocks): first for generating
the 48 MHZ clock (ref-48mhz-clk) from the fixed clock source 'xo_clk',
and a second for generating the 24 MHZ 'xo_board_clk' from the 48 MHZ
ref clock.

