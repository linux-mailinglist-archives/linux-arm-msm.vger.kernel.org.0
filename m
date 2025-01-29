Return-Path: <linux-arm-msm+bounces-46523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B916CA220D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 16:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 039E118814CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 15:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03F918F2EA;
	Wed, 29 Jan 2025 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dq2utdw0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E30314830F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 15:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738165629; cv=none; b=CTGj4Q4rnFt3rM6iGI9Ryxc+6pTPCsLeMSj/JL8feMYrBTUNL2BrA3mAgoMI3F8Bnk7f5o+DIPC1WNkYzc5kaS1Sytkui00zBGG/uC8t/SDd4nfSr4Eesg4MhVN5ROzzcM4so3gz46xYHJgKvK4hnf47xKFmD2biHk2rKOcqCZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738165629; c=relaxed/simple;
	bh=gjUlpvtRx4TKO8+ZgCxRL0KfwofILm4mQrQD+cRdeww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfsgz1vFomHQvpiTSKZY8fFECe7DJVfCz9Er/pNFYDx2SvhaHWiZ9GZidUZiNnOh2QMFF9mfObve+mzMCZcCvXIH8vmU1xs4I36l/RbkHWQR3D0//SNidqlFuv+OnC1hWiun0MWrXvcdReIPG3EiU+lrnkotpFi5UCc01gt1a70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dq2utdw0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T6PuqH008447
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 15:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fQOn6UPmJPqadoJzIHUJBVDZ
	sbVE1Q7XtWBXcqczS9Y=; b=dq2utdw0t7AGr7qvQJ8oMqsxLayecNK2K+ZzkirI
	Tgl6cUgZqpOIe5hJZ1+NhRptbWZhuAIsVRbgt1H3zWd3zCJDo8BDHaXUJrA+p15N
	E5/NIouYGVIXX4ilLQK0FaMERpM4I8OhIX9n2wEu0gYpm+zgU4RFt/tFy8yZt+42
	QOMdFtm+AXfE41krJlgBw0EgF9o8k4zKii/wBaL7ttE85k9QgWebLQhvZGUa3vW2
	15t1zFXkXsAWOwlXxr4IMrrMRT1Rrduduh26JeBKKv8gmmMVHdYBahFp4Gl2qtt2
	L4klprxHGLnSN47wYYSI6cIoubZgfXahSN3WtkKNUfBkYA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ff1q10sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 15:47:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216750b679eso92155015ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 07:47:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738165626; x=1738770426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQOn6UPmJPqadoJzIHUJBVDZsbVE1Q7XtWBXcqczS9Y=;
        b=RTCnRuNvWxPOT7PNb2YsGSPpYP/fuWO7rp8AZvoDSVTtOJP2wTEQ72VAehqy+vdUgO
         uSwHmrU+JxgjAB2iq3GFjpsH/AxkLRHpV5cEIR4OlYQeIxA8LH65t64bYvHMPR3mlHHc
         YRvstV6wKJ3aIcUFo4jjA08FBtHCOrpuGG6NR3ev3F4SbeVNSlXTAocGLyE4YkkaGfS9
         6DYP8JvOjkE6ZnxRtK8OQVjC2ChkuLEO2gtF9ogUt6tJ4gC1XFoDsfQ2EPRZoitxqAvq
         /szDLjvcdCwDH3oZksLaDb2AFJvVT0RUv8zZsTtwaDeUEoqE22W0ZkM0kDWyfqCtTiky
         GSPA==
X-Forwarded-Encrypted: i=1; AJvYcCWeyffJmega2oYIoMPJXCP4mSqNHLOiMvLyIdAFHgFyAWXY8w+5ZY+qFjmBJYT5CgMv9Buug+yXZcfX13/3@vger.kernel.org
X-Gm-Message-State: AOJu0Yydh1G/npK+X22+IeXQLsqoSlFL6W97xGbb5dgHkQp9CvmsGEgs
	3I6r5kdce8S9EzZ/4Qd+pqcqjVU1TYftg70qt/tXDdQCDtwVEeqrUTDCD2TkIFZrX1JpcqNF7Qi
	AqE0/vsBNvGlXTRN6CS0yhc1MSdmx0DzDo2bhfAh9oYf7opC04NqkOaE9puSNNHrT
