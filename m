Return-Path: <linux-arm-msm+bounces-38299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FBA9D2335
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 11:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B711D1F21C1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 10:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263031C1F0D;
	Tue, 19 Nov 2024 10:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o5DQ8rGv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A849D13E8AE;
	Tue, 19 Nov 2024 10:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732011407; cv=none; b=DHg8SRCu7F5xcTFOLLqBlPNfVp524mkX0bZjHJHHbJGFKsr8E56mcwB+q/w/4spTA1rSruJNrTqv5wRVRXcUdZVsSZYH1+7Kzi6hnNAFqyQ8dJ4oHWdaFzHgKja1OmINChPKAfPdu/bHceT72fjaKl/AQkx38JXQDUNE1aJc56s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732011407; c=relaxed/simple;
	bh=/S1IvdGPfaEp3Tl8WgK+c/HjYXgRA2kI+av/O0p11CA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZM+pd3XMdlf1Fi0VEuHmlQxxRsdkcGrtk/rQwjRwjg6PPPSAmTsdtwkuvsrkfGAOZJrl/2Rvu9EIt5QeiJ4OSbzgBVpdPvqukCUajwEuYuFhPrNzCQV0dpJ5CCkz+zdDm7FmGm7YrEx3XhqoiGz/ATrOBnCr+LOOBZAG45YlJGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o5DQ8rGv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7Ropr022362;
	Tue, 19 Nov 2024 10:16:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9r3NlIB/GzccOiy9Na3f2+gL+oLJb01vUF/iOpZnXYI=; b=o5DQ8rGvkyvjCR4o
	m7Yj92gJ2tXrR8yRZC2T/i66BpOYpONwRz4jhMiW9uR76zS0kweK7TIyw2yyLgfu
	GAqP763e2xWHBvOq2lISCN3A7RdesYiyVa1A8/ZUR92rotXc68Y2lLNLq1vDafWs
	Eydqa0tFklsvwsBdI4XLKr+t8TpUapP9B6T0HSK2XhWT9rBg5XaUxrs3aV9vTE/k
	F4t3d7bc4Jzywmrs7NiwmyWlr0xLKM7xNYHmUq7bpSokWNDbDMmcBuFFNtIwVVVF
	SNYC6vRUx87EHtD1LBpi2EXoMO7UOqeymuHeecdqoOSkg0JS9xRD1XSni3iRO5lc
	1zUf9g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y625p5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 10:16:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJAGgCU008472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 10:16:42 GMT
Received: from [10.216.37.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 19 Nov
 2024 02:16:31 -0800
Message-ID: <633154e0-6f87-4c02-892b-0b0c8796a6db@quicinc.com>
Date: Tue, 19 Nov 2024 15:46:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Enable Primary USB controller on
 QCS615 Ride
To: Song Xue <quic_songxue@quicinc.com>
CC: <linux-kernel@vger.kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        <devicetree@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>
References: <20241119052854.995691-1-quic_kriskura@quicinc.com>
 <20241119052854.995691-3-quic_kriskura@quicinc.com>
 <cc57833c-13ca-48ae-a6d9-c7fdc545743f@quicinc.com>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <cc57833c-13ca-48ae-a6d9-c7fdc545743f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oN-PDfC7H0aaj45lIdsh7HlFYXaHwLXX
X-Proofpoint-ORIG-GUID: oN-PDfC7H0aaj45lIdsh7HlFYXaHwLXX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=882 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190073



On 11/19/2024 2:51 PM, Song Xue wrote:
> 
> 
> On 11/19/2024 1:28 PM, Krishna Kurapati wrote:
>> Enable primary USB controller on QCS615 Ride platform. The primary USB
>> controller is made "peripheral", as this is intended to be connected to
>> a host for debugging use cases.
>>
>> For using the controller in host mode, changing the dr_mode and adding
>> appropriate pinctrl nodes to provide vbus would be sufficient.
>>
>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts 
>> b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index ee6cab3924a6..b647c87b030b 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -214,6 +214,29 @@ &uart0 {
>>       status = "okay";
>>   };
>> +&usb_1_hsphy {
>> +    vdd-supply = <&vreg_l5a>;
>> +    vdda-pll-supply = <&vreg_l2a>;
>> +    vdda-phy-dpdm-supply = <&vreg_l13a>;
>> +
>> +    status = "okay";
>> +};
>> +
>  From schematic, we need use the "vreg_l12a" for vdda-pll-supply.
> 
>  From bindings, we also can see need 1.8V(VREG_L12A_1P8) not 
> 2.9V(VREG_L2A_2P96):
> 
> 62vdda-pll-supply:
> 63     description:
> 64       Phandle to 1.8V regulator supply to PHY refclk pll block.
> 

Thanks for pointing it out. It is supposed to be L12. Will fix up in v2.

>> +&usb_qmpphy {
>> +    vdda-phy-supply = <&vreg_l5a>;
>> +    vdda-pll-supply = <&vreg_l12a>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&usb_1 {
>> +    status = "okay";
>> +};
>> +
>> +&usb_1_dwc3 {
>> +    dr_mode = "peripheral";
>> +};
>> +
>>   &watchdog {
>>       clocks = <&sleep_clk>;
>>   };
> Thanks,
> Song

