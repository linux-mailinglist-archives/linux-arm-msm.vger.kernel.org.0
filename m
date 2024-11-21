Return-Path: <linux-arm-msm+bounces-38643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 717C59D4A27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 10:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 227971F21EC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 09:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEE31CDFCF;
	Thu, 21 Nov 2024 09:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="feXS4hwo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F581CBEB9;
	Thu, 21 Nov 2024 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732182306; cv=none; b=uJclghAbkfKNKLHw+IdnD1MLui/EXYg0Z9NOAnN4WGXfVUOrAdH7N/lOPBL2Ga2+ijFopGayKpaQuvmulTBHNOv6f81AUX1dOpxqEPRYgkX5G8qpvBMehsKI9a4MpQA9DtyOCXHgiWTxJPvs+2RZfgGRwukCpL00+W0sTNY9osc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732182306; c=relaxed/simple;
	bh=QOEVQi+TNdP1oPgYqUkUPIM7MuxvX0efxO0FCUNxvcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oaxbPf7yORJFtjlGq16ypnkJuNYyEZS7RrkUmYAL2s4hoDwRoJZn/FBzHdMdBjCrt1wvE4OgjHkOQCYKDwEKpMZ/3vjRpUXJAhTfAed8bUOVnDB+otLvdI1nmVfYJwQxqPvqDwftHYXaN84A25age2tCxaGZXGxHxcSiOGQJU/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=feXS4hwo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL8u07Z019458;
	Thu, 21 Nov 2024 09:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xL0klXRBZ0Z8VmuI3wtV5WbrCGldzWOykFbQCtxGzDw=; b=feXS4hwoWnwFjWFH
	t2Fto9n0Oa9h/94KaB2Ore7UdR+wt2gt3d9OsErkg1TLtYeLdzJbSJgGBlLwe3Kf
	rFpKaAou+Z/OoxLZSekLDPxLdoooSrwzIh8kJI76GdZFljsNd6EF5Sj586DcpQNH
	UDoR4C5OwDRtK5efMI48PsUhN0Nv5c/LA+BcpeEAQGXEbRZClJa0C1I0FblYYnYk
	j1RL7wLSUQpeiipN6S9pmVWOE3L9thD1hdNcP4CZuOgCfHXmFzpC3SuwpoY/bKDu
	WedhUP4ZCkJHtQr6kqr9rnN/GwZaHTtR/m/mq7ch5DY0rQOWGtc+savJN04ZbUNQ
	VB9r8g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431c7hknsy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 09:45:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL9j1NP003825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 09:45:01 GMT
Received: from [10.64.68.72] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 01:44:51 -0800
Message-ID: <64ec97a7-8e91-44d7-85ff-8b00304214fc@quicinc.com>
Date: Thu, 21 Nov 2024 17:44:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs8300-ride: Add watchdog node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_jiegan@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_tingweiz@quicinc.com>
References: <20241119102315.3167607-1-quic_liuxin@quicinc.com>
 <20241119102315.3167607-4-quic_liuxin@quicinc.com>
 <5d670f55-1ebe-4034-a6a5-e68417c6e486@kernel.org>
From: Xin Liu <quic_liuxin@quicinc.com>
In-Reply-To: <5d670f55-1ebe-4034-a6a5-e68417c6e486@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xeHFldApzNmuQXSaZEgkqP1bosRZ3TBr
X-Proofpoint-GUID: xeHFldApzNmuQXSaZEgkqP1bosRZ3TBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210075



在 2024/11/21 0:59, Krzysztof Kozlowski 写道:
> On 19/11/2024 11:23, Xin Liu wrote:
>> Add watchdog clock on the Qualcomm QCS8300 Ride platform.
>>
>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> index 7eed19a694c3..3024338bcfbc 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> @@ -265,3 +265,7 @@ &ufs_mem_phy {
>>   	vdda-pll-supply = <&vreg_l5a>;
>>   	status = "okay";
>>   };
>> +
>> +&watchdog {
>> +    clocks = <&sleep_clk>;
>> +};
>> \ No newline at end of file
> 
> Look, your patches have errors...
> 
This is the information when I apply my patch.
../linux-next$ git am ./wdt/test.patch
Applying: arm64: dts: qcom: qcs8300-ride: Add watchdog node
../linux-next$

There are no error messages here.
> 
> Best regards,
> Krzysztof


