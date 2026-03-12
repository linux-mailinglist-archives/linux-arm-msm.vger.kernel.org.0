Return-Path: <linux-arm-msm+bounces-97116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIEIGncrsmleJQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:56:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B936B26C825
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21EA43037423
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 02:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE53381B0C;
	Thu, 12 Mar 2026 02:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TONUR4jL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KsogxA8S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682631DF980
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773284177; cv=none; b=iqxwvKimt0EhpUGG6uL53Oz2MiaPWolKwYAfPihVzgJA1QhpPrhwd8UeS88F/tZZmTwwLqwBYQAHyhLQVPoEm1maf73RX5333T3Y+rXPjolr1b84crtmwoQHuvU0P2PffUaD1Qq7469axajKabUdGx0GYOiu47nUM0/9OYx6cgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773284177; c=relaxed/simple;
	bh=edprdrQR4YT4vi1KK9YsatBp5F0nw6fqZVWC3kibmGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuAEBJBgmuZjjCVkHRtkojL7HQcdzGQTbvogukMCx+eHtG4eoLEVt0dSHzLmvziy/q8aBkLqGNSSpH9pAeUtxn+FAwjw5a2daSRbBCCaUNX4b0Op8BONtWIKk/XNDUlxj2SWXHknU+EDNHPCJw0z2gbhk6t14lZWHtYikK5DQXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TONUR4jL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KsogxA8S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMPcQ23666499
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CaS8S9aUHDrYx8clFBYordXicK3e5CFLfY8m8+VQ7w4=; b=TONUR4jLZzzmZKeG
	bP/IoXRVkXXMC4NWZxJ1sVdAtn1LJgEEysnihlCztHZdkfn2p5UteiHoUOrjbUp+
	LnNM19pQcmdoV2vcN411QrDgpD82D3ChymhTapccp5y1SMACOdab766QtGt+suF5
	jufncALvgX4LDl+3mrDFcVXdWPnUNsxiVvWhdU8HHZEH05DbCIncvPwtG5kwMexs
	FBU2LAw0yu6MZLsbeUFz/APPh6J8RjYz6kt0l93MjVmnDCH1Ke+G7IdLywrZSLZ6
	o6P79VDY8Ko2Kd2xHbMTvLZqhrLLa9TaKk4FmtAymXbid0cKGk/TwGMD/VFs23F8
	WSt6zw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60gpka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:56:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7fc27cf7so289642885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 19:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773284173; x=1773888973; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CaS8S9aUHDrYx8clFBYordXicK3e5CFLfY8m8+VQ7w4=;
        b=KsogxA8SBK/F3v+Eud8b5oegCJmJ+Fhra9RLkysH2EiaQNNnMKJs8hnCpBZJO7aNpy
         b56HJeJs66YRKsEKesxJfPDxgw1izGOdvylejtb26cXlJgsOmvxF15mh6zwxaUK3li4G
         oZ+7da0Dpy8aflQlH2Q7HOVH7q8cS7pGrOvpLEHXauvI4Giiuqkymtap3eGG17XU6o25
         VuzvaS+aWWfG9uVGNePym2BHRBCKohlh/2J6+nyZgGG6GOv6YOeqvCxBw0Hz4pz4RgoO
         r4PkxF8uTm+E6SPVDUUS135NwugcYAK1xEo9A3YZAPKlDltGvwzyTQ1C/TuLNA7w8Tob
         nB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773284173; x=1773888973;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CaS8S9aUHDrYx8clFBYordXicK3e5CFLfY8m8+VQ7w4=;
        b=SHFRuSdVfmm2udEfkpvddkSzMeQNjATuxO98HBBfjI1Hsv2aI4Jh4kop6gvbAXsIbR
         hPmVdIoqkI5z6rhNeijJyttR1NK0cEerzn66dNolrIk98X0Z90oulOEZseF7FFj6TuNE
         JQ0o2bBvFqygrYxy+HuB1mgPiXDS4fLUMa8+DqIO7aIPOH0FvnTs/Y1LRPabfs8+vZ6F
         Xp8tfMWbIy9Q/sV1elFfY4EPUeTlNzHzZkPRAgqHcX3fMUI5DvjOgxxRHkoaMxtICcnV
         oEkLOMpoZ3jzzQZ3LOHukcaO0JziNvKOLQY0ec2nLfSt7few/HOH/+SmA4I7EFLo4+fE
         C2dg==
