Return-Path: <linux-arm-msm+bounces-104162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLEKNNsJ6WkKTgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 19:48:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEA8449690
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 19:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E84E430055B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 17:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62BF390228;
	Wed, 22 Apr 2026 17:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IF8Zj5Xn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heJnWA3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AC238F25C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 17:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776880088; cv=none; b=r3bI0UNBTIGu1qwQiuPCZ7kXks4Vr+TN1dve9u5xksZsBzgjuMVBJAUYnvKqEO6iIZgQxB0I/a4uDIVgd8CtUs7n00B/glBoV1C//igN5VGagG/2bfIweJMk3UK3boUaWNBktfIGl5l9h9lQHB1O7FNu9U1jclQ5b82GRNP46hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776880088; c=relaxed/simple;
	bh=3mIFG0a+b2pkV0KAb0tnrD3TJEBtj7qnvzFMVmRRct4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJq74h36pj9HyRYFZxWkl0DfwBmwye8GDH335uxyEMK2ZZJztRpl2z8yxvzD3L8VJXt3Dwymq3Ey1x8S8o7k4xr1bk3HDmkOJLhM7Gpx8ktVDNZUg3f70jKKQJP2Z6PXopGp0c7mjTYGuxFXou/cee44qLviScuHlJcIN+PDyoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IF8Zj5Xn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=heJnWA3D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG6UNr872657
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 17:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rdIWJRBzLsT+FQdXZs2St3YIH/aQ6EawAyxBixIyb/Q=; b=IF8Zj5XnmrkSseLs
	Pct9+MnzQeWe8qjhN80UeXGPkkOc2IlaMzCf69EYWZQwJOxRcvBlzcz8eLh/OUaf
	WMgYNk+Wh8DmskZcc4RUydXb4F+73IP5KXoNa+yg5g4fDxuE+O8IrIp5hvLxDlli
	8dmclxrSetr9EwY14UIBDMxyflqAZLAgUEAlVDDCn41ZFh9A1xmuzVLU2430mzMW
	HjEncvCg3AvhDxOojHycs7UletsVbOh5l6LxfUKguW+7xgm5M/4oj11zy9I2G+zA
	Qp+1Re1LDz5TvwcjvM9TeoX6stG8ogSMSt+1+Lgx0DQ2BUoyDiv08Sdhc37ykOg7
	jVFTfw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh0c57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 17:48:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e136aff17so108187651cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776880086; x=1777484886; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rdIWJRBzLsT+FQdXZs2St3YIH/aQ6EawAyxBixIyb/Q=;
        b=heJnWA3DYBfBhaPIkdwuoUIsKkKvUwZHF1lVh1IF/Odq98NLDrwdGmOcLxtmcsZq7a
         V6XT6L3CMqF6oO+WfDM5aVM9GiFL5BzS2iKDiupitlviE1jwRI/26vKZU89miP5k4yhC
         7JyB42rETQrFe6bVKaEfXOBnPs1BONO15Nhk7377gAzyYsIkMyYzi7wjlLCsDTAoHUNn
         /21rbwHyNqM0yl5dKfdD8pnWOJvY0s2tRzPmULYTa11UR8YqPzkgbXg9rMwWSk5E133J
         eZaYHTaSQv0B08SOazkRY+KnHRKic0p3xJ0dgMKLRU3LJCC4xDzSzLpywzimucY8UoWO
         JDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776880086; x=1777484886;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rdIWJRBzLsT+FQdXZs2St3YIH/aQ6EawAyxBixIyb/Q=;
        b=TSDM6qICd39rEhYnJIKpTKe6i/Pr80K+TGfRr7KUGRX6ZLZ3ww88NE9aZjegkSLs2y
         vEwx0iHgWLt9LtN5IQwztrtj/RyU6oL5fNyLmc0W8AHS2/hB0FY7fapjwpA2qDRGQUiJ
         JXgQubbkHd8az4MaV7W600js8r5CNQsdkeNsT3gHbWF0Mlarj8GqsbWwJtId/tc5LR/u
         3RpLTuprMiXWpMOBKvTAyql58/GXxvQOJHZk2EfyesUet7RzpZ0vtdAFRs1iviRskJLu
         1wcLbvQNz6PBtFLaZ6pBeCKR9ADQwG+tsacpDCohA9XjcvXQNcood19pGA0ovW/ETkN9
         kvWw==
X-Forwarded-Encrypted: i=1; AFNElJ9JymUnGes1l3J++0dDlnJafmub+COSQz3iSeN8D7OLPCQW79c0qh/a0nuoSww0Y5e4j3N63A4ibLzkwb5L@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6JSqPwNmOoyH+0ZTlNScE/vWXYe3zKLZlnztanVTxuhOuqFi1
	DhYs/nUzlgB9Medx+opowQiYBqUd1pfKB1TtVYdJQQe1RE9V4YPbIS9nV1/3OyLEcE0y06TJZ8u
	eleiaNKC0rWaoxXsAib58iUMr8uPEKj6x6GjC+AhwkNgbtgvIjURcqHvCNRSaOHW/fUke
