Return-Path: <linux-arm-msm+bounces-39889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF859E080E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 17:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 112F7B3A2CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 14:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530ED204080;
	Mon,  2 Dec 2024 14:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nf6RlNaY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69C61FF5F9;
	Mon,  2 Dec 2024 14:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733149523; cv=none; b=FEhSxB+ryLlZmKPfKKFtT1FpYdoQdBMOgOUAzyYpunWa4JsoqKyoY218+CZuAd256snC1zv6dmYYJF3z7kb4OraLy8F/ihTCPh3XPmYHzcymZNBf4DouUt/TR2Jr8ap23pm9KPctq9hJ8HeSRISA6f5YP3eEzLv8EFX9KU9iYFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733149523; c=relaxed/simple;
	bh=FcVASK/U4o1yY3bTln0CCSrGcu4ECgWUsljt85Wpdjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=O8dwE7/GXRH1O1kr/3LstIgRhMrC8TE34cV0BM+ivscvV1Hfmn9BtTT2uZrYbmAjlOudUBVTs8gfSUdbZ/GBWXmIr6r9SB0YFfUw/Y/r25RGCa+p0gbOzqdR5snA7RI6U23MIZUUGPA3l/UgWubc9dmmFKWdS9DQZHhOIi9VR4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nf6RlNaY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28Uuqx013586;
	Mon, 2 Dec 2024 14:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6LOHsv+Fd4590+6L9aZ9YfYrPMwIn3Ce+57N5X2I04=; b=Nf6RlNaYtdqQpDni
	tOzx8nxe2cKvtypUSW6yhgZb3ArWG2sQ3yhpsZDP62+8biImOxMveMXTm7LDmn4M
	yBRER0N2q3BHcXAWTHZhRo4fjpKVDCQi6R6+D6kJq8GOOVFJ5s0EkRRmreIg12OC
	BBYHjL/QLXB6/+lpONg0/EE3M9tTVT2iGBjJX667tmvkBJTLpr4ZWyLAjmG+oVBm
	yh/Vlq1+FzJ6Vpi3C0edCAa4ERfplaqd/kyE2gEhdOcE3AWjeUicGnS+vULkIRWc
	faKdhcmBinKe4mvG0OOKWL8j94QwPvxiAvneGDqk+r+IyDCorZaLQf5buuBm/691
	QR1yfQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437tstd2m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 14:25:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B2EPCwc014251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 14:25:12 GMT
Received: from [10.253.35.62] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 06:25:06 -0800
Message-ID: <c3394a08-edab-45a4-9ed8-db2a06598a0a@quicinc.com>
Date: Mon, 2 Dec 2024 22:25:03 +0800
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
 <a7ec9426-8c8a-49b3-9916-4c2660c38e49@quicinc.com>
 <CAA8EJpqpzwGL38F_MYUJVuAT8q96QZO7CSh00ZpNBU5cGWUqqA@mail.gmail.com>
 <944fdc7f-313e-48b9-8917-370942d4f073@quicinc.com>
 <qsaiic4jvhf6nqe7efchxvja6tjvsiquem6ofsgq52iygfflya@huv6x7kz6emd>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <qsaiic4jvhf6nqe7efchxvja6tjvsiquem6ofsgq52iygfflya@huv6x7kz6emd>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Zy3ESLE1OiVsa5yviYbu2HK3GHix4fvC
X-Proofpoint-GUID: Zy3ESLE1OiVsa5yviYbu2HK3GHix4fvC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020124



