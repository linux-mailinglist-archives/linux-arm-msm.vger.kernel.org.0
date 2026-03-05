Return-Path: <linux-arm-msm+bounces-95483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGnFJ+HRqGmnxgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:44:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 035092098BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 884E93046519
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 00:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1041E2858;
	Thu,  5 Mar 2026 00:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o61VpSjt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ClBgEiLn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA6D3D994
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 00:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772671454; cv=none; b=WXg54Pa4FZ+WQalGtAHgNR4etuOmQFOe3CTMNqvKEwMd09wFX2K0tD/bqbW8bwV8U1f7S+6E1jrtHstKh90ChFuxXrMngrIZs4gY3iBAEe1PNgafLVVuGUa5FbrNy2aZe41F1CPWfxO2C0fmnqZO83tJ8UHocPk7QvQpL4TPTPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772671454; c=relaxed/simple;
	bh=Yu0xEq/UFOwQ6ySwBsUZ/2ma2Vs5DXnHvRxUgF1Sjj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTOoIlCgy0tFh5vVngh7BJgmKVcgI3tkKqrWQtpjjSd0J2vQk608B6Y1UG5TntMKJzMJb5GNobV60QVtX7ipiHx2o19QRBo4GDb/QciHKxPbMkud7wfUcj0IhNYV+W8UsTxWmYnXc+M9cWVQiaOtZgLMtjKrYhQcG9isgDQiqUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o61VpSjt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ClBgEiLn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624G2GG0035959
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 00:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1qjb7z5s0N2q3yCobyGnPBx0md1zq9nKGhUYC8xCUWs=; b=o61VpSjt8lo6QSVf
	K2IhZXUY/IcTJOF9KR63Qqskas7imsruU0cyfGX9sES3ZeBCJfrMrFNkNmIpX7sZ
	JbIR6s0hfSp7dsoPsV3BEEdrmpeuekFnsJbBsBBvpdxJifE9h7NwhR2pt9KpjFgm
	j9idRo1ntVCENhMkT+S5iiPfnDD7qdMY/OO7Vx/+9LeXVWkpBtmcciycqy6YbQZS
	X+H6QRvSh7l2/XUTaZe940ht5Y8LXP+uaikQDjksQHAqJBLQAWUWqOI38JjTafTN
	WngOyrsd8fIY6U8qj4lQsYKzb/c4TQ8KTjutNiVvKs+ZkVaSCEF3TqBWZwwjqenu
	tAgYlg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpqwg9cr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:44:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3d11b913so4470605785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 16:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772671452; x=1773276252; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1qjb7z5s0N2q3yCobyGnPBx0md1zq9nKGhUYC8xCUWs=;
        b=ClBgEiLn5OMsxh0m/UUiVRufeZ2xl4SE0fILdUBH1D/JpkqphcDyaSXXXMeFirwbO1
         sRutPoEoPtsVVcYeuijcmFpey3g0lwLWQGECxLT/gReHntYELYGirf/RrOKs2Ojdc3yY
         S0qiMk1L0Xqpa8iVt6D4U6xVIk5L2eamN1cQIJ6bzU1ycuCf1wsINOg1798oNIKHFLSb
         h87a5g+M54ggR2S8LlWm7DmvHwAUA4wTZKsMUD1QShrRtt0wIpLGk359IWu862El6LUM
         1NOGO8q/Jqo6NbKm+D6blMBygi/1HfpPyPXE95ieeJEkqBGo4W7oVkiE5Xe2cPKuvXFu
         bm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772671452; x=1773276252;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1qjb7z5s0N2q3yCobyGnPBx0md1zq9nKGhUYC8xCUWs=;
        b=OLm4QG18NhX+BO56cZ2vf5fjhPyAwzOGiR9oSes+LFh315DQGMf03jda2lsh6Q9S1/
         eihirW/bFlzJf92JaJasnCsLstEj+YtQN361yjKh4QNQzoYWq/q/T2NEP3wTLyhkN87O
         Hi9bev9b/BZJcjjvc+AFzrLXVdTJVMY1RmA/WbFi1cv18rfaF4aMdXUtFOGYaprRWqIQ
         N1xw5wPzaprRo8sEf7OonWLCY0JI9vZ9whdjBoaLtSODWjQOzGM6Qmtp4krVbQKXXfZj
         jRGIJCnI0ns6cICVrTkUSWZ8iXDFsJ/2qCGpAiZFF1DhkLi3Y3tblerdQ5G9enVEGTj4
         AC9A==
