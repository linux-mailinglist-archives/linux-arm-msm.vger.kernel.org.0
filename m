Return-Path: <linux-arm-msm+bounces-78595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AECFC011A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D580F19A248F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C33212B143;
	Thu, 23 Oct 2025 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjYN0jDE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A856829BDA3
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761222289; cv=none; b=T2n9awCexraj/C7PkNJpShtipFicNs9SnkYeHEzHNLRgMJsulIdm7uv0P5J/GeOX/dkf2FDX3apoxKOG0zJFO/iw08YOto/N7ZoPhrhM1LmOXEy+A6FCfdT1EUMIyfafpcygNf1Qz6SlY0p0mdL6vTJ/9x7cHe24ZTVSZXM5S+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761222289; c=relaxed/simple;
	bh=xUH8q+2SHnhWkhQOLL+vv5l6h2lHGatDGUNWMUJNVZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9JBQS3+kCQmPkejPFwulk1kZ+lR1cveP62WYiNxe7ojacfM2PsONcPljTzOiOBKho911uwUsAt44p+T8g8+M5Gy2uAsFGcaiubuR/ZkYx59iWkWCh3oP8BcAlxYy+EHRoI4BOsgUTRVKX+BWRABK6unwpIR51x1oPHO2XpKzT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjYN0jDE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6vYJD005702
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uXuANgXqsKXGKeLuCYHue4m8
	RvWUrBUEqqVkisMKjFI=; b=QjYN0jDEbXXPW528UXuem7IR6xFnUhjh8YPcgqRP
	Zu/ImmCyd/69SomauaI7UnWGQGcDb7TWP28Nkv8t56md3HrrEdvDdZKDyOa7Tl10
	H+AWCoCZ1qq5cK/CNU7zDWtnBU0DBZb9IJYe6TKh6hgCS9i8r7hbQuO8sCwPcfEu
	QIFDSbD6ssAz+tNvxJRRg+NeVrCMPkzQCJg8Zv75Rk5ukbZiGX5rxAfD6QjWxQoP
	QW6KzXbyHcEXRV+5JEQHVgHyY5lZLkmVUBTltYEFLZ9yIsnli8ydKAVEFon9r22x
	UKiWqJ3Mh2bQo/9czrwlk7Zo8svrW5MD/CbaDVPIRHpOTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j89tm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:24:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e884663b25so23185611cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 05:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761222286; x=1761827086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXuANgXqsKXGKeLuCYHue4m8RvWUrBUEqqVkisMKjFI=;
        b=Br6sLqav8nZQIiPpQ4d8KfH3aBRlrEmR58V50jZj+KF1FNiKDzYiqODoXVP3MQ7QCI
         9eNj5Kmv4imGfHcSsohw++qa0U9vV94vv7QUZmG8Ukr2atCVxDr39KuybcR/IjYFOAr+
         t43GhZyoMsYH1dkviiJuYOBE11Iz8L+PryxlPycV7B+2wf9B3v4zI7hJsAk8xMfpVRh6
         nnwfv8EIwxJAeVvNKNenPwdHnOfV3ijl221V9dkbr0RAz3B8kyt7LQU4TG6397YVKD5B
         DU1/cQkfdSfQnYtM+VTSEVdS434fQ8EVNblaxGScmxMR2yrP36Jw1aiv/tNiZK1m+dMZ
         yluQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtrbCiIAOaAYEMui3Nn9sHh1XdoxmRS13Ha6LScdeoIqZEeqI4aBNKjVCiRHpLo+C1JRgzQk+sAAVVLp0p@vger.kernel.org
X-Gm-Message-State: AOJu0YxrNugV9rwjzixoZKdsmM2CUM9zI/HUKh8EfILuGxGobb8GYkMS
	2rilC8kuq9quOh0/hBgg1z71gSM7emTMDcYukbeXw94LPeyfGsXgYUaMEysIzUpW+U48cxvxpzt
	dR/IirPr2n/uqs0cbojxisL+wZg2rJ6EsEW0UtRV1eUO79F9pF6VIge2pBegce2/GRt4J
