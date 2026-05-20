Return-Path: <linux-arm-msm+bounces-108744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFlGEQqsDWqP1QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:41:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB2B58DF59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A41DA3036425
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEDB347505;
	Wed, 20 May 2026 12:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfe8X8wx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWAcY06e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28C73DFC62
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280628; cv=none; b=K2fJVpRVYW2QeNFICWWHheUxhjlcfk/+ZgIzjr9mQevHYDtqcLXw6RzOXO0Ru44n633B+v835eNv0CHR04cBfEdUAmgHzaTdui3THPdU5VLC12XfENNEF1wo62wdQKCKp3PQPlUpKA7VCAFymuNZCdVKsYJoYL/P2P8uIM7+LjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280628; c=relaxed/simple;
	bh=/hRKyfGAxsnXNj5GIYJnF8t5hnlBuEBnQFpb9Wv4m0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nl8E/AVONMwuByrTmHvZTdO9F8lH8kRN63EVv++WzH9BRtgJh/rBLdByGfQR9IeSzx/DJk//hUfpUzMZvlOq+JOEL2U594QELEpwLJsCZmjjThqTX45A2TCANeH2x1sLwG38cWU2M8TblJIxYJ65kpYwOkQ1B+XiqSV88Qm+LrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfe8X8wx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWAcY06e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K70jGB629637
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MQWPQmhDmwD4oX8nyytXi5se
	S2wORlym9UiV776yap4=; b=kfe8X8wxMQwCDeDF4V3x2wu9wMTurEr14zaVPx+Q
	0ftHWOLcKGCJ84p3EAHT5SJsKwzY8B355txmx5RyIll0S7HxwSK9D/00CvVElqC6
	ZdP/rzEA22HO8ZegxmvCu3PMSHgumSHUGjmijCplHULpeDBm+JunmEUsh3lik2u5
	BMhwQxG2TY4qL+39HOGsuMPgcMGewlt53fxty+hQRvd+ICe/IY79e978xoArnNXY
	kuVbVAaUPqTLuoHtNHfa7xiAN41Vklq3OS+kUcszpcrWTndq1BZnp59tNifrPk6N
	SLk+8x8I9f8V3jSH5683JnfNVQ2A55q/BFSvpn0ptvtYxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3nvt66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 12:37:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5d1c2289so144424681cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 05:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779280621; x=1779885421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MQWPQmhDmwD4oX8nyytXi5seS2wORlym9UiV776yap4=;
        b=UWAcY06evLCQe+Ff30z1yYcRqQXDo1t4JLIfdavmmjL3JvZEAZ/dmepHCUl8H33I03
         vxtmADjkTdtMcokY1iGowO7wyyT61O83Yo227ff5zWvGGzKUfHm+tVU4dc6BoY78DnPu
         TCkqS6DXINSu9TqWHX0PgXmEh0mlNZAj5QIBlrLjBfe/ZiDNjRCTgNkgROzMOZjXqpjC
         Xe2gMbkdHCXrnUCqdXrR6SmHWJk+fzQ9rqUbZkTVkfyIs4/p4XJjHXWHZ1tFH5TiW8Kz
         CGH6tWAy2RR38pNLLPb+BVdTMBwrBvZ8GciwGy4J0P4bNepsnIXWjuOrtxLVsxWDPb4o
         tSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280621; x=1779885421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQWPQmhDmwD4oX8nyytXi5seS2wORlym9UiV776yap4=;
        b=aDiYPMF/uR9tik6niYzDOHX5GJwxYc6v3sx/OXx1ShtJgX5COUlofQWAzEKJkE1SDT
         WCrHFnm8kZt0A7L+HiivMuDCiOBhHIfK/O9tjTp90d0LWnXvIKwNf4fxoHV75h3e1D0H
         pLq9uwVKO3vl620m2t++9gxUAQ4zPGENHVcTKBZjef/uaraBNhDXY+yr8feLkkNmJWIK
         sPmYI0gDvROA6GiJhTka1QXBnvZ+DHP9FyipCWLBCk7hX8k51ykDOKnguuIQ/PzxxUKL
         z5Gknfcdp12fTmT4qPh6KQSqNiUAX1O1l8xjXcIVran7IgDz5vF9MLgUHF4io+CrGUhG
         a+uQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pAU/9DsalJFWI+6EuRjm9xtDcBt7k0OPV87gHOguj5HNOrhCvDbGraG3Yf/uqEqSsDvl95uM00b7tqMGT@vger.kernel.org
X-Gm-Message-State: AOJu0YyoVheQKgox80dXS8g4IAC4K56mkstRHzsw17dOaBYrM6gCXUfT
	rCjmv+K+IzKLN+vc5q/O/f/KgWZkPdTVfmppNbdsk4vrFJBwg76G8ywhV32J19XksOx0bLChJ/A
	wCoTfKzhczByV8mK5pHGnHxmUy2qn9JnVKGYOncM4Mv2mEcQ8pGWzP3wdzlirl6rW7Pfj
X-Gm-Gg: Acq92OEsLB01IZZsTYMyqSMNiY+1kFHwUV9pQT+HTH2w5jbS5cRBXmFiVylQOQkUm8v
	nzDJD7npvkSCNKYeLtg0ySeNFdOmBgovbENh7ZSoF37BET+Fgb1ejlBizyHJr/W6RuFdbODIln5
	yP79C13xhxz2/v93nVZVGlrzjslbOaj0aoIYZRNDNbqm0RCT9fiFANydH3PkFs9uEJy33Na+MRN
	7NHYoejz+BPF1bVNdL1rH+3ELRoFk2z42GCwukuA8q0bfzHlAn8mC6xRAevcgNAqCVjX0Z3M1d2
	xY3PVt3k4KyqebEaNFXf7dS+Kw2Cq1/rPUFA84uQL0A6fLsAn9o4Y/bQ/yGp3D5jl4koJtz8Y3e
	hNNjgR8sa5PLlAksMotpchbj7G9wAgveJSnqO6p7Q99W/tW4/4Fx5C5mopG0cpl4q9ZXuJ3C0hI
	bbf5JZghKWmRsDq8tWwvoxq+zVyYqoiCJlsPk=
