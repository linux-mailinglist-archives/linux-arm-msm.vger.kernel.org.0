Return-Path: <linux-arm-msm+bounces-108238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEiGMadAC2p5FAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:39:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 503635710A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E72A3013A64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 16:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE8448A2D9;
	Mon, 18 May 2026 16:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKfWG0lX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNe1bmrS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAC945BD6F
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122227; cv=none; b=bH8RegpmQuidH7AgeDTDXw9odgCKbdJtMmWTla68D9yMJR/UFVnK8KaHc9HDJFX5N5SrUmOf8A1nx2UhI6EaXOxz+sdeZtx7I8XqWsWu2AKFLE1HZ9abG911SCsjxgZlgQKAYeOmosEP+HVzSBUKV+eoLmvVWn9XbmyskqEbUc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122227; c=relaxed/simple;
	bh=08H69SiY38ncfscG7zIw3eroyGtwg5bKOawoUVHNjmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwK99KsgxVVHUFisabwtZqCZbQVLcVt/3yc+jnPbERRl+6DKdeXqcqVbPR0TfV+UbSxSxvC+soavyk9V6c0ozg5pjrXDCd8AWaNW/DsMTKUfBtZoo6f5DA72LFS2o2ISIUsAhadMiaraE9N//D1KHBO5vHD8K+jF+U89jfWjJEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKfWG0lX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNe1bmrS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICFweI2701076
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z6bl1rogyLjzkYkDgztN3fk05kEH9UeuqTmadnwHZ50=; b=FKfWG0lX3m885V/j
	XA03cSmyeynZpezhjq1eXzi0ZABTxe2hEl3o2x2xyFl6ZDMlUYsJKY+mLusApkPw
	v1rUJPtDQnGVTibeVJpICr/XpE8GW1Pi2pT/Jn8jEt2P3+HOu0RWqzrqlfXsBgSZ
	cqLWWtNMtf6W1J6NprDX0KyK71gkVhUTipkfccCdOpWsWIOb2PnEmYT3rRcDI8/u
	dUkfQPnjYZs3hKnBYlH9yjJFCvP8Yd3xsQlXagDV6Vu3O8eC8xpcqjfA85WiGGkh
	0jLwQG/R75KFBEgXgq67Eib7P43f8w32UMlxPD33BBs9OKi4+6S0B8azyppGZW/2
	g2bB6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82meh0a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:37:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ff0bef198so76102731cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779122223; x=1779727023; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z6bl1rogyLjzkYkDgztN3fk05kEH9UeuqTmadnwHZ50=;
        b=DNe1bmrSfPIb/hjfD6xkgN7R29skp3BFP2K/5NH227R/koKFN3hhoawkFuELAPzfml
         +8+8pwGxz24lO9jh2lTU4HMjvag47fJZHCs4nfYgGT3niM5rgr6xI98OEK/D3H8iulfq
         dVllmlwX80HOObmyfJDFzhQa6pJNvU7PW9TLvNpq8TZxveIIWzExzL/JUDuvoKddNA7X
         K+1clWSLVHO17rafxKvuSFOcGVZtGGxp5jFv05Oheqa1dXZ20VHM6v1X3dKkLaqiuXVr
         rrnn/pGErhkVdegC+Iws4CM+M5/GhAIY+GQo2Ih8QcDE5uU35irqIpJw49WyMijzGtbR
         lgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779122223; x=1779727023;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z6bl1rogyLjzkYkDgztN3fk05kEH9UeuqTmadnwHZ50=;
        b=EOaKa03quJogf+0R3ae6cTKRwFUgpF1ZvgV+tGTtdB8zERyluoINnOkfxjEGtb2QqV
         jO0ngcPc54qV0ddrnFuPnbuChVSPZJ/bhs9g5fwt4ZJcVltJMTHibj4QM5MXWf+MHbMS
         R2vdoHB3XVgWGfEOqde9a28wJGr60lSv3l4emnam68ZL4Ibh4cNUBhOji626mUZKGQYi
         ub5OMzUYVLb11hfs/JuYE+47BUnAKwAZLw7LA1mU/nPXnS6OMLgd1dU8DNrglqR6Rnat
         c5LVypC0yR3XW67S20NOu6JowwK+5eleZ1U0Ylvip/iG93EOQXuUYIEnFFRXPRoLr7/O
         o2XQ==
