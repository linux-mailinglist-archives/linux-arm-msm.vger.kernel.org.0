Return-Path: <linux-arm-msm+bounces-51375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C48A60AFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 09:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D051D189F26B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 08:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FCC19CCF4;
	Fri, 14 Mar 2025 08:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AsUGAEfV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A6319CC27
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 08:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741940108; cv=none; b=Xpb+EP8JvzFPTvruU3nvKa2XungWzol2Oym81a+0hvbZaG18Lo2HqNmO5nOtdDCpU9LFCERlU3DKuBnJC06W9C5uSElH1m6oLP6fC0lJCF1IEgw1CXALSk8yyAe7nFpppuuII7dlN+M63Z//Q7xrDfI/D8YiFcEIOy6rmUaGzeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741940108; c=relaxed/simple;
	bh=OAhIZNH+NwxWcUF3ZMvIsTMpXV2WkIKKMp1OhqUYKOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IqQPeBmbNNJaQ2wOYPMp0NbEbI3d/8qgmwVah23IxS20SXH/1x+12vUG8Bbpg+Kiq1Nnm4Ol6evA/z4E3uvBE7pm3l3//4qzPS2dIGKKJi7kN6KMdgqslNsVZ4349UI1qzm2JX4Qbt0Nf4dFdZYnf6yhfYkNsFdnwhH9NUv6zAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AsUGAEfV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DKD9C1027567
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 08:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DqtW8RDacycHfcNKMQhz83i4
	AVNKZc2D7R5sR5m0cQo=; b=AsUGAEfVK8DZgLLHcFSbaOai/W6EhKGZFkSigMui
	qfucL5pVWpH0R32u67GGwt8cJcLwCUatBbduc2asm92aVxmILritkYn2jkSxP1Vh
	s/FCAvb/MwqV6ceC7nCj3laENBwNwRwjcNi7vU9jGUpjq8c8boI4U199bZW3qkCW
	kFJ6yR/KqRZMNrjtIYn1tbOlTFpPc3xUzfKHmNeYq3Lk2fpwSbzIXLbCOjSciJjW
	GpU/gOHNvokUpIcd7bIFJrVAdYPXvpVzGBXCik6n8r1qU/l6ueGJbMfJMBmIYKSc
	EtHx//9TbL/mcAaXE0UcXaj/PEKYBz+A7NkEE9ThpdlZnQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45c6731f81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 08:15:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8ff626b73so39127036d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 01:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940103; x=1742544903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqtW8RDacycHfcNKMQhz83i4AVNKZc2D7R5sR5m0cQo=;
        b=YjixFvRqQZ++IVo1Scjb/+h+CBv2vmbQ1b/jfeisZgMpknAFsIruqBSqqU6nsQrJ+L
         2C2pSvOv3us26onddCksxPrX9EIwswkvvhlCno2QFqhwNSdeMsdTNx4fjllbJpzhayD5
         PwIYam7liTfQQ+gc5fEQbeuzyxIVAy/8yOCM6ogCDSjswytr/8Gy4C7iYjynu4CoTfLN
         L+4BA24Mzb89M967mftAKLco2P9OFGX3E1GjbhW50M2GqV0rI8jRRbQfv6PG9tu9UUDM
         KslKj396PIRPhEp4fDgKSZGmNUDDTBkAMyeEe18Suz3jC3DXrX35gJ6tigyKujXK/rax
         NYhA==
X-Forwarded-Encrypted: i=1; AJvYcCVxVRQWRZAILHiE5xPVlxOtHXx4N/4c/chCNB4/TyL+ySMcp92tqbkXyIqsOQj9S5Dz5fAJUG6po3gBO2qd@vger.kernel.org
X-Gm-Message-State: AOJu0YyxjJ3MO7JAwlEF/HksRVQKBjzTfBotJFhUJDBT7jnzkUUpz1Uk
	8tsszOZkSqqN6+5VqPPM56HT5hFyju8DD5prvz1y2rvqA8X8t8HPycbCb5hXFrqRCeo+W1vrJDW
	5hYkOO/VD5i2ZefJG/Z7IIHsbocU1usUepjahrKyxIwqcClBE02uA8KX4Aen2J1K1
