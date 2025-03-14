Return-Path: <linux-arm-msm+bounces-51374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7BEA60AE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 09:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60E1D19C0B67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 08:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120B91957FC;
	Fri, 14 Mar 2025 08:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxqAKU3U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA388194A75
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 08:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741939882; cv=none; b=pmV8hX7T3BBXt0TPilwht7g1wbV4OL1PAblVfMONk0rmlpetEm5SGngFPDe3XFoOsF0OC07umDeK/T8xMTnog/HxURh1EWd0ZBhInswA3L1DAOJjuT3IQePxyDYxnDCn2mWMQVuqwlQpSjDZ89gv90r8C3YtV8mccYfTxNe5A1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741939882; c=relaxed/simple;
	bh=ZBMf9GDy76mn1x90QFYk/IXbdeJ/G19Qy0SwOkUSudA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2woklwkaURYbaPsaBprCTTTFv9xDNSK7bpEvoyVMhVqANBSU4tPLD6sAFOILDMnAk8tKDvJdhmmYFIvqCXw81luwmnMGVGn1LfRzyUxRTrsksGp2BBWXfoO5lhzO4c0cqDWVQZyo/25gw5rcxpOAxLUzdEFgeWcHFxvq8k7AVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxqAKU3U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNc4mQ031616
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 08:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BG40QnYlseRtwAezWbPerMkM
	tV5XwiA1Sgqd6J0YAew=; b=LxqAKU3US49eomT6xBjJ7LnXCbu4lh7mFoFViF/x
	9sfcD+D8ZTo9g/Mjo7lFGsFwFrW84U9zc78jVSeebiVhHi558NeuswIwnmfPB2Nb
	Rg7Mq+odYR7tbNMxfyqieFSU/1hfo3NE2q0P0IRYu6/8OYOxsgY7SFfsxVFb7MT4
	ZhfBUWBts15ZK+hxtlmCBW0IHImbDA6EDO+PNoUePR+rUHYLoGPzHIqQgVrC6XjC
	FlgSoQaAaHngtsxLIq7M4Wdo2iw7rD2gsKKTrdYlhk98wjR6uqfLCSKFZej0U+Kj
	lcexU+cMKh5A+TygEONtFJ/z2lekfhDJZ9TtvIvlEJ8c1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bx1jjxt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 08:11:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47682f9e7b9so32148351cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 01:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741939878; x=1742544678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BG40QnYlseRtwAezWbPerMkMtV5XwiA1Sgqd6J0YAew=;
        b=G4ym1S2jcePAWQJ8smkMnFezkdvJESfKwkw4peAxf+AGGo3zXlb/cgMwHpybETaWij
         elNFR5oiI9J8SzHrAuc66mN++3gU4AweFk410htAMblq8ej8T0Qki/2yguE3GutZLv8f
         JImFHMpRSj2SQ3+89kOK3ZJuIM9zTR5NV8QVdweUDUEN7hPVmSiNFzg2GSKrKvY1gw9u
         c+vACyB3p8SgsRB6RJVxTgA9ER0XbcH+Wn2e2yT1jVdA64cuKit6Zf1HbhPLYWV/3+k4
         /PQoQnyCCTO1r5zjsODHUVrE9tyN9obwOLtlN/ngESfX5tfs5/LHtlbY5UGnROWmtqDX
         jn0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVG6faAa6556xmP3BQtnbEN7Soseu0FzZKsDc+HErRBOgsvhSpkqWFOpcm7g6isVD/F43scheAdCDdcCRrN@vger.kernel.org
X-Gm-Message-State: AOJu0YwKYNuVwmAeeGsgQLECG8gksIzMPGVCgOANjPh4f46JiFLHXSBZ
	UlIUjQVyovqs5yNf86RbmmbZWloeuM0LscMamNXJY9bBjHEskE/kF5gkvw7r8XJyk0eFfBVzSb1
	JLt9aSCNFXqg7vKqFGYbHWVhvV/kBR3wrKwfB9eBvGMr6fgOvWPc++Ai9RO6YI+KJ
