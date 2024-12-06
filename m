Return-Path: <linux-arm-msm+bounces-40825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C54169E75C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 17:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85841280C77
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 16:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB0C20E33F;
	Fri,  6 Dec 2024 16:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f0zSvMAF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBD920FAAD;
	Fri,  6 Dec 2024 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733502080; cv=none; b=u7waYrr0NdZRQTpTmAzFJ6Zq+VUbjxd1WEKBuWZipoE6zPBo51URu/HHwqme2YsiwoRZUsKkMHODURvWi1nM7jAwRHmrgyYp3VY+wsa0QkSfJc8QuvbFSivEZz4/oRiDkfq3N32P4IFQF1TuMLwDBwBRJUkvVBGNqHvXvOZ7V7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733502080; c=relaxed/simple;
	bh=3dqaAoA31eacZhIbEOCa66ooHy/r1skHVtQzT7c7LRw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=rrR417HCB0DIV+QLPl6KZ6G6r6iUZ00HP+T+JWhV6WWSLNi5iT6CRqXCnJsgyHfglyeOTg0demQYvVH2waSPOJiYqpS0ICFC37wrcMN2TBnZlpyAfZXZmzK1vmM2slGmlaHwMKOGZtDF53e3ercHzJZXk91g6MX3p3JIJ/E5UhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f0zSvMAF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B67ObwZ031090;
	Fri, 6 Dec 2024 16:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dZpxmyE10vyIjqiDFe9RUIn9vvUySpmF8C5fjD0TsPI=; b=f0zSvMAFf8MqbLhi
	cstF/x9zO2OZT0iHRfdjU9D+ABSiEPzQI8ZhGd58O3rV7d8X9d7pTylMXylSCGEc
	yefqnrlhLxXa49/Ofew6lx96MoJ2F3M4g94JewHiSm38tMVeTEhGaOMjPFsB15A1
	dJG74kOtWu90ADYCFKlDw3QLrjifl6AX2JUCXQ7VMZKbj+EFpnnjV8EINUCkX9Ey
	w68eTEuKRx+FscaK3zklyKVvTF8PE7Wa5+GCwkPJ6d2h6hwpY2jvjn33stOyAPBN
	DxTR1SU22KW8QXqdcDGl7QW19vLuk9Ekp/32/b+2ix7NP1srPgaZn8tu9NZBTFyg
	KmrNrQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be173rss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 16:21:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6GL5VB030458
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 16:21:05 GMT
Received: from [10.253.9.12] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 08:21:00 -0800
Message-ID: <dc40d847-9a98-4f46-94cb-208257334aed@quicinc.com>
Date: Sat, 7 Dec 2024 00:20:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Lei Wei <quic_leiwei@quicinc.com>
Subject: Re: [PATCH net-next v2 4/5] net: pcs: qcom-ipq9574: Add USXGMII
 interface mode support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Lunn
	<andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_luoj@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <bartosz.golaszewski@linaro.org>, <vsmuthu@qti.qualcomm.com>,
        <john@phrozen.org>, <linux-arm-msm@vger.kernel.org>
References: <20241204-ipq_pcs_rc1-v2-0-26155f5364a1@quicinc.com>
 <20241204-ipq_pcs_rc1-v2-4-26155f5364a1@quicinc.com>
 <Z1B3W94-8qjn17Sj@shell.armlinux.org.uk>
Content-Language: en-US
In-Reply-To: <Z1B3W94-8qjn17Sj@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lNU9p6noLeU3grZhwU3QLQff8mwIKHfH
X-Proofpoint-ORIG-GUID: lNU9p6noLeU3grZhwU3QLQff8mwIKHfH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060123



On 12/4/2024 11:38 PM, Russell King (Oracle) wrote:
> On Wed, Dec 04, 2024 at 10:43:56PM +0800, Lei Wei wrote:
>> +static int ipq_pcs_link_up_config_usxgmii(struct ipq_pcs *qpcs, int speed)
>> +{
> ...
>> +	/* USXGMII only support full duplex mode */
>> +	val |= XPCS_DUPLEX_FULL;
> 
> Again... this restriction needs to be implemented in .pcs_validate() by
> knocking out the half-duplex link modes when using USXGMII mode.
> 
> .pcs_validate() needs to be implemented whenever the PCS has
> restrictions beyond what is standard for the PHY interface mode.
> 

Currently, it seems there is no phylink_validate() call in 
phylink_resolve(), to validate the resolved duplex/speed which is 
notified by phydev when the PHY is linked up. So I am thinking to add 
this duplex check in this link_up op, and return an appropriate error in 
case of half-duplex. (Kindly correct me if I am wrong).

> Thanks.
> 



