Return-Path: <linux-arm-msm+bounces-20939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9999D8D38EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 16:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C5C91F23076
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 14:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF02655782;
	Wed, 29 May 2024 14:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZfdBoOcG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A2617F5;
	Wed, 29 May 2024 14:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716992052; cv=none; b=lBQa52qjgl8eysSFJ6ouUJux++rjenF+FyaRjuNC5xhXqAwyu5FF6dYcSYrqOrsKLs7mTp5HbISrbGQZZb6YXEhmm0yJNwuIUvcvRD9QxcqaBSozG+3/W+jU9NQBNLuvnrRBU6nB1bjMlIZX98Xc/uBwmdBNPODJM5Yv1f/MFxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716992052; c=relaxed/simple;
	bh=tvhpmBOBi6PpDi7Y2RpMDy0NHTDN0MtqyAIYHLm0Fow=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P7guf+KlfIPw6YpRfwp5YuoYz/nQZtxiO0N0lOqYW6iyeZSaUC6OQZeO6tSwFpu1s4fisVNO8o1mkoPfFV2e9P4AHdhV7Kd2IcHcOBulst5IElCv2Y/4yixTzOoeOIJzrGXz94axP4bptFc6gt7bz55ciAGzPF+KC2ql4EoN02I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZfdBoOcG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T4wxHx018858;
	Wed, 29 May 2024 14:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqfnQWiiXx8zP47bSxhpWvDYUchRl20DVMApVnujf00=; b=ZfdBoOcGmXDl3dZy
	FPcOpKHlFYvqkW6k5wzPBS3eF4cXY9lBHrjUBQArvYN6+t2E9HS5hlopLDYAL5GG
	OBFVjRWR8bb9Bz2qE1xg3O75AR3dM+DMx0SuinjQOYT3M3VyhMWm0k1WAgMsqqj1
	nQO4K5od/lSXDe3nsyzjqCix/xW6jWwEDzsRypKAQhBOl9fHQ1tjt+Qfoz172yjK
	su4pR+YAZw3Geggt9wd+ea+ghxezvrHPAEilYN+wfMMfA7YHdAFnfIW6hJkn07X2
	TzrrXOXw7Fk3Qmt1rbdldRDEmcUotE0ARu6Hhy91nKqZY+mZlYjyP38wu8ruMXRB
	4JwGzQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ybadx95jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 14:13:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TEDTZ4029610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 14:13:29 GMT
Received: from [10.50.12.173] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 07:13:20 -0700
Message-ID: <d246bd64-18b3-4002-bc71-eccd67bbd61f@quicinc.com>
Date: Wed, 29 May 2024 19:43:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: dwmac-qcom-ethqos: Add support for
 2.5G SGMII
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Andrew Halaney <ahalaney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
References: <20231218071118.21879-1-quic_snehshah@quicinc.com>
 <4zbf5fmijxnajk7kygcjrcusf6tdnuzsqqboh23nr6f3rb3c4g@qkfofhq7jmv6>
 <8b80ab09-8444-4c3d-83b0-c7dbf5e58658@quicinc.com>
 <wvzhz4fmtheculsiag4t2pn2kaggyle2mzhvawbs4m5isvqjto@lmaonvq3c3e7>
 <8f94489d-5f0e-4166-a14e-4959098a5c80@quicinc.com>
 <ZlNi11AsdDpKM6AM@shell.armlinux.org.uk>
Content-Language: en-US
From: Sneh Shah <quic_snehshah@quicinc.com>
In-Reply-To: <ZlNi11AsdDpKM6AM@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ju5-ZsrkPL9R1SA-3neuqWKDaOGhTLpO
X-Proofpoint-GUID: ju5-ZsrkPL9R1SA-3neuqWKDaOGhTLpO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_11,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405290097