X-Forwarded-Encrypted: i=1; AFNElJ+P4eccIhHulcsp8cyDQR4dB7MT3EA5Mo4t5Uz1sfuKsdWf34lZYzWdTSf5atZpS1iL3V+NDc3tHYS7od3a@vger.kernel.org
X-Gm-Message-State: AOJu0YxuifUvpFJWqj45JEcbEGc/U7MjpdHq4MkBe605lVSejRXK8qXw
	61rK3UxXN99u2n2VkZypUNqXzJsaL311zgKV39goHLDUH7slNPNmDIzHIIxxBZAADGYDnar857Q
	tLfiPBWFQThA+jAVyM0fMnKs733XVl2yAy607+C+LMfZDcvyXH3sPWHYESa2e+gD9yoYP
X-Gm-Gg: Acq92OHUgK5+VwrEuJNLhLOhh/9hJ/eeucEcIb2wB6w6QrfXn1jZ5d+9FRG1EyGQOOe
	cQqozSSShWq5+hqScoE4/jHYgKn+hrXVdw8nnFhRe0BGvh3Y7NrhmPKf3z7Zbj64RYsWa09yDPO
	zsSk6jB6ElS2PDibReuN2I9aPiiGyjoScSKQRH3ZI/uNw4zodpetPw/03ONId06rIQTehpx+aJm
	tZYes9hhoSZBqU2ao6jT3qpbW7KZqPsb8/U36GJF8NdLXk1EaNq0jFS/0l99U/PCrKBqb+S3Okk
	ZwwytGgwrmRjz5ZuAmsbuzYagdAtO1rLjU1vCXjaZK4vrmwbk3YE8DMjRtkjBx8SeuQXlluoexj
	DvKRBZiboTuG6/b5gmo0+qrWUrjfNYaQje8RSDEjZx3bQ+L8yX+NDjVMx11MuZDZF3U3ELzo39d
	Y/x/1OeVxk0P3cKuLgorVTKUOnn3fpZ7vihz8=
X-Received: by 2002:ac8:5cc5:0:b0:50e:601a:217f with SMTP id d75a77b69052e-5165a076dcamr221804501cf.25.1779122223005;
        Mon, 18 May 2026 09:37:03 -0700 (PDT)
X-Received: by 2002:ac8:5cc5:0:b0:50e:601a:217f with SMTP id d75a77b69052e-5165a076dcamr221803841cf.25.1779122222344;
        Mon, 18 May 2026 09:37:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958878a128sm14023331fa.28.2026.05.18.09.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:37:01 -0700 (PDT)
Date: Mon, 18 May 2026 19:36:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 31/38] drm/msm/dp: add HPD callback for dp MST
Message-ID: <djigwx5k7j2rkaoq7g6paor6l6i25srvq7chjqqnjlbs3shcco@x5drauwxzngp>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-31-01faacfcdedd@oss.qualcomm.com>
 <pc4brjias4ixewzlsvnlhqhlz774z4p6aq7j4kldu5ze2e35sh@tsm2mtrkk3zi>
 <b5b3b1b8-ed48-429c-a87f-0278a6632313@oss.qualcomm.com>
 <tlt2ffn2xz3mpeoojcciieh35zc6pyowlkcjtxkkrnaj32enne@mbcrdrnkmaoz>
 <07ff4730-2efd-4e9d-b632-9fbb517179f9@oss.qualcomm.com>
 <vdjgzhx4xkvid2ukp7j3yir3n4tr423riyzvyzkrh2ssiub5at@pj6wfcy4jz5q>
 <4b18f14f-d485-4b9c-a75c-ead6f7c80f95@oss.qualcomm.com>
 <k6y3e4fqfwkevvvv3zmzmovsrz4i6qkxs3duhz7khsggxwwa77@uogtrpuaxhnc>
 <d4c5d26c-47f1-4e42-9852-d407982cb4f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4c5d26c-47f1-4e42-9852-d407982cb4f6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Tr7WQjXh c=1 sm=1 tr=0 ts=6a0b402f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=-gHNLQfvCd7OBxZQGsYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: FSs_KOU51eR_klGXKhxxfixc0Yg7enHj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NCBTYWx0ZWRfX1pRlfG6/lgES
 ov+jyVCDTkV309NmoYRS4TLQdr46V8jyKOvausJ0aTfnRr8wvmwp4kSOYTJP6x+TRbW2KtopfQv
 /gXVHsq75FWRLASno7g3cXupFCfJ1JOjM760XDrr8OoORLOkuS+/xpSxoauVuqesaY0KRYBTM2U
 tgMrgb8kxjdLF3H0aTl9PBVzo8Di+PDvSSpnNWoYCVYP3oJE/EkLjwbIO66GkGRkfXAxlQCWaHC
 1zpRPBuyiApqoui/uQu2CiZQWV5ngPwKjjI2AZoRHay6b9nxyIUMRF6lVGpAjV+zCt+5EUbi8F1
 BKhq9KlxdIrn9uQxOM1b/Vhozazl6pVwqxx6jBKt/4FPSmPTuF7hOlMIERbxR6oXhCw1/m4d4VG
 4nIrVwL2RAsd7MJ/HJSRbvhX9U9emqcDqvU4CEoK/TTL8ZEIkEbtGai5dHW+VUJtyKsbUEfJn6z
 n6EgkKXRseknrSMS0oA==
