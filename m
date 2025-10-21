Return-Path: <linux-arm-msm+bounces-78169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62145BF6856
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 71C9E504263
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E32A32E74D;
	Tue, 21 Oct 2025 12:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjBel/NZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B622F999F
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 12:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761050621; cv=none; b=k/+oClpt17j0uHpe2WHEn9PoMTFCxpUtgDs18DrE0WPYm6hnch53upmrVeyeMFMd0i5C8QWHkXFb9C7vYubai985G+TVQznEtVXl/8FMIJ3FngCis+W54hR3U66J6h0y9S9TKesZQ1GEEOzdGV6dBZSsrlCjvB2cbP51zDQaVdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761050621; c=relaxed/simple;
	bh=AT4+gl0rs9961D+MpeA0OhT2iq24TBYLv/eyu4a5C9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbKjLBL63BuSm5odiYQimBACfGfK/NJ6dJ02eNkI4aFpKrrTwdHHhTzBHAl+WsTTQ7QU6DcpYv8I2YI3XppfHz2Gy/61MWCVvgSTOIh1FS+b0DAXahZQ0l0bKuXZAO3aoF7/+JAdKWXTz/hKF+FD2qO+rv9krjB2jDWk61oSoX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjBel/NZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8JJbG010810
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 12:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YrwiyRfZATb5k2/pvhzdB6tg
	/Ojvbxr5etjGnjqDZ7s=; b=VjBel/NZj/zkmkOHwg4E/r7pzy1GazyeBDSQayN1
	0ZcJhDbtMs1xD+GNdhp9Qqfr4IUMuMYuY1WZr9992UbH7fHDCcDseMnm/d+pJvzS
	VGRsIZi62G+QCopfkjzao2nK0j82YHubb0eRhf8VCAACsR/VFwvLTXdZnyoYXawp
	s0kdAwoHFohAx5g9wSWQc6gxOvauaGbxr5NSKNISrb927F3qpa8T+/OCagMx4kQP
	203SXo9m8AWCJQYKAFhJ76G4Z5n+6iYBeoHR69EzOkHTPlIV4yjvnEeUV4ozJVAh
	+d1voX+AREa+3V3c0jUSa6pTGY4qtk95gY/t9i3FnwY51w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wtgetxk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 12:43:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c1cc5a75dso298739986d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 05:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761050617; x=1761655417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrwiyRfZATb5k2/pvhzdB6tg/Ojvbxr5etjGnjqDZ7s=;
        b=gBk0+LvpsnTkwpLLLTmdTN4mDob7dKJruhU+9y7jCUfOqK1Io3IadtSABKAxNlSUpy
         2QdsxlDVi26+/8BijduheAE4Mf4PZcy4ez4jSGmn0PHVASsAyFu2IM5CiB3abNlIeo1e
         JYv7T+rsoU/dvW6xttj3NoRgJou1nf22XE8Wa98Vi0OqS6XkhsM9dbgEiWD49onqMuJK
         MkpjHyWaDcGRpzfYWL4q4QeyJv20igWNMKgU8HK6hNp2jTf33kiMIVgBJbxplbQVKJve
         VOE+pjr0+eIb6DJwb4BIdwOFmypoy22yeJqTC2UYBv79vxwSuZz7d5VbakS5KSdZu7gS
         BGRg==
X-Forwarded-Encrypted: i=1; AJvYcCUuaPaeuCh/chOxmWXb/oIcnFwQ1TzFsfQlVX/PtHIlLDX+zasukUceShebTQUaWGn5LlVwpe4KglvtA38K@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2nsiwd/pk+ss6MggG08OcIDEEfLQ15YsyyeFmzUH/KHwgmNRY
	B+pJozB9y6pZgWZSpKBpkfKd6Iz9VSXsZHnWlF0zDvqjAzY4QoPRyEx27mzHXi0APPFBitZjnOq
	0t/0fUOVL4QTnExm2fdSRBg6SBXIYDvnChEnaWcVud5q9l/fgUfqv2T8Py5eRNxDlMS46
X-Gm-Gg: ASbGncv7WfknctNW3Zs4ciHZ5V3wynrZob5Uuc0yHQDxvyX/w3K/yGQezdqDutQU2Qv
	U+xqEjDow3BLUbNhfzGwwHyYFiF/AeDj2zNYnkwhbXm6B1xBrr5CSHmOPXkgSUCMfbRZaV7F8FI
	LhCZSqruJJCf6twNQksPeqLan1qAN1naOIQty1wdxOS55d6Z1Wb3APfMjI5IgbSwDpikq52tGFk
	vq3D5md4D7UrCTk5BtuGx2yQANf6bdTK95g89wLFSMrfAbQnQ75ecULZMjVmU5yg69RpeqBr46L
	7EZbuQeU+elnb46MOSmj5no7/MTe4mNvs/xIk8ZO2PJoroyfe6eDhaJyXZSb9hJxvOICa5E10od
	YRTBgIdTpKG4CmShiEHVio64UPH6rd6zEB3USL77dpmiK8EJbw0etwdvdOfS2Se7i28A7n6lEVU
	hd+fIFXZxozXQ=
