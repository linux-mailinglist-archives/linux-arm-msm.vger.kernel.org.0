Return-Path: <linux-arm-msm+bounces-28928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C08A956146
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 04:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A92C280FE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 02:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086BE4594D;
	Mon, 19 Aug 2024 02:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JQPENKy9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACFB45023;
	Mon, 19 Aug 2024 02:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724036158; cv=none; b=CY48X6cKEt34v4ovoMkM5SgQrCA0L+osYZxu0Z20FyT9+p0JMcmxOVqynUC5EXiBWmdq99Dnus2VQ0/SVazi9BjEy7TSDpKgXTOz2NIw5pA4BrOksu4+rXGiMRHyB3rufheDpe2jOBvf5lO9qD9xPA/qlEGwo3rmxpG8P9cwJH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724036158; c=relaxed/simple;
	bh=vWBUX2Q0Jh17sBKhqhIany0Jno6QmeBeVh5y6THcdjU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQ3gxFWKkhTvQJWQuHaBm8gK+IG9BJlO1EuDBWPsdEkisqdl1gSGSlNM8zf5mc8vRJnPmdTSKN6WOTd1BnJUgL/ywDk6lUr83fY6dAup13sJKmxcfOlKOrXkuKGKbqWj72PXiC8RFF5167WZs1i8tYFpqXeGNTTiY9WuUxuKFck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JQPENKy9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47INVrFW011055;
	Mon, 19 Aug 2024 02:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBeJdG1kMGEqi94+veSuqJgTQTyfpK4JMn9oHuLn0rQ=; b=JQPENKy9XdTj2yk8
	7gkD1ocHC9trRE23Bsz8Fg9XF7vyuI2QSNwlh8S1Es9IJ/HtsdP/1KVCVxc6ABlD
	ITRNvU5yJmLFcSFoPK3tZrB27QGjdKanGYnUicaNIsdsKvT6un5XszoK3Gp5Kdwk
	jrHNtzVijtjJkg3EzZO5xdoPtFVo00VPpvam50W+9NbHDvgMRyomfoPOADn28kkf
	T8jUHpfIj16MHNTMOB0/rFrWOL91rdN6HpFgL/zjGBCDhI516gqsE6rILbKGS6PZ
	VinB7n1NpTymOA14J8kK7Cnof/3FGdJEvjWvMBjqQeKte1bjBRDXrsuNEtgwhInm
	AVItlA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412m872rtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 02:55:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47J2tSaw006632
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 02:55:28 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 18 Aug 2024 19:55:28 -0700
Date: Sun, 18 Aug 2024 19:55:27 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
CC: <regressions@lists.linux.dev>, Kyoungrul Kim <k831.kim@samsung.com>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@hansenpartnership.com>,
        "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>,
        "bvanassche@acm.org" <bvanassche@acm.org>,
        "Ed.Tsai@mediatek.com" <Ed.Tsai@mediatek.com>,
        Minwoo Im
	<minwoo.im@samsung.com>,
        "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH V4] scsi: ufs: core: Check LSDBS cap when !mcq
Message-ID: <ZsK0H8RanqNfG9HJ@hu-bjorande-lv.qualcomm.com>
References: <CGME20240709232520epcms2p8ebdb5c4fccc30a6221390566589bf122@epcms2p8>
 <20240709232520epcms2p8ebdb5c4fccc30a6221390566589bf122@epcms2p8>
 <Zr/XrH1hsp0seP2Q@hu-bjorande-lv.qualcomm.com>
 <20240817055508.iomq7c4wvsn5gvj3@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240817055508.iomq7c4wvsn5gvj3@thinkpad>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IwdvigNO0_B1rclqpJU8u037n8e0damB
X-Proofpoint-ORIG-GUID: IwdvigNO0_B1rclqpJU8u037n8e0damB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-18_24,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190020

On Sat, Aug 17, 2024 at 11:25:08AM +0530, Manivannan Sadhasivam wrote:
> On Fri, Aug 16, 2024 at 03:50:20PM -0700, Bjorn Andersson wrote:
> > On Wed, Jul 10, 2024 at 08:25:20AM +0900, Kyoungrul Kim wrote:
> > > if the user sets use_mcq_mode to 0, the host will try to activate the
> > > lsdb mode unconditionally even when the lsdbs of device hci cap is 1. so
> > > it makes timeout cmds and fail to device probing.
> > > 
> > > To prevent that problem. check the lsdbs cap when mcq is not supported
> > > case.
> > > 
> > > Signed-off-by: k831.kim <k831.kim@samsung.com>
> > > ---
> > > Changes to v1: Fix wrong bit of lsdb support.
> > > Changes to v2: Fix extra space and wrong commit messeage.
> > > Changes to v3: Close missing parenthesis and fix grammatical error.
> > 
> > This causes the probe of the UFSHCD in Qualcomm SM8550 MTP to fail with
> > -EINVAL.
> > 
> > [    6.132937] ufshcd-qcom 1d84000.ufs: Adding to iommu group 4
> > [    6.142509] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
> > [    6.149843] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to find vccq2-supply regulator, assuming enabled
> > [    6.209794] ufshcd-qcom 1d84000.ufs: ufshcd_init: failed to initialize (legacy doorbell mode not supported)
> > [    6.226571] ufshcd-qcom 1d84000.ufs: error -EINVAL: Initialization failed with error -22
> > [    6.348770] ufshcd-qcom 1d84000.ufs: error -EINVAL: ufshcd_pltfrm_init() failed
> > [    6.363203] ufshcd-qcom 1d84000.ufs: probe with driver ufshcd-qcom failed with error -22
> > 
> > #regzbot introduced: 0c60eb0cc320
> > #regzbot title: scsi: ufs: Qualcomm SM8550 MTP UFSHCD probe failing
> > 
> 
> Fix got merged for v6.11: https://lore.kernel.org/linux-scsi/20240816-ufs-bug-fix-v3-0-e6fe0e18e2a3@linaro.org/
> 

This seems to be included in v6.11-rc4, but I see the same issue still.
Perhaps I'm doing something wrong?

Regards,
Bjorn

> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

