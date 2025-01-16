Return-Path: <linux-arm-msm+bounces-45301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2F9A13FD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 17:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3808F3A3993
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 16:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F17122CA0F;
	Thu, 16 Jan 2025 16:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iJ4s5LGP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0200E1BE87B;
	Thu, 16 Jan 2025 16:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737046300; cv=none; b=vB+TKzFdjPOIJOm4vWLXTRcqTYIUVWBUs/5r5oqTpe/ZOubIC87hpyBlu6w3hgrJdeTB4OBVgta6Le79b7d5UmO5ArEWq+jLBC0ka8prOorkeO+KMLVPoAJcuoV1KiizmlwtZ0iC9vNsp41ozB6EL0ZTXi1Pv5/t+jIzQIkWKCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737046300; c=relaxed/simple;
	bh=D3JD/vbxmwqtIyNWMpjVhxCt6ry4H5+D4k7Wbc3AI+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=c5kXkr3pSXGEsllIwPC5SCD0tpJ113/WlIvtqThcDE5h7nqqndzXexgALY8l4bGIQwRfn7keM81DzMuolqcdzLNQhmouG98OjTtgs61tLnUfRHLudu3WvWw6L+6HM/Dn0s/zRkx139ZuyMU3ZviKLQmAwYwZEvaHXxeW1WbhaKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iJ4s5LGP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GEHb15011611;
	Thu, 16 Jan 2025 16:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OtY1uZXRYVPypdc88s6LWbYwRRfD/kfRfUAAg+Ac6SI=; b=iJ4s5LGPFDFtS6gH
	Tlv39YJ5KGJMBXldTeUHlPWBLwlYSAblxenfICB9wc450jMVqsnfcQKXMGYvQKND
	+rAhdMFvu/dc2b7Xzhx/SB1zD/toOraqYg4+oZ33//VkFmYYQGmOxl1erBYLZJJ9
	UJDewgOfrcTnUbU45yP2/5GwV0FwkWFOj2+yl5s4q/05h8h7pnxGbLWXPShDFhVe
	+tDm9j7wQAFlpzMPYQ1Dxxk2K7dDChzoOrUGSENzUFrFClwNBx+o99VlSznxyZDV
	sCNSKm7BRrMf53L32LecJ2hvGZW3HHk6Je+4MPoxd+gFC8Er0G6M7Z4g+THXM9jp
	FV2alg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4473rercd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 16:51:16 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50GGpFZx024849
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 16:51:15 GMT
Received: from [10.253.79.139] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 16 Jan
 2025 08:51:10 -0800
Message-ID: <778aa678-b097-4b79-b332-ac3af0ad474d@quicinc.com>
Date: Fri, 17 Jan 2025 00:51:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 3/5] net: pcs: qcom-ipq9574: Add PCS
 instantiation and phylink operations
To: Daniel Golle <daniel@makrotopia.org>
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
 <Z4B6DqpZG55aGVh9@makrotopia.org>
Content-Language: en-US
From: Lei Wei <quic_leiwei@quicinc.com>
In-Reply-To: <Z4B6DqpZG55aGVh9@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dJHZlNNrkT1J17zoeNHxJQuHAu-RxBrs
X-Proofpoint-GUID: dJHZlNNrkT1J17zoeNHxJQuHAu-RxBrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_07,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 clxscore=1011 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160127



On 1/10/2025 9:38 AM, Daniel Golle wrote:
> Hi Lei,
> 
> On Wed, Jan 08, 2025 at 10:50:26AM +0800, Lei Wei wrote:
>> ...
>> +/**
>> + * ipq_pcs_get() - Get the IPQ PCS MII instance
>> + * @np: Device tree node to the PCS MII
>> + *
>> + * Description: Get the phylink PCS instance for the given PCS MII node @np.
>> + * This instance is associated with the specific MII of the PCS and the
>> + * corresponding Ethernet netdevice.
>> + *
>> + * Return: A pointer to the phylink PCS instance or an error-pointer value.
>> + */
>> +struct phylink_pcs *ipq_pcs_get(struct device_node *np)
>> +{
>> +	struct platform_device *pdev;
>> +	struct ipq_pcs_mii *qpcs_mii;
>> +	struct ipq_pcs *qpcs;
>> +	u32 index;
>> +
>> +	if (of_property_read_u32(np, "reg", &index))
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	if (index >= PCS_MAX_MII_NRS)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	/* Get the parent device */
>> +	pdev = of_find_device_by_node(np->parent);
>> +	if (!pdev)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	qpcs = platform_get_drvdata(pdev);
> 
> What if the node referenced belongs to another driver?
> 

Usually this case would not happen, unless the DTS for the ethernet 
ports are incorrectly configured. However I can add the 'compatible 
string' check to catch such cases.

>> +	if (!qpcs) {
>> +		put_device(&pdev->dev);
>> +
>> +		/* If probe is not yet completed, return DEFER to
>> +		 * the dependent driver.
>> +		 */
>> +		return ERR_PTR(-EPROBE_DEFER);
>> +	}
>> +
>> +	qpcs_mii = qpcs->qpcs_mii[index];
>> +	if (!qpcs_mii) {
>> +		put_device(&pdev->dev);
>> +		return ERR_PTR(-ENOENT);
>> +	}
>> +
>> +	return &qpcs_mii->pcs;
>> +}
>> +EXPORT_SYMBOL(ipq_pcs_get);
> 
> All the above seems a bit fragile to me, and most of the comments
> Russell King has made on my series implementing a PCS driver for the
> MediaTek SoCs apply here as well, esp.:
> 
> "If we are going to have device drivers for PCS, then we need to
> seriously think about how we look up PCS and return the phylink_pcs
> pointer - and also how we handle the PCS device going away. None of that
> should be coded into _any_ PCS driver."
> 
> It would hence be better to implement a generic way to get/put
> phylink_pcs instances from a DT node, and take care of what happens
> if the PCS device goes away.
> 
> See also
> https://patchwork.kernel.org/comment/25625601/
> 
> I've since (unsucessfully) started to work on such infrastructure.
> In order to avoid repeating the same debate and mistakes, you may want
> to take a look at at:
> 
> https://patchwork.kernel.org/project/netdevbpf/patch/ba4e359584a6b3bc4b3470822c42186d5b0856f9.1721910728.git.daniel@makrotopia.org/
> 
> 
> Cheers
> 
> 
> Daniel

I reviewed the discussion shared above. As I understand, there were two 
concerns from Russel, that can be potentially resolved using a common 
framework for all PCS drivers:

a.) Safe handling of PCS device removals
b.) Consistency in the PCS instance lookup API

For a), please note that the PCS device in IPQ chipsets such as IPQ9574 
is built into the SoC chip and is not pluggable. Also, the PCS driver 
module is not unloadable until the GMAC driver that depends on it is 
unloaded. Therefore, marking the driver '.suppress_bind_attrs = true' to 
disable user unbind action may be good enough to cover all possible 
scenarios of device going away for IPQ9574 PCS driver.

In relation to b), while a common infrastructure is certainly preferable
for the longer term to have a consistent lookup, the urgency is perhaps
more to resolve the issue of hot-pluggable devices going away, and less
for devices that do not support it.

One another issue we can notice currently is the lack of consistency in
the PCS lookup API signatures across drivers (For ex: xxx_get() vs
xxx_create() vs xxx_select_pcs() etc). A common 
naming-convention/signature can be enforced for the lookup API across 
the newer PCS drivers like these, to bring in some consistency in lookup.

Perhaps Russel could provide his comments as well. Thanks.