X-Gm-Gg: ASbGnctu2CDaW641vRepuV1irL+0bZHJSb+OiLHQzoOPBB9Bs5Gh/ZMpuYKuIr6ebzh
	pipToqwmOTL/xvhKkO+Be5VKhFlD+osR0+bgoAcoXnsiOUkbg9244/1aZn5ypGVFNqsEhLOYUZ0
	kH9+hooRn/98DVZ66P4S0C4tkhtPiPb8vf0teSh2rISSUKdCBX90IGFA0COXyu5hrao2403ROsv
	WSUslHQyvmtTyCVEAWHyRikvRNeXPpNGqkJNEVk37LEXBdfRBb/LQp/QtVvcoHDCGjPjx9Tr9xK
	CQP723JU4edQmIEnokUjuZ0+eqNyvjnIAibwJUmvI1JV7ME+qI4wRBPWtqzArs4ivm2/L4KVX+k
	Xszo=
X-Received: by 2002:a05:6214:5284:b0:6d8:b115:76a6 with SMTP id 6a1803df08f44-6eaea8317c6mr21497116d6.0.1741940103266;
        Fri, 14 Mar 2025 01:15:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj2tkyIWmtscgsM2aARcZXrZpbBHB97wS763CbqtaSYqoxqbUkEYoffLd/G7bQlYwjVtR+Tw==
X-Received: by 2002:a05:6214:5284:b0:6d8:b115:76a6 with SMTP id 6a1803df08f44-6eaea8317c6mr21496806d6.0.1741940102887;
        Fri, 14 Mar 2025 01:15:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7c301bsm445966e87.101.2025.03.14.01.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 01:15:00 -0700 (PDT)
Date: Fri, 14 Mar 2025 10:14:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dbaryshkov@gmail.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Hermes Wu <Hermes.wu@ite.com.tw>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 2/2] drm/msm/dp: reuse generic HDMI codec
 implementation
Message-ID: <4p23zsh6456kircoprno2wsk5ggx43z4ex22fyet5npr4v6e2j@24fffzac5vbx>
References: <20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org>
 <20250307-dp-hdmi-audio-v5-2-f3be215fdb78@linaro.org>
 <20250310-daft-bittern-of-foundation-67c657@houat>
 <CALT56yMSs7K_0b5YtkCW5Ypyt9Hu_YLkitFFJwTtBkwUJk-NHA@mail.gmail.com>
 <20250311-vivid-almond-elk-83fda5@houat>
 <ecw5wdvkf2iqwxvigze374q3lb3esqbokv43mkblbnpfmudutu@e75i4lqhuux7>
 <20250314-stereotyped-cerise-hare-cafb0e@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-stereotyped-cerise-hare-cafb0e@houat>
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=67d3e588 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=ODBsMxNuiVR1H87wWpcA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: puUPBKjDJn_se26yG__EOtxk5coz1t_L
X-Proofpoint-ORIG-GUID: puUPBKjDJn_se26yG__EOtxk5coz1t_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_03,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140064

