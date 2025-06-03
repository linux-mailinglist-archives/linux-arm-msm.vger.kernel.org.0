Return-Path: <linux-arm-msm+bounces-60149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DB6ACC8E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 16:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEEC03A2227
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 14:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEA72745E;
	Tue,  3 Jun 2025 14:16:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8242C3246
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 14:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748960200; cv=none; b=L1Kb7oxEITmgkyjkERC83l1iEz1UxpsYmnIrxGrXI2GDLIV8FipPZNbACRc1p+fOKYWc1z9R4kHi+aKA4Jbp89BMu+Asf59PaXl/kMI+S+7YqHPUv8BZM+LONKhtPXYR1gQQfNi/QjlSvhL1IrdOKHyOFdiiB3bZ7y1ZG4PDoA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748960200; c=relaxed/simple;
	bh=uAJnlpBlMCdXn0vm2cHRpNjIqhUUX2fHSjbXL6VPAN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NekKVpIU6444OWrRDv1JH+ZcdKCCyvly+GJs9tTsMujdeMPqJZxvrRR260vWIheWR51ixg29QiCcI+YfJ9ywrkuvaNHy0HbrZD2IAdfZKopsNCSuxQQMrbOQMqRQCKMoEhZ0BIz231hJA+oD4U3qtmffdJDz0fyWTN83lzkh6ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz17t1748960179t92f8d0ba
X-QQ-Originating-IP: 7Unthp6zRkf2GCBo0PISOzyxqfWe8p0qMqpIANg83dk=
Received: from [127.0.0.1] ( [45.8.186.102])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Jun 2025 22:16:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5516064207330598275
Message-ID: <712A2410D11E9A7E+27a43d64-1116-41ba-addc-83aa5f761a28@radxa.com>
Date: Tue, 3 Jun 2025 22:16:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
 <4E62D52FC6135E5B+a6b1634e-5c66-4db5-bb1e-bf64e2e8d8a2@radxa.com>
 <os3cmusf2nrdf3zq45s52a72x4osnd4thlgcgykcalyiuitcha@tnb576gj4m27>
From: Xilin Wu <sophon@radxa.com>
Content-Language: en-US
In-Reply-To: <os3cmusf2nrdf3zq45s52a72x4osnd4thlgcgykcalyiuitcha@tnb576gj4m27>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MLbAtvpy5B1PeHK71kV94xou0uKS2oc3m7vgCYKylFAZQJz7iZ1ElifZ
	pRq4sBJsShnDpFyOM4gHOEhG3zw+/5d7kR66Oy96rMoFMe+kc6PMwdt5+CoVMhOGAYYHOJP
	hS3OnWNlE5/CF8VsVlkWekR84oKwrVK+75hGa6446Kf8DnJyJ9Ti6DCwdRGYVrM29uwbX96
	W7PDMiEqCu06I5qiN4ZYqgD04iadTg4WyaArzGLccoiGMWMf7r8cAO4P+dSFQagwfFcjz24
	op4iZqDb4i898YAvkRryN9mSxvnwt5QnK0MggS1O/D+TWA7osoBoGvkX6Ohga3RSFELHom0
	vYT/9NsEmbLA5F4hSyPMvsDQoAFnlSpw3tAsqWYmnu2Pl9UBT919VyByAIuFUnFkr1AoOIM
	7PWVw3dz0Vm2asflMJgxR3LOZVDy4LliQlfQHgxSYlgMR0dgMotdNVc42DMZtLvrkzdXSl5
	UgNM5mTbWXHxymwcSbF591We+96jls2S55r3NxNd/xCDhDar7J6gC29d1+6utB8XBxwr9VX
	7NMzu7eIcospvrqU6l3NW8Kl7dLR9C2keXXh86V9+MYVuePgCuuoK77ypDTkfNzr5gQZxm+
	XntMkjRfpMMoy0fOPC30Ozj17WbNhaVezE8rnPtOZlLxvZiK2he3FoS4p1+EAGdC//MkAdf
	u8y0uyCArdX7ygcYEO7vz79d4rXyy2NRrSnkgPrYixiPxuNdP9LOSbUU5BDf7HDHOuzexjW
	4XVeIW4KkNC2q+UhJWvd4cfzMJHlLaUknYS43OWMw+e1Uxwe6LnaG1oiuMEu+of+ScsWR+M
	fdz7uq/xZfbiTB131mVTURbH8AZx76B090IxNFq7RgQ9xYTHHScA+gmfKzbNcsK4dWkfnU2
	VQTRBaIwdce/TXE+qvcQrEZdtnvAD5jLrMGwWMXneVNChJYy4zuS8KZZe+ZgPnhMd7e7aQc
	fX1XNJr+7c0aOMy8JauRNovNoMFZGwM20ECz+yYIxbwslaOnd3Rg5p+2mv3vwHygu4CZCNE
	7qk8g8fUMUpCmeEk1dc1M5v4qi9q06iNzLXWgOIg==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