On 5/26/2024 9:57 PM, Russell King (Oracle) wrote:
> On Thu, Dec 21, 2023 at 02:23:57PM +0530, Sneh Shah wrote:
>> On 12/20/2023 9:29 PM, Andrew Halaney wrote:
>>> I'd evaluate if you can update that function to clear the ANE bit when
>>> the ane boolean is false. From the usage I see I feel that makes sense,
>>> but correct me if you think I'm wrong.
>>> At the very least let's use the defines from there, and possibly add a
>>> new function if clearing is not acceptable in dwmac_ctrl_ane().
>>>
>>> Stepping back, I was asking in general is the need to muck with ANE here
>>> is a Qualcomm specific problem, or is that a generic thing that should be
>>> handled in the core (and the phy_set_speed() bit stay here)? i.e. would
>>> any dwmac5 based IP need to do something like this for SPEED_2500?
>> I think disabling ANE for SPEED_2500 is generic not specific to qualcomm.
>> Even in dwxgmac2 versions also we need to disable ANE for SPEED_2500.
>> Autoneg clause 37 stadard doesn't support 2500 speed. So we need to
>> disable autoneg for speed 2500
> 
> (Going back over the history of this addition)
> 
> What 802.3 Clause 37 says is utterly _irrelevant_ when discussing Cisco
> SGMII. Cisco took 802.3 1000base-X and modified it for their own
> purposes, changing the format of the 16-bit control word, adding support
> for symbol replication to support 100Mbps and 10Mbps, changing the link
> timer, etc. SGMII is *not* 802.3 Clause 37.
> 
> I guess you are getting caught up in the widespread crud where
> manufacturers stupidly abuse "SGMII" to mean maybe "Cisco SGMII" and
> maybe "802.3 1000base-X" because both are "serial gigabit MII". Yes,
> both are serial in nature, but Cisco SGMII is not 1000base-X and it
> also is not 2500base-X.
> 
> What makes this even more difficult is that 2500base-X was never
> standardised by the 802.3 committees until very late, so we've ended
> up with manufacturers doing their own thing for years. We've ended up
> with a mess of different implementations described in different ways
> many of which boil down to being 2500base-X without inband AN. For
> example, one manufacturer talks about "HS-SGMII", but doesn't permit
> the interface to operate at the x10 and x100 symbol replications that
> conventional Cisco SGMII uses for 100M and 10M speeds respectfully,
> making it in effect no different from 2500base-X.
> 
> Now through into this mess various implementations that do not support
> inband at 2.5G speeds, those that require inband at 2.5G speeds... one
> can get into the situation where one pairs a PHY that requires inband
> with a PCS that doesn't support it and the result doesn't work. This
> is particularly problematical if the PHY is on a hotpluggable module
> like a SFP.
> 
> It's a total trainwreck.



Qualcomm ethernet HW supports 2.5G speed in overclocked SGMII mode.
we internally term it as OCSGMII.

End goal of these patches is to enable SGMII with 2.5G speed support.
The patch in these series enabled up SGMII with 2.5 for cases where we
don't have external phy. ( mac-to-mac connectivity)
The new patch posted extends this for the case when the MAC has an
external phy connected. ( hence we are advertising fr 2.5G speed by adding
2500BASEX as supported interface in phylink)


> 
> I do have some work-in-progress patches that attempt to sort this out
> in phylink and identify incompatible situations.
> 
> See http://git.armlinux.org.uk/cgit/linux-arm.git/log/?h=net-queue
> 
> commits (I think)...
> 
> net: phylink: clean up phylink_resolve()
> 
> to:
> 
> net: phylink: switch to MLO_AN_PHY when PCS uses outband
> 
> and since I'm converting stmmac's hacky PCS that bypasses phylink to
> a real phylink_pcs, the ethqos code as it stands presents a blocker
> because of this issue. So, I'm intending to post a series in the next
> few days (after the bank holiday) and will definitely need to be
> tested on ethqos hardware.
> 

I am going over the list of these patches.

> However, first we need to get to the bottom of your latest patch that
> only sets PHY_INTERFACE_MODE_2500BASEX when plat_dat->flags has the
> STMMAC_FLAG_HAS_INTEGRATED_PCS flag _set_, but the stmmac code very
> oddly does _not_ use the built-in PCS if this flag is set. See:
> 
> 	stmmac_ethtool_get_link_ksettings()
> 	stmmac_ethtool_set_link_ksettings()
> 
> and their use of pcs_link / pcs_duplex / pcs_speed. Also see
> 
> 	stmmac_common_interrupt()
> 
> and its use of pcs_link to control the carrier, the dwmac1000 and
> dwmac4 code that reads the status from the GMAC, updating the
> pcs_link / pcs_duplex / pcs_speed variables.

In this version of qualcomm ethernet, PCS is not an independent HW
block. It is integrated to MAC block itself. It has very limited
configuration.Here PCS doesn't have it's own link speed/duplex
capabities. Hence we are bypassing all this PCS related functionalities.


I will update with more details on the integrated PCS block autoneg
standard.
> 

