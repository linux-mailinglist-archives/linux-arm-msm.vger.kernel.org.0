Return-Path: <linux-arm-msm+bounces-26281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0389F932200
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 10:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47C27B21CA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 08:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF4417B4E9;
	Tue, 16 Jul 2024 08:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I8vBcSIy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B6913CF8E;
	Tue, 16 Jul 2024 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721119166; cv=none; b=n8FeUaSZS74tu11kYtf9TXWq++Seb75ymNXSG6UtqdcnDHW9laLL6qeelf/U3j8mBk5Z7BCjebyL3HEIgvpJKSTlQKq1M9IGq7wzx1LORR+B7ns85ZT53UIMZFUzv+xcbG948Ub51b4COLPksm49oQY8k3qjdq6IQ00UwDsSQjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721119166; c=relaxed/simple;
	bh=pnBIBVWhf5BT7kXBetHfhRVjUopJwG8oDLrBX4fP/vU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S4RqWo9beYfTAv5Z0z3m60S2RTU/eZCsof+Dlp009pC06yHwvS/U/nouKcVtBAtCNQu05rVuoaR9w4m6WvEiGROj9H49NZ8msmSnudffqOyu119k3lMzmQQ/iXhwnHZOpa0277ieTkmTs2gk7LQhoSdXdfdvJyNX/PK1LAt7wso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I8vBcSIy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46G4XQPm031357;
	Tue, 16 Jul 2024 08:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EeHaRWYXiK3/lLN0S5rke1NcA+FU45aTCk2uQSql5dI=; b=I8vBcSIy1sFRlY4L
	Us32aFsxGOXp6B68Wafh7n7lb7D+ySERR0ngeiSZO04vrmV5TAsGy99ZCwLCCATq
	K15IMbFNUo9HrUZc7z+Cf3pb1xOEgnLCxyRiZmnmCo0KNDGtm71Dh3Hptw1CAahP
	t0uSv+NtI0+LOiyKC2fSt5Ff3O6euqT5Sr4F0CxqU5JqHgI8HcSz2A9vWVAXR8p8
	2CPm3lSEbCm/MQ0sRw/98j34VC0gG6YpUpf8RBONqauZS+iiMv5rOpxhKKS2FWJX
	ao8UkmBy2kiRdDY9UvgWy8g5OKillyqZ7WVapjAuL3wqyLam0xx8GVM32F8zGzWF
	5i/tbg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bgwg6few-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 08:39:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46G8dIk1022098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 08:39:18 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 01:39:13 -0700
Message-ID: <dd8ad439-f74c-4bb6-9066-73394bb9befe@quicinc.com>
Date: Tue, 16 Jul 2024 14:09:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sm4450: add camera, display and
 gpu clock controller
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul
	<vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Satya
 Priya Kakitapalli" <quic_skakitap@quicinc.com>
References: <20240611133752.2192401-1-quic_ajipan@quicinc.com>
 <20240611133752.2192401-9-quic_ajipan@quicinc.com>
 <76f5e3c7-a90b-42d2-8169-e5e2211a14a1@linaro.org>
 <ba7d12d3-c582-45ec-beed-e81182fe3252@quicinc.com>
 <95a835e2-9fd9-467b-bd0a-8eeb80ddf678@linaro.org>
 <9c3de930-47b7-45a9-bf7e-6e506ea2accc@quicinc.com>
 <8f7cdb31-c50d-4690-b878-518bad545612@linaro.org>
 <46e6f1f0-d244-4e53-99ce-9fee339dc4de@quicinc.com>
 <f9a23663-7a1d-44dc-8e0b-8463c3c88a29@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <f9a23663-7a1d-44dc-8e0b-8463c3c88a29@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WkTPEf-BUhFJZI68eqwGh_Cp_RhYmNsp
X-Proofpoint-ORIG-GUID: WkTPEf-BUhFJZI68eqwGh_Cp_RhYmNsp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1011 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407160063



On 7/12/2024 6:10 PM, Konrad Dybcio wrote:
> On 12.07.2024 2:31 PM, Ajit Pandey wrote:
>>
>>
>> On 7/12/2024 5:52 PM, Konrad Dybcio wrote:
>>> On 12.07.2024 11:53 AM, Ajit Pandey wrote:
>>>>
>>>>
>>>> On 7/11/2024 3:25 PM, Konrad Dybcio wrote:
>>>>> On 3.07.2024 11:16 AM, Ajit Pandey wrote:
>>>>>>
>>>>>>
>>>>>> On 6/13/2024 1:11 PM, Konrad Dybcio wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 6/11/24 15:37, Ajit Pandey wrote:
>>>>>>>> Add device node for camera, display and graphics clock controller on
>>>>>>>> Qualcomm SM4450 platform.
>>>>>>>>
>>>>>>>> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
>>>>>>>> ---
>>>>>>>
>>>>>>> None of these nodes reference a power domain (which would usually be
>>>>>>> CX/MX/MMCX). This way, the RPMhPDs will never be scaled.
>>>>>>>
>>>>>>> The current upstream implementation only allows one power domain to be
>>>>>>> scaled, but that's better than none (see other DTs for recent SoCs).
>>>>>>>
>>>>>>> Konrad
>>>>>>
>>>>>> SM4450 doesn't support MMCX and CX/MX domains will remain active so
>>>>>> power-domains property is actually not required for SM4450 clock nodes.
>>>>>
>>>>> It's not only about them being active.. some PLLs require e.g. MX to be
>>>>> at a certain level, or the system will be unstable
>>>>>
>>>>> Konrad
>>>>
>>>> With active I mean CX/MX rails will be default running at minimum level required for clock controllers. Adding power-domains property for CX/MX rails is like a redundant code as that will also scale such rails at default specified minimum level only. Also we hadn't added such property for other targets DT nodes to scale up CX/MX at minimum level.
>>>
>>> What I mean here is that, the minimum level may not be enough. In such case
>>> you would also add a required-opps = <&handle_to_rpmhpd_opp_level>
>>>
>>> Konrad
>>>
>>
>> Apologies, but could you please elaborate the use-case where minimum level isn't enough ? I guess for clock controllers configuration min level of CX/MX would be suffice, client will anyhow scale such rails to higher levels depending on their use-case.
> 
> The main issue here is with PLLs within the clock controllers. Nobody
> votes for them. It's an unsolved problem and we currently work around
> cases where it's necessary by requiring that (with runtime pm, so when
> there's active consumers of the clock controller) the attached power
> domain is at >= SOME_LEVEL
> 
> Konrad

Konrad, this target (SM4450) have all the PLLs connected to CX/MX(again 
this is not collapsible). At boot the RPMHPD driver would keep the rails 
at minimum level and which is good to operate for the clock controller. 
I do not see currently this requirement you pose here specifically for 
SM4450.

As part of the PLL requirement within clock controller, this is 
definitely a requirement which we plan to RFC soon. There are 
discussions already in progress on how to handle this requirement.

-- 
Thanks & Regards,
Taniya Das.

