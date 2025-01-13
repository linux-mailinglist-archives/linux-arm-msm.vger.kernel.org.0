Return-Path: <linux-arm-msm+bounces-44856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFEFA0B0E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 09:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 191F816648E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 08:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC03F2343B6;
	Mon, 13 Jan 2025 08:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gnQSVPx8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADC02343AE;
	Mon, 13 Jan 2025 08:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736756434; cv=none; b=rOJJzHhRfyxA1PaxKxce8DOiahEdpNi5JlPg1V3INQNVGIEZR16rWrXja1y1MtJs+V73EcdF3oqhmA7COrgT2YNjQLa6r8AKx8QN/dYQMCSPI5dWJksMMeIvi7O/PCpe5EVFrKjlwrHN1kKnz3wYCWrUuspjY3Wl2RzOR4c6Vm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736756434; c=relaxed/simple;
	bh=T2+vwE8Q/jX5sjYtCnlHq5K3xPwjojUoWuI3P0DevBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EjJ09pXYpdXzYPWBGqfyBMOCsN4Hcj7hdWcClaX4OEMLRE3ZnPW7N9Lp9L3ZulHXb0y9LiV53aVZkfDs0KEdrgtbejZEfSFQj+62d+Wz9VPRJGCz9FLljl8U7t76MpCw+BVHP1Dnrn8zGlrawbJINBz/RUYeWSTwhbnw2o98y0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gnQSVPx8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CNVmNK001429;
	Mon, 13 Jan 2025 08:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KTOGnUSuzyr+oWqVsvrpKAAsSXbxNV6JiMO8j/CSbgA=; b=gnQSVPx8SzXP5jLi
	GRLKap5D6FO5Ovkep4MJICmvTQMzTTg6B/lnklB+1H3XsC9wzvRXDJy+0HSY2awQ
	bA85QjI9NVi0cwUjqbSDhtehybG/dr/AiyuMmtnnWlK1VGlH/PSUnGkIhAlCO2oU
	Z/uS36vr/bXJf+aOXzd5ubwVqI5bqFj6Jswr0TTnS9NXPNDfmu8c2AZ9bM7AKmuT
	jYn8x4BsG5D4LSDEJm2rgBcfJNqvtGmlU8N3B8Cy4SHRkPqyPKAGbaqpwJFGMqm0
	htcDpCWFUrUDyheLhC9WrE836jH/GFdNAHXJu8/BWhIPm6WBql4qDmvdFjDBy3Ze
	8w6VDg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444f5bhjr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:20:19 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D8KHKF014816
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:20:17 GMT
Received: from [10.253.33.98] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 00:20:11 -0800
Message-ID: <45d3eda0-7a2f-4ba3-9646-1f0e4b4f8943@quicinc.com>
Date: Mon, 13 Jan 2025 16:20:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 3/5] net: pcs: qcom-ipq9574: Add PCS
 instantiation and phylink operations
To: Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Lunn
	<andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
	<linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_luoj@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <vsmuthu@qti.qualcomm.com>, <john@phrozen.org>
References: <20250108-ipq_pcs_net-next-v4-0-0de14cd2902b@quicinc.com>
 <20250108-ipq_pcs_net-next-v4-3-0de14cd2902b@quicinc.com>
 <20250108100358.GG2772@kernel.org>
 <8ac3167c-c8aa-4ddb-948f-758714df7495@quicinc.com>
 <20250110105252.GY7706@kernel.org> <20250110163225.43fe8043@kernel.org>
Content-Language: en-US
From: Lei Wei <quic_leiwei@quicinc.com>
In-Reply-To: <20250110163225.43fe8043@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4PZO-eVY0aKhcDrThjj0pMLQBrPJeRZM
X-Proofpoint-ORIG-GUID: 4PZO-eVY0aKhcDrThjj0pMLQBrPJeRZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 mlxlogscore=938 malwarescore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130070



On 1/11/2025 8:32 AM, Jakub Kicinski wrote:
> On Fri, 10 Jan 2025 10:52:52 +0000 Simon Horman wrote:
>> I don't think there is a need to update the code just to make Smatch happy.
>> Only if there is a real problem. Which, with the discussion at the link
>> above in mind, does not seem to be the case here.
> 
> Maybe be good to add a one line comment in the code to make it clear
> this is intentional. Chances are we'll get a semi-automated "fixes"
> for this before long.

Sure, I will add the comment to make it clear.

