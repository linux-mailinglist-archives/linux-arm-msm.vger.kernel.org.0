Return-Path: <linux-arm-msm+bounces-41316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7382A9EB1EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 14:28:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 985E0288BC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 13:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425DD1A9B3C;
	Tue, 10 Dec 2024 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L467hc6b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9A578F5D;
	Tue, 10 Dec 2024 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733837305; cv=none; b=WjTdpwp3hgwMUssA7LUJ8DMzn57bhO+eHDiMM5x6ACNvmL6HwGuAEkVKP5p+2onFgjLm7k3ty+VTublZGtHDNSu89pzGueHFhj3MgYvfaqQxPf+QtYqnBgAy4TJlD+42dGvnp7EDfB2IMCG7fy41ryUuhbLnTxjX+PxKwEoph+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733837305; c=relaxed/simple;
	bh=2rKaojPx8fRbx1KlLMrXM2EvSDZWAc6iS0uvbVQFQEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Cr/ZZJkMM6du7R8phGPtXqwcUys+IaY1ghYhAZBiH+aR0kDBEfFMUL4zb6Q0yClMsobVT6+A49swn5KwsePu8PLWX9yv3ZF6+tcJ7K9N7qQaEezFft6m23ewIBFTn2HCBpHU+XhHSThRkxkvf6jlamwK47gjGWAwyHlVRPaE+AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L467hc6b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA6vweP012697;
	Tue, 10 Dec 2024 13:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xwufCZjhQyIi2Dv6rkuSyZZEs1hcGiiUHjDPmi8ACl4=; b=L467hc6bV8miyB5w
	7FQkfh/G4Rn1y6HtP7Xy2fofiMgNVtPaVr8FYJ881ZFu8qbzPmd+9S+bi40Qelti
	oP+wzCJXPKyFTm8PWLuwFqL3jsXSdm5ehon4xotaFvvu17/EYVnx7oRwK9a8jYKT
	v63WSBFHh9afgwleXAf7073DzxAP74ILN5WJcMz2TY/mltvfHcvFqlvGhUrC7iMF
	YcZY9WgBLAQpGsVx+UEReBjybGoeXVtYmIQM7CotNiZrYyAJlZCPAIdVZn+I+mZP
	6j36AyG9eHFwLJH1vTTm34bp4nlhu0CsDjiys4sllreZz8aPRSE1fg9DBMyXIsi5
	fHz4SQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ceetrpc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 13:28:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BADS81X006604
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 13:28:08 GMT
Received: from [10.253.8.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 05:28:03 -0800
Message-ID: <38d7191f-e4bf-4457-9898-bb2b186ec3c7@quicinc.com>
Date: Tue, 10 Dec 2024 21:28:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <f54ad0e2-10d7-40ff-872f-d7c92ae8519b@quicinc.com>
 <Z1MmRb3RaUA68pb9@shell.armlinux.org.uk>
Content-Language: en-US
From: Lei Wei <quic_leiwei@quicinc.com>
In-Reply-To: <Z1MmRb3RaUA68pb9@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yMLBXLZL1EvYi_qhVUJ1YvPT1qJtv-tQ
X-Proofpoint-ORIG-GUID: yMLBXLZL1EvYi_qhVUJ1YvPT1qJtv-tQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100100



On 12/7/2024 12:28 AM, Russell King (Oracle) wrote:
> On Sat, Dec 07, 2024 at 12:20:25AM +0800, Lei Wei wrote:
>> On 12/4/2024 11:28 PM, Russell King (Oracle) wrote:
>>> On Wed, Dec 04, 2024 at 10:43:55PM +0800, Lei Wei wrote:
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
>>>> +		clk_disable_unprepare(qpcs_mii->rx_clk);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void ipq_pcs_disable(struct phylink_pcs *pcs)
>>>> +{
>>>> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
>>>> +
>>>> +	if (__clk_is_enabled(qpcs_mii->rx_clk))
>>>> +		clk_disable_unprepare(qpcs_mii->rx_clk);
>>>> +
>>>> +	if (__clk_is_enabled(qpcs_mii->tx_clk))
>>>> +		clk_disable_unprepare(qpcs_mii->tx_clk);
>>>
>>> Why do you need the __clk_is_enabled() calls here? Phylink should be
>>> calling pcs_enable() once when the PCS when starting to use the PCS,
>>> and then pcs_disable() when it stops using it - it won't call
>>> pcs_disable() without a preceeding call to pcs_enable().
>>>
>>> Are you seeing something different?
>>
>> Yes, understand that phylink won't call pcs_disable() without a preceeding
>> call to pcs_enable(). However, the "clk_prepare_enable" may fail in the
>> pcs_enable() method, so I added the __clk_is_enabled() check in
>> pcs_disable() method. This is because the phylink_major_config() function
>> today does not interpret the return value of phylink_pcs_enable().
> 
> Right, because failure is essentially fatal in that path - we have no
> context to return an error. I suppose we could stop processing at
> that point, but then it brings up the question of how to unwind anything
> we've already done, which is basically impossible at that point.
> 

Sure, understand. I will remove the checks.

>>>> +static void ipq_pcs_get_state(struct phylink_pcs *pcs,
>>>> +			      struct phylink_link_state *state)
>>>> +{
>>>> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
>>>> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
>>>> +	int index = qpcs_mii->index;
>>>> +
>>>> +	switch (state->interface) {
>>>> +	case PHY_INTERFACE_MODE_SGMII:
>>>> +	case PHY_INTERFACE_MODE_QSGMII:
>>>> +		ipq_pcs_get_state_sgmii(qpcs, index, state);
>>>> +		break;
>>>> +	default:
>>>> +		break;
>>> ...
>>>> +static int ipq_pcs_config(struct phylink_pcs *pcs,
>>>> +			  unsigned int neg_mode,
>>>> +			  phy_interface_t interface,
>>>> +			  const unsigned long *advertising,
>>>> +			  bool permit)
>>>> +{
>>>> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
>>>> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
>>>> +	int index = qpcs_mii->index;
>>>> +
>>>> +	switch (interface) {
>>>> +	case PHY_INTERFACE_MODE_SGMII:
>>>> +	case PHY_INTERFACE_MODE_QSGMII:
>>>> +		return ipq_pcs_config_sgmii(qpcs, index, neg_mode, interface);
>>>> +	default:
>>>> +		dev_err(qpcs->dev,
>>>> +			"Unsupported interface %s\n", phy_modes(interface));
>>>> +		return -EOPNOTSUPP;
>>>> +	};
>>>> +}
>>>> +
>>>> +static void ipq_pcs_link_up(struct phylink_pcs *pcs,
>>>> +			    unsigned int neg_mode,
>>>> +			    phy_interface_t interface,
>>>> +			    int speed, int duplex)
>>>> +{
>>>> +	struct ipq_pcs_mii *qpcs_mii = phylink_pcs_to_qpcs_mii(pcs);
>>>> +	struct ipq_pcs *qpcs = qpcs_mii->qpcs;
>>>> +	int index = qpcs_mii->index;
>>>> +	int ret;
>>>> +
>>>> +	switch (interface) {
>>>> +	case PHY_INTERFACE_MODE_SGMII:
>>>> +	case PHY_INTERFACE_MODE_QSGMII:
>>>> +		ret = ipq_pcs_link_up_config_sgmii(qpcs, index,
>>>> +						   neg_mode, speed);
>>>> +		break;
>>>> +	default:
>>>> +		dev_err(qpcs->dev,
>>>> +			"Unsupported interface %s\n", phy_modes(interface));
>>>> +		return;
>>>> +	}
>>>
>>> So you only support SGMII and QSGMII. Rather than checking this in every
>>> method implementation, instead provide a .pcs_validate method that
>>> returns an error for unsupported interfaces please.
>>>
>>
>> Yes, I can add the pcs_validate() method to validate the link
>> configurations. This will catch invalid interface mode during the PCS
>> initialization time, earlier than the pcs_config and pcs_link_up contexts.
>>
>> But after of the PCS init, if at a later point the PHY interface mode
>> changes, it seems phylink today is not calling the pcs_validate() op to
>> validate the changed new interface mode at the time of "phylink_resolve".
> 
> ... because by that time it's way too late. Phylink will have already
> looked at what the PHY can do when the PHY is attached, and eliminated
> any link modes that would cause an invalid configuration (provided
> phylink knows what the PHY is capable of.)
> 
> However, that assumes phylink knows what the details are of the PCS,
> which is dependent on the .pcs_validate method being implemented.
> 

Yes, agree that pcs_validate() is necessary to be implemented and 
Phylink will validate the PHY when the PHY is attached. I will implement 
this method in the next update. Thanks for pointing to the details here.

We will also remove the debug error print for the 'default' case. 
However, I would like to retain the switch statement since we have 
different routines for SGMII/USXGMII modes, and we plan to add more 
interfaces modes later when we enhance the driver for other IPQ SoC.


