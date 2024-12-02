Return-Path: <linux-arm-msm+bounces-39770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2A39DF8E2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 03:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FFB6281537
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 02:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB9C1BC49;
	Mon,  2 Dec 2024 02:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iKQTQVYF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9C7208AD;
	Mon,  2 Dec 2024 02:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733106189; cv=none; b=YtugjIlBDOi0yCPbnu1r2CooNtB8DohcJ9sNg6M0gWbyBfy58cAlk5zKrHKoeKzSZBVT1sJvZIBUbdlVTux4gvpF0d0snyw1IClJBn035LiZakjh7HbXnYLhb7o+oWmHlIpVLnvnqRgKGtqLSreK7bFfNKpF2fC9TnW2hAzU1H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733106189; c=relaxed/simple;
	bh=ANdTrFhUVhsrnomrzcUibMAab4MsspAvy1K/6HsDvdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h6U5G4zp7++VUyM5QTgMmXEP4WwpIhcQq/HiG3aH/cPIhau7sMHCfz7aizB/6F9kWHZu+klxHoizv4lpZGMg1twwEZDiV1hy585M6Us8/TSig8AFnSovDxSayIvlJxKwsYxpQCMQ0Sf6Hjl2x5s3AcapAADJgB9MvM+C89Z+bPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iKQTQVYF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B1MuufU010949;
	Mon, 2 Dec 2024 02:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4HanZb4a6DL+Lm+DYLPQuZWGh29zQJsPnMGmXGdnSuk=; b=iKQTQVYF0rRGT5Mk
	tiFF2ZziSmDOWDg9akFA0/HyTWD4dFN6t+yKog7GCttbTycLN383W+ualjMquIjm
	wl4OXtqBF/+m2QGjM4IjRncIOSBWPPjaLWjg8XSixEaMGy0Yznz6qEw9hDWAwIKA
	/5J8ZDo2Yt5u6GFvHuaqTsYukQqeqL67VXCb3vx0BIukTW1Aapy3V///OIAQnhOg
	9WlEfmIialnPOXudw1KQJRyZDcItBRwH+B50oI3xXvMYASBo/D3ZGMlx9NIfT8Fa
	J37z1WEgTEp5NJH/oAQ/+PIjZXcLmVnFRxWu+hLWjGdm0jQBIcgCJxpOuO0R0PnT
	w4ROqg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437r2muac9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 02:23:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B22Mx8o000742
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 02:22:59 GMT
Received: from [10.239.28.11] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Dec 2024
 18:22:55 -0800
Message-ID: <944fdc7f-313e-48b9-8917-370942d4f073@quicinc.com>
Date: Mon, 2 Dec 2024 10:22:52 +0800
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
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <CAA8EJpqpzwGL38F_MYUJVuAT8q96QZO7CSh00ZpNBU5cGWUqqA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WiT_DRGDnXXK6xvt-FMY36AxPnmaHI-M
X-Proofpoint-GUID: WiT_DRGDnXXK6xvt-FMY36AxPnmaHI-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020020

Hi Dmitry,

