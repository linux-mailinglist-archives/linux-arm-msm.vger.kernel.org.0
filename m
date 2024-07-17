Return-Path: <linux-arm-msm+bounces-26459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B53933BDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 13:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B029C1F242CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 11:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E846317F398;
	Wed, 17 Jul 2024 11:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L2X6NBvo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658AC433AB;
	Wed, 17 Jul 2024 11:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721214564; cv=none; b=lsTbtTm2STQ9X+OHP86D/sBp8PYRejbebQvaz65YRmDvoCtGPE6elDqa4YrsopwCmt7QdL05Do4J/YixGwH6KMPjzXAHjMGoTpxAlYcH5nG2cG5JL+xC6Je3i1f/0KrEXlv6aPH4BEOpEhN8K8gTdTwKm2poMUuqPKsMudxqz6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721214564; c=relaxed/simple;
	bh=FSbWIXHB9Zk0Ie4hV6sZMAyhTwetU0kPZD4So7/XoSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OJDoF6TWhpFZYjXvp89o26a/pLeYM2bIVUsD2n8IdITDBi1ymJzclQC7mRzUp0r8LQoYkcBkjRQXSk8Ipc9xMf9d8HbNazDK0vuvjCHGGETaCaFR/vuAuAAFCTa43bDRTaV6uAQU4x89fFQEucfJ3V2Y/qsQP31DBjmHxFtWpkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L2X6NBvo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46H70t7H031984;
	Wed, 17 Jul 2024 11:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4EVCHZ5xE0SMUtc/klFWgbFGZ8Pt1Q6yw5r9zCzdFC8=; b=L2X6NBvom4EPFIaD
	agzvK2eGfihO6cgSy/uq7gO0O4D5shVh6OeIejrK6ZDXv4gZRQ5rlEmtvEutwGOo
	NbFRQ8N0ZNQ+/lvDvjO4DV6s4TvyXUEhHLH8ro/MOuitnxVgFUY7QgTed+CGh6w1
	OAVy01HNrkvySoBInvDbd8AugJTi8ZO83z0y03fps/YmB4G8b9PARiJ8gCTr7If6
	Z4yMtfVXX54pMGaqyvGf8G6XMgEI/RUHrdzsIZX+SxWhv6qMUdtAROzWqq77sbBt
	6lzANCtbkAktoGlvDQVM3efsuNdJV94dXLD2r39KvnudgpDZ+OP4+fV0xsAJH+0v
	e8+40Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfs242f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 11:08:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46HB8rHK031983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 11:08:53 GMT
Received: from [10.218.19.46] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Jul
 2024 04:08:46 -0700
Message-ID: <b6aefcee-808c-77cd-7632-52ab21a14a54@quicinc.com>
Date: Wed, 17 Jul 2024 16:38:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 5/6] clk: qcom: Add camera clock controller driver for
 SM8150
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
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
        Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
 <20240702-camcc-support-sm8150-v2-5-4baf54ec7333@quicinc.com>
 <xbe7kmaxhfwy26qzxrmwgiijaaiap4kdkruaxjs6ymihaw5taf@hvj57wyncfea>
 <cc1957af-17bc-cd71-e6da-013e3a740014@quicinc.com>
 <CAA8EJpqmJZJfd2famarx-FKFb1_+-nZM3N+FwK_hiOurG8n9=A@mail.gmail.com>
 <f4072105-e0e2-46c8-82ed-92105b43a345@linaro.org>
 <6124f9e9-3fdf-29b1-128f-c58f5ebe1424@quicinc.com>
 <7fcc309e-f1c9-4693-a2d1-76df85021dff@linaro.org>
From: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
In-Reply-To: <7fcc309e-f1c9-4693-a2d1-76df85021dff@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Td_8iWVgCZSbdibr1qBp4yCOfwUBrQld
X-Proofpoint-GUID: Td_8iWVgCZSbdibr1qBp4yCOfwUBrQld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_06,2024-07-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407170086


On 7/17/2024 4:23 PM, Bryan O'Donoghue wrote:
> On 15/07/2024 11:36, Satya Priya Kakitapalli (Temp) wrote:
>> This clock is PoR ON clock and expected to be always enabled from HW 
>> perspective, we are just re-ensuring it is ON from probe. Modelling 
>> this clock is unnecessary, and we have been following this approach 
>> for  gdsc clock in all the recent chipsets, like for example sm8550 
>> camcc.
>
> Having a difficult time following the logic
>
> - Re-enabling an already enabled always-on clock is necessary


There is no hard requirement to enable it again , but to be on safe side 
incase bootloaders disabled this clock, we are enabling it again in probe.


> - Modelling the always-on clock in the CCF to park it at XO is
>   unnecessary
>

Modelling the clock will cause the CCF to disable the clock in late 
init. I have tested on SM8150 by modelling the gdsc clock now and I see 
it is getting disabled in late init.


Parking the parent clock(rcg) at XO, doesn't ensure the branch clock to 
be ON. If CCF disables the clock it gets disabled.


> I think that's a pretty vague argument to be honest.
>
> ---
> bod

