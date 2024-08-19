Return-Path: <linux-arm-msm+bounces-28930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B48C956183
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 05:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51BBD281843
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 03:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2492D7A8;
	Mon, 19 Aug 2024 03:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nphpxJPl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAD01804E;
	Mon, 19 Aug 2024 03:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724039513; cv=none; b=fCRxPbOXUouEcVVjZHi5+vHbyX2zOduC4rX/B/PYXx7ICSSk0OzWa3mldGp5/9LJQ/KBggXWkwBFQy9FoBbJUfiB5xBdhn1I4RoyDY0iOm1Bs2SIOMQWxc1cPfvE0GvOSdsRLaxOl8vrgyq6AHry0fGobGbqT8EDLc+q05mIgm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724039513; c=relaxed/simple;
	bh=ofuJA077IN9sgtkIcOrbBKrHzo6+Kw5sYtd/kH055LE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwjFpqXL60JDM0HYYWNOnOCh87Zzc4ix7YB01oL1sm+ZwbuLcq/cAQjnz3ka3FJTDEKXXFIsjuHIjSFQTirFPdrnTso/btZXmY3k9sSvBrsKKw4UrjITofw1d+WOy6EO7PQuPozN6dG/xJ+tI+0x9oqOM8ejf0Wl+5zZ0lkifg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nphpxJPl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47IMISNt004413;
	Mon, 19 Aug 2024 03:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e51BkQ4mOJQHDoN4yfAiVJOICRObHoy6Xy0rx+J4FgU=; b=nphpxJPl4Z6M0eh0
	2MmqO7wRYvsgci/wVOSLUP2CYCGhGMP/q8NV04/ZtDJHxLUZxIN/4N9q6z7lyI4L
	MheVbN9lSQmTziz+PushFXfDulU1uI4x/ZEKlFRs1p1diTn25IVLxfP/edHzoS1k
	7IMdJaQ2Q74v9yoSSaTlfZ8WUrMAn5YZc57F+5X4BabgAKazy7jZ3r0ApxNOM2Qu
	kCKoRaQ9f49pUkuNMcpTLeVXIQcBrSnQVdIwl7dxqZ66tpw/1p2t9HlVAXnKOyDH
	OydFc+GFa57th/MabQkO1fT+JE6sSBxyzypYywbF7S/ItCHMZAIovHG5+p2B74Di
	S0DPjA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412m32jupy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 03:51:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47J3pQ4F015619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 03:51:26 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 18 Aug 2024 20:51:26 -0700
Date: Sun, 18 Aug 2024 20:51:24 -0700
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
Message-ID: <ZsLBPJmQnEShE8Q4@hu-bjorande-lv.qualcomm.com>
References: <CGME20240709232520epcms2p8ebdb5c4fccc30a6221390566589bf122@epcms2p8>
 <20240709232520epcms2p8ebdb5c4fccc30a6221390566589bf122@epcms2p8>
 <Zr/XrH1hsp0seP2Q@hu-bjorande-lv.qualcomm.com>
 <20240817055508.iomq7c4wvsn5gvj3@thinkpad>
 <ZsK0H8RanqNfG9HJ@hu-bjorande-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZsK0H8RanqNfG9HJ@hu-bjorande-lv.qualcomm.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Tukzo6qkuU0J28yb5LWsj5fuo2QAjIwb
X-Proofpoint-ORIG-GUID: Tukzo6qkuU0J28yb5LWsj5fuo2QAjIwb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_01,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190028

On Sun, Aug 18, 2024 at 07:55:27PM -0700, Bjorn Andersson wrote:
> On Sat, Aug 17, 2024 at 11:25:08AM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Aug 16, 2024 at 03:50:20PM -0700, Bjorn Andersson wrote:
> > > On Wed, Jul 10, 2024 at 08:25:20AM +0900, Kyoungrul Kim wrote:
> > > > if the user sets use_mcq_mode to 0, the host will try to activate the
> > > > lsdb mode unconditionally even when the lsdbs of device hci cap is 1. so
> > > > it makes timeout cmds and fail to device probing.
> > > > 
> > > > To prevent that problem. check the lsdbs cap when mcq is not supported
> > > > case.
> > > > 
> > > > Signed-off-by: k831.kim <k831.kim@samsung.com>
> > > > ---
> > > > Changes to v1: Fix wrong bit of lsdb support.
> > > > Changes to v2: Fix extra space and wrong commit messeage.
> > > > Changes to v3: Close missing parenthesis and fix grammatical error.
> > > 
> > > This causes the probe of the UFSHCD in Qualcomm SM8550 MTP to fail with
> > > -EINVAL.
> > > 
> > > [    6.132937] ufshcd-qcom 1d84000.ufs: Adding to iommu group 4
> > > [    6.142509] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
> > > [    6.149843] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to find vccq2-supply regulator, assuming enabled
> > > [    6.209794] ufshcd-qcom 1d84000.ufs: ufshcd_init: failed to initialize (legacy doorbell mode not supported)
> > > [    6.226571] ufshcd-qcom 1d84000.ufs: error -EINVAL: Initialization failed with error -22
> > > [    6.348770] ufshcd-qcom 1d84000.ufs: error -EINVAL: ufshcd_pltfrm_init() failed
> > > [    6.363203] ufshcd-qcom 1d84000.ufs: probe with driver ufshcd-qcom failed with error -22
> > > 
> > > #regzbot introduced: 0c60eb0cc320
> > > #regzbot title: scsi: ufs: Qualcomm SM8550 MTP UFSHCD probe failing
> > > 
> > 
> > Fix got merged for v6.11: https://lore.kernel.org/linux-scsi/20240816-ufs-bug-fix-v3-0-e6fe0e18e2a3@linaro.org/
> > 
> 
> This seems to be included in v6.11-rc4, but I see the same issue still.
> Perhaps I'm doing something wrong?
> 

I'm sorry, I misread, the series hasn't made it into v6.11-rc4.
cherry-picking the fixes solves my problem.

#regzbot fixed: cd06b713a688

Thank you,
Bjorn

> Regards,
> Bjorn
> 
> > - Mani
> > 
> > -- 
> > மணிவண்ணன் சதாசிவம்
> 

