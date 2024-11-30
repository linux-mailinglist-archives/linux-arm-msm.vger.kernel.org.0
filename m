Return-Path: <linux-arm-msm+bounces-39683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 740F09DEED9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 04:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AB982818E8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 03:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B547080A;
	Sat, 30 Nov 2024 03:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XdjfO7w2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DAE4409;
	Sat, 30 Nov 2024 03:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732938494; cv=none; b=hHceVGnTHhJAhOOY5qNvOVgWQXIg6xOGspgt6SF5yEp7vGi61AYYLocnCm/mXtYPmm7ASYBvb9UU0OIseXyx9mhQDgULf+WSscUrJST/nGBy4LAkjECn7VOoyEVwEsWFMv1pGW1oTBFQ802KunN+O7Uhh4zRQ35UG6KBTY0LK2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732938494; c=relaxed/simple;
	bh=1u1yknuIjL5wQT7LjOQNoAmLdWofmhNaxLsmkQqQNZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=szOO9eeUQ+2LoWLHEF4GwoQKO+R8wHqjMsZB4/Puv8VTMHYX3m5sYe4IZa2fRrDVI/A1TstZTLW6ZZC2xpNTU9vVTdfSkrHbJDZh0YajBsNjvfWrkGDuXU4I3dvNVewTtcA+QPRhROtPgkY0XJ30cnfKlNZVN7BqpYr5e4JVpa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XdjfO7w2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AU2q2Th001942;
	Sat, 30 Nov 2024 03:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yCQ2SiwnMZW1pZ368yk8MW7kCeYayQpW3AOXamZsQjM=; b=XdjfO7w2/d9P+v8B
	S07lDjXSnAU7Upnld4Emeh62cmIgRIz5j3smZ6zXBOQiefi5qvV25wLtUNNN2EEq
	jZ7rdvIAq8qXzB7nCgWPA1J7TH5bPKkv/ZMuk+UU4+oSPJoPyVPsRPQclTYvX4Yp
	m7OL3+501BvwddXjDPKK55ObhYMJ3LDbeB/3K2DWgmu0myoQ9XAz0on+XNKlkN/b
	I+rbgmNCS6dpfjh65AfHhCNSbxsRT0uvjGc9uMvUqU9BEXApA9pyulfUSUPwCy5s
	YcOZX4T5SxV89qffka98dBuKlE/uv1WKg3ttAJSjWWaNxOdEXG6wHl8nUq+nbpNW
	N0e12Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ta2r24f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Nov 2024 03:47:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AU3lr9o008676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Nov 2024 03:47:53 GMT
Received: from [10.253.74.19] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 29 Nov
 2024 19:47:48 -0800
Message-ID: <a7ec9426-8c8a-49b3-9916-4c2660c38e49@quicinc.com>
Date: Sat, 30 Nov 2024 11:47:46 +0800
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
 <fb5bc38b-83b3-4924-b1d0-39219a2927b4@quicinc.com>
 <CAA8EJpqAOD_+SLG2LbiodWOs28_rquvMefmSH5CY1yB_rkiZPg@mail.gmail.com>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <CAA8EJpqAOD_+SLG2LbiodWOs28_rquvMefmSH5CY1yB_rkiZPg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: s_qNxJtoX2dZ6plOiyh5CSbKM8o8HTuz
X-Proofpoint-GUID: s_qNxJtoX2dZ6plOiyh5CSbKM8o8HTuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411300029

Hi Dmitry,