X-Gm-Gg: ASbGncuOrqiiqvdzfTZQMZ6F/tS1NR+K93Sc1t5E+pX3T+ymtB8JteO+/LJU9Wa8PCW
	Ijk0HXsH7/9XxesgggJXiEk7VLkJYqJ4bMyd5ZR8zfdJomD1aaey536XmER/4Bad8APMJJG0NhV
	B5LgTWpMyYuLKl9UL2n9Nr96ywr9TZ32/mPe5adnwbgVBh07jyiSg0OVEevmO/x8c1iuLsKX0kQ
	XpNXsoqQSiHRRsQ2UBzFkbvdJywmI79LWkCTaiM3nhwAlhttzmoiGeGNN+9OWf2WhwC3wVacTkV
	kdzMjMyk1TJ7x0dptBEX1WqM/LEmVR0IVGcaWck+qsQmn5lomPaXuIJATc1+M1yZrrMoZGTqQwq
	QMyTl2GC74aolEbZYx/nafuMAna9nOaJcu7+WN+DrbTlfx6tCHgFhvHHlHQMQGegSv+eGf4yB4A
	Ub4SS9p3Q9SUzL
X-Received: by 2002:ac8:7f06:0:b0:4e8:a967:953e with SMTP id d75a77b69052e-4e8a9679e65mr251441191cf.24.1761222285613;
        Thu, 23 Oct 2025 05:24:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVfVx4NRvt1CYWR2h8fbEsyadOtBDfpsDEnBpaGw2vZHVqcYjFk6imZkMy/IOObieOX2c1UQ==
X-Received: by 2002:ac8:7f06:0:b0:4e8:a967:953e with SMTP id d75a77b69052e-4e8a9679e65mr251440601cf.24.1761222284973;
        Thu, 23 Oct 2025 05:24:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378d66bb005sm4458881fa.10.2025.10.23.05.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:24:43 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:24:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, Xilin Wu <sophon@radxa.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Message-ID: <zlu5x6v2xkum67prrtk26r7govenczuntjvlrflvdb6lpd2ssy@jgrnl6elophe>
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
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1338318-0135-415e-ab65-482cef20f919@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX8tllVKv5pjsO
 iCq2K0wbLsj7JvacfssQcAnSOsF6+7wbF3P47jidCgkM+Xb5yODmhpP0LGWScSF6V1rvbCzAHq1
 tn6e0ixHcVecP0mU6fpKzK685d8re4Myz1beeCuObzLVeis6HMpW2HeaS3ZIVZmKPBYFGHnihN+
 pq6gcaQvOumOg+0nyKOzxenY3Ne9amz9TR+Ec0gReya6MUuuWxvJnfOi95/MwvhQSTpLveHApzr
 HcS5jofFFaQKo0jZXpReuWeZ1rJler6liln5zFRkR/50RqoVCQ4qE9OHjjgu4lh9ZNl1eNDB/yE
 ebTZ3IzuyIcWiK8Yr5/YJlaBKLYH9+fEkE7jPKmuTM3pocu9SnTylpM1/Bz6iyWiKO+ey8L6Ckq
 DS83YWnDTNhwjFOgVOS1xR9QSUuZEg==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fa1e8e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8
 a=grqte4VfTkGWRzHCIIUA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ErKHnATmzH8cBJPgcWK5zSZDFCRiXx-S
X-Proofpoint-ORIG-GUID: ErKHnATmzH8cBJPgcWK5zSZDFCRiXx-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

