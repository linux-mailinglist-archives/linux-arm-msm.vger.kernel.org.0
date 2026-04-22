Return-Path: <linux-arm-msm+bounces-103995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGBRDV0Z6GnWEwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:42:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A903D440E83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF9E3302AF3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 00:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2CA61DE8AE;
	Wed, 22 Apr 2026 00:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYX2TgIR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b68sxAEk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA041D5160
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776818519; cv=none; b=iwJRoFJiwDnGElBwnFiPiefsTZMjneGdD/x+HoZx0exlbu3ZCQ0cVxS91PHAojMetWP1yLiDMBqVmnqg8eyAO9SJoV9yrD5hytJrMBZrfO9mGe1L+jOLZk4HuekE6Cq2U4oet75rw/RJp22YCC0zHjDsHGJSRA5Mjv+UIXY9fW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776818519; c=relaxed/simple;
	bh=5fVLdqQzOU+8tPyh8d++PMOJoQEos2DcpaquX6cu3no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gi61VehKI75iY4rq7tNW0ZVZjQMGNOoKkDJfcwfT4MkeQ0f5lLLZfgOBWlaD4U7jR+XcV6CkV7GwQZD51JD6oS6OlW9rGIJgztDNMAdXCPim0LR49e2r3Y0Ujm9auBKs3y80+6yn7knGSWNn43nG6fTgdbzmaIPUg66GtQRWcpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYX2TgIR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b68sxAEk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZi4U2965802
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWFZ6UPtBgUL1cM3Hkcd5gB9edDFjp543O1vZEAy9ec=; b=mYX2TgIR0PqYmd4j
	vaBIqX132I/5S70N9rb7N+1wbblqO6z5cgh2+h1Nfg7hW3PgPKpDmzVTDn8nx99Q
	9Abt6yxioPBvn+6Te185N8452UixmpHrMRaX+iamzqZyoLtq2NqibX9wAxKNDiqv
	rQPGNjjq9L3Q4Aws/UxdHCGN14RlFOB0AJAywDRmj2qZCKp0Dsacw9Z/+hBVtaoR
	Lj+nx7i1iAKs/afcoWpoTacrRXxZubCLaCXhqxNOsMs5C2r44hdv72jEhW/HaOoX
	g+sUASPu6us7zqCATCnl4vI9xpO8PpQmbY7zXUtYJu10SZgW1d6r2Vw3vVrUyYHs
	sx0BKg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfgwba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:41:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d654ade33aso229471485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 17:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776818516; x=1777423316; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWFZ6UPtBgUL1cM3Hkcd5gB9edDFjp543O1vZEAy9ec=;
        b=b68sxAEkE1aE3vQpUl7ucpeW90Cb9RICHoKn6gmst+uwAN1AIEHQIsplNvYPs7JOPF
         7OtUvqmZk+oIO9jy+tioyNnN/SlKY93wDFAcOfI34f71nolu0+e3YbpRnJx/5siAcFjZ
         wvRmHrFPVOv7NVxT8zCP/eZKsVxImP+xiZh3dUjhUv6oepfQJFuEx2KjCH5V6oPbkVBh
         mjGg3nqGXRxD3l2XxVVVZbx2sK2VtKRcDzJaIDvKauQqsIn/JYU3/WlF7QW+hTmJq3G5
         hq0vR7zrow8dwTEJaowbIqG7bILRSf5u0TZiYCdKAYvhLhO+1vbV0YVx0qL5cpGwvuZk
         d06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776818516; x=1777423316;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AWFZ6UPtBgUL1cM3Hkcd5gB9edDFjp543O1vZEAy9ec=;
        b=RT7ZILaWvcZxXe5rOwyTrizqVeO+zNEosYR5AmZHL5ZW4HNm4Wkuul5YLTKhvgQquH
         VexSHjmi18AuApbP6obGmF3cdimhpK2Gg1y/HkhvVP+77dHzOW5Ki6f/SxdnDvfv3fiI
         vhjLwlJwYjrrNlBJ5HIk/HMEzVF5VjUmP8GNX8O857t7argTQnteb5e1Ci2IKUU2wmot
         HvH5l3hwi77Kts/P8uEJ4/hoFyKfym7fbB8eiIPVpw1mQ9Rx2siYWes3VAcxL8ThT/1L
         uQNUwB1QILRYNpwsGDzfaewQBSNFaLeAcX8LsO7DeUe1yr2UN8H4n2/8nk6HcPvgzv2o
         2JeQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fkEE0iJu+SInA9UwYVCMKjPom5Pm95ulDHpMvh3u4VStBPer4G0SSv/k3uvfXBS3Nfpo2ECqrR1sI4f1e@vger.kernel.org
