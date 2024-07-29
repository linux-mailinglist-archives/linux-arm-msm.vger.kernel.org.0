Return-Path: <linux-arm-msm+bounces-27204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CE593F1FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 11:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D4831C22047
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 09:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68115143C75;
	Mon, 29 Jul 2024 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kWFAOmBv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53D71411ED;
	Mon, 29 Jul 2024 09:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722247052; cv=none; b=enemK1StwRm4pujhPDQs46LnjiAN08WvKc1KmT8/diCQBCGJISmr0Q9m0ldNtYCFFxLjtZ5HCvoYLt/+YdJ4zd5daBN3SDrHfBuMs2+MRE5tLuLm/YSaWcbmqBIyTH3Ae3Qr3FSaHiAarneONogRGUKQPgcCa4EuRuJZbU9YqtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722247052; c=relaxed/simple;
	bh=ztYrwpacxWiPS2yg7T73hvjh4wD/yiGPVElVrJwSJzI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=mRRPHPsC9lK1ORQ7IasWU2IUBElVf0Hoc3lr1Mi8rdL7w3Li6arCqLmxQSGIasFYRaub0++Y1i+tuUj35KUhcQ2aaF6e/2+NchHT1bAJ6Pu4RsXjhi7sast6deJvx4ZX0eo5s5qfCXkKpAT+bWa9otbHgetOEfGLp85BcdXvz1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kWFAOmBv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SNndK8017295;
	Mon, 29 Jul 2024 09:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PIO7uXgATEkDVyJhFRXvr5mGGtrsj39Fi6YG5UR0wNY=; b=kWFAOmBvlut90orI
	3S/zdEDvJalMfuFLLn+9I9t0tHeGlCDpOqHkmk0bHd+35CdXD+xqJoOTWD0tgmIW
	uHMIu+JRTo9qzLN+abL+hHFqfbBcQ95QbUQDhQL1LcJo4D51trYH/mrTN5zC4fgu
	xrweGup5wvWP6YyoE3f4+OMApk7QuEb4UNJ1GJYH7+xYerIX0ispuooTuFqYaQRY
	bbZKciS36k9GJRhc77h25P0gpXX5COHWvtZae3Q1OA78+HS8wKx7uIF8CHGHGgEw
	B0WF44T2UWU7SW9jDa2J9NNpIjiNx88LJxrQAb6BiTv8XHfjNlxo9NJgEovC8BRc
	2gkcpw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mrytupug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 09:57:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46T9v5L2005132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 09:57:05 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 02:56:58 -0700
Message-ID: <f57d80bd-b40c-44fe-b5ae-9b9eaac643e4@quicinc.com>
Date: Mon, 29 Jul 2024 17:56:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] net: stmmac: dwmac-qcom-ethqos: Add QCS9100 ethqos
 compatible
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: Simon Horman <horms@kernel.org>
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
 <20240709174212.GM346094@kernel.org>
 <c07b8f08-a8ce-427b-81f1-4f5399913fc1@quicinc.com>
In-Reply-To: <c07b8f08-a8ce-427b-81f1-4f5399913fc1@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oXa4W9EY5A_pLVXhNvOzUbebPAqAlBQb
X-Proofpoint-GUID: oXa4W9EY5A_pLVXhNvOzUbebPAqAlBQb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_08,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290067



On 7/10/2024 3:27 PM, Tengfei Fan wrote:
> 
> 
> On 7/10/2024 1:42 AM, Simon Horman wrote:
>> On Tue, Jul 09, 2024 at 10:13:16PM +0800, Tengfei Fan wrote:
>>> Introduce support for the QCS9100 SoC device tree (DTSI) and the
>>> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
>>> While the QCS9100 platform is still in the early design stage, the
>>> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
>>> mounts the QCS9100 SoC instead of the SA8775p SoC.
>>>
>>> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
>>> all the compatible strings will be updated from "SA8775p" to "QCS9100".
>>> The QCS9100 device tree patches will be pushed after all the device tree
>>> bindings and device driver patches are reviewed.
>>>
>>> The final dtsi will like:
>>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/
>>>
>>> The detailed cover letter reference:
>>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
>>>
>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>> ---
>>> Changes in v2:
>>>    - Split huge patch series into different patch series according to
>>>      subsytems
>>>    - Update patch commit message
>>>
>>> prevous disscussion here:
>>> [1] v1: 
>>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
>>>
>>> ---
>>> Tengfei Fan (2):
>>>        dt-bindings: net: qcom,ethqos: add description for qcs9100
>>>        net: stmmac: dwmac-qcom-ethqos: add support for emac4 on 
>>> qcs9100 platforms
>>>
>>>   Documentation/devicetree/bindings/net/qcom,ethqos.yaml  | 1 +
>>>   Documentation/devicetree/bindings/net/snps,dwmac.yaml   | 2 ++
>>>   drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
>>>   3 files changed, 4 insertions(+)
>>> ---
>>> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
>>
>> I'm assuming that this is a patch for net-next.
>> But the commit above is not present in net-next,
>> and this series doesn't apply to net-next.
>>
>> Please rebase when preparing v3.
>> And please designate the target tree in the subject.
>>
>>     Subject: [PATCH net-next v3] ...
>>
>> Thanks!
> 
> I willmake the correspinding modifications according to your suggestion 
> in the V3 patch series.

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Let's close this session and ignore all the current patches here.
Thank you for your input.

> 

-- 
Thx and BRs,
Tengfei Fan

