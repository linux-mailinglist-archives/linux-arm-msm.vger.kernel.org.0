Return-Path: <linux-arm-msm+bounces-49473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 348A2A45C2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 11:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36A41174B82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 10:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747D524DFFC;
	Wed, 26 Feb 2025 10:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SLdBizUe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D159820E70A;
	Wed, 26 Feb 2025 10:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740567154; cv=none; b=T8U/p/URHEElOy6DJ7kxqXBa38S0ZzwrKOq2kjg4OuDXV/1X9YEG1IhaR1xUITdQIRWdans7oQcZ4rWhoptomXw1wg/ewdlYg4a4jhwTafXNfZZY51W0JfrDQ04SgzgyHRCWcP/1UT9xxTrhiL2RUfjL3dY/vgdIwDuQRzjGHhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740567154; c=relaxed/simple;
	bh=GrJZKd2MQ96n7PgPlTBv/iNTdueTemS4/Ycl8g0CfrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WZ63WhoxQshYRwuzwMV/aV8iJNvW4JURHwdOLMX4q95WcjPiJtKFbI/rTROaJ1XF/F2DHGHcyBlek9nAaFuKaP7ADEteIR0nXAxLiT1q0qnvM1MATKOhZiSgcNEOlX4rKbmh4UHzTVSSXrfVox6Kp/woy4J8HJMrKnVx2wkNXkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SLdBizUe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q9upG4012966;
	Wed, 26 Feb 2025 10:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUztjXD5+5m/s1FCP530wFC3zgs4wmP0Xguy/Fjus5A=; b=SLdBizUeOh2hJlsX
	4xcu8JMy7R3N22UZFTiJDqpHWQI9NfHGPHY2QFtYYDktpaLpJoF8NINnSFnmq/lk
	MlDP2CDgHKJnxMp95ExzB5v5M18+o9GXoztucfPhYs4Dk/2XDCW8L8GKTLEyhpkI
	c//qYwuqfyuOpqdr8l5nQYGf1rrEMeMGjCq7nNJI3ePaMha0RGqSRRN7ti4a/9W5
	E4bb1B8P1dK1qYE4H9Wk4BX0l+AToupG7OklMwp2h7NVX0JH70W4PDUtzWQTTG1X
	xTA/XVj42wM+TlxNMJI//NHAEyNoU3pONyjZ34crdHuGVPgx3P4FLGyr7LaDCWje
	XMmCdg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk1pb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 10:52:22 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QAqLJ4022893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 10:52:21 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 02:52:14 -0800
Message-ID: <593e1777-a033-4922-93c4-c056e6b9bf4c@quicinc.com>
Date: Wed, 26 Feb 2025 18:52:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: Add Coresight device Trace NOC
 definition
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
 <20250221-trace-noc-driver-v1-1-0a23fc643217@quicinc.com>
 <edfd6c6a-65d2-42f1-8225-0808359dd375@kernel.org>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <edfd6c6a-65d2-42f1-8225-0808359dd375@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hQCCYVakcTyKxFSaQTAjeLYp6z8GsEc8
X-Proofpoint-ORIG-GUID: hQCCYVakcTyKxFSaQTAjeLYp6z8GsEc8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=973 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260086



On 2/22/2025 6:47 PM, Krzysztof Kozlowski wrote:
> On 21/02/2025 08:40, Yuanfang Zhang wrote:
>> Adds new coresight-tnoc.yaml file describing the bindings required
>> to define Trace NOC in the device trees.
>>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> 
> 
> So you just sent the same v1, ignoring previous review. That's not how
> it works.
> 
sorry for this incorrect process. because i just update --to-cc list and no other
change, i forced the version to V1, hoped it would work like resend,
but the result was not as expected.

> Provide proper changelog, implement ENTIRE feedback and do no ask
> maintainers do point the same issues TWICE.
> 
> NAK
> 
> <form letter>
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
> 
> Thank you.
> </form letter>
> 
> Best regards,
> Krzysztof
> 


