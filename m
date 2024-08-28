Return-Path: <linux-arm-msm+bounces-29744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA1396235E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 11:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BCC71F21FB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A517E16087B;
	Wed, 28 Aug 2024 09:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WbOadfc7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E154615E5B7;
	Wed, 28 Aug 2024 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837365; cv=none; b=mini8Qa5pCCC/lu4NcJUm4DIoXmPGsyY4Km7l5VR3i2HcTdkMGjLF55ku5bOBlHU5tHjzPwvqWuWL0KqKhiwVl+7IVIz5Iv+aZUlQ1m4yzm0ltz2FzrHvOFTTpEIZPBZ6dK/W67zzrfFi53+kLxVfyDqYqcj/aojoEqnmzuJSwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837365; c=relaxed/simple;
	bh=lMpzQ22crmCcj+y+ECHYbAvAeFrYMBp1t1AxjdFHRk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EMWTIAn6IMet1IGmmROGB/Cvm+5FhD/XF7aVUNIgYmsdvE/V5WWtXNm+ARtuBO5FckJP4ywOyvNsa9QEUy9G8kCT3iaWHw3mNEihhc3/dykrEgOoTsr1ShunDxZpnMjyK/gIKKJUpUO/39ANKU5GICtM9xX13yMrf+U7716Jpfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WbOadfc7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLovXB021968;
	Wed, 28 Aug 2024 09:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RVElTk/l7dricTCeJ//gL7OfCui9kHOlh0cz+0/YSY0=; b=WbOadfc79z5UD+u/
	1YmRLFAyZVaYD7fkmQS0ubEA48r+hZD2H0XHlYD1pJUpNxfvaz2L7oOcv3Kec6UG
	BFRk+zIDlSAPaGqyHZ/NpL06mCksdB30UFw/hd18WAXkjU+2NCB3u0k5YFHpMGhw
	HVU6LzA/urvSDuwsx20ewpU2P+HdEdQNs+D+na6Q/qvxuNiFTL8kNlG/gojQrmkr
	s5Tw49sMueY3itbpkLcryfM1eeQ3S3nqSB8OuY2ewmE0aotAGS7mHNBbqUs20SvN
	jJ1zuCOAVfOpwMhtM401TvOvx+xMzRZNcEvgXc8BMrN/bynnseEkKtG+62UmPDlD
	Xv9L1A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419q2xsa9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 09:29:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S9TGMH013042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 09:29:16 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 02:29:10 -0700
Message-ID: <d9022e28-5be9-45a1-8348-20fecef2ff99@quicinc.com>
Date: Wed, 28 Aug 2024 17:29:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: add initial support for QCS615 DTSI
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
 <20240828-add_initial_support_for_qcs615-v1-5-5599869ea10f@quicinc.com>
 <gtoz6fzmukti7mbdihsw5ycltoozhrxgery536rh6dgpcqoru2@gd27iemigqae>
 <955c0fdc-5b04-42d6-a15d-58966c7145c4@quicinc.com>
 <10914199-1e86-4a2e-aec8-2a48cc49ef14@kernel.org>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <10914199-1e86-4a2e-aec8-2a48cc49ef14@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MApJG7NciqBrU7X9OLEKaSnCPKToxs4t
X-Proofpoint-GUID: MApJG7NciqBrU7X9OLEKaSnCPKToxs4t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxlogscore=713 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280067



在 8/28/2024 3:57 PM, Krzysztof Kozlowski 写道:
> On 28/08/2024 09:42, Lijuan Gao wrote:
>>
>>
>> 在 8/28/2024 2:23 PM, Krzysztof Kozlowski 写道:
>>> On Wed, Aug 28, 2024 at 10:02:15AM +0800, Lijuan Gao wrote:
>>>> Add initial DTSI for QCS615 SoC. It includes base description
>>>> of CPUs, interrupt-controller and cpu idle on Qualcomm QCS615
>>>> platform.
>>>>
>>>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs615.dtsi | 449 +++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 449 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> new file mode 100644
>>>> index 000000000000..cf7aaa7f6131
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> @@ -0,0 +1,449 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + */
>>>> +
>>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +
>>>> +/ {
>>>> +	interrupt-parent = <&intc>;
>>>> +
>>>
>>> No need for blank line.
>> Well noted. Will update in the next patch.
>>>
>>>> +	#address-cells = <2>;
>>>> +	#size-cells = <2>;
>>>> +
>>>> +	chosen { };
>>>
>>> Drop, redundant.
>> Well noted. Will update in the next patch.
>>>
>>>> +
>>>> +	clocks {
>>>> +		xo_board: xo-board {
>>>
>>> xo-clk? xo-board-clk?
>>>
>>> But if board, this does not sound like part of SoC. See other files how
>>> they do it.
>>>
>> Other files also added ‘xo_board’. The ‘xo_board’ is the clock that will
> 
> No. Don't use 10yo code as example.
> 
>> be used by other SoC nodes, such as rpmhcc. Currently, the node can be
>> deleted as no one is using it.
> 
> I don't think you understood the problem. This is not the property of
> SoC. We talked about this many times. DTS coding style has even explicit
> guideline for this. Your own go/upstream (which is quite well written
> and complete) probably as well. Did you check it? If there is no such,
> extend it.
>
Got it, I will move it to the board DTS.
> 
> Best regards,
> Krzysztof
> 
> 

-- 
Thx and BRs
Lijuan Gao

