Return-Path: <linux-arm-msm+bounces-106676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F8zOCDS/Wl2jgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:08:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9344F61B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BC36300FCC6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 12:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D7A3DBD64;
	Fri,  8 May 2026 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asrMxzoZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zf3eDzd/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094D43D0918
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 12:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778242075; cv=none; b=P96ANbXH1uWLiTTh+Sc2uUbE6//KNi2Xtvok96q/VAnoTrnrZ4nnBNzJlm3bkB7lSZP9/b/mBHDVps1a4FJ3bWZV2ktlDtFxcjwPee2ahcZObHNd70IuzwHuEXmKhAMVkUyN3iKbTVSsD6LLVcPfEUPNsULi/2aRbR/ElKT6ztA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778242075; c=relaxed/simple;
	bh=OYmCw7JrwPgo0g0/bb0dm0YfLua+pWWRBrWTOO7aD/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDFLT5EpOf6xNGWm2rSJV6WC+o61ExQ37eJbElzSXCjE98uNpommsvknp6FidwEuqVCwFTWZuZiEjn4RgaKaG7SVPB8bu/zwAxQdiWuOoKWRR3Rw15Rmm4BCmHxp3T/YWbfHgJrs9UlKyp874falAZ0xYAF2XVoQ4MGMk3trve8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asrMxzoZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zf3eDzd/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6487vhUK2384116
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 12:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eVsTALs8yQuwUz11IVk8+Pby7wTwW8t8CLZPh0Fg3XE=; b=asrMxzoZ2nc8CVtb
	QfEsgxHkuEO4CssLLzL4PSG8xDjTMlc2yv9YiKlILTVYmhYe60VJ0n1AA4dABNPr
	DOxtm7mfjSQdrtePvy1RZqETCdeLaBXz8BAnmvIlos4UzryJGlpDCxJDBwVQFphe
	UWLeZm4R+8gNCFfrkfXxNyNNXQtBxz9yFS+ES1zRJu7cGFIkjArrMvb+766wAPs+
	TOCOT1vzGF8LRB2i6zB6ARFLKjqayaKjX5JoYuRpZoBNisdQGJ9iCO7vufvcrUW3
	tVnSqoXt9rpfcRfM45kGlMbv/OW+9pgm/2etfAj23oxPTgpzqvR1zfkH2ckPCUin
	kd2tzg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwum08c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 12:07:52 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63142e4ba6cso98882137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 05:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778242072; x=1778846872; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eVsTALs8yQuwUz11IVk8+Pby7wTwW8t8CLZPh0Fg3XE=;
        b=Zf3eDzd/Co5m/thrFFPIB1Fs4ErHq1eSg1lTCJav4SJTwtP2uCykXm+35QXyOEFrHo
         zeAF2ZOs2v3HDEezPWhwwCijm5Q9Whm+vdSdNT5NfbezdeM50Dbx27ljl7EOps6Om6Og
         y8cS4lx1yQyTbQxrIpovhnbNbGeiw5FYm1XRyf4cw/AbCE/zbcRy5aajWWMxsN82SReb
         o6VM5+9WeF/sZG8+3RZBd8yEE0+HCNw3I3pjqqxbBAcR2HJFIAF8uYmRU9Nsek0djj0Z
         /kdXYzMkIlzu/awS6+q/iNk/Mc3rAW953e7eYUv/fFkOxqX8DpT5/98pHn8GbeT9T0PY
         jehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778242072; x=1778846872;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eVsTALs8yQuwUz11IVk8+Pby7wTwW8t8CLZPh0Fg3XE=;
        b=ch6JUkGh+AvdWRXpNKBosIAjbk/u6hXeOt7UGZIHdCU3A/IqyUfmRPFQPegWHF7XYa
         qIgJPfhIK+lzXyG84Fd/RH1WlFWl+1SA4SxXDmaBHkxMDNTKLhTr+HyKKyTX52ZfDA3l
         EuQcEXiUxyGQu1MphSQ1YKnAgeGIj9F0sWw5AzgJW288Kku2sHdWeexfmdLyTXPCxxms
         vsHpYBbLWefpFLotHyD/YXrPVEMZCHfxqh7WFPxZS3YDFZG4JBbUsFGPwaM+LvuZSs4+
         7jwJTSXl7ezLhNoQQWTXgwdYAwaJs60PC/hDlHBmCpEHrdAd9KQxfT9IhWiX8+ghGdGv
         diYg==
X-Forwarded-Encrypted: i=1; AFNElJ+5bN1Y0LGWsHGgjD2Y9/r3vVH08ipiezel7Wp6jwwCYrFdDPZgJETtVivw/8EVxwMFK3tLtLdkUpRUEtOG@vger.kernel.org
X-Gm-Message-State: AOJu0YzlwWUp+lb+3/YyvvEsKncYbA1XjpR6w87AuF+2cpyQqrpFLAGB
	s00auq3TMcAuynV6/qFKfWH8hE/MeolQR8XwPwgd5cBvGrEp37IcjLG4tfHWQH1+oKOImUG5EVX
	YemhGh2WoY1nktYGQaXH5eD8IbXwoguVxTFc/eCmQrZ9EA8wUbiiIDC9GKH1auvH96HQK
