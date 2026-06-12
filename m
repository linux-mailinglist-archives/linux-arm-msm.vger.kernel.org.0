Return-Path: <linux-arm-msm+bounces-112856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MnUnDOmzK2pwCAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:23:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 993E36772BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:23:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hwKrzARM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JB3wACWP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112856-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112856-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A17503014401
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD1C3AE1AD;
	Fri, 12 Jun 2026 07:23:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B52735A3B8
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:23:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781248997; cv=none; b=Fwa3CBYtk2CJnUn4ttk2o+mCNXOTuy6yrKeGa1qATlXottBqCf2/0yWQPwVEJDS3GJdn5Rgw4Qn4pGF18R21N+JA2MMwekXPsv3un/3Z8v3rTwPutsm29ExOJAfAjjv/iQiW1hzdv6MonkloE+3YXcH84LD6vXMAF4vu2T/ucTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781248997; c=relaxed/simple;
	bh=C6nioGT+ZISvIG1N+Tqgxip3eObb0+OwM7HPiYZlLMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LB2/95DOXZtoMUjpWt1QkpKyMA+3syR/9T8evoV//GpOBKh9o68aeCTcGuKS39cGQamHJZE4dzGAjxmu8Ve6VG6kL7kaclRC+QRfhk7cDmduMZfNYxwMMqc/T3yBM+9GOQNSZmyEhkaTjijQLBwPblDSL4NxFgnXmF4+6+i0Rds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwKrzARM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JB3wACWP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3C3hS2506361
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Oi02IyzSr2sjg28TGbtMd8Pl
	3gIGWlHwztSqBTj9Kew=; b=hwKrzARMcTQhsrFdvIsZn/qzAlg7kEDPSZhEWjt7
	Z2byHXJe0EU9fhILDX6Y7/KJxV9io9bDE+aN3kY7JxgMRKhxHNVOipJ86zpR/4ER
	pYj3yvVpGw2OLYu3cdD0cNxJYWM/w6oDVH4k7/TyJO82o3YL+iMag6BIZpb9k/I8
	XSftKm1s771YfesjyHfyJaceyuL/EBm4tEXNEwqUFLeNNK5KDoULunbyVYHZgkDm
	/MEdAE5bCvZakblrN7mYe6H2jOpJcuJud6EFC5DzU1oxK8HAQ+LS1NxtN1uW+Bmo
	JjeKJkR+IU7fBg5D7EitRiZ1radArMrND+lLo5pFNpfvqA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbjg79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:23:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517ac42d958so11239931cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781248994; x=1781853794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oi02IyzSr2sjg28TGbtMd8Pl3gIGWlHwztSqBTj9Kew=;
        b=JB3wACWPWxiLnLjpPPqLRi/lOQ1iGxtDYQZvL4cr991VZELczcIJlja0E+0NI8UnV/
         lDbQKUb545JjhJdQNwePGbrGiY0Sl7N+ne9m3s8luPTOkpOS7oVjpny2TsrJlKYxJHqg
         3KDbZ3ZpmQy2wSy5btSYMwJmymRFhHiC5SL0C34dvt/SimfL6sJ4GKVfNxjC53yiLhpz
         IVntTqcNTp2eWEyKcvv9rLdq5VU7UPW/h4o0HkW2PSrQjN8JUBXBrlxUGY6oqhdFXvAM
         RaVrc2/dxX41XmLgtsjt/GMdpt4lKO/jGTmDgFEevohRLpvEv9vSeOcKZkkgsa9gDKQD
         A6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248994; x=1781853794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oi02IyzSr2sjg28TGbtMd8Pl3gIGWlHwztSqBTj9Kew=;
        b=SVMg8xQTiq9xwCXFVtHCs54LVPbwLrbRdZBDgZGIy/wbItauiMN8Jlv7LI6oEgmgIy
         8ZErdvPtulB/eii36ToFMXEpTy7dDb+JI/p4csVv5KTu1QAisYqku8NxKaFPSSbFFGHN
         C+dT4okE6FgNsqtWJ91ntu0irUvz8m3sxC1D/m6a+XJPOioUK5VWBR4q7PPYLLpDN/4X
         7ebuTgu3fmva0YxAIXt6F35HybUuSjZvI+lE22YN5qposTpAhEXyN+4FPW3Me2CFHSbw
         jOLS471Zhq+tiSuo/uCBAcBjpiez7HZURq6Cnx6rrck71lAmvfZ1dLcQe5S0qsZLOzLs
         pDdw==
