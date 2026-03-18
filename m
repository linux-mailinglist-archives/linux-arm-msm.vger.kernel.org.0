Return-Path: <linux-arm-msm+bounces-98543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJEECFzeumk3cwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 18:18:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E65652C017E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 18:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1771230219FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 17:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E002F83CB;
	Wed, 18 Mar 2026 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E3pLZICd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AETLI0S6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904FE2FF144
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 17:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773854265; cv=none; b=SvLryuRBkIBmM6NAiSwtnC1Yegd3FV9OfJDkc7Cp53F09ewyF9T94nCH50iG/zF/KITwXiLpoyWKfyxPqyKtR49ixx+81WdfZH8N3q/pEX2kzXWcbMKAhMZfBOxD1WuRK5IheN3h43XKy3cujF+dq4yy4zLidOT5QKMM1LGx3ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773854265; c=relaxed/simple;
	bh=SwbOaqRxn0YUzkbJlTfK2L07SYJlosET49dg3aunK70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHR5U0DMC9uR48Re2s8yqot4WmbiiMGE8zlGBD2Z0NLJXnF/ZhT8e+SYrVUZXYr8vdHsXTvLuZajkQ3P3GuVKxZ7WndhiAqfoYRBBCkD5y6oRk6jHMvs8FkE0PaZh9LrrffLXAeXsgYdxukeaALgoqdst9CL1TpkN0N9Bf/2LbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E3pLZICd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AETLI0S6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFgtEw914345
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 17:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VkAI+SqRR5EwHc2K4Pa/6PdC
	emEOi0RfCNii4UmGZ90=; b=E3pLZICdUK1fxxET9kYCRr7Ba9xurU7Jt2riDZzV
	eP0TNfAYdKX4Xb+PYzpbqgk146E4iKhdANe0Wa9QI3RWqGRki3brK0TCrtQkaC7t
	EIvW0eqImLyoQ4L3f0hr/uvRxJUtnnEdxIvIxOSp7HAgnbyB2pr38dc1E6OTuhu9
	whtCc2LLFPnLmU8I0zWxaMWRxSIWNCIcaXMnaoYlMMwDoN3ME0RnxeZc2b56Ndbi
	CyE0bsaOr9WCjKP2uXTxT57W092OUZ0xXG3eIUohUy3ubNq79aqga4ooQ6RAS+GF
	drVOpm3R+LXBsxbh8QEDY6abN11J8ly4Tntl6M75LmDH0g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxysb5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 17:17:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091ee9f1d8so2213481cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773854261; x=1774459061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VkAI+SqRR5EwHc2K4Pa/6PdCemEOi0RfCNii4UmGZ90=;
        b=AETLI0S6BD5xd8s/u5drBCSA+DpmOoS96GqjUFpoE59k5UX3VVYGsDCCqlIohGcT3v
         an7yDPhWS+Y+soni18yZ+H6hBeXTorWOaHyZa6ID17LZ7EIi4UwVpA666Q9Y9eZBFuML
         YApgXsT5R/Mwy+5fMio5vAVPPRbMvMo2fWbcW4V3YR6GiBTy47Ces8WO2WW4oXSa960H
         STb3cL/Qp6ZaCPTKUeKj5Uhwj5DmCYyeIzLsQzBOOecxX1UszndMdHhMJCDH166XzKnT
         mAKcAFjl3wOGJ2+NQfgKzrCvfdRQ587zNXMsdYe0bUVyss+EmwmrNMXNCLY3mpX0C/6e
         uCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773854261; x=1774459061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkAI+SqRR5EwHc2K4Pa/6PdCemEOi0RfCNii4UmGZ90=;
        b=RDUKdcT0BGvLhpDmjkF1t2MwhMaqW7uFzEAhATQaQpIvILU3AV78mn8N6U2kTqEEp1
         i19eM47R76vfFY+FghlorYg/sHClyU4aR3tomhrMkTSHwnNre5OiYjgDEfVkyMBk+UA/
         nSZ+UWU5+0tXzt3batpETCvKXdiiQ9dUh7FFbX7mKmq8kQFaCf8yflr/cSqx3QUkX1IA
         oYHlBhwT0vEbFRQ+v5nEbh8951ZaW+I3Du1UgekNqB+AkB4p6/GNVZK+RqeEJk6UUV7A
         n+Wat0HzT9W7hyEp+0P+Fgj/cd8Cz4do8e4Rb0yILOAkN/u5Xq18Id+7cVgHUJnid3vm
         y/Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWhNupNyA6m5ELVoxKbOMIDygzVLOXJ3fFJLklHjadEXk3lmrX2dAL4U5iwBre9fxCJ+gFBFP62jpewgxa5@vger.kernel.org
