Return-Path: <linux-arm-msm+bounces-101328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GRgH+EDzWmSZQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:39:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1697B3799C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8F8830233EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E003CFF7D;
	Wed,  1 Apr 2026 11:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DIKFPZdC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+y9lW8e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2AF377541
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043000; cv=none; b=ZGRcVaeFzq0nEFKgGMrKBZteu8jRuAjiYx4/n7lyI25C647fjrDbOA9qfo+teF6ceJZ6GezHlekKyv6Hpxlr9oXnlNevVQx3NtZRCf3dKr0aZXX1Qb/7IlCZpa1oVy0yBWJeDexw7x4KAOTXhOERu9cDbcXISYTbAJAwGIp8Y1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043000; c=relaxed/simple;
	bh=JstzcFjy84m5AWnE23sKS/wfZEreRTczIPd6hjYUW8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDrV+QZhgCYZz8a4qzb1VzTuA8fJrUZBkI6VYSkeBA8nyE2siCoLOYqLtCTtUiA97qW5mS08qUx/H5JGqvw20w/4hIjQERGCTsMempoXA1amCQH6Xs3EKAD18xokyLkTCGEr/ktA/Z9kJp+uAdBjgoT+SVrzltukq8KwvHybNpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DIKFPZdC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+y9lW8e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317lUeQ1578312
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 11:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+nRgKz9j6nL4bf3e3tPt9WJH
	q9YRYaWjBkj2eVIn7ek=; b=DIKFPZdCFWnqLNrlFdUhDQnI7J9j+g7PwvrJ/KtP
	/HGFvaPb3C3BwlV6DY1hM5xQKz/izIc2Ens7AOgDVj7OHgpC/z+fUdG0wsiF0Sth
	AUtJiijJo7f0eG1Hx7QET5lJ1oIoQwaQ74aGw7ltzzRVtKnccxUpb7vbou/UULND
	kAbSlYPXizi3/yryu5zslqqqk43fcxL2y+ecNyvkTtqn+2bfO1s6t7EF5vvOi2w2
	Uz0p/C4vkRRuZ9XuhA1v/Lr7HCZtKI6L8WQ+eULp8HFX6G8Lyx8lZS9YLRfvvTMY
	tzVIlr2tilCUXPUKYTrYaHgi0h+mb5hWSlBvgdJleU+v1A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8k6kusfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:29:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094ba09affso73724651cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775042997; x=1775647797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+nRgKz9j6nL4bf3e3tPt9WJHq9YRYaWjBkj2eVIn7ek=;
        b=U+y9lW8eD/6ifNggfkVk2l3uLEPt5jqvFQ8FAKk3OoBgITN9/0bcOWh+rIL8XHUKdE
         PXCPz3dOrjjIg88jBZF30DVZ4kT0z/AOypL7PX+B1kxq/SsVy1sL+/f5u4A8uBS+CP44
         1UI/5gWbBOW6x20/26luAsgBwLI2XD1RhjAJ+Wl0s25bJKlsWN60MKg1LZUL7VGUjBYQ
         qAhREDxTe0CLeJjJ/3TI5UQszC3St2J64prNBMwSNbMWC9HGeCIWjeCz2orEO+6FseOv
         dI3aOaagIBDp4MAbNE40Pe7ZiXvWFywVG/HlrGR3RMm1tVee6PJKS/uPOFAB8ENO+RUN
         DuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042997; x=1775647797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nRgKz9j6nL4bf3e3tPt9WJHq9YRYaWjBkj2eVIn7ek=;
        b=Jk3EpgzQGvnlnAI8eLxipXV6uiFp4Zm3wmvyMODOnovg9dVReW/of/NsnzuzXtZckp
         mD5qdkbmqXyt0ZcZU52XY3FX9/GSke/IWG0/knWpxYYPI44gPiHGPHpJzxc66YiLagZF
         eg5g6P9JchnMoUAb/YS2bpIEH8gErSF7Coz/DEnZ9eFs3DNlfyHYrrZHdlaWwJseV/6K
         2lQECwpDpB0pULKn/LrGVkWOD3noPPoM2jnTjCPtJeUnul+/0+8rjrvVjoAEMt2cYgox
         dTr56DQMlrfz5HqqDaXzxO2cZHtmB53eaoB4eu9kM78NZqBRB1xBMsNzjAdmPs5KC3Ld
         /6ug==
X-Forwarded-Encrypted: i=1; AJvYcCVuCccVMwLFLl/HBXqIFxtDV/dJrJBOepM/ioCkfXNYHwOnopoJCLHXHjzUWd1NhTcsQ6Bc8VUN6mh60okX@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ/EJmHCg42ISgFn6U3ROE2Trvp9rR2YwBnFjU6qQLL2h117Kb
	i3tK/14f85AjKPEjOARYL0E8xmWI4QzST+wz0nHhRWq2BdwmFWnbyxxNZ1OUVKKeeVTQhkhC2s2
	KEha500yrLvGhIrUSsk0v7rwxw4pC20c7rnE3gugCHHCJ/TNfvDKp2TiN02OZB3iSnZmO
X-Gm-Gg: ATEYQzzFpcYmZY2iHyxeC1bMQjFYLsgniOgJkX4D16QJ23Nmk/qe5yy0fvYQc1yT5Up
	C37rMf3d4Dd0XUf3jKrKXGmYtkaF2InTDjHhfFV+l+7u3QRjGnFgTVkwkBVT/zFaEohd9KaqR2s
	dzHh54oFRweuD/pdRSbqA8MKtHZ8Of2+diGWH+36gwQ/Cl15yo6JlXqVnZgzW1RmRDlspoimrbh
	m+zKKTs53tSK38Rmmhd6s5JZOPeWV3UNIewb2iCOhQF9dpaytotNHOfU3Y/BUT3Rpve9A0/SzFk
	62av01fwDer0pMJ9I1dACUTEkIpj6vw1btFF/+CMjW4lLWDeRoxW9lhFf7eZ/rFcN+xK4Bkuy3+
	/lNyxnAgQLA5F6GUtrCJuCkHKyv25vwebXvyxwlwURdLz93VovyIRcnLhUqSTxeYuk7+bQTI5n9
	6qUA3Y8EZzEfIDOg3dZWnD6or1JY7YI/vm73w=
