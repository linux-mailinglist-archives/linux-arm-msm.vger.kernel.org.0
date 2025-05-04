Return-Path: <linux-arm-msm+bounces-56672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A473AA838A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 03:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DBDF189B672
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 01:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DF51CFBC;
	Sun,  4 May 2025 01:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NxbWIqRo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379DE376;
	Sun,  4 May 2025 01:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746323403; cv=none; b=dkyvXTCMRB1chR6VnBZXMgE6NcvlDmbymMFdLK1HH8xCzASqfJLinhmPFle5KpfDBZWC3y3nIJfTWCyA6GpzZEYUuTXG8EuESG4Gz+Q/38kLnm+nM5z4EQuOoA4s4wUCPvjG7rCF2plPmuvJLGme9QvmMiuI1iqsh6uM994vM14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746323403; c=relaxed/simple;
	bh=vJ7x5qZ/okXi9QBe6OEnR8AkTiQVxRdodOX57RzU8CQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qrIQHMcrfQOQMI8GVPtwBlANf1F7fZHWnx1FkxhfbWLr3IATjw9tlc41JHx19EWILoag4oUxeoVK64w/3cSgVOkoY/i7LrMQLX8G165Glv9hfLmJCZsjbP3RiySN0NofjH9taMy2c6ppYHAHscqIXLTV/6uzHMOB1JhhK1sguag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NxbWIqRo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543NqsF5019806;
	Sun, 4 May 2025 01:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6KVRFSAWLIXbdvuRxTxb422SHvQxn5IlW1SWnqJ5N04=; b=NxbWIqRowa+oE7dd
	6KbeYBHsOqrLjen9Zexp+iL1uyuD3KGxl9LMx3UYAuYeWMlaEXSZDKHyJNNZi4Vz
	XHlgMPtWcacJi8OrpjpJAJlRXfbPT1+nfGZuLxA1nv+OWnd+jSKLNHbDNUdfSkX9
	TxXmfXtLh7KeFovIDh5VA3n8a/hLfVuVhCjNO8pOq3MG6ZfO5CYQc1b69AFpw7fR
	IQeJSHBpzciiXvSOs/Jw2aBfBYAEFRPjye7JHLkAH8PqPFx/FChndZKAT9IFR9+W
	9riT8XNRcH84Zldl5rsmffa9xmZVQ7Yc1nx90uyTEW/aqDrTLVeJXXjGzfDKpukp
	JtjyxQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc59b62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 01:49:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5441nqlX031372
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 4 May 2025 01:49:53 GMT
Received: from [10.253.79.250] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 3 May 2025
 18:49:49 -0700
Message-ID: <8f11c588-aba8-4550-9066-c6bdda0416d1@quicinc.com>
Date: Sun, 4 May 2025 09:49:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5018 SoC
To: <george.moussalem@outlook.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-1-27902c1c4071@outlook.com>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <20250502-ipq5018-cmn-pll-v1-1-27902c1c4071@outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5dPE0gK7V1J6Fl0RJIc9HPzt403kkICJ
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=6816c7c1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8
 a=8uU5PDXsy-7Xv9xxr94A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 5dPE0gK7V1J6Fl0RJIc9HPzt403kkICJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAxNSBTYWx0ZWRfX/Y5n6lCQg8XT
 VVEtmDk1cyXa8r94sCKSEWW9DQt/AJ106f43p3STZEGtJ4jL8//mkZovoPYGbPShI6d6uh8U24h
 cl7ZdSk6Zwl7loAEVBzgZmFmBKQ5QGu57UDviz2O18cledn/p8tj8KNwkQzwcO9Usr8ZvwxtkuY
 pBL+qJ21zunY5fraXNui6umMM7Feb+sTozPF6ltR9b+y4jZqG1AYQVI7UzPSvVh0Y7rpT49P+Jb
 k37CCi21Gr+roxC1HfVZ+xJopi653QhBRL9OjvR5ZJD/oBSECHsg6XYoEQ2vdiOs+24vTPsOb4o
 2UY00bpVuhB1osHnekjKyaX4wobuyJjokt8sBP27ZgNzihNUDyHC2BDf9PzSv/zOKvTY2kNc84O
 nl4mi2ZvCi368lNJEHtG7SxwTOlQ7G45/8d7UtlwwtfihOTAcqf2iMxEMQfkdBJ7qdGoKnpo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040015



On 5/2/2025 6:15 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The CMN PLL block in the IPQ5018 SoC takes 96 MHZ as the reference
> input clock. Its output clocks are the XO (24Mhz), sleep (32Khz), and
> ethernet (50Mhz) clocks.
> 
> Unlike IPQ9574, the CMN PLL to the ethernet block needs to be enabled
> first in IPQ5018. Hence, add optional phandle to TCSR register space
> and offset to do so.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>   .../devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml  | 11 ++++++++---
>   include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h         | 16 ++++++++++++++++
>   2 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> index cb6e09f4247f4b25105b25f4ae746c0b3ef47616..25006d65d30e20ef8e1f43537bcf3dca65bae73d 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> @@ -24,12 +24,10 @@ description:
>   properties:
>     compatible:
>       enum:
> +      - qcom,ipq5018-cmn-pll
>         - qcom,ipq5424-cmn-pll
>         - qcom,ipq9574-cmn-pll
>   
> -  reg:
> -    maxItems: 1
> -

The property 'reg' should not be removed.

>     clocks:
>       items:
>         - description: The reference clock. The supported clock rates include
> @@ -50,6 +48,13 @@ properties:
>     "#clock-cells":
>       const: 1
>   
> +  qcom,cmn-pll-eth-enable:
> +    description: Register in TCSR to enable CMN PLL to ethernet
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +        - description: phandle of TCSR syscon
> +        - description: offset of TCSR register to enable CMN PLL to ethernet
> +

This TCSR should not be a part of CMN PLL, it is the LDO controller for
the internal GEPHY in IPQ5018 SoC, which can be moved to a part of GEPHY
device.

>   required:
>     - compatible
>     - reg
> diff --git a/include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..586d1c9b33b374331bef413f543c526212c18494
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_IPQ5018_CMN_PLL_H
> +#define _DT_BINDINGS_CLK_QCOM_IPQ5018_CMN_PLL_H
> +
> +/* CMN PLL core clock. */
> +#define IPQ5018_CMN_PLL_CLK			0
> +
> +/* The output clocks from CMN PLL of IPQ5018. */
> +#define IPQ5018_XO_24MHZ_CLK			1
> +#define IPQ5018_SLEEP_32KHZ_CLK			2
> +#define IPQ5018_ETH_50MHZ_CLK			3
> +#endif
> 


