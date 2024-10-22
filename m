Return-Path: <linux-arm-msm+bounces-35364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2839A9CBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3AC4B21362
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B2515539D;
	Tue, 22 Oct 2024 08:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b0c4RS/x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F9727735;
	Tue, 22 Oct 2024 08:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729586062; cv=none; b=GgD+x5EGB/tihKD6eQ0PCpc9f6KqXVhpZb5SEqYLxras3OsEmeJsfkXhRKZ2VZt511ofXup66vZBuQ9o4SRpfK2MlGpRfnf+oVfWKPrD5T/I+d9ujDEreafzd9gj0d2rdjJlMYPFqhPpgILODtfxd3+Rj2hdAPjMbu2OR7DvmcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729586062; c=relaxed/simple;
	bh=Yfb1iWGUJXstlWNlobPLhmH6H2P371QRprH0i6HollY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=B0qDGyB19cTMtgp8xcvRR7u05o8im6VRnPHqtcXE11yqgYb6Dp874VYiiVf9r3Lt1KSTzUGL14PtcrLnP6y/jsvQQxT51M0ruShJvjdz80aD0u2mwm7GuBdBSgbbz8gBLK7Dx6EtxYxOJkFaQEZauk0N8mwXHCbl6Acrq7sB6iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b0c4RS/x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LM0pX8027018;
	Tue, 22 Oct 2024 08:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	54nng32DbGhXET0Bsu60daar/Um5vwD/G2DqIS75Lg8=; b=b0c4RS/xiCH96sYo
	XbR6PNVn6YF3qwCIJHClKvxUDUrmUUDpwNvq5dmUv+WBmlFmqeWIC66VRHe7HLHO
	CVwUgR5/IWHt9TeEfiVVR+rmJ5R/z29BZ62V6sy1qZscafrCrdqtxdACKysVRBDz
	b8E+evdGDx1NcTd8hUHPlcYcYXVWTwgvToVa2yB6lSCWWzve4qND22Xy7uJ3QTlY
	B5EUic1hGMljY10b+FGgPGp7Hofj8+mSwANpudci6Jucxy7apmQDJhOWqEBynEhM
	+9afXUE5af7TDsQwJaUSaHGw5jxAfNaN+bFXqObw8tBo3u6kkADq8tc7ecSY1XSg
	kzrxMQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6rj7h0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:34:15 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M8YDHk008794
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:34:13 GMT
Received: from [10.231.207.28] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 01:34:08 -0700
Message-ID: <d56b4e1f-ef5d-4626-8211-0cf957c8423f@quicinc.com>
Date: Tue, 22 Oct 2024 16:34:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: Adds SPMI bus, PMIC and
 peripherals
To: Krzysztof Kozlowski <krzk@kernel.org>, <quic_fenglinw@quicinc.com>,
        <quic_tingweiz@quicinc.com>, <kernel@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241014-adds-spmi-pmic-peripherals-for-qcs615-v1-1-8a3c67d894d8@quicinc.com>
 <354b544e-3799-4421-aeb3-8401dffb34d6@kernel.org>
Content-Language: en-US
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
In-Reply-To: <354b544e-3799-4421-aeb3-8401dffb34d6@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GidZGNKd9FlZJmXXbiT3bVdVLJUl-jzK
X-Proofpoint-ORIG-GUID: GidZGNKd9FlZJmXXbiT3bVdVLJUl-jzK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410220054



On 10/14/2024 6:45 PM, Krzysztof Kozlowski wrote:
> On 14/10/2024 12:08, Tingguo Cheng wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index 4ef969a6af150933c72a7a83374a5a2657eebc1b..b79c22730920e3097425e1d1933e744205b3c18e 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -6,6 +6,7 @@
>>   
>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>   #include "qcs615.dtsi"
>> +#include "qcs615-pmic.dtsi"
>>   / {
>>   	model = "Qualcomm Technologies, Inc. QCS615 Ride";
>>   	compatible = "qcom,qcs615-ride", "qcom,qcs615";
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index ac4c4c751da1fbb28865877555ba317677bc6bd2..9793161db515a2ef1df6465c8d0a04a11e71ffc1 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -517,6 +517,29 @@ sram@c3f0000 {
>>   			reg = <0x0 0x0c3f0000 0x0 0x400>;
>>   		};
>>   
>> +		spmi_bus: qcom,spmi@c440000 {
> 
> Please do not send your downstream code... Don't just copy and paste
> that stuff.
> 
> Rewrite it from scratch or use the upstream as template. I find it waste
> of time to comment or fix the same issue over and over again. The
> problem is the way you work - copying and sending downstream at us. This
> must stop.
We have realized the problem, and we will be more careful.For the 
current patch, I'll upload a new one with fixing
> 
> Best regards,
> Krzysztof
> 

-- 
Thank you & BRs
Tingguo


