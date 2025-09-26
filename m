Return-Path: <linux-arm-msm+bounces-75331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B10BA45C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 17:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB307165293
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 15:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D941F2BB5;
	Fri, 26 Sep 2025 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WIYhxgFV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0851F0E56
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 15:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758899370; cv=none; b=RdhYZXH4roOTontvgbffAFsOfa75Zu6sgpC7H7mdvTh3C6VrhO9gHIjqu89KO4XmnV+h8M4e8SLeY4jjjsMoWL2oHpV8l7wTdwRE4CuUtzDoPMBifUqGOl3MkeJoe2rqLnen4AQEmLoL2MFeY4k1IFYXX0efznKUxfLPWDAVDLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758899370; c=relaxed/simple;
	bh=2FVv1Hq8CsLTgxv3TXvMbj799Kn3CqKDdgv2Rf9D5Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1N8JCyTddF/98OPyP74FIFGVxFNflbR3VdN5DWRQqgLawusyGne/sPm2yJbtOLv3MeLCaDbQWaiyjKOGPfrB9fq9bogj+2hABbzZytSWlEjPSP5Tla/APliJEfAzNcs7AF5riPYee+aHsvOIDhdCZDJVPJgruX+4+ZFQag/G+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WIYhxgFV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEX49t006922
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 15:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xml9I4KJWJ+n/mLooOTRb4jr
	nF4kQuIKgjMLbzeFPFg=; b=WIYhxgFVDjPJC/GSKCkdWOuL54sXvXqRiPPI18rq
	X2kNGEj7aIp59ie7UxCbGCNu4uoFiSviFSSZhMP5D2vxEKkUPp/g2Rz8rq2dZ6YC
	Vez2sH4QsvLhmQoz1DD5c5hqqeEGWLZJUc44Q8eJg0WS6HaVUS1a6mU9kHu0GMg+
	Cm3i48ZM4+UcnAwEUMhqR3vr1l9J5WnirS7DndEIg2KTqYZCgI7OGadhvHmpg0yp
	vz5uUv0YUuEW3LditKCHg0dk8lKXuqW9dU69zTFgQFEj2a6s5cQBZEJwkuchnTbG
	/cq7HaKJ+uRxOxSGYX0KQQGOAwfqE2W9+e5KcRhlKjVsqw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qu9am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 15:09:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b78fb75a97so28683061cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 08:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758899359; x=1759504159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xml9I4KJWJ+n/mLooOTRb4jrnF4kQuIKgjMLbzeFPFg=;
        b=DgwKuYI4KNorkXDaiPJReJ1Ia3q3gQ24gTMmgtcVoiBz71UtGnOPmHK8NWL/rFwz3m
         1xYDySJ4NYusJJxnuaOJ+sqcXGtHT852+sQCpK3BaezRj8wKZwxSJNXRmlZXzFQ+GrJu
         cjGqwDn5fx1vwok52gbGwxsr1rnsk9+SfXQMDs0C3u0g1mS/K9XEfL4fA5Y9PNV1nq3F
         Ri4uk7HhL5aJ7OiqeDoijJWEjopx2YAy0dkMrWUVnyHoAGFbO5iaR4nvMFwx4x9IjGwi
         yQfJ/ht9Hicf8ghLjyxabMDgEwJVDhI5utXG5mf/kg4mmBc3OKPhYGivVh1AClzg6OeO
         dgwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5jGebBKnwCAn+p86kVlpuijdob7HlBoxnjpDF+u7M1tiBv+Y5l4oOVi+uNnrjzwWDDxMVQeIFCiUgbs3+@vger.kernel.org
X-Gm-Message-State: AOJu0YzrU3MREl25ombFiV+L4HgsobodxItS+RxBd94AJvx9W0MRhyN8
	4OM7klHV9ThZTiAE4egRQB0EFnwnzrrMNK24k/CdD6OwWgnvAL9kg9IN+ky/+I4wGKSZrX6e380
	v2eOUPgeUIDNb1k5WqRXzf3XOR2ZEkVwexLAltyHCP4N6XfuALqKvSOzYNLsTn0/TToo/
X-Gm-Gg: ASbGncs4k7uDiBKJddAWiOafwxkQJBZVg/Dmr2FJSNfuLtYSa7uHtK6W/L2OJuhPs0b
	eF76Wk4ntDPaUk6/krjc56QLfjKw8bMZ1YEAngIfd1zv4DppocXDZHjm9cIJuvN1SGTf9lJLEw8
	7oHzBfCBmOrUwHmNCqLzXExXab9czUWUj5FmN5BUXGGrQ5NjENx3LqgzvAMBvuyG7NtRFle6Eo+
	dt5XpV9++1HKpbTDScD5ay24z087eq7X1sq7NwqF4v2/SpsmvsSGI1Uo9XN1rPPbsxgduSPxlM8
	uQh/IC7sqdhcv7jwW+kbUUFHEzajoKCy3sSEr79+7sK1ylTYifREMDyOIJryrOmqhlfLPWUro6i
	2bLtPxKfpaYGqIE8qpT6SNLCJoQppJvDEMbmpiqyM0nywkBB50XpN
