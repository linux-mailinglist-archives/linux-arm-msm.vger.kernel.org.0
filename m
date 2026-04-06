Return-Path: <linux-arm-msm+bounces-101957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOLyBpK/02n6lQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 16:13:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A68DD3A3D2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 16:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94DF3301AA48
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 14:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD8837E2EF;
	Mon,  6 Apr 2026 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HdgkMWQ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6NYWvHx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D40371D16
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 14:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775484786; cv=none; b=GnfWIFixoVBQ6EzlpqBiB5wRCZMcOg+e3DSjn+MWh8odvSWwJhMXbfT3gV4nrCcbbQ0JvJO64qV7jZAJWy/2tawsrBtcSDfMgndYx485TuQ8M1/e8DmoxZD1QPTgMjzCG/QZTeelff7xet/A8ceYyRVYV+f/5kucX8kESdrN288=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775484786; c=relaxed/simple;
	bh=Y9vzrfKbcjKYFg1mYMIY3XGHh4xYV/tTblsTpFS6yeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s27cgonm+9UAk+wKlhUJ1fmOisX8ZIfxe/z+xw5Y/ye5/4aV8URRFCa4yp3CidTUBAigjbtiuGytSiPNN38AxYgUSaELPoApm5SCYhOeNA9d5AQCOq7fjb0D4wWbcwWA9pGq1fG5qh2yZ48iP63blptZZa4KQUMPNZoX6t6q1YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdgkMWQ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6NYWvHx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636D63f61853897
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 14:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=beKnurAGjmh8PAnmXnrRZXOK
	+gGp3TW+AG3rkQ9JhPg=; b=HdgkMWQ5HR6r4ZBuJngKf0dnZ4AecP80hzsRzbOo
	tYVOkpSn2HOBtXCi6Wifd8fBHTvMmFSYEc2mTMsCyHCoXcJHwERlHCHH7Ywyr3t4
	nGZlE6aS390bIqmVmWyx9PfvQ7tFWw3ImbGUfieozp1jmNCaRQmCRexuXynswjIf
	o928vL3dR9PpJ82+uQ+MJuqnAbjRrtB6O32ajrPM1EZmNil5aLFz2ho5HjxoMN8A
	DY685cDRPGCi33mcols5PUmbGuj+V2cR8PCM73huh6RNm3zmVAkGPK8QF/ZMpwQg
	l+Oe2J0/YHGJPU7Nq+k/fR0wu+cmRnb++8VxdkklIY4ntg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7udd43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 14:13:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3547c799b27so1252945a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 07:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775484783; x=1776089583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=beKnurAGjmh8PAnmXnrRZXOK+gGp3TW+AG3rkQ9JhPg=;
        b=I6NYWvHxsyQU2yQ2WjIDiXW3wCq6bKj/LsUkBPe4DX/SgySng3aIO3hzwSYWLjf2eB
         fpee/ERxsGDQWSi5UWiqgdvHuvXDaa9ppbiEaVyCs152MCHKwO5wUBmN0N1QlofRwnDU
         7tmRdjgiCCYvRxqUUE9prgXgejwoZrIsNRZ1FHyOeqJ4TWgUMFi4FpvU/QmyKApV1uGZ
         fj76j5zdnObOxxrQJhSzfWV/dq9DUwfbmh2FwVNMhhxmC5Sx6/bZNbD5brr12H13Taz+
         7Eyr+SYMuCdCsGgGOTeJm+byWjc6moOa05uO4/jJpHMgea+kAzvYf8fzxhiZgNGUFL8P
         BY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775484783; x=1776089583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beKnurAGjmh8PAnmXnrRZXOK+gGp3TW+AG3rkQ9JhPg=;
        b=brh5gFqi5NBFZDy9HWCu6TJp+ppVQ7ukssfbfiXPtofSylCbkWzvUSyhFBO5Wdt24R
         p2ibdnlWi5o6uaolfTNXv5MFYP4l4LgI2czEYt6EqhnVM7kb/fCTMrNi//LDrL7JCHct
         +vxhGGrqwI2jBgb8BVL3H0bFtP6pHcuTXaWUU4IdaBUXyCai5EMeHb/4OcPFefZVUULC
         BghBHudbKfD8Tyc7XF3IX5goTFJt+M5tUOvHh+UYA/kjTHYZAOH3eqBKmIeP/c+mKvqI
         m8LuVtYRQ3FQmlVcCVuIKSiR0JUHtg80HjtaJvaSlu4yhfGuarPHAJPfRgXLHPchtJ3Q
         Culw==