X-Gm-Message-State: AOJu0YwCphCMkoJzUQCH+PEDVCtMHFXjFW2r3BLEkNKbUFOaP2zsmKug
	b2BTwZVPbVDfeJuBQkjV+tw8c0HZHtPh/cGvmA1ufSsjaNXRaaZGVOXJWpkPoPjL/Qw5VKfxbf9
	FTilVxCtrahdHKjvnfn83mdtNdVFZ2oZttY4Fdk911bVxHF9UOBlqXL5X/Sv2F51aNugv/mTFD4
	dB
X-Gm-Gg: AeBDievXqGzSGUfqCGRfv6KzGVuTlu0/TTfJisR7KgHk/rKokcswxouDoWQEVeO0Dyk
	tiBiZoys+fqp891Gf4HB/dLeDcr2xXdHOUBZNEPW5sTX6qTHsdg5Q1Z+k2xVnZpDVt5QLrfJTj1
	LQ5tfLTMq5tbJg26Id8uStttWONHNanVLXSQzcvu0ASqoC1FgDY/J86faFc4MFEoy39qFj3uxYm
	FAPwYKP/ZfyfIrJpzdGvf1/nyggax2J8oTUYQjrwuj7uE4bz30fUKSfxEp90pWEPPYb02OcJ/MF
	/FJW2MGDZ5nYCuhFLHr0gGlqKxohaeOStz8fx4FBYrHlmi7Mr3uC/1NSrKGff4AVKlIJIKZvU3m
	NAKe4bafO6gW1mFyoABI+fQ7OxGnJqdWz12LdFPmF/jSZnjMNmZZgqn1Bc141cw/Rvk5cNW/7qo
	tYHm9mvE0M2GBNmahhq9vkQKsmBq2k9OCE+FkQaV78BbfygA==
X-Received: by 2002:a05:6214:2267:b0:8b1:f2e9:2996 with SMTP id 6a1803df08f44-8b1f2e93452mr78549846d6.15.1776818516069;
        Tue, 21 Apr 2026 17:41:56 -0700 (PDT)
X-Received: by 2002:a05:6214:2267:b0:8b1:f2e9:2996 with SMTP id 6a1803df08f44-8b1f2e93452mr78549546d6.15.1776818515641;
        Tue, 21 Apr 2026 17:41:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad0adsm4035894e87.11.2026.04.21.17.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 17:41:53 -0700 (PDT)
Date: Wed, 22 Apr 2026 03:41:51 +0300
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
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/13] drm/msm: Remove obsolete perf infrastructure
Message-ID: <cczwmaecg7h5lpuw7mi6n6k2zu3lqisrkqybavxe4h6wlrofkg@qcmf7eq3siaz>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-2-robin.clark@oss.qualcomm.com>
 <sidcsgvqxddatwwflohsd6gjzm5ehbs4alwaejh3pnjnlhj7vm@nqxhdtxxxizs>
 <CACSVV01TK+iLiaCofFfPU2eeMGT5HX5iW0rf=m+gjojXsjrk8Q@mail.gmail.com>
 <puvvx2h2jnoxej42blcdx357uzx37ogwnqldcynklmm4acameg@4zvnrueodcon>
 <CACSVV01D388voqDxmfOm_qhV3=H+F3YW2oUjzZT7MfKYwjapDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV01D388voqDxmfOm_qhV3=H+F3YW2oUjzZT7MfKYwjapDQ@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=Y6rIdBeN c=1 sm=1 tr=0 ts=69e81955 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=UOJWCEE-UvdaTPQNjZYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAwNCBTYWx0ZWRfXwb2wVg3xTuMx
 UQf5U9oh6iNIYXrLmnjKTDN2jR7bodxAvYx5oFrXtjQNuu4IPis1o85w3795lgjVJYj63SlEEWW
 jpRfQo9TjmrHog1x26trLDMJix54q9YfDgZtSekDqZy7NxUb0PnHCPSmqmeZ5OOYuulQYd9hx6m
 JKaUiCW0+5ikxys/ryu+uKQhakBCh5BmRG7Ly9h8qX2SJxNrzIG4lNTQst3zUGWUGM1Q9pcwI+/
 qAHOV99OM1ECNeWSKIp+RPLKNSzc/QYUrMlCl/bvxdfV7SPDQs7d3ZuuW3XtK4C6snfsT4w1gEj
 3Esg07zH4uOT0+e5T7+CsktnMgUlFSbaDsQqa+hQXsqVjQo52M4qfGXLPIExN8JPR+tOzgRyPPW
 v7epn+Cj2uAvHdv3AAXVukfVGcS5gameBqSxQAxr3xV7ZGMlmiMTCubwXOXJJoKGTTfAU/VOblP
 0jjDy410mfbaC1zlNgA==
