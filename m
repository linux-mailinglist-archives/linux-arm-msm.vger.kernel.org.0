Return-Path: <linux-arm-msm+bounces-60148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F77AACC8B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 16:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32E371881FD7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 14:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B2123875D;
	Tue,  3 Jun 2025 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0IupHWi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DF7230996
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 14:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748959604; cv=none; b=a8qY2Y/889q0l5Ko6UbLpnWH/4Ph0FJc+8PmSAB5EOya7LjJSnTjIVSLQ4zZw4eokySKTUFjA2ZiGneWAkniMj1dMJlT4ZdRiXBjbsX/ONbbSv3NdCKTMEJhzAb8EUxyRAc9fpI0sNpBw5EInmqHy7kF9OVYRjt4u8P+kxoA1wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748959604; c=relaxed/simple;
	bh=21Dk85NUUxHBydM0SyrS6KetKPCpXnwAAVzdyHOQHXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAp16iru1llW8UuITu64UDYCpyCTUjtH5B+xO68wBfua6wGDRQN8brfYA3m0snxEpteySJe42mYov6qEvXFsi79sVowF3AFFWBaArn1k1mYhUVNaWUx2vuFAbQGpY00AC0ttFCNkY/FR1MQSa3h7RpI3PPZUgvsjLno9RK0HkrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0IupHWi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539Jb2P013865
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 14:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P79HZCGGzpLszEZA+F4RiB1q
	d+qJD3xGy88FeOcJCl4=; b=g0IupHWiqVe2u0vwirrZQWTBFNl6UUPIqtkr+FHk
	xaoPCLAmD1+DLbl1nfgZkTpLbaTEY4nExBZ66IZVvVHrEzYthyF0aVUBwCznJPu4
	ZUyU/RrRXHXr52358YVxqqzPmD5i5RaLd1IL6puF/nuENMWR8CpCwffvfYmiSaQt
	9DHa2X0oA9I2QpHK3la8dAShSdKuSkze4Tw1LE2MFZkjFbUgEktRutpvxQ8y9Wj3
	8zi7pHtHeNPiZTGiVIwFf5NxJNMmsLOW4X4DYxswVIwPpN9c2cKXE3m33d2NQZJX
	pBqpf4WYctbE4EKOZfYb9BgNzYwRMumZaBJYiVFX5Mndng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8njs5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 14:06:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c92425a8b1so692458185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 07:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748959600; x=1749564400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P79HZCGGzpLszEZA+F4RiB1qd+qJD3xGy88FeOcJCl4=;
        b=o2DYuKO1FR9NN0GkDhiKJ/yO5x5LZw9eTzv/QQdPwglnYEryZdKhri70ZQBZ3kgCeB
         h3cMUwNVX15anEYde1tc3shTZmNHHe4wKwRS+xxzCkNXDWjBPLMx5NnkKa0St6XYbvUy
         EeLtA2Y0Yoghq8LYqdSpyTFQE1wwcZGhj5yGaOAaJoGt1x36zM583Dxvsg7YMzwrbwxb
         NUkEbH0XJHZviCsljwr/HI2cfpfzerajSU4nDPDADOD9mveLo3TyRT+lhEFZJWt/Ux1y
         Q6HfBFmM+MAPsE1zYC9c39Q9sEgUGjH/xAKhNHOlR9ePt+vxa9OvN+f3WWorOhwrMYXJ
         Yctw==
X-Forwarded-Encrypted: i=1; AJvYcCUGtcgBwF1tPBzaobFXvPYXgfHxVm1bhFPJIWwvIZ5X2uQpH+KKWOgZApTZzuc2RJ2gmQ96ovQ+sV+I2teJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxQhFEyniOmlGg8WMDWRSekNdzbtPSFiJwOsbzEtzx5oSLttTxE
	Gt3FonnNbmsq+hcbN8x7ZbRkl//T1OsrC/TmxafOIk3hq7J3N3pG8s06Ep5LCm1C0A6LH0W3BO9
	XmAHwe8SjmQnQ6X+18Yp+gWjirzGK+xqpK05+xm1RPmVVphNvvQ3PDUitINAKiMQYvAYw
X-Gm-Gg: ASbGnct27MvBUY/pj10foM0NdC4oSZPd4gKSIkIvetn6hT2LMc2l5uHAp/XXfBkDBE9
	cIOsJgg1glM6ZWk+X/dDFIdeI/yfjCrIDn3+5JAPMMUIPKqzuF/p19artvQCztude/XLq+hXon3
	w1XBZtJ5BtwjRjWGeml/T37u/RoZS4KABXe1rVuHzpQgQ+ROMiG1y7h4+NO/HCgjWjIHmT+QqDx
	MMX9sZ2kuK3Pv91kfsdyvZXCdU/5UrwroUtUW0ZAlq0ds3/5/Xr7iuH2pLXdEPG/VPeV18dgoMt
	lLrH9+QNo398Npa0Z9H8aPuWqS+NL9knhUAVM89h53B1nTUmjW94CegJIFRfD5go/Eo9uhp0vsw
	=
X-Received: by 2002:a05:620a:a00b:b0:7d2:18ba:8700 with SMTP id af79cd13be357-7d218ba871emr13866585a.7.1748959600003;
        Tue, 03 Jun 2025 07:06:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCFH6zwlFkK+QWD7PKj+40nA0Wy3DB5UxfoqOZyIIpf1wDqJqvJzHMX7eoemJHigQulmJrkw==
