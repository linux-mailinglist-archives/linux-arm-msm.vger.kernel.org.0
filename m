Return-Path: <linux-arm-msm+bounces-71469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A874FB3F296
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 05:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FDB14847FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 03:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E592DECB4;
	Tue,  2 Sep 2025 03:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HALbmYUS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A325B286D69
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 03:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756782767; cv=none; b=d7n566Y+QKzp3G0ww7b5v8QKTi6ywKpGm5Y/NdJcM5Zw4F96Xi1nxknehGshZjUhexazRapdNZy2JVcGxZSPvPNCWOu3steF0KCMrOL5oDgQ7Crda9NFBqlF8UpMtwFzrt9eUXI9QNabTrc1G3inOjyFCjYI3CnFcW1v3t29PiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756782767; c=relaxed/simple;
	bh=LyuCkfkvJ9T5+4mAYiEMVBipa2WkizYSRznZnXQiFYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E40lZnTTw34u1qkcyOyMARc9pYzcRQ2LWX+W8WALPD1MH/S0VAjW3RG1A00V7kfJfcHxXS71+Pcib4j5PVTb8j0ENCVNHF/kHdlINUHfn/ZXDnxln0PReWodkTAXYW28ilkesREW3zxlBMEJfLMVHZbjGAIrc4cwwALDpC0lrcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HALbmYUS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SKWG030313
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 03:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6lbDWXEgEqXhch4D00V6FHkz
	octzi7I+pGhatlsXg5g=; b=HALbmYUSYmfADHj+OKudStXby6SIFOf0cIKkYT1A
	vn8vl33kl3VesRmBYBfRvj3vwjbZ+UeGt/Cg0VL4mBi+IIoX2+ECFdyg85saPcMj
	GKtufC5IsBWP1NK1f7m8d/X7s69F85SVPZmUqUkAFtFaG5Il+fxzIs49pFkC0u8e
	aREgMEIzTwTMY31L7uxBvyfv/qFZzm7VFMIG+NK8EfhaKi8NhnyEnhMJxxQp0+Gj
	FALG/CoNAXhTtivgdFblA5APkrXERWH5r3SscEaEK2FTr3hlB3IcW4gpQPWrkuJ0
	vG70vmAbR65rSGd4AuDp2MQHgMULihwax3e3yYpcI+yGKA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy24fh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 03:12:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70fa02d10ccso53115416d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 20:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756782764; x=1757387564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lbDWXEgEqXhch4D00V6FHkzoctzi7I+pGhatlsXg5g=;
        b=dSaJhsQv/EJ9+aRj1dPa1kQY+tZXkiioXqPCUU0EYvLr7xYM48qWPaGjU10FqYtLbV
         O1TUSFxP+CqbJBzfC1eSBiagceiNvLquUvoQKEO6H64L0ulwrpw+N9yG46Q0eD49e02D
         DqzkEY9rGe988jCIPLzXt/Pzicm15KyUEW5D7lVo4ciAk7/ax69/r0RmtD9/7CG4Jdhb
         eK+wdSP7wgMyYehOJEM7pm/yyJOCH78lTub9rd8/FeQzCpT1DTcEqqQEO93zMjrAlIzr
         m5IKv5xtHXSVjgkM9B8NhDUBZqCw28RxTrOejL0zTCYiSAEqvmRe2cicYG0151QmEA8o
         IobA==
X-Forwarded-Encrypted: i=1; AJvYcCXzo517mlWML5sqm1a/w0FszGvuwQc9kZG/VX4rEcyd/oYYqYmvESgg+5QT0r3hQHnxb7KP9zMhNOh6NBOy@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ1NCLLk24U21TAHtc8Mx3J8ePNIpFjNY/vfjiU1lidZti74dh
	aUPXFZYI8QFRcKZfYmBaw4SKgBc7iErBey2D0kPJ7CUjcE+Vk84hUP+ywBZzdRu2hNi9HS8OI4W
	JnxSXN/Q6f8LDXLgOsz5UrAQkYA9EYeUGGngNlUQtWuL9GhIRC8h3JzwwER9zpyDoVZjb
