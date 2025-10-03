Return-Path: <linux-arm-msm+bounces-75922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E470BB75B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 17:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9E3519C20DC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 15:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340A7285419;
	Fri,  3 Oct 2025 15:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RQhTjBBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9874A1E515
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 15:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759506241; cv=none; b=h/w+oha7QeNvVjjSjrGAFIdFvaLRJoNOHTy3Kpa3myd2Ts3KuQRl26buIoV1uFPxpHkPl+WY3pSI9eZu6iPO6L3YSN5o3PJkSSWssPNU/E+QQhB9aksHthhgZmVV5RrYJiBGv/ieOikkHYQ16ete904cWzq2Y5tTW24+AqKuDeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759506241; c=relaxed/simple;
	bh=EwuCDLp3UGb2sm7TMDHWreL8JOXB1q9zlPAciIf0E6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1zRVwS570c7NPkoDQRyCfgKdnCq+VPiFZRFpQBlbXctSchTW7Xe7rX5n31TtIEcwOQYFJIKU0yukD6XU7MP07Wuy3gX0VMxwmcSge+fV3RueVWOWi+T+4cy6RkHJgFau5z4kow6BGOBGQZ3qO/MO1EWFdcfNekTYVcMRVdWm+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RQhTjBBW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593BnJYd017795
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 15:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VpmyCQSwVSHUoaXADoES/PS2
	Nt6wPPE5Oo+SQuYPBFo=; b=RQhTjBBWXy492ZQ5oitl0/ncU2RqsCJsP2iZnU4/
	cUN5xZlWLiZKAgzdI/upQ6hgeHC5hN5lGTsXhIlE2XfbVI9TZY1UHCZD3Gd4muff
	1QUMrbTLtwCnTRi3vQnqUGdb67iiCXim4OwNQdi88K+iJcl0u8bzP3erzkLJVgwJ
	GrOSD4NOcyLp8g74JHe84L71gnkVAYo91PfzFUgQnlj1AH6bPIBy9I6Vt3glm0xv
	uYB6B4ifRgZASNHtWgSGItx8azVoLR2LfRA+ZMnmIX9q/dzd8yUUqIi54P34USpd
	oGdgu/BFubo9pMFvi9GBOx7ztXIYy6oosMUypb4nOTitvQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrfcree-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 15:43:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7e90f268f62so42138366d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 08:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759506237; x=1760111037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpmyCQSwVSHUoaXADoES/PS2Nt6wPPE5Oo+SQuYPBFo=;
        b=viAvfY01D0ro7ljb/yhRNbn5Wx7pq7vIjkKSw9ds/LdCZfQxbnZS34EY92filOA90z
         HJM7hwSCo03BrgWj9JyNbZJFyARRJiWSZPRO+GTGXp09GkXR4POzAWMDp8LvmNxCG1aB
         CgT5f09fxFF3BsixIkcPmvzLj58mBURIF4FjQaajQGkVjnk/jkIcttEbo5yb8RG0phP9
         kPq7zl8rohmAxSis6QdD8CB9ym848XJiL1LcjcFm9+b5uB9CIHkDHjqQAlP8nCxn0Vmc
         vpaZXMoup64y3UH69+cg19s/l5rl7Mi58LO0xKqhx767vla93N//FPQMxsTW/Ts/9+f0
         3fHg==
X-Forwarded-Encrypted: i=1; AJvYcCVy1TjNnMtqoLY4d7Sa4bxMY/1wW0R0RLGMW4iIFvhRiYlrAPXofP1dux5P2rXM8XbjQ9K4+Dloc37XlcfS@vger.kernel.org
X-Gm-Message-State: AOJu0YzEjjQtuJA5mKvllMbnQepRNmw1CmjyCtLdwtek/i482anV6FLz
	ibux2o9hz5sDvxBMhZNWUkRrnPonvPOeumqKh91En41Gs4zpKzWVj1nYgLW65HAYWcaKxCHbPY1
	m+AoiBbnMG0BMBK+bwLP/gKyZMTDs618LagniuHMKLb3mGgFGFfltvdW4VzV7HzP3e23Y
X-Gm-Gg: ASbGncsQFBPMKYNTS1EiungOG70ndRaU1eIAbG013e4KLY2c39nplL3UIRNIdTkJQsp
	Cghm9JDwnmsiqpOn2W2kNjqaDcwSYNWC5Lyqhmk3RFwVb6WU5Eu4vCcXdekisG1f7tCbF7L6DXN
	f59Qojo+YzNZlfZfkEhgXMquHAtz+DpmbVzzgR4Wh80pnzjDLayJ/2oLQzu8tkk5Hvo+nl0xAI4
	Zs/6aIjGShFRRKUfTyAdGmOJrB7kXKNfgZCVVCT9Xq/19dia7O4l6TBXqqYwzt/aeu7S17T6fSJ
	AyqxWO2RrOZSFIYl6ygc/blD+JjkoISZqpOumPVDO3hDI2eKCi1IdlX97qdL826Ql/PYx651vO0
	mGqiplhlQfJ7vSQu9a8CzmX6suNbST+94vAP1JaY+hBwmTq1c3bsQYdRGrw==