On 11/30/2024 4:24 PM, Dmitry Baryshkov wrote:
> On Sat, 30 Nov 2024 at 05:48, Cheng Jiang (IOE)
> <quic_chejiang@quicinc.com> wrote:
>>
>> Hi Dmitry,
>>
>> On 11/21/2024 12:38 PM, Dmitry Baryshkov wrote:
>>> On Thu, 21 Nov 2024 at 06:02, Cheng Jiang <quic_chejiang@quicinc.com> wrote:
>>>>
>>>> Hi Dmitry,
>>>>
>>>> On 11/20/2024 6:43 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Nov 20, 2024 at 05:54:25PM +0800, Cheng Jiang wrote:
>>>>>> Several Qualcomm projects will use the same Bluetooth chip, each
>>>>>> focusing on different features. For instance, consumer projects
>>>>>> prioritize the A2DP SRC feature, while IoT projects focus on the A2DP
>>>>>> SINK feature, which may have more optimizations for coexistence when
>>>>>> acting as a SINK. Due to the patch size, it is not feasible to include
>>>>>> all features in a single firmware.
>>>>>>
>>>>>> Therefore, the 'product-variant' devicetree property is used to provide
>>>>>> product information for the Bluetooth driver to load the appropriate
>>>>>> firmware.
>>>>>>
>>>>>> If this property is not defined, the default firmware will be loaded,
>>>>>> ensuring there are no backward compatibility issues with older
>>>>>> devicetrees.
>>>>>>
>>>>>> The product-variant defines like this:
>>>>>>   0 - 15 (16 bits) are product line specific definitions
>>>>>>   16 - 23 (8 bits) are for the product line.
>>>>>>   24 - 31 (8 bits) are reserved for future use, 0 currently
>>>>>
>>>>> Please use text strings instead of encoding this information into random
>>>>> integers and then using just 3 bits out of 32.
>>>> Ack. Originally intended to make it more flexible for future use. It can be
>>>> text strings for current requirement.
>>>
>>> No, fixed-format data isn't flexible. Fine-grained properties are.
>>> Please define exactly what is necessary rather than leaving empty
>>> holes "for future expansion".=
>>>
>>>>>
>>>>>>
>>>>>> |---------------------------------------------------------------------|
>>>>>> |                       32 Bits                                       |
>>>>>> |---------------------------------------------------------------------|
>>>>>> |  31 - 24 (bits)   |    23 - 16 (bits)   | 15 - 0 (16 bits)          |
>>>>>> |---------------------------------------------------------------------|
>>>>>> |   Reserved        |    0: default       | 0: default                |
>>>>>> |                   |    1: CE            |                           |
>>>>>> |                   |    2: IoT           |                           |
>>>>>> |                   |    3: Auto          |                           |
>>>>>> |                   |    4: Reserved      |                           |
>>>>>> |---------------------------------------------------------------------|
>>>>>>
>>>>>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>>>>>> ---
>>>>>>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml          | 6 ++++++
>>>>>>  1 file changed, 6 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>>>> index 7bb68311c609..9019fe7bcdc6 100644
>>>>>> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>>>>>> @@ -110,6 +110,12 @@ properties:
>>>>>>      description:
>>>>>>        boot firmware is incorrectly passing the address in big-endian order
>>>>>>
>>>>>> +  qcom,product-variant:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>> +    description:
>>>>>> +      specify the product information for driver to load the appropriate firmware
>>>>>
>>>>> DT describes hardware. Is this a hardware property?
>>>>
>>>> It has been added to identify the firmware image for the platform. The driver
>>>> parses it, and then the rampatch is selected from a specify directory. Currently,
>>>> there is a 'firmware-name' parameter, but it is only used to specify the NVM
>>>> (config) file. We also need to specify the rampatch (TLV file).
>>>>
>>>>
>>>> Can we re-use the "firmware-name"? add two segments like the following?
>>>> firmware-name = "rampatch_xx.tlv",  "nvm_xx.bin";
>>>
>>> I think this is the better solution
>>>
>> How about the following logic for handling 'firmware-name' property:
>> 1. If there is only one string in firmware-name, it must be the NVM file, which is used
>>    for backward compatibility.
>>
>> 2. If there are two strings in firmware-name, the first string is for the rampatch, and
>>    the second string is for the NVM.
> 
> I'd say, other way around: the first one is always NVM, the second one
> is rampatch and it is optional.
> 
OK, Got it.
>>
>> 3. Due to variations in RF performance of chips from different foundries, different NVM
>>    configurations are used based on the board ID. If the second string ends with boardid,
>>    the NVM file will be selected according to the board ID.
> 
> Is there a reason why you can not use the exact firmware name? The
> firmware name is a part of the board DT file. I assume you know the
> board ID that has been used for the board.
> 
The boardid is the connectivity board's id. NVM is a board specific configuration file, 
it's related to the connectivity board. We may attach different connectivity board on the
same platform. For example, we have connectivity boards based on the QCA6698 chipset that
can support either a two-antenna or three-antenna solution. Both boards work fine on the
sa8775p-ride platform. 
>>
>>
>> Here are two examples:
>>
>>  firmware-name = "qca/QCA6698/hpbtfw21.tlv",  "qca/QCA6698/hpnv21.bin";
>> In this configuration, the driver will use the two files directly.
>>
>>
>>  firmware-name = "qca/QCA6698/hpbtfw21.tlv",  "qca/QCA6698/hpnv21.boardid";
>> In this configuration, the driver will replace boardid with the actual board information.
>> If the board id is 0x0206, the nvm file name will be qca/QCA6698/hpnv21.b0206
>>
>>>>
>>>> Or add a new property to specify the rampatch file?
>>>> rampatch-name = "rampatch_xx.tlv";
>>>>
>>>>>
>>>>>> +
>>>>>> +
>>>>>>  required:
>>>>>>    - compatible
>>>>>>
>>>>>> --
>>>>>> 2.25.1
>>>>>>
>>>>>
>>>>
>>>
>>>
>>
> 
> --
> With best wishes
> Dmitry