X-Received: by 2002:a05:620a:a00b:b0:7d2:18ba:8700 with SMTP id af79cd13be357-7d218ba871emr13859085a.7.1748959599447;
        Tue, 03 Jun 2025 07:06:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337937837sm1914464e87.230.2025.06.03.07.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 07:06:38 -0700 (PDT)
Date: Tue, 3 Jun 2025 17:06:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
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
        Hermes Wu <Hermes.wu@ite.com.tw>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Message-ID: <os3cmusf2nrdf3zq45s52a72x4osnd4thlgcgykcalyiuitcha@tnb576gj4m27>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
 <4E62D52FC6135E5B+a6b1634e-5c66-4db5-bb1e-bf64e2e8d8a2@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E62D52FC6135E5B+a6b1634e-5c66-4db5-bb1e-bf64e2e8d8a2@radxa.com>
X-Proofpoint-GUID: 43AzuGO42kWg6OY5JJU4bZGAUUhe96ra
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDEyMiBTYWx0ZWRfX2PR3KyKHSGVx
 NQOdNs6SCWuCBG4yDHRMK2fExXlEZL6BKPJmrPr+GrIstKDGv8qUkPQAFWmK1ACbojJiR278mY7
 jSzD69wrd+loQCQwfClE3arfWc0PBH+Mrng3NtbgH94WqDUJDqxw1LlR4j+o8wVpYf+ZM0f/F4w
 MFHNamuDt87YXeaXmLcpjp3CdIGMNS9vBzmRZEkaUrAMFZNN5Jm5mVGp0xgj71P4exuWf/hWmrS
 ORsAmywsMzAuN7HV4t4Q0hqDrhHmVahgFohoCRKwKebRyjjx04M66pUFNnwjIvXBUupfDCzLK86
 KANzgwGecEuZ7whjUkcTNdxpwD/HiYXpm2c9q8/g+brUsPKfGgpIrQJ0iorbzgiqx+MoTYkpKJA
 +PkBCNe09DtepLars9c7RG7tnIGd1orAI5oVx1n0hvc9ngt4iOJw1WBZ/Y1zlrZj2NJ9ZuUo
X-Proofpoint-ORIG-GUID: 43AzuGO42kWg6OY5JJU4bZGAUUhe96ra
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=683f0171 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=ksxQWNrZAAAA:8 a=_j8PdYOvoN43mqFH8V4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030122

On Thu, May 29, 2025 at 10:40:12AM +0800, Xilin Wu wrote:
> On 2025/4/24 01:52:45, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <lumag@kernel.org>
> > 
> > The MSM DisplayPort driver implements several HDMI codec functions
> > in the driver, e.g. it manually manages HDMI codec device registration,
> > returning ELD and plugged_cb support. In order to reduce code
> > duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> > integration.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > A lot of DisplayPort bridges use HDMI Codec in order to provide audio
> > support. Present DRM HDMI Audio support has been written with the HDMI
> > and in particular DRM HDMI Connector framework support, however those
> > audio helpers can be easily reused for DisplayPort drivers too.
> > 
> > Patches by Hermes Wu that targeted implementing HDMI Audio support in
> > the iTE IT6506 driver pointed out the necessity of allowing one to use
> > generic audio helpers for DisplayPort drivers, as otherwise each driver
> > has to manually (and correctly) implement the get_eld() and plugged_cb
> > support.
> > 
> > Implement necessary integration in drm_bridge_connector and provide an
> > example implementation in the msm/dp driver.
> > ---
> > Changes in v7:
> > - Dropped applied patches
> > - Link to v6: https://lore.kernel.org/r/20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com
> > 
> > Changes in v6:
> > - Added DRM_BRIDGE_OP_DP_AUDIO and separate set of DisplayPort audio
> >    callbacks to the drm_bridge interface (Maxime)
> > - Link to v5: https://lore.kernel.org/r/20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org
> > 
> > Changes in v5:
> > - Rebased on top of linux-next, also handling HDMI audio piece of the
> >    MSM HDMI driver.
> > - Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org
> > 
> > Changes in v4:
> > - Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
> >    HDMI driver.
> > - Drop outdated comment regarding subconnector from the commit message.
> > - Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org
> > 
> > Changes in v3:
> > - Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
> >    (Laurent, Maxime)
> > - Dropped the subconnector patch (again)
> > - Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org
> > 
> > Changes in v2:
> > - Added drm_connector_attach_dp_subconnector_property() patches
> > - Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org
> > ---
> >   drivers/gpu/drm/msm/Kconfig         |   1 +
> >   drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
> >   drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
> >   drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
> >   drivers/gpu/drm/msm/dp/dp_display.h |   6 --
> >   drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
> >   6 files changed, 31 insertions(+), 170 deletions(-)
> > 
> 
> This change breaks DP audio on the qcs6490 platform, tested on kernel
> next-20250528.

I can not confirm this issue here (though I tested it on a different
hardware). Do you have any patches on top of linux-next?

> 
> [    0.368035] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x70020000
> [    0.369359] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> dai_count 0
> [    0.369362] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> Missing hw_params
> [    0.369364] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> Invalid parameters
> [    0.369366] hdmi-audio-codec hdmi-audio-codec.0.auto: probe with driver
> hdmi-audio-codec failed with error -22
> [    0.370536] [drm] Initialized msm 1.12.0 for ae01000.display-controller
> on minor 0
> 
> Manually reverting this change solves the problem.

It is suspicious, since dai_count can not be 0. We set
hdmi_audio_max_i2s_playback_channels to 8, which in turn should set the
hdmi_codec_pdata.i2s to 1.

> 
> -- 
> Best regards,
> Xilin Wu <sophon@radxa.com>

-- 
With best wishes
Dmitry

