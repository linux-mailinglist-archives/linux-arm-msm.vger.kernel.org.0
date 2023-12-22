Return-Path: <linux-arm-msm+bounces-5866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BB781C6CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Dec 2023 09:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D0361C2201D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Dec 2023 08:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF157C8D4;
	Fri, 22 Dec 2023 08:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="laMd6ed0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404BEC8C8;
	Fri, 22 Dec 2023 08:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BM6jhlQ000831;
	Fri, 22 Dec 2023 08:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=jTCYwLpJudyMZDABy2bMDqWk87irizJp2HMkU0bGPSc=; b=la
	Md6ed0bfzvk9Vy28nsVTl5K0/qydXK45S++0wa/P4PYV40eXmn5XMecVFw8HsqS0
	TNnmuWnLC7BmAmocUIzIkahhgk+FmpN/+tAZh2I17jQuEx0sSpnBa0vwITK4nwX3
	db3HQ5SExRd6D0g+CVGWgQW4jsPtaSFWiLsm4Kx4HCufH7/aQplPRwoMdsgBlWS8
	svnR4mjSq8uAyUthnvoZIHPAo010WKwhmk/HyZhI+b4cTh+jxccZY2QY5wHdliwF
	7tSEZZpuXkqexcsOBk2QZJ1H/wOepinVsGnmjzHhY18YChmn9IR9q+4U66BjOynX
	MEPpr9wcG2RNyZapPJFw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v4vfwhcjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Dec 2023 08:44:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BM8i2gM027087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Dec 2023 08:44:02 GMT
Received: from [10.217.90.28] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 22 Dec
 2023 00:43:52 -0800
Message-ID: <aec2dc6a-ffa4-4753-a764-77dfe1af995a@quicinc.com>
Date: Fri, 22 Dec 2023 14:13:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 3/3] net: stmmac: Add driver support for
 DWMAC5 common safety IRQ
Content-Language: en-US
To: Serge Semin <fancer.lancer@gmail.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
CC: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "Jose
 Abreu" <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Prasad Sodagudi
	<psodagud@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>, Rob Herring
	<robh@kernel.org>,
        <kernel@quicinc.com>
References: <20231221073620.232619-1-quic_jsuraj@quicinc.com>
 <20231221073620.232619-4-quic_jsuraj@quicinc.com>
 <yromhtr73rwsr6hizr4tq37vfvyzfue7wzpmufqyscwspzffza@uhfcrn573acd>
From: Suraj Jaiswal <quic_jsuraj@quicinc.com>
In-Reply-To: <yromhtr73rwsr6hizr4tq37vfvyzfue7wzpmufqyscwspzffza@uhfcrn573acd>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DIx2RWBSqime7xl-OdHuNAbGEmTJXQyB
X-Proofpoint-GUID: DIx2RWBSqime7xl-OdHuNAbGEmTJXQyB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312220061

HI Serge,
please find commnet inline.

Thanks
Suraj

