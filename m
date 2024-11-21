Return-Path: <linux-arm-msm+bounces-38590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7CC9D4672
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 05:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E183B1F22610
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 04:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9398461FCE;
	Thu, 21 Nov 2024 04:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UnAhUTr/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24302309B6;
	Thu, 21 Nov 2024 04:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732161999; cv=none; b=vDyn2Fvj1hvXKh3H5IWu5mDJjfnIQ2HJ8xuGASXHzprJwqI08NYJnV20frnGdWuX+2wxihy5lhIR48h/a0nDC+1+IHNc7rxSKUFQtPG0AAcbrDmnfpxxj1M8jLL5sq84KNoNzJxVXadVGWHL5uvW9eynpCdy54lJmR/T4mbR6yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732161999; c=relaxed/simple;
	bh=66fXLuECvlddQ+6m0bmhm4Te9rrzvORhHhSsJOmsMOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=REqdroTohLxPq8eX0pgCoSjv4LxTUaE/SqSHUtOe+phrFYNkcue/gxrfG9flpawlG9kLz+146KeEvJMnz1bpAFKzQPol9XprCtv+lP2wjQiNtF+s59MLrCljpVYV9/emEIPe/p+cMoRrYj/IX0mMo9QbuWTyLggqeruYM5SfVQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UnAhUTr/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKNvASq023455;
	Thu, 21 Nov 2024 04:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lMYIYE9ei/enmSIZ9OINW2gwxGaG9eomPbB/VHIsZ48=; b=UnAhUTr/H6ERfy5Y
	vxgyDXNK3Ay9F70gU6GhkgMKQz/X5iwF33KXPRfVi8FWFTcmPaSjuOgerk1MpKfy
	uGXoimQyupYbCz9BRfP11cf5bSMefiZsYtLHawlprTmtLdm41MFpPXtfFoo+Urtr
	W1vhlIHS86tVTiahnuWx1CsfGPn2y7qYKwb+TEn7UzTIS+Rhze7Pi1e5+7XpdqbO
	BFcEteth/Mu57U3iRY0Iu6mJQ4t1pexXM7iOxnog/0MIBV8hGKe8xwmZJE3f+QVe
	n+4sWPtPE6dr8Ii0zH1I/8hC/ZXrrfYML99SuUzogLgm/E7B5E8vKYGmrqGdqaKD
	SZAkXQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431sv2gf1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 04:06:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL46TJp014883
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 04:06:29 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 20:06:24 -0800
Message-ID: <0b0b55a2-ab80-4f6d-a4cf-c04acc94a989@quicinc.com>
Date: Thu, 21 Nov 2024 12:06:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: bluetooth: add 'qcom,product-variant'
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Marcel Holtmann
	<marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Balakrishna Godavarthi
	<quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>, <quic_zijuhu@quicinc.com>
CC: <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_mohamull@quicinc.com>
References: <20241120095428.1122935-1-quic_chejiang@quicinc.com>
 <20241120095428.1122935-2-quic_chejiang@quicinc.com>
 <c8ae761a-732c-4def-ac6e-5e1b16a21ada@kernel.org>
Content-Language: en-US
From: Cheng Jiang <quic_chejiang@quicinc.com>
In-Reply-To: <c8ae761a-732c-4def-ac6e-5e1b16a21ada@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NAcC7glnuBMOo1zEnVJQr-rdZK-reS-b
X-Proofpoint-ORIG-GUID: NAcC7glnuBMOo1zEnVJQr-rdZK-reS-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210029

Hi Krzysztof,

On 11/21/2024 12:47 AM, Krzysztof Kozlowski wrote:
> On 20/11/2024 10:54, Cheng Jiang wrote:
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
> Nah, you have firmware-name for this.
> 
Currently "firmware-name" is used to specifythe nvm (config) file only,
we also need to specify the rampatch file (TLV). 
 
Can we re-use the "firmware-name"? add two segments like the following?
firmware-name = "rampatch_xx.tlv",  "nvm_xx.bin";

Or add a new property to specify the rampatch file? 
rampatch-name = "rampatch_xx.tlv";

Thanks!
> 
>> +
>> +
> No clue why two blank lines...
> 
> Best regards,
> Krzysztof


