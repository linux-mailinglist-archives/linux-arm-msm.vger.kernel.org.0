Return-Path: <linux-arm-msm+bounces-78166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5EBBF678D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3DB9400D7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5BE2F12CE;
	Tue, 21 Oct 2025 12:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgMYy2vd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2494427A465
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 12:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761050073; cv=none; b=RRsSt9flFHGh2eI92LT2EW8k2mZkjnewj3Hu4RoWZJZkjvDNI3YJJ9t62Rhok+yfDrTeGgPjyx+t7N0nv+Ll1G1v0jEj0f8s8nOwG923VkC2S1+sVjtLzMScI/j9xzqR0wih9M4ymPK2HSF8/W2hMJ2RwwTcHyoyXdcSuyBu1gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761050073; c=relaxed/simple;
	bh=aOI4bJelAXaWfewQrn4VyRWGdHmmw9QRKlP8hfwWG9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPjDlhkVhABXkWsEm35LNqVsmdGrD4kqr3R3v1bz1LykegqJfNCGOHBXmLmf7CJoJ9gT2Z6EicihMf0VZP79dby5Nz3ao6bs3xworHRDw/u8GLIu1fphkVL/brLemfl9ja7yEC6gKCO44nPQcVUcMkszGwhdnVLysKu2GKk7gY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgMYy2vd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8Ix4P014165
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 12:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JiM0XYOrFQ512EKDfSy47FN1
	IW3pchq+uQUmcduTE64=; b=mgMYy2vdsL+0tuZCKHpBveYaNf6XwSQNqrdr5zu+
	cEfXSAtFbPcBPCeBxSo9ckTGE2RKTZrSjI2Uxw952PE8+A1Mm1NXEzWTKVcUUDHi
	GfeTdE/RuVddRqiU8vUn9ZZeHsIRM/LQOoTzW4nksO6M6ETEy8i8b8E0T8xrXy1b
	62p0WYek8QgvkGx0G2mswg07IsD46Sy0TYAte6p4eXxZNvWzdtYfmUSJ+Z+cvR18
	RlrX8mJqgByxiojUwl7LIokO/auHrG9q3C7nuieqinRpD2y4b1wI4o6zaFKYas/c
	q2eFP+O3F5prt9hzRbqhYux47Kciyu7hcEkcHicvZZTo1A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wtgetwwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 12:34:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8741223accfso227768476d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 05:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761050070; x=1761654870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiM0XYOrFQ512EKDfSy47FN1IW3pchq+uQUmcduTE64=;
        b=Ec1mi3MesJZZ9qyzhUgpG/sru8ezuXcy9gQ5RJUV5LDgX5oSUZNqdT6YPyAwtBPSYx
         1LV3Z6MGJNWjhoy7HNlWLKL1bc+0UX/ZKf8UvNSg0+yP+QoS5IENeZYhS4dds89evHLB
         jun7ybYPS2/mUyz+OKk7bMnWvBYDk8MVMCo0kMSeyJqbBvPs0qAkdss1wght1b+2xnwr
         j/OFuq0xxW+ex26oPLnprWsIHs+gfrCsQ2sylWG/at6vUkyqyWkfcHvaUTI8PO891l9y
         0Q/0e1a5MkkVugkFkQ6hooYpq6y2r4AAax5RQMHMKQXcxq/5x3EAA2EIX9OBiFhnW9Z6
         ixug==
X-Forwarded-Encrypted: i=1; AJvYcCWN34LM13B/kPgzhbZLfx/MOu8m2A46aa2Bkdv5gUamqhBS3HnPAuxCr9ftHBhXpDsGoIoz5aCkUy09/2ZK@vger.kernel.org
X-Gm-Message-State: AOJu0Yws2OBaswMiZnvSdg05WBR+9bL8pIHyWnFFIWHBB0xMVoolk0Bv
	Qj7UtuT25c6JQ4CYCutSrwy+Mwrrs5tSIkbtVW+FnLcJ/d0e4LBSsiDQkSnhHLlrMyhBk+BdTha
	Gu1OSc2p3gwP0ou/B19TAHwL6qSRlpKL2gTozVr1SseSx2HUf0sboALrkBMQfvJA6/JQ4