X-Forwarded-Encrypted: i=1; AJvYcCVFSJ7JxzFNeTqKs3QQ4VACxNpoRmHfQ8Vw9KQnMKVWlHoLOFQcPk5HG0ykIs/c3W3PUk0VIZ+SfKfJyeVb@vger.kernel.org
X-Gm-Message-State: AOJu0YwIxXiWnG+OUijwFPYL3Z9uSR7LBkT6PIDdzuDLCGGUuziP2FTz
	1RsOzN07Wb5/nWGYkvofqGD0OQi4duc7eryhMeKpB+I1h7zEhFCvJCBm2mPLshACLGIFW95Nc4c
	vCNGj2DfpywhwPAKP7a4BlFTknEWgZpbKLeBcSV7x3TfS4W9YMTqnRb1Hy8jqBXSFiMAX
X-Gm-Gg: ATEYQzzILX4ZHSV4ywhY4UwXY0WarivZQdUOF7P+ElAXOAq7eDxY9aHWIolwwlKoqB5
	7+jiiaOFWI+wvoXLUr54IQ7z4D5HUQY4Oirgq8zXpDVKpBdJQN2iniXVA/pDDmBLomt7EkH0I/I
	BktTDqee09/GIETne5VoCNNOGOq9n+x6kReXGphfThEhYxjWQVAHMXEmDL/pTy45oYwl3Mw1pch
	HZrMAUyr//AK12rfzVF7/+qffbmPB3fAHnphVe6yQ2lJWI1Ws4JGDoUtxFwO6IfFOBxfYbot8+o
	9uXONPUESWofkZw3WVRbGQQ/KsQKEGSnMSwEAddk1/c5kCKVkpeaLnJpGStxMGVltf+h9ENPaUM
	NEHHYhjvOiOWYE95NRJADdWFsZy/Q/jha8V6fLRI9SDiqV7J+HZTzBGIStIa898idRwersBV45t
	paznliP+paxslEKUbuOrS7krwjk9wMPIu74mA=
X-Received: by 2002:a05:620a:4104:b0:8ca:3d7c:e74a with SMTP id af79cd13be357-8cda1ac6682mr529120785a.56.1773284172653;
        Wed, 11 Mar 2026 19:56:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4104:b0:8ca:3d7c:e74a with SMTP id af79cd13be357-8cda1ac6682mr529118685a.56.1773284172119;
        Wed, 11 Mar 2026 19:56:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156373888sm678606e87.86.2026.03.11.19.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:56:09 -0700 (PDT)
