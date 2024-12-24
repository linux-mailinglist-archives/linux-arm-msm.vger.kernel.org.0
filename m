Return-Path: <linux-arm-msm+bounces-43187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC369FB98D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 06:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BE2E163785
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 05:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E221487D1;
	Tue, 24 Dec 2024 05:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HXe3tnF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232FF28EB;
	Tue, 24 Dec 2024 05:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735019265; cv=none; b=Kv+g1ByYl25e7+nNI3fWJ1/lo9bgFDw7qVRG3908T1yxmOTYpKK5nJPu7EnM98NytLdWkckOeV4ToBUyJtarQPxxOd66C+IPxrb7MYNbpYIYQA5gY5vuXe6cw3azVsAtvYDMKW9KiVYycHEfcM9JHljHQ0M150YPtVw8x1Ikn7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735019265; c=relaxed/simple;
	bh=He3ATzRJh2xLelUd5OtrpXXpdTSlB8z/O685D2HvN2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ps8sf/UP3NOUSKnaakheXvgQOQSVmNJo7MbQFRVJLnelcJwolkEt0sJRa+i4r8aYMX/1h7yJME8zQ6CQZwpZ6kgFVDX2lqS3FXfsKrkZ57RybaOWotCDpDv87tXKYLIgR9guBblLIBuyWU4icw792aQUhZulL04Ecn/kO3Nya7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HXe3tnF3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNJt02J029914;
	Tue, 24 Dec 2024 05:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JDNaumscZm3FdWum2zEB6GirclRsqYAZ/WiXfslyno8=; b=HXe3tnF3PRlTFtpV
	Z7wzl4PinlGl1QA+TK76Q4FrHD9tiJz56ruIE0vrwqBdQbeZhokTZfC50V9q6gYX
	HzvwU6FhoW/Liw1TesUGdmW/gxYqYDVzJYaUO3eGRFvasJM/7dMmfr3eaXYcxL0o
	G6abejcsvRMOozbMOVDpcwbVAwwrHThnJDkicCfkWErR+gQBYGR+apYnLzoUlBPt
	VFbTkfngBRMYc0vYz6WndaPzEAB3gpYnyid1jI+Os36MtsrADb+9Q8PIQGhLCB8M
	6sbe8vtOttkAzwOE7plq6GrymVUf2rCYpNpA6eauIg2L11Cl+EIpIqKi3GwwWLri
	XtZXcg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qee0hbx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 05:47:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO5lDnw028695
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 05:47:13 GMT
Received: from [10.253.36.144] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 21:47:07 -0800
Message-ID: <c57a18aa-6606-4a3a-b508-8e335fda3e31@quicinc.com>
Date: Tue, 24 Dec 2024 13:47:03 +0800
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
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <t7q7szqjd475kao2bp6lzfrgbueq3niy5lonkfvbcotz5heepi@tqdiiwalhgtg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 43cSDXXTd4ELBG9MkihxK6IhR-O6YUBk
X-Proofpoint-GUID: 43cSDXXTd4ELBG9MkihxK6IhR-O6YUBk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=791 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240045



On 2024-12-24 12:16, Dmitry Baryshkov wrote:
> On Tue, Dec 24, 2024 at 11:07:00AM +0800, Yijie Yang wrote:
>> Add separate EMAC entries for qcs615 since its core version is 2.3.1,
>> compared to sm8150's 2.1.2.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>> Changes in v2:
>> - Update the subject for the first patch.
>> - Link to v1: https://lore.kernel.org/r/20241118-schema-v1-0-11b7c1583c0c@quicinc.com
>>
>> ---
>> Yijie Yang (3):
>>        dt-bindings: net: qcom,ethqos: Drop fallback compatible for qcom,qcs615-ethqos
>>        dt-bindings: net: snps,dwmac: add description for qcs615
>>        net: stmmac: dwmac-qcom-ethqos: add support for EMAC on qcs615 platforms
>>
>>   Documentation/devicetree/bindings/net/qcom,ethqos.yaml  |  5 +----
>>   Documentation/devicetree/bindings/net/snps,dwmac.yaml   |  2 ++
>>   drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
>>   3 files changed, 20 insertions(+), 4 deletions(-)
>> ---
>> base-commit: 3664e6c4f4d07fa51834cd59d94b42b7f803e79b
> 
> Which commit is it? I can't find it in linux-next

It's a tag next-20241108, titled 'Add linux-next specific files for 
20241108'.

> 
>> change-id: 20241111-schema-7915779020f5
>>
>> Best regards,
>> -- 
>> Yijie Yang <quic_yijiyang@quicinc.com>
>>
> 

-- 
Best Regards,
Yijie