X-Forwarded-Encrypted: i=1; AJvYcCWYqWmwE7aj2UdTX751rSKrx7iTGn6e8lfkevZL+xmds1MjWpxt0vm/vhXuJ4pfG0Nt7tS2ePZRTIs4ec5x@vger.kernel.org
X-Gm-Message-State: AOJu0YyU03iwVEo1QfE35oOWxxks1bNr31MqVrYSPN23F8RbyXPSnsQu
	HxQlP/36PsG6FshmX7ON51YhhJqz9YIFUAPPEyHl66WmteMog7bMazTDvO+HmnHB5kWhmgifjou
	Glr+qPAuFy+mmL6adI140tE6t3lqitt8MWFycV7bbuF4An4Z+DVjp/hWGpZFfZMNMwnZYihQZbx
	Cq
X-Gm-Gg: AeBDievQINdk9272IzB24PaUTzmDNxGivjJStOoV6zgn73jTvbHuukTfytGbewUBB+1
	xdFmzQsK5dSK1huQHnli0/iKlgyLeVY+Wcy/4Mae+l4j9vVwQ3Wf0/j518oBa/hxQHdkePZOnL2
	vl59rMj4gS3YZ7Bzqd1kkGyBEcszwEIyZQ42lmamhMy+yCGXMW9yY+Ii7eSzqTB08d6nvkDL2E5
	rCVY9DYHONJU6crBAooc6z+brf8ZqAGKpLwNl9Qs372okkCWAfk0fS9lu+K8/K8u4aM4RqNn9/s
	hx6CuB0KMLSsGc5SDYmasKgbVkZnAnDlGAnANBqGOItuauOf3E/QNrmsGJrK4QtNY0PsEcZoDgq
	W9R4OpJHXvkSiYT7glSm5U/2zHftRcVRjGbETRqUZBnOLKrcH2HtoEVy+mDe2U9jGxXeXF5fv0j
	TrN1cmSP5R8uIu4r/7ENJNGMur1yEp+l8rSDWLhHCcxg==
X-Received: by 2002:a17:90b:390a:b0:35b:e4ed:4f60 with SMTP id 98e67ed59e1d1-35de69a53ffmr7635501a91.5.1775484783352;
        Mon, 06 Apr 2026 07:13:03 -0700 (PDT)
X-Received: by 2002:a17:90b:390a:b0:35b:e4ed:4f60 with SMTP id 98e67ed59e1d1-35de69a53ffmr7635477a91.5.1775484782848;
        Mon, 06 Apr 2026 07:13:02 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe624756sm24171622a91.5.2026.04.06.07.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 07:13:02 -0700 (PDT)
Date: Mon, 6 Apr 2026 19:42:55 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com
Subject: Re: [PATCH] drm/msm/disp/dpu: consider SSPP line width during mode
 valid
