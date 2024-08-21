Return-Path: <linux-arm-msm+bounces-29231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE02D95A52F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 21:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5E091C215A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 19:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E142516A954;
	Wed, 21 Aug 2024 19:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bLgm4BCH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78E114D2B1;
	Wed, 21 Aug 2024 19:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724267956; cv=none; b=SuZJaknMgK3LfDMBEtF7hSeZOTtCTCuJY8dBQ3PF6ViM78GK6eX43TDODKP9ZpICbvrRmDi43Ny3W65PeUzOxJwNqKBruSNZKFg5dJUAcv7e2GPX8ovGZIUKr7XjRK1hkMtg9eWKnZOdwhapBjzr7Zpehoiy+4dU24vOx4y++YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724267956; c=relaxed/simple;
	bh=TwtAHAFngXqe0dyQ0zzwruTxpgqqEvIuoZdfPlgPUHY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNr/TPuejPKPt77jn93LfXll5H29JvTyQabXgJqsM9jmo6PKUmcRVRZRr3/a8yNiKxsr59xM1AAfZUqHJ7sm4LuoQdK3e6ZamapJbqyXmXbfbl6gzEdiSLrRlF7Ax8xoEai2/CHIsoMf7+yeAy9TveTDAj3h914mEgEwDC/V0gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bLgm4BCH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47LBtnb4012182;
	Wed, 21 Aug 2024 19:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hcO15XkPidcHiy3Qz3D4eTpB
	R4zkmnLgzpBeWNpvEaU=; b=bLgm4BCHkKyKRmYQnenY1oHN5gxAK64AcEnx0QPm
	IfBmK6dQU2JOSTS2zyn8VqsnqJOdg3OZMJJrcb2nTbJ+f0T3Ox2e5q4n31QDcA+Q
	4uMdRldKCdFOmO5SIAmUQhi2NPyT52IXLn6sWuIPsk0IhsSMPgX0vgLXkZcBelwW
	B7+nA0my1mpglPJSvrp/SSKsmErhNNUebeu3dL+kCzPRzwaW1pEwI+DSJ3sLOI3O
	3tHkaRi1Jf+v9y8zDOQG0L8jjfeVBiuy2pNOHrOSPjWYCseLxuueqiEy9SpuOVrM
	UHvq4gnAq1a3r9uA0hKUWe2MK2V4eqH44zZi0zsQ6MDktA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414uh8vkwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 19:18:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47LJIj01014510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 19:18:45 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 21 Aug 2024 12:18:44 -0700
Date: Wed, 21 Aug 2024 12:18:43 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Simon Horman <horms@kernel.org>
CC: Ma Ke <make24@iscas.ac.cn>, <vkoul@kernel.org>,
        <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <mcoquelin.stm32@gmail.com>,
        <niklas.cassel@linaro.org>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
Subject: Re: [PATCH] net: stmmac: Check NULL ptr on lvts_data in
 qcom_ethqos_probe()
Message-ID: <ZsY9k72i0h4pciEz@hu-bjorande-lv.qualcomm.com>
References: <20240821131949.1465949-1-make24@iscas.ac.cn>
 <20240821173730.GD2164@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240821173730.GD2164@kernel.org>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pCsg-V5JK-7SOsWOExJ2Q4POiglkH72V
X-Proofpoint-ORIG-GUID: pCsg-V5JK-7SOsWOExJ2Q4POiglkH72V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_13,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408210141

On Wed, Aug 21, 2024 at 06:37:30PM +0100, Simon Horman wrote:
> On Wed, Aug 21, 2024 at 09:19:49PM +0800, Ma Ke wrote:
> > of_device_get_match_data() can return NULL if of_match_device failed, and
> > the pointer 'data' was dereferenced without checking against NULL. Add
> > checking of pointer 'data' in qcom_ethqos_probe().
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> 
> Hi Ma Ke,
> 
> There is probably no need to repost just because of this.
> But as a fix for Networking code it should be targeted at the net tree.
> 
> 	Subject: [PATCH net] ...
> 
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index 901a3c1959fa..f18393fe58a4 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -838,6 +838,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
> >  	ethqos->mac_base = stmmac_res.addr;
> >  
> >  	data = of_device_get_match_data(dev);
> > +	if (!data)
> > +		return -ENODEV;
> > +
> 
> In this function dev_err_probe() is used, I assume in cases
> where a function that returns an error does not emit any logs.
> 
> For consistency, perhaps that is appropriate here too?
> 

Unless I'm missing something here this function can only ever be invoked
by a match against one of the entries in qcom_ethqos_match[], which all
of them have a non-NULL data pointer.

As such, if we somehow arrive here with data of NULL, the NULL pointer
dereference on the next line will provide a welcome large splat and a
callstack indicating that we have a problem.


If there's some use case I'm missing, I would prefer if this was
documented in the commit message.

Regards,
Bjorn

> >  	ethqos->por = data->por;
> >  	ethqos->num_por = data->num_por;
> >  	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
> > -- 
> > 2.25.1

