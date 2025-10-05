Return-Path: <linux-arm-msm+bounces-75981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61410BB98C3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Oct 2025 17:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15CC11894C7A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Oct 2025 15:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A784018DB2A;
	Sun,  5 Oct 2025 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVPFp/xT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069BE40855
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Oct 2025 15:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759678169; cv=none; b=sBUbO6NzZOBQhp/CbP7HCcoywy/d3Weu70gwC2Kn5PAIqeAqqWj3qczJ3MrC5psqrbdvs20UK31Da3xdSK69fl4PTzwHrcLS91g2utdc0RTi9kkLl/eYfH1nc0YNwKztQ1qWSGf0jWP8EnQIYJDPipOHBeyIgL5yLGOaeq3QSl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759678169; c=relaxed/simple;
	bh=K7XJEGl5YMCaOki2JyDIkQC1IY8h9e8LJBKdKBeZJCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOXZUed0MQbTFNCBCKTZrbEwYHNdVar91yvH18/XaZoAV9Zdqq1+ch4p52nOp6IxcPZ1kaY1wm0WGHD1cOrwlywuGnj29PR0rVpuAb98HToxznq24j0g/wC570eotIaWwncTf2uGTbXxTdeGw5zVuN/7aYErG23CaCMgJgznnQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVPFp/xT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595FR2nR017070
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Oct 2025 15:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4dU4ZyLVXnWDFFy7T9bl0m/d
	RVY+plZydhTAkSsQP6E=; b=HVPFp/xTJvl2lVl1+xPWHZHpxZguc0U5/4a0rvRZ
	f51iO7yXY6b8SfNaqCpHLmItfDUzquyn5PdfMf36+/HK+UVbJIDidG/4QPBBRx2u
	7YAcxxIQb/W1cQ1dphnVwFRzT4ZJ0VIfmsVIQzDNzoWCDxfANjJICZCLCIHl57UE
	9GtjJv9YXO/IT5Y5VAkaGe9/C7FdWlSy6JNSjCbaIRWqokKoEw7UHvKTPAoitYuP
	KOQ7/qXUc6EbdU2MkhjQ4TZWrC1lx8CRXgXmKgsVE8y7xWxNM+W0/dnhZ1dlE3/x
	rvaCEWcmss/lpZ3Ul0tp7FcdQVXXyTL4MxHdseVJrTrbQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9dtby0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Oct 2025 15:29:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d91b91b6f8so48243421cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Oct 2025 08:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759678165; x=1760282965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dU4ZyLVXnWDFFy7T9bl0m/dRVY+plZydhTAkSsQP6E=;
        b=OWBoi+52/ieERJOJYW3582XvSt315EJogAensdPKsfPPMxh+Ov+4que/BOZhD12cdI
         14mn6yXdeaeWYDkZiD4HMJkNd0okXJHTqH2uLQ8McAichzXBa1wmkFr68Fs1Mdxty6ap
         AufHWwp3A1ah+dP4vqsOsd7Wa1bTCUGIUccO/b4qPsl0vZZgeBibUGxrRhy1hJs2g9KD
         QBfIVPx3t53YeI1v9ZJK8ekhw+1CqHpAq66hNn2nQzXiHMRCyYotnb5ZGPxFXhr9IfnG
         tVgbiDlvKLt1kQ9VwLmkDXHHYE7pqXVXt+I31iFNbwa0F/DjT071FF/vqN2vfh1RSG85
         Yozg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ9toRU4ovFys22TZfHr3TJ67G8S8aCTf2y4I4PRv0IkDOVDve7Ht9f9DC7MfJc0prfFN9rNribUDzEqnK@vger.kernel.org
X-Gm-Message-State: AOJu0YxX8sauRCabSYWygMY4ANOgzKv1px6LsvkCG/bjV8Di0YzxGV5h
	M5lDeS0mqJhH43g38DUJilnwX4CnZ/CVMc7TudaHpW5FvVyPAMSJf0iroDuJmKUO34nq6/E73Vk
	dNYPiJcKvpgeLwjkMw2Z+s54odGNfKXi+2/G21nHTjE0tZgEvPJYcHv0dKp0JMfqJeNfg
