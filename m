Return-Path: <linux-arm-msm+bounces-36681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BFA9B8BE8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 08:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8F5C1F2290B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 07:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CCA61509A5;
	Fri,  1 Nov 2024 07:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PN8b1S1t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4731514FB;
	Fri,  1 Nov 2024 07:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730445359; cv=none; b=oyIjsKW2rG3ydjZkNbSgsqLChT7X2WlTaWkvKpyk0A82oBRXWV2xift2fv1n2vovPFipm9GRw9u88yk6Yp6q4t0Ke7EA1aDCEe80deLPd88qg57TnF+1rJRDCvAT6eegmVt4nZWafJnm+ggWRoZAo+Xq17kfEU+xapHYbFgCl+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730445359; c=relaxed/simple;
	bh=3VOGJbXx4MAegdFQC/Y6Vr+EmoSscZ1ALddVseDSaGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Mzl8gpwi6P8kFJp1+t6xJbZEhhMRRhnBsB0dfzzp5asmHSHrUG2fbtVjiC0RMIIqbYSF6XQaXJUoGyaorkTgmS3EhvRGb+HyEhcDt9sYguCdHoIzr3/uq3xZ0ZUH77ZKCx2X5d4gXxWzeC9w1YlRiLk9bIEAiiF71hRMi/K5Nxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PN8b1S1t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A175Jje026701;
	Fri, 1 Nov 2024 07:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovhgDWrMf5z56w1aAHROlrv9Fuapjcb0MG42724dH+s=; b=PN8b1S1tVqhFnKeU
	KIuRzfWScZJjnAh0bArxZ3mqiVKpaNV500tJVd94regqI982al7cdJFwFj4swQBA
	aH65gCeaXITANmJRmxFSmB8G3Fa4fBYKNeWQOi98KoSZC2+cHHjsSytMXCFPzH9h
	aIG2F8cy8HZhfrR8k7Lhd+nbk+8BZfE48++0nrVZAxK2q0VOm+g9RaxoC/stEiBX
	sDdOcEy9xjyiYMIUztHfLEhA3yCpOQv4H+r5xziGew5WaNIh0Ci4urS+uCDQu+t8
	W/88b+MdDOVNTYQ3khmTJl/tgWJqoSD7ZUQ4CAxWJvLOBIisMSsmN7x8W1OqH+Hw
	7EV9sw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42k1p39gfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 07:15:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A17FGXl012862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 07:15:16 GMT
Received: from [10.216.44.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 1 Nov 2024
 00:15:10 -0700
Message-ID: <2ea32f2b-a765-420d-9cc7-f0d04d27ed6e@quicinc.com>
Date: Fri, 1 Nov 2024 12:45:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock
 controller driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhishek Sahu
	<absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-8-4cfb96d779ae@quicinc.com>
 <omn34rwurlxrjckb5d6xb2brg6zwcizonmqyfckvngk5msrfav@b3i2bdjk5vw7>
 <2aa768a4-b0e9-4b2f-8d74-736a88cf81cd@quicinc.com>
 <CAA8EJppZyJt_MWrafSKReuCXy0RtEAQ6VE-kt_Fp41eFpsW2SA@mail.gmail.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <CAA8EJppZyJt_MWrafSKReuCXy0RtEAQ6VE-kt_Fp41eFpsW2SA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uc-jdeAzzNGQkuQbTjeYeVb1f9QNB-N4
X-Proofpoint-ORIG-GUID: uc-jdeAzzNGQkuQbTjeYeVb1f9QNB-N4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 phishscore=0 clxscore=1015 impostorscore=0 mlxlogscore=670 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010050



On 10/31/2024 8:44 PM, Dmitry Baryshkov wrote:
> On Wed, 30 Oct 2024 at 20:04, Taniya Das <quic_tdas@quicinc.com> wrote:
>>
>>
>>
>> On 10/19/2024 1:58 AM, Dmitry Baryshkov wrote:
>>>> +static struct gdsc gx_gdsc = {
>>>> +    .gdscr = 0x100c,
>>>> +    .en_rest_wait_val = 0x2,
>>>> +    .en_few_wait_val = 0x2,
>>>> +    .clk_dis_wait_val = 0x2,
>>>> +    .pd = {
>>>> +            .name = "gx_gdsc",
>>> .power_on = gdsc_gx_do_nothing_enable ? Or is it controlled directly on
>>> this platform?
>>>
>>
>> On QCS615 the GPU clocks are directly controlled by high level OS.
> 
> Is it one of the gmu-wrapper platforms?
> 

Not, sure of the gmu-wrapper, but this platform does not have GMU.

>>
>>>> +    },
>>>> +    .pwrsts = PWRSTS_OFF_ON,
>>>> +    .flags = POLL_CFG_GDSCR,
>>>> +};
>>>> +
>>
>> --
>> Thanks & Regards,
>> Taniya Das.
> 
> 
> 

-- 
Thanks & Regards,
Taniya Das.

