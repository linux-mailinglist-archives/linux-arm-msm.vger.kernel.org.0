Return-Path: <linux-arm-msm+bounces-45811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9407CA1935E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 15:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78B833A4BBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 14:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6B6213E61;
	Wed, 22 Jan 2025 14:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UNtWzTPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0369C212F82;
	Wed, 22 Jan 2025 14:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737554962; cv=none; b=sKEbGBAwFJLNekasREpXVhRfR+JbZGlRFghW85ZX2xV9XSPxR8ZRPZfJdBId2HWhgKjhAxv3XbtsYjlApQ+kzvagVvXYyumDSNVqUDveTQpFR7A/0A/4qDdO86kByKdfG1qe+wuwXLsMlazJtgMdymbtqJ8LnMrB++w8D6MTMnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737554962; c=relaxed/simple;
	bh=3vVCr5Yn+9BR+SDjuYVo0Htb3I99oB5Pc5rGXDP1EB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lmVa9g9bLLI08vpZaSmCTRPZXoE0+bpXFDRckx+cT7QYRL+RCFDmvBCyWNrrU1zK+1QiSGBh/CC4jycYtwj5MV9qggzosi4dNPpnyyOtxgNR1a5JOqH+MX4/Wrg0xXQp2EIzZDyDz3BHUnxjcAywvcg70FYm2ixsEJvyQt0vfnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UNtWzTPf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M9CqhT011281;
	Wed, 22 Jan 2025 14:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tCaQr1IaRtZ/a5rkqKlJEvsuA8cqEOAs6Gn4g55uwsE=; b=UNtWzTPfO0CDtyRY
	fHP3mXeGadjSkGwMGXDvBxvHLQdwNG2Jxo0yN97dbwGfxf9xwMg42gFi7UoLgb6c
	KMaHstY8XI2tptF/R74xcGLorK9mh200XOsbzkEH/u83dX4XZpTH4PxHQjSKq7Em
	Rav6Sk13/XP4CdrU/dA5+CHNk+Q27icjFJqpmkYTYC9G/0Kfuv7293fnWHCK0nRH
	uYidvK4+klOMOjuVZWH0Xo20ATi/qpdkZPnTAsjGNl7+mVWxtxyx+j2v0gnyjTd3
	4jvz8Kl41jyyyTDqZDH4UMfTFbOaSu/oTkGwGs0cyVL6fodWK5ZLu9xRva5jyQUn
	0462cg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44awuh0pus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 14:09:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50ME971B023720
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 14:09:07 GMT
Received: from [10.216.29.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 06:09:03 -0800
Message-ID: <de6a6943-11eb-468a-b6c1-406929c576d3@quicinc.com>
Date: Wed, 22 Jan 2025 19:39:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8650: setup gpu thermal with
 higher temperatures
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250110-topic-sm8650-thermal-cpu-idle-v2-0-5787ad79abbb@linaro.org>
 <20250110-topic-sm8650-thermal-cpu-idle-v2-2-5787ad79abbb@linaro.org>
 <8fc3b958-5c2f-4c79-8dc0-d1eec9f5e47d@quicinc.com>
 <56023e4f-d60b-41c3-a3c9-ba768613e9b2@oss.qualcomm.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <56023e4f-d60b-41c3-a3c9-ba768613e9b2@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BhV8g_mJlCTaxlYJ8ka8eygpyxY7nYdk
X-Proofpoint-ORIG-GUID: BhV8g_mJlCTaxlYJ8ka8eygpyxY7nYdk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_06,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220105

On 1/17/2025 2:50 AM, Konrad Dybcio wrote:
> On 13.01.2025 11:28 AM, Akhil P Oommen wrote:
>> On 1/10/2025 4:06 PM, Neil Armstrong wrote:
>>> On the SM8650, the dynamic clock and voltage scaling (DCVS) for the GPU
>>> is done in an hardware controlled loop by the GPU Management Unit (GMU).
>>>
>>> Since the GMU does a better job at maintaining the GPUs temperature in an
>>> acceptable range by taking in account more parameters like the die
>>> characteristics or other internal sensors, it makes no sense to try
>>> and reproduce a similar set of constraints with the Linux devfreq thermal
>>> core.
>>
>> Just FYI, this description is incorrect. SM8650's GMU doesn't do any
>> sort of thermal management.
> 
> What's this for then? Just reacting to thermal pressure?
> 
> https://git.codelinaro.org/clo/le/platform/vendor/qcom/opensource/graphics-kernel/-/commit/e4387d101d14965c8f2c67e10a6a9499c1a88af4
> 

I don't think those TSENSE configs matters on SM8650 in production.

-Akhil.

> Konrad


