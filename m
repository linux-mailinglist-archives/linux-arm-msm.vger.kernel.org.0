Return-Path: <linux-arm-msm+bounces-44758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B90B6A09660
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 16:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 449C818840FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 15:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8EC212B36;
	Fri, 10 Jan 2025 15:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Rz/9sZ8b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C0221170D;
	Fri, 10 Jan 2025 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524093; cv=none; b=sQatOijsUzXx3iYLnVglnSJxQDAxKy+N4ceNNpcLSf9YCuUJw8Qym6ybcBDio/Q1cJceTIGrovu8RnhMokwe1T18Jrt6JKzU56M2CI6LUd6R4C/amGizO2P/TNx5yYJ6wXEIz4e+kTWGfND5rRbMNHRZhQMs2GcVvS0dQkvrBvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524093; c=relaxed/simple;
	bh=Jr7VyUoIkNG6d6YfdaHSLfBibIZqC8OHDL6BhW1ySfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sI9mphXbNn6MaP1IypSFdPIIbCqnCROSpOWRdl60H9azc9iNjHq8TTYPUmNAhBJygVRTlPBYfeR1hfxO25BLqW4kcEls549FQhwn7ST/TTefpvF+ELnYDMsFl1XV3oYndjTy6N+oJ31yHT6ycKJO5MK2YgScXhlB/Xlx2BIVNdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Rz/9sZ8b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A7olJV012118;
	Fri, 10 Jan 2025 15:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZH7NsnaYQIW3uhD4vIZYW7ne4Qj4WFMGNxG1ZfvEkA0=; b=Rz/9sZ8bLsPm/Mlc
	rMH6+rA1TL9WorOU4fxoEwi3arfsQ9REqvD/W5EmGVaCtSF7O29lo0f7Sx9lwDtb
	hflo76Y6gbQW2bzBfCgVl/DEwImkUzorHNIjD2q74a0t5P74sc++dwCCpYvGTDxx
	g0KrkBikd+jinAFp8WeTpmbcbAqau1rqO9lkJP+yX9e1VCYOSdib6DwBOP0t1xi/
	+iRvzn7WseJrvhVc1VpQaDOfXVOC7kKTBCItUc0ai0ABlFNtACKsIEWvscIdARLf
	SUl1ot8KXOA/w7uTQgSpiUdKKh5H8nhu40APEpdoXJhc+z34nyWnQ64WpihchUwH
	IMcCOw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442yh3had4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 15:47:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50AFlvjM002538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 15:47:57 GMT
Received: from [10.253.12.10] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 Jan
 2025 07:47:51 -0800
Message-ID: <800001ff-7fb6-46ad-b4a0-9b7b4a6ba977@quicinc.com>
Date: Fri, 10 Jan 2025 23:47:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 01/14] dt-bindings: net: Add PPE for Qualcomm
 IPQ9574 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
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
 <20250108-qcom_ipq_ppe-v2-1-7394dbda7199@quicinc.com>
 <s7z6d6mza3a6bzmokwnuszpgkjqh2gnnxowdqklewzswogaapn@rhb5uhes7gbw>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <s7z6d6mza3a6bzmokwnuszpgkjqh2gnnxowdqklewzswogaapn@rhb5uhes7gbw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1jDwvpzfPFOwTHI6_vwQpNr1Mk-yCQxw
X-Proofpoint-GUID: 1jDwvpzfPFOwTHI6_vwQpNr1Mk-yCQxw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 mlxlogscore=720 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100123



On 1/9/2025 5:15 PM, Krzysztof Kozlowski wrote:
> On Wed, Jan 08, 2025 at 09:47:08PM +0800, Luo Jie wrote:
>> +    required:
>> +      - clocks
>> +      - clock-names
>> +      - resets
>> +      - interrupts
>> +      - interrupt-names
>> +
>> +  ethernet-ports:
> 
> This device really looks like DSA or other ethernet switch, so I would
> really expect proper $ref in top-level.

Sure, agree that the PPE is better modeled as an Ethernet switch. I will
add and use the $ref ethernet-switch.yaml in the top-level.

> 
>> +    type: object
>> +    additionalProperties: false
>> +    properties:
>> +      '#address-cells':
>> +        const: 1
>> +      '#size-cells':
>> +        const: 0
>> +
>> +    patternProperties:
>> +      "^port@[1-6]$":
>> +        type: object
>> +        $ref: ethernet-controller.yaml#
> 
> Everything here is duplicating DSA or ethernet-switch, so that's
> surprising.

I will remove the current 'ethernet-ports' node and the "$ref: ethernet-
controller.yaml#" from the port node. As the top-level $ref, will use 
ethernet-switch.yaml instead.

The PPE Ethernet port node requires the additional DT properties clocks
and resets, which will be added into the switch port node. Thanks.

> 
>> +        unevaluatedProperties: false
>> +        description:
>> +          PPE port that includes the MAC used to connect the external
>> +          switch or PHY via the PCS.
> 
> Best regards,
> Krzysztof
> 


