Return-Path: <linux-arm-msm+bounces-76047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 685ABBBDB75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 12:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E13C934A7BB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 10:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316E7242D9A;
	Mon,  6 Oct 2025 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5EX7/DR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B929123D294
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 10:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759747169; cv=none; b=XbAJP4vcSqoEQXcOcQNkz5qtexJG3QosmR/g/rKvqMaaKRN87hY8NJRmjvNQ6JEvFJ4ZQRes6JoFXFxoEh7lS2wGDRpJ6Tp2mrV/56YLfjQMWFNztsmSvvAdvyIBlWXEJXQ8Ukl5T39zgAbts2INl+NIWvvR9j0OEnBdQnGs3Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759747169; c=relaxed/simple;
	bh=Y7YOFRG123DLfsR74hu7s46tHnv9F0MOoKCvsGPaRyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7STxtfFOvyZKVpc0PuXej0OU8vQH784g4rOLXv2cf5ZTCajy36DW2SD87QPfuE5nGnVbP5X+5RDW1bSh2kHN52lftmONeQOFq6UbBqTqsIYfwdrvqBBE68UQyZOPCZHAU6G/F6FBANUGtyPW5VL1yxI7lFjnK6Xl65ZdzhcF2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5EX7/DR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NnGqo010143
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 10:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tL32lBVtdQG6FBp70cR/0+e7
	GT0m4lIzY/Mtg+rXvr0=; b=D5EX7/DRqdw74gyFVv30BXiPneQ15mlAaTP2HjDm
	feAYYiqjOPAYmPpAFYI5+3TWaOlTeMPhwYA0dj6EdoZV9f2GSyaxbzWK4EmYA3g2
	iOhN77zsnxwkAFw4T7zhfurMFEjQxipDWD3kDm84j430i8cqscibhxKsjwYdF53a
	BSvTXYSzYCJpKyXqjgTJLA+XLoQdqNMqLFXndcNI+PPNmBKiCU6J96pljJXCn4G+
	HmL09PXq9CEso3ZCoEmguWSMBFrljKWQ9nx/5CdtGN4EUpDTXD8xVdaxkwJx6LDe
	cQUdNEsES8NdcM7pwhF6YXJNAmEGlWNFh76gTPLND9kLlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1kj2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 10:39:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-86835654255so1666227785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 03:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759747165; x=1760351965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tL32lBVtdQG6FBp70cR/0+e7GT0m4lIzY/Mtg+rXvr0=;
        b=QJ9Szqtn7EFTZLAhaHNt6vOUEisJja3oKiLFTbpb5zR2TdvbohumF7zYb/HmdnBTRH
         ek+tm8cA/lNvB7z+s6RU1KiCpM6SMJ8BKAnBjZVlBFz28TqXOTXBAYjV127p5+0QYZLo
         B4aFkfChaC2PQ+mI9buIy0NaQ70u/UlQn/WkFr7+3aMSDdXWpP/z2KpURo0lvdLKpzwV
         T1sTXtTXIlw4oLaHXyAsKZNLCKvnSElStqLY/IQ/gnWVn8PygcnTuVK50eFGWZNB0KQk
         ltwL13Z08hTHfpfDtYbgrhyrZRw4FhK0ix8IzDb9iy+RetlSCZuki78maEtBP0i+MiXf
         Gdvg==
X-Forwarded-Encrypted: i=1; AJvYcCXV3P4Vzi0CrlIi05susN+/Eqn+m81K2Ux57l36Q/QmJk4cGNpNtrkZzJwnE8vPU5b77c1fAOJyUUsEeBQp@vger.kernel.org
X-Gm-Message-State: AOJu0YwoOJAg+WzJ5QUhXFR9OT9pZAFrv5MKzXChPOGmc/R0gmbuLwoL
	5K4+RIcYjmNHiC6Q7lp9QtFq/DqXuBAyNcoz0xifvVT/2YaXl9QysidMaHYqS9mKGbXVuYITOt9
	hzAkeEsXSTxAayXfnJmuLSq6fJJiurWIeszCaxYnn8xfLFe6KkQ8oi3DqeoXO0n9pvRXP
X-Gm-Gg: ASbGncs+NbTpoLMPTcyEM0CG8wpw/Ky/1YI/kluwfZoYTIH2kb3Djm54hbjf+TCLag+
	yRVVk9WQhIT0H3ZbOjPXYID7D9l0d7PM/vtey7Qs6M/pJHRtL6jE4dfaDjTJHrdaJMkPGXpYVnh
	9PBDycSk6t9HcepAmWiKOCkUVYgin6ZMfjqx7UodJoQ4HbvFxquoBm5Se4bVfpSiuLHuz/lQBB4
	Ege2fkVJmqMULCfBFVsHu4KSUim0zVGwBmeBOr2/Fkfn+wLFjuhL5K5Xi90Zg4RKHZ2wgOHSsYe
	S54E7oiJkzU+SGKwTH6PigLDlCOKhVSIbmHPC6nyExj+GSNAr3LGKpKlMq6VUrQLSWtNid1+kia
	7Fc2GvZEK2jrRBHREjS7QTvUDuu7JZHCFuJSp4evZuEwBpnOSiGtdKw32bw==