On Fri, Mar 14, 2025 at 08:53:34AM +0100, Maxime Ripard wrote:
> On Tue, Mar 11, 2025 at 05:58:19PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Mar 11, 2025 at 09:41:13AM +0100, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Mon, Mar 10, 2025 at 08:53:24PM +0200, Dmitry Baryshkov wrote:
> > > > On Mon, 10 Mar 2025 at 17:08, Maxime Ripard <mripard@kernel.org> wrote:
> > > > >
> > > > > On Fri, Mar 07, 2025 at 07:55:53AM +0200, Dmitry Baryshkov wrote:
> > > > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > >
> > > > > > The MSM DisplayPort driver implements several HDMI codec functions
> > > > > > in the driver, e.g. it manually manages HDMI codec device registration,
> > > > > > returning ELD and plugged_cb support. In order to reduce code
> > > > > > duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> > > > > > integration.
> > > > > >
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/Kconfig         |   1 +
> > > > > >  drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
> > > > > >  drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
> > > > > >  drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
> > > > > >  drivers/gpu/drm/msm/dp/dp_display.h |   6 --
> > > > > >  drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
> > > > > >  6 files changed, 31 insertions(+), 170 deletions(-)
> > > > > >
> > 
> > [...]
> > 
> > > > > >
> > > > > >  static int msm_edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
> > > > > > @@ -320,9 +324,13 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
> > > > > >        */
> > > > > >       if (!msm_dp_display->is_edp) {
> > > > > >               bridge->ops =
> > > > > > +                     DRM_BRIDGE_OP_HDMI_AUDIO |
> > > > > >                       DRM_BRIDGE_OP_DETECT |
> > > > > >                       DRM_BRIDGE_OP_HPD |
> > > > > >                       DRM_BRIDGE_OP_MODES;
> > > > > > +             bridge->hdmi_audio_dev = &msm_dp_display->pdev->dev;
> > > > > > +             bridge->hdmi_audio_max_i2s_playback_channels = 8;
> > > > > > +             bridge->hdmi_audio_dai_port = -1;
> > > > > >       }
> > > > >
> > > > > I think I'd prefer the toggle to be OP_DP_AUDIO, even if the
> > > > > implementation is exactly the same. That way, we'll be able to condition
> > > > > it to the DP support when that arrives, and we have the latitude to
> > > > > rework it to accomodate some DP subtleties without affecting the drivers
> > > > > later on.
> > > > 
> > > > I don't think that there is a point in having OP_DP_AUDIO. There is
> > > > not so much difference in the driver. Also currently OP_HDMI_AUDIO
> > > > follows existing approach (which was pointed out by Laurent) - that
> > > > OP_foo should guard a particular set of callbacks. From this
> > > > perspective, OP_HDMI_AUDIO is fine - it guards usage of
> > > > hdmi_audio_foo(). OP_DP_AUDIO would duplicate that.
> > > 
> > > HDMI and DP are two competing standards, with different governing
> > > bodies. I don't think either have claimed that they will strictly adhere
> > > to what the other is doing, and I don't have the will to cross-check
> > > every given audio feature in both HDMI and DP right now.
> > 
> > Hmm. Currently (or before the first hdmi_audio patchset) everybody has
> > been plumbing hdmi-codec directly from the driver (even for DP audio).
> 
> We also didn't have an infrastructure for that before, so it's to be
> expected.
> 
> > > However, I think we should really have the flexibility to deal with that
> > > situation if it happens, and without having to do any major refactoring.
> > > That means providing an API that is consistent to the drivers, and
> > > provides what the driver needs. Here, it needs DP audio support, not
> > > HDMI's.
> > 
> > Would OP_HDMI_CODEC be a better name for the OP? (we can rename the
> > existing callbacks to be hdmi_codec instead of hdmi_audio too).
> 
> As said on your first patch, there's more to it than just the codec, so
> no, the current name is fine to me.
> 
> > > How we plumb it is an implementation detail, and I do agree we can use
> > > the same functions under the hood right now. But the driver is a DP
> > > driver, it wants DP infrastructure and DP audio support.
> > 
> > Would OP_DP_AUDIO require a different set of callbacks on the bridge
> > level?
> 
> Yes.

Okay, this answers my question in the thread for the first patch. Let's
go this way. Maybe once we have more of the infrastructure
implementation, these two sets will separate more and more, meaning that
you were right.

> 
> > I don't want to end up with too much of duplication. Maybe we
> > should the cdns bridges which implement both HDMI and DP functionality
> > IIRC.
> 
> We can (and we should) take the same prototype for both though, so
> drivers that have the same implementation can provide the same
> implementation to both.

Ack.


-- 
With best wishes
Dmitry

