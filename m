Return-Path: <linux-arm-msm+bounces-28243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA96594CF53
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 13:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 084051C21002
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 11:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B660192B89;
	Fri,  9 Aug 2024 11:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C+DKVLEe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AFB1922DA;
	Fri,  9 Aug 2024 11:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723202625; cv=none; b=YEREf+bJaE36QLCaTRBsbZgEhBEjl2SNsdfEEAqoCBhAgJN2NPGoqu4znv5rhDVxjMFw9J7cWyhTpyJEk6pCrtw4nKyf7v2i6Y4NJ+KyTcpCi2jZdNEju++bmnTX/5+pBlwd+AKbsTpcfcJM5J5zMTIpLu0HPu+hbf4DIj+Ly3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723202625; c=relaxed/simple;
	bh=99QZwfy7FpnkKv0amq8+yPVeiosWfW3ubXSIrQLu0QU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=M1WhF9piuxHi/3LXN/ZNksAEXiQXHPYIrvMxYNS1x1nd7nXdCHhKZN1mK1qqnFaE6+vTK5EDmLaQ9+X8To7pH2NzLwrQ0Gt6vC8KDKOWdV8zt9Hy/bct1sv98QSYJ9z3/fEl2FFVHr6vpNYAA6+XRJEvoXOOTldMRev3a6HaFE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C+DKVLEe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4799UjZo022527;
	Fri, 9 Aug 2024 11:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWwFDwt/qsHXf2B0hZ3zOfk+nlBa9ntGIGKUIr57KzQ=; b=C+DKVLEe8hE6muPb
	2EDhu+nckzRCQF9h/1URI7M6mskSjZ1SiPKeE5MjQUFG9tRm0Wf4967UsA2r6X9u
	Y8KNuSQXMBBY8I6rSwE99j5iZaBrjp/AabIDMQweBOidMZdLLpXJeVKAFzjv06BX
	kBrOK8Jfjc2v7LAoJWlaATI1BaoGqWsQ4HYNdNOpkQxwTmfesauedwYMv1ih3k9k
	pcj6ntSCdr4feJdk/e+jJx12/P2o7Ia7qNxiH6IcRqpwkkuRJ15stpiactXvSvRc
	RtbzKX1bRd3UIinKBjw2I1B5B+7anqBD36jIMS+9KuchEjnE2QTSC4ZS74+gEUBI
	IF1Xyg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vtbcurv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 11:23:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 479BNWvJ005005
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Aug 2024 11:23:32 GMT
Received: from [10.253.72.235] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 Aug 2024
 04:23:27 -0700
Message-ID: <00960663-00a4-4662-9792-7899fc6ce101@quicinc.com>
Date: Fri, 9 Aug 2024 19:23:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add common PLL node for IPQ9574 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>
References: <20240808-qcom_ipq_cmnpll-v1-0-b0631dcbf785@quicinc.com>
 <20240808-qcom_ipq_cmnpll-v1-4-b0631dcbf785@quicinc.com>
 <1d5b1666-4ced-45e6-bea4-50a33530a12c@kernel.org>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <1d5b1666-4ced-45e6-bea4-50a33530a12c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Vrcf0NO4rPr_DUBqIrIRaBtaAv6Pkt-2
X-Proofpoint-ORIG-GUID: Vrcf0NO4rPr_DUBqIrIRaBtaAv6Pkt-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_08,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 mlxlogscore=875 clxscore=1011 impostorscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408090083



On 8/8/2024 10:45 PM, Krzysztof Kozlowski wrote:
> On 08/08/2024 16:03, Luo Jie wrote:
> 
>>   
>>   /dts-v1/;
>> @@ -167,3 +167,7 @@ &usb3 {
>>   &xo_board_clk {
>>   	clock-frequency = <24000000>;
>>   };
>> +
>> +&cmn_pll_ref_clk {
> 
> Please follow DTS coding style.

Ok. Thanks for pointing to this. I will move &cmn_pll_ref_clk before
&xo_board_clk to make the DTS ordering alpha-numerical by the node name.

> 
>> +	clock-frequency = <48000000>;
>> +};
> 
> 
> 
> Best regards,
> Krzysztof
> 


