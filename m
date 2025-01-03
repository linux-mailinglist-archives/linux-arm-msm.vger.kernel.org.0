Return-Path: <linux-arm-msm+bounces-43866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B5FA008AD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EC5C16123A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 11:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBD71F9F45;
	Fri,  3 Jan 2025 11:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oV5u5IwC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5581F9F5E;
	Fri,  3 Jan 2025 11:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735903909; cv=none; b=DhxiA2TRgGifnK83dXejKPaEzZB/wInUFdByI8upopwr689v873i0H1FVsL9lWmM0+iAeKtGwzDJTXv7u9L/ZFvntSAYbir0xbrR/PYZwpFTZhS8L/6DjfWtBogHBXA39EyuuXX95ffdv2UqCknjp7TkS7gpYxQiqFmZQm4Ycgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735903909; c=relaxed/simple;
	bh=kV//AIW+v3DjV6DjPXMQ5cugi3oL7UFi2EsstQxDmiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EbzmHlfpiwZZbDPi1PHIAwq/PQLnNKBdk64u6tMi0V0N0TYY64uPST2PvhyIS/kxYOo9W/ij5waqWDL8Zc6D8vR0aZcqwToyiml9zNX/DU5gufJrXNRJG8Zo7WjihzP5q2GkTexnG3ZojWSKNmuEViUxyhdgtuK8i60+BpougsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oV5u5IwC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5038Ko89010253;
	Fri, 3 Jan 2025 11:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OpA8Olf07J3ETZv1wozjaR/j/YnCWFxpzGDs6gOPuj4=; b=oV5u5IwCvsOKm+ZA
	C4rOoYdt5r8Qzn+CrdSBB9sdd309GoqkHnJkJOQz3O7FhmCXuipSbRrmv2rPbPor
	bmAFPQarbVmDXSjK4n2pqTzcmSxMrcO5qg5p4b+bBGlcJKC460VPPrudqT3b7nBa
	Psi8Q2TUK3eu/ryJT4rn2DJiYw6SnflYCKMG7i5kCq6NQVp4dRRb/dg4DHKsCN7K
	nDITfcrEBoY+ub2HVWIr6zNO/SZGbkhim02AhlY2W4IkJyKzw4pv68i4I+qcRJIi
	Q9bfSAYDm3n70yRStJ5pwqkzMhdP110bBHP8jqPP002Kg7nP6nrHlbxtPchm7vdA
	p45fqw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xca50dps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 11:31:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 503BVgik010874
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 11:31:42 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 Jan 2025
 03:31:36 -0800
Message-ID: <85b4ec7c-e5c5-457e-b6cc-47305199a0f3@quicinc.com>
Date: Fri, 3 Jan 2025 19:31:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: Add coresight node for SM8650
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc@quicinc.com>
 <d41df236-48b1-40fb-a19b-5d7024884186@oss.qualcomm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <d41df236-48b1-40fb-a19b-5d7024884186@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 558JGsd6zdy3y02HbHeSIoNOCvQgTwIo
X-Proofpoint-GUID: 558JGsd6zdy3y02HbHeSIoNOCvQgTwIo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=911 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501030102



On 12/13/2024 1:04 AM, Konrad Dybcio wrote:
> On 10.12.2024 9:23 AM, Yuanfang Zhang wrote:
>> Add coresight components: Funnel, ETE and ETF for SM8650.
>>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> ---
>> Changes in v2:
>> - Update compatible for funnel and etf.
>> - remove unnecessary property: reg-names and arm,primecell-periphid.
>> - Link to v1: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v1-1-269693451584@quicinc.com
>> ---
>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 165 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 165 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 25e47505adcb790d09f1d2726386438487255824..76620d478e872a2b725693dc32364e2a183572b7 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -5654,6 +5654,171 @@ compute-cb@12 {
>>  				};
>>  			};
>>  		};
>> +
>> +		ete0 {
>> +			compatible = "arm,embedded-trace-extension";
>> +
>> +			cpu = <&cpu0>;
>> +			qcom,skip-power-up;
>> +
>> +			out-ports {
>> +				port {
>> +					ete0_out_funnel_ete: endpoint {
>> +						remote-endpoint = <&funnel_ete_in_ete0>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		funnel_ete {
> 
> Node names must not contain underscores, use '-' instead
As node name pattern: "^ete([0-9a-f]+)$" in arm,embedded-trace-extension.yaml,
then name it ete0.
> 
> Also, nodes without a reg property/unit address don't belong under /soc
> 
Done.
> Konrad


