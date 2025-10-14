Return-Path: <linux-arm-msm+bounces-77237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 935F5BDA8E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 18:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 946D050143E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 16:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038212C0F64;
	Tue, 14 Oct 2025 16:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8d+RoYv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2472030171B
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 16:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760457731; cv=none; b=n7alY4dzqaxYX+HE6FCVlV6/0CniEeJmazd62vB8s5NYCwpigs1nd07cYNMbCFyyqeaVVhvLpE1enwQXwtF1TaYMWtkreMYja1BcRJighbyFIhAEhsRxqYUH85JqtNQzJU3jLJnHbiPgloI1uk32JPZr008bv6IS01JTpMOtRJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760457731; c=relaxed/simple;
	bh=uF+/wCYcx//ceD9Av3q4OSTvLHBt2QrWZbvx6lOV75s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ez7hUgm8NuwSGi4hX+MtNrA0pTqLLSYrm7ZdXiGA5rr/20KK5cI0e69H3kregjY+RRgPcyI3Aw2ABLJhQf+PTWGWgxksX3pgMS3oAusyb3qiNneUCkk97lrwVG6yo34Ci7V+HR3tOCqDLArLVWWD+Ao9hJe3GoIUDrkV+aXvQBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8d+RoYv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EFuVeI001484
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 16:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RIDTlMFsrNFSupa3j2HpAaCj
	j/tHU19+vRKipgxflMY=; b=D8d+RoYv2SKec5D8jKbm7NuvfVXZqqaa/GwmQ6aE
	sUgom710S9UPY91JnZdhu3MV9uSMm7AezppNgUxr0sD0+wKthsX8t/xVCYuuO9HB
	c/ao4tPKCqAN9pH5EkcXtF2/HDyp5mUDgg10c9t/lS45bDxmoVTu6fM9j1gF/3h3
	wgZLO5bjaX3fUvnyvjtLsxeQEyGkgI1seNX8Mv/sq3Di5lY44x4IaY+IXGbpLnUn
	d05SqnZ7V9IPxRJpmkcyFgUPztYt7C3c/wh+CK0fs2c2r6YfaZg60K5bhz5GxMsd
	0JvL1tSl/fTL7+enHjFpn3JGDeFi+43/fL3dB5L4oLLzCg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8951u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 16:02:08 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-555a199e5dbso42716e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760457728; x=1761062528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIDTlMFsrNFSupa3j2HpAaCjj/tHU19+vRKipgxflMY=;
        b=O+Xpg25/BWyf5D/HyWtfVIci2gXaLIetssvQS2fXTWK+PEl2ckUqp0Y6/VEPuL92W1
         /Wq0jyAGy+F9MHmhrifbUqp5a2bL0S32ZlVVQWqb18XZDwEHVuQ3M4xzvDVc/6ArYviP
         zmtxk8o4SSt9gBSjLWsvnV0d9cwrr5MCNH9Z3nFbUUpeYEmV4zFd/yQg+hBjqrlaDQQu
         ESJByOcrVbGo4PG+HmvXENx6HAVmSfEACet+Ngtv0eNTril1qOwrA89ji3/S8K/KJWLq
         cjFqkWAl5muhrT5PE4PTBRgwVWWcav8OHxy1ho8cZTRyex/Ihl2vBxZfonx7Fwjk1j39
         co2g==
X-Forwarded-Encrypted: i=1; AJvYcCUgoUUNFCgIy6KYjn5FoaKRGd3f/xkxheRCcWodF2ISqUpT/BcOb2qHWrYppDaw2j4unOXWU9f1psVVLoU6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa9oIPTUr50N37sNofRpE7qtsBnqs04qbC02TcTpwWnAZ6oGvi
	ZPnzjyEzpzoKvCMSgTOEqSlH8c0eqSfUGsGibbB44jmYPsF5dCgWy8bY/1aoNMN0pqut6M4dkyG
	cTwOIU0lEFHoZwzNwN+yI9AStEjYw31s1uNSlxpePhnBBWYr/lMWaQLJx3oxEbaT2AB4C
X-Gm-Gg: ASbGncsRYvY57pccnJGGVXMC4h3+Vyr9X5/tmSg4EZD0aZtuRwFRVyZ1w+QV5b/Ay4t
	kHJL3oq96tyrG/q5jyWP9kgRQTC5HW1tbxYJDQJes0RM/FdsCY3guJtEmjR4g0A1p3/Xj/xo7PX
	WaGXhu0n6XbtgLMiNZFwGcrHWQdttNcMMXLxd2EVJG19/6UeXwVrjdlcUUx2QmjYj3y5XgYGAQC
	ZkOEo+ExHdMwxk2vLngRqLTnAEW47wr5KK16mzxyvkQsWUYrpG5ithWuXStEsn7wABARFJzx61z
	mg8Myb1mAR8h0lVqcGiHDwQJeejORXziQuFP+eZ9ZJP5mH3swaTz+14qDKwOxQ4bUysXWt0u/ZQ
	+qwO9s5hbvnwI8H9fqjs+QR+Z9fpxuJAjO+EUFjrQw8LEjUomEn2H
