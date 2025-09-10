Return-Path: <linux-arm-msm+bounces-72992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED62B51826
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 15:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0EE7176613
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 13:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D9F31E0FC;
	Wed, 10 Sep 2025 13:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMj36H+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2FB31E0E5
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757511800; cv=none; b=QnOEsE+143BQW9qOsqDR6B1QSS+8jbjSFQHcciC/AJfy5gu4JZY9GYWKlKzDWeDhq5Ie+9E8yMCyUF2H05GEbwC+Y8Dszw0oeCEYuiOi7sohhzn+FTCu1tgepSoRpASZKRZ8fhd/fWUVTJEex1CTW7WeKV88klcD1EH75ghTfbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757511800; c=relaxed/simple;
	bh=FaoC9FE73l9rVXL86nM2CVRZSz8t/nV5eIPjehZkKRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shXpBWknmIXKNRsssccejUNpOvMOVddLpSm7XfmWKWOdyagr9u7pQpiUpkalg7qio10tAaEZUBB69M92c+TQ88BUglhfhwq+i/kJgRH1BpBmWiul37o8PTtQ3GGgyP6jt3SrkYJ5WJ3Pfqrf7G1D5wp5iI1WkAMiItWYcfoUrow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMj36H+T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgFJo020853
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 13:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5nQ4xWao/W1S9JuuivQg6TVz
	V1TXFvvS01+Hu/ewF2o=; b=CMj36H+TbjJBbjGtUj0Ww+XkCiSfcr453ccD4RI3
	hTtPq14K7WLeczHyI3OgAOvTURohBosbgyEm6KyyTR1RRzEjx7OtROVcxmf8UQLP
	0VKsVvp8OptJoxAa45jIjayw4Rwpnz5wXobNCFeoYDLZb3nZdYV95mTZUZwToUDO
	qW/9hCsr/xLIau/U8M2P76aKr/mPj0RtK5OTWevRpYpqqqYNkJCG3pQOJxM0n6oG
	UrIwfu6uMWp5ZqJjKH3ssj53PvqM6DXgXBWp2n3qp1ab9yS+3PK3cuzipo0xtLJR
	kdomeuFiz78IGAYiv5uzR7f4OsOvt7AbGymNwg/318RmmA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc281fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 13:43:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-81eb0cbeda0so106196985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 06:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757511796; x=1758116596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nQ4xWao/W1S9JuuivQg6TVzV1TXFvvS01+Hu/ewF2o=;
        b=NXzbjsWCGnZ04Tof605D8OuyW0Q6MoSOftul8nN6lqTQvuaeXccZbRVnwkXx6rKXNS
         YlVCs0ZjhrMzF06W2VEvC1VuC7FuBgv7Qtwb25vyJur3/ypWUPKEEIdesYgwrffNK+Qr
         2/GUanwV5sVGuCFN3Qrx5nnCePhP/GkxGJt5vwrfjPz2dTRBK36TSo3SCPP2RRL6Hd4D
         f7ARv6mZtKW6fyJc2vJMUEcHo+5pF4R+lNj1e3+NG7RyZ6lvPxoFc6eSTIsuIkh4MbkT
         qWxyqcInWWoHh19EqUYM9r7AojGFRGVtll60c4oCH3AesLoV8hOm5sLQIG1e6lhZKfdB
         22qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKD3GqACglDwl+wNClO2SXTQx/M/FviAMhmGXHJPcWjY3sJSRbFRSV8Ida/WgY5s+8N0NyyfyyyBQBs9Uv@vger.kernel.org
X-Gm-Message-State: AOJu0YyfKvDX7IPnzAmGsdoRDniDffkVMgvvPb5gppbcMa0Cf3RovQ0t
	E/eaHVHTNOa44EIUl89XdN+QrjGyDmTVVJtgn7/gWFGyclMyyBSdjMIvkOEYQQZbxpTvTKklMWI
	SoxdzrI0Lr52vHtU6C1Z+m/3tbPFEjyPixjWZWxSl/mBCkxq1awoP5QMTndFZnFIMwVU1
X-Gm-Gg: ASbGncuwGOF0B8+nuvDSTSvkIqpSRxvdgPb1e+8nfPoslh870zqWjfYxRIW/U784MfS
	6IF4CpqO6hYR9qQUzzVKdJQHbSMaon0VWD+oXQGA3s6bd/Wwmuwu6r5vMR0sVyMWy+445y+wgw9
	VFd4QcFWVCTw3/OweuojRarwPbOBVWtBaJghe8UlEmsj3arJeoXLipXuhhBR+Ly/um9DVTxGuBh
	9LuKo+vyo/f0OjJVmXcqFWXXrWKqlbz7Ko+lM+Ov2zM+06cvN/kBCd8X49R2ESdcJbX83O2Qcx7
	izS8PlIFXnuY3YNg7H1CoqOTnAE3NPyLKPwhs8fC5yaKWH+tPjV04ecX0eqlpE3ItYFkS9JVU0G
	2u26LOOBRMXMVk9hsUzpaZT8amVgJcadNHmZQpzx/W594euYbRzWF
