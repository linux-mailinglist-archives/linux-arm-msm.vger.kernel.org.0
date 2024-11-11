Return-Path: <linux-arm-msm+bounces-37449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 693069C39F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 09:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C64C5B20392
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 08:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659981531E2;
	Mon, 11 Nov 2024 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Dx8nOn0d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65183A8F7;
	Mon, 11 Nov 2024 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731314814; cv=none; b=RXodKLlbq8LuP3r5gZOkO4s3m726rOWZ4shsuuqMEgEB302pBPLqh+itHPtffufNtz9aDsJ+yKDxkYd4rAYL0i9AzkbnXhqfKof8cCmIbbDjwADiF1oubzuYuP1m9nP9GtVcQTtg2t945TLInMd297xEzaU0nAz/kCQjHXoxbgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731314814; c=relaxed/simple;
	bh=zwJM+WDzyCcesBvItNnaHOXOWMmSas0F3+d6S1s2LUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dFjdDr8ylGrGx64Fa5wBhk5iYtSDpM+xh9Ch1nrozlYAfrwXVXVM59klHsUm2jqg0gj6OFcMB6y0kMRebZWlNba2eSBn5HTR/BwaZBz4AhaeHVPeGXWYrWdZxLyw9tjnH3/4lQycbBjY9fYhwq0FgM2ZcDevMyiJ0kYrWxkY0pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Dx8nOn0d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AANfEjJ031648;
	Mon, 11 Nov 2024 08:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tsZb2r3gQpOR9wTnRY8pa/ogh08OGJoadirzhdWyOII=; b=Dx8nOn0dBPmBg8nG
	7oh6j8dRfGOEobQqfCoRVZt9sVtLvWyxNoE0h1LIjr/t2wTkgDMlVWuMJzlhyYz5
	NsKWYKKSx9fwGQdmGvvFQ6pauGlcf7BWd89Me4yhuLlamLIVC73YHi/bF7p8Dp2P
	nqWalDL/W4oTIkmDYBZQz6m5tANhql08vyxOVeap7youJsBPQVPNChOdj7q49uZ8
	1bqP6ANCfgMHR9uXfngJm/4RVyyryFpGpILo2RtaeUtoVyAdB2ybgsqyLVnL0cuy
	doZJEHLDWKsPyRtTKSUKwPtKT6llb5ROBbKXju9epfv4GxhKMrA4Wj4iXtKipLTo
	J+uYmw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sweebvy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 08:46:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AB8kmHC018833
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 08:46:48 GMT
Received: from [10.216.36.177] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 11 Nov
 2024 00:46:44 -0800
Message-ID: <414199fd-c594-4325-8418-4f57d141b9cd@quicinc.com>
Date: Mon, 11 Nov 2024 14:16:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs615: Add QUPv3 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <konrad.dybcio@oss.qualcomm.com>,
        <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20241028112049.30734-1-quic_vdadhani@quicinc.com>
 <50a0a56d-55ce-4b59-a004-b8418309eb92@kernel.org>
 <hwan6cblfhvwmeos4izmhlzfaydxvs4s66wtjulk22aj3zhy6d@xkaqfgxe2sx2>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <hwan6cblfhvwmeos4izmhlzfaydxvs4s66wtjulk22aj3zhy6d@xkaqfgxe2sx2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Z77tso6LbEVB8olppKqpIUyV0nXK1UBg
X-Proofpoint-GUID: Z77tso6LbEVB8olppKqpIUyV0nXK1UBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411110074



On 10/28/2024 5:51 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 28, 2024 at 12:33:48PM +0100, Krzysztof Kozlowski wrote:
>> On 28/10/2024 12:20, Viken Dadhaniya wrote:
>>> Add DT support for QUPv3 Serial Engines.
>>>
>>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>> ---
>>>
>>> Build Dependencies:
>>>
>>> Base:
>>> https://lore.kernel.org/linux-devicetree/20240926-add_initial_support_for_qcs615-v3-5-e37617e91c62@quicinc.com/
>>> https://lore.kernel.org/linux-devicetree/20240926-add_initial_support_for_qcs615-v3-6-e37617e91c62@quicinc.com/
>>>
>>> Clock: https://lore.kernel.org/linux-devicetree/20240920-qcs615-clock-driver-v2-3-2f6de44eb2aa@quicinc.com/
>>> ICC: https://lore.kernel.org/linux-devicetree/20240924143958.25-2-quic_rlaggysh@quicinc.com/
>>> Apps SMMU: https://lore.kernel.org/all/20241011063112.19087-1-quic_qqzhou@quicinc.com/
>>>
>>> v1 -> v2:
>>>
>>> - Add opp-shared property.
>>> - Use QCOM_ICC_TAG_ALWAYS flag in interconnect property.
>>>
>>> v1 Link: https://lore.kernel.org/all/20241011103346.22925-1-quic_vdadhani@quicinc.com/
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 642 ++++++++++++++++++++++++++-
>>>   1 file changed, 638 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> index 865ead601f85..1d1cdf6f9a74 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> @@ -5,6 +5,7 @@
>>>   
>>>   #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>>>   #include <dt-bindings/clock/qcom,rpmh.h>
>>> +#include <dt-bindings/dma/qcom-gpi.h>
>>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>>   #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
>>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> @@ -17,6 +18,21 @@
>>>   	#address-cells = <2>;
>>>   	#size-cells = <2>;
>>>   
>>> +	aliases {
>>> +		i2c1 = &i2c1;
>>> +		i2c2 = &i2c2;
>>> +		i2c3 = &i2c3;
>>> +		i2c4 = &i2c4;
>>> +		i2c5 = &i2c5;
>>> +		i2c6 = &i2c6;
>>> +		i2c7 = &i2c7;
>>> +		spi2 = &spi2;
>>> +		spi4 = &spi4;
>>> +		spi6 = &spi6;
>>> +		spi7 = &spi7;
>>> +		serial0 = &uart0;
>>
>> Comments from v1 apply.
>>
> 
> [...]
> 
>>> @@ -392,6 +428,24 @@
>>>   			#size-cells = <1>;
>>>   		};
>>>   
>>> +		gpi_dma0: qcom,gpi-dma@800000  {
>>
>> Nope. Don't post downstream code.
> 
> I'd say, as this has repeated the second time, please get the patches
> reviewed internally, before sending them for the third time.
> 

Sure, updated in v3.