X-Gm-Gg: ASbGncvG6OM/5DBlnSpMqcEIaxD+YeVCXbks0EHPTWTWZROUEoMG4AGfV2RNG2n+cTy
	0mS+1eQbDecCIHQVQ5EOLjOWFwpaCp3Iln0rq7V+iALF1u7IS+6G82t5ZrskmSfxzNrjtRD+21V
	hTpf9zcVXEInwoL2fdNIyZiEArTLvlvOKXRv6XuepYq2Zoa4HylBKHOTKAzxneHlLQ282/Q8gEm
	0yrpOGvhCVmuTXfRLXOVJUEz1WCg8vUaEt93bZczhBtLbPdFQM5iKmL/bVh2vmCPNv2Fyiib71i
	cMao/HPUnCu656+3O7ZE4Un8cFV5GT50TB1AuN5Jts4zzvli2S3OQg76IK2LhWtDOy+6e6iPWr1
	bPtQ=
X-Received: by 2002:a05:622a:15c2:b0:476:7bd1:68dd with SMTP id d75a77b69052e-476c81e9305mr23719421cf.50.1741939878403;
        Fri, 14 Mar 2025 01:11:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpXUAYLZcjKZPmvc68V6/CpAfx14InDQngsYJv8OAR0557fXhcP1/BZQ5JH+CnIhY0RlOeeg==
X-Received: by 2002:a05:622a:15c2:b0:476:7bd1:68dd with SMTP id d75a77b69052e-476c81e9305mr23719101cf.50.1741939877992;
        Fri, 14 Mar 2025 01:11:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a7286sm444228e87.215.2025.03.14.01.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 01:11:15 -0700 (PDT)
Date: Fri, 14 Mar 2025 10:11:12 +0200
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
Subject: Re: [PATCH v5 1/2] drm/bridge: split HDMI Audio from
 DRM_BRIDGE_OP_HDMI
Message-ID: <wrounwcprj2fhn3x5a3ty3sa3fgzs563jsibtlbf42et6tgtzd@gp7zqf6gqyhf>
References: <20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org>
 <20250307-dp-hdmi-audio-v5-1-f3be215fdb78@linaro.org>
 <20250310-unnatural-puffin-of-revolution-59d726@houat>
 <CALT56yPKe8+tSyChAo6ypHR8EWUpqeJDNM6mcOBUnFwFE7rg4w@mail.gmail.com>
 <20250311-quizzical-warthog-of-leadership-53d224@houat>
 <nx67lft5x4ytsxsd4mpxfocig5dfaolsurlwqzvkrniwzv3huz@hmwucvqykaid>
 <20250311-benevolent-goat-of-thunder-8e73bb@houat>
 <gqizmvyunfzhxwo4qpbqwe26le5dkodu6sbur4npuoc5ij6f3n@ldqbdmah5fsd>
 <20250314-clay-basilisk-of-joviality-baa33e@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-clay-basilisk-of-joviality-baa33e@houat>
X-Authority-Analysis: v=2.4 cv=CNQqXQrD c=1 sm=1 tr=0 ts=67d3e4a7 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=y55522s-oObgGE9ZdggA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KR1CMeEqM9OGYFs0jyRLPgD89Qexp9oq
X-Proofpoint-GUID: KR1CMeEqM9OGYFs0jyRLPgD89Qexp9oq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_03,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140064