X-Forwarded-Encrypted: i=1; AJvYcCX46D8y1iEEDgFW6CseAQq9H3OEfwov4UtR03U1y5TdYqAdA6bxrmjpI0zhKtI5JwMi8Oej3UW1wqYEW7RX@vger.kernel.org
X-Gm-Message-State: AOJu0YyXRaZlYiV8wb+FJAZZjalKlm/1JLPXi/pRt3ZZ8o0W0ToAmyVG
	Gka+gqTfgNZYsD9W6O/56HJTY+D8BgHiIXgI5OdxkmWjQFrJ4XKXO3pjZMQXfogOqglPG7D8CpT
	UcqHCI7lLpOW2PpRt2TY4H6Pjxy6NAGxE9KkqXGJ8guvwh/hdKOCg+CKYBpsVIPiwfx5a
X-Gm-Gg: ATEYQzzMBC6yj/8wMhHN1oBvGSkeVNkIqmfnkwYx8UvHbzwZqbHPLh/At+ZB38TTZ3Y
	4kRofy0hvP0dYiP4jTwJGeNFOSPidfLTAScbxUg7xtIn0NfT995ZAS6oWyxYy27pUsauE6tOtsy
	XByEZw1vAgwoWfsvKrxn0tUkwFbge6GVXhO17fXgxDKCj2hgZnlWRAVOI3CkTYQHAmsuf57blsP
	P3QZvwv2cGANynSXcTX+yeVTnh01vWaXRWXaSwPOfC0kmLfYHjCgoO0ofScs9wv2Xukx/VH65HH
	GlytiqS7KVTLQ260mO1WCvLTIGnPSGmB/bLE+uh4/ExoC+ZVJYDPdtItks1RnHhEss+MT59+k01
	bS0GGsRVMS9rjjAJGcAKW1+MHyQihlCHkx0z1ktjRvb41uqwfvIG1pHZELOeSeocU8d4H7VW9H4
	xSSid0UMF3n4kVmad8JGWpHuJcTvLUA1X6zbY=
X-Received: by 2002:a05:620a:4496:b0:8ca:4288:b170 with SMTP id af79cd13be357-8cd5aee9e27mr556938085a.3.1772671451807;
        Wed, 04 Mar 2026 16:44:11 -0800 (PST)
X-Received: by 2002:a05:620a:4496:b0:8ca:4288:b170 with SMTP id af79cd13be357-8cd5aee9e27mr556934985a.3.1772671451351;
        Wed, 04 Mar 2026 16:44:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a129a21432sm952961e87.82.2026.03.04.16.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:44:10 -0800 (PST)
Date: Thu, 5 Mar 2026 02:44:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: restore GEM-related IOCTLs for KMS devices
Message-ID: <puvl5tg6ovr45oncwcvx5phrkdp6uv6mrtqss2i6x6wsmeixaq@me3hztknlscc>
References: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com>
 <CACSVV00Z0gDW8aGOvO_YaB6AZ7cOR01mTsCHZvxp0qeO85Mqdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV00Z0gDW8aGOvO_YaB6AZ7cOR01mTsCHZvxp0qeO85Mqdg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=bdlmkePB c=1 sm=1 tr=0 ts=69a8d1dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=uh5CrAVrB7YgaaNdy8UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: vdjFSZF_lnS45lqPveTi6C9Qo4nxfF3R
