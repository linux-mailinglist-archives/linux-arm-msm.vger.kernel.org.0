Return-Path: <linux-arm-msm+bounces-75920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 15118BB7534
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 17:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A9464EBAAD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 15:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150E02376E0;
	Fri,  3 Oct 2025 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgSglLBq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5973747F4A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 15:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759505497; cv=none; b=IFveiX6jfb6Qt4cU+HHKVfkh2NjJyYo4wOZPLb3OcKzrHhyStqaksRSDH+Px8tRbe2UgNGKJDPdW+TS4VHYtiW4+dMvT+8MalXhomDfNsuXxRroAga1JojQZE8hUlI/CAxn0E9W/HiIFBsTFQIcctkkXvDrIC19SERcRdrX8oo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759505497; c=relaxed/simple;
	bh=tZjlkJYvKYhZDJBCtI4wh0wOS7lsBYi5PW/yKtOWseI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=r+4JXbagygGvEbiYxFgVckfszK23uTKKOmhs8QLpwI/kRWOJEWQwHm9aXqd4LNAtuE0CNJX+1XT/L9T3DFQEfiy4Dqwfj8bniyZ1dRe0hGoIMAXtUG4XKTS4l5K7az2/aBImJtbKxBBf0LIodHD9zFXEDrXrWB5YNqdij6zOFf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgSglLBq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593CG7Zk014930
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 15:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cN2q9ybhrW5wodtD1jj2UWHaeowHEfEaUpKoifZ8W1w=; b=JgSglLBqxaA41vtD
	Q5S/ju+caQWPeospqF3DznLwbXfqEqveMw0oQXYhN6HR47X+3oC8rcpEf2TD0ExJ
	3ezLaP04evxRzSLyRnsSa1UUHk9q1o5ibgrlKcyvi+kgEgjsN3maPfdY2vu5I6hd
	92+HfgiOcIvdkEBEEv35vIJoUMYk9MzQjeq3d2jdhQBPio4mqiaiV6pYB2XWhYWp
	TzrXBL1zXl+sgM/oHwT/FMrY2+uvqhgQK6nt/Bd3cTvbyphNNIHYLRVQvVwIqRIQ
	vt5IjdAU6tcKiEmcjsNpj0/agYPCN/+vwLtzWtF4jqOkwIZy3XL0Zwg3fMfFYfqs
	q39wJw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jeb7gf7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 15:31:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-54a9f198468so1118177e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 08:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759505493; x=1760110293;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cN2q9ybhrW5wodtD1jj2UWHaeowHEfEaUpKoifZ8W1w=;
        b=vopt7bczhTDwL4RWPnbIxCHUzSZds6VjD1qRgRxIpr+Wadft9uROd/ag66rseA3WVf
         VjhA/BHXl6pCVg9DkBi6tjo8ukVBdTRJKUEPlqnQ9s49aMdT2wcccNXaAaWzjhRLY78I
         MFd1iM1N1dFTBF+1mlZRzCqeDMzpEBM5geHSaHpdi6M4OEwIHZcLlWu3d3dkKRJGGypw
         CT5yFhgsaux/0i7j/WbsCd7CzhLXN4q7yRBbRv8ztEf5puS0IPxnrTCe6NnrN9q4RFMw
         IRiG2Ndi0yJjlx/2FY83pTE3bC3k6+vNWGWoJLKXky39/fz7O5CpccRJwIOQKTLESner
         vMLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4dpOMSFOLa51y2fDfpU0gX4zYwCACL0NTeTBwXjYyqja7gPit+fm6X3ziHruI/Owqsb1RdQyWPi257oIr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9c4vOZfFfTAt/AU59MfOfES3TXRWOwccJLTHMKkhvGCCYaU0O
	21jqBD/WqPpyQ3oAYMCkuM/7AP7xxcRLuvXxh/L1DsGZ4qwgrpIrQxrScXxftpWdi4/SWNh24H4
	LgPtiz9BL74M7GmpJeWGMAO2G+r3nZEEjmvUkBtrri5PnpRnVWDFGNioDnjmCzhGtvCmH
X-Gm-Gg: ASbGncuGZbzK4sL7IttSrsBf2n82nKk560+PAIoyy/6jRNCYZlpHCHun6OsBdbU4bcZ
	IIWeTeP9NGexMAQncUEcRTU2lHMLtn3fEqsmfIfCpXDi+g7SbOrQr120Q0Z0x7IWKZw+pX6L3ji
	c/pfcCMDmDtC3fWYYUNJVUBFGWfQcJgan5wvxgZIcLiAFd8+qFHdEdeKqp6zgARHryzPbCX+YhM
	X++xrkBup5SHSKE8V8dMiAqw99xYEipH7Dp4L7gg7jgOR7a1He+ZQCimulvmP674GdmwpgpMYci
	5aI/4tTeoiYEPZjet2oG5UGnBKMBPHF79N9R69Cb7Q5DkfeRQ1v0MGRkCWNxULHv4zoeIWRDdwR
	+Olb3oD5gJwZ4j+1Q4N8uA3X1qN/k2kQH
