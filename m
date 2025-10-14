Return-Path: <linux-arm-msm+bounces-77235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1925BDA7A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 17:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0ED819A0CF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 15:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82AA13002B9;
	Tue, 14 Oct 2025 15:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKjkkwy1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6655A301466
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760456908; cv=none; b=GKEpY+k/DZnKjEfIqDm4EC8VxTdPB7O98OAM1NI2L+1KucUN9UYonD3Ia+MNeQ+tGaL9Sim95SrsW93U+/Zkz9DhearrSUxiMm0GsWjAZy35TuhznlNHPCxgfHfxC8FUZRDT+p0XGQ/HCSUUKOk/7YnZQEUK8/UXbBrzmebWj2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760456908; c=relaxed/simple;
	bh=AnyUasWkeoB8jjew4eeBbK3ca6UTXtNvks6eEnN1E58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Il78dtcJiauRovYRTmDy7IxqE7tsiB/la9Nqd93gl08O0XsYVryIAl9uvTeHpZ4bVf81ZZMIYsddSXISCUJ1qbkOGTemlviRyGPOXw8ekRbH6ubpSp3KDkSh8DXFfP812SaFHzFkjADCHgobRR7WnMiL5f3LViPgECDPtr9113c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKjkkwy1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Jm8031029
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bnUd9WqqTC6gg1NeEhBqMnCO
	5PDnLeEfEL4vvYOYjD8=; b=hKjkkwy1uKNr0ggYlgTQObOeDp6guhKz/etIqcij
	MYvHfh3wvPphite+QMe/OB7W8Cjs/6SXnqBp4D2aqRnmooKmp/ITECvo8QQO4/DR
	nOts7Rqq9O3L2g5cFMGaZINOIMx3zeremL+MJtBgM6TWzFcbwGTwAJeqVSRfD94h
	xqe5T2wcbsZQhMvURH/eASTgGUnT4ehOVSWWsZmDoDqBZ83QbA+JTJ9cqujcHPV7
	oHT29VVuff8nfWz4FstI6wMC/8M6XbbLWaTx64duHptIuTTuIig7JGXs6DfkFqv7
	jpr6yIP9SM8xO/cJkBu33lh1T7wfAdiv1CZF6TY66BDabg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0s3ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:48:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8544316ef6aso1260368185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760456904; x=1761061704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnUd9WqqTC6gg1NeEhBqMnCO5PDnLeEfEL4vvYOYjD8=;
        b=jzUBaplR4Pv6JkBS4wE91LBpcJT+tHVsis0p+Ad7vZOMrYoPsVjlGb0N7lcxfWS2Qb
         f5HP3ON8lyQ5opABy3z97TF/wKtOEouclvElLAt4EuDezdkqz6qcbmKZxpHJktDZ2M/3
         /gc7oYS5JxdAT3GUCB7qG+baXDfQqiHoJxTxBYWTRWB8YVcC6vtU9w3VYIhSozQ9VCGV
         C+nLQ4fAvtINTayuFVAHbiZJnJ3BvICw26bDuczARwjzYTDIlsPohPDju1+eYls+lxja
         qebuQ/+mCCvv/CAkHZHrWAe/NYkH8s/lFyN3TQThJG0uaAxqMwEUnDM9QWsQLWSCpG5P
         aNCA==
X-Forwarded-Encrypted: i=1; AJvYcCVMm0VMXdDRLILln3yWAHbANLM6j74PW/QbEkwil1eRWkiLNwJWar92iS+Fz4YFXGnDS2zNORZcRWLHTDb0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7/KL4EgdTbr9ovLGzfjKIj9zHHxvvpgjm+8RKIldLmlXuWJg
	DS7mfrlgTHmK3bti6X5otwWCLzTmkoMMyQEFC20TuZ0ytzSW4+8+35EJRWDi9YTIgZLUvKzV9Q2
	HKXSI5HXpdJF7ma4kVbgeVF+5cL0w+5eD0yP0Bjz1BuXK7ndxZSn/bLtpnhqaQT2c3s2/
