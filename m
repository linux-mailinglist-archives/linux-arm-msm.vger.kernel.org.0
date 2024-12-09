Return-Path: <linux-arm-msm+bounces-41030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3149E928B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0679218819F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D0621D00C;
	Mon,  9 Dec 2024 11:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mEZZV6+1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD24021B915;
	Mon,  9 Dec 2024 11:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733744135; cv=none; b=JIyK9nqvCpCkdg8uRs9N2ECct9QrMsoVsdIxPhEZN4ABayTa8+yaVwqTWllGbG8bveb8TbAWNR5zrUoZEHXaHED08Dlmlf2gEvYlK2dS0YJZ6hkfHdlkuN18dBWPGiKn8COfbEmH4yV5bpwqC+WNK1oqwZDLCxVUkKZMMtf0Tl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733744135; c=relaxed/simple;
	bh=e22vLaMLov6DH7nqa5cuHa7cqpYR1vrCoYAtLC8Ml3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lZi2J0q9U9D5aXj11Qz+lYuCSOzzzhROuFUF0KdpF+Kp7Rq19ease5JEdXHP0a65R9qELl3i55Agv9zo0PQnMis8tLpTe9QYVE5R1+PVnUrzjLT2AwTBJau/JE3Gn3IjDGDJDjzJTsvW4I9b7xQ/sVWb8AEvheNbEyCyx43gQR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mEZZV6+1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B99rnha018318;
	Mon, 9 Dec 2024 11:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xrt0SiwLePva/gzbejYMiBPWVCtlmDQ2qlq0ibPbPQg=; b=mEZZV6+18hd3SMcO
	T804LhVkEUVGcFGeMiCxLy9f08UCDFPCMq85e6HPCh9WiTnIiOv0ox8/6eul5pau
	8PM0ou24LI4PMb8mDg05N9+6qAHS1ROgItnMU6Aou2qnCACVa50ZK/H2vBo/Stp4
	q0FaXYpFT7xryvbnBmEcExj6/5eBKX7VhHT5kod8D8Xdhb7shTZ0sSw5dMTZYLLe
	VRpEjJ4m3/cBqEyYj/2wLoXaPb3aN8jM7Izq2hw9GfTtJxPC8zi7cL7gIBiGS7gq
	JUuTV4+cYwdV9vPfndf8sZzsCOZrtnYUtmYZCBNCBf5MzbxzyYA0eUVkK23g+C8i
	QATxAg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ceetmma6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 11:35:17 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9BZGxn013724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 11:35:16 GMT
Received: from [10.216.1.80] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 03:35:08 -0800
Message-ID: <222b6e5b-d673-b57c-43b9-a80b37d28d2d@quicinc.com>
Date: Mon, 9 Dec 2024 17:05:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 1/4] ASoC: dt-bindings: wcd937x-sdw: Add static channel
 mapping support
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_pkumpatl@quicinc.com>,
        <kernel@quicinc.com>
References: <20241209045551.1404782-1-quic_mohs@quicinc.com>
 <20241209045551.1404782-2-quic_mohs@quicinc.com>
 <fq5p4ubdpv3dc5jzqgakvnqzpcrhkfqar2dbcvclqlvbmbegfc@llq3kzkzegl3>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <fq5p4ubdpv3dc5jzqgakvnqzpcrhkfqar2dbcvclqlvbmbegfc@llq3kzkzegl3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4OZ7VcKdA7AtwmVkfClTP1B-1j6rF_u4
X-Proofpoint-ORIG-GUID: 4OZ7VcKdA7AtwmVkfClTP1B-1j6rF_u4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090091

On 12/9/2024 1:19 PM, Krzysztof Kozlowski wrote:
> On Mon, Dec 09, 2024 at 10:25:48AM +0530, Mohammad Rafi Shaik wrote:
>> Add static channel mapping between master and slave rx/tx ports for
>> Qualcomm wcd937x soundwire codec.
>>
>> Currently, the channel map index value for each soundwire port is
>> hardcoded in the wcd937x-sdw driver, and the same channel map index
>> value is configured in the soundwire master.
>>
>> The Qualcomm board like the QCM6490-IDP require static channel map
>> settings for the soundwire master and slave ports.
>>
>> If another boards which are using enable wcd937x, the channel mapping
>> index values between master and slave may be different depending on the
>> board hw design and requirements. If the above properties are not used
>> in a SoC specific device tree, the channel mapping index values are set
>> to default.
>>
>> With the introduction of the following channel mapping properties, it is
>> now possible to configure the master channel mapping directly from the
>> device tree.
>>
>> The qcom,tx-channel-mapping property specifies the static channel mapping
>> between the slave and master tx ports in the order of slave port channels
>> which is adc1, adc2, adc3, adc4, dmic0, dmic1, mbhc, dmic2, dmic3, dmci4,
>> dmic5, dmic6, dmic7.
>>
>> The qcom,rx-channel-mapping property specifies the static channel mapping
>> between the slave and master rx ports in the order of slave port channels
>> which is hph_l, hph_r, clsh, comp_l, comp_r, lo, dsd_r, dsd_l.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> ---
>>   .../bindings/sound/qcom,wcd937x-sdw.yaml      | 36 +++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>> index d3cf8f59cb23..9209667044ba 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>> @@ -58,6 +58,40 @@ properties:
>>       items:
>>         enum: [1, 2, 3, 4, 5]
>>   
>> +  qcom,tx-channel-mapping:
>> +    description: |
>> +      Specifies static channel mapping between slave and master tx port
>> +      channels.
>> +      In the order of slave port channels which is adc1, adc2, adc3,
>> +      dmic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    minItems: 12
>> +    maxItems: 12
>> +    additionalItems: false
>> +    items:
>> +      enum:
>> +        - 0  # WCD9370_SWRM_CH1
> 
> Drop the comments. This does not implement my feedback and you sent it
> four days after I replied to you.
> 
ACK

Somehow, I missed the comments in the last email.

I will address them and will update in next version.

Thanks & Regards,
Rafi.

> Best regards,
> Krzysztof
> 


