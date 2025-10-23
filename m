Return-Path: <linux-arm-msm+bounces-78598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E0121C01358
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9F5BA4E6E2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029AA4086A;
	Thu, 23 Oct 2025 12:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFD+X7Il"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FC621ADB7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761223660; cv=none; b=DBMFL7DjMxexmIGw9CKopuJHmYKE6skf4QckZvzu2B4Yo0rUSvpMje5sdrEB6exFYnGj0PtCCG8NIeK6XX/NyQXmbf0osgdat+m5i8x03n2PNQygJ+W+3omlGb11aVs8X6EmhzKHo/ZhceRsIA2dKBZmAotQkCQAiqfPlsfapY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761223660; c=relaxed/simple;
	bh=kBuUgJwYcty+R4rLsQeeYT8HU0PUhhRRr3V2kXJP24o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nxGDrTORMk4Rl9Nj8YZJAA5/7qqpLjgRUFjntu35XkPbJAHnTMpEa5CoLsW0afm2jdmOmBWXveeQQybq7Qtyd2Z5dibzE7jkSlldN8sa9RrrrnxnfU7wOY/S2IDJ2kvdUslyoBLHw2WZmIjqkXM6CyWaosWkjY58vdXwpfhbyRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFD+X7Il; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NCKoKR022586
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	24QeiCotR//tHfiqvQEewoseSxEQZNDe4+bx6DoDfNA=; b=oFD+X7IlT7PiQ6fW
	7Kb2nrR4H1OA9YoCEd/Hr0LKFRsr3rvNgJ8g6EUnK+NYCNrvdv2SyX1iAGl09b2J
	RO7LZGq4udYxUFFIixoR+wO/Lhg3mNEGcbrDDLiGYnNPGD48BEbAn75hXE6Bq68x
	eivPVbRXwh0yPdH0F+0JtAXNoTNcOt9DSNgA1sdWhfX1ehOsOfy7X6ZjvwMPcjwx
	3u55VdiVhqsGS+Ai3XVPffZMLU594uX50BYoFEIgMEMfFnsXyeQsAbpVq2IXNgRj
	xZPzfBJLgYNGwP6dD6ITqv4Cvb1/AYgzJOJ8ZIZr9mkltEOS688xkeqLwy/jf9sn
	8Ml+oA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49ym9j028y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:47:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8a9ec4746so42264141cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 05:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761223657; x=1761828457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=24QeiCotR//tHfiqvQEewoseSxEQZNDe4+bx6DoDfNA=;
        b=AGIjJcmeyx66RW4agu+KlC2oBjcaOI0UVpa7eZKYASMby64clVjylvz5WRa8ALY0Kw
         Iij7kZ0MZW6GuxeSbSLKJ70zIuZ3KsCCLAJnu83B+AFgLFaA0kFHlPNXCo5fHiInpBBp
         jKwGqATvemOPoG/3SVIpTgGEyr3UzDnczBCW8eZFgDd+w7OlSbD41/mrOHHoNvsK46Fa
         J4hoZOKV41jUX3h3jyL3wA5z6NzIfgDjpB7wkB8vy+SJGlu9QlgcCNi+JmePZ6M2CoYl
         tvOz81VQDkh1YxGuAnNTuHwnoxVUb8ABzucN+8jKjazVBNuwkGv7qhnPK59hJL1SiZZB
         jYiA==
X-Forwarded-Encrypted: i=1; AJvYcCUkZ87zbVs1ivxUGmGroZx5KTn5mVz3+EzbMwPDsfCsUcgG9WnS21FyilE5AGE/Tp6sTo00KAYVOwxQ/FZd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1bMZGZ1sS7/84lUTNr+BTTQIgbQUWQwIzXIAyOxjganUrkV+Z
	osOOYX7RfmLryKa4XzQTudW/nHozO69Zdi24A1wqwcZjPUi7iuUfc0GbQ5hExweeVUd1ilPDOFA
	RtB72YKkesIjQaTHF8YCe6GxIkqhpwQypVArgykCWr1BfgpXdZcAecR/yiXV4fwipsB7D
X-Gm-Gg: ASbGncvSoLsijuAaq19Pvg7StJTbHH8lIB4TRluzk+v2DSk+MuH+D1wS5Nx4aaD+H58
	Ghu2MuWF7p6HqQaq3VTl2TosZVGFbUXu/HXibqPJs6uGWPFHp9mGYn5Xv/TZvgW/LP/Dfk1X3s8
	WlicZguH4uSjehUDuY89OaNvmbTspMkwP3ONe+joPXlJt+xmQZ4nX6D2KOREPYA8ba8QmwDrkfp
	zH1pM15YDxyD3oxuiNFxzBeZmPN7mNXhM0HRDZAcIXdtbjNQpEsHvckMOwNql27VgC4i/E4XqGD
	g0pwDq6gGx4vDmYKZcDoUj4kUcYhr1A0EB4U5jTNchH+yL4i1ligus70Wn4kpWRSGnCNp8kyP7t
	lq+pvgTruRVnY4AmKb2fiMoNYQA==
