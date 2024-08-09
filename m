Return-Path: <linux-arm-msm+bounces-28204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E69DD94C7CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 02:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60AF9B24135
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 00:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC233234;
	Fri,  9 Aug 2024 00:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fE+yY7pm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDD21FDA;
	Fri,  9 Aug 2024 00:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723164856; cv=none; b=lK/QEQ5bN4vGEbM3dkjUti3shKYSXMdbd0xZdPMyfRnyeLng/hBQeGB5/XmcnSxsFV1F+eARtj1zT0HU2cAFUmnhW1ErKXDFEqZoNSJAn77WCOgJSTsBNG8IkUvIzJySWz1jY8JmD8x1wLXm21mmCGMaK1omUxHm2w/MDG0aMDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723164856; c=relaxed/simple;
	bh=jwOckgMd0TKb56Ju7GqDcR3lE40CnpCIKUHDoUkzMLY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nadGNJiVCEq3PHRLBJd9gs5d9cspR/RdoC1x90H9k/unXblsjXbFwyt10V6UTY44u+Ycq+Mw2y1QhrCWtSpHnCpuioNWQMhqGLyo0HCKyMHBK0YjyU+/BfBREAcj1K2L/FBHQmqj2AsmLRDkhBkax0PSmS8SFYXSsX980g0yS2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fE+yY7pm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 478A1H8U006798;
	Fri, 9 Aug 2024 00:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l9QjimrNSolKPWipRePhNnAw
	/1Ihv1dSvRPQ+ZlwXf8=; b=fE+yY7pmmQE/J7xefq+GuRbd5ACOqMnkgUnx07V1
	Uk3VA1wdOvt71gstyyAvG0MO5jeioK/SXnbtWlFWl6A3kgnhyNL0DP+IUdIuS027
	bJtvlRoJC49+81Oyt9Tp0t+zjA3xog1uQGV9ibOTgNYt3JDFfGomMjNVMuIctiAW
	3N7uO6T0T0US5IfnGCep0fhPCv0FI5Y2tSP/E0xQjkoNgnHe+U1Y/34N+w8wBfUK
	D+xk6e3VsOFAkF5hsnZzwu1T4VdoGreBce7SujGt6Gegn7ZAkS4L6w/mNA0oYQsw
	bSbAOYGXiqob92c2dMEyutCe0t6pti8EVPv5mB7CmpbSCA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vuwat2b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 00:54:12 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4790sBqx015622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Aug 2024 00:54:11 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 8 Aug 2024 17:54:10 -0700
Date: Thu, 8 Aug 2024 17:54:09 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_fs: Define pr_fmt
Message-ID: <ZrVosYq/+FG0Y56u@hu-bjorande-lv.qualcomm.com>
References: <20240729-f_fs-pr_fmt-v1-1-8a0fc3196201@quicinc.com>
 <2024073004-crinkly-lark-d9d1@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2024073004-crinkly-lark-d9d1@gregkh>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: irVGsrVATHKXnN1x_6c4A-K46TN-sbNu
X-Proofpoint-GUID: irVGsrVATHKXnN1x_6c4A-K46TN-sbNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 mlxscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=837 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090005

On Tue, Jul 30, 2024 at 07:00:32AM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jul 29, 2024 at 03:53:50PM -0700, Bjorn Andersson wrote:
> > The majority of log entries of f_fs are generated with no indication of
> > their origin. Prefix these, using pr_fmt, to make the kernel log
> > clearer.
> > 
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> >  drivers/usb/gadget/function/f_fs.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > index d8b096859337..14ee43cb27b6 100644
> > --- a/drivers/usb/gadget/function/f_fs.c
> > +++ b/drivers/usb/gadget/function/f_fs.c
> > @@ -10,6 +10,7 @@
> >   * Copyright (C) 2003 Agilent Technologies
> >   */
> >  
> > +#define pr_fmt(fmt) "f_fs: " fmt
> 
> Why not fix the driver up to use the proper dev_*() printing functions
> instead?
> 

I looked for that, but unless I'm completely misunderstanding the code,
there are no struct device involved to print upon. Is there some other
instance information that we'd like to include in these prints?

> Or, use KBUILD_MODNAME?
> 

I can certainly use that instead of the hard coded string, if you
prefer...

Regards,
Bjorn

> thanks,
> 
> greg k-h

