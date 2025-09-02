Return-Path: <linux-arm-msm+bounces-71471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDD1B3F2D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 05:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2E263B40B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 03:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0242264B7;
	Tue,  2 Sep 2025 03:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ev9pT7Vo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C893D33991
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 03:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756784752; cv=none; b=hej3DCgPwdoWuwzlPEbFx2DH/1QFgofZ60kOyXHTNKYhtOoV2WeeyyGmaZRLwmAdfQOiLawAVrFfxDjS3WARjnQLkV+jFx/kuIwdRewR0RNc2QaxfDQpLgb7xFbFhcyOkRgoUVwxVi3h6G+N8+ZDmnFtEUFIR0lV8FnRLKoQgXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756784752; c=relaxed/simple;
	bh=TmYw1+7gmutm1vP/37YJB5NOjarMaEoWj+WqM5xv7hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KeOLjQ4MgewjrDKhl1uBL+9xXr+Q/oop6ue84TmMjRfKlFf2OZTUlKhBSXRzo+eUwbjk5OCgnRHsRmkJVUDNyCxQsviGnKVJVYxLiYZQcNC6F4k1Dr2uQkz94BSTn//7c9jWnEHYiFaPbceeycTKn7YvL8o4dZiTxlr0duWeo3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ev9pT7Vo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822Rnsa029660
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 03:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u6pXxYvTpFhxbjh80IOUWJOQ
	14f2Hl+NCOsXpDoJFW0=; b=Ev9pT7Vohd0UOB4LnTx/IZrhMtHulcxpfjHQMKUB
	5u/wMkziB4dzmBnAFLVx58QV1K8TDsrSiJfyBGOBWYiQCEKZkU6OUm0KbPHN4zlW
	ejptTarpiOyuDXmL03ukZbF4K1AfSDOP9b5cojzU7kGGn+BClV04TEWmHQeKybXe
	ds5k7eFix+bNnbuRSHptuH4a12WISUyNCf1IzRCib77WLOF7AjnR/HFg1ZO2y8zh
	HTnj8P/tr1VD6TDZIdCwA7tXAbgNG6NGr+0S9cAzaFa8+4JNa6K3med4PBeaeBLO
	aX+/UhkaHqV3kpC4Zc8Fud+ioRUwYoPqZlpIaooTP8WLUQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8pbsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 03:45:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70de52d2904so122197906d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 20:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756784749; x=1757389549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6pXxYvTpFhxbjh80IOUWJOQ14f2Hl+NCOsXpDoJFW0=;
        b=PgSd6SbF6LP8j88F7fq1TyMaMdt+sFgZxWCENa6usWRIJ1VjDJQhzenLMLO2H2Z0NE
         B9wl3fpsq8byutazoSuVibr7rPUL2wWzsH1jgdYqgrIn0aolDwDWtakmZHWaTl3yhSDJ
         h8AN+c7en/KRlImjKAf+uJ20ojnb8dunin9Kiq0NxSF/NIr/BeSEGm2hkbf4HlKSkgAz
         ISW6cYRtuUObl2G1fzZBkcBj9V9TvWwLnb7Vb6ph0kEgCPdWJW5W51Rk9nMZOLfTKJIg
         ncWsRTz0QjPpuAbc+oYfpvgka0tbcNpdYKWiadkxrODB8GiFioLtdqm0sNeOleSLBkaT
         Ir5w==
X-Forwarded-Encrypted: i=1; AJvYcCXQb+Vj0o2alglO+X9UjkBzk3gB9FMS1MG56TvDbo5vychGxzvp0T9O618kFCg32sVUk5F7BjUvGnHJPwzp@vger.kernel.org
X-Gm-Message-State: AOJu0YxoDiiJjP3dCjZPNKDZiXhb0f+U2j+iwnM0TH3Ucz7E42kjmkp7
	CUcaVatOIoPqpD7Sd+Vditz15TLZ5o4llKeS9ENWZI0IxbgD6Nw/RUbOKIJVzJt0YrqPEaQSmVT
	shIYMCD/rP6rDGLP3jBnNEWNMZ7sXhEq9PbirlqZxXYbcJba/os76n6HOz8NgJ3m9TwK2
X-Gm-Gg: ASbGncsgCcTXGDZi26Vb/OqsVqCSI3vqFF3BbUEGnnsH5TAiepQezU/rgDx9K9RfwnD
	JHkg1tJyCuwD+YhvlVl+eHFZSwXpFI1stIK2roCQw167LNQ5GMZs5ZK0Y6bt/hbw+lUnDQDJVPM
	MBIPkPiY3lhh6O027cIj56UdOHJES9nL4ZTlV9vo0wjFTmm+Dy9A7nuskTPlZQWpu5gmuf5AKYK
	EF6R24KxBt6ynwKXRC/NaT2KTXw8IlN3mESPMe6UFQ9K3ATeh2RnO6UnASCCVckSobSPIfONzaq
	MRc4/Cx0N7GUjGhmlLI8wookRhWlUlmUhAD+E/g9bt18JrsrI5EvaLaHJQJG8B34eNqDFIsMYD2
	41GFCYPU+e4728uF3aJRTBWk/zpe2MjI20e79trLvmyuzDoEB+a5p