X-Gm-Gg: ASbGncsTd0hhtNTUab2FVS4vY8zjiYrt19t8wgtbgSGbc7r5HoYp2PziNWYcoF/qF/L
	DeecTBntsVEJ3UZAFUe3+rY9gcDF3TOXIqurm1iWRccaWTr7+v649wykZ+UA9sNFNWnLlPc8lux
	5jFjrl0pGDkBL9nggpFoH6MLu4KucnQrmUQzOz9dzcVgbh1feWYPcqyEmzdd39drrvh5TQS8OaG
	FuWUaTtmH+hhf1gEPX0CoglbTbOWkS5fV0x+LPwtExBFvKJoVyRvC9XMOKxVcIxlIhfeOo0JlyX
	d6gx63rU8WyPY0mz5m5/TD1YvQRF0aUv
X-Received: by 2002:a05:6a21:7894:b0:1e1:a716:316a with SMTP id adf61e73a8af0-1ed7a4c0ad4mr4889285637.10.1738165626108;
        Wed, 29 Jan 2025 07:47:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTCfu5425uR24Gf5ZcLkQl8PeXzpr4m471UfUq8uzBmAzeN1wptRFcvgdmGJO4HBfoOh81nQ==
X-Received: by 2002:a05:6a21:7894:b0:1e1:a716:316a with SMTP id adf61e73a8af0-1ed7a4c0ad4mr4889247637.10.1738165625674;
        Wed, 29 Jan 2025 07:47:05 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a78e351sm11500332b3a.180.2025.01.29.07.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 07:47:05 -0800 (PST)
Date: Wed, 29 Jan 2025 21:17:01 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Saranya R <quic_sarar@quicinc.com>
Subject: Re: [PATCH] soc: qcom: pdr: Fix the potential deadlock
Message-ID: <Z5pNdXzj04tEroYS@hu-mojha-hyd.qualcomm.com>
References: <20250128080751.3718762-1-mukesh.ojha@oss.qualcomm.com>
 <3upgcew4ulzxtjjnawqiu4jomm3mm5nf2kxworgeod23nurfrv@5ato4wq54mpm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3upgcew4ulzxtjjnawqiu4jomm3mm5nf2kxworgeod23nurfrv@5ato4wq54mpm>
X-Proofpoint-GUID: GtzOmE1aSSYAG_gEfhxlygJh1-iD0XDw
X-Proofpoint-ORIG-GUID: GtzOmE1aSSYAG_gEfhxlygJh1-iD0XDw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_03,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501290127

On Tue, Jan 28, 2025 at 06:10:24PM +0200, Dmitry Baryshkov wrote:
> On Tue, Jan 28, 2025 at 01:37:51PM +0530, Mukesh Ojha wrote:
> > When some client process A call pdr_add_lookup() to add the look up for
> > the service and does schedule locator work, later a process B got a new
> > server packet indicating locator is up and call pdr_locator_new_server()
> > which eventually sets pdr->locator_init_complete to true which process A
> > sees and takes list lock and queries domain list but it will timeout due
> > to deadlock as the response will queued to the same qmi->wq and it is
> > ordered workqueue and process B is not able to complete new server
> > request work due to deadlock on list lock.
> > 
> >        Process A                        Process B
> > 
> >                                      process_scheduled_works()
> > pdr_add_lookup()                      qmi_data_ready_work()
> >  process_scheduled_works()             pdr_locator_new_server()
> >                                          pdr->locator_init_complete=true;
> >    pdr_locator_work()
> >     mutex_lock(&pdr->list_lock);
> > 
> >      pdr_locate_service()                  mutex_lock(&pdr->list_lock);
> > 
> >       pdr_get_domain_list()
> >        pr_err("PDR: %s get domain list
> >                txn wait failed: %d\n",
> >                req->service_name,
> >                ret);
> > 
> > Fix it by removing the unnecessary list iteration as the list iteration
> > is already being done inside locator work, so avoid it here and just
> > call schedule_work() here.
> > 
> > Signed-off-by: Saranya R <quic_sarar@quicinc.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Missing Fixes tag.

Sure, will add.

-Mukesh
> 
> > ---
> >  drivers/soc/qcom/pdr_interface.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> > 
> 
> -- 
> With best wishes
> Dmitry

