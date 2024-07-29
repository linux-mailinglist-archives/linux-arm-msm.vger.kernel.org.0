Return-Path: <linux-arm-msm+bounces-27205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DC793F20A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 11:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33251B23DF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 09:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE67F1422C5;
	Mon, 29 Jul 2024 09:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MiyJMD6b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368431420DF;
	Mon, 29 Jul 2024 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722247182; cv=none; b=PWYI2oY3cuNWE7FyAjoLnuXfaqOBoOpW5lOWrXFP1mG5DTHadFPKOP8ukzOk/m1mSIKeJQULjd5kpHQSQGZnamE3T6cPq6QtINXDwEoE85rHVCjal2TU/E8BwUQ1VIqaNHDpiJynJHJz8mfrWnTr8HSaanq8VcXEzCiZ3YyWdxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722247182; c=relaxed/simple;
	bh=oe1MOzjuu98mXrUitH3/+P6HUSy1QoquMaXjlC8/uE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FhpmR/Zt/z1/xVi+/0Mje5CSkEj/fWp+2IA8fmIOpEHnbEi3jRMro33TsV7A38rCioktjsxRedz8uKzIRLfBDENhaurXpMIbT7XVGfeAbPqUYLQLlm+/WZ7GOteRbAzdakYKQiX6wQcZeglSF7WPJ/7TMNvtw5Cskbp98H/3RhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MiyJMD6b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SNSA5E028280;
	Mon, 29 Jul 2024 09:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jn/ndyTvf0kOdUixeJpH94BnqY/XdOCcD8ZSzMoCtxM=; b=MiyJMD6bRn9+Lk5f
	TaK+1OokRb7cT9QUvko2mrnqAOcozT/RbBkQz2rLRxb6+S7uLoGl6HsWPHkNVbRP
	EJGgycuuScujngMJ0hkL//75IFMzRnbr2XJdhugnAqoZEBDzzYd7GaJR43+NgpTW
	Sm/oPIape+LPTLafIYgPujxOzYwag/JeSgh0gInw5rur+AToLpzHSss9nIgn2FYm
	LCEJ/yzBT8vPSzBXzo3tX5urPN7WHAZ2UCyuqySJFOGIVuXaBkEaPUQfwBBUPchA
	if9fwjyg6nZD8SV8bgJoWs2MO/gVlphtwsQyKInjRotCPXYZQgtvmjwFYESzD+Ry
	n/w6/Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms96krfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 09:59:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46T9xD4c031250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 09:59:13 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 02:59:06 -0700
Message-ID: <f3a7f3ba-c7c8-48d8-89d6-45d454d77183@quicinc.com>
Date: Mon, 29 Jul 2024 17:59:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] net: stmmac: dwmac-qcom-ethqos: add support for
 emac4 on qcs9100 platforms
To: "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>,
        Andrew Lunn
	<andrew@lunn.ch>, Andrew Halaney <ahalaney@redhat.com>
CC: Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh
 Sharma <bhupesh.sharma@linaro.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <kernel@quicinc.com>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>
 <20240709-add_qcs9100_ethqos_compatible-v2-2-ba22d1a970ff@quicinc.com>
 <g7htltug74hz2iyosyn3rbo6wk3zu54ojooshjfkblcivvihv2@vj5vm2nbcw7x>
 <2427a6fe-834c-432c-8e5a-4981354645d2@lunn.ch>
 <5884288e-48ad-476c-b325-bce51c06720f@quicinc.com>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <5884288e-48ad-476c-b325-bce51c06720f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3i6D5iuq3FFiU0zhV5LJaJldyrWnfwtO
X-Proofpoint-GUID: 3i6D5iuq3FFiU0zhV5LJaJldyrWnfwtO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_08,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290067



On 7/10/2024 11:02 AM, Aiqun Yu (Maria) wrote:
> 
> 
> On 7/9/2024 11:33 PM, Andrew Lunn wrote:
>> On Tue, Jul 09, 2024 at 09:40:55AM -0500, Andrew Halaney wrote:
>>> These patches are for netdev, so you need to follow the netdev
>>> rules, i.e. the subject should be have [PATCH net-next] in it, etc as
>>> documented over here:
>>>
>>>      https://docs.kernel.org/process/maintainer-netdev.html#tl-dr
>>>
>>> On Tue, Jul 09, 2024 at 10:13:18PM GMT, Tengfei Fan wrote:
>>>> QCS9100 uses EMAC version 4, add the relevant defines, rename the
>>>> has_emac3 switch to has_emac_ge_3 (has emac greater-or-equal than 3)
>>>> and add the new compatible.
>>>
>>> This blurb isn't capturing what's done in this change, please make it
>>> reflect the patch.
>>
>> Hi Tengfei
>>
>> If i remember correctly, there was a similar comment made to one of
>> the patches in the huge v1 series.
>>
>> The commit messages are very important, just as important as the code
>> itself. Please review them all and fixup issues like this before you
>> repost.
> 
> Thx Andrew L for the info.
>>
>>      Andrew
>>
>> ---
>> pw-bot: cr
> 

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Let's close this session and ignore all the current patches here.
Thank you for your input.

-- 
Thx and BRs,
Tengfei Fan

