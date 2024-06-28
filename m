Return-Path: <linux-arm-msm+bounces-24690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F12EC91C8DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 00:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 298F81C24303
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 22:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F393C12FB37;
	Fri, 28 Jun 2024 21:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qirre7mH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F85880023;
	Fri, 28 Jun 2024 21:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719611937; cv=none; b=grIUp1AAzvLOkz1MRfwpPQwInJEuC30+61+g4lIAiqeqssP5OldiarASbRew1DKOvvXFH2+prt+AlBrSLnStKh9Lv1Gvm1OwCdYbwXm4ACVNHweBTj/AGi84Uvvja1zB6HL26iz4LH4GKQxhWzM0h71VCG1inkrj2nXi/TaahXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719611937; c=relaxed/simple;
	bh=aNx5wKKGglJ25DAiffP1QsM3xJSJSymxhK2portxqrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MxCu4Mz6XDEcM1DkJKruKPKFEl2xaThqtPtfRth38MGVLZF4HxkL18O1YkmfD9IBuRF5rEjpYBheRRpm4ttIgn4J6/PNkwOJTQtszVm4oNraXPfKSilumnKh7yLS05oh562v+k/+N/ur70xLFdncor8Sse13rR3LquvPIGVyoIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qirre7mH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SL02oo016462;
	Fri, 28 Jun 2024 21:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0J2akENPIzOdoRjL2gN/Jt9bSjm4NMwCA+OZVI573+8=; b=Qirre7mHDVTOq+4Q
	hj1ZjF8KfOdtyBjca5GwZWPQnWbG8MIdc0UhdnR4nFpFJFg4rjcKID/9Y8Z9iqhw
	n3r2xKtTD3hWDp2siaVfpmpmv/Eci/fj6TA1sZmffQ1C6vB1+9nzqOqIY0lQ7zTq
	OxqqaoUlbvI/uvhayvoo75r0A50/FLD/jHzqhUmKaAJha/RD+hI1l0eDVT+z6q2u
	m99Nbk3mpK7RMPblh0ro/TRjmLylpYKX/Z3T6OLgTDnznil4dqXkEmHU27HYY7uw
	kaWKYlSeGTaU54otTmE+2wNVuIObmsWLKzyijCrCbDqDuG765UrBZIUqYJKXeJ75
	pOPGSg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 401pm5twqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 21:58:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SLwSfl007583
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 21:58:28 GMT
Received: from [10.110.112.228] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Jun
 2024 14:58:25 -0700
Message-ID: <22edcb67-9c25-4d16-ab5c-7522c710b1e2@quicinc.com>
Date: Fri, 28 Jun 2024 14:58:24 -0700
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
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <974114ca-98ed-44a7-a038-eb3f71bd03ef@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ct61UG8KzFfDtH6q0f7ehA3guyUqO1k_
X-Proofpoint-GUID: Ct61UG8KzFfDtH6q0f7ehA3guyUqO1k_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_16,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406280165



On 6/26/2024 5:12 PM, Andrew Lunn wrote:
> On Wed, Jun 26, 2024 at 04:36:06PM -0700, Sagar Cheluvegowda wrote:
>>
>>
>> On 6/26/2024 6:07 AM, Andrew Lunn wrote:
>>>> +	plat->axi_icc_path = devm_of_icc_get(&pdev->dev, "axi");
>>>> +	if (IS_ERR(plat->axi_icc_path)) {
>>>> +		ret = (void *)plat->axi_icc_path;
>>>
>>> Casting	to a void * seems odd. ERR_PTR()?
>>>
>>> 	Andrew
>>
>> The output of devm_of_icc_get is a pointer of type icc_path,
>> i am getting below warning when i try to ERR_PTR instead of Void*
>> as ERR_PTR will try to convert a long integer to a Void*.
>>
>> "warning: passing argument 1 of ‘ERR_PTR’ makes integer from pointer without a cast"
>>
> 
> https://elixir.bootlin.com/linux/v6.10-rc5/source/drivers/crypto/qce/core.c#L224
> https://elixir.bootlin.com/linux/v6.10-rc5/source/drivers/gpu/drm/msm/adreno/a3xx_gpu.c#L591
> https://elixir.bootlin.com/linux/v6.10-rc5/source/drivers/gpu/drm/msm/adreno/a3xx_gpu.c#L597
> https://elixir.bootlin.com/linux/v6.10-rc5/source/drivers/spi/spi-qup.c#L1052
> 
> Sorry, PTR_ERR().
> 
> In general, a cast to a void * is a red flag and will get looked
> at. It is generally wrong. So you might want to fixup where ever you
> copied this from.
> 
> 	Andrew
the return type of stmmac_probe_config_dt is a pointer of type plat_stmmacenet_data,
as PTR_ERR would give long integer value i don't think it would be ideal to
return an integer value here, if casting plat->axi_icc_path to a void * doesn't look
good, let me if the below solution is better or not?


 	plat->axi_icc_path = devm_of_icc_get(&pdev->dev, "axi");
	if (IS_ERR(plat->axi_icc_path)) {
		rc = PTR_ERR(plat->axi_icc_path);
		ret = ERR_PTR(rc);
		goto error_hw_init;
	}

	plat->ahb_icc_path = devm_of_icc_get(&pdev->dev, "ahb");
	if (IS_ERR(plat->ahb_icc_path)) {
		rc = PTR_ERR(plat->ahb_icc_path);
		ret = ERR_PTR(rc);
		goto error_hw_init;
	}

	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
							   STMMAC_RESOURCE_NAME);
	if (IS_ERR(plat->stmmac_rst)) {
		ret = plat->stmmac_rst;
		goto error_hw_init;
	}

	plat->stmmac_ahb_rst = devm_reset_control_get_optional_shared(
							&pdev->dev, "ahb");
	if (IS_ERR(plat->stmmac_ahb_rst)) {
		ret = plat->stmmac_ahb_rst;
		goto error_hw_init;
	}

	return plat;

error_hw_init:
	clk_disable_unprepare(plat->pclk);
error_pclk_get:
	clk_disable_unprepare(plat->stmmac_clk);

	return ret;
}

Regards,
Sagar