Message-ID: <adO/Z0mJ5ocI8J1z@hu-vishsain-blr.qualcomm.com>
References: <20260328-msm-next-v1-1-12ac4e27c670@oss.qualcomm.com>
 <v37m6z5le4rk56b7pinr5wbi7l7s2bbgkggglx4eog6w7ja77f@lvyxc5tks2bs>
 <acrBL4fF4aiAw8m9@hu-vishsain-blr.qualcomm.com>
 <c7xvoopmujdmdar4lr5oghcc4olc72fpfrpe6yq7wrmtqaytjg@iweixftggvbg>
 <acrHj02HsaoK5N1b@hu-vishsain-blr.qualcomm.com>
 <sube4fl4iubrutg7wvdqcmdpuvia5bavmc5x5gajrngsrte6fj@nybmbjbcm6ma>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sube4fl4iubrutg7wvdqcmdpuvia5bavmc5x5gajrngsrte6fj@nybmbjbcm6ma>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE0MCBTYWx0ZWRfX61ECDZDEkstT
 J3i6QZxRnAitTFzewyobZOTnm65DG+wm/YblCorAfKUpOE/CK4OFcqt2TB/5R2dib6O7qS7te5X
 PGYTXvxGFnRFRrSQEJ+qFVfo0g9ZPwK/NT8DhrhvHOaH1j5+HQnn25tDqwB1EPgijzDCEaZDJ9o
 h3ndV1jLavdL7i2kuL+7UhlrTAaaxONtG3FpIBtiQjTQpULc9s9Sbiykw+3g6HFjPPD330Dl/3z
 Z5tm/yKYofi0OsKoEzdakc9dR5/rm0vsg9LsgQMcvtFNYg8TGXd0bklIPSHJXY8VwGlwU3W5qf5
 OOKbN3M+AK73WVSbxEv0gGLIToULBtPGuGEyppUndhxz9nDXAm/e+J6knyXgmNOvz9bOkRMh5PR
 3BxonyyPglV+hPZAmj67lZseAQ2vyxLKlJSnlNOukJTKi/B53G9IkbqbHXqpwlIEGBfKQYD13SC
 WABXxrvsmBgui7qtE3w==
X-Proofpoint-GUID: hSt1T3azf3QNc3ccwI5isCDroAbNdWGZ
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d3bf70 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=q32X2GtWTQ-4QQcc0HIA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: hSt1T3azf3QNc3ccwI5isCDroAbNdWGZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060140
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-101957-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,hu-vishsain-blr.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A68DD3A3D2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 10:38:15PM +0300, Dmitry Baryshkov wrote:
> On Tue, Mar 31, 2026 at 12:27:19AM +0530, Vishnu Saini wrote:
> > On Mon, Mar 30, 2026 at 09:39:31PM +0300, Dmitry Baryshkov wrote:
> > > On Tue, Mar 31, 2026 at 12:00:07AM +0530, Vishnu Saini wrote:
> > > > On Sun, Mar 29, 2026 at 02:24:53AM +0200, Dmitry Baryshkov wrote:
> > > > > On Sat, Mar 28, 2026 at 10:45:35PM +0530, Vishnu Saini wrote:
> > > > > > Few targets have lesser SSPP line width compared to mixer width,
> > > > > > SSPP line width also needs to be considered during mode valid
> > > > > > to avoid failures during atomic_check.
> > > > > 
> > > > > Technically this is not correct. There is no requirement for the
> > > > > planes to cover the whole CRTC. Nor is there a requirement to use only 2
> > > > > rectangles to cover the screen. As such, it is perfectly fine in
> > > > > mode_valid, if CRTC is wider than 2x max_linewidth. It would be an error
> > > > > if the user tries to stretch 2 rectangles in such a case.
> > > > 
> > > > This is to fix an issue with 5k monitor on rb3gen2, since SSPP maxlinewidth is 2400
> > > > it can't cover the whole 5k buffer in left right split mode.
> > > > Do we need to fix it from drm backend by dividing 5k buffer into 2 planes and 
> > > > use 2 pipes in split mode.
> > > 
> > > Quad pipe is pending for 7.2, most likely. However, I think, instead you
> > > should teach compositor that if the commit fails, it should retry with
> > > the lower resolution (it might require somethi g like -E2BIG from te
> > > commit).
> > Yes, from driver we are returning "-E2BIG" during atomic_check.
> > Thank you for the clarity, will try to fix it from compositor.
> 
> Just to point out: it's not different from the driver not being able to
> perform the atomic commit for any other reason. For example, if card has
> 3 outputs but can support only 2 concurrent outputs, then each connector
> will still have a list of valid modes, but trying to enable outputs on
> all three of them would still fail (or trying to enable high-enough
> resolution on all three, if that removes a possible question of limiting
> number of outputs by other means).

Thanks for pointing this out. Agreed, this is consistent with other atomic
commit failure scenarios caused by resource limits.
The compositor team is looking into this from their end.
 
> >  
> > > > 4 SSPP rects --> 2 LMs --> 3d_mux --> DP
> > > >  
> > > > > > 
> > > > > > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 12 ++++++++----
> > > > > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > 
> > > > > -- 
> > > > > With best wishes
> > > > > Dmitry
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry

