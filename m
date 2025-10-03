Return-Path: <linux-arm-msm+bounces-75923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E88BB769F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 17:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 402DA1B20019
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 15:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2645128D839;
	Fri,  3 Oct 2025 15:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="grXP93xp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FBA28C870
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 15:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759506895; cv=none; b=Qwbk3z9wt2t0lGaIS4atLIzxDm0NPbUWgItzO0A0LnMf+ncFQh3QkhCTfopk36VwgdHQdp50jdbTFtB7r9yOTl70Yotq+N42wsMeknEJ2Wj0gIlLdP1URvZC4p2uNXTNMIxUZxAsAp0jTHsMj02OCa+k9305rTpNIgV8Tc0ww1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759506895; c=relaxed/simple;
	bh=szJMS6he09Wd+8Ozhl6aTpQoL3OVXYpTaBx01Nr57hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOTEsFmkW9rPbKp9k3DA2KUCUI8PucC5uSFxlAU+j17UnvcJl/+DGmYKU6fZMSTx6OuQj+h6zLB2IlEhoakZqR5CfUmfowOIe6eA5vIOl11YbQrUjPV4MeXErCc+ioGTVlOOqNW49kIbeZGH3C0gWfnkoKfC3P13DjA+SDCqfc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=grXP93xp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593AxJwr032179
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 15:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6KNmotElFnlaj5LbQkx7LCcL
	T9YxgWwze47fan2qU6Q=; b=grXP93xpW11dgCxLDjmOijvaojGVu4+ZO8kDr2ZY
	nb2dn3STWacTJtk+Gi9BWRUs924uCERadwCWr1SqBmsi0Eod9GIK8BFOBnYvBBjp
	Z55aQJ5qhK//20XenVldygejYoe8MLTU6WvmulnjqLR3lxoFAfwivMwxZn6XCr1b
	alWKkUGi9QeCbP1EjXZPRql8diuj16SIGnQuEuRKSwvtOvvKnMA6PyAPyvtOPeTr
	ZZRcJCJE0WiKXNHEYcU6kgYTbYXfsek9qd/A2f58OPvESW2uXO5Y6FbRt/i0cDCB
	JOPe1mOJvFKdDTemm7z/Aa3kc2DpdpgvIY6KgvyyySPjrA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x63d4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 15:54:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d91b91b6f8so30422761cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 08:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759506891; x=1760111691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KNmotElFnlaj5LbQkx7LCcLT9YxgWwze47fan2qU6Q=;
        b=gMImI03ZN2R0HUj3TNJRlv+AZMI66DSkEXTjuRq9YW5vVXr3LFtzwaL5fNavLx3PQt
         ehnq/6+zkBGS25VoPCeN2Kee3PEZQdIRsE/AeOiuzWQFChtF471qn6FC1giMnxnt2dHm
         dw/eZ4uWxCdrbqxJT1xTI3NaNSJCLWjrGRKa1VdnRLB3QUUU0fceJ8XnPenOyYdShw+S
         pk7QKoOSB5ZPv2mEIONYCHMSZOJqn3Wa4WyB9NvBdewbnIoRdjH5/CQlsVxnr+cDQbew
         Od84iDyTS4lO1Tds6z5LoBE0EZDVMqROe5cOSOHlo8HSTtT6yJ6COkSkKG/cJ1cMNKxW
         Yxtg==
X-Forwarded-Encrypted: i=1; AJvYcCW0TGg+kpD678OhDtQnb2QiA6Kj46B2/WtMUXT1yIFdQxyapBI0tKzsj8Aq5KZhlDlC+mKUjVFYvE7+3XrM@vger.kernel.org
X-Gm-Message-State: AOJu0YwimCRrxLPIlJ4YshQz4gW9MsSO0AamO6S3Jv9tzHsNx9kwvpgs
	PsOZaAoy3nyBAufpXffw1b4vEUkQY0muzQ2tV9uSMGjQREu9J9XCg0W2ocGJoPk/Orv+PjOuY2i
	GbFltPXwaQ7w/rnuGBOCydYtD1na6pswJexnitslQkRZVnTKzvzOGlibJivhUs0HS+bxS
X-Gm-Gg: ASbGncvJegjaZiZT25HOqhq6slX1aSYDzbRJHwrJDnaWNXeYtjSY4IZUK52eYY7xSps
	vOUaMaiA8M5k+7ANig21hQ7ympNEcAOjmGNL1Xmau6QTQ3qTh93Nq8S8ldfysw9WhjNPZCLp0cd
	p2f3NCvmGy5wO08GNiWioFY9zTTiczguuAwVf0JAlg74ehZf7vXO1D5rjqDMX1JbCqJQQn0LoR0
	D8CuhSTGuF4yEM+1kNh/mTRSI9Mw0tTWpS17RzJgaM+DcL/FwfJ0fgl4MaiB3B6dnMEzRrtdDBt
	iB0ymYqfU1eTF4Cir8jIuGlWsqLNgtEE4Ykjlc3WlS0kUtmJt2zraiInos+2OiMcBqVXzGq22uQ
	04TbxaKwQrFaOrReQ9K1sH8sPedJDXesyLeM5MIeGrnurtQpXdlveI9Ed9Q==
X-Received: by 2002:a05:622a:4890:b0:4e5:c50:54ba with SMTP id d75a77b69052e-4e576ad9fb2mr46549991cf.48.1759506890794;
        Fri, 03 Oct 2025 08:54:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1CNpaMEs7/vWvVTmbmetBw7TGt0gaQ/lM1VTgpEfmE9UVsvdaYYBah1HSlhK4uFyguS43LA==
X-Received: by 2002:a05:622a:4890:b0:4e5:c50:54ba with SMTP id d75a77b69052e-4e576ad9fb2mr46549581cf.48.1759506890193;
        Fri, 03 Oct 2025 08:54:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0113f1b4sm1955473e87.47.2025.10.03.08.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 08:54:49 -0700 (PDT)
Date: Fri, 3 Oct 2025 18:54:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Stone <daniel@fooishbar.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <zpygq4kapil3swsmhhqkdwny4ry2dznnzixsw5rkza5p2kqnvp@abvf2vxlbwif>
References: <voknqdv3zte2jzue5yxmysdiixxkogvpblvrccp5gu55x5ycca@srrcscly4ch4>
 <st6wob5hden6ypxt2emzokfhl3ezpbuypv2kdtf5zdrdhlyjfw@l2neflb4uupo>
 <pe6g2fanw65p67kfy5blbtiytngxmr6nkbazymojs4a66yvpl3@7j4ccnsvc6az>
 <20250910-didactic-honored-chachalaca-f233b2@houat>
 <x562ueky2z5deqqmhl222moyrbylfwi35u4hb34dpl3z52ra4c@dyw4iayrewnz>
 <20250925-fervent-merry-beagle-2baba3@penduick>
 <qx5ashx62pufott6hnsfna3qntnoyvxwxze4rihhuxcsdxi37s@bbdvc3sfsgne>
 <20250929-gregarious-worm-of-memory-c5354d@houat>
 <itgffxygopi7etkt7xhvmyuvyl5ad3k43nsxvjzw3ubtwiikn7@ocugfdaigtu7>
 <20251003-uptight-echidna-of-stamina-815305@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003-uptight-echidna-of-stamina-815305@houat>
X-Proofpoint-GUID: fd4amWSS9dpn1KEF55_aCG116FfaGlkG
X-Proofpoint-ORIG-GUID: fd4amWSS9dpn1KEF55_aCG116FfaGlkG
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dff1cc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jTLGwdB_erlPdahj2OIA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX5oBN8cyAhukA
 sEZSy+Am7bL2LvxZWBRCzSOU+EQmLJxnPrf79lCdRhXoI0ytnc+6PDOjoP57uBJpIbTAHf4ypSq
 sUIDEuaZil/nzhwb8UzWj4QzMXyB0FWBu4JjD4O6XVRBwsAi3qPbPzJJmqG+mqEbm7HuyL0R+1A
 Z+vX7HYRxMX8/49FQQ8zD+E5+YMgy7CaromV8QkJN3WnLAWpv3my4qFY9u/pviwMF8y7ep6zvpO
 oQkbCxHM02QgHQtrEmeJFJf7yAKY8qcbFWYFvCX6iV5h/uTUv6N2Lo9vQEYmZ7kCaOJszJrTD3j
 0SJteFJpDcHFpohMVgZhX5zq6FNC0q11Gp6vaMVrjo2aDH8O6nupmnnxfNR/LcllCAg0XD6MBRq
 +zwM6VAg4wzEuvFmZstMH1HB+Hrt2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

On Fri, Oct 03, 2025 at 03:22:23PM +0200, Maxime Ripard wrote:
> On Tue, Sep 30, 2025 at 10:02:28AM +0300, Dmitry Baryshkov wrote:
> > On Mon, Sep 29, 2025 at 03:00:04PM +0200, Maxime Ripard wrote:
> > > On Thu, Sep 25, 2025 at 05:16:07PM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, Sep 25, 2025 at 03:13:47PM +0200, Maxime Ripard wrote:
> > > > > On Wed, Sep 10, 2025 at 06:26:56PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Wed, Sep 10, 2025 at 09:30:19AM +0200, Maxime Ripard wrote:
> > > > > > > On Wed, Sep 03, 2025 at 03:03:43AM +0300, Dmitry Baryshkov wrote:
> > > > > > > > On Tue, Sep 02, 2025 at 08:06:54PM +0200, Maxime Ripard wrote:
> > > > > > > > > On Tue, Sep 02, 2025 at 06:45:44AM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > > On Mon, Sep 01, 2025 at 09:07:02AM +0200, Maxime Ripard wrote:
> > > > > > > > > > > On Sun, Aug 31, 2025 at 01:29:13AM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > > > > On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> > > > > > > > > > > > > Hi Dmitry,
> > > > > > > > > > > > > 
> > > > > > > > > > > > > On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> > > > > > > > > > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > > > > > > > > > It's not uncommon for the particular device to support only a subset of
> > > > > > > > > > > > > > HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> > > > > > > > > > > > > > a model of ignoring the unsupported Infoframes, but it's a bigger
> > > > > > > > > > > > > > problem for the userspace: we end up having files in debugfs which do
> > > > > > > > > > > > > > mot match what is being sent on the wire.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Sort that out, making sure that all interfaces are consistent.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Thanks for the series, it's a really good cleanup.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > I know that dw-hdmi-qp can support _any_ infoframe, by manually
> > > > > > > > > > > > > packing it into the two GHDMI banks. So the supported set there is
> > > > > > > > > > > > > 'all of the currently well-known ones, plus any two others, but only
> > > > > > > > > > > > > two and not more'. I wonder if that has any effect on the interface
> > > > > > > > > > > > > you were thinking about for userspace?
> > > > > > > > > > > > 
> > > > > > > > > > > > I was mostly concerned with the existing debugfs interface (as it is
> > > > > > > > > > > > also used e.g. for edid-decode, etc).
> > > > > > > > > > > > 
> > > > > > > > > > > > It seems "everything + 2 spare" is more or less common (ADV7511, MSM
> > > > > > > > > > > > HDMI also have those. I don't have at hand the proper datasheet for
> > > > > > > > > > > > LT9611 (non-UXC one), but I think its InfoFrames are also more or less
> > > > > > > > > > > > generic).  Maybe we should change debugfs integration to register the
> > > > > > > > > > > > file when the frame is being enabled and removing it when it gets unset.
> > > > > > > > > > > 
> > > > > > > > > > > But, like, for what benefit?
> > > > > > > > > > > 
> > > > > > > > > > > It's a debugfs interface for userspace to consume. The current setup
> > > > > > > > > > > works fine with edid-decode already. Why should we complicate the design
> > > > > > > > > > > that much and create fun races like "I'm running edid-decode in parallel
> > > > > > > > > > > to a modeset that would remove the file I just opened, what is the file
> > > > > > > > > > > now?".
> > > > > > > > > > 
> > > > > > > > > > Aren't we trading that with the 'I'm running edid-decode in paralle with
> > > > > > > > > > to a modeset and the file suddenly becomes empty'?
> > > > > > > > > 
> > > > > > > > > In that case, you know what the file is going to be: empty. And you went
> > > > > > > > > from a racy, straightforward, design to a racy, complicated, design.
> > > > > > > > > 
> > > > > > > > > It was my question before, but I still don't really see what benefits it
> > > > > > > > > would have, and why we need to care about it in the core, when it could
> > > > > > > > > be dealt with in the drivers just fine on a case by case basis.
> > > > > > > > 
> > > > > > > > Actually it can not: debugfs files are registered from the core, not
> > > > > > > > from the drivers. That's why I needed all the supported_infoframes
> > > > > > > > (which later became software_infoframes).
> > > > > > > 
> > > > > > > That's one thing we can change then.
> > > > > > > 
> > > > > > > > Anyway, I'm fine with having empty files there.
> > > > > > > > 
> > > > > > > > > > > > Then in the long run we can add 'slots' and allocate some of the frames
> > > > > > > > > > > > to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
> > > > > > > > > > > > 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
> > > > > > > > > > > > salvaged as another generic one)). MSM HDMI would get 'software AVI',
> > > > > > > > > > > > 'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
> > > > > > > > > > > > want to use). Then the framework might be able to prioritize whether to
> > > > > > > > > > > > use generic slots for important data (as DRM HDR, HDMI) or less important
> > > > > > > > > > > > (SPD).
> > > > > > > > > > > 
> > > > > > > > > > > Why is it something for the framework to deal with? If you want to have
> > > > > > > > > > > extra infoframes in there, just go ahead and create additional debugfs
> > > > > > > > > > > files in your driver.
> > > > > > > > > > > 
> > > > > > > > > > > If you want to have the slot mechanism, check in your atomic_check that
> > > > > > > > > > > only $NUM_SLOT at most infoframes are set.
> > > > > > > > > > 
> > > > > > > > > > The driver can only decide that 'we have VSI, SPD and DRM InfoFrames
> > > > > > > > > > which is -ETOOMUCH for 2 generic slots'. The framework should be able to
> > > > > > > > > > decide 'the device has 2 generic slots, we have HDR data, use VSI and
> > > > > > > > > > DRM InfoFrames and disable SPD for now'.
> > > > > > > > > 
> > > > > > > > > I mean... the spec does? The spec says when a particular feature
> > > > > > > > > requires to send a particular infoframe. If your device cannot support
> > > > > > > > > to have more than two "features" enabled at the same time, so be it. It
> > > > > > > > > something that should be checked in that driver atomic_check.
> > > > > > > > 
> > > > > > > > Sounds good to me. Let's have those checks in the drivers until we
> > > > > > > > actually have seveal drivers performing generic frame allocation.
> > > > > > > > 
> > > > > > > > > Or just don't register the SPD debugfs file, ignore it, put a comment
> > > > > > > > > there, and we're done too.
> > > > > > > > 
> > > > > > > > It's generic code.
> > > > > > > > 
> > > > > > > > > > But... We are not there yet and I don't have clear usecase (we support
> > > > > > > > > > HDR neither on ADV7511 nor on MSM HDMI, after carefully reading the
> > > > > > > > > > guide I realised that ADV7511 has normal audio infoframes). Maybe I
> > > > > > > > > > should drop all the 'auto' features, simplifying this series and land
> > > > > > > > > > [1] for LT9611UXC as I wanted origianlly.
> > > > > > > > > > 
> > > > > > > > > > [1] https://lore.kernel.org/dri-devel/20250803-lt9611uxc-hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com/
> > > > > > > > > 
> > > > > > > > > Looking back at that series, I think it still has value to rely on the
> > > > > > > > > HDMI infrastructure at the very least for the atomic_check sanitization.
> > > > > > > > > 
> > > > > > > > > But since you wouldn't use the generated infoframes, just skip the
> > > > > > > > > debugfs files registration. You're not lying to userspace anymore, and
> > > > > > > > > you get the benefits of the HDMI framework.
> > > > > > > > 
> > > > > > > > We create all infoframe files for all HDMI connectors.
> > > > > > > 
> > > > > > > Then we can provide a debugfs_init helper to register all of them, or
> > > > > > > only some of them, and let the drivers figure it out.
> > > > > > > 
> > > > > > > Worst case scenario, debugfs files will not get created, which is a much
> > > > > > > better outcome than having to put boilerplate in every driver that will
> > > > > > > get inconsistent over time.
> > > > > > 
> > > > > > debugfs_init() for each infoframe or taking some kind of bitmask?
> > > > > 
> > > > > I meant turning hdmi_debugfs_add and create_hdmi_*_infoframe_file into
> > > > > public helpers. That way, drivers that don't care can use the (renamed)
> > > > > hdmi_debugfs_add, and drivers with different constraints can register
> > > > > the relevant infoframes directly.
> > > > 
> > > > Doesn't that mean more boilerplate?
> > > 
> > > I don't think it would? In the general case, it wouldn't change
> > > anything, and in special cases, then it's probably going to be different
> > > from one driver to the next so there's not much we can do.
> > > 
> > > > In the end, LT9611UXC is a special case, for which I'm totally fine
> > > > not to use HDMI helpers at this point: we don't control infoframes
> > > > (hopefully that can change), we don't care about the TMDS clock, no
> > > > CEC, etc.
> > > 
> > > Not using the helpers sound pretty reasonable here too.
> > > 
> > > > For all other usecases I'm fine with having atomic_check() unset all
> > > > unsupported infoframes and having empty files in debugfs. Then we can
> > > > evolve over the time, once we see a pattern. We had several drivers
> > > > which had very limited infoframes support, but I think this now gets
> > > > sorted over the time.
> > > 
> > > I never talked about atomic_check()? You were initially concerned that
> > > the framework would expose data in debugfs that it's not using. Not
> > > registering anything in debugfs solves that, but I'm not sure we need to
> > > special case atomic_check.
> > 
> > Well... I ended up with [1], handling infoframes in the atomic_check()
> > rather than registering fewer infoframe debugfs files. This way device
> > state is consistent, we don't have enabled instances, etc. However it
> > results in repetetive code in atomic_check().
> > 
> > [1] https://lore.kernel.org/dri-devel/20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com/
> 
> I guess we can continue the discussion there, but I'm not sure we want
> to have more boilerplate in drivers, and especially in the atomic_check
> part. If drivers are inconsistent or wrong in the debugfs path, there's
> no major issue. If they are wrong in the atomic_check path, it will lead
> to regressions, possibly in paths that are pretty hard to test.

You've responded there and I can drop the extra handling for HDR DRM and
audio infoframes in the atomic_check(). What is your opinion about the
atomic_check() unsetting the infoframe->set for SPD and HDMI infoframes?


-- 
With best wishes
Dmitry