X-Gm-Gg: Acq92OETlDVehmTHGrKHV/y0YmmiFPSD1OzEjnCGwCcbSrqnolb9RJUasMoBrHDAGvK
	6APpxrLvitThrqTlB6TCF+PDOiRakJUd12AytzvgRu0KUqaUvLAI52MzntS6/pIEG3kSKqSl0ON
	unIVzuHSMnt3eprW8//llq+aBH5+NgLB4wvWnLjyWOZIU7g2v/NTFbV1hKnSj/UGfOMpcxgIBZ9
	xVbyXmKEmaozD8oe1eTNnsEysHu6xtvg+AR0XJ5cOz8ZnIRC8XH4L2EBaJ6TrXaVahz5Ux3cpyT
	BB8O2cjGu1ELhSG2R36RK3bLzsjDRTwqYbcBtZdYBntBsBj2FSTf9cHdjUoA/Fl8WW5cWKTVedv
	sBKWlWIzuDXeYuqNvc19peEOZwwtYYRXnaj3viSTw6Gms4o1/r+mIcjKiOxoB6aTIUVQW3OrJP3
	unbmesxdaAU92WWqqjKPTSL5kdao+6nhUOFdM=
X-Received: by 2002:a05:6102:5045:b0:5ff:efdc:e225 with SMTP id ada2fe7eead31-630f8e751ccmr6928162137.3.1778242072242;
        Fri, 08 May 2026 05:07:52 -0700 (PDT)
X-Received: by 2002:a05:6102:5045:b0:5ff:efdc:e225 with SMTP id ada2fe7eead31-630f8e751ccmr6928116137.3.1778242071782;
        Fri, 08 May 2026 05:07:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f9ffa0a0sm3001251fa.21.2026.05.08.05.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:07:50 -0700 (PDT)
Date: Fri, 8 May 2026 15:07:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: John Harrison <John.Harrison@igalia.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 1/8] drm/msm/dpu: don't mix devm and drmm functions
Message-ID: <hzesog5n7iv7rsgk246uzjmqjvkxwv4nqx3uc3ybx4fgia7smq@fue5c3cjobi3>
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
 <20260505-wb-drop-encoder-v5-1-42567b7c7af2@oss.qualcomm.com>
 <CACSVV00TsXn=yx2UeGpxvCWRkSdj0=_=3_s01wCaO1RDH8t_vA@mail.gmail.com>
 <f6d9e805-328d-4d9c-8a40-32b47fcedd51@Igalia.com>
 <CACSVV00zgV02t0CGaDUJyTGBceBk7MFaOQ7Uc6ynpRkxdBwZhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00zgV02t0CGaDUJyTGBceBk7MFaOQ7Uc6ynpRkxdBwZhA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: nduoSw2S92dYKHfSvMpageRqShNP7mzN
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fdd218 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=V2sgnzSHAAAA:8 a=EUspDBNiAAAA:8 a=ZsvpycJ9WFwsJDxaJ5IA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyNiBTYWx0ZWRfX7fnBZ9uVcTgv
 wNsgYs3URO5bOQuPYJJk6UaUOQ2TgnaVDCKxm8pe18rTcUeDoV8y4qpVBgjuMpFq9WXnwOaUH3N
 4jVANutXuNFbRqDGQtpCV2bcHkz7fzZ+p+IeMPesZvq3jH4PoNbneSfYaLfi+Kp8V9ftLjojoGt
 aw81v5qKP2486AdYlAEw6aSVWksKaPuYXZB2TpkCH2xQcNYHLJGcEWedN5aYGiy+mH6gpVppy34
 clk7Ijd7g4DskE9VLp/IJ0Xpv02T5YzNUXX+fL3POYidJporIUETbNhGT6dRD7jTMUHsVXyCgmB
 5PtGjdvrPT8ZR6TjfKj+FfqRDcWirj8l8SzJwDYExqAMAu7J023qsgBCiCrSKD2sO6NXO+EZXJd
 YTHzwjGsMMYiBRk2m5Lrh9xEnAY8wKfMYZ6342cJCbBmelpyMyeb9X9iVbb15VzdeiSxM43q9T7
 NCscQlqwGJi8ewSAfww==
X-Proofpoint-GUID: nduoSw2S92dYKHfSvMpageRqShNP7mzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080126
X-Rspamd-Queue-Id: DF9344F61B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106676-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[igalia.com,linux.intel.com,intel.com,amd.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 09:30:44AM -0700, Rob Clark wrote:
> On Thu, May 7, 2026 at 9:29 AM John Harrison <John.Harrison@igalia.com> wrote:
> >
> > Resending because apparently it got sent as HTML and was rejected by the
> > mailing lists...
> >
> > On 5/5/26 14:49, Rob Clark wrote:
> > > On Mon, May 4, 2026 at 5:25 PM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >> Mixing devm and drmm functions will result in a use-after-free on msm
> > >> driver teardown if userspace keeps a reference on the drm device:
> > >> The WB connector data will be destroyed because of the use of
> > >> devm_kzalloc()), while the usersoace still can try interacting with the
> > >> WB connector (which uses drmm_ functions).
> > >>
> > >> Change dpu_writeback_init() to use drmm_.
> > >  From [1] it doesn't sound like userspace holding the drm device open
> > > is the issue (if that were possible, it seems like it would go badly),
> > > but rather the order of managed cleanup?
> > >
> > > [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/xe/xe_hwmon.c?id=3a13c2de442d6bfaef9c102cd1092e6cae22b753
> > So is this not an actual issue that has been seen in the wild? It is
> > just a theoretical issue based on code observation?
> >
> > If so, then maybe the comment should just be something like:
> >
> >     dpu_writeback_init() was mixing devm and drmm functions - allocating
> >     using devm and then passing to drmm to manage. This creates the
> >     potential for a use-after-free bug as drmm and devm have different
> >     lifetimes. Fix that by consistently using drmm management.
> >
> 
> I've not seen this issue myself, but I guess Dmitry has.  That comment
> sounds more in-line with what I _think_ is happening..

No, I also haven't seen it. It's a teoretical issue from my PoV.


-- 
With best wishes
Dmitry

