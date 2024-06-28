Return-Path: <linux-arm-msm+bounces-24693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D53091C93A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 00:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD4E71F23B97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 22:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03CB81AA3;
	Fri, 28 Jun 2024 22:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lugt55ik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B071C20;
	Fri, 28 Jun 2024 22:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719614525; cv=none; b=TD9TkyIPRgnd6OvOb8L1XbvvKcnCXAxUmzZO+ntQk/C7J+O6owTKFppPrh3RKRieSDlnRVXiZloK/HuJdpiEKir7IoBzz61T0QvfLxCf7cB/61uhYKqbpjqXCoTw68arAMLy8wOs5zaH9e9V8eN9KN2H8caPhufVnGWZ9rFjPeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719614525; c=relaxed/simple;
	bh=AyK3Lm+F+X/jk62tiF1iTXhvMCtjNEMX48dOVwKzZyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ebDsd4qrDec3EbaimkYRvHlTO7lgilTd94g1IrVe8z0Z/5c0PTBGCQCDeSbxC3VeKiXQEXgqHQ4PMyOqd8rNrJYLdzGaHR0236vbQkroAxEJo1gAGBWTRuSHcc1nFtUEg4Srud/LtIr7VuzFvgPfLsYlWD5xjwVscuLyOIPfOd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lugt55ik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SEBN7f003686;
	Fri, 28 Jun 2024 22:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q/B0/CPUByYij3ScQS1tcbR5XynqSvzb+gPXlNrjmoM=; b=lugt55ikAftS2WiY
	pQ0JRPuOC+xHZXRQuji+JXJ4qrIVp4cQ0AI3taVYMnn36L4FjxX++rnw4rMfYLF9
	Cbm7aLEZP11mDIbhU4Khcsfx8JDD2NhoB96bBiCphyw8/M/DVoQeH0/FSxFDXJ4C
	1fLhzE/6wDdv9tltV+tRZuWs7jpmtM3H1uetPOwyuKsW4gULmPW8pm6Rnjdtl7EQ
	RlLYXIo+yRRfBHdiKxPPoUZ1V4nrgLox+mGmWdZYNP/4i1KekaYTQRCgjp7b9Eti
	CCDms8ajEI9wUxQPOsFff+67R6QsreMpD8elqkyQ0mjx2uockWMjG+xqL0rWHaIe
	lnfhBQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywmafa040-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 22:41:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SMfWSX004961
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 22:41:32 GMT
Received: from [10.110.112.228] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Jun
 2024 15:41:28 -0700
Message-ID: <0e148462-4391-470f-b82d-59b07d900f46@quicinc.com>
Date: Fri, 28 Jun 2024 15:41:28 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] net: stmmac: Add interconnect support
To: Andrew Lunn <andrew@lunn.ch>
CC: Vinod Koul <vkoul@kernel.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Russell King <linux@armlinux.org.uk>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>, <kernel@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
 <4123b96c-ae1e-4fdd-aab2-70478031c59a@lunn.ch>
 <81e97c36-e244-4e94-b752-b06334a06db0@quicinc.com>
 <974114ca-98ed-44a7-a038-eb3f71bd03ef@lunn.ch>
 <22edcb67-9c25-4d16-ab5c-7522c710b1e2@quicinc.com>
 <b6f1c7c1-9fd6-43fe-b7b0-5d4a5fc532d6@lunn.ch>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <b6f1c7c1-9fd6-43fe-b7b0-5d4a5fc532d6@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VNwLsH7IaZtLRHd1pti28tfjJAKucV9h
X-Proofpoint-GUID: VNwLsH7IaZtLRHd1pti28tfjJAKucV9h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_16,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406280171



On 6/28/2024 3:23 PM, Andrew Lunn wrote:
>>> Sorry, PTR_ERR().
>>>
>>> In general, a cast to a void * is a red flag and will get looked
>>> at. It is generally wrong. So you might want to fixup where ever you
>>> copied this from.
>>>
>>> 	Andrew
> 
>> the return type of stmmac_probe_config_dt is a pointer of type plat_stmmacenet_data,
>> as PTR_ERR would give long integer value i don't think it would be ideal to
>> return an integer value here, if casting plat->axi_icc_path to a void * doesn't look
>> good, let me if the below solution is better or not?
> 
>>  	plat->axi_icc_path = devm_of_icc_get(&pdev->dev, "axi");
>> 	if (IS_ERR(plat->axi_icc_path)) {
>> 		rc = PTR_ERR(plat->axi_icc_path);
>> 		ret = ERR_PTR(rc);
> 
> Don't you think this looks ugly?
> 
> If it looks ugly, it is probably wrong. You cannot be the first person
> to find the return type of an error is wrong. So a quick bit of
> searching found ERR_CAST().
> 
> 	Andrew
Thanks Andrew, using ERR_CAST would be ideal here.