X-Received: by 2002:a05:6214:414:b0:70d:eb6d:b7f0 with SMTP id 6a1803df08f44-70fac700c86mr114372006d6.10.1756784748490;
        Mon, 01 Sep 2025 20:45:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW9DgkBw+MvElYTBWkwujyNrejM+p6uDFpj7XgGpJNMn2Ua2wxQ/b8FTcUSXpCO+uXL3IIqQ==
X-Received: by 2002:a05:6214:414:b0:70d:eb6d:b7f0 with SMTP id 6a1803df08f44-70fac700c86mr114371806d6.10.1756784747861;
        Mon, 01 Sep 2025 20:45:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560827900absm337975e87.66.2025.09.01.20.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 20:45:46 -0700 (PDT)
Date: Tue, 2 Sep 2025 06:45:44 +0300
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
Message-ID: <voknqdv3zte2jzue5yxmysdiixxkogvpblvrccp5gu55x5ycca@srrcscly4ch4>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
 <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
 <20250901-voracious-classy-hedgehog-ee28ef@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-voracious-classy-hedgehog-ee28ef@houat>
X-Proofpoint-ORIG-GUID: xr6zeagD0unSTltyHyYx_jCLVYM5Tsms
X-Proofpoint-GUID: xr6zeagD0unSTltyHyYx_jCLVYM5Tsms
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX8zJDAtUndlOu
 7Rf3Qm+RLx69q4NZqOIrya66PCY0qOkH0zT1UbB0L62z8M51haJ+QX1t3yy33gveI9dtVrpE/Rc
 NXXY06Vqneya/UOuMRW/lqbnfA9Vs0uHnAwkQFA6U/0fz5bFFn3ZiqzAzJu/WM84G2ELGZBhERd
 VMMdDA/vr4o3nW9rRmGiY7Ydw2mAX/vVR3AjcKJZnEJ18r6z7B2fEfoDZghJ/QabvxhRhf4DRXV
 zFlvOx8X72AP9eN5f2PHvtNDZUJOGOxrWit/nLtkLTltbxu5FaZbUgT+NlX1EVHLWsWt7tgt6qv
 LRCAMVOw6Zu5nhS1zAOODC1hFdYseULinDmd11tqN7DC3GPH8X07eczVobm6JmhAZeiXLHvHype
 GxPga4o+
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b6686d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pHNJB9hyKJ2XXRMnjhQA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On Mon, Sep 01, 2025 at 09:07:02AM +0200, Maxime Ripard wrote:
> On Sun, Aug 31, 2025 at 01:29:13AM +0300, Dmitry Baryshkov wrote:
> > On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> > > Hi Dmitry,
> > > 
> > > On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > It's not uncommon for the particular device to support only a subset of
> > > > HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> > > > a model of ignoring the unsupported Infoframes, but it's a bigger
> > > > problem for the userspace: we end up having files in debugfs which do
> > > > mot match what is being sent on the wire.
> > > >
> > > > Sort that out, making sure that all interfaces are consistent.
> > > 
> > > Thanks for the series, it's a really good cleanup.
> > > 
> > > I know that dw-hdmi-qp can support _any_ infoframe, by manually
> > > packing it into the two GHDMI banks. So the supported set there is
> > > 'all of the currently well-known ones, plus any two others, but only
> > > two and not more'. I wonder if that has any effect on the interface
> > > you were thinking about for userspace?
> > 
> > I was mostly concerned with the existing debugfs interface (as it is
> > also used e.g. for edid-decode, etc).
> > 
> > It seems "everything + 2 spare" is more or less common (ADV7511, MSM
> > HDMI also have those. I don't have at hand the proper datasheet for
> > LT9611 (non-UXC one), but I think its InfoFrames are also more or less
> > generic).  Maybe we should change debugfs integration to register the
> > file when the frame is being enabled and removing it when it gets unset.
> 
> But, like, for what benefit?
> 
> It's a debugfs interface for userspace to consume. The current setup
> works fine with edid-decode already. Why should we complicate the design
> that much and create fun races like "I'm running edid-decode in parallel
> to a modeset that would remove the file I just opened, what is the file
> now?".

Aren't we trading that with the 'I'm running edid-decode in paralle with
to a modeset and the file suddenly becomes empty'?

> > Then in the long run we can add 'slots' and allocate some of the frames
> > to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
> > 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
> > salvaged as another generic one)). MSM HDMI would get 'software AVI',
> > 'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
> > want to use). Then the framework might be able to prioritize whether to
> > use generic slots for important data (as DRM HDR, HDMI) or less important
> > (SPD).
> 
> Why is it something for the framework to deal with? If you want to have
> extra infoframes in there, just go ahead and create additional debugfs
> files in your driver.
> 
> If you want to have the slot mechanism, check in your atomic_check that
> only $NUM_SLOT at most infoframes are set.

The driver can only decide that 'we have VSI, SPD and DRM InfoFrames
which is -ETOOMUCH for 2 generic slots'. The framework should be able to
decide 'the device has 2 generic slots, we have HDR data, use VSI and
DRM InfoFrames and disable SPD for now'.

But... We are not there yet and I don't have clear usecase (we support
HDR neither on ADV7511 nor on MSM HDMI, after carefully reading the
guide I realised that ADV7511 has normal audio infoframes). Maybe I
should drop all the 'auto' features, simplifying this series and land
[1] for LT9611UXC as I wanted origianlly.

[1] https://lore.kernel.org/dri-devel/20250803-lt9611uxc-hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com/

-- 
With best wishes
Dmitry

