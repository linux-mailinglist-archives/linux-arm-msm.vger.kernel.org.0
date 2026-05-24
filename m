Return-Path: <linux-arm-msm+bounces-109491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO96MB3KEmqd3wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 11:51:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 270ED5C1D22
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 11:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0159730078F0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 09:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A85D349CD8;
	Sun, 24 May 2026 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="plN+vWvz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XMQmXz29"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C54A384230
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779616279; cv=none; b=tL1rsf/IccctK+4Gk8PbPeiuSnKFEvHn6tlCoFRcEDTLlBx4CY4BtBTXo9oH1ICbS8tx/z8ieRbYH2t0r3DsCJiL6xmBHoggdSMdzk+0GExgSCCkqqoz/Tjj0giVVc4lxFSx5p5OMizh04eYhCERyoVmvQr7ASucFcRmbYZ6etw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779616279; c=relaxed/simple;
	bh=N5BI9mU7zAMiJUTCNW6VZISCqT7/VACSpYY3mp3L2Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tjy3QB/ESbIQUZJ+CmH+wJ4pyj++xJxdccdgOh0IeuRXbDv/7NSuiyDNpkIe+/iMX0khgsqNQHcK8yzosbpM5SSolGmCkosFZRhOnxMdn+BDn+AmGA5V0RKBZd7/sXyXdZHXn0B6aaf6364wCfh1scpkymSFdJ2hPc+Lnj0KW88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=plN+vWvz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XMQmXz29; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64NLlbSL1581249
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 09:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fEqqSKotT0GFkp5iRZUp2dFk
	zHVllsIMcz6/tSNgQLs=; b=plN+vWvzKZVE1ia/KxXPrRBF8IpevFd/XRznfoRr
	YKonHpCXbKwC7T9ikhveV73D0i9dZDvAyTnREK06gOiUQxbzOFfsmHvG3Nnvoe/4
	ODOnEcuZD/WFWE+RvMmKKJIJ69agh9VMvaD3CLhdUFAr1t13AEP/1tFEjW3Ip72u
	6ZFhH12UV2u5sioRhGkNyQHj38IlYEpvI89nH9wb8DqTOVGd+SbyfgNHQD/r1olG
	qk3+Slisen2dQxLL0suEnGKwgjmbB6aiKwuucKbXt/Ivf+S4AAbSRBUKMT/XswnZ
	jDqSUgC0UXZW935oAU9kIcXi2S1TyC476PLDex34dNeHEw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386k1w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 09:51:16 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-575ff9befe6so6610144e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 02:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779616275; x=1780221075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fEqqSKotT0GFkp5iRZUp2dFkzHVllsIMcz6/tSNgQLs=;
        b=XMQmXz292FzZ3aeisAwjdjHwT6nx8qmoUSWyUTvXpDBm7bjLDFBIBBjv6ZRq5/8Kuu
         lO2Rij/jhbKhEIDih5JAdcsIh9zJk8E5DsS6LpMPsyMpNrm/H3xS4HOy4CxZbGWQAxoG
         7cn+9SBtCnyeQhzUdK7S+T8UGDYHwLFYW6SdwMplV68pN1gswWa4K10I744VNq9AS3aN
         MUVvKmu7oZIFz8cu7MoHNFA6LQlGtBJBVHNNWWPcArECRrDEirNXBPqnqrHhyTGXa+cQ
         BEbunEq1aHiXo4y9kECg/kvltjVvqJCVtsrKp7AsRRDhhiCK+33XYt+Ec3HvO79FnlZ/
         jRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779616275; x=1780221075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEqqSKotT0GFkp5iRZUp2dFkzHVllsIMcz6/tSNgQLs=;
        b=sGhDVqL8IRwsSrr6ckqUd590tnKSGtX7xKLA/r00THewN+lXokhnn05SqPt3nf0ABh
         5Z1Ix0PSWTFwaeDQ/IbH+zBDdFGZRemMlrV5Xftp71D+Vq5/LRiXCfdVQdchqD6cBLJH
         K3S8JDXS7rIQ/ioyS+Xusov92kq/TF5lXQlucmTak6ID5E3lz2PaJcFROYpzJHRqZO1K
         Yu1JyUKBTpSLlx0GkPsEwccQomV5D/9LG25leJ2/WMpwUs8y+LwrvpHZalyRY90ImRO8
         V842uuUE6/JvsfNUGSf1uT5zNkk71/FsZXHlUh5zhFtb71Z0C9WhHTAMoxQFUlA9Sk2m
         wj5A==
X-Forwarded-Encrypted: i=1; AFNElJ97lZmLb2i5kPeddTnsc1PiQHFJcsidYVhO+wiX2kMLdHYhsgWv0vTbyAQlr1714IlA6MAyjQRx+/NiaOnR@vger.kernel.org
X-Gm-Message-State: AOJu0YzQScnm2b8zPPYMg/MBvMKMnbwJuqHepCu5Rh4sQdZ5LJTifxZl
	eTceSxjVtZ+TGTOBFZh7h+qeCS8bUkeDICMnKIzsTem8iLrsb9j6vMJ8S4Mx/PfPDVTE7PEC0Wt
	6uFTjnvDOJLw1UYmEyz29pr6h+sBfZy6/i+sLxEgTwn+ZTN/oMBS3WXF3vucLjdGIC/l1
