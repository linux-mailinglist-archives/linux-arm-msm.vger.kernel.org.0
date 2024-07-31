Return-Path: <linux-arm-msm+bounces-27585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9360C9438C4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 00:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C39FD1C218B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 22:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE4416D4D0;
	Wed, 31 Jul 2024 22:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O67F40qK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F6914B097;
	Wed, 31 Jul 2024 22:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722464627; cv=none; b=OXH6rxcjbJoMGyYU51zxc4puzJeYkxi4hkPsR77g6HuckBYzWrKtOMIoXhRw+WNCRGPq88kHvtRqKzGfDQiQ+nzLTQyp8n232YTRFcw85PinwAHrLAq9/4f7HHZbK3vt4F0V++uX+bmMCJafdyLESm67Y/pZN7bFYF2QaVTuc0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722464627; c=relaxed/simple;
	bh=z6H5tFh1Aufazvx/eFbP7xt7kaAfNxBzeV6eYKOelBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gA9zFAtMWkOJub0uinfLSG9KT7fTZB5BhPgetV+LD/ScQleaeinyFO+ove87oqnHfOcvWr1ZNU3buD8HKGZrkXUKDzH+ujzQZFRqRTA6kaMN4WUG+Uz4UUaIHbWpqrpv9rsHGBiuAxqHMiVCOKxrKR9it2hzT9ZhMy7vO4ADYO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O67F40qK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VF2WXw021468;
	Wed, 31 Jul 2024 22:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddH6laZ2pexW5QiM4y38joJdoWY6zPfghYfEPEbMvOg=; b=O67F40qK7Rfo9thi
	EcyJlgzc/6fWFFATkATutOS2TYREteSMem8VPXiKukLGH3PihvpZAWlnARV/+HbU
	bl/BGZiDHsHaT7RdLP045ZYlp8dJx52kz1Ttqr1y/YAtNyxQBeU/Ngp6ekucrF3h
	Br6bWfkIlDEp/f/nldYYGFnNMODuIxsjR884VZA1byGmiTxKzndjLrWJN4bDZ+OP
	apLBz8jNxH57F5Vrv2pxM3Slne0v+usPWewA69nKAXdS5/GpiH0ImDj9yEBbelg9
	f2QjuqlQFFlsyOj+U+0R9iD7oWBRaDi9MGvldw7LgybTxCZWqOb8aXOP+W7/cgqx
	mdQ1kA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms43ckyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 22:23:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46VMNeLx002440
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 22:23:40 GMT
Received: from [10.110.31.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 15:23:39 -0700
Message-ID: <5275651f-4075-4dac-bba0-da88f5836459@quicinc.com>
Date: Wed, 31 Jul 2024 15:23:37 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: soc: qcom: eud: Add phy related bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
 <20240730222439.3469-2-quic_eserrao@quicinc.com>
 <63cf3198-fb79-466f-b80a-024e970e400a@kernel.org>
Content-Language: en-US
From: Elson Serrao <quic_eserrao@quicinc.com>
In-Reply-To: <63cf3198-fb79-466f-b80a-024e970e400a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oBS6PGTghsTYn5rh5NLrxG9hCW6HQ4K0
X-Proofpoint-ORIG-GUID: oBS6PGTghsTYn5rh5NLrxG9hCW6HQ4K0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310157



On 7/30/2024 10:33 PM, Krzysztof Kozlowski wrote:
> On 31/07/2024 00:24, Elson Roy Serrao wrote:
>> Embedded USB Debugger(EUD) being a High-Speed USB  hub needs
>> HS-Phy support for it's operation. Hence document phy bindings
>> to support this.
>>
>> Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
Ack
>> ---
>>  .../devicetree/bindings/soc/qcom/qcom,eud.yaml       | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> index f2c5ec7e6437..fca5b608ec63 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> @@ -29,6 +29,14 @@ properties:
>>      description: EUD interrupt
>>      maxItems: 1
>>  
>> +  phys:
>> +    items:
>> +      - description: USB2/HS PHY needed for EUD functionality
>> +
>> +  phy-names:
>> +    items:
>> +      - const: usb2-phy
>> +
>>    ports:
>>      $ref: /schemas/graph.yaml#/properties/ports
>>      description:
>> @@ -48,6 +56,8 @@ properties:
>>  required:
>>    - compatible
>>    - reg
>> +  - phys
>> +  - phy-names
> 
> That's an ABI break and nothing in commit msg justified it.
> 

Hi Krzysztof

Thank you for the review.
I see that the only user for EUD as of now is QC sc7280 SoC where phy property
is missing and EUD node is disabled. As described in my cover letter, HS phy
support is needed for EUD functionality and this is applicable to all SoCs
where EUD is to be enabled. Hence phy would be a required property.
Given that the changes in this series are directly applicable to sc7280 as well,
I will re-enable/rectify EUD feature on sc7280 SoC first, by adhering it to this binding
requirement. That would address the ABI break. 
Once the base framework is set I shall extend it to sm8450 SoC.

Regards
Elson 

