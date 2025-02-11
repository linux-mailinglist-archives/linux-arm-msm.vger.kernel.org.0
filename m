Return-Path: <linux-arm-msm+bounces-47505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D91A3015A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 03:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A0E03A5EE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 02:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833C42AE6A;
	Tue, 11 Feb 2025 02:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="koieKIXH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49A063A9;
	Tue, 11 Feb 2025 02:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739240119; cv=none; b=jymkmbMjaXx1pZyrC+6A0Z0HH0NMO9qmJ3J2iyC+gNw+XRKoL9KLvtAxpyXW8Ea7uDt5NPfXqZdFNxDsZceUo3/92eEP0GUWZvkLu3qeLFrjpFX95mdGbLAtjfrKHA/FsybbgBHwCNLPlXlLACb5hjMwT3EV1F7WoTqiiPGTuiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739240119; c=relaxed/simple;
	bh=TvjMqpoXYyel8WMKG2LoHHpTG3xRkqg+2TsfchDaZnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sasnfvpZze7z02bREN7J/6FG8cVm+7puY643oTP/LVAq79rw3N7NRORtAKaaKs0PW9wQ9GJAF/TEdzKr/f7ZYlBsRw33lZguz+Gojuy1l3xPjfjBR52zMUVvG/t2aooJOOA9A+3eu4UDzVr6roAcZ3h2+jXkQGHjOeJl5qkMZ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=koieKIXH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AK39Sp018199;
	Tue, 11 Feb 2025 02:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	30Rn7QhM1tQPQQ9WH4FbwPWMKd3IRZbkkYDlreV1How=; b=koieKIXH8FSo2+SK
	NApGXij7v7cQcPIEKzXVOaJeLodaqU78xWk6sdolNJG0dsFNKYOxQ5aJrlGaGAaZ
	4Vo2UFKFoe7Y/3Ohn4w0LMRhru9n2xBvtSbCcjZv0plZJ6A7odmInKLeJVtR6m0Z
	De8UOPtWTHIBkK7GwfxYVr6ZnfarIvYAt/wN4xIjFOAdEcv3OaRjt96ZDVJcVkOy
	exH3bRhDGRDF36S3ge5dRgFpFgNU+0o2HoXyoPEcteQmlivIQiLU5GsxXJPInc44
	XnJ3+tm7r/1+jSb+VmzCc6qzj3EqE5hW4NmVUdG7hzxDwwQHgbfvynarrKL15zv1
	123ssg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dxp8re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 02:14:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B2EeIS013108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 02:14:40 GMT
Received: from [10.253.11.86] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 18:14:33 -0800
Message-ID: <878b8237-7f37-4f98-8e3b-451eb5ab3283@quicinc.com>
Date: Tue, 11 Feb 2025 10:14:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if
 configured with rgmii-id
To: Andrew Lunn <andrew@lunn.ch>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
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
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul
	<vkoul@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
 <48ce7924-bbb7-4a0f-9f56-681c8b2a21bd@quicinc.com>
 <2bd19e9e-775d-41b0-99d4-accb9ae8262d@kernel.org>
 <71da0edf-9b2a-464e-8979-8e09f7828120@oss.qualcomm.com>
 <46423f11-9642-4239-af5d-3eb3b548b98c@quicinc.com>
 <60fecdb9-d039-4f76-a368-084664477160@oss.qualcomm.com>
 <f0e45ece-3242-4d8b-a2d1-fa1478f05005@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <f0e45ece-3242-4d8b-a2d1-fa1478f05005@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UjCwjgVR3lbjOfI-GM1hxBDzilseh77R
X-Proofpoint-ORIG-GUID: UjCwjgVR3lbjOfI-GM1hxBDzilseh77R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=723 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110011



On 2025-02-11 05:28, Andrew Lunn wrote:
>>> But what about the out-of-tree boards that Andrew mentioned? We need to ensure we don't break them, right?
>>
>> No. What's not on the list, doesn't exist
> 
> How i worded it was:
> 
>> We care less about out of tree boards, but we also don't needlessly
>> break them.
> 
> I guess if Qualcomm wants to break all its customers boards, that is
> up to Qualcomm. But we can also make it easier for Qualcomm customers
> to get off the vendor crap kernel and to mainline if we at least give
> them an easier migration path.

I understand the importance of not breaking customers' boards and will 
work on finding a better solution than the current one.
However, if no better solutions are found, we will consider dropping the 
compatibility.

> 
>       Andrew

-- 
Best Regards,
Yijie


