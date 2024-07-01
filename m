Return-Path: <linux-arm-msm+bounces-24828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAAF91E86D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 21:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 413571C21898
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 19:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDBBC16F0F0;
	Mon,  1 Jul 2024 19:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e0xEJUb3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4488415DBD6;
	Mon,  1 Jul 2024 19:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719861542; cv=none; b=DWi4hb+XdVeDbU4mNwfo3O9JvbKBlUIfrbmu8Kdj0/YuPfIJ3dg4rrpLZ3MPc//u0BI0KYlKhPNv2/hjagGzZikq9gtbaN4YzuwUPmiHjnbXmXIYH7dlgPL6a+mJa4mBcRwhRB8uG6n7Roh3O/x90BHQ/BVO6INO5YQPRUsgvFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719861542; c=relaxed/simple;
	bh=jWZ1CeQ+Pa38AA57KdIwDpbzTnMj3qGPaHVJkcEuG78=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=jMdKrAjEAbNFhFKLMg2VK0lXp0jy+DRizu/q366ZEqw4sd+qV+JPLi6jK2e4qKPFEDWvOKBPbthiom7cY70uEVMSW+1ApdtaEtsQZwdMDeuJUIQPmIxLrRpvD3Lgn9KV1sDe95ovpMzcY7VOi2+1LNT6Wf6wVgzCWMboMXR6en0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e0xEJUb3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461BNd10031186;
	Mon, 1 Jul 2024 19:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEOucDbBLsGiHd0h8bxK39k/378s4ze6cCjXgEeaqvw=; b=e0xEJUb3vKj9QKER
	EMjxyym5noJskbaAYX2LSb0TYrSwXmhph4DlGyEwpocJJTThlcjgIgz139Nu1PwW
	rJCmj/YM2GFPBpc4JVaQXk7jSgscd7Ezp29tUG9hHKuicp8X/vLI6W+RET3C5yOl
	YJUM+UNoRB5xPIMdYcOhqQG0zkN/Dn62pi7NUy7X+MLfoCViP+SMYbOMSQrRcXBH
	CocIKkKsFQjDkFi96LPjRuZAe8RTfKsbUaA+rYNgrTObWKAZNqd4LNir9BFdCUH8
	110n0lnIoNuPLpyk2rjl3HfYCax+iX3pi5uPkRJ0jneP8CyZv1hcg75DhEuVN2Pw
	bJDsdg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402bejmvvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 19:18:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 461JIOT7014247
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Jul 2024 19:18:24 GMT
Received: from [10.110.54.196] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Jul 2024
 12:18:19 -0700
Message-ID: <eb63b7c2-9485-4b11-bf73-4d38a2365f19@quicinc.com>
Date: Mon, 1 Jul 2024 12:18:19 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] net: stmmac: Bring down the clocks to lower
 frequencies when mac link goes down
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
To: Andrew Halaney <ahalaney@redhat.com>
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
        Andrew Lunn <andrew@lunn.ch>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-3-eaa7cf9060f0@quicinc.com>
 <qf4zl7qupkzbrb6ik4v4nkjct7tsh34cmoufy23zozcht5gch6@kvymsd2ue6cd>
 <fd5c86d8-4243-43d6-a07d-919ceeb12d82@quicinc.com>
Content-Language: en-US
In-Reply-To: <fd5c86d8-4243-43d6-a07d-919ceeb12d82@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kddQ-wpQVuQPjCybJxZd8qn6L8J1iblC
X-Proofpoint-ORIG-GUID: kddQ-wpQVuQPjCybJxZd8qn6L8J1iblC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_19,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010144



On 6/28/2024 2:50 PM, Sagar Cheluvegowda wrote:
> 
> 
> On 6/26/2024 7:58 AM, Andrew Halaney wrote:
>> On Tue, Jun 25, 2024 at 04:49:30PM GMT, Sagar Cheluvegowda wrote:
>>> When mac link goes down we don't need to mainitain the clocks to operate
>>> at higher frequencies, as an optimized solution to save power when
>>> the link goes down we are trying to bring down the clocks to the
>>> frequencies corresponding to the lowest speed possible.
>>>
>>> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
>>> ---
>>>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> index ec7c61ee44d4..f0166f0bc25f 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> @@ -996,6 +996,9 @@ static void stmmac_mac_link_down(struct phylink_config *config,
>>>  {
>>>  	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
>>>  
>>> +	if (priv->plat->fix_mac_speed)
>>> +		priv->plat->fix_mac_speed(priv->plat->bsp_priv, SPEED_10, mode);
>>> +
The above fix_mac_speed needs to be removed, i lately realized this mistake.
>>>  	stmmac_mac_set(priv, priv->ioaddr, false);
>>>  	priv->eee_active = false;
>>>  	priv->tx_lpi_enabled = false;
>>> @@ -1004,6 +1007,11 @@ static void stmmac_mac_link_down(struct phylink_config *config,
>>>  
>>>  	if (priv->dma_cap.fpesel)
>>>  		stmmac_fpe_link_state_handle(priv, false);
>>> +
>>> +	stmmac_set_icc_bw(priv, SPEED_10);
>>> +
>>> +	if (priv->plat->fix_mac_speed)
>>> +		priv->plat->fix_mac_speed(priv->plat->bsp_priv, SPEED_10, mode);
>>
>>
>> I think you're doing this at the beginning and end of
>> stmmac_mac_link_down(), is that intentional?
>>
>>
> 
> I realised that bringing down the clock to 10Mbps should be the last operation
> of the link down process, the reason being if we bring down the clocks first it will
> deprive essential internal clocks to DMA/MTL modules which are required for
> Cleanup operations this might cause excessive delays in stopping DMA
> or flusing MTL queues.
>  
>>

