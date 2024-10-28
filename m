Return-Path: <linux-arm-msm+bounces-36092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FE99B219F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 01:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0A732814A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 00:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4351E77F1B;
	Mon, 28 Oct 2024 00:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C0nDK58V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A02D57CB6;
	Mon, 28 Oct 2024 00:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730076891; cv=none; b=TXAXl6enqVObluiuHN1GocwmTyhzCvdSJQzPum0UX58SKmExPRrHV28ikOuSY+EV2zBa8bWpyX67FV5vm9rnvxuKBeZRYkh2e0uboOqG+V7EktOFqztUxI6FO2Evb22ninxcDEGY7hLW6s6kQ7qdkI5Sfba/QCLEaQhXAfzBfwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730076891; c=relaxed/simple;
	bh=2Gw2J1Ix/dv3nTenMLorT8vi0/rczXHt2/8+zNoq+aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gcidVfk5g7GciNOXqPRuurmqtVE42V/KAKXpCizaGeKUcv5iGjKmVUzcqHg4QYE0FKAGcZ/s9qNv+oTU8fMKmeChIRgQJZFxlUKB14zeKAzSE/w7xXF8BAgZBYfEWmratqwd8UZ8ajNq9f7x1mNr3X9mJ3tEedu1dzW1KOiCXCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C0nDK58V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RNuURu023439;
	Mon, 28 Oct 2024 00:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lpKLsphvAee4QIkTtcAv2Ov+QXCubN1rwSAQDCdYNZE=; b=C0nDK58VprlJRRu5
	TH9OXwrAIK1GExr54Pv6RW42alN6oqmJtAHO0NwIyCyveO31DGu01SJ9nTrj8PN7
	jHWhXJbvr6p3tOxZLBR1Uq8rGG2OQbKbYN/7Ut7eyt6AD/fhgxbtSRRJB1wCobJx
	I+WEEg+oKDA/LhXriPizaxgFW1LwT8UEWV2fTatGOnY1n54AKihi6XRjQ2XNXzF3
	Nkv5vqR14Ry6PoXVCC/nsfdWN2jh59IpDJk6A1UhFYAjg7CY7BnpQxFIugOMFyrv
	RDyPTAUPzxJCt886hn2pQtWOUMBKkCL+6J/rNnbEJGQUzZx8T3D2a6Ws5izIVdNJ
	aylDcg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqe5u8ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 00:54:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S0saoN006141
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 00:54:36 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 17:54:32 -0700
Message-ID: <3f90b3d6-9637-47b7-ad8a-ff43cb28ad32@quicinc.com>
Date: Mon, 28 Oct 2024 08:54:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add coresight nodes for QCS615
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>
References: <20241017030005.893203-1-quic_jiegan@quicinc.com>
 <69be09ec-e9a5-4fb6-890e-74a65f3ce404@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <69be09ec-e9a5-4fb6-890e-74a65f3ce404@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YNg6ClML5fS4ZAquffo5rDUaVqZ29SKr
X-Proofpoint-ORIG-GUID: YNg6ClML5fS4ZAquffo5rDUaVqZ29SKr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280006



On 10/26/2024 2:47 AM, Konrad Dybcio wrote:
> On 17.10.2024 5:00 AM, Jie Gan wrote:
>> Add following coresight components on QCS615, EUD, TMC/ETF, TPDM, dynamic
>> Funnel, TPDA, Replicator and ETM.
>>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
>> Already checked by command:dtbs_check W=1.
>>
>> Dependencies:
>> 1. Depends on qcs615 base dtsi change:
>> https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-5-e37617e91c62@quicinc.com/
>> 2. Depends on qcs615 AOSS_QMP change:
>> https://lore.kernel.org/linux-arm-msm/20241017025313.2028120-4-quic_chunkaid@quicinc.com/
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 1632 ++++++++++++++++++++++++++
>>   1 file changed, 1632 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index 856b40e20cf3..87cca5de018e 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -202,6 +202,18 @@ l3_0: l3-cache {
>>   		};
>>   	};
>>   
>> +	dummy_eud: dummy_sink {
> 
> Node names (after the ':' and before the '{' signs) can't contain
> underscores, use '-' instead.
Sure, will fix it.

> 
> [...]
> 
>> +		stm@6002000 {
>> +			compatible = "arm,coresight-stm", "arm,primecell";
>> +			reg = <0x0 0x6002000 0x0 0x1000>,
> 
> Please pad the non-zero address part to 8 hex digits with leading
> zeroes, across the board
Will fix it.

> 
> This looks like a lot of nodes, all enabled by default. Will this run
> on a production-fused device?
Yes, usually Coresight nodes are enabled by default. Those nodes can run 
on the commercial devices.

> 
> Konrad

Thanks,
Jie

