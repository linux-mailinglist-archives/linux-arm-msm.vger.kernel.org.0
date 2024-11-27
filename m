Return-Path: <linux-arm-msm+bounces-39247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8D59DA1E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 07:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C36BB16821B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 06:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8481E148314;
	Wed, 27 Nov 2024 06:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kiFpXlRy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D677145B22;
	Wed, 27 Nov 2024 06:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732687307; cv=none; b=VE4zy+G6qRK+L0+owd9O1Yw/2OsLmFqK6AhB4uVoMDS+8bRlNmd8oQzwzo27S0ZOGtwCfoCJTs9Ezm9QiJMmq5jC4YAMjSKVy3GQxNLOc0cpj+I6dV1IHmSP8hW4ThRIJ5AFe2cpDUui4W8yyNSf5JGMFXbUvdcqzUFKnSo7z8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732687307; c=relaxed/simple;
	bh=MPyxOqV0pOp0j2+H7F03PJeKcdcRwWiW+oOgJebyMRU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwfdmMStsAihukJT0Q2vCzdOX1eyHN9Jtr7sGkuHizaolRKnXqOZyjhW2j+IsGLkprwPe5zz2Bcgp/DflKZANsLO4ufdjor3XsCDpsxVnaULu6poeU9XofcIp2GF8b9NtDwCBP/7mQ4DxLQW3YpARAms0NnAwQ/jXQAXxWd2rvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kiFpXlRy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQKLUxd009560;
	Wed, 27 Nov 2024 06:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UT2NT7fk0XNIspB96xdH7PHi
	XMvIiePBOS8v6HDo2AQ=; b=kiFpXlRyKDoibf7gQ4wm+YYh9vCPL/VRNCqum1D1
	c2uXitrQ2pw2HJxlgZVNsjjVzI3EQHndvW7AcxoLuYcklOHYRFSq4I4nqxzSbU4o
	xypZhClDHxcuHZ3H4WtHydlLPdkSqU7MRzk/bwi0T53kdeV0f3oqGUklOPds4j0O
	ekY9wgRAyauSrtPblQ325vVE0Fh2DL6FkxoDmvkqbR30Q/wB5vRTRHd0WlX3dpmS
	WzonVecEu7yeWke4wug5muZgOQzWK+NcxA9e8JkgnjNy+kGhpVPIFgNq0/0s1IQW
	XcyMF/YhKaiGc1gTkBVaS31Ubz9lI/uQtiyT06DP+HpNuA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435ffyt8rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 06:01:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR61ejp021207
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 06:01:40 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 26 Nov 2024 22:01:37 -0800
Date: Wed, 27 Nov 2024 14:01:33 +0800
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, <adrian.hunter@intel.com>,
        <ulf.hansson@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_tingweiz@quicinc.com>, <quic_zhgao@quicinc.com>,
        <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH v1] mmc: sdhci-msm: Enable aggressive PM
Message-ID: <Z0a1vdps0wHidSll@cse-cd02-lnx.ap.qualcomm.com>
References: <20241127031708.2343727-1-quic_yuanjiey@quicinc.com>
 <zrqcbghhhpmr2dknipkmqxcxcxnlqr4ury4haqq4n6xja5lc7p@6gh56cndcwjl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <zrqcbghhhpmr2dknipkmqxcxcxnlqr4ury4haqq4n6xja5lc7p@6gh56cndcwjl>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Rj7Yc6QNlyGRRLH-g8PwO03AjZPW6nxK
X-Proofpoint-ORIG-GUID: Rj7Yc6QNlyGRRLH-g8PwO03AjZPW6nxK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=853 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270049

On Wed, Nov 27, 2024 at 06:00:34AM +0200, Dmitry Baryshkov wrote:
> On Wed, Nov 27, 2024 at 11:17:08AM +0800, Yuanjie Yang wrote:
> > The sdhci-msm driver supports the device in both RUNNING
> > and IDLE states, when eMMC/SD are not reading or writing,
> > eMMC/SD are in IDLE state, the power management module
> > will suspend the device(power off and reduce frequency,
> > etc.), putting the device into a low-power mode. But the
> > current sdhci-msm driver cannot put device enter into
> > low-power mode.
> > 
> > Enable aggressive PM capability to support runtime PM
> > functionality, allowing the eMMC/SD card to enter
> > lowe-power mode.
> > 
> > Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> 
> What is the difference to [1] ?
> 
> [1] https://lore.kernel.org/linux-arm-msm/20241104060722.10642-1-quic_sartgarg@quicinc.com

Thanks for your reminder, I didn't notice there was already a patch. I'll
check upstream first in the future. I will close this patch.

> > ---
> >  drivers/mmc/host/sdhci-msm.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > index e00208535bd1..e3444d223513 100644
> > --- a/drivers/mmc/host/sdhci-msm.c
> > +++ b/drivers/mmc/host/sdhci-msm.c
> > @@ -2627,6 +2627,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
> >  	}
> >  
> >  	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
> > +	msm_host->mmc->caps |= MMC_CAP_AGGRESSIVE_PM;
> >  
> >  	/* Set the timeout value to max possible */
> >  	host->max_timeout_count = 0xF;
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

Thanks,
Yuanjie

