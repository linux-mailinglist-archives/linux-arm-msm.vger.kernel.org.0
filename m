Return-Path: <linux-arm-msm+bounces-43314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB80C9FC5A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 14:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 679A7163D46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 13:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBAFB1B21B2;
	Wed, 25 Dec 2024 13:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="murXgnlm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6199B75809;
	Wed, 25 Dec 2024 13:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735134486; cv=none; b=aE8mNV0oL4/1vVT1VzCy91gBTE+u4XVzOrd9iiRLlLHsrO+nw/j5M6YCIj4hFg1dKCw+ZyRe5LTZmmqkJAbDTCZHV7n+JI/tAlWjbnqfrTO2wktgJMnHdMQy67OMsCATj6wjnPdFqeA1d3oeXYhk3MJhdN7QRtDkYecMMp+ShOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735134486; c=relaxed/simple;
	bh=DP2h0qRc32Xl2kiYPEc31Daz3KtJxze7Mr5CabqZm/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HqEgSw3x2VeFQn95+KHpynMzxnL1t1hTtGYThlxb1CxQXtuoiwoj5hT+ok8llqoQbUN61Vj8X5scVG6KBGc1CZrrXGwpcivvyv6B+4vSZ9ivqDBg2fWowdtKq1aGFuSdTOr9sxrdLiTWbUQVjoXhxl0K3FYUeRlDHqbwN9FDMm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=murXgnlm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP3mpr7017731;
	Wed, 25 Dec 2024 13:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8TvsoDUDT28S03vubGDR2Ts4f2dC1mpWCCCrOigUjTw=; b=murXgnlm6yTxe3kp
	2dYDc+lPoZA/TXRnRN2XOkw9Yj6WX/D9oExmL5FPECV4KmXZH6qvXDVoLGQsrxWu
	rp43stD/p4TbHAHdYbRIvV2eXTNqR+EpvJR26y3UrD9l5eYenDHFz+iuHKTUjyCJ
	zqPlYY09thNlYoDlG+KO44GPMjZE+OfKDW4ymf56HS4um5TotETelT0lo9x1L2aC
	Bu6twAjTnPKSFlrpDbg9iM4mmVl6kxP0cYSGkOXVOEVkYzsgdse7HVdI7cLPW8sI
	uc9BaApGtamxHZp3VcdxzUn5Zs2d02NLBj5/MoKIQVs6gTLd1XFEdYoeSigTFH3E
	3PSvtA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rafqj6fg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 13:47:48 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPDllZi015118
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 13:47:47 GMT
Received: from [10.253.13.63] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 05:47:42 -0800
Message-ID: <f9e6c68d-0515-4680-b9cf-c0728bdf7703@quicinc.com>
Date: Wed, 25 Dec 2024 21:47:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 4/5] net: pcs: qcom-ipq9574: Add USXGMII
 interface mode support
To: Jakub Kicinski <kuba@kernel.org>
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
References: <20241216-ipq_pcs_6-13_rc1-v3-0-3abefda0fc48@quicinc.com>
 <20241216-ipq_pcs_6-13_rc1-v3-4-3abefda0fc48@quicinc.com>
 <20241220134941.370d3357@kernel.org>
Content-Language: en-US
From: Lei Wei <quic_leiwei@quicinc.com>
In-Reply-To: <20241220134941.370d3357@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FtUgJm8VIUz9rt6hqPxK1ktTvfZfFm-G
X-Proofpoint-GUID: FtUgJm8VIUz9rt6hqPxK1ktTvfZfFm-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=975 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412250122



On 12/21/2024 5:49 AM, Jakub Kicinski wrote:
> On Mon, 16 Dec 2024 21:40:26 +0800 Lei Wei wrote:
>> +static int ipq_pcs_config_usxgmii(struct ipq_pcs *qpcs)
>> +{
>> +	int ret;
>> +
>> +	/* Configure the XPCS for USXGMII mode if required */
>> +	if (qpcs->interface != PHY_INTERFACE_MODE_USXGMII) {
> 
> nit:
> 
> 	if (qpcs->interface == PHY_INTERFACE_MODE_USXGMII)
> 		return 0;
> 
> And then the entire function doesn't have to be indented.
> 

OK.

> Please fix this and repost, it'd be great to get a review tag from
> Russell or someone with more phylink knowledge.. Please be mindful of:
> https://lore.kernel.org/all/20241211164022.6a075d3a@kernel.org/

Sure, I will post the update once net-next reopens. Thanks.