Date: Thu, 12 Mar 2026 04:56:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
Message-ID: <yx3hlzxod57m7hpzhoa7pfoizvhqnfb5pgpvcfjmw7534irxuo@qqu5h3rsqakt>
References: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
 <20260213-msm-next-quad-pipe-split-v18-2-5815158d3635@linaro.org>
 <pufuo7jq4olww3ksyawqkoee34cl4fhtpfh3sh2kfuimajswod@gv4rp6wsnrhx>
 <CABymUCNu99=AYiMoKnFmwkdj6aPvxe+LA0yuC83kn+PMY=5fjg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNu99=AYiMoKnFmwkdj6aPvxe+LA0yuC83kn+PMY=5fjg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: RYCV5Y55RgSjgSJf57vklJbKcPYC7OEN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAyMSBTYWx0ZWRfXxOCQeX+SVkNY
 tgqL8h4u/vRfC0JF3knJAMMTfosE9+V296XkyuHjaqmkrX9gWx838rxB+Heo6n4HMkNTYuG6br4
 Y/l5XmNkwJK2h6g0vkNiv+3EYw5CIqqmXGm9oCXDIH0/44v5gKUOLYhionZAf6HGV2jUgNRejSl
 B+ezzdigtNvoZ6BH4TJ9NG9v0BF9XTSWNs9zstguCN9VpwOwnVo7XioEmULYFS6r9ClQ2gbodMe
 oHwmkEA60E3F7SgEJgX0bD3o2b3l1RWY8LrOA4uKxKMKnpHJ3gSMi5K9J8D2aop6/itddg7hlTO
 A7VU3oJkNbtlv7Rk4kfn8EIHvwyQrcVavF+OTaXOyZ3Pe3oXPUKSB9cLIIXjijrqmyoipJY0t78
 3woN7MqjCk8rVs+wCzy0bD79R/eZPcYegeIx0X2F9HlA/XHU5H/CtkKiNIdD/FJqKHXWDqmoP48
 W6qPaPc5aJD76fbOFkg==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b22b4d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=176EP3YSpx9NMtVRYv0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RYCV5Y55RgSjgSJf57vklJbKcPYC7OEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120021
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97116-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: B936B26C825
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 06:13:19PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年2月14日周六 01:03写道：
> >
> > On Fri, Feb 13, 2026 at 10:54:26PM +0800, Jun Nie wrote:
> > > Currently, mapping plane to SSPP occurs during the plane check phase for
> > > non-virtual plane case. The SSPP allocation and plane mapping occurs during
> > > crtc check phase for virtual plane case. Defer these SSPP operations until
> >
> > Nit: CRTC
> >
> > > CRTC check stage to unify the 2 cases, and ease later revisement for
> > > quad-pipe change.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   3 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 155 +++++++++++++-----------------
> > >  2 files changed, 66 insertions(+), 92 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index 6bf7c46379aed..797296b14264e 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -1534,8 +1534,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> > >                       return rc;
> > >       }
> > >
> > > -     if (dpu_use_virtual_planes &&
> > > -         (crtc_state->planes_changed || crtc_state->zpos_changed)) {
> > > +     if (crtc_state->planes_changed || crtc_state->zpos_changed) {
> > >               rc = dpu_crtc_reassign_planes(crtc, crtc_state);
> >
> > dpu_crtc_reassing_planes() starts by freeing all SSPPs. It should not be
> > used in a non-virtual-plane case. I'd suggest duplicating the function
> > and stripping out all code and data related to virtual planes.
> >
> > >               if (rc < 0)
> > >                       return rc;
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > index 66f240ce29d07..be1a7fcf11b81 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -1119,102 +1119,24 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> > >       struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
> > >                                                                                plane);
> > >       int ret = 0;
> > > -     struct dpu_plane *pdpu = to_dpu_plane(plane);
> > > -     struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> > > -     struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> > > -     struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> > > -     struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> > > -     struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> > > -     struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
> > > -     const struct drm_crtc_state *crtc_state = NULL;
> > > -     uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
> > > +     struct drm_crtc_state *crtc_state = NULL;
> > >
> > >       if (new_plane_state->crtc)
> > >               crtc_state = drm_atomic_get_new_crtc_state(state,
> > >                                                          new_plane_state->crtc);
> > >
> > > -     pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > > -
> > > -     if (!pipe->sspp)
> > > -             return -EINVAL;
> > > -
> > >       ret = dpu_plane_atomic_check_nosspp(plane, new_plane_state, crtc_state);
> > >       if (ret)
> > >               return ret;
> > >
> > > -     ret = dpu_plane_split(plane, new_plane_state, crtc_state);
> > > -     if (ret)
> > > -             return ret;
> > > -
> > >       if (!new_plane_state->visible)
> > >               return 0;
> > >
> > > -     if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> > > -                                           pipe->sspp,
> > > -                                           msm_framebuffer_format(new_plane_state->fb),
> > > -                                           max_linewidth)) {
> > > -             DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RECT_FMT
> > > -                             " max_line:%u, can't use split source\n",
> > > -                             DRM_RECT_ARG(&pipe_cfg->src_rect),
> > > -                             DRM_RECT_ARG(&r_pipe_cfg->src_rect),
> > > -                             max_linewidth);
> > > -             return -E2BIG;
> > > -     }
> > > -
> > > -     return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > > -}
> > > -
> > > -static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> > > -                                       struct drm_atomic_state *state)
> > > -{
> > > -     struct drm_plane_state *plane_state =
> > > -             drm_atomic_get_plane_state(state, plane);
> > > -     struct drm_plane_state *old_plane_state =
> > > -             drm_atomic_get_old_plane_state(state, plane);
> > > -     struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
> > > -     struct drm_crtc_state *crtc_state = NULL;
> > > -     int ret, i;
> > > -
> > > -     if (IS_ERR(plane_state))
> > > -             return PTR_ERR(plane_state);
> > > -
> > > -     if (plane_state->crtc)
> > > -             crtc_state = drm_atomic_get_new_crtc_state(state,
> > > -                                                        plane_state->crtc);
> > > -
> > > -     ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
> > > -     if (ret)
> > > -             return ret;
> > > -
> > > -     ret = dpu_plane_split(plane, plane_state, crtc_state);
> > > -     if (ret)
> > > -             return ret;
> > > -
> > > -     if (!plane_state->visible) {
> > > -             /*
> > > -              * resources are freed by dpu_crtc_assign_plane_resources(),
> > > -              * but clean them here.
> > > -              */
> > > -             for (i = 0; i < PIPES_PER_PLANE; i++)
> > > -                     pstate->pipe[i].sspp = NULL;
> > > -
> > > -             return 0;
> > > -     }
> > > -
> > >       /*
> > > -      * Force resource reallocation if the format of FB or src/dst have
> > > -      * changed. We might need to allocate different SSPP or SSPPs for this
> > > -      * plane than the one used previously.
> > > +      * To trigger the callback of dpu_assign_plane_resources() to
> > > +      * finish the sspp assignment or allocation and check.
> > >        */
> > > -     if (!old_plane_state || !old_plane_state->fb ||
> > > -         old_plane_state->src_w != plane_state->src_w ||
> > > -         old_plane_state->src_h != plane_state->src_h ||
> > > -         old_plane_state->crtc_w != plane_state->crtc_w ||
> > > -         old_plane_state->crtc_h != plane_state->crtc_h ||
> > > -         msm_framebuffer_format(old_plane_state->fb) !=
> > > -         msm_framebuffer_format(plane_state->fb))
> > > -             crtc_state->planes_changed = true;
> > > -
> > > +     crtc_state->planes_changed = true;
> >
> > Why do we need to enforce this? Previously it was limited to the cases
> > when the plane has actually changed and required revalidation.
> >
> > >       return 0;
> > >  }
> > >
> > > @@ -1261,9 +1183,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > >                                             struct dpu_global_state *global_state,
> > >                                             struct drm_atomic_state *state,
> > >                                             struct drm_plane_state *plane_state,
> > > +                                           const struct drm_crtc_state *crtc_state,
> > >                                             struct drm_plane_state **prev_adjacent_plane_state)
> > >  {
> > > -     const struct drm_crtc_state *crtc_state = NULL;
> > >       struct drm_plane *plane = plane_state->plane;
> > >       struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> > >       struct dpu_rm_sspp_requirements reqs;
> > > @@ -1273,10 +1195,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > >       const struct msm_format *fmt;
> > >       int i, ret;
> > >
> > > -     if (plane_state->crtc)
> > > -             crtc_state = drm_atomic_get_new_crtc_state(state,
> > > -                                                        plane_state->crtc);
> > > -
> > >       pstate = to_dpu_plane_state(plane_state);
> > >       for (i = 0; i < STAGES_PER_PLANE; i++)
> > >               prev_adjacent_pstate[i] = prev_adjacent_plane_state[i] ?
> > > @@ -1288,6 +1206,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > >       if (!plane_state->fb)
> > >               return -EINVAL;
> > >
> > > +     ret = dpu_plane_split(plane, plane_state, crtc_state);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > >       fmt = msm_framebuffer_format(plane_state->fb);
> > >       reqs.yuv = MSM_FORMAT_IS_YUV(fmt);
> > >       reqs.scale = (plane_state->src_w >> 16 != plane_state->crtc_w) ||
> > > @@ -1318,14 +1240,56 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > >  }
> > >
> > > +static int dpu_plane_assign_resources(struct drm_crtc *crtc,
> > > +                                   struct dpu_global_state *global_state,
> > > +                                   struct drm_atomic_state *state,
> > > +                                   struct drm_plane_state *plane_state,
> > > +                                   const struct drm_crtc_state *crtc_state,
> > > +                                   struct drm_plane_state **prev_adjacent_plane_state)
> > > +{
> > > +     struct drm_plane *plane = plane_state->plane;
> > > +     struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> > > +     struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
> > > +     struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> > > +     struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> > > +     struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> > > +     struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
> > > +     struct dpu_plane *pdpu = to_dpu_plane(plane);
> > > +     int ret;
> > > +
> > > +     pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > > +     if (!pipe->sspp)
> > > +             return -EINVAL;
> > > +
> > > +     ret = dpu_plane_split(plane, plane_state, crtc_state);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> > > +                                           pipe->sspp,
> > > +                                           msm_framebuffer_format(plane_state->fb),
> > > +                                           dpu_kms->catalog->caps->max_linewidth)) {
> > > +             DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RECT_FMT
> > > +                             " max_line:%u, can't use split source\n",
> > > +                             DRM_RECT_ARG(&pipe_cfg->src_rect),
> > > +                             DRM_RECT_ARG(&r_pipe_cfg->src_rect),
> > > +                             dpu_kms->catalog->caps->max_linewidth);
> > > +             return -E2BIG;
> > > +     }
> > > +
> > > +     return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > > +}
> > > +
> > >  int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> > >                              struct drm_atomic_state *state,
> > >                              struct drm_crtc *crtc,
> > >                              struct drm_plane_state **states,
> > >                              unsigned int num_planes)
> > >  {
> > > -     unsigned int i;
> > >       struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PLANE] = { NULL };
> > > +     const struct drm_crtc_state *crtc_state = NULL;
> > > +     unsigned int i;
> > > +     int ret;
> > >
> > >       for (i = 0; i < num_planes; i++) {
> > >               struct drm_plane_state *plane_state = states[i];
> > > @@ -1334,8 +1298,19 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> > >                   !plane_state->visible)
> > >                       continue;
> > >
> > > -             int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> > > +             if (plane_state->crtc)
> > > +                     crtc_state = drm_atomic_get_new_crtc_state(state,
> > > +                                                                plane_state->crtc);
> > > +
> > > +             if (!dpu_use_virtual_planes)
> > > +                     ret = dpu_plane_assign_resources(crtc, global_state,
> > > +                                                      state, plane_state,
> > > +                                                      crtc_state,
> > > +                                                      prev_adjacent_plane_state);
> >
> > This is an overkill for the non-virtual case. We don't need adjancent
> > states, we don't need the array of plane state pointers, etc.
> 
> Hi Dmitry,
> 
> For the array of plane state pointers, I find we have to use it in the
>  non-virtual
> case too. Because the logic is moved from plane atomic_check.
> The goal is to assign SSPP for every plane and atomic_check is called for
> every plane before this patch. dpu_assign_plane_resources here is called
> from crtc side just once so all SSPP assignments should be done in one call
> with plane_state in an array.
> Or I misunderstand your comments?

I'm stating that some of the args that you pass to
dpu_plane_assign_resources() are unused and asking to remove them.

> 
> Regards,
> Jun
> 
> >
> > > +             else
> > > +                     ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> > >                                                            state, plane_state,
> > > +                                                          crtc_state,
> > >                                                            prev_adjacent_plane_state);
> > >               if (ret)
> > >                       return ret;
> > > @@ -1772,7 +1747,7 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
> > >  static const struct drm_plane_helper_funcs dpu_plane_virtual_helper_funcs = {
> > >       .prepare_fb = dpu_plane_prepare_fb,
> > >       .cleanup_fb = dpu_plane_cleanup_fb,
> > > -     .atomic_check = dpu_plane_virtual_atomic_check,
> > > +     .atomic_check = dpu_plane_atomic_check,
> > >       .atomic_update = dpu_plane_atomic_update,
> > >  };
> > >
> > >
> > > --
> > > 2.43.0
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