X-Received: by 2002:a05:6122:910:b0:54a:87d3:2f09 with SMTP id 71dfb90a1353d-5524e83e376mr1225289e0c.2.1759505492293;
        Fri, 03 Oct 2025 08:31:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRK9X4ifva4mfBadLEBPmnh/d5o8SFjQ0l3cv9c3lPG9Nfn3Q7h+okNiMAu/HKT8Ho3zUORQ==
X-Received: by 2002:a05:6122:910:b0:54a:87d3:2f09 with SMTP id 71dfb90a1353d-5524e83e376mr1224983e0c.2.1759505490450;
        Fri, 03 Oct 2025 08:31:30 -0700 (PDT)
Received: from [192.168.10.38] (91-154-146-251.elisa-laajakaista.fi. [91.154.146.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01140c6asm1929581e87.56.2025.10.03.08.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 08:31:29 -0700 (PDT)
Message-ID: <e602afc6-6492-4e96-88c8-963600ab696a@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 18:31:27 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, Xilin Wu <sophon@radxa.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
 <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
 <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
Content-Language: en-US
In-Reply-To: <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAzMDA5OSBTYWx0ZWRfX1vT9kuMIRPws
 BlkbO97qBTktegRmmg8ns7LlLKsQ9G9Amx6xGTUCfhFFfReMhLZeGkHBxJXcB1gOdxgQpSZrR+o
 dgU/vJWwLT75jlKZRw/Ry8+NDmt2p/B4wFWBjglxAehkuZKDV/X4tZsLWNypR+T1xaIeQiFq9c9
 GbO7nthxB24N21drWCStM8qYujOh+YiyX3XvQ4U+z9FJ7uEqnXP4gga9yjJJl3u6CLRLFPkbd/e
 WPYe92SjluPd2J9mtaX9+z80JeFe8Edl1NalWGjqW6XTXm7eGr9DrgZMMPVHm2hODI7vyRoXVXy
 1uJICRD/8zbHboaGG45H19Z0FtJ4RV2tbiCUWVWKi5PqKR8m1mkEg6OSRYG06htFUqnL7vDDCKM
 DbiZkJd17QySBGdO5tldAtbzgfyjkg==
X-Proofpoint-GUID: AZons-Aiu6j2tMPuSCVAWGwjx-fyARm4
X-Proofpoint-ORIG-GUID: AZons-Aiu6j2tMPuSCVAWGwjx-fyARm4
X-Authority-Analysis: v=2.4 cv=YrwChoYX c=1 sm=1 tr=0 ts=68dfec56 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=CKk/IlMN6Gw3Dq31eR3Dfg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=K3JhrWoqGPPN_aSwzY8A:9
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510030099

On 26/09/2025 18:09, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
>>
>>
>> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
>>>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
>>>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
>>>> use msm_dp_audio_prepare instead. While userspace is still calling
>>>> hw_params to do audio initialization, and we get the following errors:
>>>>
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
>>>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
>>>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
>>>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
>>>
>>> And a call to hdmi_codec_prepare() comes only at this place.
>>>
>>> Srini, Mark, when selecting to only implement .prepare for codec ops I
>>> was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
>>> hook"), which documents that IEC958 status bit is set after
>>> .hw_params(), so it's only visible during .prepare(). Is it okay to
>>> implement both callbacks? Or should the audioreach DAI driver be fixed
>>> somehow instead (I suppose it assumes that the port is available after
>>> .hw_params(), not sure if that assumption is correct)?
>>>
>>>>
>>>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
>>>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
>>>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
>>>> hdmi-codec driver can work with userspace alsa.
>>>>
>>>> Tested with Radxa Dragon Q6A.
>>>>
>>>> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
>>>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
>>>
>>> The patch LGTM, but I would wait for response from audio maintainers.
>>>
>>
>> The ordering matters in this case as we need clocks and audio
>> configuration on DP codec side to be setup before we start configuring
>> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
>> even before it is ready.
>>
>> q6apm prepare loads the dsp pipeline and starts configuring the
>> endpoints, if the DP endpoint is not ready dsp would throw an error.
>>
>> We might be able to pull in some dsp logs to confirm this, but I dont
>> have a setup that I can reproduce this issue.
> 
> What would be your recommendation to proceed? Is it okay for the DAI
> driver to depend on the .hw_params enabling the clock? Also I see that
> the error regarding the clocks comes from .prepare callback too. What is
> the order of .prepare callbacks()? Can we influence it?

Srinivas, any response from your side?


-- 
With best wishes
Dmitry