X-Received: by 2002:ad4:5945:0:b0:70d:cc1b:68d8 with SMTP id 6a1803df08f44-73946e7c091mr163022056d6.60.1757511796394;
        Wed, 10 Sep 2025 06:43:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6PHZIhUDI560woSHXbXEfXTfCiGlJ/BbPfkyDjwFSiQx7owU5WH313TRjCymTd7ql0gFT6Q==
X-Received: by 2002:ad4:5945:0:b0:70d:cc1b:68d8 with SMTP id 6a1803df08f44-73946e7c091mr163021196d6.60.1757511795562;
        Wed, 10 Sep 2025 06:43:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c4ed3csm43091651fa.4.2025.09.10.06.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:43:14 -0700 (PDT)
Date: Wed, 10 Sep 2025 16:43:12 +0300
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
Subject: Re: [PATCH v4 10/10] drm/display: hdmi-audio: warn if HDMI connector
 doesn't support Audio IF
Message-ID: <zjfnbabmnpopxy3r2dbpiiuhspoapc4mvpkha6bfses2mf6gpi@tmp4konlmimh>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-10-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-magic-natural-saluki-4aca9d@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-magic-natural-saluki-4aca9d@houat>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c18075 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=41mUuBG4nv7vr-MJPacA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: vVLpNt_tfT-PO0TEg0vDAQ8uDptPiyUM
X-Proofpoint-GUID: vVLpNt_tfT-PO0TEg0vDAQ8uDptPiyUM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX1yLjdImW/icQ
 dH1iAJ5oGvBPNEGNMhONS9qLVT34VapuShp+veDvDNINCd884OjX7mBwoR4895+bKZr17sLgNUZ
 pCulyl9rfNpPEnNDluKlGLu/l+d5bEhoAjmeTiJQt0f27rf+4+Z+eJFX5EW5PVJ1pf+fq37vR33
 J2RSVE1YBFMTd3Rnpc1y6dZ8rVsAM6djlTSemazvOep0Gg9ris1nlm3HqnC+AG+orMmDa0al+J0
 y8Ffmwxrck/sPxTR3zlg1w+EMohcmpyPOsMHKcdOuA7WcxRUbzs/IT+GNDWZHxbfObjMw7SBZEu
 RbHjyTll/VRF3d5In9TGZHx+jj84K6fEWp4TXQNuCy2RCsSzVgp7uldks6cAAzgLhUkIOS5DEfs
 2feO1rkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

On Wed, Sep 10, 2025 at 01:05:47PM +0200, Maxime Ripard wrote:
> On Tue, Sep 09, 2025 at 05:52:08PM +0300, Dmitry Baryshkov wrote:
> > Sending Audio InfoFrames is mandatory for getting audio to work over the
> > HDMI link. Warn if the driver requests HDMI audio support for the HDMI
> > connector, but there is no support for Audio InfoFrames.
> > 
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Acked-by: Daniel Stone <daniels@collabora.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> > index 7d78b02c144621de528b40b1425f25e465edd1ae..35e0e79cb683a68af813344aa86c154c3a5531fe 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> > @@ -10,6 +10,7 @@
> >  
> >  #include <drm/drm_connector.h>
> >  #include <drm/drm_device.h>
> > +#include <drm/drm_print.h>
> >  #include <drm/display/drm_hdmi_audio_helper.h>
> >  
> >  #include <sound/hdmi-codec.h>
> > @@ -178,6 +179,17 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
> >  	    !funcs->shutdown)
> >  		return -EINVAL;
> >  
> > +	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> > +	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
> > +		unsigned long supported_infoframes =
> > +			connector->hdmi.supported_infoframes;
> > +
> > +		if (supported_infoframes &&
> > +		    !(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AUDIO))
> > +			drm_warn(connector->dev, "HDMI Audio with no support for Audio InfoFrames\n");
> > +	}
> > +
> > +
> 
> That's not what I suggested. What I suggested was that we tould check
> the return code of write_infoframe, and warn if it is set by the
> framework, but returns EOPNOTSUPP.

I see, I misunderstood you then. I will respond to the comment at patch
1.


-- 
With best wishes
Dmitry

