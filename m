Return-Path: <linux-arm-msm+bounces-91358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLb6Jl69fWnmTQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 09:29:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 40177C13F4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 09:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A2B030022C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 08:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80DA306B37;
	Sat, 31 Jan 2026 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="StpbvoES";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8Mrostg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CB02253EE
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769848155; cv=none; b=gRz21OedJW5Us6+VEsrJ/754fUVc11PnSiltrNeggvbZHcx1G7EiVEC/sIMp+HOw7krbIxE4juYCGLGHuOonGJgk5FqkuUuATPIUCTZClBR+X0NZgTa8bisfK1BA6XfrenbYMfdvNdbFnO6Ii1itBVjMiavinvdRuhBItxsrq1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769848155; c=relaxed/simple;
	bh=91vPZmhEaLzscgBIjJjl+9U9TCqvnCk5LiwG7VhRUgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g1VKusWzd02e+KMyjdc9qpuMs0QL/U6VaDh+u9hy9P/yeM2TWOIP3dtgngsIwdzVwxanG0fJpHpM6hJR5oqoCjLEfzLN2SxJYTwwGlmPEbtImh6kEXSQxWmXLtkNHOZzhPkG8jXwO5W+9WUODJloDaK3ubaoWHE+HEKSFlULAUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=StpbvoES; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8Mrostg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4VUkt867264
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZITwdl9I10OiomQXEmP80yCl
	NexlI/AvP0dRW5FYPdg=; b=StpbvoES2qaMAgvDikkVsrVr4wgdbRinu/yuYXzM
	7loqLLTvdnFNtHVYHrCKuhg3wzp7Gxex1ynKacv1v+kADCvt3mAajJQQ2SyUPdzD
	CvTMMZa5ESOi+FRWRPAIrhCWHU/oT1e77LQagIjj/pok+R7Tr444CsePBE52Kqxg
	HDwsaLnGDYE6xfCuQ4NUX0pxEQK7eObJS9ZDE6FAuNIEl77Sl3O+yP5lSU68kZjG
	ZOddf1pne7u+0+nz7yxpotL8gbmwZoPCH3u2Fl8X+lZ7MQnL0Vl8yXVYDoLkxpzx
	uAcHFBSmui7q+Sye31dCCXh4j6PWn7vsLOwGhHaVPqBO2g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1asdrfwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:29:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5033c483b74so91655741cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 00:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769848153; x=1770452953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZITwdl9I10OiomQXEmP80yClNexlI/AvP0dRW5FYPdg=;
        b=F8MrostgQoqovLMCxpKofEIaY1JAhP16lFiScWVesA+rLKB91fmpjzxdxJKmfTmaYx
         4UnoG/47Q0hutPhjPX4EJVYpbQOmJ+8f87uhBEpMnoSZUjPm8C7Xj3wlBf+u9IG5+OYY
         +KQc39eLuR+MgvUzymh7u+6I9wIoX6wqMjKIb6RAKjvU+Fx64ks1XER51txNIEMt/nzk
         GfAsCdey7A5DRvsh7ICmENVHv+fmclmvob26gG925ctKubnSG9C4gRl6Ugws3jPIlxhf
         u7iCGo5Aczi2JVxEkwKVfNpnqjiwmUC57+dvIV0v1GLdHqYy7HPEEGPqShg2QL1MJic0
         /iFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769848153; x=1770452953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZITwdl9I10OiomQXEmP80yClNexlI/AvP0dRW5FYPdg=;
        b=purzFHr95Fjlh5DG7chbOGOrHPdAVYlHXic/Qv/8uaS6/cBn8jD/vTuNKdefdH3qC/
         HOyxymDqd5apLHXPErU71t5V44p35tBLM2j+0kEchzssCyxwVI1d8oyhdC6mZr5QaqvV
         iyi0/4lcJ2HPo+vOxsz9GqaQeEEv/aAE2BqoF+PhVfkYPPHYquX/qI/rOZ+LWr3xAzpa
         cTntsmE9A1dvZBIrhdnvR8LuZ/OClw2NKwB1ND7K8WPflmZGnyZqPJnSU5AznDkiC6UQ
         7IoX3CtPN5Koj+/FEzNMTT+2V0kDMyR1BFQ87Ol3WlTOpiPuOnvqDLDHxMHdge4K1hqi
         /3MQ==
X-Forwarded-Encrypted: i=1; AJvYcCURGk4Ds3WzItgx8J+SyUewZvCFQKC4XOCZ0PczUnen+l87ao5MIssx/5y9LW8OKpA63it1SZGwwgNpUPtC@vger.kernel.org
X-Gm-Message-State: AOJu0YxcsHIYNctd32t9xFTyUhqHfvQYYHo4lgJrJGKe3sbd/QKF7+rI
	XpJvhYaorUrRNskQq1GWi2AamXtgMx7G6YgPWW4XbyDW5p+WPpMjMgXO0nQMi6FflUH4vdRn8t8
	DOC4EfuFOwdV5N3xkui8Do/OI5NIiwNDCT4M839f+p+xgwGTsc7jOG2EAV4mbRHcVp3w+