On 12/21/2023 6:19 PM, Serge Semin wrote:
> Hi Suraj
> 
> On Thu, Dec 21, 2023 at 01:06:20PM +0530, Suraj Jaiswal wrote:
>> Add support to listen HW safety IRQ like ECC(error
>> correction code), DPP(data path parity), FSM(finite state
>> machine) fault in common IRQ line.
>>
>> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> 
> Thanks for taking my notes into account. One more comment is further
> below.
> 
>> ---
>>  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
>>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  3 ++
>>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 37 +++++++++++++++++++
>>  .../ethernet/stmicro/stmmac/stmmac_platform.c |  8 ++++
>>  4 files changed, 49 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
>> index 721c1f8e892f..b9233b09b80f 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
>> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
>> @@ -344,6 +344,7 @@ enum request_irq_err {
>>  	REQ_IRQ_ERR_ALL,
>>  	REQ_IRQ_ERR_TX,
>>  	REQ_IRQ_ERR_RX,
>> +	REQ_IRQ_ERR_SFTY,
>>  	REQ_IRQ_ERR_SFTY_UE,
>>  	REQ_IRQ_ERR_SFTY_CE,
>>  	REQ_IRQ_ERR_LPI,
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>> index 9f89acf31050..ca3d93851bed 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>> @@ -31,6 +31,7 @@ struct stmmac_resources {
>>  	int wol_irq;
>>  	int lpi_irq;
>>  	int irq;
>> +	int sfty_irq;
>>  	int sfty_ce_irq;
>>  	int sfty_ue_irq;
>>  	int rx_irq[MTL_MAX_RX_QUEUES];
>> @@ -297,6 +298,7 @@ struct stmmac_priv {
>>  	void __iomem *ptpaddr;
>>  	void __iomem *estaddr;
>>  	unsigned long active_vlans[BITS_TO_LONGS(VLAN_N_VID)];
>> +	int sfty_irq;
>>  	int sfty_ce_irq;
>>  	int sfty_ue_irq;
>>  	int rx_irq[MTL_MAX_RX_QUEUES];
>> @@ -305,6 +307,7 @@ struct stmmac_priv {
>>  	char int_name_mac[IFNAMSIZ + 9];
>>  	char int_name_wol[IFNAMSIZ + 9];
>>  	char int_name_lpi[IFNAMSIZ + 9];
>> +	char int_name_sfty[IFNAMSIZ + 10];
>>  	char int_name_sfty_ce[IFNAMSIZ + 10];
>>  	char int_name_sfty_ue[IFNAMSIZ + 10];
>>  	char int_name_rx_irq[MTL_MAX_TX_QUEUES][IFNAMSIZ + 14];
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 47de466e432c..7d4e827dfeab 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -3592,6 +3592,10 @@ static void stmmac_free_irq(struct net_device *dev,
>>  		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
>>  			free_irq(priv->wol_irq, dev);
>>  		fallthrough;
>> +	case REQ_IRQ_ERR_SFTY:
>> +		if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq)
>> +			free_irq(priv->sfty_irq, dev);
>> +		fallthrough;
>>  	case REQ_IRQ_ERR_WOL:
>>  		free_irq(dev->irq, dev);
>>  		fallthrough;
>> @@ -3661,6 +3665,23 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
>>  		}
>>  	}
>>  
>> +	/* Request the common Safety Feature Correctible/Uncorrectible
>> +	 * Error line in case of another line is used
>> +	 */
>> +	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {
>> +		int_name = priv->int_name_sfty;
>> +		sprintf(int_name, "%s:%s", dev->name, "safety");
>> +		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
>> +				  0, int_name, dev);
>> +		if (unlikely(ret < 0)) {
>> +			netdev_err(priv->dev,
>> +				   "%s: alloc sfty MSI %d (error: %d)\n",
>> +				   __func__, priv->sfty_irq, ret);
>> +			irq_err = REQ_IRQ_ERR_SFTY;
>> +			goto irq_error;
>> +		}
>> +	}
>> +
>>  	/* Request the Safety Feature Correctible Error line in
>>  	 * case of another line is used
>>  	 */
>> @@ -3798,6 +3819,21 @@ static int stmmac_request_irq_single(struct net_device *dev)
>>  		}
>>  	}
>>  
>> +	/* Request the common Safety Feature Correctible/Uncorrectible
>> +	 * Error line in case of another line is used
>> +	 */
>> +	if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq) {
> 
>> +		ret = request_irq(priv->sfty_irq, stmmac_safety_interrupt,
>> +				  IRQF_SHARED, dev->name, dev);
> 
> Just noticed yesterday that stmmac_safety_interrupt() is also called
> from the stmmac_interrupt() handler which is supposed to be registered
> on the generic "mac" IRQ. Won't it cause races around the CSRs
> (doubtfully but still worth to note) and the errors handling
> (stmmac_global_err()) in case if both IRQs are raised simultaneously?
> At the very least it looks suspicious and worth double-checking.
> 
> I also found out that nobody seemed to care that the same handler is
> registered on MAC, WoL and LPI IRQ lines. Hmm, no race-related
> problems have been reported so far for the platforms with separate
> WoL/LPI IRQs. It's either a lucky coincident or the IRQs are always
> assigned to the same CPU or the IRQs handle is indeed free of races.
> In anyway it looks suspicious too. At the very least AFAICS the DMA
> IRQ-handler is indeed racy on the status CSR access. It isn't
> cleared-on-read, but write-one-to-clear. So the statistics might be
> calculated more than once for the same CSR state. There might be some
> other problems I failed to spot on the first glance.
> 
> David, Eric, Jacub, Paolo, your opinion about the note above?
> 
> -Serge(y)
> 
<Suraj> We are adding common IRQ similar to already present code for correcteable/uncorrecable https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c#L3592.
Also, we need the sfty IRQ handling as soon as the fault occured & that can only be handled if we have handler attached with sfty IRQ.
stmmac_interrupt() will only be triggerd when interrupt triggered for rx/tx packet .
while registerting with sfty IRQ will get triggered as soon as emac HW detect the fault. 
   
>> +		if (unlikely(ret < 0)) {
>> +			netdev_err(priv->dev,
>> +				   "%s: ERROR: allocating the sfty IRQ %d (%d)\n",
>> +				   __func__, priv->sfty_irq, ret);
>> +			irq_err = REQ_IRQ_ERR_SFTY;
>> +			goto irq_error;
>> +		}
>> +	}
>> +
>>  	return 0;
>>  
>>  irq_error:
>> @@ -7462,6 +7498,7 @@ int stmmac_dvr_probe(struct device *device,
>>  	priv->dev->irq = res->irq;
>>  	priv->wol_irq = res->wol_irq;
>>  	priv->lpi_irq = res->lpi_irq;
>> +	priv->sfty_irq = res->sfty_irq;
>>  	priv->sfty_ce_irq = res->sfty_ce_irq;
>>  	priv->sfty_ue_irq = res->sfty_ue_irq;
>>  	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> index 70eadc83ca68..ab250161fd79 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> @@ -743,6 +743,14 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>>  		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
>>  	}
>>  
>> +	stmmac_res->sfty_irq =
>> +		platform_get_irq_byname_optional(pdev, "sfty");
>> +	if (stmmac_res->sfty_irq < 0) {
>> +		if (stmmac_res->sfty_irq == -EPROBE_DEFER)
>> +			return -EPROBE_DEFER;
>> +		dev_info(&pdev->dev, "IRQ safety IRQ not found\n");
>> +	}
>> +
>>  	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
>>  
>>  	return PTR_ERR_OR_ZERO(stmmac_res->addr);
>> -- 
>> 2.25.1
>>
>>

