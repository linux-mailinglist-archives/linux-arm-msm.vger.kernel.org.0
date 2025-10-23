Return-Path: <linux-arm-msm+bounces-78580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5FDC00E0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 407FA500ED8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916EB30E0EA;
	Thu, 23 Oct 2025 11:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrTp11Tg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8862FF155
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761220146; cv=none; b=ARAT5JQ+j9q2Y31QBtbTY4OjTm1MMzGKeoCsozXJN4imcF2Og3NuIJj2AVEqmY7GyqRMNQHnJeBL7RvGp8cyZnCyjH+SxAZNjmDHYR4Gu85W8n3LD0A0bKqqrDQ/rUM//r69uzVH9ZBRpLU2WE9L82RfcZbmhl03O61xV9p+S9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761220146; c=relaxed/simple;
	bh=4dgoVQlnEo4oODVa6YMvMXaJOlp99dhpE2pG4GcsxJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jSzPISaV80l3YPXdd+14yp5H7VJm1cKI4CviAEUFj0VGirHze8fQOF/WIY4/PCK4PGuqmg5WU9fQC86s4AQb5hUXZAErQ1qMzXxpOgWm2o4EPMRSlCq95uWbM2ccWheks+ph7MBudRT2l1CIe/JtHxKbbW1sqFZOrnaEGeJ4L3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrTp11Tg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7Gdpx025827
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+0Pbe/M8gSqUaSIRE3HIPvDZn2zygmrcLdsFcuo0zoM=; b=BrTp11TgbKo8PYk1
	EN1/4XeUyWLbVij/x/3psUVKGG5BHT3vNFcEwOZ5u2bcRyIuhoCnGnKNIiOu+YnM
	1/ENhRYsqMuL24zGiWIy1FmP0pTsZf4uN0GqqGfKAUHcCOuNeab2oPHWixrL4ZON
	4Ri7dpjWkCASFQrbXk1N+KfkfwZyqKEhMPJeVbzGOdJgbPfI2b2Cvo9H/EUfzSip
	kTNXb/VHWmurnKoyDLLajJv5j5L1cVV59afUFyoVr8FiQNfZ75sVU6T4+a3zdSoJ
	h+yFK5vj5+GtKVDr70vkLCGBIE8/Jf54jtJ8yanTs6Qhkv42ceVWDUkaIZJZS8oW
	yBf1Vg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kg2ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:49:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8a9ec4746so39192321cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761220143; x=1761824943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+0Pbe/M8gSqUaSIRE3HIPvDZn2zygmrcLdsFcuo0zoM=;
        b=QvvtT4fkMiXBfsvVp4YMf+4RQv8KBUhF8ZbMJaGQ0b2SlMxg7p5RrLGN2VIjLGJnlA
         rBn80V7ky5xJCZccKXWCdvywXF9rTXxhQ5sfvFcH+i6TB6+o8EKh02zm2T46vJM4nIJC
         lEKxUNTGA334RkKZ5BEb5S2WIXE/7TikgpUQqJZoEIeZvScL/13kKTpP+5+3zW07ayjg
         /33kAKdrEy9PksbTXdaM9XjkfvEdoibyTnQj4aR3hli+T1NP/0kTR/WAwC5JmbBx6OdM
         /vAK4/oLCKpa1KPCEj/D3DawKyQRLOMoXudrciB0358bX7EqfFglGWzlnjVLph5HjWyG
         z2/g==
X-Forwarded-Encrypted: i=1; AJvYcCVRELarAHKWVu1bBcEj3XaBDF/kYE7QVOUojqn1bQ1FMLkkB9iCwFeSTRcfSv3+IziDj8vK5vJS01uDcS8A@vger.kernel.org
X-Gm-Message-State: AOJu0YwA/KG+bBOYQ/JSMu5spwQwGnh2sE9YhqTrGft2ZNGbCOiD8dgK
	wSO0P5ukGWc8Fr3gPowNyAWuDi88tfCCeM/TG/IRjUcqba47QDeaIiAZcUDwdfK/Q1ijVwF30cz
	GKCjQuHevBtEvjFCegEQbAHAEodTNHVNIkXLEgAE7rcdRVW9uSXl1/Nip/h2JpxCX0bLm
