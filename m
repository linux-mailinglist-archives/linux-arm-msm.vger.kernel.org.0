Return-Path: <linux-arm-msm+bounces-59384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A47AC3A94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 09:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EB4A1892756
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 07:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3211DF270;
	Mon, 26 May 2025 07:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FgwTR4Yv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF21318DB0D;
	Mon, 26 May 2025 07:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748244344; cv=none; b=TT8Im/Ms9gHbJ4CCYuUqVDOjM3Mai/q5kNkTr86P9mnyaYziFiHLGoXxWvuKsbZaKl5rkUCcl2EIMP3KmSB6iU2aZAsoJWP/mMpUr/gkAO0ch7w2FZdAV6pZd7+BxWAm68AJuNKNYvSSGRwURSjTfBsES+0+B9ixkvQjLLW27SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748244344; c=relaxed/simple;
	bh=jI/6QrKDgQw+a5STQCUZbrlMyan64IJNwwcyUgaiJeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ckG6ZT7gSblfiF4/TlHrRuQX21pZbst4ixZqxI9xxRtnlgNF+SgCPmeUBf8864bESEXeNPfGtZqClj3Ksdy5So4pMGzRVA0LNHzQBU6//ny3xItgeddyUu6AzFXhHyS0CysVamvrp+SftSmUWDKo3a/dCrOTd4AjFOkQE20HEXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FgwTR4Yv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PNetJ9018296;
	Mon, 26 May 2025 07:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sFsCV/DjNz5vL4f4te1C3iQo+A07KiQkSvGfgc9WuHI=; b=FgwTR4YvNw/iNQkX
	xUTYDKebwmzqI726vHADr5Jtjsv29mpbvMbzoKngMYIUNu0XwW+f38AmMGSO9/ky
	YBV94NMg0sGOurG47Xwv8QRjOn/M67MeS4dNLW6WxCiNFZt8/0U826He7htqrzmv
	cWzoeJcWdpYjvsTJGzn1MWNs0PSWmy1WYxQZX4aTdBk+xsRuBSWcvxvVnDJFLm8Z
	vEPcsO7c3yjFxpenXJyWED38oLsXRcZymsJjE8s/XrNtom4SJq5+gfjq8n1URn6M
	g9F9dbIKlWe26lfZiY+xvVF4w+qAAQfwmOJVBlPLfqu74fCE4HrumohP990yKxBi
	kFFE6Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u7dc38wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 07:25:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54Q7PPBK023669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 07:25:25 GMT
Received: from [10.253.8.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 26 May
 2025 00:25:16 -0700
Message-ID: <ce62bdda-b328-4be7-b9d7-1b4bffa039e6@quicinc.com>
Date: Mon, 26 May 2025 15:25:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 01/14] dt-bindings: net: Add PPE for Qualcomm
 IPQ9574 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal
	<quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Simon
 Horman" <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
 <20250513-qcom_ipq_ppe-v4-1-4fbe40cbbb71@quicinc.com>
 <20250519-garrulous-monumental-shrimp-94ad70@kuoka>
 <a182df27-5b0d-42d1-8f58-4e7a913bb12d@quicinc.com>
 <e9dac160-f90a-48e2-9269-245b36c3aefe@kernel.org>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <e9dac160-f90a-48e2-9269-245b36c3aefe@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ctFXOY6aZXB9Cba_WI4zxGky5WX3pqvO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA2MSBTYWx0ZWRfX9SoU85VKL4uu
 BMRnvtaskkMUjU06iumRs8vuh7IPokcNOlBzWmuKhR4xpOUOBQWRC8P3dTWqQ7mUVvyAClrz6y5
 OroKuJM9CdZ7po9NUnCnksMj+nQIucZUUv4n0EjkJf6m22rID+R0sSbqaczAo7ra6c8IIbYMHhq
 m55VToirRUtsNGgtBGmIxRo90P+Vo8p29RNHhAe5Nf6XMo4jPMmBimFxqkemcxDN7/kmYvMqgq7
 F+TTlrTT8mXeaSn9j0UMsnybGbCGs63Yd/uDdhwyLAPwEUqn5bwfYLFBQXGmBjugC6nJhtdSuyb
 wiUYxYHlNvXt9mhIfclS8y95wJ44kVj3gYK97UIExMKmqTsv/hzQVlglskFNM7TFIESTHFauseH
 9DTBDbIItl67LyP2+SMwseThrSBmtqGWKIKqE4kPByixkq8lFnwVZf1FIOn+N0et8W1HxUKN
X-Proofpoint-ORIG-GUID: ctFXOY6aZXB9Cba_WI4zxGky5WX3pqvO
X-Authority-Analysis: v=2.4 cv=Mq5S63ae c=1 sm=1 tr=0 ts=68341765 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=TRFCqlRPH5gG6gXwlP4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 mlxlogscore=861
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260061



On 5/24/2025 2:25 PM, Krzysztof Kozlowski wrote:
> On 23/05/2025 12:28, Luo Jie wrote:
>>>> +  interconnect-names:
>>>> +    items:
>>>> +      - const: ppe
>>>> +      - const: ppe_cfg
>>>> +      - const: qos_gen
>>>> +      - const: timeout_ref
>>>> +      - const: nssnoc_memnoc
>>>> +      - const: memnoc_nssnoc
>>>> +      - const: memnoc_nssnoc_1
>>>> +
>>>> +  ethernet-dma:
>>>
>>> I don't get why this is a separate node.
>>>
>>
>> We used a separate node because the EDMA (Ethernet DMA)
>> is a separate block within the PPE block, with specific
>> functions like ports-to-host-CPU packet transfer and
>> hardware packet steering. We felt that a separate node
>> would depict the hierarchy more clearly. Could you please
>> suggest if a single node is recommended instead?
> Since it is a separate block and it has its own resources, it is fine.

OK, thanks for confirmation.

> 
> Best regards,
> Krzysztof


