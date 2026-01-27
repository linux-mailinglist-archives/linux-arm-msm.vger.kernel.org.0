Return-Path: <linux-arm-msm+bounces-90727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KhBCf+eeGn4rQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:18:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6613893793
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E878300691D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A123469F6;
	Tue, 27 Jan 2026 11:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGUQjWgB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hVvsg2EV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F5430C600
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769512689; cv=none; b=KbJkpXzIiJwDIFjCHqj9l2nrU282d0aVQyFP2fgUEiXnbySaUKvAs2IdnuW+LspGu04n6Pg5QaB1dnuQF2QSmi9aJ3M9zon70SCz7wa2qXa4vNu3ztj+BHlbaHmTbKQSaoH8COrX8caVW3VKwzLbV/gKAJqLIm9XVHYTyZL2eWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769512689; c=relaxed/simple;
	bh=az8YxCf9qh85mqD9aCUcl8H6yg0q+rv22nYlZVvTYxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qh7D3KjQ4GF5FKknHDsZ8mrUYaw66KsTfBYfXjGRaFwzOC6MDBivxYcQImuVvYEklDJa+9H4uemiQAZski49v8HcuK+A8QdgjJvyOD5ntQ89RhYFy3Se9NC+D1r2mfzkGs2lwnhybY6xkkWF4+HbLuVY8xV9sMUeZY+J4GYab/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGUQjWgB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hVvsg2EV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RATCqN3715067
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5xnQobEIb3PTCiTRAm6iLAFohZ8k6yzMVc57xfyF6Qg=; b=VGUQjWgBR6noPd30
	leOieDCXmP2JFK77aWaBCmrsCzt8AERkdSo7AvT1omojqsB5c/7OTKSL+e/kNqeV
	zKoF/LWZ7vEuSBmV8xjc63CwCrDdDvfUetJAKY6EG3mmtmV3gy2PbBqisEeL6GOB
	+gRbcmDgZcqT+zVMUSB7/ZjGcm5buVd4XcaILgOP6hu07tYc300G2r0nzGXImvPw
	fodJZvJLCuIdaGP4Gnxd90TSreZ0B195VYYvgZfmVsl1N3RJ1DA+VBBr2QfS64zx
	XoOj5VMJ2QdGKvtvz4vY0/1QbXeLxfsbqA5EP6/rLcvZciI48RnKMIDFaspdp9eg
	3f/VxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0ary2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:18:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6cfd52556so1482608085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769512686; x=1770117486; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5xnQobEIb3PTCiTRAm6iLAFohZ8k6yzMVc57xfyF6Qg=;
        b=hVvsg2EV84n04tmG12XSNhs/TNbOYCwlfkGNOVKrd0SAjWlUIVp7DQ+mK2LxDGhvvu
         Rdx/YC4SS3CDMnmBTDMAxAxuelNFxDHMJdXuN1QSnsK5N9qCDos3gxrf71gni1YiSWOJ
         Lehs/SiBlxHL2GxEp5S9swdQ/ahMj3Z8LwUSPN2gDjM4OPa1/lAk+cpUZpZr6n6Wts6I
         ImvHH3nNNyFQhPd5Sm1BWTuOfUj4ANe6oVWdHW6bMh1nFlqkIYA2tLYFek/gIJtY+ws8
         /XVbZtIHqZJa6ALLc62jAiIBWRbz2D/mOG3oHh4YouOiuxAQSjJEoGJB6l911Llzj8Gs
         ovng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769512686; x=1770117486;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5xnQobEIb3PTCiTRAm6iLAFohZ8k6yzMVc57xfyF6Qg=;
        b=tfec+EY74ppTMiZgwcFUKbI6WUWOz1GcGNf3apqHUhSvAtCd1xBwtQNt1/tG33yQbI
         ZJWNILj6j9X3Y3N8eWBIV72D0mbK1Re1pAAMg2BzorOPVnJxNELOkFVA1A3nSWJPE7N3
         668mjOQDEaCuCD9MfXN31CyUvtSW3qWHzoUiNrvw16eVxSZ3Oxc2pRPWlDwrSUWFm3Nh
         pshRP45z4pf95WozG7rlbTNFDOsg/XO+kz9ltzYO6HFzb2xPS8lyLtlH0s32djLS9uXs
         EpbbUIK5G+/VOaiNS+4dnIRqA6ZvY4P2YwKIo2g6XLd7HNnZUKgIHDKFiZ/DQvs+Rj+c
         q9sA==