X-Proofpoint-ORIG-GUID: vdjFSZF_lnS45lqPveTi6C9Qo4nxfF3R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAwMyBTYWx0ZWRfX3w63qsGi0MAs
 K7ImghkCNYryhOC5DkSLRoGnlQAjTXycIuz3rZ9gfGMgbgEOZ5dje5ZS6Vor4+nwBi8a74UTJ+A
 KR1rlOz+HenIXCp0Y7VmW+fEEO+Cq2PXT05Oeii5jnpoSpzwXKDu8wQmMRP9UXRzl9zUJEl04M7
 zgOutwyM/3dkbloIkeP9oyeotKJssZN7qCw7lqNMXVQAbX4Hzx4WB9VmVH9uiPiC/PYf00oZOY4
 mc1iE3K6YEoxabuTnHrgvhBhupNwetzumyTvkP26g72NflbvIfBdnIQd1hbU+PdNEZNIR67i5yV
 C69bKgxnooL3iHJlPvA3jzYoW+9GxJ3mgALqiihs0f8COMqX7fTBr/5P6g3l3hZOQ5YN0UT2F2p
 V0MKNgY+hkWKNu8pJCFv1AoShCPtg3ecPQI1q1egNxyqADVI1wKS446/Zhz27rBokWIqzLMYUm1
 H1+gg1I2+xG4kQYuDOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050003
X-Rspamd-Queue-Id: 035092098BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95483-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 07:57:34AM -0800, Rob Clark wrote:
> On Wed, Mar 4, 2026 at 5:34 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > The MSM GBM backend uses MSM_GEM_NEW to allocate GEM buffers from the
> > KMS driver, imports them into the GPU driver (msm or kgsl) and then
> > uses them for rendering / blending. Commit 98f11fd1cf92 ("drm/msm: Take
> > the ioctls away from the KMS-only driver") dropped all IOCTLs from the
> > MSM KMS devices, pointing out the need to use dumb buffers, however dumb
> > buffers should not be used by the GPU for rendering. Restore GEM-related
> > IOCTLs for the KMS devices.
> 
> We shouldn't be exposing DRIVER_RENDER on KMS-only nodes.  If msm gbm
> is allocating from a primary node, that is problematic, since there is
> no guarantee that anything but the compositor has access to the
> primary node.

We are not exposing DRIVER_RENDER for KMS-only nodes. I'll check with
the correponding colleagues, what exactly is their use case, if the
allocation is happening in the compositor or in the app. In the latter
case, I agree, the buffers should be allocated from the GPU.

> 
> BR,
> -R
> 
> >
> > Fixes: 98f11fd1cf92 ("drm/msm: Take the ioctls away from the KMS-only driver")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Note, here I assume that dumb buffers generally should not be used for
> > rendering. That doesn't seem to be complete truth as Mesa kmsro on MSM
> > devices uses DRM_IOCTL_MODE_CREATE_DUMB to create buffers for resources.
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index ed2a61c66ac9..f82c9a36a166 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -799,6 +799,14 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
> >         DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM_RENDER_ALLOW),
> >  };
> >
> > +static const struct drm_ioctl_desc msm_kms_ioctls[] = {
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_RENDER_ALLOW),
> > +};
> > +
> >  static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
> >  {
> >         struct drm_device *dev = file->minor->dev;
> > @@ -868,6 +876,8 @@ static const struct drm_driver msm_kms_driver = {
> >  #endif
> >         MSM_FBDEV_DRIVER_OPS,
> >         .show_fdinfo        = msm_show_fdinfo,
> > +       .ioctls             = msm_kms_ioctls,
> > +       .num_ioctls         = ARRAY_SIZE(msm_kms_ioctls),
> >         .fops               = &fops,
> >         .name               = "msm-kms",
> >         .desc               = "MSM Snapdragon DRM",
> >
> > ---
> > base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
> > change-id: 20260304-msm-restore-ioctls-2a1792311a09
> >
> > Best regards,
> > --
> > With best wishes
> > Dmitry
> >

-- 
With best wishes
Dmitry

