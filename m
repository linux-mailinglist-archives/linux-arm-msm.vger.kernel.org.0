Return-Path: <linux-arm-msm+bounces-23637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE96D912DCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 21:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A9BB1F21C06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 19:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0B5179949;
	Fri, 21 Jun 2024 19:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="knUtvkap"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ACC4644C;
	Fri, 21 Jun 2024 19:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718997774; cv=none; b=Yq+m3i0A08df3LLUTgxEwElT2PIqwt3hPY2gMgFvlWycLtp3fFrtcd3qtNd+u5GeyI4KzP8HhT1qDKH4tp/UmURw0n99lt97/TL8GMf49X9e5gVqIMh4WnXud+pPXbDUChtPhdSHzjZnWN+cwJtb3ygVcuI4aGQpBdORB/gEz94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718997774; c=relaxed/simple;
	bh=kVfwHw0X+MRE2b6MToDFxTZX1GClbgp+mTNAT10Q+AM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=elxz8EcHzPYkxZTnUD5jbD6wtCKz9gWJI3OSUlyQvgWdITZW0G2gAMG+WNdyvC4IdZagsrMKED4nIhn8LDxdo1VFZJGn+q8TU7Q1HVjypo7J63YKAi2abNZqR4FvA2iosI45DzJN15wRTK4ZgoRpUKCSdh3Zzbxzm1cBFELkmME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=knUtvkap; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LEfp2C017423;
	Fri, 21 Jun 2024 19:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DYGuW9hZ5KvCtpEK3M7nZ6w4VGSOYf5QmEUMubHKFNs=; b=knUtvkapsX/H//d4
	xdH3RO+45PhSVcWwoWKMzHmWOpUkEQcnzdD63N6vgGUdHhonAQ2hIkR1vLmgWVdU
	P/E0dWrP9sySs+wElBgigoe9e9fRQuIn5SjYHSJxP2pQyxX+APmYl8RHCdX7MkDh
	PogXCsYcbIrPW4JlTJzz32Gbk6/c53dmJ3Cg9hDGhAat7jH9ejihglWV0C2qQuz4
	8CGwIMlPXsYub6kD5u5pKSu6JPWsBF+Y3M3QWFxMQQOXvDMNog+xnGqdn5zEm27w
	rU1l12UI+Z0P/ZgwmmPphGzPS0tXQPfYqMN/14fS8ac6JQ5Q1Zpyr8ijj24c86w5
	MsG05w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrkrbgkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 19:22:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45LJMFB1014392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 19:22:15 GMT
Received: from [10.110.25.219] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Jun
 2024 12:22:06 -0700
Message-ID: <b075e5a8-ca75-49cc-84d6-84e28bc38eee@quicinc.com>
Date: Fri, 21 Jun 2024 12:22:04 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] net: stmmac: Add interconnect support in qcom-ethqos
 driver
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
References: <20240619-icc_bw_voting_from_ethqos-v1-0-6112948b825e@quicinc.com>
 <20240619-icc_bw_voting_from_ethqos-v1-1-6112948b825e@quicinc.com>
 <159700cc-f46c-4f70-82aa-972ba6e904ca@lunn.ch>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <159700cc-f46c-4f70-82aa-972ba6e904ca@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1re7hUvRsS133zJQqD0NClBIcVsEo0Wl
X-Proofpoint-GUID: 1re7hUvRsS133zJQqD0NClBIcVsEo0Wl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_10,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406210141



On 6/19/2024 4:13 PM, Andrew Lunn wrote:
> On Wed, Jun 19, 2024 at 03:41:29PM -0700, Sagar Cheluvegowda wrote:
>> Add interconnect support in qcom-ethqos driver to vote for bus
>> bandwidth based on the current speed of the driver.
>> This change adds support for two different paths - one from ethernet
>> to DDR and the other from Apps to ethernet.
> 
> What do you mean by Apps?
> Apps means application processor.

>> Vote from each interconnect client is aggregated and the on-chip
>> interconnect hardware is configured to the most appropriate
>> bandwidth profile.
>>
>> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
>> ---
>>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> index e254b21fdb59..682e68f37dbd 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>> @@ -7,6 +7,7 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/phy.h>
>>  #include <linux/phy/phy.h>
>> +#include <linux/interconnect.h>
> 
> If you look at these includes, you should notice they are
> alphabetical.
> Agreed, let me update it in v2 of this series.
>> +static void ethqos_set_icc_bw(struct qcom_ethqos *ethqos, unsigned int speed)
>> +{
>> +	icc_set_bw(ethqos->axi_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
>> +	icc_set_bw(ethqos->ahb_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
>> +}
>> +
>>  static void ethqos_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
>>  {
>>  	struct qcom_ethqos *ethqos = priv;
>>  
>>  	ethqos->speed = speed;
>>  	ethqos_update_link_clk(ethqos, speed);
>> +	ethqos_set_icc_bw(ethqos, speed);
>>  	ethqos_configure(ethqos);
>>  }
>>  
>> @@ -813,6 +824,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>>  		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
>>  				     "Failed to get link_clk\n");
>>  
>> +	ethqos->axi_icc_path = devm_of_icc_get(dev, "axi_icc_path");
>> +	if (IS_ERR(ethqos->axi_icc_path))
>> +		return PTR_ERR(ethqos->axi_icc_path);
>> +
>> +	ethqos->ahb_icc_path = devm_of_icc_get(dev, "ahb_icc_path");
>> +	if (IS_ERR(ethqos->axi_icc_path))
>> +		return PTR_ERR(ethqos->axi_icc_path);
>> +
> 
> This all looks pretty generic. Any reason why this is just in the
> Qualcomm device, and not at a higher level so it could be used for all
> stmmac devices if the needed properties are found in DT?
> 
>        Andrew
ICC is a software framework to access the NOC bus topology of the
system, all though "axi" and "ahb" buses seem generic but the 
topologies of these NOC's are specific to the vendors of synopsys chipset hence
this framework might not be applicable to all the vendors of stmmac driver.

	Sagar

