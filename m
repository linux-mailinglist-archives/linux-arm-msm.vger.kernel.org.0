Return-Path: <linux-arm-msm+bounces-98812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNlYD79HvGnPwQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 20:00:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D71AA2D1704
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 20:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0C0A31476EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 18:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BEA35DCE3;
	Thu, 19 Mar 2026 18:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQHzm1a2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VvoWEdnh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DD834C808
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773946755; cv=none; b=HUJxeORqLxys0o60J1FvvWVm9MOClnNX3//+0GaA5rFyia3vfdnjzbXgPehUkdleM7N6OTfx/ui8XNYpUEYOeeemSkGVdRihsTR4U28gMldOVKSj0H4Qod9ttS2c/ui2HRotmtUmuocPNP/yy570MBtIan99NYnmY3NgOT1uwvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773946755; c=relaxed/simple;
	bh=17E6zVNn5uJ8r6JlhRcHt4D+hx+kj4lFU5R9CvtrzeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sy3QWdiEAGZrraN5d1LNj6QjbxpJ3YRKbwBibVCKqt0Fw6HhxqWGulkiBx3bsT79Qw6c8cFwzrbyAJ6BxARF6bZ1xq1/N0OJ/acTiYTA3oGzlRwrz2g2+4s56jpQj3fjVJFN89tETtZSkW1V1WeJHP4/bHID5JO/uU17YMRlPyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQHzm1a2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VvoWEdnh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JF6Xdj770715
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6h82EpweN7+m0WPV225yn70R
	0VhenZVEg8Gg4RbOaxA=; b=gQHzm1a2WTPnKc8MGuCQ+tiz1e3m7jclOtWs2gmM
	RCm9iXHCzaIw+jlxp1q7tdELRIsOJ0aw2EpJ15XbUAYVSGpUtBLixjSQ6eVv4QMg
	W4tbcZ0qVl8FR1tRhdt73gsZaaiJlOFz81pjeQKmwgxNXAAeB168pKRcWrU6D5iW
	2WAQMlyxak+ImoiFJWi8jO+8n0MlY6fPyveevDCWBB0iOpZx1smgh8E+SjYZlL5a
	VG6kMjmXrSNxdEkEZDs8KPkhYzz8oFg7RmwV2nUdZAj2Siu3EroRIueFD5UbbplW
	g8JkONc38Ulg+yrVJlt5ZLI5qMo+Gxc/X0opjrIOsHGFIg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00egcdnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:59:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094741c1c1so91344081cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773946751; x=1774551551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6h82EpweN7+m0WPV225yn70R0VhenZVEg8Gg4RbOaxA=;
        b=VvoWEdnh7lKsGdVzyQcyMbxl+lDfPVLmSR7NB+6zIPxCMGJldQxcLyW/FxDicW6k4r
         uIrqDdJ7BKdePN5ZdjWohrJvTQB39LDfZ+V0oPLfIB6OgOrgRAojnwSlJzEaT1FH4E5K
         QFa7H4zkHsXb+ig97s9dlr2L0m9dAYH1PnW/pO5XaDBs1TFomYSSD5sRqR0yyihESVRR
         ce1eDGysG4ARICe6GoetVtKgDXWhHv4n/e/u/sE436jcWw/YT+b6V5R9ipIng3cLtwvw
         K+IiSuev+RyEZm4MWxBeqXdOSl8HmqDpQM8Pmadv3H0Kc4siqhw4qp0a6j6o3y2EFy6v
         H0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773946751; x=1774551551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6h82EpweN7+m0WPV225yn70R0VhenZVEg8Gg4RbOaxA=;
        b=UXFMwzbiwxgLRJ9yTFHAOpQhbSRhEpSNHiUO7q4HsT2fXkCZdGRSgWUxSrmaQxfANm
         hDn188+GXlp4hhCr2j+Y11RuNklPGk1X+eqd2qofJlkFFgBGDF0xm/MqwOakEgXWOhx+
         gklXxgcDQCappre0l1uUGM2T0e4P4P3G9lrThnHFqnmjY6fFB7BiiIMd3dMRCLbRLxB2
         CunlQzPWr7DEdr/5xj87AGGJRprwqRXkJ6iwH/5fwBvk6tiFtJ0WaOo4KeoBwtek9rN8
         A2o0iUBVaLUrV277SdRCiZL00ywbssMymk8TEpSJoNiL9W3WuwGraXpuXXO8epphJwxe
         68+A==
X-Forwarded-Encrypted: i=1; AJvYcCWqhLSnSxtnpPflJgxB1XgH95c0FjcYzJ9FWOwX7LScah+6GAGTUaPVmLmkumq0JSV1xayyU1quuVed7xV1@vger.kernel.org
X-Gm-Message-State: AOJu0YxK7AUQ3ETaSXBSgFxsQWaSFCEdhznS8W+ms8nMwEeU0daW5gP5
	Xm/Gtt6TC0jUIfDWvcqJT7u01VM3C+XxOL3HVMrfc0PuBDLac6fEw5hiY1zspsRMeLR3hQQp9Ym
	EBT5bFwZfIlmF9ZhvxcEGzdWcegWc6dWFx8yfmenIWiAwagBzs4bs5PnkV8+AVAbQjlaJ