On 12/2/2024 7:38 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 10:22:52AM +0800, Cheng Jiang (IOE) wrote:
>> Hi Dmitry,
>>
>> On 11/30/2024 4:24 PM, Dmitry Baryshkov wrote:
>>> On Sat, 30 Nov 2024 at 05:48, Cheng Jiang (IOE)
>>> <quic_chejiang@quicinc.com> wrote:
>>>>
>>>> Hi Dmitry,
>>>>
>>>> On 11/21/2024 12:38 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, 21 Nov 2024 at 06:02, Cheng Jiang <quic_chejiang@quicinc.com> wrote:
>>>>>>
>>>>>> Hi Dmitry,
>>>>>>
>>>>>> On 11/20/2024 6:43 PM, Dmitry Baryshkov wrote:
>>>>>>> On Wed, Nov 20, 2024 at 05:54:25PM +0800, Cheng Jiang wrote:
>>>>>>>> Several Qualcomm projects will use the same Bluetooth chip, each
>>>>>>>> focusing on different features. For instance, consumer projects
>>>>>>>> prioritize the A2DP SRC feature, while IoT projects focus on the A2DP
>>>>>>>> SINK feature, which may have more optimizations for coexistence when
>>>>>>>> acting as a SINK. Due to the patch size, it is not feasible to include
>>>>>>>> all features in a single firmware.
>>>>>>>>
>>>>>>>> Therefore, the 'product-variant' devicetree property is used to provide
>>>>>>>> product information for the Bluetooth driver to load the appropriate
>>>>>>>> firmware.
>>>>>>>>
>>>>>>>> If this property is not defined, the default firmware will be loaded,
>>>>>>>> ensuring there are no backward compatibility issues with older
>>>>>>>> devicetrees.
>>>>>>>>
>>>>>>>> The product-variant defines like this:
>>>>>>>>   0 - 15 (16 bits) are product line specific definitions
>>>>>>>>   16 - 23 (8 bits) are for the product line.
>>>>>>>>   24 - 31 (8 bits) are reserved for future use, 0 currently
>>>>>>>
>>>>>>> Please use text strings instead of encoding this information into random
>>>>>>> integers and then using just 3 bits out of 32.
>>>>>> Ack. Originally intended to make it more flexible for future use. It can be
>>>>>> text strings for current requirement.
>>>>>
>>>>> No, fixed-format data isn't flexible. Fine-grained properties are.
>>>>> Please define exactly what is necessary rather than leaving empty
>>>>> holes "for future expansion".=
>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> |---------------------------------------------------------------------|
>>>>>>>> |                       32 Bits                                       |
>>>>>>>> |---------------------------------------------------------------------|
>>>>>>>> |  31 - 24 (bits)   |    23 - 16 (bits)   | 15 - 0 (16 bits)          |
>>>>>>>> |---------------------------------------------------------------------|
>>>>>>>> |   Reserved        |    0: default       | 0: default                |
>>>>>>>> |                   |    1: CE            |                           |
>>>>>>>> |                   |    2: IoT           |                           |
>>>>>>>> |                   |    3: Auto          |                           |
>>>>>>>> |                   |    4: Reserved      |                           |
>>>>>>>> |---------------------------------------------------------------------|
>>>>>>>>
>>>>>>>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>>>>>>>> ---
>>>>>>>>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml          | 6 ++++++
>>>>>>>>  1 file changed, 6 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>>>>>> index 7bb68311c609..9019fe7bcdc6 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>>>>>> @@ -110,6 +110,12 @@ properties:
>>>>>>>>      description:
>>>>>>>>        boot firmware is incorrectly passing the address in big-endian order
>>>>>>>>
>>>>>>>> +  qcom,product-variant:
>>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>>>> +    description:
>>>>>>>> +      specify the product information for driver to load the appropriate firmware
>>>>>>>
>>>>>>> DT describes hardware. Is this a hardware property?
>>>>>>
>>>>>> It has been added to identify the firmware image for the platform. The driver
>>>>>> parses it, and then the rampatch is selected from a specify directory. Currently,
>>>>>> there is a 'firmware-name' parameter, but it is only used to specify the NVM
>>>>>> (config) file. We also need to specify the rampatch (TLV file).
>>>>>>
>>>>>>
>>>>>> Can we re-use the "firmware-name"? add two segments like the following?
>>>>>> firmware-name = "rampatch_xx.tlv",  "nvm_xx.bin";
>>>>>
>>>>> I think this is the better solution
>>>>>
>>>> How about the following logic for handling 'firmware-name' property:
>>>> 1. If there is only one string in firmware-name, it must be the NVM file, which is used
>>>>    for backward compatibility.
>>>>
>>>> 2. If there are two strings in firmware-name, the first string is for the rampatch, and
>>>>    the second string is for the NVM.
>>>
>>> I'd say, other way around: the first one is always NVM, the second one
>>> is rampatch and it is optional.
>>>
>> OK, Got it.
>>>>
>>>> 3. Due to variations in RF performance of chips from different foundries, different NVM
>>>>    configurations are used based on the board ID. If the second string ends with boardid,
>>>>    the NVM file will be selected according to the board ID.
>>>
>>> Is there a reason why you can not use the exact firmware name? The
>>> firmware name is a part of the board DT file. I assume you know the
>>> board ID that has been used for the board.
>>>
>> The boardid is the connectivity board's id. NVM is a board specific configuration file, 
>> it's related to the connectivity board. We may attach different connectivity board on the
>> same platform. For example, we have connectivity boards based on the QCA6698 chipset that
>> can support either a two-antenna or three-antenna solution. Both boards work fine on the
>> sa8775p-ride platform. 
> 
> Please add such an info to the commit messages (plural for it being a
> generic feedback: please describe the reasons for your design
> decisions),
> 
Ack.
> I really don't like the .boardid template. What if we change property
> behaviour in the following way: if there is no file extension then .bNN
> will be probed, falling back to .bin. This will require reading board ID
> for all the platforms that support it (do wcn3990 have board ID?)
> 
Ack, this proposal is great. 
Yes, We have board ID for each connectivity card. An NVM file maps to it
if necessary.

Let me provide a new patchset based on this solution. Thank you very much for
the valuable comments. 
>>>>
>>>>
>>>> Here are two examples:
>>>>
>>>>  firmware-name = "qca/QCA6698/hpbtfw21.tlv",  "qca/QCA6698/hpnv21.bin";
>>>> In this configuration, the driver will use the two files directly.
>>>>
>>>>
>>>>  firmware-name = "qca/QCA6698/hpbtfw21.tlv",  "qca/QCA6698/hpnv21.boardid";
>>>> In this configuration, the driver will replace boardid with the actual board information.
>>>> If the board id is 0x0206, the nvm file name will be qca/QCA6698/hpnv21.b0206
>>>>
>>>>>>
>>>>>> Or add a new property to specify the rampatch file?
>>>>>> rampatch-name = "rampatch_xx.tlv";
>>>>>>
>>>>>>>
>>>>>>>> +
>>>>>>>> +
>>>>>>>>  required:
>>>>>>>>    - compatible
>>>>>>>>
>>>>>>>> --
>>>>>>>> 2.25.1
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>
>>>
>>> --
>>> With best wishes
>>> Dmitry
>>
> 


