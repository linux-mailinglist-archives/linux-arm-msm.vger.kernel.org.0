Return-Path: <linux-arm-msm+bounces-42297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9579F2A84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 07:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33157161A7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 06:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CD91CCEEC;
	Mon, 16 Dec 2024 06:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ENDV3yax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC8AA48;
	Mon, 16 Dec 2024 06:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734332195; cv=none; b=jow46FZsY5liJVjWFnWLL8NL1Vwo8BtdlqUnxqHLxPhBOL5YM18w1s17iB7UT3J6ZN4h+Z6Dkn3d5TgrmfPzpouXuBukT7hkhYNKWy8ouge+yBvv3eRQo4CE33HBXw1a8pUhLqsraJadXeLgn5Bahxw4idsQcJwrn0ZsR/Xhbec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734332195; c=relaxed/simple;
	bh=ftskE+QtxDhlmcORVXwP+OJcZHGw9a86/SPZCHQE+gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NlNbeG2hIDZ9ab0X/GJitLQITuVYpiiVXNMuv4D3icIBa9+GLDyyGfpbWbwJ4plpCtm8bXBNGVa8ujm2KdSOZ6r//aDIKM/E8gdSZAsKSLOMGTt9EHz92HHdYcPi3I64zM1QXMJd/Xnt77uaFiVf6CQYjN1Y+JARQeMUrTKchSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ENDV3yax; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BFN9s6D029690;
	Mon, 16 Dec 2024 06:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fzDziw1L8O2yPx8vToygw0npA8B/Iof32Zl5VGQUkO0=; b=ENDV3yaxnqMKGnHZ
	ZnTVGpGERANwsFRu79rEgJU6CdCzhw6tfoNKx3koGX1Bdz21dWTax6HhgMynLWRm
	w1dM/ocvfFBq+hcAgOGlvpWvGb+MEBUF7VZa7pmxi3IpNNGpEGj5YwD9lo0xtBWK
	RyIjPfNUrp1GAsauyF4hXFnhB6ZjGUvxiRJoTZiy8Jvw5sKxEQKmdMu72d/fYmIX
	nPQPLERF4BzKZ10lQkDGexD4XP1bYnc2ip/so5l7YloJDk8pwLOAJV7PSYIoe0UA
	hYtSRjYehEzlcgYEgjoKIxAOhMyCT5In7QqAbVmx6NQnTj5mtYMinXyf5+qZO5wj
	LNlooA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43hyy61j2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 06:56:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BG6uP3R028322
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 06:56:25 GMT
Received: from [10.253.15.72] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 15 Dec
 2024 22:56:21 -0800
Message-ID: <581776bc-f3bc-44c1-b7c0-4c2e637fcd67@quicinc.com>
Date: Mon, 16 Dec 2024 14:56:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
To: Andrew Lunn <andrew@lunn.ch>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
References: <ececbbe1-07b3-4050-b3a4-3de9451ac7d7@lunn.ch>
 <89a4f120-6cfd-416d-ab55-f0bdf069d9ce@quicinc.com>
 <c2800557-225d-4fbd-83ee-d4b72eb587ce@oss.qualcomm.com>
 <3c69423e-ba80-487f-b585-1e4ffb4137b6@lunn.ch>
 <2556b02c-f884-40c2-a0d4-0c87da6e5332@quicinc.com>
 <75fb42cc-1cc5-4dd3-924c-e6fda4061f03@quicinc.com>
 <4a6a6697-a476-40f4-b700-09ef18e4ba22@lunn.ch>
 <441f37f5-3c33-4c62-b3fe-728b43669e29@quicinc.com>
 <4287c838-35b2-45bb-b4a2-e128b55ddbaf@lunn.ch>
 <2e518360-be24-45d8-914d-1045c6771620@quicinc.com>
 <31a87bd9-4ffb-4d5a-a77b-7411234f1a03@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <31a87bd9-4ffb-4d5a-a77b-7411234f1a03@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: p7cRialJIJztNMiDYk7O9cRK4dw7Z5BK
X-Proofpoint-ORIG-GUID: p7cRialJIJztNMiDYk7O9cRK4dw7Z5BK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160056



On 2024-12-10 12:09, Andrew Lunn wrote:
>> As previously mentioned, using 'rgmii' will enable EMAC to provide the delay
>> while disabling the delay for EPHY. So there's won't be double delay.
>>
>> Additionally, the current implementation of the QCOM driver code exclusively
>> supports this mode, with the entire initialization sequence of EMAC designed
>> and fixed for this specific mode.
> 
> OK. If it is impossible to disable these delays, you need to validate
> phy-mode. Only rgmii-id is allowed. Anybody trying to build a board
> using extra long clock lines is out of luck. It does not happen very
> often, but there are a small number of boards which do this, and the
> definitions of phy-mode are designed to support them.
> 
>> I'm not sure if there's a disagreement about the definition or a
>> misunderstanding with other vendors. From my understanding, 'rgmii' should
>> not imply that the delay must be provided by the board, based on both the
>> definition in the dt-binding file and the implementations by other EMAC
>> vendors. Most EMAC drivers provide the delay in this mode.
> 
> Nope. You are wrong. I've been enforcing this meaning for maybe the
> last 10 years. You can go search the email archive for netdev. Before
> that, we had a bit of a mess, developers were getting it wrong, and
> reviewing was not as good. And i don't review everything, so some bad
> code does get passed me every so often, e.g. if found out today that
> TI AM62 got this wrong, they hard code TX delays in the MAC, and DT
> developers have been using rgmii-rxid, not rgmii-id, and the MAC
> driver is missing the mask operation before calling phy_connect.
> 
>> I confirmed that there is no delay on the qcs615-ride board., and the QCOM
>> EMAC driver will adds the delay by shifting the clock after receiving
>> PHY_INTERFACE_MODE_RGMII.
> 
> Which is wrong. Because you cannot disable the delay,
> PHY_INTERFACE_MODE_RGMII should return in EINVAL, or maybe
> EOPNOTSUPP. Your hardware only supports PHY_INTERFACE_MODE_RGMII_ID,
> and you need to mask what you pass to phylib/phylink to make it clear
> the MAC has added the delays.
> 
> 	Andrew
I intend to follow these steps. Could you please check if they are correct?
1. Add a new flag in DTS to inform the MAC driver to include the delay 
when configured with 'rgmii-id'. Without this flag, the MAC driver will 
not be aware of the need for the delay.
2. In the driver, if this flag is set to true, change the phy_mode to 
PHY_INTERFACE_MODE_RGMII to instruct the PHY not to add the delay.

-- 
Best Regards,
Yijie