X-Gm-Gg: AeBDieupYpS+ynmpA1hlqxGKaQc6fIFDWYsSXSJs77iOFXzRnZA4ZKIR+xKBClNJGkS
	eWIiR2Jdqk1O82AzlUMF/pK6vnAzYhWcKvdg8hpD3Jjdf3ZDm32/pYElWjeVzRcbdo8mGYvujR/
	lQoZ7eaPVHkSopatXgeYTmkNHmw1tEySegG09Hx/LKcyWdnq1ueeY4aO/uDRddqxtMqPdQVN4xe
	pzmy4cWJIL9ax8aWwbDLr0xfwBvFU8I1apTr+LUswpfxNXpKp2SWIo4gUzp0HEMk2/CYdeGbkS6
	vi63W/vMimOkaCXvulK5i1g+Mf7Ytid/UhEzkEZwk2jM0l42j4ELECTiGO5bePQaQGoAvJSx2oC
	DwtM0AAnv071O7vsZOkh70sPrHCa8XKa8cV2mRaUfb1bBmP5X0c/wPvRzbneU6IgwOH7hc4jMgM
	6SwlRwGZNyMNX0yZ95GFTBkqnI+47nU4BQEfy32b+WA182Ew==
X-Received: by 2002:a05:622a:10e:b0:50b:29a6:8696 with SMTP id d75a77b69052e-50e3681d042mr350788641cf.7.1776880085661;
        Wed, 22 Apr 2026 10:48:05 -0700 (PDT)
X-Received: by 2002:a05:622a:10e:b0:50b:29a6:8696 with SMTP id d75a77b69052e-50e3681d042mr350788091cf.7.1776880085151;
        Wed, 22 Apr 2026 10:48:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad0adsm4622156e87.11.2026.04.22.10.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 10:48:04 -0700 (PDT)
Date: Wed, 22 Apr 2026 20:48:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 13/13] drm/msm: Add PERFCNTR_CONFIG ioctl
Message-ID: <a36mlynml7egnts7lk2v46lxopuyxdxt7mp4vtbf7dbhn3gzpj@ufvqdjbnujif>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-14-robin.clark@oss.qualcomm.com>
 <a3nvz2coifdazaoyssm7xtxmyiusvofxu5f2p44kvrgvpa7hbc@jmj6gyttetcr>
 <CACSVV03+aZUnLWfGjMLAJmvHm7LxnugJDQ=_ZZFV00-UWeZ98g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV03+aZUnLWfGjMLAJmvHm7LxnugJDQ=_ZZFV00-UWeZ98g@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3MiBTYWx0ZWRfX4I/wFu7ZylzL
 GeHRKdIG90vyBfBJrB5SIbY6BXzS2S1y9J7BKu765lhdE/VoBuf+8GBEkTCB7tt6p+GPYZajUG9
 PF4L9lN7UQaX+gHdUzP2KCDQryRR6r5KJUPNAdgEyap6kivzbRkqvID+4bSm93epoTuGrN31Fxy
 X+KXLNc7eH/v2B54gM2SiC+4VK6gByhl6UXqP2fwmNDlnLF9QiWxSJg/mbu5HZUXQXTnJPqMyIx
 amKEppFSCnKYhpK8B+5uS8Y1JPvIJWkY3+JTOxN0fxzDd89YUMZeXaSTd/Tob3S49zUl4yVhnda
 vhwsTUOQIpxNNynqCdTBbC1hHBTfjPWH/3YprYU6jD5yDcZeX5mRr3Rvm6s0XYfCULzmFBH3Sib
 TKSc662VqlhwJOpiauMce7ImaMND2nfl4A23A9D0jk+jfA7ufrqgrXw8YO4JgpmI/nfIUtrjzve
 hbSU9CEYFzumNvZlrfw==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69e909d6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ul2Ekiw2JhVQIeWwY14A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: XJ_jXGD-u1PYK3BGS04QaNtJox3aNUAo
X-Proofpoint-ORIG-GUID: XJ_jXGD-u1PYK3BGS04QaNtJox3aNUAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220172
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104162-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7CEA8449690
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 07:20:09AM -0700, Rob Clark wrote:
> On Tue, Apr 21, 2026 at 8:41 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Apr 20, 2026 at 03:25:35PM -0700, Rob Clark wrote:
> > > Add new UABI and implementation of PERFCNTR_CONFIG ioctl.
> > >
> > > A bit more work is required to configure the pwrup_reglist for the GMU
> > > to restore SELect regs on exist of IFPC, before we can stop disabling
> > > IFPC while global counter collection.  This will follow in a later
> > > commit, but will be transparent to userspace.
> > >
> > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/msm_drv.c      |   1 +
> > >  drivers/gpu/drm/msm/msm_drv.h      |   2 +
> > >  drivers/gpu/drm/msm/msm_perfcntr.c | 489 +++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/msm/msm_perfcntr.h |  54 ++++
> > >  include/uapi/drm/msm_drm.h         |  41 +++
> > >  5 files changed, 587 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > index 3066547f319b..0a7fc06113e0 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > @@ -801,6 +801,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
> > >       DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
> > >       DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
> > >       DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM_RENDER_ALLOW),
> > > +     DRM_IOCTL_DEF_DRV(MSM_PERFCNTR_CONFIG,   msm_ioctl_perfcntr_config,    DRM_RENDER_ALLOW),
> > >  };
> > >
> > >  static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
> >
> >
> > Should we also increase MSM_VERSION_MINOR?
> 
> Generally I only bump minor for a change that can't
> otherwise/reasonably be probed for.  In this case, userspace can try
> the new ioctl to see if it succeeds.  And since it is only supported
> on gens w/ perfcntr support, userspace would still need to probe even
> if we bumped minor.

Ack

> 
> BR,
> -R
> 
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