On Thu, Oct 23, 2025 at 12:48:59PM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 10/23/25 12:43 PM, Dmitry Baryshkov wrote:
> > On Sun, Oct 05, 2025 at 06:29:20PM +0300, Dmitry Baryshkov wrote:
> >> On Sat, Oct 04, 2025 at 02:16:08PM +0100, Srinivas Kandagatla wrote:
> >>>
> >>>
> >>> On 10/3/25 6:02 PM, Dmitry Baryshkov wrote:
> >>>> On Fri, Oct 03, 2025 at 05:35:16PM +0100, Srinivas Kandagatla wrote:
> >>>>>
> >>>>>
> >>>>> On 9/26/25 4:09 PM, Dmitry Baryshkov wrote:
> >>>>>> On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
> >>>>>>>> On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
> >>>>>>>>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> >>>>>>>>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> >>>>>>>>> use msm_dp_audio_prepare instead. While userspace is still calling
> >>>>>>>>> hw_params to do audio initialization, and we get the following errors:
> >>>>>>>>>
> >>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>>>>>>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> >>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>>>>>>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> >>>>>>>>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> >>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> >>>>>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> >>>>>>>>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
> >>>>>>>>
> >>>>>>>> And a call to hdmi_codec_prepare() comes only at this place.
> >>>>>>>>
> >>>>>>>> Srini, Mark, when selecting to only implement .prepare for codec ops I
> >>>>>>>> was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
> >>>>>>>> hook"), which documents that IEC958 status bit is set after
> >>>>>>>> .hw_params(), so it's only visible during .prepare(). Is it okay to
> >>>>>>>> implement both callbacks? Or should the audioreach DAI driver be fixed
> >>>>>>>> somehow instead (I suppose it assumes that the port is available after
> >>>>>>>> .hw_params(), not sure if that assumption is correct)?
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> >>>>>>>>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> >>>>>>>>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> >>>>>>>>> hdmi-codec driver can work with userspace alsa.
> >>>>>>>>>
> >>>>>>>>> Tested with Radxa Dragon Q6A.
> >>>>>>>>>
> >>>>>>>>> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
> >>>>>>>>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> >>>>>>>>
> >>>>>>>> The patch LGTM, but I would wait for response from audio maintainers.
> >>>>>>>>
> >>>>>>>
> >>>>>>> The ordering matters in this case as we need clocks and audio
> >>>>>>> configuration on DP codec side to be setup before we start configuring
> >>>>>>> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
> >>>>>>> even before it is ready.
> >>>>>>>
> >>>>>>> q6apm prepare loads the dsp pipeline and starts configuring the
> >>>>>>> endpoints, if the DP endpoint is not ready dsp would throw an error.
> >>>>>>>
> >>>>>>> We might be able to pull in some dsp logs to confirm this, but I dont
> >>>>>>> have a setup that I can reproduce this issue.
> >>>>>>
> >>>>>> What would be your recommendation to proceed? Is it okay for the DAI
> >>>>>> driver to depend on the .hw_params enabling the clock? Also I see that
> >>>>>> the error regarding the clocks comes from .prepare callback too. What is
> >>>>>> the order of .prepare callbacks()? Can we influence it?
> >>>>>
> >>>>> prepare follows hw-params, and prepare can be called multiple times
> >>>>>
> >>>>> When you mean order of prepare callbacks, you mean w.r.t codec and dsp
> >>>>> backend dia link drivers ?
> >>>>
> >>>> Yes. Here we got a dependency from the cpu dai to be prepare()'d after
> >>>> the DP driver performs some actions, which were a part of hw_params()
> >>>> callback but were moved to be executed during prepare() callback.
> >>>>
> >>>> This leads me to two sets of questions:
> >>>> - In which order are those callbacks executed? Can we make the ASoC
> >>>>   enforce some order of DAI's prepare() callbacks?
> >>>>
> >>>> - More improtantly, isn't it a sympthom of DP driver (incorrectly)
> >>>>   performing too much in the .hw_params() / .prepare() callback? Should
> >>>>   we move some of the setup to the .audio_startup() instead? What is the
> >>>>   expected split between those callbacks?
> >>>
> >>> I have not looked at full dp sequences but, if prepare is the only place
> >>> when it enables the required clocks for audio block, then it is a
> >>> problem, we should do it early so that DSP can enable the required
> >>> configuration in prepare.
> >>
> >> As I wrote, previously it was done as a part of hw_params, which is
> >> also not optimal as hdmi-codec clearly defines both callbacks as
> >> optional, requiring only one of them. Do you know, what is actually
> >> required on the DP side for the DSP to be able to preapre()?
> > 
> > Srinivas, did you have a chance to look at this? Or the .hw_prepare
> > ordering? I really don't want to land this fix only to face the same
> > issue because on some of the platforms .hw_prepare() callbacks will be
> > called in a different order.
> > 
> Dmitry, few days back Krzysztof was enabling DP audio on T14s, and we
> have seen that the DSP is not happy and returning error 1 when we try to
> prepare the dp port. The exact reason is codec is not ready at that point.
> 
> 
> By adding this patch, Krzystof managed to get DP working.
> XElite platforms were working before 2fef64eec23a ("ASoC: hdmi-codec:
> Add a prepare) patch was merged, basically 2fef64eec23a broke what was
> working before.
> 
> Am happy with this patch, better move to hw_params instead of prepare.

And I'm not happy with it :-)

hdmi-codec defines that one of the callbacks can be optional. We know
that at .hw_params time we don't have IEC 958 status bits, so we will be
programming incorrect audioframe.

Should some bits of code be moved to .audio_enable isntead? If so, which
bits?

I agree that there is a regression and that this patch fixes it. I argue
that the fix is incorrect.

-- 
With best wishes
Dmitry