X-Received: by 2002:a05:6122:e1db:b0:554:e726:7818 with SMTP id 71dfb90a1353d-554e726a88bmr2893416e0c.2.1760457727478;
        Tue, 14 Oct 2025 09:02:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiPVWLHJ62y1HXmozGHeu5tMGTb4MD+todBa4lunYFYoGko1Yp2FhdNfFEHzjjvK5KiwAUsg==
X-Received: by 2002:a05:6122:e1db:b0:554:e726:7818 with SMTP id 71dfb90a1353d-554e726a88bmr2893311e0c.2.1760457726794;
        Tue, 14 Oct 2025 09:02:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591c8779e8dsm60095e87.10.2025.10.14.09.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 09:02:05 -0700 (PDT)
Date: Tue, 14 Oct 2025 19:02:03 +0300
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
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
Message-ID: <ez6y7q4lgbwt7kpnlpausjpznckr3yyejrwtxm7o6qw6wlhqoj@6iypzdhfthzy>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-furry-singing-axolotl-9aceac@houat>
 <z333ysst5ifakomo35jtbpydj44epqwwn4da76rcnsq4are62m@32gsmgx2pcdi>
 <20250925-didactic-spiked-lobster-fefabe@penduick>
 <jfxtcvh4l5kzyv74llmzz3bbt6m4mhzhhwl6lh5kfeqgqhkrhi@jzfvtxpedmyf>
 <20251003-primitive-sepia-griffin-cfca55@houat>
 <54a06852-4897-4dae-ab9c-330d99f3bf42@oss.qualcomm.com>
 <5cc5l2dihgdbgnwyugelwrklpaiiy5yaczqllu4bi6asvlt354@kib3flskh34g>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cc5l2dihgdbgnwyugelwrklpaiiy5yaczqllu4bi6asvlt354@kib3flskh34g>
X-Proofpoint-GUID: WgQCsrhKzYsVLl0XpHIMQTqIecvdtTgr
X-Proofpoint-ORIG-GUID: WgQCsrhKzYsVLl0XpHIMQTqIecvdtTgr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX1boZsmgv/fzO
 suQJLz1axYX2/3u8bVk1wTmPj2neJxRjEZdEaS17QIOfO2fjTpjQrI2sTVzAG0YYQqfTCM4mXpa
 1Nb/hZuWXUoKr6X15E0oNVnDvrH1oDW+8fhu9/giblbX1OSUJgT8oXaVZBbzu1tTotQlnpHLVyv
 fmIW4trpYjWYWcQwKXtGsXoDMmlcsmxDN9QMGUdP2lV7kARJqYMm9VpDiRk/IWg1qoI9iqQh9r0
 Nf6NtEMucJ/YcbYH2V60gdMYUhypxUNVE5uLQErCNHMvBCazdZGDI7ullzLjp5VKRB0bICbGzSZ
 Wq9xkZpMXdkBlgyV+wyXs3Sbbj2COIFE5iGWHsWh3yj8AfFpC5gCwZVl9RcZmwhsXzHQwwGHAe1
 vaZ+n3e+cbvIal/kIZ/d9I4GolrqHw==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ee7400 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=6RWEyACVIll58Qch3D4A:9
 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On Tue, Oct 14, 2025 at 02:43:58PM +0200, Maxime Ripard wrote:
