Return-Path: <linux-arm-msm+bounces-39013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 227329D7A65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 04:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4D35280C2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 03:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7767F33997;
	Mon, 25 Nov 2024 03:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ewQCK+I5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AAB2500AC;
	Mon, 25 Nov 2024 03:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732505970; cv=none; b=USbBXkV9vdaRZ+geshADWpfj4U7zrmFuvXtyhOaUPnML85NXBV2Uc4NtEGVSrkpOCB4M9UXKo0tXz/KckBKjffsw4DmU+vD2uqG9IGGRVspvw1MLNSjSDf/FLZRvgiCvOcZEoPaNqIh+mfSEO1+Xw1xov+KWJWi+OsAmDdjqsZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732505970; c=relaxed/simple;
	bh=o6AyubdLIxQFozXKJeWNwpcy8swQeM0jUZLQcwZJbyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RKagT+WSgaaRDUoYwRc3gk4OPoavcwQrja8Qa4aURCvK+m5oq04u+ntH/QTIWzYHNX5m9b8iQ/ip4wxPWDm07B5vEkXWifH9L8ZCNgvV4/Jq4in1nh7G+H7+wEz/RAMFWCMgP7NNSL489frniUxAVRZ+cH0M/xFTlx4l5BnXY18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ewQCK+I5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AONDdaD019777;
	Mon, 25 Nov 2024 03:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W5KC879pXDmQjk3e/MYMpCbKJ6xkp7D507cwCO4aQRQ=; b=ewQCK+I5RP0HAPhx
	pgRfxTQx3x0S45UIAwT2Dx7Gl0pjpjqKDU76sEvmDWdB8dEAqkvG53P/rnR8C7Pb
	fipQTmI7rmOgqoPsBH2nmS8/3G/Qz+GjQX0Zb90v601oga+manX8VbcWZTB4398a
	tzBxrfrYKU4cOMyRkDHjJxpUxv79fX9vYTPblbtGwYMDDdD7R+VSYvGRFBwIAkmY
	ExIYwJ/3tHOH6m9QD3Oyb0j9/d7WcAiqH0gcc/bfKWJuZgFfc+sdAqHVHKWWaJ0q
	WUObrTOfKSBQ1C4dCeSc9muLYbfoPYeLul1YDi0+32Nv4uZRkb2A7ye23r9CAST5
	D87y6Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4336mxb9mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 03:39:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP3dKMx006338
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 03:39:20 GMT
Received: from [10.253.38.8] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 24 Nov
 2024 19:39:16 -0800
Message-ID: <21ee5ff4-9355-44aa-b6f7-afbc044f9ec8@quicinc.com>
Date: Mon, 25 Nov 2024 11:39:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300-ride: enable ethernet0
To: Andrew Lunn <andrew@lunn.ch>
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
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <cbd696c0-3b25-438b-a279-a4263308323a@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uEmU1Dku6UaT0b39yLYCJAjX4uLQQA29
X-Proofpoint-GUID: uEmU1Dku6UaT0b39yLYCJAjX4uLQQA29
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 adultscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=804 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250029



On 2024-11-24 03:41, Andrew Lunn wrote:
> On Sat, Nov 23, 2024 at 04:51:54PM +0800, Yijie Yang wrote:
>> Enable the SerDes PHY on qcs8300-ride. Add the MDC and MDIO pin functions
>> for ethernet0 on qcs8300-ride. Enable the ethernet port on qcs8300-ride.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 112 ++++++++++++++++++++++++++++++
>>   1 file changed, 112 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> index 7eed19a694c39dbe791afb6a991db65acb37e597..af7be26828524cc28299e219c1f0ad459e1c543d 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> @@ -210,6 +210,95 @@ vreg_l9c: ldo9 {
>>   	};
>>   };
>>   
>> +&ethernet0 {
>> +	phy-mode = "2500base-x";
>> +	phy-handle = <&sgmii_phy0>;
> 
> Nit picking, but your PHY clearly is not an SGMII PHY if it is using
> 2500base-x. I would call it just phy0, so avoiding using SGMII
> wrongly, which most vendors do use the name SGMII wrongly.

You're right, that's really confusing here. I'll fix it.

> 
> 	Andrew

-- 
Best Regards,
Yijie