X-Gm-Gg: AZuq6aI/YLeF4Iy25BxZNg5vjax/o+40gC9JePP9Ipvfx6RSZ4Fes8KIKR5gn1LpOIn
	7wfY1tSRzyYEV6GC3pJIXjPv/Wry1KEIdvWNVSTciUWvkPUKfceAbkWF6II8riqUDqN9MeQrTnu
	45HTFWuWOh+L9WZvEKA8iuA1gvrS5q5qvZhHOLGJ6KgQefM6PhOVVXRUIJxikTvi9+pNJ/8/0uy
	3iK6ha2oUtb0GfA34Y4j7of3GB+tlI5hYelLXlwlFU7T17aHJ5RwLuts6zFmZ/IoCP7jWf51Hdl
	MwB/NRduSRHxxbGy2wxI3vldpefCW8HNI/WFH0Wdqdk4EHevz2dUIG0BwrPyJSnHE0Pk5vfQ79s
	fRtOpstXZCRGiGaCvTzprQhZJimzsd2YR0g0nsbnydQFozjkSYy58YCNDwqgKSEJQmSl6bVqheA
	Y95dV0w3C0bZs4kLJNkTkvq+w=
X-Received: by 2002:a05:620a:290f:b0:8c9:ea1c:f216 with SMTP id af79cd13be357-8c9eb216411mr644980685a.14.1769848152899;
        Sat, 31 Jan 2026 00:29:12 -0800 (PST)
X-Received: by 2002:a05:620a:290f:b0:8c9:ea1c:f216 with SMTP id af79cd13be357-8c9eb216411mr644978485a.14.1769848152398;
        Sat, 31 Jan 2026 00:29:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625fce627sm17225751fa.48.2026.01.31.00.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:29:11 -0800 (PST)
Date: Sat, 31 Jan 2026 10:29:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sunliming <sunliming@linux.dev>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, airlied@gmail.com, simona@ffwll.ch, sean@poorly.run,
        marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, sunliming <sunliming@kylinos.cn>,
        kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
Message-ID: <wcbaoiswckhbm4rzbu26ueccdh4jzahc5sictyuqrxfknc5ge7@va2gbq2jiyes>
References: <20260129024919.30449-1-sunliming@linux.dev>
 <aXsHSTHHP0eyI-Pk@stanley.mountain>
 <b62dc0de-b39c-7515-25d8-6e6817df3f17@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b62dc0de-b39c-7515-25d8-6e6817df3f17@linux.dev>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2OSBTYWx0ZWRfX/r1n7SlH/a7r
 nvzv27vrVBGfFYPqu05drJ6/KKItmuLgMXeSzIxQeXHhwjvX+WeQrIoQua1G6WCKfeIzpztwbPN
 bskFmCc+eUtyUGtiF6zF+aiICyyEtZudIXrDW8dGra0DXS6I8+V4QsrNZ94t6WrmSMWOguwWPky
 j3wTRLf+qKY2lhyASqv1UAFwfK18OV8NyeGvC0tWgdcF9ZiAFtVUe0IFLFjIIi/u02zeGVzmb2K
 Mg+QmYfdRhpiDuoMwk0AtycKTg/EKgPiGgsVu0dkH6jPpv8jqF57m9zjhNanzf1EDj3p0sYtdfv
 TJ5sZcHBhfPgDIv0TH+c88VfxZCCTPmVjtVvlrbAStIuikahI3cpmZfQPm2Slgt3Sju6su+LEHd
 IOjN5xLO8Ge+fqml4gM3VnDrm6jhtBX36jWH5zD9zOubgZlWmSOEVtmpR2uswaZRgi/k3RbG+Gp
 BYFIDk1mCyoTXCsIFXQ==
X-Proofpoint-GUID: EPViMZ0jsqh1GkvMa0GeLJO_halk0uTQ
X-Proofpoint-ORIG-GUID: EPViMZ0jsqh1GkvMa0GeLJO_halk0uTQ
X-Authority-Analysis: v=2.4 cv=LNNrgZW9 c=1 sm=1 tr=0 ts=697dbd59 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=5dRrolKJAAAA:8 a=pGLkceISAAAA:8
 a=wQcbvNaIYhuNGspu8dQA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=y3-2bcJ53AEkEa81XYCb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91358-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kylinos.cn:email,intel.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40177C13F4
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 01:30:35PM +0800, sunliming wrote:
> 
> On 2026/1/29 15:07, Dan Carpenter wrote:
> > On Thu, Jan 29, 2026 at 10:49:19AM +0800,sunliming@linux.dev  wrote:
> > > From: sunliming<sunliming@kylinos.cn>
> > > 
> > > Fix below smatch warnings:
> > > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> > > warn: variable dereferenced before check 'ctx' (see line 159)
> > > 
> > > Reported-by: kernel test robot<lkp@intel.com>
> > > Reported-by: Dan Carpenter<error27@gmail.com>
> > > Closes:https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> > > Signed-off-by: sunliming<sunliming@kylinos.cn>
> > > ---
> 
> Previously, a maintainer suggested that the name should match the email
> address,
> 
> but community patches have consistently used the name "sunliming" since
> then.

There are several possible options here, but I see that this one have
been already used to contribute patches, which are accepted. I'm fine
with accepting this SoB.

> 
> > > Could you capitalize your name?  It's supposed to be a bit formal like
> > > signing a legal document.
> > > 
> > > This isn't a RESEND, it's a v2.  A RESEND means we accidentally ignored
> > > your email so now you have to send the exact same email again.
> > > 
> > > https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
> Get it. thanks.
> > > regards,
> > > dan carpenter
> > > 

-- 
With best wishes
Dmitry