On Fri, Mar 14, 2025 at 08:50:36AM +0100, Maxime Ripard wrote:
> On Tue, Mar 11, 2025 at 07:50:50PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Mar 11, 2025 at 04:58:59PM +0100, Maxime Ripard wrote:
> > > On Tue, Mar 11, 2025 at 05:50:09PM +0200, Dmitry Baryshkov wrote:
> > > > On Tue, Mar 11, 2025 at 09:36:37AM +0100, Maxime Ripard wrote:
> > > > > On Mon, Mar 10, 2025 at 08:42:29PM +0200, Dmitry Baryshkov wrote:
> > > > > > On Mon, 10 Mar 2025 at 16:55, Maxime Ripard <mripard@kernel.org> wrote:
> > > > > > >
> > > > > > > Hi,
> > > > > > >
> > > > > > > On Fri, Mar 07, 2025 at 07:55:52AM +0200, Dmitry Baryshkov wrote:
> > > > > > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > >
> > > > > > > > As pointed out by Laurent, OP bits are supposed to describe operations.
> > > > > > > > Split DRM_BRIDGE_OP_HDMI_AUDIO from DRM_BRIDGE_OP_HDMI instead of
> > > > > > > > overloading DRM_BRIDGE_OP_HDMI.
> > > > > > > >
> > > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/bridge/lontium-lt9611.c        |  2 +-
> > > > > > > >  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |  1 +
> > > > > > > >  drivers/gpu/drm/display/drm_bridge_connector.c | 59 +++++++++++++++++---------
> > > > > > > >  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         |  1 +
> > > > > > > >  include/drm/drm_bridge.h                       | 23 ++++++++--
> > > > > > > >  5 files changed, 61 insertions(+), 25 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > > > > > > > index 026803034231f78c17f619dc04119bdd9b2b6679..3b93c17e25c18ae0d13e9bb74553cf21dcc39f9d 100644
> > > > > > > > --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> > > > > > > > +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > > > > > > > @@ -1130,7 +1130,7 @@ static int lt9611_probe(struct i2c_client *client)
> > > > > > > >       lt9611->bridge.of_node = client->dev.of_node;
> > > > > > > >       lt9611->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> > > > > > > >                            DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES |
> > > > > > > > -                          DRM_BRIDGE_OP_HDMI;
> > > > > > > > +                          DRM_BRIDGE_OP_HDMI | DRM_BRIDGE_OP_HDMI_AUDIO;
> > > > > > > >       lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> > > > > > > >       lt9611->bridge.vendor = "Lontium";
> > > > > > > >       lt9611->bridge.product = "LT9611";
> > > > > > > > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > > > > > > > index 6166f197e37b552cb8a52b7b0d23ffc632f54557..5e5f8c2f95be1f5c4633f1093b17a00f9425bb37 100644
> > > > > > > > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > > > > > > > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > > > > > > > @@ -1077,6 +1077,7 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
> > > > > > > >       hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
> > > > > > > >                          DRM_BRIDGE_OP_EDID |
> > > > > > > >                          DRM_BRIDGE_OP_HDMI |
> > > > > > > > +                        DRM_BRIDGE_OP_HDMI_AUDIO |
> > > > > > > >                          DRM_BRIDGE_OP_HPD;
> > > > > > > >       hdmi->bridge.of_node = pdev->dev.of_node;
> > > > > > > >       hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> > > > > > > > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > > > > > > index 30c736fc0067e31a97db242e5b16ea8a5b4cf359..030f98d454608a63154827c65d4822d378df3b4c 100644
> > > > > > > > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > > > > > > > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > > > > > > @@ -98,6 +98,13 @@ struct drm_bridge_connector {
> > > > > > > >        * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
> > > > > > > >        */
> > > > > > > >       struct drm_bridge *bridge_hdmi;
> > > > > > > > +     /**
> > > > > > > > +      * @bridge_hdmi_audio:
> > > > > > > > +      *
> > > > > > > > +      * The bridge in the chain that implements necessary support for the
> > > > > > > > +      * HDMI Audio infrastructure, if any (see &DRM_BRIDGE_OP_HDMI_AUDIO).
> > > > > > > > +      */
> > > > > > > > +     struct drm_bridge *bridge_hdmi_audio;
> > > > > > > >  };
> > > > > > > >
> > > > > > > >  #define to_drm_bridge_connector(x) \
> > > > > > > > @@ -433,7 +440,7 @@ static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
> > > > > > > >               to_drm_bridge_connector(connector);
> > > > > > > >       struct drm_bridge *bridge;
> > > > > > > >
> > > > > > > > -     bridge = bridge_connector->bridge_hdmi;
> > > > > > > > +     bridge = bridge_connector->bridge_hdmi_audio;
> > > > > > > >       if (!bridge)
> > > > > > > >               return -EINVAL;
> > > > > > > >
> > > > > > > > @@ -451,7 +458,7 @@ static int drm_bridge_connector_audio_prepare(struct drm_connector *connector,
> > > > > > > >               to_drm_bridge_connector(connector);
> > > > > > > >       struct drm_bridge *bridge;
> > > > > > > >
> > > > > > > > -     bridge = bridge_connector->bridge_hdmi;
> > > > > > > > +     bridge = bridge_connector->bridge_hdmi_audio;
> > > > > > > >       if (!bridge)
> > > > > > > >               return -EINVAL;
> > > > > > > >
> > > > > > > > @@ -464,7 +471,7 @@ static void drm_bridge_connector_audio_shutdown(struct drm_connector *connector)
> > > > > > > >               to_drm_bridge_connector(connector);
> > > > > > > >       struct drm_bridge *bridge;
> > > > > > > >
> > > > > > > > -     bridge = bridge_connector->bridge_hdmi;
> > > > > > > > +     bridge = bridge_connector->bridge_hdmi_audio;
> > > > > > > >       if (!bridge)
> > > > > > > >               return;
> > > > > > > >
> > > > > > > > @@ -478,7 +485,7 @@ static int drm_bridge_connector_audio_mute_stream(struct drm_connector *connecto
> > > > > > > >               to_drm_bridge_connector(connector);
> > > > > > > >       struct drm_bridge *bridge;
> > > > > > > >
> > > > > > > > -     bridge = bridge_connector->bridge_hdmi;
> > > > > > > > +     bridge = bridge_connector->bridge_hdmi_audio;
> > > > > > > >       if (!bridge)
> > > > > > > >               return -EINVAL;
> > > > > > > >
> > > > > > > > @@ -576,6 +583,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > > > > > > >                               max_bpc = bridge->max_bpc;
> > > > > > > >               }
> > > > > > > >
> > > > > > > > +             if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO) {
> > > > > > > > +                     if (bridge_connector->bridge_hdmi_audio)
> > > > > > > > +                             return ERR_PTR(-EBUSY);
> > > > > > > > +
> > > > > > > > +                     if (!bridge->hdmi_audio_max_i2s_playback_channels &&
> > > > > > > > +                         !bridge->hdmi_audio_spdif_playback)
> > > > > > > > +                             return ERR_PTR(-EINVAL);
> > > > > > > > +
> > > > > > > > +                     if (!bridge->funcs->hdmi_audio_prepare ||
> > > > > > > > +                         !bridge->funcs->hdmi_audio_shutdown)
> > > > > > > > +                             return ERR_PTR(-EINVAL);
> > > > > > > > +
> > > > > > > > +                     bridge_connector->bridge_hdmi_audio = bridge;
> > > > > > > > +             }
> > > > > > > > +
> > > > > > > >               if (!drm_bridge_get_next_bridge(bridge))
> > > > > > > >                       connector_type = bridge->type;
> > > > > > > >
> > > > > > > > @@ -611,22 +633,6 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > > > > > > >                                              max_bpc);
> > > > > > > >               if (ret)
> > > > > > > >                       return ERR_PTR(ret);
> > > > > > > > -
> > > > > > > > -             if (bridge->hdmi_audio_max_i2s_playback_channels ||
> > > > > > > > -                 bridge->hdmi_audio_spdif_playback) {
> > > > > > > > -                     if (!bridge->funcs->hdmi_audio_prepare ||
> > > > > > > > -                         !bridge->funcs->hdmi_audio_shutdown)
> > > > > > > > -                             return ERR_PTR(-EINVAL);
> > > > > > > > -
> > > > > > > > -                     ret = drm_connector_hdmi_audio_init(connector,
> > > > > > > > -                                                         bridge->hdmi_audio_dev,
> > > > > > > > -                                                         &drm_bridge_connector_hdmi_audio_funcs,
> > > > > > > > -                                                         bridge->hdmi_audio_max_i2s_playback_channels,
> > > > > > > > -                                                         bridge->hdmi_audio_spdif_playback,
> > > > > > > > -                                                         bridge->hdmi_audio_dai_port);
> > > > > > > > -                     if (ret)
> > > > > > > > -                             return ERR_PTR(ret);
> > > > > > > > -             }
> > > > > > > >       } else {
> > > > > > > >               ret = drmm_connector_init(drm, connector,
> > > > > > > >                                         &drm_bridge_connector_funcs,
> > > > > > > > @@ -635,6 +641,19 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > > > > > > >                       return ERR_PTR(ret);
> > > > > > > >       }
> > > > > > > >
> > > > > > > > +     if (bridge_connector->bridge_hdmi_audio) {
> > > > > > > > +             bridge = bridge_connector->bridge_hdmi_audio;
> > > > > > > > +
> > > > > > > > +             ret = drm_connector_hdmi_audio_init(connector,
> > > > > > > > +                                                 bridge->hdmi_audio_dev,
> > > > > > > > +                                                 &drm_bridge_connector_hdmi_audio_funcs,
> > > > > > > > +                                                 bridge->hdmi_audio_max_i2s_playback_channels,
> > > > > > > > +                                                 bridge->hdmi_audio_spdif_playback,
> > > > > > > > +                                                 bridge->hdmi_audio_dai_port);
> > > > > > > > +             if (ret)
> > > > > > > > +                     return ERR_PTR(ret);
> > > > > > > > +     }
> > > > > > > > +
> > > > > > > >       drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
> > > > > > > >
> > > > > > > >       if (bridge_connector->bridge_hpd)
> > > > > > > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > > > > > index 1456354c8af4bc7f655e8a47e958e9e0b99b7d29..ab6c8bc4a30b681f7de8ca7031f833795d1f7d94 100644
> > > > > > > > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > > > > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > > > > > @@ -515,6 +515,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
> > > > > > > >       bridge->ops = DRM_BRIDGE_OP_HPD |
> > > > > > > >               DRM_BRIDGE_OP_DETECT |
> > > > > > > >               DRM_BRIDGE_OP_HDMI |
> > > > > > > > +             DRM_BRIDGE_OP_HDMI_AUDIO |
> > > > > > > >               DRM_BRIDGE_OP_EDID;
> > > > > > > >       bridge->hdmi_audio_max_i2s_playback_channels = 8;
> > > > > > > >       bridge->hdmi_audio_dev = &hdmi->pdev->dev;
> > > > > > > > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > > > > > > > index d4c75d59fa12be1bd7375ce3ea56415235781b28..dff8cf035b30d5c7e00bfdf5d6e12802559823ba 100644
> > > > > > > > --- a/include/drm/drm_bridge.h
> > > > > > > > +++ b/include/drm/drm_bridge.h
> > > > > > > > @@ -693,8 +693,10 @@ struct drm_bridge_funcs {
> > > > > > > >       /**
> > > > > > > >        * @hdmi_audio_prepare:
> > > > > > > >        * Configures HDMI-encoder for audio stream. Can be called multiple
> > > > > > > > -      * times for each setup. Mandatory if HDMI audio is enabled in the
> > > > > > > > -      * bridge's configuration.
> > > > > > > > +      * times for each setup.
> > > > > > > > +      *
> > > > > > > > +      * This callback is optional but it must be implemented by bridges that
> > > > > > > > +      * set the DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
> > > > > > > >        *
> > > > > > > >        * Returns:
> > > > > > > >        * 0 on success, a negative error code otherwise
> > > > > > > > @@ -707,8 +709,10 @@ struct drm_bridge_funcs {
> > > > > > > >       /**
> > > > > > > >        * @hdmi_audio_shutdown:
> > > > > > > >        *
> > > > > > > > -      * Shut down the audio stream. Mandatory if HDMI audio is enabled in
> > > > > > > > -      * the bridge's configuration.
> > > > > > > > +      * Shut down the audio stream.
> > > > > > > > +      *
> > > > > > > > +      * This callback is optional but it must be implemented by bridges that
> > > > > > > > +      * set the DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
> > > > > > > >        *
> > > > > > > >        * Returns:
> > > > > > > >        * 0 on success, a negative error code otherwise
> > > > > > > > @@ -814,6 +818,17 @@ enum drm_bridge_ops {
> > > > > > > >        * drivers.
> > > > > > > >        */
> > > > > > > >       DRM_BRIDGE_OP_HDMI = BIT(4),
> > > > > > > > +     /**
> > > > > > > > +      * @DRM_BRIDGE_OP_HDMI_AUDIO: The bridge provides HDMI audio operations.
> > > > > > > > +      * Bridges that set this flag must implement the
> > > > > > > > +      * &drm_bridge_funcs->hdmi_audio_prepare and
> > > > > > > > +      * &drm_bridge_funcs->hdmi_audio_shutdown callbacks.
> > > > > > > > +      *
> > > > > > > > +      * Note: currently there can be at most one bridge in a chain that sets
> > > > > > > > +      * this bit. This is to simplify corresponding glue code in connector
> > > > > > > > +      * drivers.
> > > > > > > > +      */
> > > > > > > > +     DRM_BRIDGE_OP_HDMI_AUDIO = BIT(5),
> > > > > > >
> > > > > > > We should make this conditional on HDMI being set. It doesn't make sense
> > > > > > > to have OP_HDMI_AUDIO enabled when OP_HDMI isn't.
> > > > > > 
> > > > > > It totally does.
> > > > > 
> > > > > I'm sure it works properly. I meant on a conceptual level. In our
> > > > > codebase, as it is today, the HDMI audio support is part of the HDMI
> > > > > infrastructure, and thus implementing audio without the main part
> > > > > doesn't make sense. IIRC, the spec also mandates video support, but
> > > > > audio is optional.
> > > > 
> > > > I can imagine a HDMI bridge using OP_HDMI_AUDIO, but not OP_HDMI. For
> > > > example, lontium-lt9611uxc.c. It is a 'smart' chip, which handles nearly
> > > > everything on its own. I even don't know if there is a way to program
> > > > the InfoFrames, etc., so I'm very skeptical about setting OP_HDMI.
> > > > However at the same time, it would defeinitely benefit from using
> > > > OP_HDMI_AUDIO.
> > > 
> > > You're going to have the same argument for that chip for audio: if not
> > > be able to set the infoframe disqualifies, then there's audio infoframes
> > > too and thus it should be disqualified from OP_HDMI_AUDIO.
> > 
> > Why? OP_HDMI_AUDIO has nothing to do with InfoFrames, it's just HDMI
> > codec. We need infoframes and tmds_char_rate_valid for OP_HDMI.
> 
> Your other series with the ACR helper kind of shows that there's more to
> it than just the codec. But I'll rephrase. If you can find a document
> from either VESA or HDMI that states that DP reuses as-is the audio
> component of HDMI, or the other way around, we can rename this bit to
> OP_DP_HDMI_AUDIO and call it a day.
> 
> If you can't, then sorry, but I'll insist on two separate flags. Again,
> that's for the consumer facing API only. If you want to reuse all the
> code internally, that's totally reasonable to me.

Ack, let's settle on two separate flags and a common implementation
internally. I hope this means taht we can reuse the .hdmi_audio()
callbacks fr DP audio too.

-- 
With best wishes
Dmitry

