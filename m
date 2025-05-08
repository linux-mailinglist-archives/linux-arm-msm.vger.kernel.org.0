Return-Path: <linux-arm-msm+bounces-57209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ACBAAF314
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 07:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 583943A879B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 05:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC891DB356;
	Thu,  8 May 2025 05:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cnROXt0h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4FC136A;
	Thu,  8 May 2025 05:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683179; cv=none; b=BovgIsznuRGEt95Afk+nzaOq8qsfjy8mSQ5rgUq1+v20oEyz3zmfDwKY/BjhdppB5uEL2e5/GQ5idtryZE7rN4G3atKC/AKkaaN3X1vNMqfjlx6kLr5VDZxpugfxGSlJDMPswp5EdHWM8xH2pDteNHsWTuqSXdq7uOYlVmIRTkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683179; c=relaxed/simple;
	bh=ss/4RK5BjT/swp02jG+5lJstfWo3krG0HFi/UmsxU/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TPpM5p1Wp6rsaTV/sNjcfZprXFp5E1urCflV+VmuSX+WSxpItguWuh21hsI1TEII5/7KqEqveuioyKJoBeyfYLpZ7ETKW1sl9KyWovKGYDSNvZZxEW+1VFV3CDVxV0QdfaIHNZOkSwMYr7fy1Yoeed9HEBjH69CRUAXQvcirgZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cnROXt0h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484WkIk016749;
	Thu, 8 May 2025 05:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZlmY9+RE5tVTvzudHgirH8bQj5eAneibbTLM15Rcq+8=; b=cnROXt0hZByAcw74
	LaeUiMakRYDoKLH0Yrt3pGOxp/rSxHXrORiI+OBsDsmfnX7Nq1xfDh8m/Y4ZZKqs
	qf6MOjPufxI34ph4QMLZRGSwV7L08cGZ6+BptaWlP7Bx+lk+K0wUdXOZ6xERsWPu
	yw5jV5IUPCRxV4z/BLDETXocRP5DFJDJaOFQr+HjavInPAtyDaXIjj/BHxfAkFK2
	dk7p1OpbEt0X76CpTmrkNre/qQqE8T3Hya0h+eqz+yfOoxvmLXswy4+LIEalqq6j
	it77Ulx7bnRbJfijlOCp4dt5JZ000bPezwNimvjNFgF4rypjcS7D4sdKhRBRKZxD
	jip9tg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp684s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 05:46:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5485k1TN026146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 May 2025 05:46:01 GMT
Received: from [10.218.11.38] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 May 2025
 22:45:55 -0700
Message-ID: <2f3e608b-5536-4c6d-b7ca-c8cf4c9d0b1b@quicinc.com>
Date: Thu, 8 May 2025 11:15:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] dt-bindings: serial: describe SA8255p
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <psodagud@quicinc.com>, <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
        <quic_mnaresh@quicinc.com>, <quic_shazhuss@quicinc.com>,
        Nikunj Kela
	<quic_nkela@quicinc.com>
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <20250506180232.1299-2-quic_ptalari@quicinc.com>
 <35659475-862a-4678-a2a5-173c2254ae60@kernel.org>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <35659475-862a-4678-a2a5-173c2254ae60@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA0NiBTYWx0ZWRfXwof7nuWtGvQz
 aYcHN86XHWH8ZvQrpqHN60WXkTvU5kxjbs4Kq8dZW03Vgl+eGhJGvcCzc0vEJg1hOnWLUINCcfe
 0/sUtrUbGOwrMMsZeHZkSQscN9gdkaA6+yIFPgFQn+yaABUr3ZsDd3zMajDnXYQ5Uz5TYp8DDd6
 g5EQXTsdot7zx/9nLkrp4LNThNq9U8sMf1CKAF6IH89kKrmcJrbF53fIagrVwje7+EpTgBdOTE9
 WylO1o53ARFCtIlj6cs7rmGN1NX8y94AGgLtjOdEpUstYj4ELwofPHFTjY/WjZxaemVhKRa7Wtp
 CBvBaFsHAvcJhu7gmpD1iALFU522o6Y+GU2gEtV/i76DNACZjfpp/933V14NO1ZfsY54Is8By21
 5MgjWCzuJh/7f4F9wr2xDQmYJCQtcac0ru+J1DgqyZQOmcUDHF9Az6wAyUA124p9EwwoMIq7
X-Proofpoint-GUID: jgEl_RRUtbRNM5Xfh74gibIyVuhAC7vM
X-Proofpoint-ORIG-GUID: jgEl_RRUtbRNM5Xfh74gibIyVuhAC7vM
X-Authority-Analysis: v=2.4 cv=BvGdwZX5 c=1 sm=1 tr=0 ts=681c4519 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=zwwrgv8Ryh7oewfrMAYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_01,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 mlxscore=0
 spamscore=0 mlxlogscore=950 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080046

Hi Krzysztof

Thank you for your patience. I consider your inputs as valuable learning.

On 5/6/2025 11:53 PM, Krzysztof Kozlowski wrote:
> On 06/05/2025 20:02, Praveen Talari wrote:
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sa8255p-geni-uart
>> +      - qcom,sa8255p-geni-debug-uart
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    minItems: 1
> Nothing changed here, this should be dropped based on previous discussion.
>
> You sent this v5 on 8:02 PM of my time. *THEN* you responded to my
> comment at v4 at 8:05 PM. That's the way to waste everyone's time.
>
> I do not understand why interrupt is optional for a new, complete device
> description.

On this platform, there is no use case of waking up UART, so we consider 
the  wake up IRQ as optional.

Thanks,

Praveen

>
> Best regards,
> Krzysztof

