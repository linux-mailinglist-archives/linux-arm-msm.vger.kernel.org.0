Return-Path: <linux-arm-msm+bounces-61698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C23C8ADE5D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 10:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C30C5188BD74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 08:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CD427F4D4;
	Wed, 18 Jun 2025 08:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hbzfTJRU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCCA27F01C;
	Wed, 18 Jun 2025 08:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750235940; cv=none; b=FyX4gKtmmIhHlneprQFeBpSqPWF7j6V46tsJj4FR98eodt4qrvFLoXVpWdOWb36VriUTuXKV7mssT0WyB9XA+KRWSVfeomR7/QI0AwhrFg+2mMD8D/CSkpLZdG0fCB3rSG24F1xiZzqgqYJ+QI5gJ+9Tvu7XERspC41Cn0cXTQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750235940; c=relaxed/simple;
	bh=G+RSgIidmcc8+QlaQIEFM32LREvOAiomoXRxkIQlspE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SLocqFa0L7/VPWu2zdvvbyBW8s7HY3Xax4j4QeI4owiO2aXv9gTR2Y1U4OVUwrw27P7IUsebAfjyF/TM4xXDxle2Qp8c3gkG1zpI/5Omxr8bM9zKFv61nnrnVLOGztE0KdAXRg3hzwHCIBGBfMQz4/E7mcjH7tVywXPaIRx5rFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hbzfTJRU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I1Sa34013276;
	Wed, 18 Jun 2025 08:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AdD1WMfEdHKmW1Nn/+epgWe5n6XWQmEaz5wsJjHmz0I=; b=hbzfTJRUbsFYS9oc
	mlKqTjwIAKScx9r7wd5UdBrOQLAiGqwqSihhGRDqujkc+AQFfj1j2A05iZsuiLvc
	jP57iXgYwjLkxoC1AH186WOvAyEMdw7afclmnfh0ZVBzegW44mt29Qy3IPY/d+Xc
	7J6/QjDgChtdswH9kAfQi0sFvuV8aIhP1MK3Zzh0XasgTJn6K+pZiQTc/NNUriPl
	aclzKdk2hhWWpUOZPKa1dvk2kEXa9D9/mrjoiuvNBzSFuXArcQgXxDDZuFyF5at9
	8a/JKwjduC1tc0OB7GQEgMfyoZaXrA/5NuVz3C5APxFnorcVw7ewNfWlXGjJOcfy
	Ptkbqw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mkbv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 08:38:52 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55I8cp5N001427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 08:38:51 GMT
Received: from [10.217.216.168] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Jun
 2025 01:38:45 -0700
Message-ID: <d1ffbcf5-967a-4c1e-9f2c-becc5fb6c6ed@quicinc.com>
Date: Wed, 18 Jun 2025 14:08:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: controller: Add
 max-sd-hs-frequency property
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <kernel@oss.qualcomm.com>
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
 <20250618072818.1667097-3-quic_sartgarg@quicinc.com>
 <6040afd9-a2a8-49f0-85e9-95257b938156@kernel.org>
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <6040afd9-a2a8-49f0-85e9-95257b938156@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA3NCBTYWx0ZWRfXz24EQlnluwGA
 rGsyGORj7o6N8rDG6iEBTDC6/05nuguF5lxOyRIGhqrxMFwf8oDswdSpuDcGaWSn7QhjnM32YBx
 EOFLL+Olt54mGmMacsIwJM6tWVxVfyxneaurY5pJa5LimqyqeseQkVvuDc8cFNepEL0KqZccowr
 1F7HC4xnA1gg1IBtsj4PkuMepbG1vi/geccE7KxsUgJFfn1Hs8+KIMJw/87TD8hGiL5HYF+PqnW
 rabRLU/WmM/iEzwLg6b84AvUnB2VYYXwGKyvjkvPfQmiEFVK4tLI+OHCBilN+2nroBZzKaiW5sy
 DVMb404WeEZitsb8x8spSZuow9MChXbbWJr2KmkOwF/kY5IPXwv80QiYAhmcG2lek/TezMb7J2R
 TgfbdnPZGpR3b5KX0mO7OAb37KAzvDIGQXlIn5/Zx53R8IEb70bYnrOd4WqnxhpSNxIf1lR4
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=68527b1c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=n2guzD_OBVmuCnK1DsEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pjTl4ENulpfPvlypMoUHlMtLEwvLTWTZ
X-Proofpoint-ORIG-GUID: pjTl4ENulpfPvlypMoUHlMtLEwvLTWTZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_03,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180074



On 6/18/2025 1:13 PM, Krzysztof Kozlowski wrote:
> On 18/06/2025 09:28, Sarthak Garg wrote:
>> Introduce a new optional device tree property `max-sd-hs-frequency` to
>> limit the maximum frequency (in Hz) used for SD cards operating in
>> High-Speed (HS) mode.
>>
>> This property is useful for platforms with vendor-specific hardware
>> constraints, such as the presence of a level shifter that cannot
>> reliably support the default 50 MHz HS frequency. It allows the host
>> driver to cap the HS mode frequency accordingly.
>>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> ---
>>   .../devicetree/bindings/mmc/mmc-controller-common.yaml | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> index 9a7235439759..1976f5f8c401 100644
>> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>> @@ -93,6 +93,16 @@ properties:
>>       minimum: 400000
>>       maximum: 384000000
>>   
>> +  max-sd-hs-frequency:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Maximum frequency (in Hz) to be used for SD cards operating in
>> +      High-Speed (HS) mode. This is useful for platforms with vendor-specific
>> +      limitations, such as the presence of a level shifter that cannot support
>> +      the default 50 MHz HS frequency or other.
>> +    minimum: 400000
>> +    maximum: 50000000
> 
> This might be fine, but your DTS suggests clearly this is SoC compatible
> deducible, which I already said at v1.
> 
> So now you send v3 which is the same as v1, so you get the same comments.
> 
> Best regards,
> Krzysztof

Introducing this flag no longer becomes SoC compatible because as per 
discussions in V2 patchset with Ulf and Konrad this new property can be 
used by any vendor who wants to limit the HS mode frequency due to any 
reason. Thats why moved to this generic approach again in V3 as compared 
to compatible based approach in V2.