X-Gm-Gg: ASbGnctFw1D8OKnqTfmMa5tbHAWZ99An8lejPnX0GBYHxd6YsxEACSEOPbFu6MtE/He
	K3I4aQdhVvCmXlgXpn7SdIDGzOVxXFPZ2EULMK/3sV2zz95B96yniHLQNkEkbtvaNnNdyyYxJYV
	6C9mZhbx+K2dAYIPVQqJC1JgkDRQ0inetPIhysPvYsOzOrtCoPB8NqS7Md9M9wgb3Yp2XuSyty0
	n0AXATPoGU/cw78lsDQCE9v+4GA6YQmNtp3RFxKNCB+0Q5MeA+32XE3aLsNgoQiWTS1fgXnTkr2
	em9qXlO6zMOm0PCFObA3AbX9kzw6YygwSSoCvFUql6SGXrToodw/JXwSCCCUsVMzazvuGYWeM1w
	8EBglAdzH4Ho9ge1OIBluxygTX+INrJX+DjFWz5FXd1hqpYnWZvu/FleDDA==
X-Received: by 2002:a05:622a:13d3:b0:4db:29eb:901a with SMTP id d75a77b69052e-4e576a952eemr121578681cf.35.1759678165346;
        Sun, 05 Oct 2025 08:29:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPvwQxK935qLiGDwBlISIOFxTmb8S9j72sPD3M1rCcPF9tS1ifCbXNPjF7ssIS5UO8xmwwyA==
X-Received: by 2002:a05:622a:13d3:b0:4db:29eb:901a with SMTP id d75a77b69052e-4e576a952eemr121578471cf.35.1759678164809;
        Sun, 05 Oct 2025 08:29:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124040sm4026474e87.19.2025.10.05.08.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 08:29:22 -0700 (PDT)
Date: Sun, 5 Oct 2025 18:29:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
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
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Message-ID: <7fwfxr7zqsaudselhru3jtjc2f7pdjvlaj2b464vgdlqcrljek@asci6y3ghq63>
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
 <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
 <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
 <e69b23de-e9b6-4dfc-af01-7d2726dc23e4@oss.qualcomm.com>
 <bnrpfijh4rljdzroduqncfygysvgblljlhdpvq7ubajlbbwvwd@ohdmpjvpzj33>
 <f9c922f5-52af-45bb-a4ca-7ca80c0c3534@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9c922f5-52af-45bb-a4ca-7ca80c0c3534@kernel.org>
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e28ed6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=wW6VRMo5WZfp5zwlR54A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: LVZ5q9tWVNcpZh96u_OB136LxSP6WhSr
X-Proofpoint-ORIG-GUID: LVZ5q9tWVNcpZh96u_OB136LxSP6WhSr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX84aw3wrJeYOi
 4BjklDCY0pbu43NmpWa+RJ3GSVkocg1FTbhCgFEuQlBytoyM0BzMwzx2x8RDyp89DfmmnVCl2Ek
 MmI8RAZy/oiNK3jOq6BxotZ570xfbhyEweqvBaIYheNhuQMmX8NYGTjB7jiVuEigTVIBMSvFozA
 YGU6W1dwSc3FlQKs9fze7lDvLSUVjZl7BRpqzNIQTfQ8zeGIf78JbILvPhmj+iaeA2XmKvqpxfH
 dbliYbd4YJUEux/wrgUCj1s/6oz/FLqrXAVe4Bw9scrYbcbaKGcxQ2SlxPb8QfHam7HfmVZ0EWT
 g6xBMuYC9KHbZjnf87HhiTZdFCUIDmcAkFKY/kHakMUXZswnE/4T1JICJVr6CNu4nQHXU4ZUE1O
 3kvqwhZo1su0fay6LspRRnuoPFUy/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