On 11/21/2024 12:38 PM, Dmitry Baryshkov wrote:
> On Thu, 21 Nov 2024 at 06:02, Cheng Jiang <quic_chejiang@quicinc.com> wrote:
>>
>> Hi Dmitry,
>>
>> On 11/20/2024 6:43 PM, Dmitry Baryshkov wrote:
>>> On Wed, Nov 20, 2024 at 05:54:25PM +0800, Cheng Jiang wrote:
>>>> Several Qualcomm projects will use the same Bluetooth chip, each
>>>> focusing on different features. For instance, consumer projects
>>>> prioritize the A2DP SRC feature, while IoT projects focus on the A2DP
>>>> SINK feature, which may have more optimizations for coexistence when
>>>> acting as a SINK. Due to the patch size, it is not feasible to include
>>>> all features in a single firmware.
>>>>
>>>> Therefore, the 'product-variant' devicetree property is used to provide
>>>> product information for the Bluetooth driver to load the appropriate
>>>> firmware.
>>>>
>>>> If this property is not defined, the default firmware will be loaded,
>>>> ensuring there are no backward compatibility issues with older
>>>> devicetrees.
>>>>
>>>> The product-variant defines like this:
>>>>   0 - 15 (16 bits) are product line specific definitions
>>>>   16 - 23 (8 bits) are for the product line.
>>>>   24 - 31 (8 bits) are reserved for future use, 0 currently
>>>
>>> Please use text strings instead of encoding this information into random
>>> integers and then using just 3 bits out of 32.
>> Ack. Originally intended to make it more flexible for future use. It can be
>> text strings for current requirement.
> 
> No, fixed-format data isn't flexible. Fine-grained properties are.
> Please define exactly what is necessary rather than leaving empty
> holes "for future expansion".=
> 
>>>
>>>>
>>>> |---------------------------------------------------------------------|
>>>> |                       32 Bits                                       |
>>>> |---------------------------------------------------------------------|
>>>> |  31 - 24 (bits)   |    23 - 16 (bits)   | 15 - 0 (16 bits)          |
>>>> |---------------------------------------------------------------------|
>>>> |   Reserved        |    0: default       | 0: default                |
>>>> |                   |    1: CE            |                           |
>>>> |                   |    2: IoT           |                           |
>>>> |                   |    3: Auto          |                           |
>>>> |                   |    4: Reserved      |                           |
>>>> |---------------------------------------------------------------------|
>>>>
>>>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>>>> ---
>>>>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml          | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>> index 7bb68311c609..9019fe7bcdc6 100644
>>>> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>> @@ -110,6 +110,12 @@ properties:
>>>>      description:
>>>>        boot firmware is incorrectly passing the address in big-endian order
>>>>
>>>> +  qcom,product-variant:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description:
>>>> +      specify the product information for driver to load the appropriate firmware
>>>
>>> DT describes hardware. Is this a hardware property?
>>
>> It has been added to identify the firmware image for the platform. The driver
>> parses it, and then the rampatch is selected from a specify directory. Currently,
>> there is a 'firmware-name' parameter, but it is only used to specify the NVM
>> (config) file. We also need to specify the rampatch (TLV file).
>>
>>
>> Can we re-use the "firmware-name"? add two segments like the following?
>> firmware-name = "rampatch_xx.tlv",  "nvm_xx.bin";
> 
> I think this is the better solution
> 
How about the following logic for handling 'firmware-name' property:
1. If there is only one string in firmware-name, it must be the NVM file, which is used
   for backward compatibility.

2. If there are two strings in firmware-name, the first string is for the rampatch, and 
   the second string is for the NVM.

3. Due to variations in RF performance of chips from different foundries, different NVM
   configurations are used based on the board ID. If the second string ends with boardid,
   the NVM file will be selected according to the board ID.


Here are two examples:

 firmware-name = "qca/QCA6698/hpbtfw21.tlv",  "qca/QCA6698/hpnv21.bin";
In this configuration, the driver will use the two files directly.


 firmware-name = "qca/QCA6698/hpbtfw21.tlv",  "qca/QCA6698/hpnv21.boardid";
In this configuration, the driver will replace boardid with the actual board information.
If the board id is 0x0206, the nvm file name will be qca/QCA6698/hpnv21.b0206

>>
>> Or add a new property to specify the rampatch file?
>> rampatch-name = "rampatch_xx.tlv";
>>
>>>
>>>> +
>>>> +
>>>>  required:
>>>>    - compatible
>>>>
>>>> --
>>>> 2.25.1
>>>>
>>>
>>
> 
> 


