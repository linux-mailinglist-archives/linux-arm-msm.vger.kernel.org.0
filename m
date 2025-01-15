Return-Path: <linux-arm-msm+bounces-45077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C47A11A36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 07:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A354918892BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 06:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8552C22FACA;
	Wed, 15 Jan 2025 06:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UzCmS5Up"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F374522F392;
	Wed, 15 Jan 2025 06:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736924278; cv=none; b=CN/k/c/DrpBjOfNKj9SIwgDJ8ZIJJ5ZcGvp+EMxgcplzOI6iVlyZdsoFEFcdFMvgpQk0f40nSGxz1evba6uhYC1IOn7MmVzQJpY2q28ZNW6S9lmino/MInOsRBe3fs9DQopUTXkLHer/H8iNesknygl/lMP332iAhVde5TmxMSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736924278; c=relaxed/simple;
	bh=9ylhe8VN6RPEcVd12Whd6qqqDNqOc7amBumoDE9CDao=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=W0kbVrfwLLcxC+VqxpDxoDNCN/dfyRgesLCaPy0Wcn3meoFoABul3Y46uBCSII4u3C/8QSGYOxASFmeAfgvlXApCgKqHeeMepIMxeh3NYXJYFm3VnrxCV6EBrI4BRDp7Xb83gokBXzlIofzF/AZpv60JWdYBOlN5gK3jkL5GVN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UzCmS5Up; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F1YZ6Y007853;
	Wed, 15 Jan 2025 06:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Yx8n/XQSKNINcFDuWn8kaPdgeJlpCZUR09RqodhtIs=; b=UzCmS5UpOenAGWHI
	Hch87xXQuxEftkkZEoXyr42fHzL/+iq6/wI5+4H2X2WgejlUFlsDD2MxihoWWZa7
	06/lLmADk7N16GjJjpVnFOtRZpeI0xm0+ybmzhlYtS3rhFE/Pn2MXMB3VrQTlivf
	ld5kPWGuds056Y5nCntt0gAUrzdydxRmWeLDanpc+dsZIcnvUlCuKAGdJWe7U1Y+
	FDcIeDKqPYvaqpk8tWnChXl7VN/aVCNjWNp6hi1nRlKyIbKNF7S5b8P8pmD3zzxT
	2GZHnTSTo0sxgVTcxe8FBeLBNWeZJiEb3BiHyxWQ69DXitPFlYfksFQ+seTMPida
	NJe5fA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4463frrnvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 06:57:40 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50F6vdIg018961
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 06:57:39 GMT
Received: from [10.253.32.159] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 Jan
 2025 22:57:33 -0800
Message-ID: <224f8e60-06de-4db3-9025-7ada999d676b@quicinc.com>
Date: Wed, 15 Jan 2025 14:57:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 12/14] net: ethernet: qualcomm: Initialize PPE
 L2 bridge settings
To: Andrew Lunn <andrew@lunn.ch>
CC: Luo Jie <quic_luoj@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R.
 Silva" <gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-12-7394dbda7199@quicinc.com>
 <4dbf1550-32e9-4cce-bf0c-8b92dbd49b50@lunn.ch>
 <c67f4510-e71b-4211-8fe2-35dabfc7b44e@quicinc.com>
 <8bdde187-b329-480d-a745-16871276a331@lunn.ch>
 <4599e35b-eb2b-4d12-82c7-f2a8a804e08f@quicinc.com>
 <b7b13bba-e975-469c-ad59-6e48b5722fc7@lunn.ch>
Content-Language: en-US
From: Lei Wei <quic_leiwei@quicinc.com>
In-Reply-To: <b7b13bba-e975-469c-ad59-6e48b5722fc7@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: x3DXd7vF2lTHN9YzXtgbNYOhtm42Ag0i
X-Proofpoint-GUID: x3DXd7vF2lTHN9YzXtgbNYOhtm42Ag0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150050



On 1/14/2025 9:02 PM, Andrew Lunn wrote:
>> I would like to clarify that representing the bridge and its slave ports
>> inside PPE (using a VSI - virtual switch instance) is a pre-requisite before
>> learning can take place on a port. At this point, since switchdev
>> is not enabled, VSI is not created for port/bridge and hence FDB learning
>> does not take place. Later when we enable switchdev and represent the
>> bridge/slave-ports in PPE, FDB learning will automatically occur on top of
>> this initial configuration. I will add this note in the comments and commit
>> message to make it clear.
> 
> So it seems like the comment is not the best. You don't actually
> enable learning...
>

Yes, I will update the comment to make it more clear.

> 	Andrew


