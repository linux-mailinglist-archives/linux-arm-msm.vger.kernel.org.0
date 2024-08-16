Return-Path: <linux-arm-msm+bounces-28840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B15955384
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 00:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 469FE1C2142C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 22:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E797313FD84;
	Fri, 16 Aug 2024 22:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n8b/rxrc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B18813C80F;
	Fri, 16 Aug 2024 22:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723848639; cv=none; b=phk6q8QFFNUFrEnaLfXOO6dpxdq8mGBlJg2SBse++SEJ8j23guFt9lWr/dPXeYOeDPF+GVSAyWtB75ErJSuh9Wgw0BN//L0Fl1cAKtBLzs4e6CJ1aJpEz7N5sOLoNjEUtNlJkglYoPKvPfehqbCJopJjK9MfPxqdrDUUfsicd3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723848639; c=relaxed/simple;
	bh=4sFCiaTXrG/c3VpDIkVNec8p/t/V/GjyJ1lQxTaGo1k=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRxqIWpROoN4In1u2hPoo1b7/vknxZOpSW8EB9UaTFE2TVTWsz07LR8dwjjUkHuggQH2ttVz4IUfl31EIT/nwVi4CMSnQXzm4H73PvFrcIERDDsoKtZtxnN0Y8rTeZvOFSV6Dq5F3lsllWaKHPH4sCYJM4o09YXMhDf8R+JUTAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n8b/rxrc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47GMmH2E013748;
	Fri, 16 Aug 2024 22:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iboElvC40g+k3Ef6sTPLY5xE
	vHgmIN9WYKSF8oebX3Q=; b=n8b/rxrcXliV/7A81Hfekr/fOqC7i4mteWIh1EiR
	w171zvjNN+Ie7831E7YF3NIJTnYibV50+drAKxZx43ApQsgPrJA/XL9hMxDsBwbO
	MoOw+V1HKTt8P0BhOUNnwxoYRRDf1SIM7Fc0xzAOvu9COpWiWNLmQQNFF5+Hj9DW
	U4udVgFIfomZJBc/lu7Q638inBkfvGeYyW161cBvZFvBH/btHICE7eDU7tIaPrLm
	fOazRCgNB1ciNK9neIV8B1Jnqb07SYdp4OviPMZs8DYbi6j2gAESpSMpIXOsGQfT
	fkG0C63d0pTNOZZFaw23WPm5A0Ur4zt9JfdS77U3ozyJFw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412bqe8jqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 22:50:22 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47GMoLR1032159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 22:50:21 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 Aug 2024 15:50:21 -0700
Date: Fri, 16 Aug 2024 15:50:20 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: <regressions@lists.linux.dev>, Kyoungrul Kim <k831.kim@samsung.com>
CC: "James.Bottomley@HansenPartnership.com"
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
Message-ID: <Zr/XrH1hsp0seP2Q@hu-bjorande-lv.qualcomm.com>
References: <CGME20240709232520epcms2p8ebdb5c4fccc30a6221390566589bf122@epcms2p8>
 <20240709232520epcms2p8ebdb5c4fccc30a6221390566589bf122@epcms2p8>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240709232520epcms2p8ebdb5c4fccc30a6221390566589bf122@epcms2p8>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x8rIhf8rJX-QQ7rTOprVbAbUF1u37MsT
X-Proofpoint-ORIG-GUID: x8rIhf8rJX-QQ7rTOprVbAbUF1u37MsT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_16,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 clxscore=1011 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160163

On Wed, Jul 10, 2024 at 08:25:20AM +0900, Kyoungrul Kim wrote:
> if the user sets use_mcq_mode to 0, the host will try to activate the
> lsdb mode unconditionally even when the lsdbs of device hci cap is 1. so
> it makes timeout cmds and fail to device probing.
> 
> To prevent that problem. check the lsdbs cap when mcq is not supported
> case.
> 
> Signed-off-by: k831.kim <k831.kim@samsung.com>
> ---
> Changes to v1: Fix wrong bit of lsdb support.
> Changes to v2: Fix extra space and wrong commit messeage.
> Changes to v3: Close missing parenthesis and fix grammatical error.

This causes the probe of the UFSHCD in Qualcomm SM8550 MTP to fail with
-EINVAL.

[    6.132937] ufshcd-qcom 1d84000.ufs: Adding to iommu group 4
[    6.142509] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
[    6.149843] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to find vccq2-supply regulator, assuming enabled
[    6.209794] ufshcd-qcom 1d84000.ufs: ufshcd_init: failed to initialize (legacy doorbell mode not supported)
[    6.226571] ufshcd-qcom 1d84000.ufs: error -EINVAL: Initialization failed with error -22
[    6.348770] ufshcd-qcom 1d84000.ufs: error -EINVAL: ufshcd_pltfrm_init() failed
[    6.363203] ufshcd-qcom 1d84000.ufs: probe with driver ufshcd-qcom failed with error -22

#regzbot introduced: 0c60eb0cc320
#regzbot title: scsi: ufs: Qualcomm SM8550 MTP UFSHCD probe failing

Regards,
Bjorn

