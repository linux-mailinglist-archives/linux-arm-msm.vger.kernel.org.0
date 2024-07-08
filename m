Return-Path: <linux-arm-msm+bounces-25495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D85492A33E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 14:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F10EB2077A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 12:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F20824A1;
	Mon,  8 Jul 2024 12:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hJXWrUyK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5668172D;
	Mon,  8 Jul 2024 12:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720443104; cv=none; b=JiclR9ELqJ+VwRvhQqmEDoVXh6EzJ2OoiklFk05C1YKMTCXPKghydeZwgTREL3ssGxVHGYuAQZMxCuchLQKRgChHEE1zCv6QNDEBT0JmqSLoDtSX8yE2ufAoCVp4I6Slo9vN8fI9BXpzybaoGVxkaveXY0z3wJztC4lmTX9/s1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720443104; c=relaxed/simple;
	bh=9W2e4gmgtezX/A4ILuBVxi1LeD5u3DXZykFEd7AcSxI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRRx8kJU25TVouNWiSvIcYnUsRGISN9ENRmZpFx13+6gWjygEHoOipV5q5bQ+0FRErtQhEAKQmqkhcq0eRDsvOu7jWQUNVfu3j6ddRJUOxFgQ+yueo87aDPxbdYMyq2tXc+R/UM03tyysgjBmfeeQyajuD2dbt/Ys7fYrp4KXfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hJXWrUyK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468Bl4oo006726;
	Mon, 8 Jul 2024 12:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f5ioPdz2Nl4mAdl4bLw0Qfba
	/5iLOvFYSIAbB4pPcO0=; b=hJXWrUyKU/ERmYCim9vFqq0JsPjINov1zp+of609
	6ex3j+9dKbpHmIXiW9DWl9yYG+rb6g9gXWt0qeu6ayBIiKpw5DpvWrhb9H2ahLUA
	XVWgAPxXpb96OknX0JRNlD8JCfFvhoCgflKORG9ewSMpREf6wu1FyuXMBN1fPJNe
	vLy86PAQLEfdxBrXiznPhyNn/Ige9mCyThZROHQppDTE/LGkaq9D7YsBGJuf/62x
	ZT9MmK66uvjGl7ezuy9xlI77SQV3eyNCPj87paxSj5N94GGgdz1i2Gmld+rMvJvW
	quU0IMxFJvoB7EPGLr3DygvBQ05DdILAn7N8mrGtTFlwEQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406y3hbgag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 12:51:39 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 468CpcTi023832
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 12:51:38 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 8 Jul 2024 05:51:36 -0700
Date: Mon, 8 Jul 2024 18:21:30 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Elliot Berman <quic_eberman@quicinc.com>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH ] firmware: qcom: scm: Disable SDI and write no dump to
 download mode register
Message-ID: <ZovgiDPZBOpXdxOp@hu-mojha-hyd.qualcomm.com>
References: <20240705120623.1424931-1-quic_mojha@quicinc.com>
 <20240705113813958-0700.eberman@hu-eberman-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240705113813958-0700.eberman@hu-eberman-lv.qualcomm.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KyZ-Bv2IL-we2sNz8m0wWQLLm1wADJda
X-Proofpoint-GUID: KyZ-Bv2IL-we2sNz8m0wWQLLm1wADJda
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_08,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080096

On Fri, Jul 05, 2024 at 11:55:52AM -0700, Elliot Berman wrote:
> On Fri, Jul 05, 2024 at 05:36:23PM +0530, Mukesh Ojha wrote:
> > SDI is enabled for most of the Qualcomm SoCs and as per commit
> > ff4aa3bc9825 ("firmware: qcom_scm: disable SDI if required")
> > it was recommended to disable SDI by mentioning it in device tree
> > 
> > However, for some cases download mode tcsr register already configured
> > from boot firmware to collect dumps and in such cases if download
> > mode is set to zero(nodump mode) from kernel side and SDI is disabled
>                      ^^^^^^^^^^^^^
> that's not what download_mode=0 does currently, but it's what you're
> proposing it should be doing. I think that proposal is reasonable, but
> can you call out in the commit text that the current behavior of
> download_mode=0 is nop.

Correct..

> 
> > via means of mentioning it in device tree we could end up with dump
> > collection.
> > 
> > To disable complete dump collection mode, SDI and dload mode register
> > need to be set no dump mode.
> > 
> > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> 
> Should this be?
> 
> Fixes: ff4aa3bc9825 ("firmware: qcom_scm: disable SDI if required")

Yes, SDI disablement can still result in dump collection and can cause
a hang.

> 
> > ---
> >  drivers/firmware/qcom/qcom_scm.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 00c379a3cceb..2e10f75a9cfd 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -1954,14 +1954,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
> >  	 * will cause the boot stages to enter download mode, unless
> >  	 * disabled below by a clean shutdown/reboot.
> >  	 */
> > -	if (download_mode)
> > -		qcom_scm_set_download_mode(true);
> > -
> > +	qcom_scm_set_download_mode(download_mode ? true : false);
> 
> Just: qcom_scm_set_download_mode(download_mode);

Sure.

-Mukesh

