Return-Path: <linux-arm-msm+bounces-40824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7489E75C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 17:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29A892876C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 16:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7203620E32A;
	Fri,  6 Dec 2024 16:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ALqLwO+t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F74720DD79;
	Fri,  6 Dec 2024 16:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733502070; cv=none; b=noGc8OfVTalrOz3rO3xZgg+2Gvrxmk3SFA84ZXP0w2PHy38t6Wy+KuyYyrxgLlXpHMZaTz3rNql0Fpzjb4goMY6aeLE6EOTfzMheds2GX/7ZAtliEJFj5Z1fnKmMGIyFuMnAIYk71RNhbmG2m/XW8LmzosxldpSlxqXM8g/rNwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733502070; c=relaxed/simple;
	bh=JA9swdKidEphhW5MGht/Hzh1q4Pi43LbfowCrjRYTcQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=XVX/za7XvU9/lWD+UQ5cZyQt5mFp6+JZ4tGxG49JFmeYiz2t4B7IdR3PvH9iUb7cJBzPcoaeV4vNYVcBc2bpzG5loNzFYr8+eXN/RPdzGbUezjMI3193/yVL/5WKqo0QurmarSORVKsT481Suz2YyXDiS7D9XAReY75uOVG38l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ALqLwO+t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B69c0mp026486;
	Fri, 6 Dec 2024 16:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9rgdpypyMiuZFb/Kzr4lfbY2QURoDj3O7jTtUsLfNq4=; b=ALqLwO+tFzQ8S3N0
	P5ZuZe7SffahvrYKAIW5KudVet22F7lPk9rJn2ukE50lYTAUeLxKurMBnVfUt7wJ
	2hCPYqteUnt+kr0HY9JJ2M5WazDSJKJ3L4Xl2OZySmOtLJUme00vzbW64uEiUyAX
	e47/Re/oZmSHGw6TTAZgYzSC/rsGF5lWJfHeed73TslAkDbpXfvB2EhC5DbvhY3Y
	Q8AFfhWZAz5oRgYnmopcN54maND7T/RSFrVvIVoLJOl1CDXnKL8XW52MwicW1bx6
	/sL9BoO8Oo+ZGJfBnpMDEplFqPdzLqD/HhlRptwZYd7R7ojIc77Wv7gsXknExfcq
	hYfnZQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bxtc92y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 16:20:48 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6GKlVI003601
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 16:20:47 GMT
Received: from [10.253.9.12] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 08:20:42 -0800
Message-ID: <f54ad0e2-10d7-40ff-872f-d7c92ae8519b@quicinc.com>
Date: Sat, 7 Dec 2024 00:20:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Lei Wei <quic_leiwei@quicinc.com>
Subject: Re: [PATCH net-next v2 3/5] net: pcs: qcom-ipq9574: Add PCS
 instantiation and phylink operations
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Lunn
	<andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_luoj@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <bartosz.golaszewski@linaro.org>, <vsmuthu@qti.qualcomm.com>,
        <john@phrozen.org>, <linux-arm-msm@vger.kernel.org>
References: <20241204-ipq_pcs_rc1-v2-0-26155f5364a1@quicinc.com>
 <20241204-ipq_pcs_rc1-v2-3-26155f5364a1@quicinc.com>
 <Z1B1HuvxsjuMxtt0@shell.armlinux.org.uk>
Content-Language: en-US
In-Reply-To: <Z1B1HuvxsjuMxtt0@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RtqHHX_6FB2oPxCVouKABH1lM6wz7rPc
X-Proofpoint-ORIG-GUID: RtqHHX_6FB2oPxCVouKABH1lM6wz7rPc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0
 suspectscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060123