X-Received: by 2002:ac8:5f08:0:b0:50b:577c:e259 with SMTP id d75a77b69052e-5165a0df411mr330232191cf.35.1779280621094;
        Wed, 20 May 2026 05:37:01 -0700 (PDT)
X-Received: by 2002:ac8:5f08:0:b0:50b:577c:e259 with SMTP id d75a77b69052e-5165a0df411mr330231661cf.35.1779280620461;
        Wed, 20 May 2026 05:37:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b42f8sm30145641fa.36.2026.05.20.05.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:36:59 -0700 (PDT)
Date: Wed, 20 May 2026 15:36:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 08/39] drm/msm/dp: allow dp_ctrl stream APIs to use
 any panel passed to it
Message-ID: <nbrj2lyd6uhaiixyydlgk2t32n7mygdlqtkn4lq2d6qodjv2pd@2jfwwpdatw3b>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-8-b20518dea8de@oss.qualcomm.com>
 <oughavmmvruhnehdpa4e3ptigcb4wndugxazhoeg2yed7ubvgi@aa7wtrz5s6mx>
 <09c14a80-d981-4584-b4bb-8fb2430d7a0a@oss.qualcomm.com>
 <6b6uc5lk4tsxccwyyqlp4u6sqsv3x3uyu32qmgl63rgb2m4wuz@wjcroowka3zq>
 <272690cf-ca46-4b21-a979-3c89de15747c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <272690cf-ca46-4b21-a979-3c89de15747c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMiBTYWx0ZWRfX5uvLNy5ymIfO
 8o0TVN3SD9617rbPEMF7lWJ6tOYeKEpJ9rJxD8NGJo/kK5ElKEa0lUnYKKc7JmnL5LrJgp5P3MJ
 QO4+K70JHiPVnYXmw2zXNCOwgF34WYxjQmmPIssMtdzD3v6HGreGJbTiVGC7f4pV1Qp6P9X3SLi
 FnP7wqU4a77essJTJgnscATeY1387egIxfIIqx4r9YUEAIkKWeuAViEVyTcpJ/HPX2dvD0vv0MO
 zX/u5R6pdxa1XqMOhvsH7lWneJcWEWm692OSh3EROYg6XgTcipechMkdZn/aEwgOLz8U8Zx0FAP
 IG6pOHTqaWE8QdXNUYQmRcCplDHkVa387sFGUXgyM3BNEKev+E8+eY+PAXEaBQ7znq/TlAnXYuQ
 bPlKqNdb8Ia8OfTcbQJeEyvOJUWOAIdi13At2yCWDNKNdrnqF2+hNg9EvmGtSaUJIALrYVo0EGy
 Cg0J7eI7lfcz0LE5DNw==
X-Proofpoint-GUID: kF3sRPiZA4aTVAzzV8v_ASaO_FXxtkFi
X-Proofpoint-ORIG-GUID: kF3sRPiZA4aTVAzzV8v_ASaO_FXxtkFi
X-Authority-Analysis: v=2.4 cv=Mr9iLWae c=1 sm=1 tr=0 ts=6a0daaee cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=FOiHO5QgrhE6IhRZvyEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200122
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108744-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9FB2B58DF59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 06:31:24PM +0800, Yongxing Mou wrote:
> 
> 
> On 5/20/2026 5:24 PM, Dmitry Baryshkov wrote:
> > On Tue, May 19, 2026 at 03:52:35PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 4/12/2026 1:38 AM, Dmitry Baryshkov wrote:
> > > > On Fri, Apr 10, 2026 at 05:33:43PM +0800, Yongxing Mou wrote:
> > > > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > 
> > > > > Currently, the dp_ctrl stream APIs operate on their own dp_panel
> > > > > which is stored inside the dp_ctrl's private struct. However with MST,
> > > > > the stored panel represents the fixed link and not the sinks which
> > > > > are hotplugged. Allow the stream related APIs to work on the panel
> > > > > which is passed to them rather than the stored one. For SST cases,
> > > > > this shall continue to use the stored dp_panel.
> > > > 
> > > > Hmm. Why? Can't we get rid of it (in the followup patch)?
> > > > 
> > > In MST, the stream panel is bound to the connector, but in SST the panel is
> > > still stored in msm_dp_display_private and msm_dp_ctrl_private, so
> > >    dropping it does not seem necessary at this point. The purpose of these
> > > changes is to allow the functions to operate on the MST panel data passed in
> > > per stream.
> > 
> > I understand the panel being stored in msm_dp_display_private. Can we
> > drop it from msm_dp_ctrl_private?
> > 
> Dropping panel from msm_dp_ctrl_private would require adding a panel
> parameter to approximately 15 functions in dp_ctrl.c.  Would you like us to
> do that in this patch?

Either this or a separate patch. But it should be clear which panel gets
used. Otherwise we risk using a wrong panel in the MST case.

> > > > > 
> > > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/dp/dp_ctrl.c    | 21 +++++++++++----------
> > > > >    drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
> > > > >    drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
> > > > >    3 files changed, 13 insertions(+), 12 deletions(-)
> > > > > 
> > 
> 

-- 
With best wishes
Dmitry