X-Gm-Gg: Acq92OGKR4gT8QwNcDGD0Ewx0ssM9CHW7ZAAYU8wTx/ZPsm3gaNh3YCP+1zYPGaLw8V
	ozfIElKeuSN99ln9saEVJBIhpNjAOw+6sRpK1HjBezvGgteWcZeZWkI86oZDzdqAVxbK9ZVnt9b
	iou0G86b4iWg4YOm5V8yMmEUCCGiILkD6ZMcZz7+sOgZ4poSqVyKGDGLplKwj79wkuTF3XXeD+M
	h/ujX1c7c0VUzk/uNsKGW4w4Xq16buky2A9ZUEATt5bhCXVaGOsybGVyZyCmAYXR4mpFlrXEYPG
	ZHFlbKGdAK8J63fj4LCTfe3E6TFf+1SMSw4PXn77gVNcauJZ79AUup2TMFj4OGzJB3mejzL6zDL
	qec5vOSqpGrtbtruJd94Ilpx3KxA1KpedEAOPb5QwvnXM7ttl0BEJKxJPl28ZgXK6iJg4kzGEDT
	lr+ESwzMQ409PsMXKeFJZ1dO7vciZkqnPcdZo=
X-Received: by 2002:a05:6122:21a5:b0:575:1711:a9c4 with SMTP id 71dfb90a1353d-586624cfa80mr5296979e0c.9.1779616275300;
        Sun, 24 May 2026 02:51:15 -0700 (PDT)
X-Received: by 2002:a05:6122:21a5:b0:575:1711:a9c4 with SMTP id 71dfb90a1353d-586624cfa80mr5296971e0c.9.1779616274901;
        Sun, 24 May 2026 02:51:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf2b22sm1816006e87.55.2026.05.24.02.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 02:51:13 -0700 (PDT)
Date: Sun, 24 May 2026 12:51:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/10] drm/msm/dp: Move link training to
 atomic_enable()
Message-ID: <une2soerfhyu3zjyn5qa2jkrrnaws75suw6ct6zayankz7mt3y@bjz2ed45fe23>
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <20260314-hpd-refactor-v5-4-0c8450737d64@oss.qualcomm.com>
 <7bfcdf7c-f114-4f4f-9ca7-6a0d31c856d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bfcdf7c-f114-4f4f-9ca7-6a0d31c856d5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KosUcF_7L3VemDz5Tf50H_RlQHsVoFvi
X-Proofpoint-GUID: KosUcF_7L3VemDz5Tf50H_RlQHsVoFvi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDA5OSBTYWx0ZWRfX43elJxZjAUMe
 duhRU2s8jpYIOCoUIzz1Pyf81HaNvoqv6GafHuE+724OXN/2IWj25m8Jphsdn6t0pyq2COBo/8+
 EcdjOoJHxQ8Cl5H0TsBwc7zUcNHPmbpDc0q9zvO9s+ZMi8GmK9Nd6vCgdcjbSDuPagrxdW8LK0u
 GsdjrUmNJBYBt8d01yyES80IUEJSxFeMg4p6ah29MKFsNLjxCTS2D+sOUwxDtarhQERIEtKMYVE
 sZW9M1GIkSq68zaI9G3zZuUIuYZv3U8MUv+rlACUZNraG95e5cscNgoLv4W5G1Y5c5r2N4aXkbi
 psuNAGesYId6Dr+iXkh8nAahYKsfbdrKbg/y6YjhnsyE1EQj5bI3zncZ/tWfYh2aglIYzgbgQCa
 Qpf/KXUHA9Ou4kuaWX4UblT67YBX8T2nFI3qCsSyPK/hYXtoGw7E3PXSOSjV6Ya3EmCWl09nPqS
 MJ161suOqBx9LO+4ihg==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a12ca14 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=RM-pzoYVJfQj4HWh9lEA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240099
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109491-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 270ED5C1D22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:33:07PM +0200, Konrad Dybcio wrote:
> On 3/14/26 2:09 AM, Dmitry Baryshkov wrote:
> > From: Jessica Zhang <jesszhan0024@gmail.com>
> > 
> > Currently, the DP link training is being done during HPD. Move
> > link training to atomic_enable() in accordance with the atomic_enable()
> > documentation.
> > 
> > Link disabling is already done in atomic_post_disable() (as part of the
> > dp_ctrl_off_link_stream() helper).
> > 
> > Finally, call the plug/unplug handlers directly in hpd_notify() instead
> > of queueing them in the event thread so that they aren't preempted by
> > other events.
> > 
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index a05144de3b93..e7b1ed5491c4 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> >  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> >  
> >  	msm_dp_link_reset_phy_params_vx_px(dp->link);
> > -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> > -	if (rc) {
> > -		DRM_ERROR("failed to complete DP link training\n");
> > -		goto end;
> > -	}
> >  
> >  	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
> >  
> > @@ -1695,6 +1690,11 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> >  		force_link_train = true;
> >  	}
> >  
> > +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> > +	if (rc)
> > +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> 
> So this will still crash the device if the above fails - there's some
> return statements in this function, should we bail out if that happens?

Yes.

> 
> Konrad

-- 
With best wishes
Dmitry