X-Gm-Gg: ASbGncs0Ld+w3mDcjcdjuIM7MrxDhGKxjQuYlZOg0lF8ycpeTakQkGRSMCUg2ipUBCu
	uKAySQPvVATxOZsC5UQNPRspEjCRmF7RKnCFxZVZ/6MmdpNbUUMoNL27ziEwfhcyJ++PIfVh6Qg
	awdKj7/s874eGJHQIpvxVPdtfMnXksABCzASzXukZDyOz3TC4ZeuD+q1MRvRmuPsl5gXkLBi7TF
	UR50Dy3/KG20y7MsJlTdluWIfRYZTn81SyuSWEDk4coAl+PmlFpDdwYzEugDg16ecAkbVhCQpss
	41HVwhdjuOG7oRjRpmwTg7orLXoat9DGm2qQElv+Tf44cpz29WYT81I8DzibtWddUESgKw+9wYk
	oltlv9psL9YZfGHmTB15y1zCnPQ==
X-Received: by 2002:ac8:5fd0:0:b0:4b5:e9e3:3c90 with SMTP id d75a77b69052e-4e89d1d7746mr304723801cf.9.1761220142701;
        Thu, 23 Oct 2025 04:49:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEndSouLbaMqStBpGLIXSKQaZY6PXSsB/L1/iDncCBlOBKARZQJeEDJAjh9nsoFFo47+XIJuQ==
X-Received: by 2002:ac8:5fd0:0:b0:4b5:e9e3:3c90 with SMTP id d75a77b69052e-4e89d1d7746mr304723361cf.9.1761220142226;
        Thu, 23 Oct 2025 04:49:02 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-475c4369b33sm92047225e9.14.2025.10.23.04.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 04:49:01 -0700 (PDT)
Message-ID: <f1338318-0135-415e-ab65-482cef20f919@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 12:48:59 +0100
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
        Srinivas Kandagatla <srini@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
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
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <jymgfmn5pje4qaslyaivzfm4m7ho774pid3uenj6yfrlrdk3ss@2nqojclepgsu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XB7gKalrc277jksQ0M_pc6udkYHQGQO1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX9FlO+7+NSCgK
 qjGkbXw/2183kciiZM0uwvcaDobV8U6yBuo5pF8lgNtO77Qm4TzTHhSCS50bPl2scE9IeZlGUuf
 sP3NQtVcdJTS/qok5sOMxo8LZjRqu7xzAr3XMUEBMcv/YK9wtGdhH3ZbKgTvutldmtl1S/G9uTC
 VUWzbwBGxVDr0UbQnwSV2Wk+Hj8FHA3WVPchQPuvxz4bLXlJr+5GhB/h/4m/Yx7dA8anzKlxq3e
 nX9F37GQBVgU7dHkXNxhC254h7thUmkkJWy09NJYBNTCxtd8KlmqqMS3fc7+Br/b2sDYRB9kbsW
 qU31XMwCv5xfADa1EChe295P569OpbNmXe0pAfsSOg9Hn/sWxo8rfuLOIUFAiZzhXCSrNumo3RJ
 l/1ZMa2HguXa7cIFWD1iqINyOEAfmg==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68fa1630 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=flf6Z5GiNIarb4g2JskA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: XB7gKalrc277jksQ0M_pc6udkYHQGQO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031