On 12/4/2024 11:28 PM, Russell King (Oracle) wrote:
> On Wed, Dec 04, 2024 at 10:43:55PM +0800, Lei Wei wrote:
>> +static int ipq_pcs_enable(struct phylink_pcs *pcs)
>> +{
>> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
>> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
>> +	int index = qpcs_mii->index;
>> +	int ret;
>> +
>> +	ret = clk_prepare_enable(qpcs_mii->rx_clk);
>> +	if (ret) {
>> +		dev_err(qpcs->dev, "Failed to enable MII %d RX clock\n", index);
>> +		return ret;
>> +	}
>> +
>> +	ret = clk_prepare_enable(qpcs_mii->tx_clk);
>> +	if (ret) {
>> +		dev_err(qpcs->dev, "Failed to enable MII %d TX clock\n", index);
>> +		clk_disable_unprepare(qpcs_mii->rx_clk);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void ipq_pcs_disable(struct phylink_pcs *pcs)
>> +{
>> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
>> +
>> +	if (__clk_is_enabled(qpcs_mii->rx_clk))
>> +		clk_disable_unprepare(qpcs_mii->rx_clk);
>> +
>> +	if (__clk_is_enabled(qpcs_mii->tx_clk))
>> +		clk_disable_unprepare(qpcs_mii->tx_clk);
> 
> Why do you need the __clk_is_enabled() calls here? Phylink should be
> calling pcs_enable() once when the PCS when starting to use the PCS,
> and then pcs_disable() when it stops using it - it won't call
> pcs_disable() without a preceeding call to pcs_enable().
> 
> Are you seeing something different?
> 

Yes, understand that phylink won't call pcs_disable() without a 
preceeding call to pcs_enable(). However, the "clk_prepare_enable" may 
fail in the pcs_enable() method, so I added the __clk_is_enabled() check 
in pcs_disable() method. This is because the phylink_major_config() 
function today does not interpret the return value of phylink_pcs_enable().

>> +static void ipq_pcs_get_state(struct phylink_pcs *pcs,
>> +			      struct phylink_link_state *state)
>> +{
>> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
>> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
>> +	int index = qpcs_mii->index;
>> +
>> +	switch (state->interface) {
>> +	case PHY_INTERFACE_MODE_SGMII:
>> +	case PHY_INTERFACE_MODE_QSGMII:
>> +		ipq_pcs_get_state_sgmii(qpcs, index, state);
>> +		break;
>> +	default:
>> +		break;
> ...
>> +static int ipq_pcs_config(struct phylink_pcs *pcs,
>> +			  unsigned int neg_mode,
>> +			  phy_interface_t interface,
>> +			  const unsigned long *advertising,
>> +			  bool permit)
>> +{
>> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
>> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
>> +	int index = qpcs_mii->index;
>> +
>> +	switch (interface) {
>> +	case PHY_INTERFACE_MODE_SGMII:
>> +	case PHY_INTERFACE_MODE_QSGMII:
>> +		return ipq_pcs_config_sgmii(qpcs, index, neg_mode, interface);
>> +	default:
>> +		dev_err(qpcs->dev,
>> +			"Unsupported interface %s\n", phy_modes(interface));
>> +		return -EOPNOTSUPP;
>> +	};
>> +}
>> +
>> +static void ipq_pcs_link_up(struct phylink_pcs *pcs,
>> +			    unsigned int neg_mode,
>> +			    phy_interface_t interface,
>> +			    int speed, int duplex)
>> +{
>> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
>> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
>> +	int index = qpcs_mii->index;
>> +	int ret;
>> +
>> +	switch (interface) {
>> +	case PHY_INTERFACE_MODE_SGMII:
>> +	case PHY_INTERFACE_MODE_QSGMII:
>> +		ret = ipq_pcs_link_up_config_sgmii(qpcs, index,
>> +						   neg_mode, speed);
>> +		break;
>> +	default:
>> +		dev_err(qpcs->dev,
>> +			"Unsupported interface %s\n", phy_modes(interface));
>> +		return;
>> +	}
> 
> So you only support SGMII and QSGMII. Rather than checking this in every
> method implementation, instead provide a .pcs_validate method that
> returns an error for unsupported interfaces please.
> 

Yes, I can add the pcs_validate() method to validate the link 
configurations. This will catch invalid interface mode during the PCS 
initialization time, earlier than the pcs_config and pcs_link_up contexts.

But after of the PCS init, if at a later point the PHY interface mode 
changes, it seems phylink today is not calling the pcs_validate() op to 
validate the changed new interface mode at the time of 
"phylink_resolve". (Hope my understanding is correct).
So, In the pcs ops methods, I will keep the switch case to check and 
handle the unsupported interface modes.

> Thanks.
> 