X-Received: by 2002:a05:620a:f05:b0:847:cb75:95e4 with SMTP id af79cd13be357-87a38a3a9a9mr1257911285a.78.1759747164980;
        Mon, 06 Oct 2025 03:39:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzjLLv0vLtf2KwPjN7Isng+2S6+xF8KquObPMQpThzVTOWmfSKiJh31vn8lJ3hYibY9HOs5w==
X-Received: by 2002:a05:620a:f05:b0:847:cb75:95e4 with SMTP id af79cd13be357-87a38a3a9a9mr1257906985a.78.1759747164471;
        Mon, 06 Oct 2025 03:39:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba444ae4sm43603661fa.36.2025.10.06.03.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 03:39:23 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:39:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Junjie Cao <caojunjie650@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
        Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
Message-ID: <2do3dk7gqvbloocsv46t3zrc4ghvhrpiqre6djk6heese3wz75@dlqwkdsnrkbr>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-4-caojunjie650@gmail.com>
 <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
 <e36572bf-4fb4-425e-8d10-c5efa5af97f3@oss.qualcomm.com>
 <rxm67cbwkp2qyxdlgqb3fz7fhiskmnhidhjvl4mhqn67iq2x4n@wfueruiiq7kp>
 <53aafa84-6d6a-4963-827e-c1600270662f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53aafa84-6d6a-4963-827e-c1600270662f@oss.qualcomm.com>
X-Proofpoint-GUID: Ggbf2lyDW3PPrmcWXOEWoOoOPYCSjiJ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfXzvDhFudczT52
 ROpAy1m6yi2K35pI3bJIL6kolbW//XemxtAGGgHPTiOvHKufv/vQgxXaNoAFgU2Ta8PcoDY5Obb
 JtG0qUGWF1lhLUIyqEQKRvklQTN3b28rLxjpzmDRQMjoyYdloC3NPi5SLlecJu6W5DR5gk3j2sI
 YamMvByOr2LdPcNC0TLDrWuEbyerp6U9EQT4rZTtvp6Go0xdf8rVL+EyYbghTRtm8xh4DPTyUZh
 O6c89RBGd2EIGxflmJiLrKDPzWdOLDUW4uzPqCSd5482+g7IGlhEpJteFDZmLl9DItyd408CRAT
 r2s22wDpnMb5NH/zJBR9APlg5k+Em9VRdflnn0FkKkLTcfxXCIrcrfxZAnOSpYprvr8RpNFKua9
 WgWkbz3o9GMgULCa1Zu+4NjxbMcTAQ==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e39c5e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EU-ENxuI5XK3D0y7c1kA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Ggbf2lyDW3PPrmcWXOEWoOoOPYCSjiJ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On Mon, Oct 06, 2025 at 12:10:05PM +0200, Konrad Dybcio wrote:
> On 10/6/25 12:02 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 06, 2025 at 11:24:35AM +0200, Konrad Dybcio wrote:
> >> On 10/2/25 4:04 AM, Dmitry Baryshkov wrote:
> >>> On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
> >>>> Add a driver for panels using the Novatek NT36532 Display Driver IC,
> >>>> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
> >>>> tablets.
> >>>>
> >>>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> >>>> ---
> >>>>  MAINTAINERS                                   |   7 +
> >>>>  drivers/gpu/drm/panel/Kconfig                 |  10 +
> >>>>  drivers/gpu/drm/panel/Makefile                |   1 +
> >>>>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
> >>>>  4 files changed, 455 insertions(+)
> >>>>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
> >>>>
> >>>> +
> >>>> +static const struct panel_info csot_panel_info = {
> >>>> +	.width_mm = 250,
> >>>> +	.height_mm = 177,
> >>>> +	.lanes = 4,
> >>>> +	.format = MIPI_DSI_FMT_RGB888,
> >>>> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
> >>>> +		      MIPI_DSI_MODE_LPM,
> >>>> +	.display_mode = csot_display_mode,
> >>>> +	.dsc_slice_per_pkt = 2,
> >>>
> >>> As this is not a part of the standard, what if the DSI host doesn't
> >>> support this feature?
> >>
> >> Shouldn't the core gracefully throw something like an -EINVAL?
> > 
> > There is no 'core' here. Each DSI DRM host manages DSC on their own.
> 
> drm_dsc_helper?

No, that's just for calculating PPS and some other values. It's one of
the problems of the DSI model, which I tried to solve a year ago, but
failed up to now to do it completely and clearly. The DSI device can't
check host's capabilities. It declares what it needs inside struct
mipi_dsi_device and hopes for the best.

-- 
With best wishes
Dmitry