X-Received: by 2002:ac8:57c6:0:b0:4d8:f0e4:f92d with SMTP id d75a77b69052e-4da48a96e98mr117642891cf.34.1758899359133;
        Fri, 26 Sep 2025 08:09:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVNL1+kS1q2UptTniV/FQ9TTOA5N9MQS67FNYuK7ugL+YJ4ZWes7rk96zqrRI0rqdGs4Uteg==
X-Received: by 2002:ac8:57c6:0:b0:4d8:f0e4:f92d with SMTP id d75a77b69052e-4da48a96e98mr117641741cf.34.1758899358147;
        Fri, 26 Sep 2025 08:09:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316d14010sm1877513e87.124.2025.09.26.08.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 08:09:17 -0700 (PDT)
Date: Fri, 26 Sep 2025 18:09:15 +0300
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
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Message-ID: <rydatk4grelhg6w57wwkqafq5ghccnsuiwvfqvvdv7qum5dg5a@scoc76ni7hue>
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <46q2pje4hginnm2wld6ejyo36hfkmkzydaa4qggx47gd2p4q4z@q6vmomtgqihv>
 <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc1afa21-8a66-4e0c-8fae-d0b07142b11d@kernel.org>
X-Proofpoint-GUID: fYNrkF5ddrJTJlgZq06yG_ltOYVpqSen
X-Proofpoint-ORIG-GUID: fYNrkF5ddrJTJlgZq06yG_ltOYVpqSen
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d6aca1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Hfy8LQLwNBXcVyXodC8A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX96zJMZQ7Kvtf
 Q31/HSwEM4xMJn0pztabAl4dlU/depx8vGXGkx+B/vLzb9fM33hs3aAuUszeApdrtT2+6HzRfHN
 Ag5LCdBaYUzeq/9p7QmP41nGRdJM25fpttqfMR0POmwQRgikAD8R3I/6pfq5TeaSw25WeCAHOWU
 W82fJju0rax0bsSd/XNSIc5dmWww27I4oK8EJsi602NFNKyo99nf9YJicBVpzYtk0mB+RVURSJq
 Vk5gJDKlSst7+AbcH/YJ/NRDrvxm4DqHXPs7I9QXEy0R7DIM+7AwbcktogH+0tRx40OIszNKnWO
 cwsJlBk9K5MsUTaULaF5D8t/UWn6E9Afz4B9ZSJ5sQR1pkoTnF80Se49FdB+W4MqbAwm+dJOHui
 X2leqmf3KOs7fibVvK2Nuu/Y4is3dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_05,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Fri, Sep 26, 2025 at 11:30:26AM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 9/25/25 5:28 AM, Dmitry Baryshkov wrote:
> > On Thu, Sep 25, 2025 at 12:05:09PM +0800, Jianfeng Liu wrote:
> >> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> >> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> >> use msm_dp_audio_prepare instead. While userspace is still calling
> >> hw_params to do audio initialization, and we get the following errors:
> >>
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> >> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> >> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> >> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
> > 
> > And a call to hdmi_codec_prepare() comes only at this place.
> > 
> > Srini, Mark, when selecting to only implement .prepare for codec ops I
> > was following the commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare
> > hook"), which documents that IEC958 status bit is set after
> > .hw_params(), so it's only visible during .prepare(). Is it okay to
> > implement both callbacks? Or should the audioreach DAI driver be fixed
> > somehow instead (I suppose it assumes that the port is available after
> > .hw_params(), not sure if that assumption is correct)?
> > 
> >>
> >> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> >> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> >> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> >> hdmi-codec driver can work with userspace alsa.
> >>
> >> Tested with Radxa Dragon Q6A.
> >>
> >> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
> >> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> > 
> > The patch LGTM, but I would wait for response from audio maintainers.
> > 
> 
> The ordering matters in this case as we need clocks and audio
> configuration on DP codec side to be setup before we start configuring
> the dsp pipeline. Looks like that DSP is trying to setup DP endpoint
> even before it is ready.
> 
> q6apm prepare loads the dsp pipeline and starts configuring the
> endpoints, if the DP endpoint is not ready dsp would throw an error.
> 
> We might be able to pull in some dsp logs to confirm this, but I dont
> have a setup that I can reproduce this issue.

What would be your recommendation to proceed? Is it okay for the DAI
driver to depend on the .hw_params enabling the clock? Also I see that
the error regarding the clocks comes from .prepare callback too. What is
the order of .prepare callbacks()? Can we influence it?

> 
> 
> --srini
> >> ---
> >>
> >> Changes in v2:
> >> - Link to v1: https://lore.kernel.org/linux-arm-msm/20250924085804.34183-1-liujianfeng1994@gmail.com/
> >> - Use more detailed trace log in commit message.
> >> - Drop the empty line between Fixex and SoB.
> >>
> >>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> >> index 7d78b02c1446..6ca1c7ad0632 100644
> >> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> >> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> >> @@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
> >>  
> >>  static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
> >>  	.audio_startup = drm_connector_hdmi_audio_startup,
> >> +	.hw_params = drm_connector_hdmi_audio_prepare,
> >>  	.prepare = drm_connector_hdmi_audio_prepare,
> >>  	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
> >>  	.mute_stream = drm_connector_hdmi_audio_mute_stream,
> >> -- 
> >> 2.43.0
> >>
> > 
> 

-- 
With best wishes
Dmitry