X-Received: by 2002:ac8:5883:0:b0:4e8:99b0:b35e with SMTP id d75a77b69052e-4e89d263140mr293100581cf.30.1761223656861;
        Thu, 23 Oct 2025 05:47:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxStyuo5wBQVxSJ8+2cAD62zdY4gfTl+tKvmd0YRbr5e3lLNbpbu15fbW5YGeHHk5tbOiQIQ==
X-Received: by 2002:ac8:5883:0:b0:4e8:99b0:b35e with SMTP id d75a77b69052e-4e89d263140mr293100221cf.30.1761223656344;
        Thu, 23 Oct 2025 05:47:36 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429898ccd88sm4617224f8f.36.2025.10.23.05.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 05:47:35 -0700 (PDT)
Message-ID: <2ded2868-ae77-4c9d-9456-ac2af775a219@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 13:47:33 +0100
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
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, Xilin Wu <sophon@radxa.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
 <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
 <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
 <e69b23de-e9b6-4dfc-af01-7d2726dc23e4@oss.qualcomm.com>
 <bnrpfijh4rljdzroduqncfygysvgblljlhdpvq7ubajlbbwvwd@ohdmpjvpzj33>
 <f9c922f5-52af-45bb-a4ca-7ca80c0c3534@kernel.org>
 <7fwfxr7zqsaudselhru3jtjc2f7pdjvlaj2b464vgdlqcrljek@asci6y3ghq63>
 <jymgfmn5pje4qaslyaivzfm4m7ho774pid3uenj6yfrlrdk3ss@2nqojclepgsu>
 <f1338318-0135-415e-ab65-482cef20f919@oss.qualcomm.com>
 <zlu5x6v2xkum67prrtk26r7govenczuntjvlrflvdb6lpd2ssy@jgrnl6elophe>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <zlu5x6v2xkum67prrtk26r7govenczuntjvlrflvdb6lpd2ssy@jgrnl6elophe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CLknnBrD c=1 sm=1 tr=0 ts=68fa23ea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=y3vTIzG8JlWF4sTvGw8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDExMiBTYWx0ZWRfX++abH6oHeFhN
 cNg2+Ld8eEMkQmeevw0MDCsmiBL4JI77s+68RaDectMlrXZVjBz79aUw2BtRaP2tAejoDuTUpcj
 tJ5D0OVnrkHqR3R8ASCZQYM2cTI3arbSWJO6a9GuhC1yZm4317LsW+3OdOzf9k/5ispYp0HlEmJ
 aZQkFIgGcThmSRzFHu08fN5Ay8A1NwBSZei8GaavfgXSMfTumJuhlxVtlwuXyVEEl+A9uB8DqTG
 H/1qDzHUKBsZ6REM+MQTWo9XcikaYeUNbn8Lb1nGUUQ5AXfnY5mM1R1vLudTkyd24v3g1/pk0Mg
 AUt8n+6Dsr/N6tKLijQIW2Y5yRRuCioVuQL+mgi8TkFLc4fjZ6Zr4dcPOl2Yx42BZzJbIXU9Pjw
 omeaxHpK9NE4KczJFep6Zpmxe4zoMw==
X-Proofpoint-GUID: fsKNNfdu4EIZeEdBX4UBrCkL0pxUpER-
X-Proofpoint-ORIG-GUID: fsKNNfdu4EIZeEdBX4UBrCkL0pxUpER-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230112



