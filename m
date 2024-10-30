Return-Path: <linux-arm-msm+bounces-36479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0152E9B6B9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 19:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DD5A1C23C9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 18:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4161C9B8E;
	Wed, 30 Oct 2024 18:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fyap0UUw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D99D1C3F01;
	Wed, 30 Oct 2024 18:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730311505; cv=none; b=LOmYejypzm7EAYxJC5akece6vHkbps4I5UMcELu54SuQI77g5qIWowTOPKjwW4Q6CyS5yDr+C7ej5nIIcvdNngBdCbyRR/gpxOZ4CEtVLyHUCAZpRDvGmNN2O8bx8RBscVTqjbSG1UFE9popLT7mWmzWuitkoTs/hdYebY3vKpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730311505; c=relaxed/simple;
	bh=6ke9hesq3PW0A7WAvxJbdmn709wxR9TSpXlXo5seg+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D7vQi/7rM8E8JCfjGwEAxE6N7focQbuvpebZ35NJTTnBtoLyzahDE6Jnj7483ety4VZwROVJPXiSj6ofHN1bQJG9Qgh5SNI3Ia9nnlbxX3+FKvArZSMcAeV0+OdN96nrUliUS2yIuuMiTlDDR/KlgNu8Evtw/Gq3ZbPuph+99yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fyap0UUw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U8tGmv007054;
	Wed, 30 Oct 2024 18:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFZ4jK093/hp1fs+vI48bsmNhl76L6FBa4yfekgb5f8=; b=fyap0UUwDO311313
	Q2hNuyTOvdPYm6UYbqYUh51k2yIbTEXeo2hM+eElNs4bN084C0qWHoEV3SCncPlG
	h6a4xjK6NWZIjLwgnr++AKLUQqhkHIEu1VkxLl1B+HPzuze1wqoxUoX1+pIv3xms
	2nIEWYFofNwDuCw7WKxyB7sT4Eh+4gBpWWb65ZaqriRyEyMwDw5R+ju0BgndTx/b
	GFqCBS/cOLX/syuNCUnW193c1ROx5X2d7bspqJT/1LffXRS5C6SvAdN06FEx83xJ
	uez/9JeKYTmXbJbYALeu3rHE6SErIDZD6EVPUM358mjzRvMXp10/cqlMCu40Hqgh
	M3a8ow==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42khqbsjan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 18:04:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UI4U76018017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 18:04:30 GMT
Received: from [10.216.35.255] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 11:04:25 -0700
Message-ID: <ed81fbc3-7a15-4468-963e-e81c668f8978@quicinc.com>
Date: Wed, 30 Oct 2024 23:34:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] clk: qcom: videocc-qcs615: Add QCS615 video clock
 controller driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhishek Sahu
	<absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-10-4cfb96d779ae@quicinc.com>
 <ig4hdtslj3qpu4arke3ejdensc5rs4jti22h3bpduub4uzglrc@gjirgpwgfvi7>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <ig4hdtslj3qpu4arke3ejdensc5rs4jti22h3bpduub4uzglrc@gjirgpwgfvi7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: l3yYrY0OePqyDmKlqysudVL238msHozk
X-Proofpoint-ORIG-GUID: l3yYrY0OePqyDmKlqysudVL238msHozk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300142



On 10/19/2024 2:01 AM, Dmitry Baryshkov wrote:
>> +static const struct pll_vco video_cc_pll0_vco[] = {
>> +	{ 500000000, 1000000000, 2 },
>> +};
>> +
>> +/* 600MHz configuration */
>> +static struct alpha_pll_config video_pll0_config = {
>> +	.l = 0x1F,
> lowercase the hex, please. LGTM otherwise.
> 

Will fix in the next patch.

>> +	.alpha_hi = 0x40,
>> +	.alpha = 0x00,
>> +	.alpha_en_mask = BIT(24),

-- 
Thanks & Regards,
Taniya Das.