X-Received: by 2002:a05:622a:8ca:b0:50b:51ad:35eb with SMTP id d75a77b69052e-50d3bc92052mr44872821cf.20.1775042996977;
        Wed, 01 Apr 2026 04:29:56 -0700 (PDT)
X-Received: by 2002:a05:622a:8ca:b0:50b:51ad:35eb with SMTP id d75a77b69052e-50d3bc92052mr44872441cf.20.1775042996527;
        Wed, 01 Apr 2026 04:29:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838dece4sm29084391fa.35.2026.04.01.04.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:29:55 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:29:53 +0300
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
Subject: Re: [PATCH v3 27/38] drm/msm/dp: add dp_display_get_panel() to
 initialize DP panel
Message-ID: <hiergjmqydw7lv6bqxvy3ahbccepv46c75e7on2gpjmk3qzivd@4vfbsz3lqe3b>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-27-01faacfcdedd@oss.qualcomm.com>
 <smvfckejheyi7oehubdkhnh6pxokn7yugvlrynraypsu6kssj3@6vinswn4yku4>
 <1698c35d-cefd-48b8-8776-c7deee000afc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1698c35d-cefd-48b8-8776-c7deee000afc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bfJmkePB c=1 sm=1 tr=0 ts=69cd01b5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=qqNhqcHm_pXtmdEkLVQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwNSBTYWx0ZWRfX63gTLERA+sO8
 aqGv4Z8vtfYk1i2qJDKU3iScOy6bxn4Pts8Km/VyTT+W//kmvEiFjbddDiNM6Fr80WRzG2t6yz+
 FvtZGduGBbNqLq4nBBQvRu0ztFv1UlUYfjjm1pjsTiL+EWIN3vucLGNpCWGfNujOCGUCha0VW2S
 uTjOXotfhfgs38+YJXQwNgBfgth5mMTlkEAuhk5xSFwtXoHKu9Qn3dA7qPtGzza98Wz51GLLgru
 nTmrtChwiezi5LZVwBsgDJKYIWMUlJWX3fvyvADhO1SadinMYWUFZ1lW/fTXbeCGvGn/U1LnTPy
 HBO8YkJKDdrx0JjKEX2JTa9moZf/nHcaHoDJk+uFNaeLuaPc8EERudpBeIAibOu7R8n7lSEQU27
 3h73iVGuqFBnlrnmANbj2rjtNuCmpc+jponpuskXGxgbT72vdfiabALPckptTDwxdjaaFaG4xKE
 a+EmHmzR7ZFtFO1aBMA==
X-Proofpoint-GUID: 31ENKGi65KoIoUS_yRQ6bSePd38c3tXU
X-Proofpoint-ORIG-GUID: 31ENKGi65KoIoUS_yRQ6bSePd38c3tXU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010105
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101328-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1697B3799C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 05:43:48PM +0800, Yongxing Mou wrote:
> 
> 
> On 8/27/2025 12:33 AM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:16:13PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Add an API dp_display_get_panel() to initialize and return a DP
> > > panel to be used by DP MST module. Since some of the fields of
> > > DP panel are private, dp_display module needs to initialize these
> > > parts and return the panel back.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
> > >   2 files changed, 25 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 84df34306fb557341bea288ea8c13b0c81b11919..abcab3ed43b6da5ef898355cf9b7561cd9fe0404 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -632,6 +632,29 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
> > >   	return 0;
> > >   }
> > > +struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display)
> > > +{
> > > +	struct msm_dp_display_private *dp;
> > > +	struct msm_dp_panel *dp_panel;
> > > +
> > > +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> > > +
> > > +	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
> > > +			       dp->link_base, dp->mst2link_base, dp->mst3link_base,
> > > +			       dp->pixel_base);
> > > +
> > > +	if (IS_ERR(dp->panel)) {
> > > +		DRM_ERROR("failed to initialize panel\n");
> > > +		return NULL;
> > > +	}
> > > +
> > > +	memcpy(dp_panel->dpcd, dp->panel->dpcd, DP_RECEIVER_CAP_SIZE);
> > > +	memcpy(&dp_panel->link_info, &dp->panel->link_info,
> > > +	       sizeof(dp->panel->link_info));
> > 
> > Both these lines show that link_info and dpcd belong to msm_dp_display
> > rather than the panel. The panel should only be describing properties of
> > the particular sink.
> > 
> I agree with your point.
> 
> This would require a larger cleanup of the panel abstraction, which
> seems out of scope for this series. Could we address it in a separate
> refactoring series?

I'd say, no. Or "yes, please send the cleanup first". I definitely don't
want to get more ugly code in the driver.

> 
> > > +
> > > +	return dp_panel;
> > > +}
> > > +
> > >   static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
> > >   {
> > >   	msm_dp_audio_put(dp->audio);
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> > > index b1ea027438d952c94f3ae80725c92e46c631bdb2..d5889b801d190b6f33b180ead898c1e4ebcbf8f3 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> > > @@ -65,4 +65,6 @@ void msm_dp_display_unprepare(struct msm_dp *dp);
> > >   int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp_display);
> > > +struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display);
> > > +
> > >   #endif /* _DP_DISPLAY_H_ */
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

