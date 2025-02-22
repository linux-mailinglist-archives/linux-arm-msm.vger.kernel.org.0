Return-Path: <linux-arm-msm+bounces-49030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E206A40941
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 15:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44AB4169DBF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 14:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75998199934;
	Sat, 22 Feb 2025 14:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f2YpgTBS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1CF18991E;
	Sat, 22 Feb 2025 14:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740236394; cv=none; b=A3v/acvRcFJH6FbY1Bc/AMHNM365gGA0wb+8OI38EsDcqSSz+tzof35qigRBU+GbAZ+rKJ8T3tSaHlolvYqlLX4t1Kxq65QeJ3jUj6/RA9HLbHnAR/FXMjR6Lm2AZ2ULcnBcrc67xfx36N7aucDGaHzbgTAIPT8AWplAzU84UKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740236394; c=relaxed/simple;
	bh=UPMwM1dsF+ZN10RivYNc8HxJ+n1RcGzxlyTNhVOm/BY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fip8Qv7zdiQyiX3fbHdTEuFvVORvOl1A5fUJzNCQRLA8BlCm+wMl03HgKnCDjl4a6gQUz97MpP0+3EgG3+iMnB2Jq4/2MCBZp8C9meVi14BjMLsGxJGTig4QunhWV1b0yLl7AvFIe8k1GOCpsX5kxiCq45GeGkrWqgY8ZMjvrFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f2YpgTBS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51MAUvc1017475;
	Sat, 22 Feb 2025 14:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrzRTLmT2VU2o90xomI7sHc+CSfYWZkgtgDzBjsTkAc=; b=f2YpgTBSMi97jhPB
	K5NIcxHOex9LiPEj1FdaU+/wHQukOwrobsU0ZUfxoel8krjk2uuPocwp/AFy6u9Y
	GTUzrfE+izQOM7LoYKZDUkLTechxZkZoRU/ECnRrsMOrkKfY7ZOChgW9shiOGEgI
	YXQuHWZYu4RRH/yYJ7iAMI5fCfbWjP8IA+ivOxXqMs5n5RhpTTt6j3Pgxfisc+FC
	j8ZIRHjNVSL7nQBwx7zf3Cim7YIiLgXG4KgtbYxeiIcTROz2QwSEGY59dsAyV3gL
	AwgkpdY3cNlt3awSL8I8JLPj9KOkLEf1QcIv1j9aa/bl56aQuUtB7B3fra4JG4s1
	DRAcHg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6ntrttj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Feb 2025 14:59:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51MExgEK006316
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Feb 2025 14:59:42 GMT
Received: from [10.216.45.162] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 22 Feb
 2025 06:59:37 -0800
Message-ID: <dbfdd0e6-4d56-4c0b-9b41-55816506a66d@quicinc.com>
Date: Sat, 22 Feb 2025 20:29:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/1] arm64: dts: qcom: qcs6490-rb3gen: add and enable
 BT node
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <quic_mohamull@quicinc.com>, <quic_hbandi@quicinc.com>,
        <quic_anubhavg@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250221171014.120946-1-quic_janathot@quicinc.com>
 <20250221171014.120946-2-quic_janathot@quicinc.com>
 <D7YD5C0HCSZ1.2DOE3TAA7024Y@linaro.org>
Content-Language: en-US
From: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
In-Reply-To: <D7YD5C0HCSZ1.2DOE3TAA7024Y@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Y-n72SMkFiGNQFY8ipxQ_BQ1Rcm20PA3
X-Proofpoint-GUID: Y-n72SMkFiGNQFY8ipxQ_BQ1Rcm20PA3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-22_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=918 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502220120



On 2/22/2025 12:46 AM, Alexey Klimov wrote:
> On Fri Feb 21, 2025 at 5:10 PM GMT, Janaki Ramaiah Thota wrote:
>> Add the PMU node for WCN6750 present on the qcs6490-rb3gen
> 
> Is it rb3gen or rb3gen2? Also in the subject.
> 
> The file that you patch seems to be "rb3gen2".
> 

Thanks for pointing out the typo, Alexey. Yes it is rb3gen2.

>> board and assign its power outputs to the Bluetooth module.
>>
>> In WCN6750 module sw_ctrl and wifi-enable pins are handled
>> in the wifi controller firmware. Therefore, it is not required
>> to have those pins' entries in the PMU node.
>>
>> Signed-off-by: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 171 ++++++++++++++++++-
>>   1 file changed, 170 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 7a36c90ad4ec..de03770e0b90 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> 
> [..]
> 
> Best regards,
> Alexey

Thanks,
Janakiram