On 10/23/25 12:43 PM, Dmitry Baryshkov wrote:
> On Sun, Oct 05, 2025 at 06:29:20PM +0300, Dmitry Baryshkov wrote:
>> On Sat, Oct 04, 2025 at 02:16:08PM +0100, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 10/3/25 6:02 PM, Dmitry Baryshkov wrote:
>>>> On Fri, Oct 03, 2025 at 05:35:16PM +0100, Srinivas Kandagatla wrote:
>>>>>
>>>>>
>>>>> On 9/26/25 4:09 PM, Dmitry Baryshkov wrote:
>>>>>> On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
>>>>>>>> On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
>>>>>>>>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
>>>>>>>>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
>>>>>>>>> use msm_dp_audio_prepare instead. While userspace is still calling
>>>>>>>>> hw_params to do audio initialization, and we get the following errors:
>>>>>>>>>
>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>>>>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>>>>>>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
>>>>>>>>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
>>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
>>>>>>>>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
>>>>>>>>
>>>>>>>> And a call to hdmi_codec_prepare() comes only at this place.
>>>>>>>>
>>>>>>>> Srini, Mark, when selecting to only implement .prepare for codec ops I
>>>>>>>> was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
>>>>>>>> hook"), which documents that IEC958 status bit is set after
>>>>>>>> .hw_params(), so it's only visible during .prepare(). Is it okay to
>>>>>>>> implement both callbacks? Or should the audioreach DAI driver be fixed
>>>>>>>> somehow instead (I suppose it assumes that the port is available after
>>>>>>>> .hw_params(), not sure if that assumption is correct)?
>>>>>>>>
>>>>>>>>>
>>>>>>>>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
>>>>>>>>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
>>>>>>>>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
>>>>>>>>> hdmi-codec driver can work with userspace alsa.
>>>>>>>>>
>>>>>>>>> Tested with Radxa Dragon Q6A.
>>>>>>>>>
>>>>>>>>> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
>>>>>>>>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
>>>>>>>>
>>>>>>>> The patch LGTM, but I would wait for response from audio maintainers.
>>>>>>>>
>>>>>>>
>>>>>>> The ordering matters in this case as we need clocks and audio
>>>>>>> configuration on DP codec side to be setup before we start configuring
>>>>>>> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
>>>>>>> even before it is ready.
>>>>>>>
>>>>>>> q6apm prepare loads the dsp pipeline and starts configuring the
>>>>>>> endpoints, if the DP endpoint is not ready dsp would throw an error.
>>>>>>>
>>>>>>> We might be able to pull in some dsp logs to confirm this, but I dont
>>>>>>> have a setup that I can reproduce this issue.
>>>>>>
>>>>>> What would be your recommendation to proceed? Is it okay for the DAI
>>>>>> driver to depend on the .hw_params enabling the clock? Also I see that
>>>>>> the error regarding the clocks comes from .prepare callback too. What is
>>>>>> the order of .prepare callbacks()? Can we influence it?
>>>>>
>>>>> prepare follows hw-params, and prepare can be called multiple times
>>>>>
>>>>> When you mean order of prepare callbacks, you mean w.r.t codec and dsp
>>>>> backend dia link drivers ?
>>>>
>>>> Yes. Here we got a dependency from the cpu dai to be prepare()'d after
>>>> the DP driver performs some actions, which were a part of hw_params()
>>>> callback but were moved to be executed during prepare() callback.
>>>>
>>>> This leads me to two sets of questions:
>>>> - In which order are those callbacks executed? Can we make the ASoC
>>>>   enforce some order of DAI's prepare() callbacks?
>>>>
>>>> - More improtantly, isn't it a sympthom of DP driver (incorrectly)
>>>>   performing too much in the .hw_params() / .prepare() callback? Should
>>>>   we move some of the setup to the .audio_startup() instead? What is the
>>>>   expected split between those callbacks?
>>>
>>> I have not looked at full dp sequences but, if prepare is the only place
>>> when it enables the required clocks for audio block, then it is a
>>> problem, we should do it early so that DSP can enable the required
>>> configuration in prepare.
>>
>> As I wrote, previously it was done as a part of hw_params, which is
>> also not optimal as hdmi-codec clearly defines both callbacks as
>> optional, requiring only one of them. Do you know, what is actually
>> required on the DP side for the DSP to be able to preapre()?
> 
> Srinivas, did you have a chance to look at this? Or the .hw_prepare
> ordering? I really don't want to land this fix only to face the same
> issue because on some of the platforms .hw_prepare() callbacks will be
> called in a different order.
> 
Dmitry, few days back Krzysztof was enabling DP audio on T14s, and we
have seen that the DSP is not happy and returning error 1 when we try to
prepare the dp port. The exact reason is codec is not ready at that point.


By adding this patch, Krzystof managed to get DP working.
XElite platforms were working before 2fef64eec23a ("ASoC: hdmi-codec:
Add a prepare) patch was merged, basically 2fef64eec23a broke what was
working before.

Am happy with this patch, better move to hw_params instead of prepare.


--srini

>>
>>>
>>> Its also doable to move out the clock related settings from  prepare to
>>> startup which should work aswell.
>>>
>>
>> -- 
>> With best wishes
>> Dmitry
> 