On 10/23/25 1:24 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 12:48:59PM +0100, Srinivas Kandagatla wrote:
>>
>>
>> On 10/23/25 12:43 PM, Dmitry Baryshkov wrote:
>>> On Sun, Oct 05, 2025 at 06:29:20PM +0300, Dmitry Baryshkov wrote:
>>>> On Sat, Oct 04, 2025 at 02:16:08PM +0100, Srinivas Kandagatla wrote:
>>>>>
>>>>>
>>>>> On 10/3/25 6:02 PM, Dmitry Baryshkov wrote:
>>>>>> On Fri, Oct 03, 2025 at 05:35:16PM +0100, Srinivas Kandagatla wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 9/26/25 4:09 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
>>>>>>>>>>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
>>>>>>>>>>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
>>>>>>>>>>> use msm_dp_audio_prepare instead. While userspace is still calling
>>>>>>>>>>> hw_params to do audio initialization, and we get the following errors:
>>>>>>>>>>>
>>>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>>>>>>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
>>>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>>>>>>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
>>>>>>>>>>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
>>>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
>>>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
>>>>>>>>>>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
>>>>>>>>>>
>>>>>>>>>> And a call to hdmi_codec_prepare() comes only at this place.
>>>>>>>>>>
>>>>>>>>>> Srini, Mark, when selecting to only implement .prepare for codec ops I
>>>>>>>>>> was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
>>>>>>>>>> hook"), which documents that IEC958 status bit is set after
>>>>>>>>>> .hw_params(), so it's only visible during .prepare(). Is it okay to
>>>>>>>>>> implement both callbacks? Or should the audioreach DAI driver be fixed
>>>>>>>>>> somehow instead (I suppose it assumes that the port is available after
>>>>>>>>>> .hw_params(), not sure if that assumption is correct)?
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
>>>>>>>>>>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
>>>>>>>>>>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
>>>>>>>>>>> hdmi-codec driver can work with userspace alsa.
>>>>>>>>>>>
>>>>>>>>>>> Tested with Radxa Dragon Q6A.
>>>>>>>>>>>
>>>>>>>>>>> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
>>>>>>>>>>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
>>>>>>>>>>
>>>>>>>>>> The patch LGTM, but I would wait for response from audio maintainers.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> The ordering matters in this case as we need clocks and audio
>>>>>>>>> configuration on DP codec side to be setup before we start configuring
>>>>>>>>> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
>>>>>>>>> even before it is ready.
>>>>>>>>>
>>>>>>>>> q6apm prepare loads the dsp pipeline and starts configuring the
>>>>>>>>> endpoints, if the DP endpoint is not ready dsp would throw an error.
>>>>>>>>>
>>>>>>>>> We might be able to pull in some dsp logs to confirm this, but I dont
>>>>>>>>> have a setup that I can reproduce this issue.
>>>>>>>>
>>>>>>>> What would be your recommendation to proceed? Is it okay for the DAI
>>>>>>>> driver to depend on the .hw_params enabling the clock? Also I see that
>>>>>>>> the error regarding the clocks comes from .prepare callback too. What is
>>>>>>>> the order of .prepare callbacks()? Can we influence it?
>>>>>>>
>>>>>>> prepare follows hw-params, and prepare can be called multiple times
>>>>>>>
>>>>>>> When you mean order of prepare callbacks, you mean w.r.t codec and dsp
>>>>>>> backend dia link drivers ?
>>>>>>
>>>>>> Yes. Here we got a dependency from the cpu dai to be prepare()'d after
>>>>>> the DP driver performs some actions, which were a part of hw_params()
>>>>>> callback but were moved to be executed during prepare() callback.
>>>>>>
>>>>>> This leads me to two sets of questions:
>>>>>> - In which order are those callbacks executed? Can we make the ASoC
>>>>>>   enforce some order of DAI's prepare() callbacks?
>>>>>>
>>>>>> - More improtantly, isn't it a sympthom of DP driver (incorrectly)
>>>>>>   performing too much in the .hw_params() / .prepare() callback? Should
>>>>>>   we move some of the setup to the .audio_startup() instead? What is the
>>>>>>   expected split between those callbacks?
>>>>>
>>>>> I have not looked at full dp sequences but, if prepare is the only place
>>>>> when it enables the required clocks for audio block, then it is a
>>>>> problem, we should do it early so that DSP can enable the required
>>>>> configuration in prepare.
>>>>
>>>> As I wrote, previously it was done as a part of hw_params, which is
>>>> also not optimal as hdmi-codec clearly defines both callbacks as
>>>> optional, requiring only one of them. Do you know, what is actually
>>>> required on the DP side for the DSP to be able to preapre()?
>>>
>>> Srinivas, did you have a chance to look at this? Or the .hw_prepare
>>> ordering? I really don't want to land this fix only to face the same
>>> issue because on some of the platforms .hw_prepare() callbacks will be
>>> called in a different order.
>>>
>> Dmitry, few days back Krzysztof was enabling DP audio on T14s, and we
>> have seen that the DSP is not happy and returning error 1 when we try to
>> prepare the dp port. The exact reason is codec is not ready at that point.
>>
>>
>> By adding this patch, Krzystof managed to get DP working.
>> XElite platforms were working before 2fef64eec23a ("ASoC: hdmi-codec:
>> Add a prepare) patch was merged, basically 2fef64eec23a broke what was
>> working before.
>>
>> Am happy with this patch, better move to hw_params instead of prepare.
> 
> And I'm not happy with it :-)
> 
> hdmi-codec defines that one of the callbacks can be optional. We know
> that at .hw_params time we don't have IEC 958 status bits, so we will be
> programming incorrect audioframe.
Your statement is contradicting with callbacks that are supported by
hdmi-codec.

hdmi-codec uses IEC 958 status bits both in hw_params and prepare, if
hw_params is not the right place, then that should be clarified and not
correct for any of the codec drivers to use this callback.>
> Should some bits of code be moved to .audio_enable isntead? If so, which
> bits?

I have not read the data sheet of msm dp block yet, but what it looks to
me is the audio engine in the DP is powered off while dsp is trying to
set it up.

--srini>
> I agree that there is a regression and that this patch fixes it. I argue
> that the fix is incorrect.

> 


