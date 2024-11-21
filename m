Return-Path: <linux-arm-msm+bounces-38589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4385C9D466E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 05:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A57D11F226C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 04:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B17574068;
	Thu, 21 Nov 2024 04:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i6IobRGI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC62191;
	Thu, 21 Nov 2024 04:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732161770; cv=none; b=UAOKK1unj5rTYTRF3E2BPasYFtS5D0Bh316FHq3cTPjUeMPe3XRrw39Iv/VzddjZxuG09gjoR6ukbAADquVRsp/2qkr6d10U+quff5FRvLKZK/Dcm9f7slMf2uTkWpeWXmRUSCTSiUon/gnQ0Qcf7C27JfNMkWTYITYS8aizil0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732161770; c=relaxed/simple;
	bh=4HH9e2DdIyD+Gb/EqyPsW6Fio0L3K9h91eEBO+nCvkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fxxjh12QhaFZ0WtyI0e3wA2Hc4/XjvUOIw8CBST46o+El8mzUYniH6RdkRuR4JGzDHAh9S6eQLp3NC6WLMnPfAP8WrDRilIaAlIXBBMyQ6XgiIPUhMVOnk/DP/skzvRCULchf2Rq6FU3/6cYKgBHhcSqYZJo4KFvOtfrORb6n/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i6IobRGI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKJtrOv019248;
	Thu, 21 Nov 2024 04:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8ppdMKfh51u5pgiAc1cpcSILYq3w01TytQeIjLxsk0=; b=i6IobRGIBkbdEiF+
	YIdCAOX4mM8W9u09dvneeKfzs6BfhnOuWG6qNYtdXcRmaK9C06G965hkaqKUvU5n
	VTjBsPw0RDo2XFWisJE9PzWYg7InX4pJDj/Ykvn87ByoOsp3p8w35/W83ooUY9vN
	znVwY+wniEal2e9RBYwozfnRq79oQsjLG0gk98M92k/QuhTlaoYvKArrWMJYW6Oy
	gSXMAnvteGnhP9geSQa2d9wrnF8QkZgXZA9Qat8sE5G+0I/kOs2enTMKh3GldKWW
	C+dz7tIpWqVcaRfY9PdrNGAVB8lQI2j6qjzO9KUs1i9j58l1JhTvzxALGIGTShM8
	lEdGeQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431c7hjqtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 04:02:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL42WN4017665
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 04:02:32 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 20:02:27 -0800
Message-ID: <fb5bc38b-83b3-4924-b1d0-39219a2927b4@quicinc.com>
Date: Thu, 21 Nov 2024 12:02:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: bluetooth: add 'qcom,product-variant'
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao
	<quic_rjliao@quicinc.com>, <quic_zijuhu@quicinc.com>,
        <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_mohamull@quicinc.com>
References: <20241120095428.1122935-1-quic_chejiang@quicinc.com>
 <20241120095428.1122935-2-quic_chejiang@quicinc.com>
 <454tdpuglu23nmxfqqesv42h5rk3vqiji7spo3naf2djqwojqt@6x3ram3lnlkq>
Content-Language: en-US
From: Cheng Jiang <quic_chejiang@quicinc.com>
In-Reply-To: <454tdpuglu23nmxfqqesv42h5rk3vqiji7spo3naf2djqwojqt@6x3ram3lnlkq>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Kr0nPh-zQUBBVuPbSI-BU9tmQifDkabM
X-Proofpoint-GUID: Kr0nPh-zQUBBVuPbSI-BU9tmQifDkabM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210028

Hi Dmitry, 

On 11/20/2024 6:43 PM, Dmitry Baryshkov wrote:
> On Wed, Nov 20, 2024 at 05:54:25PM +0800, Cheng Jiang wrote:
>> Several Qualcomm projects will use the same Bluetooth chip, each
>> focusing on different features. For instance, consumer projects
>> prioritize the A2DP SRC feature, while IoT projects focus on the A2DP
>> SINK feature, which may have more optimizations for coexistence when
>> acting as a SINK. Due to the patch size, it is not feasible to include
>> all features in a single firmware.
>>
>> Therefore, the 'product-variant' devicetree property is used to provide
>> product information for the Bluetooth driver to load the appropriate
>> firmware.
>>
>> If this property is not defined, the default firmware will be loaded,
>> ensuring there are no backward compatibility issues with older
>> devicetrees.
>>
>> The product-variant defines like this:
>>   0 - 15 (16 bits) are product line specific definitions
>>   16 - 23 (8 bits) are for the product line.
>>   24 - 31 (8 bits) are reserved for future use, 0 currently
> 
> Please use text strings instead of encoding this information into random
> integers and then using just 3 bits out of 32.
Ack. Originally intended to make it more flexible for future use. It can be 
text strings for current requirement.
> 
>>
>> |---------------------------------------------------------------------|
>> |                       32 Bits                                       |
>> |---------------------------------------------------------------------|
>> |  31 - 24 (bits)   |    23 - 16 (bits)   | 15 - 0 (16 bits)          |
>> |---------------------------------------------------------------------|
>> |   Reserved        |    0: default       | 0: default                |
>> |                   |    1: CE            |                           |
>> |                   |    2: IoT           |                           |
>> |                   |    3: Auto          |                           |
>> |                   |    4: Reserved      |                           |
>> |---------------------------------------------------------------------|
>>
>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>> ---
>>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml          | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> index 7bb68311c609..9019fe7bcdc6 100644
>> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> @@ -110,6 +110,12 @@ properties:
>>      description:
>>        boot firmware is incorrectly passing the address in big-endian order
>>  
>> +  qcom,product-variant:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      specify the product information for driver to load the appropriate firmware
> 
> DT describes hardware. Is this a hardware property?

It has been added to identify the firmware image for the platform. The driver
parses it, and then the rampatch is selected from a specify directory. Currently, 
there is a 'firmware-name' parameter, but it is only used to specify the NVM
(config) file. We also need to specify the rampatch (TLV file).


Can we re-use the "firmware-name"? add two segments like the following?
firmware-name = "rampatch_xx.tlv",  "nvm_xx.bin";

Or add a new property to specify the rampatch file? 
rampatch-name = "rampatch_xx.tlv";

> 
>> +
>> +
>>  required:
>>    - compatible
>>  
>> -- 
>> 2.25.1
>>
> 