X-Gm-Gg: ASbGncsj+2YMFGOKeSszWOqYE7AoGv9HHZXuRxE87Rhq9uH6eXVAuBvAiQZGsUCy5kW
	Qy28RNCsypxVtCiKbF/p/XkUpB6FpmwLe6oO+vnUShIwneVRfJ1liKTR5mJgksPwsPwWr7sMh4f
	6+x1iin8cQ7PVWNmcjLv9US0PMf5eq5FGmkHq5WKMnj4DN42Y5a2LT46KmljMZVQzKNer9tANux
	0JpyPuYnbZ1AxVCDMrUP5nl43RyNXlTO4H7HSTzTIJMMYqkzV4NuiEHyjDDWA8t28T77oPECT2F
	CeE6tR8t63YA5UxttLijie6hR9xICkLgpiFxbQ2D2+lC2OUEkeHLgEULWXQsEMVDPzzsK+wQjD5
	rdhbJTfFLLh1cJn/YmAxbXK3P2ky40MfJAGA0Bco0QPAI1PB8napR
X-Received: by 2002:a05:6214:5195:b0:70d:f30d:926e with SMTP id 6a1803df08f44-70fac75a8d4mr95814686d6.15.1756782763436;
        Mon, 01 Sep 2025 20:12:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh+aJ/m5oTiwm+rskkcePX5cAOyjDOxdmOvAbEJz1ZfqKko/eqgSi/7Mh11qb5m3SqAxkBDw==
X-Received: by 2002:a05:6214:5195:b0:70d:f30d:926e with SMTP id 6a1803df08f44-70fac75a8d4mr95814496d6.15.1756782762755;
        Mon, 01 Sep 2025 20:12:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560827b3dd5sm312381e87.148.2025.09.01.20.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 20:12:41 -0700 (PDT)
Date: Tue, 2 Sep 2025 06:12:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/8] drm/connector: let drivers declare infoframes as
 unsupported
Message-ID: <rkxdyzm4uwvq5nxw5q25qv2xqqqvirgn77u54jydebm6a2wrk3@m2y3y3zcjb4j>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-1-7595dda24fbd@oss.qualcomm.com>
 <20250820-artichoke-silkworm-of-election-521b5e@houat>
 <v7w7xkefm6ap7delx7wsvxmc76fwptqhe4ehokzfh4baueb7hr@acrx36exv42v>
 <20250827-adorable-ocelot-of-adventure-ba88b7@houat>
 <jrvjvayhjczgb4yx3xshbv3e6ndzkmb7uu3ynoes2maniwjg37@hamxu5mzqmf7>
 <20250901-illustrious-dark-kagu-f4ef76@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-illustrious-dark-kagu-f4ef76@houat>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b660ac cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ZZMQJF9JEhsP1qjey_MA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: XHpVptu9kuJyOdDDmKKRzClVBsGtNwyD
X-Proofpoint-ORIG-GUID: XHpVptu9kuJyOdDDmKKRzClVBsGtNwyD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXz7Zf/UuQKN1B
 kHpwFmt/QK/hwMCopnKGFCmqVnrVJWV/DMx+MjHUX2wOuK/USjxx87m350+aZzfDh1xkeNd5A9b
 alVVWMywBs0+8vstKzJGJl4B6C8jdvOxiIKGWCNivu7YidIEgiFSx9oSzpeBmlGRIX4zHKpW8gY
 uIYi52DrGGAQ1q5Uj+c1wGTheyw/SHL4eI7EnD8gg0gI0L8b4vyRG4RhBX8KpWdHLSPzEcpzhEZ
 ob7ddwUHL23B3Wax3rm/VDMAdlzC0+xQY2tiUua1lURgAEJXRDravGXbgcVfpAJbU06Z2qlVr0V
 9z6Kq+uj+eWQRa5uWu+xdh9dFKVpeTWmaOYFw7GHdZCUGg6ptHACGP6ZyRR3zYf8shsPClBxAjt
 POoRc1pf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On Mon, Sep 01, 2025 at 08:54:18AM +0200, Maxime Ripard wrote:
