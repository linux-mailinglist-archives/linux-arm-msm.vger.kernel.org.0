Return-Path: <linux-arm-msm+bounces-75972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1DCBB8DC0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Oct 2025 15:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72EDF3C325D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Oct 2025 13:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBB626A1B9;
	Sat,  4 Oct 2025 13:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5FuXRY3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FD220766E;
	Sat,  4 Oct 2025 13:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759583792; cv=none; b=JAJa3a7LKlA5fhpiqh0aM7lIrxMx1pHfR8IiVgYTJ1CnAk6rM93ctQQ4NnHWnROklPGwHCMoLXIhEdZ+43k3dEB1JOBaMdr6ZsBjLJ1AanJ4a44ePmfZLwh/5bC04H8Mlyv2txncGuH94LGs0ZL+G0PZGQWDR981qd2Vn6CjVe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759583792; c=relaxed/simple;
	bh=I08Nc5q5l8NppZLvGTcwZIupkZuUfHohxlx6YSbLewk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RvOwjAJEIm5Oj7HpwS25xl8mYhALv6qY5gXP7+b28vODFFowo3mEGatTsmJUnaHaCDllPsziNuZfNAof0tbiME4htTKeSlSkHLHjQSYJSX2ENbu8nQzxeexjUndJBaA81iOFhdJfWXIE/PrPmhBaCttNLmBzvp7XBFRZ+lYsW+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5FuXRY3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B3FC4CEF1;
	Sat,  4 Oct 2025 13:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759583791;
	bh=I08Nc5q5l8NppZLvGTcwZIupkZuUfHohxlx6YSbLewk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h5FuXRY3gTUhF8vmvnIftl9SK1p0HVgQBoEaGnoAnkbjYlysNFEMGuFLLApSwqh1P
	 N5cvKvZ/R8fc7+01dERuDrHqatFrqmkHblChqJM89tEU0qqgND/gGM2B6PO/DxYl0P
	 dBsNXe8nIraqK9Uu1H+Du0IYBmuuJ4CO+65s/BfqXHSlf1pCFcvrFE8b1vf4yX3eGi
	 gMF4aXHlselDAZou4l1OdOEvU6jtlTc1CvRxKxZ/yAcY7O1Gw0G4S9tcVwze672uFm
	 g77r0geiW3jJJOUrmUze93h3qE7mbcuhOXDPGo9HHJrPiaty9n0ye7bGVPsF74X6/m
	 qAE2JrTmIfvwA==
Message-ID: <f9c922f5-52af-45bb-a4ca-7ca80c0c3534@kernel.org>
Date: Sat, 4 Oct 2025 14:16:08 +0100
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
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, Xilin Wu <sophon@radxa.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
 <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
 <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
 <e69b23de-e9b6-4dfc-af01-7d2726dc23e4@oss.qualcomm.com>
 <bnrpfijh4rljdzroduqncfygysvgblljlhdpvq7ubajlbbwvwd@ohdmpjvpzj33>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <bnrpfijh4rljdzroduqncfygysvgblljlhdpvq7ubajlbbwvwd@ohdmpjvpzj33>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/3/25 6:02 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 03, 2025 at 05:35:16PM +0100, Srinivas Kandagatla wrote:
>>
>>
>> On 9/26/25 4:09 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
>>>>
>>>>
>>>> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
>>>>> On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
>>>>>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
>>>>>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
>>>>>> use msm_dp_audio_prepare instead. While userspace is still calling
>>>>>> hw_params to do audio initialization, and we get the following errors:
>>>>>>
>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
>>>>>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
>>>>>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
>>>>>
>>>>> And a call to hdmi_codec_prepare() comes only at this place.
>>>>>
>>>>> Srini, Mark, when selecting to only implement .prepare for codec ops I
>>>>> was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
>>>>> hook"), which documents that IEC958 status bit is set after
>>>>> .hw_params(), so it's only visible during .prepare(). Is it okay to
>>>>> implement both callbacks? Or should the audioreach DAI driver be fixed
>>>>> somehow instead (I suppose it assumes that the port is available after
>>>>> .hw_params(), not sure if that assumption is correct)?
>>>>>
>>>>>>
>>>>>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
>>>>>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
>>>>>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
>>>>>> hdmi-codec driver can work with userspace alsa.
>>>>>>
>>>>>> Tested with Radxa Dragon Q6A.
>>>>>>
>>>>>> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
>>>>>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
>>>>>
>>>>> The patch LGTM, but I would wait for response from audio maintainers.
>>>>>
>>>>
>>>> The ordering matters in this case as we need clocks and audio
>>>> configuration on DP codec side to be setup before we start configuring
>>>> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
>>>> even before it is ready.
>>>>
>>>> q6apm prepare loads the dsp pipeline and starts configuring the
>>>> endpoints, if the DP endpoint is not ready dsp would throw an error.
>>>>
>>>> We might be able to pull in some dsp logs to confirm this, but I dont
>>>> have a setup that I can reproduce this issue.
>>>
>>> What would be your recommendation to proceed? Is it okay for the DAI
>>> driver to depend on the .hw_params enabling the clock? Also I see that
>>> the error regarding the clocks comes from .prepare callback too. What is
>>> the order of .prepare callbacks()? Can we influence it?
>>
>> prepare follows hw-params, and prepare can be called multiple times
>>
>> When you mean order of prepare callbacks, you mean w.r.t codec and dsp
>> backend dia link drivers ?
> 
> Yes. Here we got a dependency from the cpu dai to be prepare()'d after
> the DP driver performs some actions, which were a part of hw_params()
> callback but were moved to be executed during prepare() callback.
> 
> This leads me to two sets of questions:
> - In which order are those callbacks executed? Can we make the ASoC
>   enforce some order of DAI's prepare() callbacks?
> 
> - More improtantly, isn't it a sympthom of DP driver (incorrectly)
>   performing too much in the .hw_params() / .prepare() callback? Should
>   we move some of the setup to the .audio_startup() instead? What is the
>   expected split between those callbacks?

I have not looked at full dp sequences but, if prepare is the only place
when it enables the required clocks for audio block, then it is a
problem, we should do it early so that DSP can enable the required
configuration in prepare.

Its also doable to move out the clock related settings from  prepare to
startup which should work aswell.

--srini

> 
>>
>> TBH, Am not sure, I did not find anything that was obvious from the code.
>>
>>
>>
>> --srini
>>
>>
>>
>>>
>>>>
>>>>
>>>> --srini
>>>>>> ---
>>>>>>
>>>>>> Changes in v2:
>>>>>> - Link to v1: https://lore.kernel.org/linux-arm-msm/20250924085804.34183-1-liujianfeng1994@gmail.com/
>>>>>> - Use more detailed trace log in commit message.
>>>>>> - Drop the empty line between Fixex and SoB.
>>>>>>
>>>>>>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
>>>>>>  1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>>>>>> index 7d78b02c1446..6ca1c7ad0632 100644
>>>>>> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>>>>>> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
>>>>>> @@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
>>>>>>  
>>>>>>  static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
>>>>>>  	.audio_startup = drm_connector_hdmi_audio_startup,
>>>>>> +	.hw_params = drm_connector_hdmi_audio_prepare,
>>>>>>  	.prepare = drm_connector_hdmi_audio_prepare,
>>>>>>  	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
>>>>>>  	.mute_stream = drm_connector_hdmi_audio_mute_stream,
>>>>>> -- 
>>>>>> 2.43.0
>>>>>>
>>>>>
>>>>
>>>
>>
> 


