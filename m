Return-Path: <linux-arm-msm+bounces-40636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC25A9E62BC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 01:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1717D1884EE2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 00:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B76247F4A;
	Fri,  6 Dec 2024 00:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WEEcZQ9P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCB8193;
	Fri,  6 Dec 2024 00:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733446727; cv=none; b=JLtQPEJ8v6P7bpz0Air2CQbLuEAFPDeSt7eXLnn7l24VRbT5G76hBOBGMYya0loOmFlxhlMjSXVH0tCJfX2ZzT7f8HTvbe9h6tbamiUGE9Wsd52nFZ8M7+ojY9v16Rhx8AtHPoWNVijlfdb/N0oumE1tUhU8KGEMdrvPfE1v+sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733446727; c=relaxed/simple;
	bh=LbVTTNf9deDecb9jxHiZ7X3/6utGjYJ2dpOMPg8rKec=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g8+PWLwta34iesL1WIU/I6bb8lkpoZqo/34LZ7RyIzKspcjz4iyvxlG11WRyudCIkeXd8QBQ9i77TbvpMSoXmqrt1OGCn9SHCZ/3YMNr6cRnu1bin0Q5viO/YDiaf2tjnNSyRTzJgPkEydlzevdxXjzFIB7sszTMoLKWMVSVg9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WEEcZQ9P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaLbR006904;
	Fri, 6 Dec 2024 00:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nlcCtZFcIuIC2GCOMVB7E7zkahROSsp0KC0iSEP4E5U=; b=WEEcZQ9PHOaTUP5B
	n2vCsunLjLIvayKIfokxCIFxbnOPameFNw3m7qLKIhe7CE3iaYgPwSHrNgdDAN5s
	lpcp3wK2+CqDDNiECOnwj7n8xn6NC30laYVXTPsvsvKsmCPQ+wwU4HhnpsqESoPo
	vuxyAZW/LrFRh5gUq8PvwugZz1ouPKbaBCgSY06qH89AJvMQ3PDe9hk3fJitMni2
	5844btik+avw1Bav5/cUOPC/rFhgHqVe3r/qv3xHvfWiMeu1O1+o06E3TXlA0FxK
	LtLI18Qjxc13F9oEKNc+is7mQzY5VTk43IFfd05ZTmIyAeKh49M+lGmxRw7yPkPa
	tyubdA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ben89aat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 00:58:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B60wdV4013982
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 00:58:39 GMT
Received: from [10.253.33.254] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 16:58:35 -0800
Message-ID: <323eee41-70f2-48f5-8705-a0d30666c1d3@quicinc.com>
Date: Fri, 6 Dec 2024 08:58:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300-ride: enable ethernet0
To: Andrew Lunn <andrew@lunn.ch>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
References: <20241123-dts_qcs8300-v4-0-b10b8ac634a9@quicinc.com>
 <20241123-dts_qcs8300-v4-2-b10b8ac634a9@quicinc.com>
 <cbd696c0-3b25-438b-a279-a4263308323a@lunn.ch>
 <14682c2b-c0bc-4347-bcf2-9e4b243969a7@oss.qualcomm.com>
 <4ecd23e2-0975-47cb-a1ea-ef0be25c93c6@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <4ecd23e2-0975-47cb-a1ea-ef0be25c93c6@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g1faQMUgjurLLQJQr8c2flsXYVVjb7A1
X-Proofpoint-GUID: g1faQMUgjurLLQJQr8c2flsXYVVjb7A1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=570 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060007



On 2024-12-06 07:39, Andrew Lunn wrote:
>>>> +&ethernet0 {
>>>> +	phy-mode = "2500base-x";
>>>> +	phy-handle = <&sgmii_phy0>;
>>>
>>> Nit picking, but your PHY clearly is not an SGMII PHY if it is using
>>> 2500base-x. I would call it just phy0, so avoiding using SGMII
>>> wrongly, which most vendors do use the name SGMII wrongly.
>>
>> Andrew, does that mean the rest of the patch looks ok?
>>
>> If so, I don't have any concerns either.
> 
> Yes, this is a minor problem, the rest looks O.K, so once this is
> fixed it can be merged.
> 
> 	Andrew


I will update the PHY name and pad the register in the next version.

-- 
Best Regards,
Yijie


