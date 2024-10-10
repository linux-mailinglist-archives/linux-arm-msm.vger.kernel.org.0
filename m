Return-Path: <linux-arm-msm+bounces-33842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B56A998351
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 12:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7F8E1F2287A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE901BF7E7;
	Thu, 10 Oct 2024 10:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n80285aQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A0C18C03D;
	Thu, 10 Oct 2024 10:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728555275; cv=none; b=j7D80a0JJcccr2Pl0agU+7kqDLZH/tIFY0HzJNAg6kLNLDzEqrkiBNKZWq6u0G7jni0ogMcjNYWBomdxqJtpIzOBlyTFaC6xdAoAqXeLaZgcy/I8Khw0WciqZPlOBv6s8ZlRvTjkSmU+23/uO947B3M/i3kngPYyJCzC4VbpcZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728555275; c=relaxed/simple;
	bh=MrI7UO9DkNILrgrGDxPJFW3FSW9WF1yU5y98aHjfB9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UJi6VttoWMXw0zXrBcLjOdpeNLKRBKPXu/BqYfjWF6cpZ7/fa8PrdBCmKurlJbRPGMpKu/hEmn+FHgiaSNiVAAZk9htur0ombcjv2HK/xPfNDys/zeE79JMrqGEAG4C6Gnh4fholD3wm76FTeU38TRVe9niF/nNUP6mKQdOv7mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n80285aQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1bLcD023702;
	Thu, 10 Oct 2024 10:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OM06fI4SwiEmMbVmLrFK9GDPa/CstAMR3gUBg0vz79Q=; b=n80285aQdJnkAKZL
	5GMTU2qvXkYA+qmS1u8mlgPl6hbIBfhzc3jm82073rr3gINzF4e6k3kpONmUz/TP
	SPU0pnAx+J+xOktEmDe/vcVEHHLsBQz6eeM3rWLq2wkFjlxgBOFDJnIH0gc8iW5e
	22uT11+zKjhbYKQ8oSg6DNzMqdwU25n+Ot4hUxi/9rMTjOah/M3cE3fHhv74Qvhv
	d7GyWFApmVoK9FqOr/Pu/EamiG2THk8JfkJpHFGzgIjMd14LqgK46ob3+P4SUNca
	aP7HueTsdiRa11n3wgoDgdAKaL8ym69P9F4EhzIEDr7w1Ka5LPhcz8+P3WLuIz54
	4miyIg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424ndyh21r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 10:14:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AAEScq005747
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 10:14:28 GMT
Received: from [10.253.78.114] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Oct
 2024 03:14:24 -0700
Message-ID: <bd209e3c-41b5-4e70-ad15-b3f2ff265afb@quicinc.com>
Date: Thu, 10 Oct 2024 18:14:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: move common parts for qcs8300-ride
 variants into a .dtsi
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>
References: <20241010-dts_qcs8300-v1-0-bf5acf05830b@quicinc.com>
 <20241010-dts_qcs8300-v1-4-bf5acf05830b@quicinc.com>
 <75vxiq4n2tdx3ssmnbq7qpp2ujtzjs4bkgpkpsi623fs3mpslx@ijmaos2gg5ps>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <75vxiq4n2tdx3ssmnbq7qpp2ujtzjs4bkgpkpsi623fs3mpslx@ijmaos2gg5ps>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TmYmN6RgKUPYTndxeSdPKTmNcd4aObyj
X-Proofpoint-ORIG-GUID: TmYmN6RgKUPYTndxeSdPKTmNcd4aObyj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=949 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100067



On 2024-10-10 14:18, Krzysztof Kozlowski wrote:
> On Thu, Oct 10, 2024 at 10:57:18AM +0800, Yijie Yang wrote:
>> In order to support multiple revisions of the qcs8300-ride board, create
>> a .dtsi containing the common parts and split out the ethernet bits into
>> the actual board file as they will change in revision 2.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts  | 373 +----------------------------
>>   arch/arm64/boot/dts/qcom/qcs8300-ride.dtsi | 364 ++++++++++++++++++++++++++++
> 
> This is tricky to review. Use proper -M/-B/-C arguments for
> format-patch, so the rename will be detected.
> 
> You basically renamed entire file!

Sure, I'll handle the optimization of that.

> 
> Best regards,
> Krzysztof
> 