On 2025/6/3 22:06:36, Dmitry Baryshkov wrote:
> On Thu, May 29, 2025 at 10:40:12AM +0800, Xilin Wu wrote:
>> On 2025/4/24 01:52:45, Dmitry Baryshkov wrote:
>>> From: Dmitry Baryshkov <lumag@kernel.org>
>>>
>>> The MSM DisplayPort driver implements several HDMI codec functions
>>> in the driver, e.g. it manually manages HDMI codec device registration,
>>> returning ELD and plugged_cb support. In order to reduce code
>>> duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
>>> integration.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> A lot of DisplayPort bridges use HDMI Codec in order to provide audio
>>> support. Present DRM HDMI Audio support has been written with the HDMI
>>> and in particular DRM HDMI Connector framework support, however those
>>> audio helpers can be easily reused for DisplayPort drivers too.
>>>
>>> Patches by Hermes Wu that targeted implementing HDMI Audio support in
>>> the iTE IT6506 driver pointed out the necessity of allowing one to use
>>> generic audio helpers for DisplayPort drivers, as otherwise each driver
>>> has to manually (and correctly) implement the get_eld() and plugged_cb
>>> support.
>>>
>>> Implement necessary integration in drm_bridge_connector and provide an
>>> example implementation in the msm/dp driver.
>>> ---
>>> Changes in v7:
>>> - Dropped applied patches
>>> - Link to v6: https://lore.kernel.org/r/20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com
>>>
>>> Changes in v6:
>>> - Added DRM_BRIDGE_OP_DP_AUDIO and separate set of DisplayPort audio
>>>     callbacks to the drm_bridge interface (Maxime)
>>> - Link to v5: https://lore.kernel.org/r/20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org
>>>
>>> Changes in v5:
>>> - Rebased on top of linux-next, also handling HDMI audio piece of the
>>>     MSM HDMI driver.
>>> - Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org
>>>
>>> Changes in v4:
>>> - Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
>>>     HDMI driver.
>>> - Drop outdated comment regarding subconnector from the commit message.
>>> - Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org
>>>
>>> Changes in v3:
>>> - Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
>>>     (Laurent, Maxime)
>>> - Dropped the subconnector patch (again)
>>> - Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org
>>>
>>> Changes in v2:
>>> - Added drm_connector_attach_dp_subconnector_property() patches
>>> - Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org
>>> ---
>>>    drivers/gpu/drm/msm/Kconfig         |   1 +
>>>    drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
>>>    drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
>>>    drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
>>>    drivers/gpu/drm/msm/dp/dp_display.h |   6 --
>>>    drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
>>>    6 files changed, 31 insertions(+), 170 deletions(-)
>>>
>>
>> This change breaks DP audio on the qcs6490 platform, tested on kernel
>> next-20250528.
> 
> I can not confirm this issue here (though I tested it on a different
> hardware). Do you have any patches on top of linux-next?
> 

I have this patch series applied, but I don't think it could be relevant:

[PATCH v4 0/8] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
https://lore.kernel.org/all/20250527111227.2318021-1-quic_pkumpatl@quicinc.com/

>>
>> [    0.368035] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x70020000
>> [    0.369359] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
>> dai_count 0
>> [    0.369362] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
>> Missing hw_params
>> [    0.369364] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
>> Invalid parameters
>> [    0.369366] hdmi-audio-codec hdmi-audio-codec.0.auto: probe with driver
>> hdmi-audio-codec failed with error -22
>> [    0.370536] [drm] Initialized msm 1.12.0 for ae01000.display-controller
>> on minor 0
>>
>> Manually reverting this change solves the problem.
> 
> It is suspicious, since dai_count can not be 0. We set
> hdmi_audio_max_i2s_playback_channels to 8, which in turn should set the
> hdmi_codec_pdata.i2s to 1.
> 

It suddenly comes to my mind that I'm using a kernel with everything 
compiled as builtin. Could that be a possible issue?


-- 
Best regards,
Xilin Wu <sophon@radxa.com>