X-Forwarded-Encrypted: i=1; AFNElJ8bkR5dNjZjWBAa4TnzM1EhOrmadFZwwMJgul0RmNiLdgOoWJfmv3rE+xUYHdelCZRbpT5gxgDlvkGFMNmw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0XC6IINJlH6aYZ/UXu18ikSsZWorpscPhSPwmHN1sALshsB0q
	6ix+ZEcWTi9YYcaObyaXbhTPEOMZjo3fXbptu1QL9JTiiByKifqXRem97N+zDoDkoOgr2b2UvfU
	KhQoR4AyTuQdDzGxOlPVuACZVLMltcZuU7twoRl9Z7lFRtnxWkXzLYqmf5Soe6yvtr94Q
X-Gm-Gg: Acq92OGIDGuWo8jgEn+8hIO1aFIjL4jE+WpLeDsYz/qH5EsJttbDpsDr36EShScaNtc
	epK2vrvcPVxx+MtEw2iQvUZvbPV+Q1GxIfMRyU/8c7J6MHD2ZCXQojzPh9jVH0LeFWdwQ10JBxC
	l/LunJhUWeAKwNx6jjIjkIaHoL4kPeQCLPej5sooYCgucXVkAvOO8Et2Xgor1VOO7UstakfgYC4
	sHY/uKK42cU2nWbYBMweyScCNVWgSHtrbokKMpa6rKcYrU2PiYsvOY4GxIUthQ4qCXrH0XJfpe8
	5jZj6dZAgB+3h2YGfeKqReHvZiMkE2Eg9dnmcIBvxaNfUQDJ6yXNHZtQ7PYx61Fl4R6W8jRveiB
	Z9dE8bF2je9eNQyqaV0WlEtP0N4pWIm5+ZJx9Jyv6RLLXeRxYiLYqO3p08X6xDxP8LubqTDjFuD
	9iCZdjWJGZGCudyhqgZdJw/D/i7Y1BQ35SkD8=
X-Received: by 2002:ac8:7c4f:0:b0:517:71ac:83f5 with SMTP id d75a77b69052e-517fe1aa0fcmr22361211cf.3.1781248994283;
        Fri, 12 Jun 2026 00:23:14 -0700 (PDT)
X-Received: by 2002:ac8:7c4f:0:b0:517:71ac:83f5 with SMTP id d75a77b69052e-517fe1aa0fcmr22361041cf.3.1781248993841;
        Fri, 12 Jun 2026 00:23:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161ee7sm297670e87.13.2026.06.12.00.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:23:11 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:23:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: contact@alex-min.fr
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/mdp4: keep the bus clock enabled while a
 CRTC is active
Message-ID: <eopgalgvpit2o633qqma26nailhgmktuhdwhrthh3qgkyg7f45@qjcxwiw2x4yk>
References: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-0-22925600e4f2@alex-min.fr>
 <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-1-22925600e4f2@alex-min.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-1-22925600e4f2@alex-min.fr>