On Sat, Oct 04, 2025 at 02:16:08PM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 10/3/25 6:02 PM, Dmitry Baryshkov wrote:
> > On Fri, Oct 03, 2025 at 05:35:16PM +0100, Srinivas Kandagatla wrote:
> >>
> >>
> >> On 9/26/25 4:09 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
> >>>>
> >>>>
> >>>> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
> >>>>> On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
> >>>>>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> >>>>>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> >>>>>> use msm_dp_audio_prepare instead. While userspace is still calling
> >>>>>> hw_params to do audio initialization, and we get the following errors:
> >>>>>>
> >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>>>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >>>>>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> >>>>>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> >>>>>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> >>>>>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
> >>>>>
> >>>>> And a call to hdmi_codec_prepare() comes only at this place.
> >>>>>
> >>>>> Srini, Mark, when selecting to only implement .prepare for codec ops I
> >>>>> was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
> >>>>> hook"), which documents that IEC958 status bit is set after
> >>>>> .hw_params(), so it's only visible during .prepare(). Is it okay to
> >>>>> implement both callbacks? Or should the audioreach DAI driver be fixed
> >>>>> somehow instead (I suppose it assumes that the port is available after
> >>>>> .hw_params(), not sure if that assumption is correct)?
> >>>>>
> >>>>>>
> >>>>>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> >>>>>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> >>>>>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> >>>>>> hdmi-codec driver can work with userspace alsa.
> >>>>>>
> >>>>>> Tested with Radxa Dragon Q6A.
> >>>>>>
> >>>>>> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
> >>>>>> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> >>>>>
> >>>>> The patch LGTM, but I would wait for response from audio maintainers.
> >>>>>
> >>>>
> >>>> The ordering matters in this case as we need clocks and audio
> >>>> configuration on DP codec side to be setup before we start configuring
> >>>> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
> >>>> even before it is ready.
> >>>>
> >>>> q6apm prepare loads the dsp pipeline and starts configuring the
> >>>> endpoints, if the DP endpoint is not ready dsp would throw an error.
> >>>>
> >>>> We might be able to pull in some dsp logs to confirm this, but I dont
> >>>> have a setup that I can reproduce this issue.
> >>>
> >>> What would be your recommendation to proceed? Is it okay for the DAI
> >>> driver to depend on the .hw_params enabling the clock? Also I see that
> >>> the error regarding the clocks comes from .prepare callback too. What is
> >>> the order of .prepare callbacks()? Can we influence it?
> >>
> >> prepare follows hw-params, and prepare can be called multiple times
> >>
> >> When you mean order of prepare callbacks, you mean w.r.t codec and dsp
> >> backend dia link drivers ?
> > 
> > Yes. Here we got a dependency from the cpu dai to be prepare()'d after
> > the DP driver performs some actions, which were a part of hw_params()
> > callback but were moved to be executed during prepare() callback.
> > 
> > This leads me to two sets of questions:
> > - In which order are those callbacks executed? Can we make the ASoC
> >   enforce some order of DAI's prepare() callbacks?
> > 
> > - More improtantly, isn't it a sympthom of DP driver (incorrectly)
> >   performing too much in the .hw_params() / .prepare() callback? Should
> >   we move some of the setup to the .audio_startup() instead? What is the
> >   expected split between those callbacks?
> 
> I have not looked at full dp sequences but, if prepare is the only place
> when it enables the required clocks for audio block, then it is a
> problem, we should do it early so that DSP can enable the required
> configuration in prepare.

As I wrote, previously it was done as a part of hw_params, which is
also not optimal as hdmi-codec clearly defines both callbacks as
optional, requiring only one of them. Do you know, what is actually
required on the DP side for the DSP to be able to preapre()?

> 
> Its also doable to move out the clock related settings from  prepare to
> startup which should work aswell.
> 

-- 
With best wishes
Dmitry