X-Proofpoint-GUID: GlyI-ofDmSzRtebxyNeWSCMdZl-hyPy5
X-Proofpoint-ORIG-GUID: GlyI-ofDmSzRtebxyNeWSCMdZl-hyPy5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220004
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103995-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,gitlab.freedesktop.org:url,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: A903D440E83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 01:48:40PM -0700, Rob Clark wrote:
> On Tue, Apr 21, 2026 at 8:39 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Apr 21, 2026 at 06:07:20AM -0700, Rob Clark wrote:
> > > On Mon, Apr 20, 2026 at 4:49 PM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Mon, Apr 20, 2026 at 03:25:23PM -0700, Rob Clark wrote:
> > > > > Outside of a3xx, this was never really used.  And it low-key gets in the
> > > > > way of the new perfcntr support (or at least it is confusing to have two
> > > > > things called "perf").  So lets remove it.
> > > > >
> > > > > This drops the "perf" debugfs file.  But these days, nvtop is a better
> > > > > option.  (Plus perfetto for newer gens.)
> > > >
> > > > Would it be possible to resurrect "perf" later? It was really useful.
> > >
> > > Nothing is impossible.. but I was having trouble naming things with
> > > both old and new perf stuff in parallel.
> >
> > That why I wrote about resurrecting it later, once the new stuff is in.
> >
> > BTW: do you plan to get perf counters for a3xx-a5xx back? I remember
> > that there was some issue with a2xx ABI.
> 
> So current state on userspace side is that only a3xx/a4xx are missing
> perfcntr support..  although it looks like we know the countable
> enums, so probably not hard[*]
> 
> In all cases, the existing userspace-only support will continue to
> work.  The main reasons I omitted a2xx/a5xx on the kernel side are:
> 
> a) Not really sure how to do the Makefile bits.. since they wouldn't
> be using a6xx.xml.  In meson I can use a table (2d-array):
>     https://gitlab.freedesktop.org/robclark/mesa/-/blob/fd/generate-perfcntrs/src/freedreno/registers/adreno/meson.build?ref_type=heads#L20

I saw the comment in the commit. I'll take a quick look.

> b) No good setup to test

We probably need to figure this out...

> c) They don't have IFPC
> 
> They could ofc be added later.  The main urgency is a8xx, since I
> don't want to add mesa perfcntr support without PERFCNTR_CONFIG (so
> that we don't have an older-userspace, new-kernel permutation on
> a8xx+).

Sure.

> 
> I don't remember about a2xx ABI issue.. but a2xx perfcntr stuff was
> added after I was already busy with later gens.

I might be completely mistaken, but I think the issue was that the
kernel didn't reserve one of the counters for its own usage.

> 
> BR,
> -R
> 
> [*] there are some counter groups that had some slightly different
> config programming, like separate clear/enable regs.. which I haven't
> dealt with yet.  For a6xx+ this only matters for some counter groups
> (VBIF/GBIF, maybe GMU?) that userspace doesn't care as much about.
> Idk if that was true for the earlier gens.  Eventually I'll add a6xx+
> support for these counters, but there are a few other things to deal
> with first.
> 
> > > Is it really adding value
> > > over nvtop?

And I skipped this question. Yes, there is a value, when developing /
performing early testing. Running tail is much easier than having an
extra tool in the initramfs (we don't have nvtop recipe in the OE, maybe
that should be changed).

-- 
With best wishes
Dmitry

