Return-Path: <linux-arm-msm+bounces-64114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E971AFDF2A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 07:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E83A581222
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 05:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190752690F9;
	Wed,  9 Jul 2025 05:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mx73dXnL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475BE18A6AE;
	Wed,  9 Jul 2025 05:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752038330; cv=none; b=E/WSc+KoQcrFcdxtH0kwQ4wN9kGUe8ldxQQ1gumUu9UjT+6a2lvGIL6zb95tGDQzvjxH4lEo47lrJYMKRyblApQTmWV4IOqwN3qdF/DO+WPtpNac5m2fJ4RtglajlruX9drFDhLba9nKS+QUVGfTMVyYFQ4esJSFpTD3lyuSycQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752038330; c=relaxed/simple;
	bh=1xCNUHqd1La2UW/VvN6Z8DIOrdkvNdtqhsZO4HrzCDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=M3THiAyg7P2oU3ZrZHdGWLdKw0q9Ma2ZODZxzrsqEECCSwLUQlqLodC7EEMAyWN65vOYoc/+Ktv/aELPD62ndx8Juaxjb0ZHoa5xB6Gh5vS0zPJRvzGGrgN8IVUyaLOegGfRLatjWDWHrxJYoj26PxWAW9jLPFbXkrwZjMK5n1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mx73dXnL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568JS2PX003496;
	Wed, 9 Jul 2025 05:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MaDEQ1Ij85wtKQqMV7Oa2nU4uzwmL6vyXzr2yNzhcys=; b=mx73dXnLJPcoFfET
	zvrqV0JCxklZyCbWvxwwkAbXkxQw20QXCslGRAEUxAImz2cf8OouVb9xVZmTaDx3
	HBM6TvPlhcqY/fFP58ZwgeSOpQENHXGbUmsoFQ5x58Ef2ka5diPdt2SQpVqk65UG
	GXpE6yeURONyegy0GGwd0A53AHW3y/F3bhBZGQLDksMMyMwQT+k3s1Ke+E5bM1zM
	xs9zk498KCb8oh6JFRNFttA5gQzJe9r5AnbrUK9egyP51IB+6YfyzhbL5sOnKpGT
	s7bR351TZpv/wBWMGZbJgjZe0+jYHoLzhT2cVCoHOZE+haGu1LLHEacYEj24/vpa
	0e9xFg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefk32f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 05:18:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5695IOFc007093
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 05:18:24 GMT
Received: from [10.253.73.142] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 8 Jul
 2025 22:17:49 -0700
Message-ID: <0e60e901-2284-462e-b853-617dd66f1a30@quicinc.com>
Date: Wed, 9 Jul 2025 13:17:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] net: phy: qcom: Add PHY counter support
To: Andrew Lunn <andrew@lunn.ch>
CC: Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
	<linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250709-qcom_phy_counter-v1-0-93a54a029c46@quicinc.com>
 <20250709-qcom_phy_counter-v1-1-93a54a029c46@quicinc.com>
 <d64c9e64-879a-431a-b53f-06cb7166b940@lunn.ch>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <d64c9e64-879a-431a-b53f-06cb7166b940@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA0NCBTYWx0ZWRfX+LIV+K15Xqi+
 kR9Z9DRLt/CWvsPXeTRQLgOinPvH6IaEP23siPsRDrgnSUcjym/tuid4KJ9PwfpdL+BRsLzjKDq
 ydXdKfBakvWuJXewIJBHWj/qHcewWRcYj2zHhEvcccfn3oNvPidg5CSs26efh++j6RfhS1DrQDb
 rKODnYfECvZnyNtwYkUYuOmdQsqaLimvPdIr9iqhi+4TPC803Se3T2j5pzYCMLnZfbMPlGaiZgE
 qtflYJCarJW6Gh38YWEEABOadJiMFGpdoOnwkazVEYlUJsWribtTZ3Ktz7XzX8dec0dIZiVXzXE
 kQhhor2cetqyRVm3GQrHUFlXnuXYG0VnC9hXNCo17/f3+NZ/l04piXu0bqvEZH5/AL8b3oXr53H
 qus8jVT1LL9njhoyohQn047slNFEX2N0pBfEv/k3JMbHg7I6fhBs5ttiJRwpPToc135KAseS
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686dfba1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=W73qtzVWVrH02KjBnYgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: -ENnY046Iz5v47QQJGyZjJ2L6DqKQeYl
X-Proofpoint-ORIG-GUID: -ENnY046Iz5v47QQJGyZjJ2L6DqKQeYl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_01,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090044



On 7/9/2025 12:31 AM, Andrew Lunn wrote:
>> +static const struct qcom_phy_hw_stat qcom_phy_hw_stats[] = {
>> +	{
>> +		.string		= "phy_rx_good_frame",
>> +		.devad		= MDIO_MMD_AN,
>> +		.cnt_31_16_reg	= QCA808X_MMD7_CNT_RX_GOOD_CRC_31_16,
>> +		.cnt_15_0_reg	= QCA808X_MMD7_CNT_RX_GOOD_CRC_15_0,
>> +	},
>> +	{
>> +		.string		= "phy_rx_bad_frame",
>> +		.devad		= MDIO_MMD_AN,
>> +		.cnt_31_16_reg	= 0xffff,
>> +		.cnt_15_0_reg	= QCA808X_MMD7_CNT_RX_BAD_CRC,
>> +	},
>> +	{
>> +		.string		= "phy_tx_good_frame",
>> +		.devad		= MDIO_MMD_AN,
>> +		.cnt_31_16_reg	= QCA808X_MMD7_CNT_TX_GOOD_CRC_31_16,
>> +		.cnt_15_0_reg	= QCA808X_MMD7_CNT_TX_GOOD_CRC_15_0,
>> +	},
>> +	{
>> +		.string		= "phy_tx_bad_frame",
>> +		.devad		= MDIO_MMD_AN,
> 
> Are there any counters which might be added later which are not in
> MDIO_MMD_AN? It seems pointless having this if it is fixed.

Yes, this structure is designed to be extended in the future to support
10G-capable PHY chip, where the counter resides in the MDIO_MMD_PCS
when the link speed is 2500 Mbps or higher. I will add a comment to the
structure to clarify this intent.

> 
>> +		.cnt_31_16_reg	= 0xffff,
>> +		.cnt_15_0_reg	= QCA808X_MMD7_CNT_TX_BAD_CRC,
>> +	},
>> +};
> 
> There has been an attempt to try to standardise PHY statistics. Please
> look at:
> 
> **
>   * struct ethtool_phy_stats - PHY-level statistics counters
>   * @rx_packets: Total successfully received frames
>   * @rx_bytes: Total successfully received bytes
>   * @rx_errors: Total received frames with errors (e.g., CRC errors)
>   * @tx_packets: Total successfully transmitted frames
>   * @tx_bytes: Total successfully transmitted bytes
>   * @tx_errors: Total transmitted frames with errors
>   *
>   * This structure provides a standardized interface for reporting
>   * PHY-level statistics counters. It is designed to expose statistics
>   * commonly provided by PHYs but not explicitly defined in the IEEE
>   * 802.3 standard.
>   */
> struct ethtool_phy_stats {
>          u64 rx_packets;
>          u64 rx_bytes;
>          u64 rx_errors;
>          u64 tx_packets;
>          u64 tx_bytes;
>          u64 tx_errors;
> };
> 
> Please use this if possible.
> 
>      Andrew

Thank you for the suggestion. I will review the standardized PHY
statistics framework and update the implementation accordingly to
ensure alignment.

> 
> ---
> pw-bot: cr