> On Wed, Aug 27, 2025 at 05:04:53PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Aug 27, 2025 at 09:30:20AM +0200, Maxime Ripard wrote:
> > > On Wed, Aug 20, 2025 at 12:52:44PM +0300, Dmitry Baryshkov wrote:
> > > > On Wed, Aug 20, 2025 at 09:15:36AM +0200, Maxime Ripard wrote:
> > > > > Hi,
> > > > > 
> > > > > On Tue, Aug 19, 2025 at 09:57:30PM +0300, Dmitry Baryshkov wrote:
> > > > > > Currently DRM framework expects that the HDMI connector driver supports
> > > > > > all infoframe types: it generates the data as required and calls into
> > > > > > the driver to program all of them, letting the driver to soft-fail if
> > > > > > the infoframe is unsupported. This has a major drawback on userspace
> > > > > > API: the framework also registers debugfs files for all Infoframe types,
> > > > > > possibly surprising the users when infoframe is visible in the debugfs
> > > > > > file, but it is not visible on the wire.
> > > > > > 
> > > > > > Let drivers declare that they support only a subset of infoframes,
> > > > > > creating a more consistent interface.
> > > > > > 
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > 
> > > > > I'm not really convinced. Infoframes aren't really something you should
> > > > > ignore, AVI is effectively mandatory, HDMI kind of is too, AUDIO is if
> > > > > audio support is enabled, DRM is mandatory if HDR is used.
> > > > 
> > > > Nevertheless, sun4i, innohdmi, adv7511, it6263 and rk3066 drivers
> > > > provide support only for the AVI infoframe.
> > > 
> > > Yes, but it's still something we shouldn't paper over. The spec mandates
> > > it, if drivers want to deviate from it it's something we should warn
> > > about, not silence.
> > > 
> > > sun4i is a good example, to me at least since I have the doc. The
> > > hardware supports AVI, Audio, ACP, and SPD. HDR isn't supported, so DRM
> > > isn't either. The only missing one is HDMI, but the documentation isn't
> > > the best so it might still be supported. In short, it's a driver issue.
> > > 
> > > adv7511 supports AVI, Audio, ACP, SPD, ACP, and looks to have a
> > > mechanism to send any infoframe as is. So, again, driver issue.
> > 
> > I've send a patch, enabling SPD and VSI (HDMI) InfoFrames on ADV7511.
> > 
> > > 
> > > I couldn't find the other datasheet, but I'd be very surprised if it
> > > wasn't the case for these too.
> > > 
> > > > Some of them can be extended to support other infoframe kinds (e.g.
> > > > ADV7511 has two spare infoframes which can be used for HDMI and SPD).
> > > > 
> > > > > SPD is indeed optional though.
> > > > > 
> > > > > So, it's really dynamic in essence, and not really something we should
> > > > > expect drivers to ignore.
> > > > > 
> > > > > I do acknowledge that a lot of drivers just silently ignore the
> > > > > infoframes they don't support at the moment, which isn't great either.
> > > > > 
> > > > > Maybe we should standardize and document what drivers should do when
> > > > > they don't support a given infoframe type?
> > > > 
> > > > The chips might be generating infoframes internally. This series was
> > > > triggered by LT9611UXC, which does all HDMI work under the hood in the
> > > > firmware. See [1]. The series I posted hooks HDMI audio directly into
> > > > the bridge driver, but I'd really prefer to be able to use
> > > > drm_atomic_helper_connector_hdmi_hotplug(), especially if I ever get to
> > > > implementing CEC support for it.
> > > > 
> > > > ADV7511 likewise generates audio infoframe without Linux
> > > > help (audio-related fields are programmed, but it's not the
> > > > infoframe itself).
> > > 
> > > Implementing the write_infoframe hooks as a nop with a comment in those
> > > case is totally reasonable to me.
> > > 
> > > I'd still like to document that drivers should only return 0 if they
> > > programmed the infoframe, and -ENOTSUPP (and the core logging a warning)
> > > otherwise.
> > > 
> > > That way, we would be able to differentiate between the legimitate
> > > LT9611UXC case, and the "driver is broken" sun4i (and others) case.
> > 
> > I don't want to end up in a sitation where userspace has a different
> > idea of the InfoFrame being sent than the actual one being present on
> > the wire.
> 
> It's not ideal, sure, but also, what's wrong with it? We're doing it
> *all the time*. Modes programmed by userspace are adjusted for the
> hardware, and thus the mode reported by the CRTC turns out different
> than the one actually used in hardware. Audio sampling rates might not
> match exactly what we're doing. The quirks infrastructure disables part
> of the EDID the userspace has access to, etc.
> 
> And all those are under the userspace control, which the infoframes
> aren't.

