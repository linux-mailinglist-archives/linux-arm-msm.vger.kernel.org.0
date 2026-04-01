Return-Path: <linux-arm-msm+bounces-101326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOdQDfcCzWmSZQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:35:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C3D3798AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 30ED630447AB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A6F3FF89B;
	Wed,  1 Apr 2026 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LroaltNi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ea7gLprN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E55C3FEB1B
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042802; cv=none; b=BuVUHLjSIs5g05esnhpyBRuvRd4Glem0q7jSOIO8mFMLQCpiDruc/K1PD8vungHfA0futahFMl4lF2G8zpIWy04YoZCmobXq2uuNa+RaXLsxmtAiG8Fo8Oax+U7F79eHGit6WELv4SrjIl+zHcWlmDhx0MpP3YWhAadV08INqYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042802; c=relaxed/simple;
	bh=A/LjaThE4kliPnEOikB6ofrR5uG3pc3yOJx3QeAkHpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGvLaTruG7bh98si3z4Yq95nc7PjFUi9mYQGto0H+/DYItr648XaPM0j2G/283TnuUbzMrHMMPFI7n7X/orCMqeUwAODauCnEIG0FAZDCFMN1B4cvB9qpD56DeG04cFodrs8XH7n230qtvXDzbWB7gIQaEdi3dwx6GotU3vHI7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LroaltNi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ea7gLprN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6318Yipn1459604
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 11:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wRQDTkPOw0QqZKbK/WbPq1sg
	HEfIuzydEfvDEGqlxVE=; b=LroaltNiOWla6/N5KJ08WTt4TT4t7x/J3cEFbtaY
	c/Pcctin+dhI+1sEuTwIsp3qDPyJ8ZCbgwqv32G9T/6zucv2kZu80haF+Q1uhnfn
	g5F91/4X32sJ6juxuexMgs4IfJI5dmWMenL1bk+M4IiC2xsjZuFeuy1TbC/3W70w
	gzs4X3PHJEa4a6yVai0IYH9lKh3LTqLTiTIpmSMSbybTFMvCHoudUbHTavWCTXOu
	kGd83ALylAfC9G0+BMEPFA2lTj6pAQ40NfcQT/KlZaPDy6b+5h0WUc7SaUF+kJNv
	aFTDKEn6v//66po97iFkUxtvjlbacE9hauG2tikw2AwP0g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg1ttt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:26:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090e08dcfcso76237871cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775042800; x=1775647600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wRQDTkPOw0QqZKbK/WbPq1sgHEfIuzydEfvDEGqlxVE=;
        b=Ea7gLprN3Y+YFgD+kgjYNUC4vjdtwEmJxeVp2cfRaHZRHryBUm/qTN/rcWNxjXlJ2o
         NSuwsFsaWmgxKs7MRT+uGW+H4vx99vByEFebnX0Nxgg9ZZufkm2Vd3qk1abhYoBlVtiE
         fl+0o8hsmQBCy+S8y8b7Tr8DCSFyA8cyVx0ffCAqL4rIq2GexFZlEHNdlqdM8a9jwrk0
         w0YpAkYu5jzVAn24BqCwFWjOo9KmY3y1SHIOWNrcp/BAQG1QOOnfVrESqDa0nOKxwBYQ
         sc8ja4o87y/yM/j2b49LSd75ezjorjz/YPo1c37cMgUWkmmeGnPQfM+tjBTFQPQdOgUm
         PN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042800; x=1775647600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRQDTkPOw0QqZKbK/WbPq1sgHEfIuzydEfvDEGqlxVE=;
        b=gvQwS2/Weuz5ZduoSv87i0JnWmhyMAPOml4zwPt2d0ESlGepPIaESRFw1zrW9xuKLi
         MZC5+eoPoCWrbV3xZOqbd2z3jxgDC2sT8hu6MJhjciatBzPCGz16JBPQwTqLqnIO765u
         bgyWkj/PJMT1FdPNo0o64yXR+QJEM0JTGtaB61FMCPdHJ/O0E29yFDRO9t+FlbQEsPPI
         t24m4qmuaQPS4U+jCVhHkQR9hOsqSbxOqvvpKzNNas7BAcdQHrHxP4i+e4+xzTElGvlr
         CD9esp3rwdMe40AZ5Tqo8Bk10VeN7dIi8kTz2ih2eGngyyTgc2zlhcZNtZN05i9C1UKX
         qKUg==