X-Proofpoint-ORIG-GUID: FSs_KOU51eR_klGXKhxxfixc0Yg7enHj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180164
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108238-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,patchwork.freedesktop.org:url,quicinc.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 503635710A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 14, 2026 at 03:12:17PM +0800, Yongxing Mou wrote:
> 
> 
> On 4/19/2026 8:29 AM, Dmitry Baryshkov wrote:
> > On Wed, Apr 15, 2026 at 06:32:29PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 4/15/2026 2:43 AM, Dmitry Baryshkov wrote:
> > > > On Tue, Apr 14, 2026 at 05:51:51PM +0800, Yongxing Mou wrote:
> > > > > 
> > > > > 
> > > > > On 3/25/2026 3:30 AM, Dmitry Baryshkov wrote:
> > > > > > On Tue, Mar 24, 2026 at 09:04:24PM +0800, Yongxing Mou wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 8/27/2025 2:40 AM, Dmitry Baryshkov wrote:
> > > > > > > > On Mon, Aug 25, 2025 at 10:16:17PM +0800, Yongxing Mou wrote:
> > > > > > > > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > > > > > 
> > > > > > > > > Add HPD callback for the MST module which shall be invoked from the
> > > > > > > > > dp_display's HPD handler to perform MST specific operations in case
> > > > > > > > > of HPD. In MST case, route the HPD messages to MST module.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > > > > ---
> > > > > > > > >      drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++++---
> > > > > > > > >      drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
> > > > > > > > >      drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++
> > > > > > > > >      3 files changed, 48 insertions(+), 3 deletions(-)
> > > > > > > > > 
> > > > > > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > > > > index abcab3ed43b6da5ef898355cf9b7561cd9fe0404..59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8 100644
> > > > > > > > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > > > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > > > > @@ -500,9 +500,16 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
> > > > > > > > >      static int msm_dp_display_usbpd_attention_cb(struct device *dev)
> > > > > > > > >      {
> > > > > > > > > -	int rc = 0;
> > > > > > > > > -	u32 sink_request;
> > > > > > > > >      	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
> > > > > > > > > +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> > > > > > > > > +	u32 sink_request;
> > > > > > > > > +	int rc = 0;
> > > > > > > > > +
> > > > > > > > > +	if (msm_dp_display->mst_active) {
> > > > > > > > > +		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)
> > > > > > > > > +			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
> > > > > > > > > +		return 0;
> > > > > > > > > +	}
> > > > > > > > >      	/* check for any test request issued by sink */
> > > > > > > > >      	rc = msm_dp_link_process_request(dp->link);
> > > > > > > > > @@ -1129,8 +1136,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
> > > > > > > > >      	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
> > > > > > > > >      		msm_dp_display_send_hpd_notification(dp, false);
> > > > > > > > > -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
> > > > > > > > > +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
> > > > > > > > >      		msm_dp_display_send_hpd_notification(dp, true);
> > > > > > > > > +		msm_dp_irq_hpd_handle(dp, 0);
> > > > > > > > 
> > > > > > > > Why is it a part of this patch?? It has nothing to do with MST.
> > > > > > > > 
> > > > > > > Emm ... maybe here we can directly call msm_dp_mst_display_hpd_irq..
> > > > > > > I tried an alternative approach by calling the MST IRQ handler from
> > > > > > > msm_dp_bridge_hpd_notify(). I expected that when hpd_isr_status ==
> > > > > > > DP_DP_IRQ_HPD_INT_MASK, the hpd_link_status read in
> > > > > > > msm_dp_bridge_hpd_notify() would be ISR_IRQ_HPD_PULSE_COUNT. That way, we
> > > > > > > could handle both SST and MST interrupt paths in msm_dp_irq_hpd_handle().
> > > > > > > However, hpd_link_status only reports ISR_CONNECTED. So I had to move the
> > > > > > > MST IRQ handling into the IRQ thread. Do you have any suggestions on this?
> > > > > > 
> > > > > > When are the link status bits updated? Please remember, we need to
> > > > > > support all three cases:
> > > > > > 
> > > > > > - Native DP, native DP HPD pin handling
> > > > > > - Native DP, DP HPD pin not handled by the controller
> > > > > > - DP AltMode, DP HPD pin not used at all
> > > > > > 
> > > > > > In the second and the third cases we will not be getting the IRQs.
> > > > > > Instead one of the next bridges (connector, EC, AltMode, etc.) will send
> > > > > > the HPD event, which lands in the .hpd_notify() callback.
> > > > > > 
> > > > > I added some logs and did some testing. I think
> > > > > msm_dp_aux_is_link_connected() only shows the current HPD state. Since IRQ
> > > > > HPD Pulse Count is very short, by the time we read REG_DP_DP_HPD_INT_STATUS
> > > > > in the IRQ flow, the HPD state machine has usually already finished pulse
> > > > > classification and returned to Connected.
> > > > 
> > > > But the IRQ should be sticky and it should be readable from the status
> > > > bits.
> > > > 
> > > Yes... I’m not sure how this is handled on other platforms, but on LeMans
> > > can not get IRQ status from msm_dp_aux_is_link_connected().
> > 
> > Can we clarify that somehow? Maybe with the hardware team if it is
> > uncear from the HPG?
> > 
> > > > Note, in the USB-C AltMode case the HPD machine is not used at all.
> > > > 
> > > > > 
> > > > > Because of that, the condition hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT
> > > > > will usually not be hit.
> > > > > 
> > > > > do you have any suggestion that in how to distinguish between an IRQ event
> > > > > and a plug event in .hpd_notify() better? We probably don’t want to
> > > > > introduce another state machine.
> > > > 
> > > > Then, I assume, currently there is no way to actually distinguish those.
> > > > The easiest way to handle the replug would be to store the current
> > > > "connected" status and verify if we are receiving "connected" while
> > > > being connected or if it is a disconnected -> connected change.
> > > > 
> > > Emm.. Currently, regardless of whether it is the native DP HPD (on LeMans)
> > > or DP over Type‑C Alt Mode(test on Hamoa), a single plug event always
> > > results in two or more identical .hpd_notify() callbacks.
> > 
> > Could you please check, why? On Hamoa it might be because of the LTTPRs.
> > 
> > > In other words, after the transition from disconnected → connected is
> > > completed, there is still one more .hpd_notify() with connected → connected.
> > > So it still can store "connected" to distinguish between an IRQ event and a
> > > plug event from .hpd_notify()?
> > 
> > I've sent a series, which explicitly tracks the IRQ events. Hope that
> > helps.
> > 
> Very thanks for sending the HPD IRQ series
> https://patchwork.freedesktop.org/series/151522/. it very helpful for TYPE-C
> MST.
> 
> I’ve been testing it locally based on HPD refator series, and TYPE-C basic
> plug case works on my side (although with some local modify, maybe now it is
> workaround). At least the IRQ is being delivered correctly now and the
> simplest case works. It still need to do some additional testing.
> 
> There is a small question:
> When do you plan to merge the HPD refactor series?

Would you or your colleagues review it? Or at least T-B it?

> and could you please
> rebase the irq series patch to HPD refactor series ?

Once it is merged.

> so that i can keep MST
> depend on those 2 series.
> > Thoug storing of the "connected" state should help us to identify the
> > long HPD pulse (wich should be treated as unplug & replug).
> > 
> > > This is my current understanding. If this is incorrect, please feel free to
> > > correct me. Thanks.
> > > As an additional note, msm_dp_hpd_plug_handle runs through its full flow
> > > twice for a single plug event. Also, the behavior I described above does not
> > > include any MST-specific filtering codes.
> > > > For a longer term (and granted that HDMI also has a notion of HPD pulse
> > > > events) we might want to extend the DRM HPD API to pass through the "IRQ
> > > > pulse" events as is (instead of converting those to
> > > > connected-whilec-connected events).
> > > > 
> > > > Let me sketch a draft for that.
> > > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry

