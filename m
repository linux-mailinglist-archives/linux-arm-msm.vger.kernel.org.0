Return-Path: <linux-arm-msm+bounces-23526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C969911C25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDC7D1C23BF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC52E1667F6;
	Fri, 21 Jun 2024 06:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bnI5rSav"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD01312BEBE;
	Fri, 21 Jun 2024 06:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718952895; cv=none; b=Irx3R6M4ekeCROSL+H9xPZDLJsgy31DTsQoXQt1WXZWIu2Ovj+iirQigMyHZaUf/ZauTZxfHsr3HdD5YiDc6snD/US50Ud2+XTwh5bdRVwMfuLnVSAQ5jCI7VFF+wV/irFntXZxf9qzgCAXdVI2ZDpOFubSIdMk67TMKTI0UNAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718952895; c=relaxed/simple;
	bh=maxy3h9/O6I3J6oAtvJphwdEDiKj1QlCCR8g1sEvtQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bjpSFy14T/JpFuweGSvx0h4LTGtfq29a8NSSshArOGDnbPCfufLR9IWktVLCjw4ZfYYqa4c24p8CyqTGIRxE+/6WwEnTyMNoevAufrFOaN7Jl/ZwM5LV8AnxA3rZxYqtPm/0uC1hDDU0S8S2q6X9xyr9fEu1u+PioSI5c35S/6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bnI5rSav; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L5S0v1030845;
	Fri, 21 Jun 2024 06:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nVLAeFDiyBN2iBcoy6VpATm3Sgv68qgJCHi0riVRTxk=; b=bnI5rSavBITxZWEH
	IcSVBF7gc+6L36OEIiRxAgfAvdwW8gjKonk4tb8lEsN3EUmAjxyBAEb8cfcMpCb7
	YnF2X3k7+7N9TxoTqrIoF9mCy4YnVl09coHgbzSCowWYZFKQMkcVIMliIXBS6I+3
	9ErD2IQgND8+cilEiWodZB/aGG8rAjN8h7msna1tTlQ7fxWnYX4Lw5h18wBQj9WG
	buYvb57XYVx18PALlvPQTOsWKuOR0aBy2RjCRfKG/BSkMl1P3f5vcftUR/El2Cic
	xpCtXdEzhO0NP5W5zUppoQ6S9NY9j1xYnA43uXWAsEWscvT4KE+z8eLu7kOC5ZVz
	ooBvHA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yw3d48ap0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 06:54:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45L6shLF001456
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 06:54:43 GMT
Received: from [10.253.9.185] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 23:54:36 -0700
Message-ID: <9c7522ae-a98e-4105-bc3b-76ca85f825f3@quicinc.com>
Date: Fri, 21 Jun 2024 14:54:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: phy: qcom,qmp-usb: fix spelling error
To: Krzysztof Kozlowski <krzk@kernel.org>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_tengfan@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_jiegan@quicinc.com>
CC: <kernel@quicinc.com>
References: <20240621061521.332567-1-quic_yijiyang@quicinc.com>
 <85bcaf30-3ffa-4bb4-bd38-0dd3c76b92f4@kernel.org>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <85bcaf30-3ffa-4bb4-bd38-0dd3c76b92f4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KI6QdCGk5y4EaaJF9aMT8KlFRqcswMz8
X-Proofpoint-ORIG-GUID: KI6QdCGk5y4EaaJF9aMT8KlFRqcswMz8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_01,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 mlxscore=0 adultscore=0 mlxlogscore=620 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210050



On 2024-06-21 14:28, Krzysztof Kozlowski wrote:
> On 21/06/2024 08:15, YijieYang wrote:
>> From: Yijie Yang <quic_yijiyang@quicinc.com>
>>
>> Correct the spelling error, changing 'com' to 'qcom'.
> 
> Please provide Fixes and Cc-stable tags (see stable kernel rules).
> 
> Best regards,
> Krzysztof
> 
Apologies for forgetting that.