X-Gm-Message-State: AOJu0YyYOjA7y9A1hVxooCzsAPdBDxSxNgNRw4Qlc7bF+XtVfIlAMnm9
	LhfvMqS9U9UpBOG8mUQIKiBsyCk3xKCldkPj8hq8Z7NWkR0g01RGTib4rsAQwLxns3g/AdMslj6
	cfuUo/ZaUiAy2evwIDeGLniRf5WupWEzKaXi0yAJvu9cTmjftglQqQqWrC7OF3wV2A0/V
X-Gm-Gg: ATEYQzyijPNTi3xb4EExw2xPfdJAOW4YfLDmJBvcB5tvo3t/ttpTabnkVfnmXSHIMYb
	mnPs1shXQ4HOsuM9L7tSJcELL6g6KuGphM5MJcHrf/Q8P+CxrMsuv1eYSVCl55D2qAbzZnDaQSl
	dsYVGBwrT2ZTXtb3X8dJPwskPzAWD7tSxv1mK+F+LWf1u5C9I1qjNXFP8XB84YXLNNrXwyuOMmJ
	Mg1COGdWszKfqEIrWCP5P+JKP+ppS/vcdhs1VXD8CIo4l3fdr6sEEPOZVeVeio6GQ8EUPoV7eD7
	93qIe/XfaU7clOGCYqot1DeMrCVPGPY1nlUjGKkiE8rv+uHGAynSSojpfXC2HojbevmWjY+Fqs+
	USRHNKuIsDWkNOBIb9LHhQjA1rEi4J8igIUG6FojjHOwlE/7aTaPFZ+Mn7dMedyxrCk1PY+HnnP
	6jIFOjJno+dRf68IJi1Ot3ktyiWIDtUze0t94=
X-Received: by 2002:a05:622a:44:b0:4f4:bce1:31b6 with SMTP id d75a77b69052e-50b247043c6mr5164571cf.19.1773854259954;
        Wed, 18 Mar 2026 10:17:39 -0700 (PDT)
X-Received: by 2002:a05:622a:44:b0:4f4:bce1:31b6 with SMTP id d75a77b69052e-50b247043c6mr5163871cf.19.1773854259047;
        Wed, 18 Mar 2026 10:17:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd54d538bsm7852561fa.35.2026.03.18.10.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:17:37 -0700 (PDT)
Date: Wed, 18 Mar 2026 19:17:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
Subject: Re: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
Message-ID: <2zgpsqzcktlxu4yrvx235zh2llsdyh4mkreaziv66tkcq24uj2@3hkq4nskyscp>
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
 <DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com>
 <tbi5mwg4jt5scvr76lpzpvi5zj3kn3entoorsd4dior4g23czd@xtobadslhfrz>
 <DH437ESQRIAF.2336WF7XZBTI@fairphone.com>
 <7tcmh65lhy7t452mwkiv37pxqwh6dbuh6voelaag6kph7tfr65@cskiwvoafbdy>
 <DH5RYL9A77TQ.QE2CS4OFZ1LT@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DH5RYL9A77TQ.QE2CS4OFZ1LT@fairphone.com>
X-Proofpoint-GUID: wZ4uFjagarhdFul7bzYEzfp2Jhq2TCDV
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bade35 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=xNf9USuDAAAA:8
 a=EUspDBNiAAAA:8 a=BcIQnNHhHFwDr4imAaIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE0NyBTYWx0ZWRfX/c8dYNuTu1yB
 cvxxmNEbubEOiFntV4Jv97HO0BRIpAs/cKFjGpZUQT6Z5TggWCumsry3k/xmjXCkg8Qlb+btyyA
 RzgwnOxX6P8yMR8PaYCvOs8RZ12xH+gdXxMKOzM1uHH8iXfYV6zeaycVtrQl3vQyLCuijaFTWl6
 nMEqh14ipZJUUUxaHTVm0SIurEWcL2ws79iG9KCwME1IInHV9Y5j3McFil0b+bvpV9YOnTDiBa0
 7s6PChwnNTsk5VjI1cxALVgYLhIC7uhlAjajyF+1t4y0Ps33OM8V+9flod+v4dXP8oei8BymXEJ
 6kvPTSPWpyA367OsE0eGGijuWYnb9Uup/zVHcbjJVnH/SJSCTzUgD5WzyTnXP++oUab/QSTn95X
 6T/iFoP7Ud0ae0LlphVOf9CpoenOSx5eJSndK8t+RaE30dEIYQJCUbNUL+kfy5NmbRlTGt0pEfg
 4CFm/kgR3jMQ3pQzmDg==