I think there is a differnece between 'change userspace input',
'knowingly mangle data' and 'lie to userspace because the driver doesn't
care'. This is especially important e.g. if a user is trying to debug
AV issues which can be caused by wrong information in the infoframe.

> 
> > It seems, we need several states per the infoframe:
> > 
> > - Not supported
> 
> Honestly, I'm not sure we need a state for that one. If that infoframe
> was set by the framework, then the driver must support it. And if it
> wasn't, then there's nothing in debugfs.

Yes, I ended up dropping this and having two separate flags.

> 
> > - Autogenerated
> 
> Do we have any way to read them back on those?

Usually not. E.g. I don't think I can read back Audio InfoFrame on
ADV7511. Nor can I read InfoFrames on LT9611UXC.

> 
> > - Generated by software
> > 
> > E.g. in case of ADV7511 we can declare that Audio InfofFrame is
> > autogenerated, AVI, HDMI and SPD as 'software-generated' and DRM (HDR)
> > as unsupported. LT9611UXC will declare all (need to check) frame types
> > as auto.
> > 
> > This way we can implement the checks and still keep userspace from
> > having irrelevant data in debugfs.
> 
> If the only thing you're after is to prevent inconsistent data in
> userpace for devices that can generate it automatically, then I guess we
> could just implement an (optional) callback to read an infoframe from
> the hardware when reading from debugfs. Would that work?

As I wrote, this is not always possible, so I'd skip this.

> 
> > I will update my patchset to implement this, but I have another question
> > beforehand: should we just declare VSI support or should it be more exact,
> > specifying that the driver support HVS (00:0c:03), HVFS (c4:5d:d8), etc?
> 
> I guess you're talking about HDMI 1.4 Vendor specific Infoframe vs HDMI
> 2.0 HF-VSIF here?

Yes. H14v-VSIF vs HF-VSIF.

> 
> If so, the toggle should be HDMI 2.0 support. We'll need that toggle for
> other things anyway (scrambler, YUV420, etc.)
> 
> > I'm asking, because e.g. MSM HDMI controller has hardware support for
> > generating HVS frames (but only HVS, the OUI is not programmed, register
> > format doesn't match 1:1 frame contents, etc). I instead ended up using
> > GENERIC0, because it was more flexible (it's like SPARE packets on
> > ADV7511, the contents is being sent as is). However if we ever need to
> > send DRM infoframes, we might need to switch from GENERIC0 to HVS, for
> > the price of being unable to send HVFS frames.
> 
> Section 10.2 of the HDMI 2.0 states:
> 
>   Transmission of the HF-VSIF by Source Devices is optional unless one (or
>   more) of the features listed in Table 10-1 is active 1. If such features
>   are active, transmission of the HF-VSIF is mandatory.
> 
> The features in question being 3d.

Or ALLM. It's not on my todo list though.

> So unless you're supporting 3d, suppporting VSI only seems ok to me.

MSM HDMI controllers can support some bits and pieces of 3D. Nobody
bothered to implement that though. Maybe I should try getting a monitor
which supports stereo output.

-- 
With best wishes
Dmitry