X-Forwarded-Encrypted: i=1; AJvYcCXBflewgeCMY9GDTfbcb911qD8qnTvaKzyzVY0dAFm26jOgj0RsxA/yVdXHKoJ1/bR1RXFzi2RZlI0Hotac@vger.kernel.org
X-Gm-Message-State: AOJu0YxGxOgoztW6dGO7s2bsY/1HSS9AhV2tH7pUgoevajnOPicBYKag
	w1yBMIw7b2EuA0N05ka8c9+ybFnvV5jHxxdjqPusvDvO8lrKwVLQyMKxT/SKjaBw6XWdniCKy83
	RJtSSqgdMARtkp1mA7nPwrqDJ6QliDsH8kwAEAe2j4dS2eDgrma3tfobMolpUqYav66Ow
X-Gm-Gg: ATEYQzw2gasJ6cBzu395Fy3tSVsxtR6XXWZnee5cMFR6dAWQMwaZftVhd9Tbxokj/4C
	FRh8MIYyGCMw2Om/bX3xRBvHP+HfktFCnURymC7o/ekm+nr1uhiRIABFzFrFbLe9By7z9THdLI0
	hzk87dCCWY9KgxO2oPPlgx99wf8vtgeZA9OJp/S5lSr8t1fDb9zL33mjsBFYroJqNUGPFoS6Snq
	j3Ud8N526/Nb5SmlOZRjojwDELTt+Bpadi9WCYNmXSCxSS9YIT8BcbA9S1VTqPmVQSCysvnPQ5+
	z5dWAAyQp7pEDwGePENwBV4uwTzn3fLheF6EETHwt6zvnYdFsZLSnBbK4jMXUTe8LuCBFHdxKQ1
	M8NdLL07tXa6Q3gl5GFq5k6wbWAyrmkQfBsblqD/Lnv4mGmeL78V8MHBD710U18Cuw5tHRY6Onz
	ywWrML8zNXqMKzsXeKV6DxQ0l/KyjlSQmkWzw=
X-Received: by 2002:a05:622a:4c12:b0:509:5dd4:7192 with SMTP id d75a77b69052e-50d3bdef817mr41599901cf.54.1775042799814;
        Wed, 01 Apr 2026 04:26:39 -0700 (PDT)
X-Received: by 2002:a05:622a:4c12:b0:509:5dd4:7192 with SMTP id d75a77b69052e-50d3bdef817mr41599411cf.54.1775042799138;
        Wed, 01 Apr 2026 04:26:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d42e2sm28282001fa.5.2026.04.01.04.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:26:37 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:26:36 +0300
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
Subject: Re: [PATCH v3 15/38] drm/msm/dp: use stream_id to change offsets in
 dp_catalog
Message-ID: <wbnb77ookesmar5fitx6hnfej4pih4gpwfoigfqgnjsnnpzule@ybcvwqbp55b3>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-15-01faacfcdedd@oss.qualcomm.com>
 <vrbxqjfvg6urywwmehoykz463vphfg6c2qiryedulvlrcbvals@55lm4fmgf3in>
 <0037ba69-c104-488c-a388-8d31dcbbc78f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0037ba69-c104-488c-a388-8d31dcbbc78f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwNSBTYWx0ZWRfXzvhEk8hw5Z9Y
 pHyEixnVbwq2Lt3arD8nleFhXw/tvNCCKxmdU9zl/Y3JSZCOt9A9rwkkIaZCKvUn510d0vIqNyZ
 QJillYNydZzrNqq06bY4PYJuG89EnwDJ+ziPvJHssHbjxbl4Z9P5byv3spBBzmH9AYsc1m+qS2F
 Ga6dscCMk8Gc1fmWmgUjm9azgI4bZnpsKP/ZAIBoWzwbUFonC3CKp+GdjPexvJzyg+SaQ7350DB
 uNo5KwAtgWEslJPte29Pr74fz0qi2P+X+d5uhheR2Gcvkh7+iHybURQ4qby865fV4yeJrYo+vpc
 mR9rR0QPIBsC1HYd9Lboc29zyjaQXqDqtzH0YQgnejdaebLWCjyV6zOdYEXN7rfYNrcrw+6W+ai
 lOi7ove5AwgesH8pnIrADRop4G1F+qmBh2I+xf+3ZKpSMZFJouZ3eLYOeBKj4oz27SOD03mCWSK
 OZlJYZ6nbOisO5Uhhig==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69cd00f0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=QyJMuQZcD86jedyQ44sA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uMmBIjYN0D8xiwOI8yLaX2q8N4ovuFHr
