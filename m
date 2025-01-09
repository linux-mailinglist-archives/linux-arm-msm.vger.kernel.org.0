Return-Path: <linux-arm-msm+bounces-44600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 385E7A07920
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 15:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FA093A0645
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E702321A44F;
	Thu,  9 Jan 2025 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GTvlwGtD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E6E219E8F;
	Thu,  9 Jan 2025 14:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736432724; cv=none; b=OtG4x1ABOo+MzRb6Hb+8IrZW1z8rTsQl9uwuHIGvWGIsvb1DwuE0VYZo83vIp3t/icnzsxzYy1bViLSkQY350DcwbSaoWw3o1TFejYzkd6+jZfhLimlmQaUdaCCwMA3OTT6Qce8WP6NrBbpTyeAYvEiUKOuRIiC+hhCmsQ/uqEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736432724; c=relaxed/simple;
	bh=IW6w6j4i4xG642C9CffsoC9CjcCPRo+vI52cU7TR4sU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ODCVUU678cUCOhjSMnFXu/KFZHSJLsXA/0Y3iJEvD3v3OeOXQ935mp9RHN0FFkW6OvFT49cpczvdS1Yk4LeG0n7B0pRGIsVcBo52eQaRpUyV/SmKe8et7tRpccj4yCdakyeA8mnRaljmIdQJ3b1rHOxjXVYekYaYA+v0AKmO+gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GTvlwGtD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5097Gjs3019068;
	Thu, 9 Jan 2025 14:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DG+t50YYxrq5nhzjfuaUkzNrKfnvhXoOkYmHgMiAa5k=; b=GTvlwGtDhEA7T1Sc
	WXMlzMLwwoWnfwVJU+Mb5vBVIIemxQQeGoZjLa3mgzvwL16zXh+i0i5z0ncxel8i
	IY+sYmTY500kgTIzCg3C8uYfo8vfAYWITOBrK29dbGaDYVaKjpPmMvK40r+fYPPq
	z8/w9eoogR46njHB0/qrnuLVLlTNrdQTofXfASlE2Cj1JCXZXCyDxwQDwGIrUUQk
	3mVOK6kADv2zvnZpHpzwhIBfcX9aOKZ8zU88CU+sVDnmlLDkV80JiTNgPj3+jaQJ
	NBMzB5aIza2T/jQz7m6b316+bVeq47FTrlK5a/ZNTTm99t9qv3R8ckDqtM7PpPn2
	ZJL+BQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4429x5108e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 14:25:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509EP81U005976
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 14:25:08 GMT
Received: from [10.253.12.10] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 06:25:02 -0800
Message-ID: <f7e3d749-76cb-4fd8-a966-20cc1d9003fd@quicinc.com>
Date: Thu, 9 Jan 2025 22:24:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 13/14] net: ethernet: qualcomm: Add PPE
 debugfs support for PPE counters
To: Andrew Lunn <andrew@lunn.ch>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal
	<quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Simon
 Horman" <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-13-7394dbda7199@quicinc.com>
 <f47e5292-667e-4662-8cc2-5167da538ad4@lunn.ch>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <f47e5292-667e-4662-8cc2-5167da538ad4@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nGl0DdZLV88LMe2H4QDMumC8RXQVkg2f
X-Proofpoint-ORIG-GUID: nGl0DdZLV88LMe2H4QDMumC8RXQVkg2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=997 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090115



On 1/9/2025 12:43 AM, Andrew Lunn wrote:
> On Wed, Jan 08, 2025 at 09:47:20PM +0800, Luo Jie wrote:
>> The PPE hardware packet counters are made available through
>> the debugfs entry "/sys/kernel/debug/ppe/packet_counters".
> 
> Why?
> 
> Would it not be better to make them available via ethtool -S ?

Many of the counters displayed by this debugfs are PPE hardware
counters that are common for all Ethernet ports. For example,
counters such as drops in PPE due to lack of hardware buffers.
Since ethtool -S output is tied to a netdevice, we felt that a
separate debugfs file to display these common counters is better.
The port specific counters will be supported using 'ethtool -S'
along with the netdevice driver that will be posted sequentially
after the conclusion of the review for this series.

> 
> You should justify not using standard statistics APIs for what look
> like statistic counters. Maybe these don't fit the existing API, and
> if so, you should explain why.
> 
> 	Andrew

I will enhance the commit message to justify these debug counters
in the next update. Hope this is fine.


