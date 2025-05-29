Return-Path: <linux-arm-msm+bounces-59762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A0BAC75E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 04:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53CEBA22238
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 02:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB22242D9C;
	Thu, 29 May 2025 02:40:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558CB2B9AA;
	Thu, 29 May 2025 02:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748486439; cv=none; b=inq7ZNadwGJ9/kJ2WwbV1eTeZ6MVhMu2TRFCsFmrf5V9SqjyGJyLBGX+PZDVXLvHo3UiAOsbayfqNnbeu6J5mLQ9AUd9CA6wqaDZQX78BbeIxNSuI/3UnEHSwR3VWQMgh0rf5Rq/X/+gE2O8P9+6G9CuW07K0yrn03vFoY+fWsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748486439; c=relaxed/simple;
	bh=kZkIsj//YnP/gJGA/K2VrDKorBDjNhvFh2BZJpQwTuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0foL5O9FKbA7nOq8ypKDJhvLaWfm9CLDimjPhOdtaqZbGd+4o0le+u7jSHRv1KPi/AA3oseEbUoiqECiq4VBkoDMMfKj0hwR/DdhpK+NkAUXVSR/NOo9u791lhbm6ydcjMzI1TnNqyqg+7cKaLOK1SOcPUFrJL6aKcsSOghoUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz20t1748486418t37745060
X-QQ-Originating-IP: C58kyhMUl+MpUv+PvpsaEsUe55NDqcLZLFJp/428sj8=
Received: from [127.0.0.1] ( [112.54.164.151])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 May 2025 10:40:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14936503294835675896
Message-ID: <4E62D52FC6135E5B+a6b1634e-5c66-4db5-bb1e-bf64e2e8d8a2@radxa.com>
Date: Thu, 29 May 2025 10:40:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
From: Xilin Wu <sophon@radxa.com>
Content-Language: en-US
In-Reply-To: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NcPpWZPsRpiEezHEwuGB9fOmbxJWZnNkTUflW7oLyrPm29VNkAu+i4jK
	lWnakt+QhWUCydglaeEREz1s2bbgJGgrr3q4J+ZKE//DOtRXSUjxeg+kb5Cz7Zha9/VqqUg
	iIIdbwWw32JCsAQNhwXvQh186dCY32WBmaGQkZSveCN4gENb7IceSJl8Tljz6KklnjtjSDh
	byt/xg7MhmzWVLkbbQiAdQVsqf0uZ2l2eF530ApBvwg5jBGpMgZ94AkiM1Ek6+6ZIvQF5Sd
	LMhganmlJ97cE5HKDm/9icSq7jQhuwyspOI5x6uELJaRBS3W/BC/ZILk6e15OfkPqxLv420
	kH5owwBPOiqBqIT9Fh/7wHoZbbGnRrNLAi3rgevV0smbriyRRBwBfN0U5xagCaaJQFLb38D
	vpmYPiGJ3wt9E5sPSnMh2nfTnHFfxmqbYddehnPhZPMh7MTWT7+C+aMgmirDfApKWVFfcGw
	tFQllC6MoLb+fQBKD5M9sxAhJoOfE7M4FlLI605WZGmfmBSoCppl0QN2vN/oKkGC7LhrpM8
	IxlbyQQ5LesJAlMj3oVghO++rzV6Vc4iQMCSYwowDxIeJIfbEDLzjPEMbliETuCCX2xmVPN
	rK+/IsuhreKR5zVsqSNrahKG5Kb1mz3kGk/EyOo4+kTu3uA9pzzz/XvGy7rJvPVTyenwgF6
	n8dn4kX6g/Ns0MXVFoACy2IQONsqbmtE4+ffD96eqFocWc9rrEodet0fbeyZ3RmF6e3H6aT
	pGGyLLW+hJFD0m0wc5PNjOEDZpd+xvhrUwKgARHokX2W/kY98jL92Gq6zpoBTRn7/xkGdsQ
	WMNFmWwrwSxot1aQwosjN1ws3cttHCnZy9/nigSK7CUyK/P8Cc4vVG0/gXmDnG6o4KnF6UK
	c5WELVY3lw94KvZt4ZhIfPEeRoPe0ZFZ56InV6MYjoOC2me99zEqD7Fd/LuWBrNCRnc+TvU
	Zu1Z7H8LCcDKtRuu1M/9UQYvbOhxY73ssVAfakVuqQ2igIV30ZrNsiSPa
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

On 2025/4/24 01:52:45, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <lumag@kernel.org>
> 
> The MSM DisplayPort driver implements several HDMI codec functions
> in the driver, e.g. it manually manages HDMI codec device registration,
> returning ELD and plugged_cb support. In order to reduce code
> duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> integration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> A lot of DisplayPort bridges use HDMI Codec in order to provide audio
> support. Present DRM HDMI Audio support has been written with the HDMI
> and in particular DRM HDMI Connector framework support, however those
> audio helpers can be easily reused for DisplayPort drivers too.
> 
> Patches by Hermes Wu that targeted implementing HDMI Audio support in
> the iTE IT6506 driver pointed out the necessity of allowing one to use
> generic audio helpers for DisplayPort drivers, as otherwise each driver
> has to manually (and correctly) implement the get_eld() and plugged_cb
> support.
> 
> Implement necessary integration in drm_bridge_connector and provide an
> example implementation in the msm/dp driver.
> ---
> Changes in v7:
> - Dropped applied patches
> - Link to v6: https://lore.kernel.org/r/20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com
> 
> Changes in v6:
> - Added DRM_BRIDGE_OP_DP_AUDIO and separate set of DisplayPort audio
>    callbacks to the drm_bridge interface (Maxime)
> - Link to v5: https://lore.kernel.org/r/20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org
> 
> Changes in v5:
> - Rebased on top of linux-next, also handling HDMI audio piece of the
>    MSM HDMI driver.
> - Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org
> 
> Changes in v4:
> - Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
>    HDMI driver.
> - Drop outdated comment regarding subconnector from the commit message.
> - Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org
> 
> Changes in v3:
> - Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
>    (Laurent, Maxime)
> - Dropped the subconnector patch (again)
> - Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org
> 
> Changes in v2:
> - Added drm_connector_attach_dp_subconnector_property() patches
> - Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org
> ---
>   drivers/gpu/drm/msm/Kconfig         |   1 +
>   drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
>   drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
>   drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
>   drivers/gpu/drm/msm/dp/dp_display.h |   6 --
>   drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
>   6 files changed, 31 insertions(+), 170 deletions(-)
> 

This change breaks DP audio on the qcs6490 platform, tested on kernel 
next-20250528.

[    0.368035] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x70020000
[    0.369359] hdmi-audio-codec hdmi-audio-codec.0.auto: 
hdmi_codec_probe: dai_count 0
[    0.369362] hdmi-audio-codec hdmi-audio-codec.0.auto: 
hdmi_codec_probe: Missing hw_params
[    0.369364] hdmi-audio-codec hdmi-audio-codec.0.auto: 
hdmi_codec_probe: Invalid parameters
[    0.369366] hdmi-audio-codec hdmi-audio-codec.0.auto: probe with 
driver hdmi-audio-codec failed with error -22
[    0.370536] [drm] Initialized msm 1.12.0 for 
ae01000.display-controller on minor 0

Manually reverting this change solves the problem.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