X-Gm-Gg: ASbGncvQSiUz3MXYwABpH+IYDi3hbRTnMeuJny4WP5DvrJWKnTAjAlvai/jeJSwOPCH
	2jjLB2q6YPc4yNzlmQkoYIdfbd3381xpRemSO1L+h6jLiqYKBDZmvNmfPDwDcApjQOmxqXdNRK5
	CAZRebGfCGQ6gp5RzSoHyX546oP+Q2vTR1cME74C7bw99HyEl3mj/1L51brqkvBP4TSi0hvL3Kg
	mNlhVgU343p9zKTXGUQqu8UYDQbmWgh6n4Z9C99VVYgjMG8WpGOCoOiobOTfltDcu//oxwaASi4
	yCVKuRHW2L3sBFnSH6fyZu8oouvLVTIY3MpIIFJtmbLdHhQNVsA5hs1uXVbvNZek5jzhbbuQq/5
	z2WnyBKHHVLRiXG2jYZkONKvIa6uT8BA3Z9B58bnw3OhTh08RZSfha4YPwNHKhzQfZ1Kumq3yB2
	J8AqCmcQaBeso=
X-Received: by 2002:a05:622a:18a1:b0:4e8:b18b:6b0f with SMTP id d75a77b69052e-4e8b18b93a3mr135499541cf.69.1761050069847;
        Tue, 21 Oct 2025 05:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF4sae4/F0/n5KKexSlPmPvtAvbiOc081SrO+C+Cpbx6Ztk7aNXlSzq8qzHjHjdWz8bhc0gA==
X-Received: by 2002:a05:622a:18a1:b0:4e8:b18b:6b0f with SMTP id d75a77b69052e-4e8b18b93a3mr135498931cf.69.1761050069292;
        Tue, 21 Oct 2025 05:34:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def268casm3564753e87.104.2025.10.21.05.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 05:34:28 -0700 (PDT)
Date: Tue, 21 Oct 2025 15:34:26 +0300
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
Message-ID: <wrttwblmgfrey23n2cik4to47ls3me5wq4uvxbj4cwocwgp4k5@aageyrmajo7k>
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <658446d1-5d3b-4924-a446-f26a1a8b9be6@kernel.org>
 <942989d4-7a2a-4087-b761-ac8d8bea4d03@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <942989d4-7a2a-4087-b761-ac8d8bea4d03@kernel.org>
X-Proofpoint-ORIG-GUID: 59ni1MbR0f1PN-aJKiQJHLXBthiMRgzM
X-Authority-Analysis: v=2.4 cv=JeaxbEKV c=1 sm=1 tr=0 ts=68f77dd6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=SZM-PPiLjDIjgASHbv4A:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 59ni1MbR0f1PN-aJKiQJHLXBthiMRgzM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE1NCBTYWx0ZWRfX4u4s5SrA5Ndu
 sMCclu1HVhVXp7vZhtdlifaHkIdXQCMLblwPWYPDpaNrKUPM62esIlXYoy3r1kfASV3mbNGdycT
 F4/Bc1hzIYGyv3gsULcONay+IBAMaLN7fa4xoPwmRSZYpxKqM406htx7Rn4OR4KjDPohjA1yMiY
 uPj6JXP9onLF37V+uNRg+fA4ZCGncDf/ZAbxPvbBaERlpBS0nxMsY9MeI/L5wEqPhaxhRurTBNA
 6tZ53Ia9S6gE1PVyKRIt4AsxSU7E3hR1uEY1boos/E+8o2PG8+QG40JYLGFssKaP7vHoYFBDqTU
 pciDXo1A8gic6iKfcROvYjGEPKA7BVJ3mceBAK062t96PaJAllu7Q2bU8CNGSSLEyTK0wC4o/7F
 L+J/eOYVC3XBSDKCeYdEwMnOGOYbHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200154

On Tue, Oct 21, 2025 at 01:12:14PM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2025 13:04, Krzysztof Kozlowski wrote:
> > On 25/09/2025 06:05, Jianfeng Liu wrote:
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
> >>
> >> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> >> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> >> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> >> hdmi-codec driver can work with userspace alsa.
> >>
> >> Tested with Radxa Dragon Q6A.
> >>
> > 
> > 
> > Missing Cc stable.
> > 
> >> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
> >> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> >> ---
> > 
> > I confirm this fixes the audio over DP/HDMI on X1E laptops. Please apply
> > this for fixes.
> 
> Forgot:
> 
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I'm still waiting for the response from Srini (since Oct 3rd). If you
want it to be applied quicklier, let's resolve the question if it is a
correct fix or not.

-- 
With best wishes
Dmitry