X-Received: by 2002:a05:622a:4c18:b0:4b7:92f1:d641 with SMTP id d75a77b69052e-4e576a3c983mr44723621cf.22.1759506237312;
        Fri, 03 Oct 2025 08:43:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk8KP0+qQBfiT0cQx5+NTnJD4fSS7hPt/F8OokeMKesiR9A8s7Hs/Ap+66bRDgWCPAER6T+w==
X-Received: by 2002:a05:622a:4c18:b0:4b7:92f1:d641 with SMTP id d75a77b69052e-4e576a3c983mr44723321cf.22.1759506236780;
        Fri, 03 Oct 2025 08:43:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118e04asm1929404e87.64.2025.10.03.08.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 08:43:55 -0700 (PDT)
Date: Fri, 3 Oct 2025 18:43:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Message-ID: <eyr6ipmk7jh5itr662fjvguduwecu54s7meqye6ga5odwelzgy@dgngrukrbogi>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
 <DD8PK8AI24P7.YK0OGVYC0QFM@fairphone.com>
 <DD8RMPT8EHGF.17VY8M0ECB09R@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD8RMPT8EHGF.17VY8M0ECB09R@fairphone.com>
X-Proofpoint-ORIG-GUID: iGKS3zBapIw5w_LCHfqGKyv4cA4OIwYJ
X-Proofpoint-GUID: iGKS3zBapIw5w_LCHfqGKyv4cA4OIwYJ
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68dfef3e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=47WAYy97XgIT4h3jqLYA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX1T2V3qfhZUXu
 Hb2tRboQTXWZJKVhg8hNEsTERu4pI1IZBk9uJ3tNIMDxwESBMgMOYZ7TBwYolz7nr4MKj7UUd+d
 PUEDUDvhHohxtLv8BS4Kt1zDKaxi1P1wHgq8miqi+YD15/JWs7LDOrFELfSZodujEvPpglSjxxx
 vO4dugqiW4vP35+KQ63eg9l8NM4ticFB3hjrReafUGLcvON12Q9q2cqQxNGb+TYLdfFZIV+Tjbu
 Q3KqBl0IWphHwr4sxXLTOBLJZ3F+/5wE28Ai77jSUA5hQO5jXdwp2XMn94tWCxs9atkY+P9iwcg
 KwArIBZsZW0T7gy+eXYkUF7D5K1+rFBmBnGrRzqMIFRzvVcY45XgNWkBABLtXKMp0V6I7KkCxWs
 +bJT/xRaie5K3IMtwoRguhZvhVhjXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175

On Fri, Oct 03, 2025 at 04:43:59PM +0200, Luca Weiss wrote:
> On Fri Oct 3, 2025 at 3:06 PM CEST, Luca Weiss wrote:
> > Hi Dmitry,
> >
> > On Wed Apr 23, 2025 at 7:52 PM CEST, Dmitry Baryshkov wrote:
> >> From: Dmitry Baryshkov <lumag@kernel.org>
> >>
> >> The MSM DisplayPort driver implements several HDMI codec functions
> >> in the driver, e.g. it manually manages HDMI codec device registration,
> >> returning ELD and plugged_cb support. In order to reduce code
> >> duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> >> integration.
> >
> > A bit late, but it appears that since 6.16 kernel (incl. 6.17) DP audio
> > is broken on qcm6490-fairphone-fp5 (which is using the Elite audio
> > architecture, not Audioreach).
> >
> > Git bisect is pointing to this patch:
> >
> >   98a8920e7b07641eb1996b3c39b9ce27fc05dbb9 is the first bad commit
> >   commit 98a8920e7b07641eb1996b3c39b9ce27fc05dbb9
> >   Author: Dmitry Baryshkov <lumag@kernel.org>
> >   Date:   Fri May 2 01:41:42 2025 +0300
> >
> >       drm/msm/dp: reuse generic HDMI codec implementation
> >
> > It's specifically failing with these errors:
> >
> > [  177.380809] qcom-q6afe aprsvc:service:4:4: AFE enable for port 0x6020 failed -110
> > [  177.380851] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: fail to start AFE port 68
> > [  177.380865] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: ASoC error (-110): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> > [  177.437004] qcom-q6afe aprsvc:service:4:4: cmd = 0x100e5 returned error = 0x9
> > [  177.437294] qcom-q6afe aprsvc:service:4:4: DSP returned error[9]
> > [  177.437312] qcom-q6afe aprsvc:service:4:4: AFE enable for port 0x6020 failed -22
> > [  177.437332] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: fail to start AFE port 68
> > [  177.437343] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> >
> > Do you have an idea?
> 
> Dmitry pointed me to this patch on IRC which does fix the problem
> described above.
> 
> https://lore.kernel.org/linux-arm-msm/20250925040530.20731-1-liujianfeng1994@gmail.com/

I have been waiting for Srini to respond to the quetions that I have
asked in response to those emails. If he doesn't respond in a sensible
timeframe, I think, we should pick that patch.

-- 
With best wishes
Dmitry

