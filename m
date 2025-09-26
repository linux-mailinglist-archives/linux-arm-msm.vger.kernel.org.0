Return-Path: <linux-arm-msm+bounces-75292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1888BA3582
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 12:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80EF92A3493
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 10:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29222299A82;
	Fri, 26 Sep 2025 10:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOypAos7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F254724167A;
	Fri, 26 Sep 2025 10:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758882632; cv=none; b=EN9m5DEUBngzw6klyE29oS2nbPf04D72Ejdc8szv4t3Ly3wCjhYG/r317RKvC7hRIotivq17FZagTBjR/lEyFW+LUJrvxFo59RgYcy2iskwDm1b9UH0VR9ygTDAdF3hkMPMfok8XwdTAs51EeVwkkj1hRqk5hSmXCwDYCsN9Mek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758882632; c=relaxed/simple;
	bh=FFEdg2iSl5uJ6CbjRZ1qM3Dohr60U2y7aWxkSt4fytc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IP2GKcPIwZ+kLi53lX9vNeqXmwHUE/mNbdBjXXmCijsio80cvhbyXmBE9QLqLmjQ2vPqCtQBsV+gWOXisCVx/IRgnBLFscZtZogM/dKHY8DpVDlQbpd7guDMQd+buoJPNipVj0Bh56PHSxR6c4d7a5z9zwrFzf8lxpl+zzl5A6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOypAos7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77021C4CEF4;
	Fri, 26 Sep 2025 10:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758882631;
	bh=FFEdg2iSl5uJ6CbjRZ1qM3Dohr60U2y7aWxkSt4fytc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iOypAos7da21DOM+dzCNHCppd14WSla2gQcz10hywqcWJfRTYd5oFrUYpZwXjmkvo
	 ucVxEnxf5YD8ycYbp/X+OAqTh5DhcT5w7oUpJz0OUbEzMaP8LUSKvQcpurxfFi6OCX
	 q4+d0ICdCK27caoURhM0YqQVsH99usd5Hbad7XC9oNhRf/JtJsB0sIhkruiHt4ufQK
	 64r2BVOSNapR1rqDWw3FefjkHkchBMxilL+oyyZqhRhRDAZMafqXR28WecR3xGMvFG
	 1uLVPXOPn3OGZTE1U/n157BoQpIa0Qpdl/4KsRe1LT0q2Sdtg4o/YrnhGAb6cj60dV
	 lhguXd6nP0d0w==
Message-ID: <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
Date: Fri, 26 Sep 2025 11:30:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, Xilin Wu <sophon@radxa.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
>> use msm_dp_audio_prepare instead. While userspace is still calling
>> hw_params to do audio initialization, and we get the following errors:
>>
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
> 
> And a call to hdmi_codec_prepare() comes only at this place.
> 
> Srini, Mark, when selecting to only implement .prepare for codec ops I
> was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
> hook"), which documents that IEC958 status bit is set after
> .hw_params(), so it's only visible during .prepare(). Is it okay to
> implement both callbacks? Or should the audioreach DAI driver be fixed
> somehow instead (I suppose it assumes that the port is available after
> .hw_params(), not sure if that assumption is correct)?
> 
>>
>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
>> hdmi-codec driver can work with userspace alsa.
>>
>> Tested with Radxa Dragon Q6A.
>>
>> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> 
> The patch LGTM, but I would wait for response from audio maintainers.
> 

The ordering matters in this case as we need clocks and audio
configuration on DP codec side to be setup before we start configuring
the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
even before it is ready.

q6apm prepare loads the dsp pipeline and starts configuring the
endpoints, if the DP endpoint is not ready dsp would throw an error.

We might be able to pull in some dsp logs to confirm this, but I dont
have a setup that I can reproduce this issue.


--srini
>> ---
>>
>> Changes in v2:
>> - Link to v1: https://lore.kernel.org/linux-arm-msm/20250924085804.34183-1-liujianfeng1994@gmail.com/
>> - Use more detailed trace log in commit message.
>> - Drop the empty line between Fixex and SoB.
>>
>>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>> index 7d78b02c1446..6ca1c7ad0632 100644
>> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>> @@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
>>  
>>  static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
>>  	.audio_startup = drm_connector_hdmi_audio_startup,
>> +	.hw_params = drm_connector_hdmi_audio_prepare,
>>  	.prepare = drm_connector_hdmi_audio_prepare,
>>  	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
>>  	.mute_stream = drm_connector_hdmi_audio_mute_stream,
>> -- 
>> 2.43.0
>>
> 


