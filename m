Return-Path: <linux-arm-msm+bounces-43315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D04A9FC5AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 14:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D251163D25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 13:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293341B4148;
	Wed, 25 Dec 2024 13:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gvirCEID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF961A83F1;
	Wed, 25 Dec 2024 13:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735134581; cv=none; b=BLg1oSkwTCI4YiU2cjvSpbpp83qoqHR6+LHK1MWElHjrzZLCl4SFpM7k0QOfuSIIHeEm4KW6sjmgvVevgFqzlc5L2P5emhVoqyXu27VZLrMEJgtHyfyvdykhzfm5Emqdon0KCdW7Ofh6lsINdpbdUMu3QfBfGXrxYf7mwiK6ULk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735134581; c=relaxed/simple;
	bh=+1onn6qjl52KmpzjMinpL0ry8tPaPAuEZeVmkcIz7Ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l/laz4tzhCqqVhj7bpVrrWphJRFfz3I96FWbf46ItOdtvofCC4M+PVy3w/nedq9Lld3d3u5SroyVbXIH0RKXj/DxVUi6188JediZvWHAFgd/cCBcm02QD/bgF8LgxrI2FOE0zGFZoeGyGEWX0j0HBvAFpk8F8qKSmi/OS6nxb0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gvirCEID; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP2DrBT031953;
	Wed, 25 Dec 2024 13:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6EYOBH5FSfpKxd0H0ZUVjSKB1Jjlll3cbqhFQyJ7j80=; b=gvirCEIDa4RQ+Z0x
	ocfc6SuNK7QqDNcx72+ECp1Cd9pkIMVTGlfLXi74kHT57KWCKcjN2uXp3JSq8I8l
	Haat+Ke9GoslY7QArI0RgGHtu8s4ikKs10GRyVWpjXz5FZYLFlcRUvsCV/QrhbVd
	trxdIAX7JzXJRfmwazMniNz0IdEPmnt2Hw1+JClywnxACt+nwCIps6b6epgUIVPm
	Zyo9l1cuJeeWnvvG7uAKl9N6HNXwq7wFaFFNEub7c16/IZY2WUTgRGs2YT1bEV4k
	OMzOnxUU+tuC6+7FdOnozv4f08WfyRjCaKQTcNDEbrNHnqSgXT1Fj2YCMZcraunm
	+XmwGQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43r932jxjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 13:49:26 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPDnPOr003630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 13:49:25 GMT
Received: from [10.253.13.63] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 05:49:20 -0800
Message-ID: <7e2e56c4-7cb3-49b6-90ac-9a591a30944c@quicinc.com>
Date: Wed, 25 Dec 2024 21:49:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/5] dt-bindings: net: pcs: Add Ethernet PCS
 for Qualcomm IPQ9574 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Lunn
	<andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
	<linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_luoj@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <bartosz.golaszewski@linaro.org>, <vsmuthu@qti.qualcomm.com>,
        <john@phrozen.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241216-ipq_pcs_6-13_rc1-v3-0-3abefda0fc48@quicinc.com>
 <20241216-ipq_pcs_6-13_rc1-v3-1-3abefda0fc48@quicinc.com>
 <5aa571ca-fcd6-48ce-9f43-414035113d2c@kernel.org>
Content-Language: en-US
From: Lei Wei <quic_leiwei@quicinc.com>
In-Reply-To: <5aa571ca-fcd6-48ce-9f43-414035113d2c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vMtxEB7PieBa_IWJhVJcUTOpWB0f3XbL
X-Proofpoint-ORIG-GUID: vMtxEB7PieBa_IWJhVJcUTOpWB0f3XbL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412250122



On 12/22/2024 4:20 PM, Krzysztof Kozlowski wrote:
> On 16/12/2024 14:40, Lei Wei wrote:
>> The 'UNIPHY' PCS block in the IPQ9574 SoC includes PCS and SerDes
>> functions. It supports different interface modes to enable Ethernet
>> MAC connections to different types of external PHYs/switch. It includes
>> PCS functions for 1Gbps and 2.5Gbps interface modes and XPCS functions
>> for 10Gbps interface modes. There are three UNIPHY (PCS) instances
>> in IPQ9574 SoC which provide PCS/XPCS functions to the six Ethernet
>> ports.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
> 
> 
> Did you add here some properties as well after review was given? Can I
> trust this review tag to be matching what was reviewed?
> 

Yes, it exactly matches what you have reviewed. There are no further 
changes for dt-bindings after review tag was given.

> Best regards,
> Krzysztof


