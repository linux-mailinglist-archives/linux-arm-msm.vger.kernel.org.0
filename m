Return-Path: <linux-arm-msm+bounces-5066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8443881593D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Dec 2023 14:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40437284B07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Dec 2023 13:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A5D1D6A6;
	Sat, 16 Dec 2023 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OGlqfcXJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D445724B37;
	Sat, 16 Dec 2023 13:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BGDMSGj014399;
	Sat, 16 Dec 2023 13:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=uPCVVeSCgO1QdpCAfjeGPtohdqxeUiPo9vIMiGwQhWs=; b=OG
	lqfcXJc0TYhkFYL/5zC6SmGCNYI9w6+kmfeBHEF7OmtY1hc4ZsrhbwzbuCt3zhhe
	pCjPiJ4z2xlDtL9z8jTu50yyBnCE/yjUFCMCWnqtuN48m1BsjfHU0yAYeGmKpjPX
	f+bWQgN+RR0GatMdXSywzlr4/jFGNz2cDaNHfoVpn2PClTFatUodN7ZMZIAZkn9j
	00G/g/CuX976jDJW/e7ugEuMKzaQ2TfwQpOHrgr2xGEHLo4mNmnF5nSuqWSrMBPe
	prDpJ5XbAwCxcLlYH3Munv6m6i+AHo4nSvOwLJIPBOOrlcl0rmo/440uzTZb1DBW
	CRtSBdW11uV9CTyuDg6g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v151jgkj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 13:23:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BGDNYhA014031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 13:23:34 GMT
Received: from [10.253.9.247] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 16 Dec
 2023 05:23:29 -0800
Message-ID: <69178bc1-d682-4947-bfc5-bd3bb817e8aa@quicinc.com>
Date: Sat, 16 Dec 2023 21:23:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] dt-bindings: net: ipq4019-mdio: Document ipq5332
 platform
To: Andrew Lunn <andrew@lunn.ch>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <robert.marko@sartura.hr>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>
References: <20231214090304.16884-1-quic_luoj@quicinc.com>
 <20231214090304.16884-6-quic_luoj@quicinc.com>
 <1e4c55c8-8ed6-4f2e-8328-8a173f09b62f@linaro.org>
 <3c8e33b4-6ebc-476f-a00f-15cc8a1ad9e4@quicinc.com>
 <b89abf8c-57f8-46a6-a071-b1591340fbdf@linaro.org>
 <3de98516-9a28-4f58-8951-2a7752621fee@quicinc.com>
 <1fa2d219-63d7-45cf-9e05-b85dbce24076@linaro.org>
 <f16dfe78-2e31-45fb-b2fe-f72b7e6c51a5@quicinc.com>
 <6acecb29-2a6c-40af-a5a3-bec3e7286df7@linaro.org>
 <6e5b6ab5-fc89-4986-894a-62af08343859@quicinc.com>
 <83ea51ac-e976-44b6-ad5c-f11661646671@lunn.ch>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <83ea51ac-e976-44b6-ad5c-f11661646671@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 06cDCZ-XIz3U5gU7xSggbJlrQzqu0Yeo
X-Proofpoint-GUID: 06cDCZ-XIz3U5gU7xSggbJlrQzqu0Yeo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=852 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312160104



On 12/15/2023 9:34 PM, Andrew Lunn wrote:
>> These properties "reset-assert-us" and "reset-deassert-us" are the
>> general properties from mdio.yaml, which are used when the MDIO
>> bus driver is registered by the MDIO framework.
>> The general DT property already supports to do the correct config,
>> then compatible string is not needed to be checked for doing the
>> configs.
> 
> Given the complexity of your device, i doubt you can make it work
> without using a compatible containing the ID register values. That
> will get your driver loaded, and the probe method called which can
> then deal with all the clocks and resets in whatever way it wants.
> 
>      Andrew
> 

I misunderstood Krzysztof's suggestion in the previous message, i
thought the reset properties configuration is checked according
to the compatible string in the drive code.

Yes, these properties can be deduced from the compatible string in
the DT doc, i will update this in the next patch set.

Thanks for the comments and suggestion.

