Return-Path: <linux-arm-msm+bounces-47874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CAFA33AF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 10:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4319016A9D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 09:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B1320DD72;
	Thu, 13 Feb 2025 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UbZ0iLnD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31A920D4F2;
	Thu, 13 Feb 2025 09:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739438181; cv=none; b=nYM6BO8xm1KLC8p2CH6WPfH56eQAj99brO+YS675+5+CdzqvXALfNNL4yGxIAIaFwwY+NgvWiIzd0MP2Qv6uB36PVQ4FlVhJONpZYzFJ337rbWB1nB4fh3j423bG+J4Ig+LpQXK6J1zVK+4ehDtUD9lPaJzqs5nBy/ptg02nhH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739438181; c=relaxed/simple;
	bh=3zJFNSKbu3I7a6dKS4WaJ6Z+tpm3UXjS3mMZyMR95b4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aMyBQyiUYWPZIhe6YGNQEAnzIPmIZlOw/Ku0AsOMwy8y1r5Tb3hsEvs7RdUHpEqE5oVouBJ1DyPj9Y/r+xZTF0MHWLhibQBB54bTRRAlg6q9cIGTljFC2zOXdhomg/UwbAzc0BDbd3m9rSCfVn04KZHgFXeAYYKP5tgwrJBOiVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UbZ0iLnD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D05eqb002493;
	Thu, 13 Feb 2025 09:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b6c7aU1FwFS9e82x4bDgTLiYBRWSCyA8OWoEzOOkMVM=; b=UbZ0iLnD7IELmZ6Q
	p4sCJzw/gaKsFiiJLXiASupIjnbvnpskW2KAwxWZzlDUIYFwA+N1b66KC8HTDZQx
	Cqj/Kkg/DTldmocmOLQ4JemARh5K90pMmrqmINxwtCByFIhj7Qzf5X7pzlKlCb4k
	cyzdweUCxsKTdIzQSLMuqR5E6544avXumzknRK6Y7/cddb0a3FaznywKyFvJK12F
	ax/LowwcGMoHcKQmtKwCYcEACjWBlRt2wi9uQlZyTxoTs5pHiT7xbqkEs4NErlsy
	Skw7MBNIUqykZYdSSi/c4f15gXJZZfrBDxB+fKloFsqUGyilZKK9W/4tywEleupA
	Ji8LQg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44s5w495gf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 09:16:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D9GEid017503
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 09:16:14 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Feb
 2025 01:16:09 -0800
Message-ID: <0300a27f-5228-4f24-b011-5043a0b740bf@quicinc.com>
Date: Thu, 13 Feb 2025 14:46:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: qcom: Add compatible for
 QCM6490 boards
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250212-lpass_qcm6490_resets-v3-0-0b1cfb35b38e@quicinc.com>
 <20250212-lpass_qcm6490_resets-v3-1-0b1cfb35b38e@quicinc.com>
 <20250213-banana-bullmastiff-of-fascination-dbb65b@krzk-bin>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20250213-banana-bullmastiff-of-fascination-dbb65b@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bAZCJT2QKb96lqUW6DSEVuNMlF-mbDLI
X-Proofpoint-ORIG-GUID: bAZCJT2QKb96lqUW6DSEVuNMlF-mbDLI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=761 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130070



On 2/13/2025 1:45 PM, Krzysztof Kozlowski wrote:
> On Wed, Feb 12, 2025 at 01:52:19PM +0530, Taniya Das wrote:
>> @@ -130,6 +131,19 @@ allOf:
>>          reg:
>>            maxItems: 1
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,qcm6490-lpassaudiocc
>> +
>> +    then:
> 
> You need to constrain everything, also clocks. See all other examples.
> 

Sure, I will take care to update in the next patch.

> Best regards,
> Krzysztof
> 