X-Forwarded-Encrypted: i=1; AJvYcCWW5UxCAvqDbr/hX2eLMLFSe9AJ6m/SEvqXPa+3qsoOp5AE454LK5eOql3Ywp9Blh0vxyKmKN6KXkboLX0r@vger.kernel.org
X-Gm-Message-State: AOJu0YwkfgV9qn18xr4ytbah4nFspdUAKGWIy4ZNpZUrH9XuDwLFAAyT
	00vA/LpQPtMwxMK/N7C4DYdIKP4rm5+FSWayMTzwmZafEgqXMtoaH6IAAV/XtwTJKcwPUjmqfeP
	F26c+TVOmmOWHSWtSmk/zIGJxJd++BOYr0zKoJNwb+I1zkYclWdbsx9bnPWYVvzBHV0MR
X-Gm-Gg: AZuq6aJf9tlWxdHBQXEL8+uFiT8YVaNBV9wu0g9WfR79AH5HBmrVXnQgq/UdSjfPJZo
	SQCjC7RtMBOtYMCtZ8wjxTuTqt4eFU9d/55f/pursDiwNITDbgpVhrNlxdZekgeZs1vJUDcJz9Y
	C3vyKcRJajvS5eeVEiSftoJw3ahD4iMINW2WXG+ZJvTJrKJAqifujZUk5F/+JMsfYHgs9TWuYQa
	Xis62lZIxXqXnaMIr2KZrl2N+I45LAl5LuID0UfGLj5H/jGFEI9Sx5iCEz86GfypwqDQMvZj5NC
	BxI3mkQ0b3R+hku+DgN1DHZXqHFzLmf2Wk1pb7D6E6vVWd3obwc8e9OPpD+uLLvUV01QPMep0OO
	mDK3YRoOYHpY0QPBVa+M6xIsbZTcbGKMuG7G1MEIlXmf9gFeNLfQ28QJ+ab2Ky0VPX+jLgPJNO6
	PWwbmMhojMQXJSb6DZvA1d+hU=
X-Received: by 2002:a05:620a:2a09:b0:89d:b480:309f with SMTP id af79cd13be357-8c70c17d2eamr106849785a.7.1769512686207;
        Tue, 27 Jan 2026 03:18:06 -0800 (PST)
X-Received: by 2002:a05:620a:2a09:b0:89d:b480:309f with SMTP id af79cd13be357-8c70c17d2eamr106847585a.7.1769512685738;
        Tue, 27 Jan 2026 03:18:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da01d635sm34904291fa.21.2026.01.27.03.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 03:18:05 -0800 (PST)
Date: Tue, 27 Jan 2026 13:18:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dpu: try reserving the DSPP-less LM first
Message-ID: <ci7m26yyzojptbfzengfhuudhqbofmljkxbraufpsnlvnzl7us@35hmb6vjabjp>
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
 <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
 <33424a9d-10a6-4479-bba6-12f8ce60da1a@packett.cool>
 <whko2yur7tgutr4qhlbqfrvpcdg7hkyw66koicqvpvfhk55c7z@saj2uxrduv4z>
 <ff0c70f3-62aa-43f5-a437-62aae5b84e9c@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff0c70f3-62aa-43f5-a437-62aae5b84e9c@packett.cool>
