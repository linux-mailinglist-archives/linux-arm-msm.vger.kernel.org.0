Return-Path: <linux-arm-msm+bounces-47983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6434EA356C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 07:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6D0C189213A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 06:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5842F1DD889;
	Fri, 14 Feb 2025 06:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hG037B7W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979C71DC9BB;
	Fri, 14 Feb 2025 06:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739513400; cv=none; b=ZHjFAMoR+gvDfttFhTwOr7owBtjlWeqyC07Pq9YcXeMUcAbprgSWpjKrT2f9p3qlLEipoXo3lXRAU1+gI4rQ+0iRGnizJj6GW0GZ1Tl3wXbYvj1e1m0EBoBI30v/UTUQjKHpmfOe+WcmxIFHger5fGqHf3697ttU0qnsun7qLG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739513400; c=relaxed/simple;
	bh=vzOLtDLNbwZ6k28Raz3YXTxcfhefEHbtVJ9RqBaS+fM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=F6uigqT9bmMMmelvv/EwNrrDP3QBgsrW9HyKOwh0TWeMj2mcfl9PQFsYk1B0UVpG/q+MtdfY27DAb0YMfPjr7skJTUGlKjHLH1Ete/9L2VbBuIXTsbt+KS+kDWsxBnOUbndYASgjpfJXV7bJses9po2DL0CrmRLa5UW2Ayc0uKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hG037B7W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DJrthP015820;
	Fri, 14 Feb 2025 06:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oxtC73W7s7XwzhQwTpzZ2WHOKktLjMRi2XHEFB1dH3A=; b=hG037B7WsNiC68TZ
	xsnN7ghjNiyRmbcdLxO105dcwChM7QDADbSA9aprEUdkioxZxcKvcPBrs2dYZ6qQ
	BUUANhS67OkcJf5g9cZrgqjh/ckIKv0dOL+PDEqJr/qB9koQ0zwEcdO2gn7lS4Ce
	V79+8wio8KUDmDA+YjLrqcjZ2scNad9stJ4J1AxfkYxcM47eZSwWXBDbtxJiDpme
	OilREDmfgZyA35POQVRRzrAD5u70ZYMosql6C8U37FIWXDFOp7EPnq6+V77S/wOK
	Efxw/OA5tw5l7JRIOGa+TlhxAiVzat66QdlelF3Yj0GpKH/rIRF6LSXscNaKDKXW
	ETLQKg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rgpgqa5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 06:09:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51E69XeU003774
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 06:09:33 GMT
Received: from [10.253.8.223] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Feb
 2025 22:09:27 -0800
Message-ID: <b980cc2b-5c4f-4293-ba1a-496253ae8049@quicinc.com>
Date: Fri, 14 Feb 2025 14:09:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 03/14] net: ethernet: qualcomm: Add PPE driver
 for IPQ9574 SoC
To: Jie Gan <jie.gan@oss.qualcomm.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Lei Wei <quic_leiwei@quicinc.com>,
        "Suruchi
 Agarwal" <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-3-453ea18d3271@quicinc.com>
 <58e05149-abc2-4cf4-a6e8-35380823d94a@oss.qualcomm.com>
 <63f1d25c-087a-46dd-9053-60334a0095d5@quicinc.com>
 <1882f5dd-4e46-40b9-977d-dc3570975738@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <1882f5dd-4e46-40b9-977d-dc3570975738@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ejRAXFTrCBblpUpjQfi9kwfmZIxa6bhv
X-Proofpoint-GUID: ejRAXFTrCBblpUpjQfi9kwfmZIxa6bhv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_02,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=612
 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502140043



On 2/12/2025 9:58 AM, Jie Gan wrote:
>>>> +static int qcom_ppe_probe(struct platform_device *pdev)
>>>> +{
>>>> +    struct device *dev = &pdev->dev;
>>>> +    struct ppe_device *ppe_dev;
>>>> +    void __iomem *base;
>>>> +    int ret, num_icc;
>>> I think it's better with:
>>>      int num_icc = ARRAY_SIZE(ppe_icc_data);
>>
>> This will impact the “reverse xmas tree” rule for local variable
>> definitions. Also, the num_icc will vary as per the different SoC,
>> so we will need to initialize the num_icc in a separate statement.
>>
>> (Note: This driver will be extended to support different SoC in
>> the future.)
>>
> Got your point here. So there may have multiple definitions like 
> ppe_icc_data here, right? But the num_icc here is hardcoded.
> Maybe it would be better defined within the ppe_icc_data, if possible?
> Then just directly use ppe_icc_data->num_icc?
> 
> Never mind, that's just my thought on the flexibility.
> 
> Jie

Yes, the num_icc will be moved the SoC specific .data area of struct
of_device_id, when this driver is extended to support multiple SoCs.