X-Proofpoint-GUID: k0Th7pigF3vpfo0ZLF3w3_mACsmVNkfD
X-Proofpoint-ORIG-GUID: k0Th7pigF3vpfo0ZLF3w3_mACsmVNkfD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2NSBTYWx0ZWRfX/o4rWyhUZnOL
 Q4hnRsjRrkgQ2TKOm332h3UAn4+ixUDgcx8u9svW2yVDUhOLB3Fx7G77k/t75MnZYn30ncNiOL1
 yaLwuRfcSVoCreSiEWLLx+bhKin6u5k=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2bb3e3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=DVHo1nXE2ezVO6JEMkYA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2NSBTYWx0ZWRfX8Gx0MWgRjYGd
 /vg3M2k60FD+1VVMl/PnlDkTuXlFTNSarttLkI/OpXU42TlviHgVYWaX0PMF6neMCaRTc1DinH2
 sBvBisU4j8Ea1WYGQNrro5T7dAEnMUtEuZw4J1p44EXf7tSW431Hj/Q+CutDkELvl6pyQwjqgoY
 7aPFkwpEWz73ZQuRiOY10Rhgb4zClEVFUccmLoyw8llC1D+K0M9L9zSzuyxW3mJ42u1qid7+m2X
 6/4U979UwGkfTK63+zuqw6vzJTHMM5Q7isn5zrnIHrPo6kEo9cVzfF55St3gh3yqjRXjb3b7Mw7
 v2WArnAkrYxYFV4nmID4upDQelsnOR3Mf65XuuXjJh8fAsD9EeqMNXFhqkBRxBSM3cvQc1DBbRb
 kf+KYAZwWHIQR+ydu8R3lztSNk1M9oBN+iibnvS9xB6GIIQ2nZCKj+CUIj4xfharRk5PqDqJmBn
 b5qpIL0cHj4PFkM06hA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112856-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:contact@alex-min.fr,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qjcxwiw2x4yk:mid,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 993E36772BB

On Thu, Jun 11, 2026 at 08:07:46AM +0200, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> MDP4 scanout continues to fetch framebuffer data while the CRTC is
> active. Keep the AXI/bus clock enabled for the lifetime of each active
> CRTC so that temporary MDP4 disable paths do not gate the bus clock
> while scanout is still running.
> 
> This avoids display corruption seen on the Samsung Galaxy S4 when the
> display pipeline is active.

Please describe, when do you observe a corruption?

> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |  2 ++
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  | 42 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  |  6 +++++
>  3 files changed, 50 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> index e8066f9fd534..9e53c9d956ca 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> @@ -271,6 +271,7 @@ static void mdp4_crtc_atomic_disable(struct drm_crtc *crtc,
>  
>  	mdp_irq_unregister(&mdp4_kms->base, &mdp4_crtc->err);
>  	mdp4_disable(mdp4_kms);
> +	mdp4_crtc_bus_put(mdp4_kms);
>  
>  	if (crtc->state->event && !crtc->state->active) {
>  		WARN_ON(mdp4_crtc->event);
> @@ -295,6 +296,7 @@ static void mdp4_crtc_atomic_enable(struct drm_crtc *crtc,
>  		return;
>  
>  	mdp4_enable(mdp4_kms);
> +	mdp4_crtc_bus_get(mdp4_kms);

This is a bit suspicious. mdp4_enable() already votes on the AXI clock.
As the CCF has enable count for each clock, it should be enough to keep
the vote for as long as the CRTC is active.

My only assumption would be that the CRTC scanout happens for some time
even after the atomic_disable(), but without a description of the issue
it's hard to determine the cause.

>  
>  	/* Restore vblank irq handling after power is enabled */
>  	drm_crtc_vblank_on(crtc);
> @@ -137,6 +170,13 @@ static void mdp4_destroy(struct msm_kms *kms)
>  	if (mdp4_kms->rpm_enabled)
>  		pm_runtime_disable(dev);
>  
> +	mutex_lock(&mdp4_kms->clock_lock);
> +	if (mdp4_kms->crtc_bus_count) {
> +		clk_disable_unprepare(mdp4_kms->axi_clk);
> +		mdp4_kms->crtc_bus_count = 0;
> +	}

Is it not taken care by drm_atomic_helper_shutdown()?

> +	mutex_unlock(&mdp4_kms->clock_lock);
> +
>  	mdp_kms_destroy(&mdp4_kms->base);
>  }
>  

-- 
With best wishes
Dmitry