X-Proofpoint-GUID: bDt8yw1zXPVNAUZN6yuArsBnM3RiqA1j
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=69789eee cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bVB5Ggzyottavkt8X-EA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: bDt8yw1zXPVNAUZN6yuArsBnM3RiqA1j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5MiBTYWx0ZWRfXwjK30S53ao4e
 W0Mutcwr+JNOQNsT/Nv1AYZSV3Yehhw8ANkBgQkzrKzu5Ll0VbME7JfWuuTxNxOTI6Ut8M3Oxf0
 C8qt5bBVZnd72xtg0p1GWMxv1ZxHGKMGBwDmAeWTbEV7YA19yx1R8SGE6UhbXaG6couYcVmYFJT
 xJeNhOqsJE73FV/GYcL3mjDccMVXQs6EKr2YSjDRUURvKoOx4v06OOCOkzbvMyRqnajsrgx2YjQ
 3fybnUi/l7zBMVQRL+kyU7bSl784Osbc0d2C3yN1YH3X1TSd+M42dNd1azPG/5tqoTFLEs2pryr
 a/wdeuJ9Ou3E8H7CwQDSzRRh4JQbkjUTq7ak4uxzMDlXB8tW+PxbRAWzgArYfEnSY+VieHSyKIc
 TvJzQI12OqcO4whc4lVu7Mc1cnRjQWCAF2aaRe940bgddtcLMHpnX5UrqiAR9mNJgK9lQ9hbA/v
 GEzQDe4qlV2dGZ8eRJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-90727-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6613893793
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 07:59:34AM -0300, Val Packett wrote:
> 
> On 1/27/26 7:34 AM, Dmitry Baryshkov wrote:
> > On Tue, Jan 27, 2026 at 06:43:32AM -0300, Val Packett wrote:
> > > this has massively broken things on my x1e device (latitude-7455):
> > > [..]
> > > Reverted only this commit and it's back to normal, so I'm pretty sure it's
> > > this.
> > Interesting. Could you please capture the dri-state (only the last part,
> > resource mapping) with the external monitor attached and with this
> > commit reverted?
> 
> Just reverted:
> 
> crtc[106]: crtc-0 [..]
>         mode: "2560x1600": 60 280710 2560 2608 2640 2720 1600 1603 1609 1720
> 0x48 0x9
>         lm[0]=0
>         ctl[0]=0
>         dspp[0]=0
>         lm[1]=1
>         ctl[1]=0
>         dspp[1]=1
> crtc[107]: crtc-1 [..]
>         mode: "3840x2560": 60 631750 3840 3888 3920 4000 2560 2563 2573 2633
> 0x48 0x9
>         lm[0]=2
>         ctl[0]=1
>         lm[1]=3
>         ctl[1]=1
> resource mapping: pingpong=106 106 107 107 # # - - # # - - - mixer=106 106
> 107 107 # # - - ctl=106 107 # # # # - - dspp=# # # # - - - - dsc=# # # # - -
> - - cdm=# sspp=# # # # - - - - # # # # # # - - cwb=- - - -
> 
> > Also, could you please run another check:
> >   - revert this commit
> >   - comment out LM_2, LM_3 in the catalog
> >   - try the resulting kernel with the external monitor
> 
> Commented out:

Thanks! I assume external monitor is working fine?

> 
> crtc[106]: crtc-0 [..]
>         mode: "2560x1600": 60 280710 2560 2608 2640 2720 1600 1603 1609 1720
> 0x48 0x9
>         lm[0]=0
>         ctl[0]=0
>         dspp[0]=0
>         lm[1]=1
>         ctl[1]=0
>         dspp[1]=1
> crtc[107]: crtc-1 [..]
>         mode: "3840x2560": 60 631750 3840 3888 3920 4000 2560 2563 2573 2633
> 0x48 0x9
>         lm[0]=4
>         ctl[0]=1
>         lm[1]=5
>         ctl[1]=1
> resource mapping:
>         pingpong=106 106 # # 107 107 - - # # - - -
>         mixer=106 106 - - 107 107 - -
>         ctl=106 107 # # # # - -
>         dspp=# # # # - - - -
>         dsc=# # # # - - - -
>         cdm=#
>         sspp=# # # # - - - - # # # # # # - -
>         cwb=- - - -
> 
> Not sure why the dspp= line in resource mapping doesn't show any numbers
> when a crtc has dspp[0]= and dspp[1]= o.0

Ah, it might be confusing. The crtc-N blocks shows that LM in theory has
DSPP blocks.

Resource mapping shows if the DSPP is actually allocated (aka used for
the post processing).

> 
> But with LM 4+5, gamma control doesn't affect the external monitor.

Yes, that's expected.

> 
> 
> ~val
> 

-- 
With best wishes
Dmitry

