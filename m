Return-Path: <linux-arm-msm+bounces-62103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0C6AE4AC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 18:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A2D944036D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC892BE7AB;
	Mon, 23 Jun 2025 16:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mLktB6Ax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0B529B768
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 16:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750695517; cv=none; b=MysV7gVviy+z61NFUAHYLQuEmYeO3RLCZxhVSKFH6L273O2Jjj/OcNPY1HVI78e5e/rzoeftzHHtxuSJydmyHfcq/AFEp/01J09GlHmS57W3vfWilYsqVmjobV2k1pDw8hiqb7QZscTZ9TkzCZGq7U9hECt2Er/GLNLXHl/Ccus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750695517; c=relaxed/simple;
	bh=zchNO3HCWwoFQnDoUAapWNGzqAw5TG5DYK0U++aFf80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOjxX5GaguaOD7Q/cHJdLgGYazWvZUBLCNMJ0mi1tvNeteQCLrQevSx0bggW1qPNUUwDvLBYHeUsBpTVY2GaWe3hy7NzAQbHOh4aPv/LCL1AH7S5Y492DplSFHzvtTvRbOiRua+H3btUHo6QoUdXn6+vAO5gcn10CB7A7XR45hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mLktB6Ax; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so3219680f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 09:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750695513; x=1751300313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8P4BKlF0L91nBpuIvtJw81/Y/F3X1v/6aoitvWQlibo=;
        b=mLktB6Ax9g0d336NQ+evCmXaeniWsGy8mQ6vvA8i/N8Pk2OwU1Cd/5fET3ZKD8+ci6
         37Jb+gr+u8niADoWwrssc2X5Ys51rSinyt6bbvJETDeLvAszsAppxtGovdj/yQtiCc/V
         apQ/UVcZ9N64osjVBmimytFdSNPU8M7YAYhobFgGdefXQ50tKJn7qZsCQYGMNNqFRFCr
         SmhSbj/cslmDdZAhc0HbT0CYEX0V6psUvtHuyESoGPIl5ctyvvsi6DP4BvDd30iT9MHC
         KCsfNJNH15neu/ix0zLekkx7Cr9GhjJFTFcqtjbyy1oBPT5/7+vZvOdlIXujY39jePEy
         ARgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750695513; x=1751300313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8P4BKlF0L91nBpuIvtJw81/Y/F3X1v/6aoitvWQlibo=;
        b=gUcYjad8VGq3rbXzLPmy7RPyuVszK34QKTnnO+Te5caFPNqNG3Q9Xj2S0bkpX/UvVQ
         armuDUD8OB7218NhvGpbXQJmfzGs9xCaXiC9kMSYEvSfyCbRVfgsia54Cd3XSYTZTeH7
         r03KVYV272UosYoWlcEYDn0UPDhPKZ9aTPVWHaIn3uol8kDPAlP74UiUGQmH5LPm/nUk
         CYmrPcFcjeg2n53Ev8JnHsD+29Fzr6P4SrZrkaYXUClUwWuMiOZeWXpWG8PHM4j62KAJ
         IjGG5YxBLKQwmI5LvDYaYXNCHLEV/jiq5/OEoahyomasOU3r3rhajze8IhSKCfrBg19Y
         IOdw==
X-Forwarded-Encrypted: i=1; AJvYcCWHuPT59oMfZ5OPtwvkHvJFgMvXgn0/m2J8hgRvKJ07+dn6f7S+XJYR/MpVObfldtA1dMjvrHMXFschqNcQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxOTFFNKymHVMf5TrBQa6lhnkyvEISBVYpTxGTrp2OIOzxLwIeW
	CrBkOK5nB8VRYqoBC51WBx+jGp9NSaTnKEte9gwlC0f1cnt4jFt27FaA6URbv+mX578=
X-Gm-Gg: ASbGncuqFV3JPrnQu8lZnCd6M1Oli2gHyqTi9JxvK5ZaUMtwjRDNg9moalPmdjL60kT
	/h7rMD7zydCr0K/5KvBuUaamP8NhxvxnCwEKg39ZCFcBiAPnTZzSzvXE53DoXfioRFT4mKptjle
	UyZGPp8XMXkF85uuawiZm69LYOKf9VqKVuuJvfPuyq9Hj9c2/h+qht7XY2gOWPSOGOuttxTEH0v
	NDyvpa3s9aA58W5QuuNwXiaUB6gw7iuWFfN9tVMUycSbqulq0f37PJknR/CpYIY0OPkk/JPd4cc
	2JGLfE7Eyq7ekrp+YIlCp45Nu66pgOrokA/k0czI4P957d2BDSDm7wWhDFB2D68nu9llvCNpfw=
	=
X-Google-Smtp-Source: AGHT+IGRAHfzz02yaZCUQ4NgxRMmn6Ic0SvW0VIh60ro1+UYsZHIgHMHFSGMA6Pf56q88UTsOQG+Ig==
X-Received: by 2002:a05:6000:2882:b0:3a5:23c6:eeee with SMTP id ffacd0b85a97d-3a6e71ddb32mr130435f8f.21.1750695513111;
        Mon, 23 Jun 2025 09:18:33 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:b3ca:db17:bc4f:ae5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1054bsm9701697f8f.9.2025.06.23.09.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:18:32 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:18:27 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Xilin Wu <sophon@radxa.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
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
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Hermes Wu <Hermes.wu@ite.com.tw>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Message-ID: <aFl-U-QX4T6retMq@linaro.org>
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
> 

Try applying the following patch, the current code in next/mainline is
broken and de-references some wrong memory. Probably pure luck that it
ever worked during testing. :/

https://lore.kernel.org/dri-devel/20250620011616.118-1-kernel@airkyi.com/

Thanks,
Stephan

