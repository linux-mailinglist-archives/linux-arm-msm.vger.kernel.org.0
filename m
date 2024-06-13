Return-Path: <linux-arm-msm+bounces-22579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7CE906ADD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 13:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E0F31C242CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 11:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC061143861;
	Thu, 13 Jun 2024 11:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F2b/rkfe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C2F143744;
	Thu, 13 Jun 2024 11:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718277565; cv=none; b=pS/umnUUbR1Ucagl2CKRV+756qudw87eU8V7qIcITpRWBei3001j6mJZcr3mlmywNdPNZOqZtJF2iIyH1EX0af3BdZVvHt6XmLE5stWPZudhNBpMA0FT/YnQHMZKAPN9cfOYRRyBG5tphKfz49/W2GwrbmX0rItraYo876V47ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718277565; c=relaxed/simple;
	bh=3x2aqfgj9MPPKpOUKtBlTPAaeW6NLYqUdUK47qxMWGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uXb/6IYLRxZAPEZTZg7IfdjnzQXT1dNruXFpxGiy7bH+B9isS82+UlRE8/HO5v2ganQzzu0EAyyoru96VPdyFAL12LA554xmAy9EfdO/awui9h7qHVEG8Y4GhGO0lXibOdmaNhMffdmorIGO0imhA1F2RFQ8D/hFQWEj70hmKtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F2b/rkfe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45D8wqUs003136;
	Thu, 13 Jun 2024 11:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KY2qp6MhjBDA4ClMkIpDCqB3o+YKfvWMyHFCikjSMmE=; b=F2b/rkfe8KyQUzXk
	nIenIz+x5y6M73Jl8gCx6lpQRk/c2RIZLkBxiHUOAjRWVlOl9XO4L1yT1C6uk8y/
	6VdvJKEJg6a3mSvyoViFqFlJC+QDSXnho9JeyFdZ4+G+XNfb4spwDAsUq5aRR6c0
	bI0/uq9Dycs5pVFgz/mrX2H9R75pxglNhcH7du0JS6U6enOLdAg7ENt3BUL2460+
	LkmswZr4HPazW/NC36PpZFZdAJVgSaKNx4Ns5yo5M2DHlsUAY4aNX2zmrUkr4jeY
	p2YAR2gT99+u6T3nBUft+Kw7u8osh3Y6a0XtuO5Qzhx7Sj3mwO9FhY76FvZdw+52
	AJw2YA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypp87x89b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 11:19:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DBJIng014815
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 11:19:18 GMT
Received: from [10.214.67.128] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 04:19:16 -0700
Message-ID: <d03a91a0-7120-7a75-7dae-66d7661bf1d3@quicinc.com>
Date: Thu, 13 Jun 2024 16:49:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] arm64: dts: qcom: qdu1000: Add secure qfprom node
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <inux-kernel@vger.kernel.org>
References: <20240612063424.2494-1-quic_kbajaj@quicinc.com>
 <1a533ec4-46bb-4e52-b552-69eaad0a2ac1@linaro.org>
From: Komal Bajaj <quic_kbajaj@quicinc.com>
In-Reply-To: <1a533ec4-46bb-4e52-b552-69eaad0a2ac1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Lbebp4q9Y8FEuK5cgxRBhytkI2yt2U1_
X-Proofpoint-ORIG-GUID: Lbebp4q9Y8FEuK5cgxRBhytkI2yt2U1_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_03,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=772 priorityscore=1501 adultscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406130081



On 6/13/2024 1:02 PM, Konrad Dybcio wrote:
> 
> 
> On 6/12/24 08:34, Komal Bajaj wrote:
>> Add secure qfprom node and also add properties for multi channel
>> DDR. This is required for LLCC driver to pick the correct LLCC
>> configuration.
>>
>> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
>> ---
>> Changes in v2:
>> * Minor correction in commit message
>> * Link to v1: 
>> https://lore.kernel.org/linux-arm-msm/20240607113445.2909-1-quic_kbajaj@quicinc.com/
>> ---
>>
>>   arch/arm64/boot/dts/qcom/qdu1000.dtsi | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi 
>> b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
>> index 7a77f7a55498..d8df1bab63d5 100644
>> --- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
>> @@ -1584,6 +1584,21 @@ system-cache-controller@19200000 {
>>               reg-names = "llcc0_base",
>>                       "llcc_broadcast_base";
>>               interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +            nvmem-cell-names = "multi-chan-ddr";
>> +            nvmem-cells = <&multi_chan_ddr>;
> 
> property
> property-names
> 

Will do like that.

Thanks
Komal

> Konrad