X-Gm-Gg: ASbGnctdEPX3dTYSaw31DJRzxbGrkKjouGCSNbppX56iqipqKd5+FCG0iKeBvDE0ihl
	NZOFTYNTxbTW/LjF/VpSVAx3mT8WLT7q1Ve+rOQl3UlG5w+kgsgPSXe+7FAIp4ejgAYXDo/YS1q
	v/Ca7kBOA5yUzlkE/svqrfyyOmmgMIPPmWIOYzNYp2IgVQDlNFh9tL7hqp4S4maSXoD+s70FcAW
	ahgGnQoXXdIzNaKBRghbci9QJ9gMTSGHskqBW2xT2+mtL7ZxXYYbm9Of34xZRk7ckHmOLOZOyyb
	dkyWmKsU4B4AbXSrk4WY0D8PRBgoAuhD/bLCyMSA9PcpjU6tDaNhPLdboxeTYK3jvBAEW97Ki7g
	4+lNUke8GGsYw1J+bzowZVjywM/y+dCKy6blC6Dqm1ZeiFkXsAlhE
X-Received: by 2002:a05:620a:1a13:b0:85c:bb2:ad8e with SMTP id af79cd13be357-88353b341admr3454184485a.48.1760456904035;
        Tue, 14 Oct 2025 08:48:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1kVRNLAt5bA1+d0KSwa3ylw1lBL0Up7cJNOapKT1tEcg4YRx4k8gLeEELCdscxWsjHRglgw==
X-Received: by 2002:a05:620a:1a13:b0:85c:bb2:ad8e with SMTP id af79cd13be357-88353b341admr3454175485a.48.1760456903342;
        Tue, 14 Oct 2025 08:48:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881f919fsm5367578e87.36.2025.10.14.08.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:48:21 -0700 (PDT)
Date: Tue, 14 Oct 2025 18:48:19 +0300
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
Message-ID: <pibxhl5hlcpuk3zsgyienfdlda5cwuxrnofwlw356scuzzplqy@zw3ofelgvwik>
References: <pe6g2fanw65p67kfy5blbtiytngxmr6nkbazymojs4a66yvpl3@7j4ccnsvc6az>
 <20250910-didactic-honored-chachalaca-f233b2@houat>
 <x562ueky2z5deqqmhl222moyrbylfwi35u4hb34dpl3z52ra4c@dyw4iayrewnz>
 <20250925-fervent-merry-beagle-2baba3@penduick>
 <qx5ashx62pufott6hnsfna3qntnoyvxwxze4rihhuxcsdxi37s@bbdvc3sfsgne>
 <20250929-gregarious-worm-of-memory-c5354d@houat>
 <itgffxygopi7etkt7xhvmyuvyl5ad3k43nsxvjzw3ubtwiikn7@ocugfdaigtu7>
 <20251003-uptight-echidna-of-stamina-815305@houat>
 <zpygq4kapil3swsmhhqkdwny4ry2dznnzixsw5rkza5p2kqnvp@abvf2vxlbwif>
 <2a5fitdzr2bz235fj6rvqzxr6ckszkjbazjfszlvnizdh2cvbt@w3ypjo7vahhs>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a5fitdzr2bz235fj6rvqzxr6ckszkjbazjfszlvnizdh2cvbt@w3ypjo7vahhs>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX5ympZf+zdUHC
 /1l0xyOIW2ny4osdqTv6eF8QN4WG8m4/Gc1c4FctFMsv5WIiUh1vC0vmGGPbq+DHS9D6v8vSMpw
 g3bdbSdeF9g87BOMvt9dpfZfhXd6T831OoMpMtGakCmhZHNDMFEWFakx4STNPS0TtNi2zSZ8/Vq
 82URyD170yGAupxEKJi+xBLZyKYdmdUbILfs2hMURy8hAVuA017bLX0FWYaYGQdQJHGpIvToFMV
 YmSW5D0ueKopD39WSrO/c6fDQ4s1mrHNrb/oUV3KuiMoKSctgw0mJnmd+RS9T+nJ0ncftRP9FQk
 BcOnsjBV+KxnaAasW4tbUaI1f6sw19p9th+RjeXYg==
