Return-Path: <linux-arm-msm+bounces-24920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48654924C31
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 01:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0494B2320E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 23:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98F917A5B0;
	Tue,  2 Jul 2024 23:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LuR9WHgh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A28F12F37B;
	Tue,  2 Jul 2024 23:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719963564; cv=none; b=G85W8kL3Gi8Mk3KJk0h8EvWRZMVDOfnAodvJOXFmjyt/uwl7quUy+aI1wvC7Wmf8pDXbKIskcLTSH0q7vuhZnFEyDgZt9wYAJuVu142Dc1AiuSwJXonM2wYzYt6PSZjlvil/4MjBCBkdG6t5JIOyElFp72HwFX2N5rTcFg6BcG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719963564; c=relaxed/simple;
	bh=9iHKGaCvUhgAzDNyNQfkicaDyAaAdfPOtqrEyXNvaXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VdF1lQg8oU9kjxI3iCHGAOHgUhMY16vR1OqeIFhpLaQpa3gidbQDAXIjC79TTNEJrNZwcL+w4KAan4JFla/0gvojak0dRpH2eUtsxUollA9Mso4CCfuAMUXBS32eP1wKwJZnOZzpEu1VLU7ya3ml0odJqkyKDc/1mv/vIMtu7Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LuR9WHgh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462HA2a8026187;
	Tue, 2 Jul 2024 23:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a9QKQLFDVHH7M2yZELH6J8W3bzlpa8FwEYoxmvRJ3Cc=; b=LuR9WHgh+LA2qTcV
	i/0WCieOpJaEu1gmw3+TJfjWYHEwq2sXMAzq0rp0uDz0uknStjmYmAyOz4e8Z92R
	xm0ozpwBGmhGRqkr3R7IHmQoUAbwHU7vQrEv2+4ZrxtCTuQZGNb9oEvIusxq+qjo
	eTvMEfItsvzJqsCNtfoy7biQpSb9aVFfUIr9Fvd+phCDCZce5uoVifZWwEXvzjT3
	kJs5CGlTCE9j/43qz8s8sP1RmXeEpl+6yz22MStklrZGH84xuWqufbie+c4lsrU3
	88221o8dnWSRPlvWyMk7+IfGr3HEBHTBuW0cc3VWx9Y3p7532xfk6/nQfkCl4H5g
	r/Vh/Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402abtq6tx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 23:38:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 462Ncpqk031705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jul 2024 23:38:51 GMT
Received: from [10.110.54.196] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 2 Jul 2024
 16:38:47 -0700
Message-ID: <02dbe022-b45d-43eb-8769-bcf2a92e7c6f@quicinc.com>
Date: Tue, 2 Jul 2024 16:38:47 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] net: stmmac: Bring down the clocks to lower
 frequencies when mac link goes down
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bhupesh
 Sharma" <bhupesh.sharma@linaro.org>, <kernel@quicinc.com>,
        Andrew Halaney
	<ahalaney@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-3-eaa7cf9060f0@quicinc.com>
 <Zn82VaTQBe0LkhSa@shell.armlinux.org.uk>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <Zn82VaTQBe0LkhSa@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KZYOA__XQ6LuL0KP4BYDvMtVwsvrjhxq
X-Proofpoint-ORIG-GUID: KZYOA__XQ6LuL0KP4BYDvMtVwsvrjhxq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_16,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=822 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407020174



On 6/28/2024 3:16 PM, Russell King (Oracle) wrote:
> On Tue, Jun 25, 2024 at 04:49:30PM -0700, Sagar Cheluvegowda wrote:
>> When mac link goes down we don't need to mainitain the clocks to operate
>> at higher frequencies, as an optimized solution to save power when
>> the link goes down we are trying to bring down the clocks to the
>> frequencies corresponding to the lowest speed possible.
> 
> I thought I had already commented on a similar patch, but I can't find
> anything in my mailboxes to suggest I had.
> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index ec7c61ee44d4..f0166f0bc25f 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -996,6 +996,9 @@ static void stmmac_mac_link_down(struct phylink_config *config,
>>  {
>>  	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
>>  
>> +	if (priv->plat->fix_mac_speed)
>> +		priv->plat->fix_mac_speed(priv->plat->bsp_priv, SPEED_10, mode);
>> +
>>  	stmmac_mac_set(priv, priv->ioaddr, false);
>>  	priv->eee_active = false;
>>  	priv->tx_lpi_enabled = false;
>> @@ -1004,6 +1007,11 @@ static void stmmac_mac_link_down(struct phylink_config *config,
>>  
>>  	if (priv->dma_cap.fpesel)
>>  		stmmac_fpe_link_state_handle(priv, false);
>> +
>> +	stmmac_set_icc_bw(priv, SPEED_10);
>> +
>> +	if (priv->plat->fix_mac_speed)
>> +		priv->plat->fix_mac_speed(priv->plat->bsp_priv, SPEED_10, mode);
> 
> Two things here:
> 
> 1) Why do we need to call fix_mac_speed() at the start and end of this
>    stmmac_mac_link_down()?
This was a typo, i will remove this.
> 
> 2) What if the MAC doesn't support 10M operation? For example, dwxgmac2
>    and dwxlgmac2 do not support anything below 1G. It feels that this
>    is storing up a problem for the future, where a platform that uses
>    e.g. xlgmac2 also implements fix_mac_speed() and then gets a
>    surprise when it's called with SPEED_10.
> 
> Personally, I don't like "fix_mac_speed", and I don't like it even more
> with this change. I would prefer to see link_up/link_down style
> operations so that platforms can do whatever they need to on those
> events, rather than being told what to do by a single call that may
> look identical irrespective of whether the link came up or went down.
> 
I will drop this patch[3/3] from this series now and i will do some analysis
on platform level link up and link down functions and post the changes as a
new series altogether.