X-Proofpoint-ORIG-GUID: uMmBIjYN0D8xiwOI8yLaX2q8N4ovuFHr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010105
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101326-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 74C3D3798AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 02:33:49PM +0800, Yongxing Mou wrote:
> 
> 
> On 8/26/2025 2:01 AM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:16:01PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Use the dp_panel's stream_id to adjust the offsets for stream 1
> > > which will be used for MST in the dp_catalog. Stream 1 share the
> > > same link clk with stream 0 with different reg offset. Also add
> > 
> > Shares what? How do we handle streams 2 and 3?
> > 
> Stream 0 and stream 1 are controlled by *_DPTX0_LCLK, stream 2 uses
> *_MST_2_LCLK, and stream 3 uses *_MST_3_LCLK. Will update commit message.

So, we might need some better interface for updating those regs.

> > > additional register defines for stream 1.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c  | 24 ++++++++++---
> > >   drivers/gpu/drm/msm/dp/dp_panel.c | 72 +++++++++++++++++++++++++++------------
> > >   drivers/gpu/drm/msm/dp/dp_reg.h   |  9 +++++
> > >   3 files changed, 79 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> > > index b851efc132ea03884ce2563990fbc24c9577e724..43a9ce0539906e1f185abf250fdf161e462d9645 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> > > @@ -141,6 +141,7 @@
> > >   #define DP_STATE_CTRL_PUSH_IDLE			(0x00000100)
> > >   #define REG_DP_CONFIGURATION_CTRL		(0x00000008)
> > > +#define REG_DP1_CONFIGURATION_CTRL		(0x00000400)

I think the file is (mostly) logically sorted. Please don't insert new
entries in the middle of it, breaking the sort order.

> > >   #define DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK	(0x00000001)
> > >   #define DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN (0x00000002)
> > >   #define DP_CONFIGURATION_CTRL_P_INTERLACED	(0x00000004)
> > > @@ -159,11 +160,15 @@
> > >   #define REG_DP_SOFTWARE_MVID			(0x00000010)
> > >   #define REG_DP_SOFTWARE_NVID			(0x00000018)
> > >   #define REG_DP_TOTAL_HOR_VER			(0x0000001C)
> > > +#define REG_DP1_SOFTWARE_MVID			(0x00000414)
> > > +#define REG_DP1_SOFTWARE_NVID			(0x00000418)
> > > +#define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
> > >   #define REG_DP_START_HOR_VER_FROM_SYNC		(0x00000020)
> > >   #define REG_DP_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000024)
> > >   #define REG_DP_ACTIVE_HOR_VER			(0x00000028)
> > >   #define REG_DP_MISC1_MISC0			(0x0000002C)
> > > +#define REG_DP1_MISC1_MISC0			(0x0000042C)
> > >   #define DP_MISC0_SYNCHRONOUS_CLK		(0x00000001)
> > >   #define DP_MISC0_COLORIMETRY_CFG_SHIFT		(0x00000001)
> > >   #define DP_MISC0_TEST_BITS_DEPTH_SHIFT		(0x00000005)
> > > @@ -230,8 +235,10 @@
> > >   #define MMSS_DP_AUDIO_CTRL_RESET		(0x00000214)
> > >   #define MMSS_DP_SDP_CFG				(0x00000228)
> > > +#define MMSS_DP1_SDP_CFG			(0x000004E0)
> > >   #define GEN0_SDP_EN				(0x00020000)
> > >   #define MMSS_DP_SDP_CFG2			(0x0000022C)
> > > +#define MMSS_DP1_SDP_CFG2			(0x000004E4)
> > >   #define MMSS_DP_AUDIO_TIMESTAMP_0		(0x00000230)
> > >   #define MMSS_DP_AUDIO_TIMESTAMP_1		(0x00000234)
> > >   #define GENERIC0_SDPSIZE_VALID			(0x00010000)
> > > @@ -240,6 +247,7 @@
> > >   #define MMSS_DP_AUDIO_STREAM_1			(0x00000244)
> > >   #define MMSS_DP_SDP_CFG3			(0x0000024c)
> > > +#define MMSS_DP1_SDP_CFG3			(0x000004E8)
> > >   #define UPDATE_SDP				(0x00000001)
> > >   #define MMSS_DP_EXTENSION_0			(0x00000250)
> > > @@ -288,6 +296,7 @@
> > >   #define MMSS_DP_GENERIC1_7			(0x00000344)
> > >   #define MMSS_DP_GENERIC1_8			(0x00000348)
> > >   #define MMSS_DP_GENERIC1_9			(0x0000034C)
> > > +#define MMSS_DP1_GENERIC0_0			(0x00000490)
> > >   #define MMSS_DP_VSCEXT_0			(0x000002D0)
> > >   #define MMSS_DP_VSCEXT_1			(0x000002D4)
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