X-Gm-Gg: ATEYQzxWQmYejAFB4Z+crWoChEzvy9NU4rL7Xjrd7XoMuY8bwB3JlGsDUNBMkmPRIVC
	qZOE/GO7ngUrVtDbsNdbmL5jlAcNJi0u2HUXMeJzFCaXytTUb0BbYpRllBVAgJwr4jzCNYb10K4
	WVjOaaygR/54y1ELaAcmkjyaZGn0fbBRLPzk1haQV0iUc8kgbxJsVyhV3c3+I1vfqZce/yGZjMF
	7l4/qsOqdZ5ng+7on1cGHL+uRJIlTVFw1O/TlYRMj5FNUgmVZ/tmV26heLPJps87tvC+o2jx4IU
	SHWWkQEOncieURmaQbp8NDju8j0aI2Xn9z8+eM1qfG9bB4DV6m5pQNi8LyzUKQSMbSonVqEaPUs
	c9kOEN7mO09meGHyK1FDG+K8clWmCNw/HWN1zn/VyLRxHDbfWGJYkxQ2ORnQxmQ4BBDK0qzB4pF
	Xrug4ZuToDKNp3cmA2BT6bstoYFKywc8fH1Wo=
X-Received: by 2002:ac8:5ad4:0:b0:509:3706:d134 with SMTP id d75a77b69052e-50b3756004bmr4379721cf.52.1773946751192;
        Thu, 19 Mar 2026 11:59:11 -0700 (PDT)
X-Received: by 2002:ac8:5ad4:0:b0:509:3706:d134 with SMTP id d75a77b69052e-50b3756004bmr4379311cf.52.1773946750585;
        Thu, 19 Mar 2026 11:59:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9984248sm757621fa.23.2026.03.19.11.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:59:09 -0700 (PDT)
Date: Thu, 19 Mar 2026 20:59:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 3/4] drm/msm/dsi: Add support for RGB101010 pixel
 format
Message-ID: <gompbnsbhmfx3ze2nq2h47t5aohsm6oxuetaymjpn6kajmhu65@r4qnbfshwmgh>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
 <20260319-dsi-rgb101010-support-v3-3-85b99df2d090@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-dsi-rgb101010-support-v3-3-85b99df2d090@pm.me>
X-Authority-Analysis: v=2.4 cv=MMNtWcZl c=1 sm=1 tr=0 ts=69bc4780 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=R0a44-rvPaGPu9M_SJkA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: -laZ4PVTxZTjtZwROfvfsDNZH0Qo3fy9
X-Proofpoint-GUID: -laZ4PVTxZTjtZwROfvfsDNZH0Qo3fy9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE1MSBTYWx0ZWRfXwWmVnUaqaDey
 wo0d4oFrtv2NJoUeS6oE1SVZpyPrmEANwmO0P3RlT0YLVJmD7ENogEERjg8ls1ms+GmOsd1QBSc
 KxwvSfb6PiM+0tqpZqJAleR0LxyD1dlt4HYAbFjJroNNOvlIxLDqAfKC7+4S94NxvHJV6NRsBft
 +aaWZNQMSFkBKWb6LFhdKCYjfqXOIRDtByctJUc6VBRX3YMRqCYBd3K6/Gy8Vk8qSOHLKPjZO+J
 bRb8DxpZM8mezEEkzwfGrWvfWOuRbSFSly84OvFnUcot6gEJ5EpjckSBIlpyYJ5z6O2YScI8bUz
 pWegSRf/4u9ltDvHiFXjJ4y52yNwNJ5vSJEnPGafjV8GIz+0mG+OwqQuGi5YsEYNOkLnzsKs3TL
 +raKfG9yuqHoSnjv32bEhdt9o65WbN8+HIPOG6XTs9SW5X8IRr9WrYUzL+AqEwF2FSjRiEAT+lw
 gS4SONbQmh1QS53vhWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_03,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190151
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98812-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.961];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D71AA2D1704
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 11:57:56AM +0000, Alexander Koskovich wrote:
> Add video and command mode destination format mappings for RGB101010,
> and extend the VID_CFG0 DST_FORMAT bitfield to 3 bits to accommodate
> the new format value.
> 
> Make sure this is guarded behind MSM_DSI_6G_VER >= V2.1.0 as anything
> older does not support this.
> 
> Required for 10 bit panels such as the BOE BF068MWM-TD0.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c            | 10 ++++++++++
>  drivers/gpu/drm/msm/registers/display/dsi.xml |  5 ++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)

For the patch itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Note, you've dropped the patch adding RGB101010 to
include/drm/drm_mipi_dsi.h without declaring a dependency on any
external patchset, so this can't be merged.

Also, there was a report from LKP that you need to fix the meson driver
while adding new MIPI define (we should not be introducing known
warnings to the kernel).

-- 
With best wishes
Dmitry

