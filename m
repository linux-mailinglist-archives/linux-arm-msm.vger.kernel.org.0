Return-Path: <linux-arm-msm+bounces-48342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B79A39A99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 12:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 686973B5E85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 11:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B3E23FC6E;
	Tue, 18 Feb 2025 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OgfonteP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1464522B8CD;
	Tue, 18 Feb 2025 11:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739877412; cv=none; b=j35JN/2tzcsEb9wz1KznibXuw3WkVbKd2BRmwSrAoJJvnHp6z4jw3cpce5/FTwKdMW7h2Bj/g6tumWDwnPE0Y2W9X6jcbN643o6VcEQfqOkZENDscsPuguHBPIX0+Ze4upvLqFTllNrxvIDcmUfNI62PTQ+Iscnx5gqChg2qYyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739877412; c=relaxed/simple;
	bh=Foto82THQt7AoFetZJgUldbW5IPLxQNH5/iotlNg39c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fdUFOLz3Rsfg3CX2E7vcmj4KQsfZ1TCe+pERuYnDoIN2LobPW9pR8wdSUYfU4efRMLSeDxIISCcVPjHICfEsAipm7+z3ctOhhlGD4Hdhlh0UldIuPAIZj7khEVylXklIy/J0MuhbsgE/CH4m4Glg+BLkJWN3bAesG8cB0my1GRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OgfonteP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HNnfg5029727;
	Tue, 18 Feb 2025 11:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+yT3U+MRUAjHIURYyEXwVn1rwgWVAj6QAOByxnDqtE=; b=OgfontePzTrddn1G
	YfAptMiGzT4d1XDeJ8Kmn0jn6MEdeu6DLcMJdRyjtmON1MIiXfeTXo8qkorv1TjH
	OlOY5HFrFDQ5OzX0EvuvgnsDJWa/0SNDfdrN2TIw0Z4rUcrB8P+72biR0xXNh2HY
	584bmCfmyEyTgUvTqZqaIUyXTRoyRhK6FGrlexCKRvQGXAFY5nsBFtXIW7ZS+gzm
	UKDIbHnWe64upk34jVkp0QgVGd1bnOymlCtwFJ48eFmu4s5VO3owlEVTocF1mDBa
	JmBlpxiqNYCGimyRYVGT/m3RBrJq3pMNW93CgjTX4vCkFwGAupRIr14/ctJSBO3L
	F5TtBg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44v3mg34b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 11:16:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51IBGWIx026728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 11:16:32 GMT
Received: from [10.253.35.15] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Feb
 2025 03:16:26 -0800
Message-ID: <92d5f50d-efc0-462b-8cd2-e73ba77222e5@quicinc.com>
Date: Tue, 18 Feb 2025 19:16:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 13/14] net: ethernet: qualcomm: Add PPE
 debugfs support for PPE counters
To: Andrew Lunn <andrew@lunn.ch>
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
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-13-453ea18d3271@quicinc.com>
 <5a53333b-e94c-4fb7-b23d-e1d38d2dad8e@lunn.ch>
 <a455a2f6-ca0b-43e0-b18c-53f73344981f@quicinc.com>
 <72171304-9a98-4734-85a3-d1302d053602@lunn.ch>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <72171304-9a98-4734-85a3-d1302d053602@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9U6kD39eKAHav1EnDr6Oxigpqs9BUhT3
X-Proofpoint-ORIG-GUID: 9U6kD39eKAHav1EnDr6Oxigpqs9BUhT3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_04,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=982 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180088



On 2/14/2025 10:02 PM, Andrew Lunn wrote:
>>>> +/* The number of packets dropped because of no buffer available, no PPE
>>>> + * buffer assigned to these packets.
>>>> + */
>>>> +static void ppe_port_rx_drop_counter_get(struct ppe_device *ppe_dev,
>>>> +					 struct seq_file *seq)
>>>> +{
>>>> +	u32 reg, drop_cnt = 0;
>>>> +	int ret, i, tag = 0;
>>>> +
>>>> +	PRINT_COUNTER_PREFIX("PRX_DROP_CNT", "SILENT_DROP:");
>>>> +	for (i = 0; i < PPE_DROP_CNT_TBL_ENTRIES; i++) {
>>>> +		reg = PPE_DROP_CNT_TBL_ADDR + i * PPE_DROP_CNT_TBL_INC;
>>>> +		ret = ppe_pkt_cnt_get(ppe_dev, reg, PPE_PKT_CNT_SIZE_1WORD,
>>>> +				      &drop_cnt, NULL);
>>>> +		if (ret) {
>>>> +			seq_printf(seq, "ERROR %d\n", ret);
>>>> +			return;
>>>> +		}
>>>
>>> This is an error getting the value from the hardware? You should not
>>> put that into the debugfs itself, you want the read() call to return
>>> it.
>>>
>>
>> Yes, this error code is returned by regmap read functions in
>> ppe_pkt_cnt_get() when the hardware counter read fails. I will
>> remove it from debugfs file and instead log the error to the
>> console (dev_info).
> 
> and return it to user space via the read() call. These functions
> normally return the number of bytes put into the buffer. But you can
> also return a negative error code which gets passed back to user space
> instead.
> 
> 	Andrew

OK, I will return the negative error code returned by the read() to the
user space, thanks.