X-Received: by 2002:ac8:7f54:0:b0:4e7:2626:3de1 with SMTP id d75a77b69052e-4e89d1d77d6mr181931631cf.3.1761050617276;
        Tue, 21 Oct 2025 05:43:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUPVtv6fqRAU0s5kXiWZo8BfsrvJSnK9mxysoo9yDRgK/Rw7l9S2aSKn0z4+RNQtpmmJBkRQ==
X-Received: by 2002:ac8:7f54:0:b0:4e7:2626:3de1 with SMTP id d75a77b69052e-4e89d1d77d6mr181931391cf.3.1761050616813;
        Tue, 21 Oct 2025 05:43:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a95789f1sm28675421fa.41.2025.10.21.05.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 05:43:36 -0700 (PDT)
Date: Tue, 21 Oct 2025 15:43:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, linux-arm-msm@vger.kernel.org,
        Xilin Wu <sophon@radxa.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Message-ID: <nvyjnmd242h3muahzkyii7o7yssrb3h4gbqdvpjytu57nfu46h@s2fdz3tnq3f7>
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <658446d1-5d3b-4924-a446-f26a1a8b9be6@kernel.org>
 <942989d4-7a2a-4087-b761-ac8d8bea4d03@kernel.org>
 <wrttwblmgfrey23n2cik4to47ls3me5wq4uvxbj4cwocwgp4k5@aageyrmajo7k>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wrttwblmgfrey23n2cik4to47ls3me5wq4uvxbj4cwocwgp4k5@aageyrmajo7k>
X-Proofpoint-ORIG-GUID: Q_B8zmj0VuaUe1ecQ4xudA0-IOg8ssXJ
X-Authority-Analysis: v=2.4 cv=JeaxbEKV c=1 sm=1 tr=0 ts=68f77ffa cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=hZVqz41iNrEH_Q0D6mkA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Q_B8zmj0VuaUe1ecQ4xudA0-IOg8ssXJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE1NCBTYWx0ZWRfXw/gEai/xqnpP
 3lUwB9fn0Ly00KW4RQn6abkr5WAXi0NlzHo9zrBfTusIcFX50oj7rQkNl8oH8cWB36t118xG7Ik
 HlpIXnoP2NAbJuwouPjCCBHGisM4AelscGZdVY4APGdmcV6nEDjmNUN/CzbNBpcGw46BlBYdFPC
 ElZddyG6k/YsraEpkgOB5TkXbCmGHVm46BvCf7y6HNNuDt7tIqH0rHNxRNCtoGsRhh1gr8VtMtJ
 XcwB7KRCHJUevpq2l1uMjha9WYq/vgVVcLAWRK+hz0V6xrzftbB7fNA5JPdhgcxPgeaEXqE9lAw
 FseYaGmcjfU/Yu+HX4Tn3XUdaZpxae2XOyClsptpWC8TuyqFf7Fm8NoYNo2Ae/exRcB5gwzABxC
 RltY/eQUq80flhYLeozTItgXzeM9ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200154

On Tue, Oct 21, 2025 at 03:34:26PM +0300, Dmitry Baryshkov wrote:
> On Tue, Oct 21, 2025 at 01:12:14PM +0200, Krzysztof Kozlowski wrote:
> > On 21/10/2025 13:04, Krzysztof Kozlowski wrote:
> > > On 25/09/2025 06:05, Jianfeng Liu wrote:
> > >> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> > >> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> > >> use msm_dp_audio_prepare instead. While userspace is still calling
> > >> hw_params to do audio initialization, and we get the following errors:
> > >>
> > >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> > >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> > >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> > >> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> > >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
> > >> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> > >> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> > >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> > >> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> > >> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback
> > >>
> > >> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> > >> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> > >> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> > >> hdmi-codec driver can work with userspace alsa.
> > >>
> > >> Tested with Radxa Dragon Q6A.
> > >>
> > > 
> > > 
> > > Missing Cc stable.
> > > 
> > >> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
> > >> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> > >> ---
> > > 
> > > I confirm this fixes the audio over DP/HDMI on X1E laptops. Please apply
> > > this for fixes.
> > 
> > Forgot:
> > 
> > Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I'm still waiting for the response from Srini (since Oct 3rd). If you
> want it to be applied quicklier, let's resolve the question if it is a
> correct fix or not.

In other words: from my opinion, the correct fix should be to make sure
that DP part is ready after .audio_enable, rather than depending on
.hw_params vs .prepare behaviour. Otherwise after some changes in ASoC
or qcom soundcards we might end up in a situation when DSP's .hw_prepare
is called before DP's .hw_prepare, ending up with the same issue.

-- 
With best wishes
Dmitry

