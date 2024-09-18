Return-Path: <linux-arm-msm+bounces-31953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C2097BACD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 12:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E2EA284339
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 10:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA1D176ADA;
	Wed, 18 Sep 2024 10:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zn+gdr3b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B8A17B401;
	Wed, 18 Sep 2024 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726655310; cv=none; b=Pbuc7G6FCkUZhk9g52/HAXzu8grS4xHlgJzTyuahRiVedD9Cujr7db7KnvmnAwl1J35YSNWK5/uwd5v/5oIs6vsT27EnQhyJoJTU1Mve2fMGgdKaSRa2XO0V5eQDqNa+fQIbMOpuJPBqxpe9SBHp+b1u8S8kT8dZ62EE1xQ4oOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726655310; c=relaxed/simple;
	bh=HAhXKHlOQFFjsNd1YnJBMA7NRYhVLLjR+OebEd31LVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LIdYZ/v91uz9TeCpkk88zV8PlUR+OW8vKts3n1ztdU3onIPWf5OwMH6PcH4V6C/Z35+kIQroFyGWkbxPdielif4QQg6A7fDykMwsBJ/XkK9Cduk6brgaWKP5eszVn2756WLAWv6fwepCTExC65R5gR/7+VV7maYRGe8UlL4iHYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zn+gdr3b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HKpFf4006641;
	Wed, 18 Sep 2024 10:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LsWLZznjHLuyCj9kcJ6hg3j9b/OlymVMbnXjkYcZoE8=; b=Zn+gdr3bpbPTvaLn
	/4kYLlFA8n74NfayXCfCQ5b4wi2pTsd3J1XmEdwG8T8qmowR26J3R4l/wXxvVJdQ
	PkUlCHgTXTf92kRfGn6AizxOh9L18eqIXg6kQS1BDkBzSAtDzPuTvrhkvG3fUXkL
	Oayqab25ckur1+ILPbXJZf93MmNcO1Z5M9j+t9jQFF6l+ACoEkUXjSJEB8ETcsqx
	7k1YB/2bNDS0A3IX+ay/U5e8fYzRaplyZPaqCDZadQtHwSHABwFlF5A8AG0i6y2g
	JmrOUWrpzwAjTan7TIIJnByjy7azAh10GsjUdj6T23V/5WSeGXsJGoHBUh4V8gvi
	Orh9ig==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hh9mcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 10:28:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48IASMWf006673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 10:28:22 GMT
Received: from [10.216.30.58] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Sep
 2024 03:28:16 -0700
Message-ID: <5c0f627b-058d-4213-9c2a-5adb2f174c0d@quicinc.com>
Date: Wed, 18 Sep 2024 15:58:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: qcs6490-rb3gen2: Add SD Card node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_sartgarg@quicinc.com>
References: <20240917090630.1025-1-quic_sachgupt@quicinc.com>
 <gyasvmb5q3e4pgmfpj7njovclydwhsvsxt4ayfxzbh5njwgwsq@zfhlm6lqfirl>
Content-Language: en-US
From: Sachin Gupta <quic_sachgupt@quicinc.com>
In-Reply-To: <gyasvmb5q3e4pgmfpj7njovclydwhsvsxt4ayfxzbh5njwgwsq@zfhlm6lqfirl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8k6QzumPC6t-cjRpeeW8z8v4KJl-spQZ
X-Proofpoint-ORIG-GUID: 8k6QzumPC6t-cjRpeeW8z8v4KJl-spQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=806 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409180066



On 9/17/2024 7:08 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 17, 2024 at 02:36:30PM GMT, Sachin Gupta wrote:
>> Add SD Card node for Qualcomm qcs6490-rb3gen2 Board.
> 
> Consider adding mmc0 or mmc2 alias for the sdhc_2 node.
> 
Thank you for your input. However, aliases you mentioned already exists 
in the sc7280.dtsi header file.

>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 33 ++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 0d45662b8028..5df3167651ca 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -716,9 +716,42 @@
>>   	status = "okay";
>>   };
>>   
>> +&sdc2_clk {
>> +	bias-disable;
>> +	drive-strength = <16>;
>> +};
> 
> Please move all pinctrl-related nodes below the PINCTRL comment.
> 
Will update in next patch.
>> +
>> +&sdc2_cmd {
>> +	bias-pull-up;
>> +	drive-strength = <10>;
>> +};
>> +
>> +&sdc2_data {
>> +	bias-pull-up;
>> +	drive-strength = <10>;
>> +};

Thanks,
Sachin Gupta
>> +
 >>
>>   &tlmm {
>>   	gpio-reserved-ranges = <32 2>, /* ADSP */
>>   			       <48 4>; /* NFC */
>> +
>> +	sd_cd: sd-cd-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		bias-pull-up;
>> +	};
> 
> There is also a special PINCRTL_related TLMM imstance down the file,
> move it to that node.
> 
Will update in next patch.
>>   };
>>   
>>   &uart5 {
>> -- 
>> 2.17.1
>>
> 


