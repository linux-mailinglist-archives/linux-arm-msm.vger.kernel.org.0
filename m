Return-Path: <linux-arm-msm+bounces-55534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36042A9BDB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 07:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6554B1B661E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 05:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E561DFD96;
	Fri, 25 Apr 2025 05:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dAKaijZm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C8519BBC;
	Fri, 25 Apr 2025 05:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745557268; cv=none; b=nFinoTAbzS6d96U0W0mk0o/rPryttC2ilvGDkjsiFy1liNWMqKCkRuj+PuV8szkH6jkhkd+Vy0Q0fFVeKJ5Q8aGgyocsgaf4sN4RhWSRTJGREJazcTWMTCBw/Fzw2s7VlJBGhq7ECujnIstAowZeYDy+sSp+LCVvj2sYQ/ro328=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745557268; c=relaxed/simple;
	bh=VeXZdydpcTzvfbdj/IJPGAFHchV4PAKA5/tzzksro2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TOEedpiIsxjg1CBROsEcXb7UiSmRe6EFQRZPmT8cGKzswSZ7L01+GLB/uVWhfYDyNu+SUlzc+qSInlO1nKbDimMiOzLya5nfd8hPDMO4ppvEd8INvinbqj6rI1XhNhpC4i4TmuQnvT9n6RnBRIn5Vbh2/fb7yYDw8RBQuXcN1FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dAKaijZm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P17gta014342;
	Fri, 25 Apr 2025 04:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7/8Tj4IWVZ2RpvhQ2jso4DaJZWt77hpYridMwY7/gtU=; b=dAKaijZmeiyihAqB
	re/zCee8sRXbJ8pRAwJKnEp6LoQA37iL6WxJLJUEAtci28ZEd41OiKhQjeRGMNFr
	eHGlNZJjUkSBQa7zCsE/TiwwO8KpOCsHEVZUDl8Dpuv0Z+bObUWd2rWnG/6GSIPQ
	oObjlBQTiEavsZYL/rOkDtD2pdcB4HlMe+XcoY7n9UBbdxWHxBGsWv/wSb7WtKKK
	DsQEYrPqGnc/TQWqHzMmCsveCosUY4uDM3MMPnOsMUcxFgYEGWgEmBgEA03rYK/z
	oT0kkTdo5nprcqtNEni3hPU6lzSe9xOgFrJyyowKOCOEmvuFDKRdaRd1WmWyqL8D
	t++I1w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3fpy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 04:53:37 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53P4raBi001518
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 04:53:36 GMT
Received: from [10.47.235.76] (10.49.16.6) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 21:53:36 -0700
Message-ID: <95c66338-87c0-4fce-866b-6c43c1d31cd1@quicinc.com>
Date: Thu, 24 Apr 2025 21:53:35 -0700
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
Content-Language: en-US
From: Deepti Jaggi <quic_djaggi@quicinc.com>
In-Reply-To: <f385c9eb-31ef-47c3-84a5-9f4dc86ce6f0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SSSVvELA6MEtrpPWgc1xWc5uNQ3I0Mld
X-Proofpoint-GUID: SSSVvELA6MEtrpPWgc1xWc5uNQ3I0Mld
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDAzMyBTYWx0ZWRfXzAk1/hxPigtp +/qhz/aTMIugzOCQjR2XAOwSHIHv2q6fRe9jdcFvxcnvVX+NU6fFDwZlWYAtM8HVQr2ULjrctvA obfN0bgMM0ceFhejlHrh02W/0yq0QIipOd7JT6gtxXcK5VRwLOD/GlVW9jGjg1g2xH3X9645S9H
 ltXbh5bS4fg1V1m8pOqOMlMYSXYYzF7wCYcXTfVfFtBLAJiVMMr/TqBinsQUyb7mY1vuj2gqLgu WV++4i5piWg9Z6GUXp+9e3AZH3QEmQwrYratJ/oD/ddXW5u7kyH8fqbH7QHTUUhbUPQ7MoyQRfd ZKu16yc9Je67sLbYpe3tLF6hE/RVOTpdG1rZf8KLTksHoFHaOgnLfG55lxj7/aygyEwy9kC43c3
 oNRyHvSpRb7HoLfOC4MPxA7nvEkJgOiDqIf3jfu4VC8ZSLfvnikWzJrZFRUvezjbW4WadsxJ
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680b1551 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Qp6CAqyRjOWTr3wja-QA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250033



On 4/23/25 23:19, Krzysztof Kozlowski wrote:
> On 23/04/2025 01:12, Deepti Jaggi wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
>> new file mode 100644
>> index 000000000000..cb866f897d0a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
>> @@ -0,0 +1,94 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +#include "sa8255p.dtsi"
>> +#include "sa8255p-pmics.dtsi"
>> +#include "sa8255p-scmi.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. SA8255P Ride";
>> +	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
> 
> NAK
> 
> Missing bindings. This is some weird process you have there. Reach to
> your internal guideline before you start posting. It explains this.
> 

I followed the approach used for other bindings [1] [2] [3], 
which were part of the original series and were sent as separate patches 
and accepted. I misjudged that the SoC binding could also be sent as a 
separate patch. I will combine the remaining bindings along with 
the device tree into a single series.
 
The UART/QUP driver changes have been posted as a separate series [4] 
along with the UART bindings. Please advise if the UART/QUP bindings should
also be included as part of next series with dt changes.
 
[1]: https://lore.kernel.org/all/20240910165926.2408630-1-quic_nkela@quicinc.com/ 
[2]: https://lore.kernel.org/all/20240910171534.2412263-1-quic_nkela@quicinc.com/ 
[3]: https://lore.kernel.org/all/20240905194741.3803345-1-quic_nkela@quicinc.com/ 
[4]: https://lore.kernel.org/all/20250418151235.27787-2-quic_ptalari@quicinc.com/
 
> Best regards,
> Krzysztof

--Regards,
Deepti

