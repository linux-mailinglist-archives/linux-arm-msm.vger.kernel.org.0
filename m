Return-Path: <linux-arm-msm+bounces-51255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1D2A5EE5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 09:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 564CE3B8756
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 08:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27988262D1C;
	Thu, 13 Mar 2025 08:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JBZyEVi7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5923B262D03;
	Thu, 13 Mar 2025 08:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741855756; cv=none; b=byLAsfSWd7W5r+EsCn6jvUrtklHVOhsv6uzmJBXkwSMmWe2ymFnpVHvlPloGgQTeURG23+e4hdqnD0UR+qGVOjnyccalqDiGA2K7EyQGpRRZj4U7m2PWvGMjxTXBSSqGkLmYYGoKxj6UAztFvRFqXO5AuOnB00RxnQXhM8y/R6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741855756; c=relaxed/simple;
	bh=Ejk3Kj9i4YP7lT8RWRHaHtB3AYMKOayWzzwjuaC/Z0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fdR4rh0Kgx7AAjgd0fkXMR39iH1wIDwe7fOuTKVRDomGs7xpGL1x6dTwBH2VGOa9AhJS/RhTlY+ebjM00Ln57KQTnbsah6rtBnH4I5BYTr6+VpPYa3oFRlIaXtfQKSCDPQAm6NdQBBe2HEGkYX0nN/s9t4H7905HzJLWk40plPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JBZyEVi7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CLZYBu016092;
	Thu, 13 Mar 2025 08:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	86MvSXA9jZcVHxZx0v3xVpCRurz549Nknm9xWSSqvAk=; b=JBZyEVi7GKmC4V61
	KUMiK2eJZWlJ8ITGDEoCGeg2NP0cYcfLX2wJ4UAvVwbeaz+MQaZws2CdUexW8507
	BaDQczKfoZT3F1o1hTbkSy2btFwW3Oi+osekZsrA1RYkfiWhuM5Ad9bIwnLC0E40
	M47w0BkXh2tm45xL/p4FSVUbz/wibSeWOXL9KTcpSrROC3XqbLPIXl/27s1Srm++
	46VNdH+386kKEPlL1Fff5uguROei5EN1abNdM+UZ9iipdeHaG0dAU3DxmS6v5Qvd
	6CtmQztxD1TuscvxnfxWNduOZkZHsh8PlUTyEjcBZXwPPqu1OYS4sFy1AAAXfeTY
	Iy25mQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nw7cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 08:49:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D8n5fo027308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 08:49:05 GMT
Received: from [10.217.216.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Mar
 2025 01:49:00 -0700
Message-ID: <d1814cd9-5c73-4ac5-a4ed-4cc2aae410d0@quicinc.com>
Date: Thu, 13 Mar 2025 14:18:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] dt-bindings: clock: Add Qualcomm QCS615 Graphics
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
 <20250313-qcs615-v5-mm-cc-v6-6-ebf4b9a5e916@quicinc.com>
 <20250313-graceful-jackdaw-of-opportunity-62996d@krzk-bin>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20250313-graceful-jackdaw-of-opportunity-62996d@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 87Qxhu8_sjEn3ryZlgN4TUBUFHm73mo7
X-Authority-Analysis: v=2.4 cv=ZObXmW7b c=1 sm=1 tr=0 ts=67d29c02 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=StMH6zsOQGyCnKe-h1UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 87Qxhu8_sjEn3ryZlgN4TUBUFHm73mo7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130069



On 3/13/2025 1:54 PM, Krzysztof Kozlowski wrote:
> On Thu, Mar 13, 2025 at 12:29:43PM +0530, Taniya Das wrote:
>  +
>> +  '#reset-cells':
>> +    const: 1
>> +
>> +  '#power-domain-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - '#clock-cells'
>> +  - '#reset-cells'
>> +  - '#power-domain-cells'
>> +
> 
> I don't get why this binding is different than others and you do not
> reference qcom,gcc.yaml? Is it not applicable here? Other gpucc do
> reference.
> 

Yes, I will fix them and resend.

> 
> Best regards,
> Krzysztof
> 


