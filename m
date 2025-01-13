Return-Path: <linux-arm-msm+bounces-44855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E1DA0B0E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 09:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DFC27A3904
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 08:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6A4233140;
	Mon, 13 Jan 2025 08:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mkubaI8I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E4B231A56;
	Mon, 13 Jan 2025 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736756430; cv=none; b=omyllWWxwfS2OA5CDZ+pQsV38G2sdcdeOHD40qyxqOJ3k9N13gqK/P6PPd0x2ZTY4OYKxKaDh/+HKki05XIe9sG2xs425puV3GtudP0cQwgFoegEpXYcw3BdTJdK1NtpQMCKSXKWcRrfyKNd5JnzAQBN1Thdb/fkFxGNi0AXoZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736756430; c=relaxed/simple;
	bh=4+chX1jsbW61op44SlDeuJje9hKl94J6pDz8yqfyt3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A4/rGOjOVLW/eHxsOVQGqaOd7bEV9bleDF6YkPN8nC7bKKstObFkjhw85aDLnm3IEMjWNkZkLNwnETvOyEzgnOcYKnegwPtyBgkd3vRTF/QQsRSSGPhK3VbDVVd+GvLOFu52bC9QUDdgwrjjH3TkR0U+1V691Hf2zU5Wff+8DOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mkubaI8I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D4sdvw001454;
	Mon, 13 Jan 2025 08:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PgTDnGsNKXJLy6fZXS3tEtI7+FhqPIzJUmiGDgsJesU=; b=mkubaI8I5ym0gxjL
	dXimjiGjOnYdOSxVp42/7vfL57uzFjP22fk50mYo7TMpzJlq8nKhbbbdPh5R49/F
	kJPl1vEoyNy9cjcTqDikK+uaw4QPEox3GuSzS5MydyuEQSsJKeRbv1exXu6Ul5yQ
	j1KgouwDdWYYWphNouqmG+PFIEhf0jdbLu5TYr6L5gqrOqECBPgti+GawY5aj1BR
	XgBErqwN7y8xbEWy7qRIN3oyfBIjILDVRUCbyLjtnFCGD1RM1IgN5npf74hHkDve
	TYu++yh03rZnq9mQkH0W1Ifprdqt74CZGmnwDsPesSLiTCkIdmALrYP40cNSYzZt
	IB2qAg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444v728e1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:20:04 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D8K35W030308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:20:03 GMT
Received: from [10.253.33.98] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 00:19:57 -0800
Message-ID: <44e82323-b40d-41ea-86ee-57c4872a46e8@quicinc.com>
Date: Mon, 13 Jan 2025 16:19:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 3/5] net: pcs: qcom-ipq9574: Add PCS
 instantiation and phylink operations
To: Simon Horman <horms@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit
	<hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_luoj@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <vsmuthu@qti.qualcomm.com>, <john@phrozen.org>
References: <20250108-ipq_pcs_net-next-v4-0-0de14cd2902b@quicinc.com>
 <20250108-ipq_pcs_net-next-v4-3-0de14cd2902b@quicinc.com>
 <20250108100358.GG2772@kernel.org>
 <8ac3167c-c8aa-4ddb-948f-758714df7495@quicinc.com>
 <20250110105252.GY7706@kernel.org>
Content-Language: en-US
From: Lei Wei <quic_leiwei@quicinc.com>
In-Reply-To: <20250110105252.GY7706@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ppbTE0bSAqDDpyLkLjeisu1cD4C7AiqM
X-Proofpoint-ORIG-GUID: ppbTE0bSAqDDpyLkLjeisu1cD4C7AiqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 mlxlogscore=822 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130070



On 1/10/2025 6:52 PM, Simon Horman wrote:
> On Thu, Jan 09, 2025 at 09:11:05PM +0800, Lei Wei wrote:
>>
>>
>> On 1/8/2025 6:03 PM, Simon Horman wrote:
>>> On Wed, Jan 08, 2025 at 10:50:26AM +0800, Lei Wei wrote:
>>>> This patch adds the following PCS functionality for the PCS driver
>>>> for IPQ9574 SoC:
>>>>
>>>> a.) Parses PCS MII DT nodes and instantiate each MII PCS instance.
>>>> b.) Exports PCS instance get and put APIs. The network driver calls
>>>> the PCS get API to get and associate the PCS instance with the port
>>>> MAC.
>>>> c.) PCS phylink operations for SGMII/QSGMII interface modes.
>>>>
>>>> Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
>>>
>>> ...
>>>
>>>> +static int ipq_pcs_enable(struct phylink_pcs *pcs)
>>>> +{
>>>> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
>>>> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
>>>> +	int index = qpcs_mii->index;
>>>> +	int ret;
>>>> +
>>>> +	ret = clk_prepare_enable(qpcs_mii->rx_clk);
>>>> +	if (ret) {
>>>> +		dev_err(qpcs->dev, "Failed to enable MII %d RX clock\n", index);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = clk_prepare_enable(qpcs_mii->tx_clk);
>>>> +	if (ret) {
>>>> +		dev_err(qpcs->dev, "Failed to enable MII %d TX clock\n", index);
>>>> +		return ret;
>>>
>>> Hi Lei Wei,
>>>
>>> I think you need something like the following to avoid leaking qpcs_mii->rx_clk.
>>>
>>> 		goto err_disable_unprepare_rx_clk;
>>> 	}
>>>
>>> 	return 0;
>>>
>>> err_disable_unprepare_rx_clk:
>>> 	clk_disable_unprepare(qpcs_mii->rx_clk);
>>> 	return ret;
>>> }
>>>
>>> Flagged by Smatch.
>>>
>>
>> We had a conversation with Russell King in v2 that even if the phylink pcs
>> enable sequence encounters an error, it does not unwind the steps it has
>> already done. So we removed the call to unprepare in case of error here,
>> since an error here is essentially fatal in this path with no unwind
>> possibility.
>>
>> https://lore.kernel.org/all/38d7191f-e4bf-4457-9898-bb2b186ec3c7@quicinc.com/
>>
>> However to satisfy this smatch warning/error, we may need to revert back to
>> the adding the unprepare call in case of error. Request Russel to comment as
>> well if this is fine.
> 
> Thanks, I had missed that.
> 
> I don't think there is a need to update the code just to make Smatch happy.
> Only if there is a real problem. Which, with the discussion at the link
> above in mind, does not seem to be the case here.
> 

OK.

>> Is it possible to share the log/command-options of the smatch failure so
>> that we can reproduce this? Thanks.
> 
> Sure, I hope this answers your question.
> 
> Smatch can be found here https://github.com/error27/smatch/
> 
> And I invoked it like this:
> $ PATH=".../smatch/bin:$PATH" .../smatch/smatch_scripts/kchecker drivers/net/pcs/pcs-qcom-ipq9574.o
> 
> Which yields the following warning:
> drivers/net/pcs/pcs-qcom-ipq9574.c:283 ipq_pcs_enable() warn: 'qpcs_mii->rx_clk' from clk_prepare_enable() not released on lines: 280.
>

Thanks for sharing this information.

> 
> 


