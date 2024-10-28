Return-Path: <linux-arm-msm+bounces-36120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D07B09B299E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 09:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95AD2281624
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 08:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66781D0E23;
	Mon, 28 Oct 2024 07:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bi3RkSbD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B96F1CCEE5;
	Mon, 28 Oct 2024 07:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730101587; cv=none; b=Y7mmIiSCubXZWkEUkLN/9eoLXbvkqXhObbrBjwl15EQAkbP8Y0Rih80XVhO40WE2AS2D81M/r7RbX8W6jSx4JG044VK8tjyW7TYYiCNemCRRLHaHfBvdX0c2oEQ4ZUmR2/thVgUTFlCVIC1UX9wrTqGBNlG+KLY6/1wMdw+6Zs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730101587; c=relaxed/simple;
	bh=0nzgBNDrmE7kW4KbM11lBzWym2g/ZRqGgQBcfHojSFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GXHq02gkMUZWCAkWcKVLljHOSob7+V3nbZ7yJSwZmLkW5htDjjUet4iTGpYq33R8d3lyOWYYysWC6VKcIamWO6APoDQGjXw4DB4EkOaIwrM8UfArY1u/UQsYIQDnp617snzZcnbtd0H1Do6iCdMc2qyUbjJ7OsTMg+/kHKmNgzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bi3RkSbD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RN0OG6010456;
	Mon, 28 Oct 2024 07:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PobXzPGGnjLtxgHS3B4nk270t4SMrzqU1Y+YvIFP7Vw=; b=Bi3RkSbDc7A892gc
	pyMeJPC3Hob/hxOxDhrNLvf1wvhb8uFzE0CkC8DKjY6+zEr9acONf12+AXYH9NmC
	PBReXXGYoOBT5wIneCkKCZU6LmP7nm3HtN/CbA3yESqUsHbLTlPNyY1KZ5x0iOZh
	XkZJ1VyWT8XbEdLtpsWRJ4JxbQpqdSIVidTC3umUgEI1n+lMX0I+CG3DXLUQjCHq
	/Rb7bTnM/5d8cyRJDgX+8Okm1X6c5pLW4RBnwkgos8oNvs6mGubIO+2q21qBJlXK
	0KIYFAKCuB6JLAdnC7JgRuehPmNDNmtQLnc+1gqYsbCiZI3cj2qSfohcNOpDT/Iz
	fauHuQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gr0x40xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 07:45:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S7jqO9014587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 07:45:52 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 00:45:43 -0700
Message-ID: <5862062c-8c52-421d-94b3-6b6000b53616@quicinc.com>
Date: Mon, 28 Oct 2024 13:15:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/7] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <angelogioacchino.delregno@collabora.com>, <neil.armstrong@linaro.org>,
        <arnd@arndb.de>, <nfraprado@collabora.com>, <quic_anusha@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241025035520.1841792-1-quic_mmanikan@quicinc.com>
 <20241025035520.1841792-5-quic_mmanikan@quicinc.com>
 <lyafg7jwbwoe3j7voecgd5tnhrb65utc3vkc5qqxoqug3qd47m@iudkp4w2mrso>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <lyafg7jwbwoe3j7voecgd5tnhrb65utc3vkc5qqxoqug3qd47m@iudkp4w2mrso>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2B14fMh6JTJ678YrLvHL2MnvQnTUs5Ax
X-Proofpoint-GUID: 2B14fMh6JTJ678YrLvHL2MnvQnTUs5Ax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=703 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280063



On 10/25/2024 5:30 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 25, 2024 at 09:25:17AM +0530, Manikanta Mylavarapu wrote:
>> From: Devi Priya <quic_devipriy@quicinc.com>
>>
>> Add NSSCC clock and reset definitions for ipq9574.
>>
>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
>> Changes in V8:
>> 	- Replace bias_pll_cc_clk, bias_pll_ubi_nc_clk with CMN_PLL
>> 	  NSS_1200MHZ_CLK and PPE_353MHZ_CLK
>> 	- Remove bias_pll_nss_noc_clk because it's not required.
>> 	- Drop R-b tag
> 
> That's not really a change waranting re-review.
> 
> I wished you did not create here dependency, skipped the header and just
> use some number for the clock. Having dependencies does not help anyone:
> neither you to get this merged, nor us to see that it was tested.
> 
> Please confirm that this patch was fully tested.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 
> 

Yes, it's fully tested.

Thanks & Regards,
Manikanta.