X-Proofpoint-GUID: 6xR_8fhrANEnrKLvQrmVTdVF6DoENcY7
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ee70c9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Vph1PE5xcNG2gXNXWn0A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 6xR_8fhrANEnrKLvQrmVTdVF6DoENcY7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Tue, Oct 14, 2025 at 02:59:43PM +0200, Maxime Ripard wrote:
> On Fri, Oct 03, 2025 at 06:54:47PM +0300, Dmitry Baryshkov wrote:
> > On Fri, Oct 03, 2025 at 03:22:23PM +0200, Maxime Ripard wrote:
> > > On Tue, Sep 30, 2025 at 10:02:28AM +0300, Dmitry Baryshkov wrote:
> > > > On Mon, Sep 29, 2025 at 03:00:04PM +0200, Maxime Ripard wrote:
> > > > > On Thu, Sep 25, 2025 at 05:16:07PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Thu, Sep 25, 2025 at 03:13:47PM +0200, Maxime Ripard wrote:
> > > > > > > On Wed, Sep 10, 2025 at 06:26:56PM +0300, Dmitry Baryshkov wrote:
> > > > > > > > On Wed, Sep 10, 2025 at 09:30:19AM +0200, Maxime Ripard wrote:
> > > > > > > > > On Wed, Sep 03, 2025 at 03:03:43AM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > > On Tue, Sep 02, 2025 at 08:06:54PM +0200, Maxime Ripard wrote:
> > > > > > > > > > > On Tue, Sep 02, 2025 at 06:45:44AM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > > > > On Mon, Sep 01, 2025 at 09:07:02AM +0200, Maxime Ripard wrote:
> > > > > > > > > > > > > On Sun, Aug 31, 2025 at 01:29:13AM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > > > > > > On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> > > > > > > > > > > > > > > Hi Dmitry,
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> > > > > > > > > > > > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > > > > > > > > > > > It's not uncommon for the particular device to support only a subset of
> > > > > > > > > > > > > > > > HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> > > > > > > > > > > > > > > > a model of ignoring the unsupported Infoframes, but it's a bigger
> > > > > > > > > > > > > > > > problem for the userspace: we end up having files in debugfs which do
> > > > > > > > > > > > > > > > mot match what is being sent on the wire.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Sort that out, making sure that all interfaces are consistent.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Thanks for the series, it's a really good cleanup.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > I know that dw-hdmi-qp can support _any_ infoframe, by manually
> > > > > > > > > > > > > > > packing it into the two GHDMI banks. So the supported set there is
> > > > > > > > > > > > > > > 'all of the currently well-known ones, plus any two others, but only
> > > > > > > > > > > > > > > two and not more'. I wonder if that has any effect on the interface
> > > > > > > > > > > > > > > you were thinking about for userspace?
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > I was mostly concerned with the existing debugfs interface (as it is
> > > > > > > > > > > > > > also used e.g. for edid-decode, etc).
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > It seems "everything + 2 spare" is more or less common (ADV7511, MSM
> > > > > > > > > > > > > > HDMI also have those. I don't have at hand the proper datasheet for
> > > > > > > > > > > > > > LT9611 (non-UXC one), but I think its InfoFrames are also more or less
> > > > > > > > > > > > > > generic).  Maybe we should change debugfs integration to register the
> > > > > > > > > > > > > > file when the frame is being enabled and removing it when it gets unset.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > But, like, for what benefit?
> > > > > > > > > > > > > 
> > > > > > > > > > > > > It's a debugfs interface for userspace to consume. The current setup
> > > > > > > > > > > > > works fine with edid-decode already. Why should we complicate the design
> > > > > > > > > > > > > that much and create fun races like "I'm running edid-decode in parallel
> > > > > > > > > > > > > to a modeset that would remove the file I just opened, what is the file
> > > > > > > > > > > > > now?".
> > > > > > > > > > > > 
> > > > > > > > > > > > Aren't we trading that with the 'I'm running edid-decode in paralle with
> > > > > > > > > > > > to a modeset and the file suddenly becomes empty'?
> > > > > > > > > > > 
> > > > > > > > > > > In that case, you know what the file is going to be: empty. And you went
> > > > > > > > > > > from a racy, straightforward, design to a racy, complicated, design.
> > > > > > > > > > > 
> > > > > > > > > > > It was my question before, but I still don't really see what benefits it
> > > > > > > > > > > would have, and why we need to care about it in the core, when it could
> > > > > > > > > > > be dealt with in the drivers just fine on a case by case basis.
> > > > > > > > > > 
> > > > > > > > > > Actually it can not: debugfs files are registered from the core, not
> > > > > > > > > > from the drivers. That's why I needed all the supported_infoframes
> > > > > > > > > > (which later became software_infoframes).
> > > > > > > > > 
> > > > > > > > > That's one thing we can change then.
> > > > > > > > > 
> > > > > > > > > > Anyway, I'm fine with having empty files there.
> > > > > > > > > > 
> > > > > > > > > > > > > > Then in the long run we can add 'slots' and allocate some of the frames
> > > > > > > > > > > > > > to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
> > > > > > > > > > > > > > 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
> > > > > > > > > > > > > > salvaged as another generic one)). MSM HDMI would get 'software AVI',
> > > > > > > > > > > > > > 'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
> > > > > > > > > > > > > > want to use). Then the framework might be able to prioritize whether to
> > > > > > > > > > > > > > use generic slots for important data (as DRM HDR, HDMI) or less important
> > > > > > > > > > > > > > (SPD).
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Why is it something for the framework to deal with? If you want to have
> > > > > > > > > > > > > extra infoframes in there, just go ahead and create additional debugfs
> > > > > > > > > > > > > files in your driver.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > If you want to have the slot mechanism, check in your atomic_check that
> > > > > > > > > > > > > only $NUM_SLOT at most infoframes are set.
> > > > > > > > > > > > 
> > > > > > > > > > > > The driver can only decide that 'we have VSI, SPD and DRM InfoFrames
> > > > > > > > > > > > which is -ETOOMUCH for 2 generic slots'. The framework should be able to
> > > > > > > > > > > > decide 'the device has 2 generic slots, we have HDR data, use VSI and
> > > > > > > > > > > > DRM InfoFrames and disable SPD for now'.
> > > > > > > > > > > 
> > > > > > > > > > > I mean... the spec does? The spec says when a particular feature
> > > > > > > > > > > requires to send a particular infoframe. If your device cannot support
> > > > > > > > > > > to have more than two "features" enabled at the same time, so be it. It
> > > > > > > > > > > something that should be checked in that driver atomic_check.
> > > > > > > > > > 
> > > > > > > > > > Sounds good to me. Let's have those checks in the drivers until we
> > > > > > > > > > actually have seveal drivers performing generic frame allocation.
> > > > > > > > > > 
> > > > > > > > > > > Or just don't register the SPD debugfs file, ignore it, put a comment
> > > > > > > > > > > there, and we're done too.
> > > > > > > > > > 
> > > > > > > > > > It's generic code.
> > > > > > > > > > 
> > > > > > > > > > > > But... We are not there yet and I don't have clear usecase (we support
> > > > > > > > > > > > HDR neither on ADV7511 nor on MSM HDMI, after carefully reading the
> > > > > > > > > > > > guide I realised that ADV7511 has normal audio infoframes). Maybe I
> > > > > > > > > > > > should drop all the 'auto' features, simplifying this series and land
> > > > > > > > > > > > [1] for LT9611UXC as I wanted origianlly.
> > > > > > > > > > > > 
> > > > > > > > > > > > [1] https://lore.kernel.org/dri-devel/20250803-lt9611uxc-hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com/
> > > > > > > > > > > 
> > > > > > > > > > > Looking back at that series, I think it still has value to rely on the
> > > > > > > > > > > HDMI infrastructure at the very least for the atomic_check sanitization.
> > > > > > > > > > > 
> > > > > > > > > > > But since you wouldn't use the generated infoframes, just skip the
> > > > > > > > > > > debugfs files registration. You're not lying to userspace anymore, and
> > > > > > > > > > > you get the benefits of the HDMI framework.
> > > > > > > > > > 
> > > > > > > > > > We create all infoframe files for all HDMI connectors.
> > > > > > > > > 
> > > > > > > > > Then we can provide a debugfs_init helper to register all of them, or
> > > > > > > > > only some of them, and let the drivers figure it out.
> > > > > > > > > 
> > > > > > > > > Worst case scenario, debugfs files will not get created, which is a much
> > > > > > > > > better outcome than having to put boilerplate in every driver that will
> > > > > > > > > get inconsistent over time.
> > > > > > > > 
> > > > > > > > debugfs_init() for each infoframe or taking some kind of bitmask?
> > > > > > > 
> > > > > > > I meant turning hdmi_debugfs_add and create_hdmi_*_infoframe_file into
> > > > > > > public helpers. That way, drivers that don't care can use the (renamed)
> > > > > > > hdmi_debugfs_add, and drivers with different constraints can register
> > > > > > > the relevant infoframes directly.
> > > > > > 
> > > > > > Doesn't that mean more boilerplate?
> > > > > 
> > > > > I don't think it would? In the general case, it wouldn't change
> > > > > anything, and in special cases, then it's probably going to be different
> > > > > from one driver to the next so there's not much we can do.
> > > > > 
> > > > > > In the end, LT9611UXC is a special case, for which I'm totally fine
> > > > > > not to use HDMI helpers at this point: we don't control infoframes
> > > > > > (hopefully that can change), we don't care about the TMDS clock, no
> > > > > > CEC, etc.
> > > > > 
> > > > > Not using the helpers sound pretty reasonable here too.
> > > > > 
> > > > > > For all other usecases I'm fine with having atomic_check() unset all
> > > > > > unsupported infoframes and having empty files in debugfs. Then we can
> > > > > > evolve over the time, once we see a pattern. We had several drivers
> > > > > > which had very limited infoframes support, but I think this now gets
> > > > > > sorted over the time.
> > > > > 
> > > > > I never talked about atomic_check()? You were initially concerned that
> > > > > the framework would expose data in debugfs that it's not using. Not
> > > > > registering anything in debugfs solves that, but I'm not sure we need to
> > > > > special case atomic_check.
> > > > 
> > > > Well... I ended up with [1], handling infoframes in the atomic_check()
> > > > rather than registering fewer infoframe debugfs files. This way device
> > > > state is consistent, we don't have enabled instances, etc. However it
> > > > results in repetetive code in atomic_check().
> > > > 
> > > > [1] https://lore.kernel.org/dri-devel/20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com/
> > > 
> > > I guess we can continue the discussion there, but I'm not sure we want
> > > to have more boilerplate in drivers, and especially in the atomic_check
> > > part. If drivers are inconsistent or wrong in the debugfs path, there's
> > > no major issue. If they are wrong in the atomic_check path, it will lead
> > > to regressions, possibly in paths that are pretty hard to test.
> > 
> > You've responded there and I can drop the extra handling for HDR DRM and
> > audio infoframes in the atomic_check(). What is your opinion about the
> > atomic_check() unsetting the infoframe->set for SPD and HDMI infoframes?
> 
> HDMI infoframes are mandatory, so that's a big no-no.

Nevertheless... There are drivers (sun4i, inno_hdmi, rk3066, dw_hdmi_qp)
which don't (yet) implement VSI support.

> For SPD, It's really not clear to me why atomic_check should do that in
> the first place. Your initial concern was about exposing infoframes in
> debugfs that wouldn't be used by the driver.
> 
> If the driver doesn't register a debugfs file for SPD, and ignores
> whatever is in the atomic state, what's should we force drivers to do
> that?

I really don't think that drivers should mess up with debugfs on their
own. Making atomic_check() disable the unsupported InfoFrames makes the
picture perfect: the DRM no longer tries to program them to the
hardware, DebugFS files stay empty, so the whole state becomes
consistent.


-- 
With best wishes
Dmitry

