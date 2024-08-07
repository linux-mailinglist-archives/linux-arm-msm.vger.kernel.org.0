Return-Path: <linux-arm-msm+bounces-28126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C4A94B3E0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 01:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E77281C20AB5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 23:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F70154C17;
	Wed,  7 Aug 2024 23:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QJ48A+MN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1FD84037;
	Wed,  7 Aug 2024 23:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723074449; cv=none; b=i/5Geac+p/cSqhwRaeXLZyWoHiHmV00J/eDF2qRAxDfHHW+ZMArcsmsfneH/LmNJok89iEPA8KbE2Oy8QClA/f6s3fEwFVQ06ABGZEnTWN1BAz1BbbsqWvK9aPwEcTgb6187NRzpi0yyn01Pq8F9kf6rbUjzMKtzzgpK5XiNkAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723074449; c=relaxed/simple;
	bh=/qm83qDVxnY3QrhFxh2kmo0YUOGlFKEd9jGuhFx0DZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=snE3qgMZOiVO5yZF1jPMrpo1+XL3ROZEwHg9WF4qDRkKCRxp3aOB84/6cWkoS8vPnrih4Q9KwsJdZo5iXMp3iDOMmaMk+WFHjktnKmKf9OV4Ch8peq/fkh30nIqoRSbrwMnCu7QUy6ZBzemeWcfPanqA7ZKJx+marXSm3WLzd9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QJ48A+MN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477Jh3f5000990;
	Wed, 7 Aug 2024 23:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mgbchAj6xcR2jFXLYmMGd4v6aq2N9KiFTX1IIgdca7w=; b=QJ48A+MNaGvSmfTw
	YQsIzjqomBiC8XLpiFuqSs3SHBajHCFzPHVyP5kIx2J6TdDZShIXypzTg2Fx7jYJ
	FonydqI34elfCglK12A2Bxg106DWGqK7EvkFHRYOcwH1KCPetx6jciOA3TVnxGEf
	yQZUZq+FsAUGRvu8syhd2MEfQz+tFmCXav99tF6CNP52mSyRce1NoC+J7OrgQvpo
	mVMco+jIbXv9DWyYRMfIfJQTudvENmyBtIaC0Rxkzt3PwdjgFLUXSc2sV6rEKsIt
	QMTEDUZQKyITDr4zYb67LGLNIfaqmssRnrMZXnT/l6+OzM+s1RUykjl+630qfFSW
	OkJ9xw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vfav0df2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 23:46:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 477NksMn011658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 23:46:54 GMT
Received: from [10.110.61.128] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 16:46:51 -0700
Message-ID: <eddef7d0-9e3d-4c3f-8457-54b2eb8a3947@quicinc.com>
Date: Wed, 7 Aug 2024 16:46:46 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] net: stmmac: Add interconnect support
To: Serge Semin <fancer.lancer@gmail.com>
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
        Andrew Halaney <ahalaney@redhat.com>, Andrew Lunn
	<andrew@lunn.ch>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240708-icc_bw_voting_from_ethqos-v4-0-c6bc3db86071@quicinc.com>
 <20240708-icc_bw_voting_from_ethqos-v4-2-c6bc3db86071@quicinc.com>
 <zsdjc53fxh44bpra5cfishtvmyok2rprbtnbthimnu6quxkxyj@kvtijkxylwb3>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <zsdjc53fxh44bpra5cfishtvmyok2rprbtnbthimnu6quxkxyj@kvtijkxylwb3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9hjmxXrOpSYZifNt35BEWYmSC-EDuTnJ
X-Proofpoint-GUID: 9hjmxXrOpSYZifNt35BEWYmSC-EDuTnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_14,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408070166



