Return-Path: <linux-arm-msm+bounces-24676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED90D91C6C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 21:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AC34282EC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 19:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5C376046;
	Fri, 28 Jun 2024 19:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J9DEP9xn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D2F56444;
	Fri, 28 Jun 2024 19:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719603835; cv=none; b=jl+o2v35v2Ma8+sga63g52V7aK14Ssf8ITXIQrl8hZ0dS9H2nx5qfeyyDDkMEMvT9TU8nKKElML04ELKiNU7/bRw0ORsftXAuUPmqeCybv/sD9Y0CYCWU7ulvV0lUVErPHxPYaOlnEeHQxuW6LfRdGrG3jRLndcooaj8/zxU/eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719603835; c=relaxed/simple;
	bh=WGNksG5kOJNWNCKgCePps0v1mU4HZN9ji19NGJ4mjE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GEjNO4JbSREX4Fi5jmKSdmUSUC+r8gwg96CneaohqKnjSVvkQQxA6MRRpAOpppKvv1BlXxlGSeEcJw+JaYigzySf13EjlIOOXYuM6CYOoV6NUhpr7fVrvQ/jIw3UJNg5pqjSs5HNtfzYZSv6qWtN9Au5kIN3glbxThNK3YgpQsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J9DEP9xn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SG03G2023502;
	Fri, 28 Jun 2024 19:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q2LwIZf2YSx0t9IwF7Za6LUyQTFQF1vHoMrv5nB0WaQ=; b=J9DEP9xngBn2qDZu
	tBRk+/+oD2MHpfdgB+U46Fu2pb/3jgLEgiB4nluSn66JxqzcmOYS1zEFBDJSfWpA
	RvXrg0CRybCERedwaI9jqdOzGElEaUqWeQCJkfaHRQQeZggNed7wP2uaRNQUtn0T
	YUJWFuyi67f74BvX9YI8rPLJlP/HZn9OqiXzrq62lYwVwAxuFMk15XdkxUWvPIef
	7/cYMHk4tZu17XqfzE5mv5HQXZ0lYBiwaS39cYc8A5EkUFfEjMpZ4KGEgzidTGBo
	gBO9xN63t8tRyCpnoHfvADxJScIPB27Tb23+nSJUDAdag3wWPUuyUa0J/2dwbZqq
	tCPsBA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400f90rbn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 19:43:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SJhIRF026415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 19:43:18 GMT
Received: from [10.110.112.228] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Jun
 2024 12:43:14 -0700
Message-ID: <0666cba0-a5bb-44bf-845a-6a1c689cb485@quicinc.com>
Date: Fri, 28 Jun 2024 12:43:04 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] net: stmmac: Add interconnect support
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu
	<joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Russell
 King" <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bhupesh
 Sharma" <bhupesh.sharma@linaro.org>
CC: <kernel@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>,
        Andrew Lunn
	<andrew@lunn.ch>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
 <da62cf15-0329-40e5-83f3-16c4b60f7b46@kernel.org>
Content-Language: en-US
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
In-Reply-To: <da62cf15-0329-40e5-83f3-16c4b60f7b46@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0FeFVnqejeMeELFyeYLIzzxaZwFUhdS1
X-Proofpoint-GUID: 0FeFVnqejeMeELFyeYLIzzxaZwFUhdS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_14,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280147



On 6/26/2024 12:40 AM, Krzysztof Kozlowski wrote:
> On 26/06/2024 01:49, Sagar Cheluvegowda wrote:
>> Add interconnect support to vote for bus bandwidth based
>> on the current speed of the driver.This change adds support
> 
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> 
> Also, space after full stop.
> Agreed, i will fix this in my next patch.
>> for two different paths - one from ethernet to DDR and the
>> other from Apps to ethernet.
>> Vote from each interconnect client is aggregated and the on-chip
>> interconnect hardware is configured to the most appropriate
>> bandwidth profile.
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
>> +	icc_set_bw(priv->plat->axi_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
>> +	icc_set_bw(priv->plat->ahb_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
>> +}
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
>> index 54797edc9b38..e46c94b643a3 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> @@ -642,6 +642,18 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>>  		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
>>  	}
>>  
>> +	plat->axi_icc_path = devm_of_icc_get(&pdev->dev, "axi");
>> +	if (IS_ERR(plat->axi_icc_path)) {
>> +		ret = (void *)plat->axi_icc_path;
>> +		goto error_hw_init;
> 
> This sounds like an ABI break. Considering the interconnects are not
> required by the binding, are you sure this behaves correctly without
> interconnects in DTS?
>
> Best regards,
> Krzysztof
> 
Yes, i did check without the interconnect entries in the dtsi and
things are working fine, devm_of_icc_get is properly clearing out
all the references in the case when "interconnects" are not present
in the dtsi.
In the stmmac driver we are only handling the error case and 
if the entries are not present in the dtsi we are simply continuing with
the regular code flow.

Regards,
Sagar

