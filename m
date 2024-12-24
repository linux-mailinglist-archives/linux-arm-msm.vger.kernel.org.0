Return-Path: <linux-arm-msm+bounces-43189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DACBA9FB99F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 07:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62085163F75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 06:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D032219FF;
	Tue, 24 Dec 2024 06:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mHI5ck+X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38627F9;
	Tue, 24 Dec 2024 06:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735020214; cv=none; b=UFk1/DFCyDKgmbPXCotMRvpyO2xAc6fn0ybFfnw86CXJeF+OEWiFCe0wxLLrmKXjpy6d2Naq2G/i6D32U1cFgnHyw1eb366Expx85rn88t2Jz7k5Wx6ZPBDBttuBjY9dKffTfSJpEkJTgvGpuWGyQ4LBHgLcYpmu9S7Q4zu+aIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735020214; c=relaxed/simple;
	bh=ZC5OMVyRtb4f2b89kS7akhSXW+vT65bzPsloqwKxkf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Vn3utZUT5mEGe7LgscOQY7owbzldyGPVRhX3KG5QyY0HY/dk4gPsp+1XIEcZF33K79FOc2Ch3vw0Mvl1NJQ0uy8QSbRZYaHkLhkk5/ZqY69p3J9zYDSvf5/YWUgu6iwK1W1Lk/dKRsyh456QggZa1xRR2D5iZH2cvmjqF5jfMMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mHI5ck+X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNJsFHF029564;
	Tue, 24 Dec 2024 06:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FXGwN3B4CatXIc79rUG8DB695XnToJE0LbzpQoCZtRo=; b=mHI5ck+X5Bh1CJfr
	i+B8jXvlNF7b5vHmjadu6oBDBTuqJOxmJHnOn6uUgDCujHP3qgDiFYwAXiR440bj
	/Kpj4d9jpcXxMRrVdC4PXstxAo8ouBhRQIneaqEWFyQJtH+TZh5OGF5dOcKH8z93
	yEmlykA9flL5F1O8MCDb0mOj3628oISq7nHUIeq9hTe3vaLkThVetmrqmWg7dG2J
	iJBnLW/uuIwBeqXOaZpFFXgxs9M+0lXR12xgtKCWr9F3sGDGkqw+MQEEHSorn/a8
	aPFwwb1BtSNXjItHjJA/149MhQUKcjyjOV8kTQERePBPDbjM8Y6DiJMQX/Np8HcJ
	71G+dg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qee0hd72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 06:03:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO633s2029146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 06:03:03 GMT
Received: from [10.253.36.144] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 22:02:57 -0800
Message-ID: <6cb92d11-eb5a-418b-ab9b-7c6be168fd06@quicinc.com>
Date: Tue, 24 Dec 2024 14:02:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add standalone ethernet MAC entries for qcs615
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David
 S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro
	<peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <t7q7szqjd475kao2bp6lzfrgbueq3niy5lonkfvbcotz5heepi@tqdiiwalhgtg>
 <c57a18aa-6606-4a3a-b508-8e335fda3e31@quicinc.com>
 <CAA8EJpoSUepFZgXHmozdPwWdtrjYiMa4bDsozuEr=tec1wj_Gw@mail.gmail.com>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <CAA8EJpoSUepFZgXHmozdPwWdtrjYiMa4bDsozuEr=tec1wj_Gw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nv834TXd3nvFwaEYRt9Ap8MwSHnDP0i2
X-Proofpoint-GUID: nv834TXd3nvFwaEYRt9Ap8MwSHnDP0i2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=741 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240047



On 2024-12-24 13:53, Dmitry Baryshkov wrote:
> On Tue, 24 Dec 2024 at 07:47, Yijie Yang <quic_yijiyang@quicinc.com> wrote:
>>
>>
>>
>> On 2024-12-24 12:16, Dmitry Baryshkov wrote:
>>> On Tue, Dec 24, 2024 at 11:07:00AM +0800, Yijie Yang wrote:
>>>> Add separate EMAC entries for qcs615 since its core version is 2.3.1,
>>>> compared to sm8150's 2.1.2.
>>>>
>>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>>> ---
>>>> Changes in v2:
>>>> - Update the subject for the first patch.
>>>> - Link to v1: https://lore.kernel.org/r/20241118-schema-v1-0-11b7c1583c0c@quicinc.com
>>>>
>>>> ---
>>>> Yijie Yang (3):
>>>>         dt-bindings: net: qcom,ethqos: Drop fallback compatible for qcom,qcs615-ethqos
>>>>         dt-bindings: net: snps,dwmac: add description for qcs615
>>>>         net: stmmac: dwmac-qcom-ethqos: add support for EMAC on qcs615 platforms
>>>>
>>>>    Documentation/devicetree/bindings/net/qcom,ethqos.yaml  |  5 +----
>>>>    Documentation/devicetree/bindings/net/snps,dwmac.yaml   |  2 ++
>>>>    drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
>>>>    3 files changed, 20 insertions(+), 4 deletions(-)
>>>> ---
>>>> base-commit: 3664e6c4f4d07fa51834cd59d94b42b7f803e79b
>>>
>>> Which commit is it? I can't find it in linux-next
>>
>> It's a tag next-20241108, titled 'Add linux-next specific files for
>> 20241108'.
> 
> Nearly two months old? okay...

I will provide an update in the next version.

> 

-- 
Best Regards,
Yijie