X-Proofpoint-ORIG-GUID: wZ4uFjagarhdFul7bzYEzfp2Jhq2TCDV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180147
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98543-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E65652C017E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 09:45:23AM +0100, Luca Weiss wrote:
> On Tue Mar 17, 2026 at 6:45 PM CET, Dmitry Baryshkov wrote:
> > On Mon, Mar 16, 2026 at 10:08:47AM +0100, Luca Weiss wrote:
> >> Hi Dmitry,
> >> 
> >> On Fri Mar 13, 2026 at 6:14 PM CET, Dmitry Baryshkov wrote:
> >> > On Fri, Mar 13, 2026 at 09:33:18AM +0100, Luca Weiss wrote:
> >> >> Hi Mahadevan,
> >> >> 
> >> >> On Thu Jan 1, 2026 at 6:04 AM CET, Mahadevan P wrote:
> >> >> > On SC7280 targets, display modes with a width greater than the
> >> >> > max_mixer_width (2400) are rejected during mode validation when
> >> >> > merge3d is disabled. This limitation exists because, without a
> >> >> > 3D merge block, two layer mixers cannot be combined(non-DSC interface),
> >> >> > preventing large layers from being split across mixers. As a result,
> >> >> > higher resolution modes cannot be supported.
> >> >> >
> >> >> > Enable merge3d support on SC7280 to allow combining streams from
> >> >> > two layer mixers into a single non-DSC interface. This capability
> >> >> > removes the width restriction and enables buffer sizes beyond the
> >> >> > 2400-pixel limit.
> >> >> >
> >> >> > Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> >> >> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> >> >> 
> >> >> This patch is causing display regression on QCM6490 fairphone-fp5.
> >> >> 
> >> >> With this patch in 7.0-rc3 (or 6.18.16) there's just pink noise on the
> >> >> screen. When reverting this patch everything becomes working again.
> >> >> 
> >> >> See also https://salsa.debian.org/Mobian-team/devices/kernels/qcom-linux/-/issues/41
> >> >> 
> >> >> @Dmitry: Can we revert this for later 7.0-rc, in case it's not fixed
> >> >> quickly?
> >> >
> >> > Could you please provide the resource allocation parts of
> >> > debugfs/dri/0/state for both working and non-working cases?
> >> 
> >> Working (patch reverted)
> >> 
> >> resource mapping:
> >>         pingpong=# # 68 # - - - - - - - - - 
> >>         mixer=# - 68 # - - - - 
> >>         ctl=68 # # # - - - - 
> >>         dspp=# - - - - - - - 
> >>         dsc=68 - - - - - - - 
> >>         cdm=# 
> >>         sspp=# - - - - - - - # # # - - - - - 
> >>         cwb=- - - - 
> >> 
> >> 
> >> Broken (with the patch)
> >> 
> >> resource mapping:
> >>         pingpong=# # 68 68 - - - - - - - - - 
> >>         mixer=# - 68 68 - - - - 
> >>         ctl=68 # # # - - - - 
> >>         dspp=# - - - - - - - 
> >>         dsc=68 - - - - - - - 
> >>         cdm=# 
> >>         sspp=# - - - - - - - # # # - - - - - 
> >>         cwb=- - - - 
> >
> > As we have identified that the issue is what downstream calls
> > DUALPIPE_3DMERGE_DSC topology, could you please also check several
> > things (with the broken kernel):
> >
> > - What is being returned by dpu_encoder_helper_get_3d_blend_mode() (in
> >   the broken config)?
> >
> > - If there is any difference in working and broken configs between
> >   values being passed to (and programmed to the DSC) in
> >   dpu_encoder_prep_dsc() ?
> >
> > - The same question for pclk calculation in dsi_host.c
> 
> Is this helpful?
> 
> Broken:
> [    1.247165] dsi_calc_pclk:649 DBG pclk=111546490, bclk=83659867
> [    1.490559] dpu_encoder_helper_get_3d_blend_mode:309 DBG BLEND_3D_H_ROW_INT
> [    1.491008] dpu_encoder_prep_dsc:2061 DBG dsc_common_mode=0 initial_lines=1
> 
> Working:
> [    0.998043] dsi_calc_pclk:649 DBG pclk=111546490, bclk=83659867
> [    1.233836] dpu_encoder_helper_get_3d_blend_mode:313 DBG BLEND_3D_NONE
> [    1.234277] dpu_encoder_prep_dsc:2061 DBG dsc_common_mode=0 initial_lines=1
> 
> Or do you need some more things? There's a lot of data being passed into
> dpu_encoder_dsc_pipe_cfg() for example so I'm not sure which values are
> relevant for this.

It looks sane up. I will try asking internally. But for now the posted
patch should be good to go.

-- 
With best wishes
Dmitry

