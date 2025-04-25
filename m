Return-Path: <linux-arm-msm+bounces-55545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 585AFA9BEDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 08:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C7754A3E8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 06:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB3A22B8D1;
	Fri, 25 Apr 2025 06:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mXFJmGFR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D26F4414;
	Fri, 25 Apr 2025 06:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745563880; cv=none; b=oa47bAabmgzwTCX5WULtBRxtsFrG6OkDpZNGt8RK2PsmpwPb30BP0zIiJoR3g+hWR5Sr9SBg3F+tcYIDNNDWqIQvs1Vl9IMNFku5OnxT/uRWlnZPX/2Vu3W21EdLqWpfyG7gKGW3/HmhTmLIx/olgsnMVPNdhWfJRnguyRoVs5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745563880; c=relaxed/simple;
	bh=nb3vTWz+Wvelt5qlZHWMYU07F4upVUOcSLU60GvzQ8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cEgePorANfNoYchjh7GUC/zlhpWIHsMjuuYerPwcthe5uwKpcp1XPm/uW/iFcoulZkOJVBhmJcl8UuhMaYSGN+c/NeUqn1bhXlxqmv2N4xlhTCdGXPEUgfbnGSOcL+rKJE9FCSS38v3k+1l5I6la75SEaMCOsx2JCada97hNWMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mXFJmGFR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P17THE011794;
	Fri, 25 Apr 2025 06:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P4xnHbw+NePDeMK9N72Y0ac+gyBig+dCGMwpM7o1bIE=; b=mXFJmGFRrvFlVwA5
	GYoZ2a2qy1/8sxIxVx8MCU9XdGV7bAAspvOQUz2isJm90HguDdH2W1NckKMjZF36
	L358Pt3cPWDM7tVS5qsdpCzQ30k4/+qTOose0dZOoWbC2vhYfd287JUFnc6PBdlP
	hIciLoI9Z4vVS/xlIbMLykn74/I5y0R/zWu9IrEMRD3Nd4ihMfDvgII2YneSRopn
	sl8oZcXVMDqgylJRrCVZyO4Wm2pNhe/afQiAYuhd/vfeP6vIuNAKxAK+gQEznqS1
	/nlVmsxAuJJaDHRip54b9Bc6SlVRC3U9CWpXdjYHp3Z7Xr017Fto4CMVCah7VKwW
	h6+hCQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3g0m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 06:51:13 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53P6pCN2011007
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 06:51:12 GMT
Received: from [10.47.235.76] (10.49.16.6) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 23:51:12 -0700
Message-ID: <5a7b02c1-6dde-4a44-9238-d157dec27632@quicinc.com>
Date: Thu, 24 Apr 2025 23:51:11 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: add initial support for qcom
 sa8255p-ride
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <quic_psodagud@quicinc.com>
CC: <quic_ptalari@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Shazad Hussain
	<quic_shazhuss@quicinc.com>
References: <20250422231249.871995-1-quic_djaggi@quicinc.com>
 <f385c9eb-31ef-47c3-84a5-9f4dc86ce6f0@kernel.org>
 <95c66338-87c0-4fce-866b-6c43c1d31cd1@quicinc.com>
 <7cf4302f-a4ba-41fb-bcef-0830013c5698@kernel.org>
Content-Language: en-US
From: Deepti Jaggi <quic_djaggi@quicinc.com>
In-Reply-To: <7cf4302f-a4ba-41fb-bcef-0830013c5698@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA0OSBTYWx0ZWRfX0O7NDxLMyB4Y owGZJEop87bW33upadh+f5dVYZZ2gtEPJtgv8Jq5mZnQ0jOc0h7dFINuJQg/1xGC1YeSOw+lwFb J3xeFjI2NMxiY6fG9FlfAZkbKc36xre4EC0AGpNjIRQGW2qLqDACBF99wV2zuxIn8QOQZSKUcac
 aQCIPJB/pNi5ZFPrbIdYYMrh7Wwx14k7j/dDWaPrDROJgRBnUoUb9ggQtbJ/S/iZ0ijrdF0sBRF xqrIBn8w2iy3nrcmz64AVfLOG735pti5G86tLq/6ZIzEwShXOIGU5K3mShgPHImVPkxsL9/lWBD HP5ZUkI64sx2Yo+rkBWs88ndp/SqbsEFLvgQaoBulwlRlTmXdsmnpgjFoi3u86+3/IF5jMeB6gY
 dc9RTg8XsV0C0mhzdaZQm/gUoPnR3JoAVrfjJ1YUe8uo6ms0aaDKCON++fP6twDSoFIfLTp1
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680b30e1 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=42JSpeVLAZwFaEMy57MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 8SzF81Ti4Z-Yc-eO2SKgUcVnfY1stMWb
X-Proofpoint-GUID: 8SzF81Ti4Z-Yc-eO2SKgUcVnfY1stMWb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250049



On 4/24/25 22:43, Krzysztof Kozlowski wrote:
> On 25/04/2025 06:53, Deepti Jaggi wrote:
>>
>>
>> On 4/23/25 23:19, Krzysztof Kozlowski wrote:
>>> On 23/04/2025 01:12, Deepti Jaggi wrote:
>>>> diff --git a/arch/arm64/boot/dts/qcom/sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
>>>> new file mode 100644
>>>> index 000000000000..cb866f897d0a
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
>>>> @@ -0,0 +1,94 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + */
>>>> +
>>>> +/dts-v1/;
>>>> +
>>>> +#include <dt-bindings/gpio/gpio.h>
>>>> +
>>>> +#include "sa8255p.dtsi"
>>>> +#include "sa8255p-pmics.dtsi"
>>>> +#include "sa8255p-scmi.dtsi"
>>>> +
>>>> +/ {
>>>> +	model = "Qualcomm Technologies, Inc. SA8255P Ride";
>>>> +	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
>>>
>>> NAK
>>>
>>> Missing bindings. This is some weird process you have there. Reach to
>>> your internal guideline before you start posting. It explains this.
>>>
>>
>> I followed the approach used for other bindings [1] [2] [3], 
>> which were part of the original series and were sent as separate patches 
>> and accepted. I misjudged that the SoC binding could also be sent as a 
>> separate patch. I will combine the remaining bindings along with 
>> the device tree into a single series.
>>  
>> The UART/QUP driver changes have been posted as a separate series [4] 
>> along with the UART bindings. Please advise if the UART/QUP bindings should
>> also be included as part of next series with dt changes.
> 
> I think existing docs have it well covered and explained. I advise to
> read all submitting patches documents.

Sure, thanks

> 
> 
> Best regards,
> Krzysztof