> On Fri, Oct 03, 2025 at 06:41:58PM +0300, Dmitry Baryshkov wrote:
> > On 03/10/2025 17:23, Maxime Ripard wrote:
> > > On Thu, Sep 25, 2025 at 05:55:06PM +0300, Dmitry Baryshkov wrote:
> > > > > > As we will be getting more and more features, some of the InfoFrames
> > > > > > or data packets will be 'good to have, but not required'.
> > > > > 
> > > > > And drivers would be free to ignore those.
> > > > > 
> > > > > > > So, no, sorry. That's still a no for me. Please stop sending that patch
> > > > > > 
> > > > > > Oops :-)
> > > > > > 
> > > > > > > unless we have a discussion about it and you convince me that it's
> > > > > > > actually something that we'd need.
> > > > > > 
> > > > > > My main concern is that the drivers should not opt-out of the features.
> > > > > > E.g. if we start supporting ISRC packets or MPEG or NTSC VBI InfoFrames
> > > > > > (yes, stupid examples), it should not be required to go through all the
> > > > > > drivers, making sure that they disable those. Instead the DRM framework
> > > > > > should be able to make decisions like:
> > > > > > 
> > > > > > - The driver supports SPD and the VSDB defines SPD, enable this
> > > > > >    InfoFrame (BTW, this needs to be done anyway, we should not be sending
> > > > > >    SPD if it's not defined in VSDB, if I read it correctly).
> > > > > > 
> > > > > > - The driver hints that the pixel data has only 10 meaninful bits of
> > > > > >    data per component (e.g. out of 12 for DeepColor 36), the Sink has
> > > > > >    HF-VSDB, send HF-VSIF.
> > > > > > 
> > > > > > - The driver has enabled 3D stereo mode, but it doesn't declare support
> > > > > >    for HF-VSIF. Send only H14b-VSIF.
> > > > > > 
> > > > > > Similarly (no, I don't have these on my TODO list, these are just
> > > > > > examples):
> > > > > > - The driver defines support for NTSC VBI, register a VBI device.
> > > > > > 
> > > > > > - The driver defines support for ISRC packets, register ISRC-related
> > > > > >    properties.
> > > > > > 
> > > > > > - The driver defines support for MPEG Source InfoFrame, provide a way
> > > > > >    for media players to report frame type and bit rate.
> > > > > > 
> > > > > > - The driver provides limited support for Extended HDR DM InfoFrames,
> > > > > >    select the correct frame type according to driver capabilities.
> > > > > > 
> > > > > > Without the 'supported' information we should change atomic_check()
> > > > > > functions to set infoframe->set to false for all unsupported InfoFrames
> > > > > > _and_ go through all the drivers again each time we add support for a
> > > > > > feature (e.g. after adding HF-VSIF support).
> > > > > 
> > > > >  From what you described here, I think we share a similar goal and have
> > > > > somewhat similar concerns (thanks, btw, it wasn't obvious to me before),
> > > > > we just disagree on the trade-offs and ideal solution :)
> > > > > 
> > > > > I agree that we need to sanity check the drivers, and I don't want to go
> > > > > back to the situation we had before where drivers could just ignore
> > > > > infoframes and take the easy way out.
> > > > > 
> > > > > It should be hard, and easy to catch during review.
> > > > > 
> > > > > I don't think bitflag are a solution because, to me, it kind of fails
> > > > > both.
> > > > > 
> > > > > What if, just like the debugfs discussion, we split write_infoframe into
> > > > > write_avi_infoframe (mandatory), write_spd_infoframe (optional),
> > > > > write_audio_infoframe (checked by drm_connector_hdmi_audio_init?) and
> > > > > write_hdr_infoframe (checked in drmm_connector_hdmi_init if max_bpc > 8)
> > > > > 
> > > > > How does that sound?
> > > > 
> > > > I'd say, I really like the single function to be called for writing the
> > > > infoframes. It makes it much harder for drivers to misbehave or to skip
> > > > something.
> > > 
> > >  From a driver PoV, I believe we should still have that single function
> > > indeed. It would be drm_atomic_helper_connector_hdmi_update_infoframes's
> > > job to fan out and call the multiple callbacks, not the drivers.
> > 
> > I like this idea, however it stops at the drm_bridge_connector abstraction.
> > The only way to handle this I can foresee is to make individual bridges
> > provide struct drm_connector_hdmi_funcs implementation (which I'm fine with)
> > and store void *data or struct drm_bridge *hdmi_bridge somewhere inside
> > struct drm_connector_hdmi in order to let bridge drivers find their data.
> 
> Does it change anything? The last HDMI bridge should implement all the
> infoframes it supports. I don't think we should take care of one bridge
> with one infoframe type and some other with another?

Note: I wrote about the _data_. So far the connector's write_infoframe /
clear_infoframe callbacks get drm_connector as an arg. The fact that
there is a drm_bridge which implements a callback is hidden well inside
drm_bridge_connector (and only it knows the bridge_hdmi pointer).
Otherwise, the bridge, trying to implement drm_connector_hdmi_funcs has
no way to go from drm_connector to drm_bridge.

The only possible solution would be to introduce something like
drm_connector_hdmi::data (either void* or drm_bridge*) and use it
internally. But for me this looks like a bit loose abstraction. Though,
if it looks good from your POV, I agree, it would solve enough of
issues.

-- 
With best wishes
Dmitry