On 8/1/2024 11:32 AM, Serge Semin wrote:
> Hi Sagar
> 
> On Mon, Jul 08, 2024 at 02:30:01PM -0700, Sagar Cheluvegowda wrote:
>> Add interconnect support to vote for bus bandwidth based
>> on the current speed of the driver.
>> Adds support for two different paths - one from ethernet to
>> DDR and the other from CPU to ethernet, Vote from each
>> interconnect client is aggregated and the on-chip interconnect
>> hardware is configured to the most appropriate bandwidth profile.
>>
>> Suggested-by: Andrew Halaney <ahalaney@redhat.com>
>> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
>> ---
>>  drivers/net/ethernet/stmicro/stmmac/stmmac.h          |  1 +
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     |  8 ++++++++
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 12 ++++++++++++
>>  include/linux/stmmac.h                                |  2 ++
>>  4 files changed, 23 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>> index b23b920eedb1..56a282d2b8cd 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>> @@ -21,6 +21,7 @@
>>  #include <linux/ptp_clock_kernel.h>
>>  #include <linux/net_tstamp.h>
>>  #include <linux/reset.h>
>> +#include <linux/interconnect.h>
>>  #include <net/page_pool/types.h>
>>  #include <net/xdp.h>
>>  #include <uapi/linux/bpf.h>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index b3afc7cb7d72..ec7c61ee44d4 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -985,6 +985,12 @@ static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
>>  	}
>>  }
>>  
>> +static void stmmac_set_icc_bw(struct stmmac_priv *priv, unsigned int speed)
>> +{
> 
>> +	icc_set_bw(priv->plat->axi_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
>> +	icc_set_bw(priv->plat->ahb_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
> 
> I've got two questions in this regard:
> 
> 1. Don't we need to call icc_enable()/icc_disable() in someplace in
> the driver? For instance the CPU-MEM path must be enabled before even
> the stmmac_dvr_probe() is called, otherwise the CSR won't be
> accessible. Right? For the same reason the CPU-MEM bandwidth should be
> set in sync with that.
> 
> 2. Why is the CPU-MAC speed is specified to match the Ethernet link
> speed? It doesn't seem reasonable. It's the CSR's access speed and
> should be done as fast as possible. Shouldn't it?
> 
>> +}

I am having internal discussions with clocks team, I will revert back soon with answers.
>> +
>>  static void stmmac_mac_link_down(struct phylink_config *config,
>>  				 unsigned int mode, phy_interface_t interface)
>>  {
>> @@ -1080,6 +1086,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
>>  	if (priv->plat->fix_mac_speed)
>>  		priv->plat->fix_mac_speed(priv->plat->bsp_priv, speed, mode);
>>  
>> +	stmmac_set_icc_bw(priv, speed);
>> +
>>  	if (!duplex)
>>  		ctrl &= ~priv->hw->link.duplex;
>>  	else
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> index 54797edc9b38..201f9dea6da9 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> @@ -642,6 +642,18 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>>  		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
>>  	}
>>  
>> +	plat->axi_icc_path = devm_of_icc_get(&pdev->dev, "mac-mem");
>> +	if (IS_ERR(plat->axi_icc_path)) {
>> +		ret = ERR_CAST(plat->axi_icc_path);
>> +		goto error_hw_init;
>> +	}
>> +
>> +	plat->ahb_icc_path = devm_of_icc_get(&pdev->dev, "cpu-mac");
>> +	if (IS_ERR(plat->ahb_icc_path)) {
>> +		ret = ERR_CAST(plat->ahb_icc_path);
>> +		goto error_hw_init;
>> +	}
>> +
>>  	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
>>  							   STMMAC_RESOURCE_NAME);
>>  	if (IS_ERR(plat->stmmac_rst)) {
>> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
>> index f92c195c76ed..385f352a0c23 100644
>> --- a/include/linux/stmmac.h
>> +++ b/include/linux/stmmac.h
>> @@ -283,6 +283,8 @@ struct plat_stmmacenet_data {
>>  	struct reset_control *stmmac_rst;
>>  	struct reset_control *stmmac_ahb_rst;
>>  	struct stmmac_axi *axi;
> 
>> +	struct icc_path *axi_icc_path;
> 
> The MAC<->MEM interface isn't always AXI (it can be AHB or custom) and
> 
>> +	struct icc_path *ahb_icc_path;
> 
> the CPU<->MAC isn't always AHB (it can also be APB, AXI, custom). So
> the more generic naming would be:
> 
> axi_icc_path -> dma_icc_path
> and
> ahb_icc_path -> csr_icc_path
> 
> -Serge(y)
> 
>>  	int has_gmac4;
>>  	int rss_en;
>>  	int mac_port_sel_speed;
>>
>> -- 
>> 2.34.1
>>
>>

