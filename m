Return-Path: <linux-arm-msm+bounces-60232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D460AACDEBB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 15:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A0281671F2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 13:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823CC28FA80;
	Wed,  4 Jun 2025 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LY0q+1IQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93F128F950
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749042723; cv=none; b=TroMzMBwgamKdBG3ICMnAD2lSJ7+8x8IXEuQp0Ji9QLoN/q9t+CKh7tDwrcDrV9nfbiVnqe81vXgYWskbfmR12H2P12Ps02K6z0scen02APCCxqdNB9IHLeway4imHS1obKf8wdxST1YdKqU5BbMX65kIqtnGTT1F/+wvkeBklg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749042723; c=relaxed/simple;
	bh=8OC04Uig/NIlrSakrm1nnPTay9KqXWpG36eTaAqGLm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5k7qZE1YcqbgkU2PqidK9v9aKhCXwJC4rrb+YtxOPaKoOPPt4Vu6HWPlQQeQa9Ax+ILDO5GVnt461koWLtM3FxlQckN6ZpKCUanzvzQJEX7TtBUM/iYekCai4k+ydkc7R4NjQqu0t407pzuhYfXY5Jh9d4kbkqjEtqLfxX/cA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LY0q+1IQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5548KEuW006645
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 13:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XQvsxDPGz+N4nZmV7ksKBXsD
	n1FjHMoRZnCtDTtfld8=; b=LY0q+1IQAxk4WK8T0Neho23c3g1xaCJAGYo2Ma0D
	ZuBYCbNpeTYdqVof2VF1lmWc+EpctiqGqg2g/J6udDys6cdvvuVXSscc3aM6HOJn
	0gwlcwzKjf6dVeDq45YHDv9l8WYWlYc9Mcz8MspkCkDSy7OP6nPSSn+ZM0NZx0DJ
	rFgiOteNADm/K6KoQSItmwi0SDrLwPlEMeMQcchC8uknQvUE4bzTx0KmeJfQAfAK
	JH09+Hjc+dz+Gq+9HgkEbp04gGFxPtCYjAkOdzzy/ghOz8ctWuZGZvvnxLC25Au7
	Zd0kV2tbCEZRCx8dPKR5SCqJNpwlLt/wvj1bbL0h0ojK3g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8sx4ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 13:12:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a585dc5f6aso80496561cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 06:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749042719; x=1749647519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQvsxDPGz+N4nZmV7ksKBXsDn1FjHMoRZnCtDTtfld8=;
        b=wvs0WchETgEe0KS1WYhwkMQ1pFrwaSAx4fuA+RDeGjnsKD/a7hcH39x2VE3tNMg8/x
         QIGlILe5poqvjsfE9tL/ecP8VJ3I62WRKWQDXDWnugin626g4au/L2NdZuJRd2HE+BfN
         4ZpLc4qBMhlhFtlsW5req6XMYrd6aqsgwGt70+wJuR+vOVMeXL9zWEv5MgVO8KcD4zcF
         XtftiEcY8oGkpkpsPLMhSsjtdk8CLFKEWEwe2P811oGl+NEbCbwlFpZuuKG5VPcx3OEF
         DlGYMPnaNK0nOgR9JstLk2zlmDtE8xAipY1M2yUOcz6/QAZ9juzKr5l0VXKaQXUSuDJn
         WNWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCHYs40OLIQbas+arAsZyGHFBoojVxhb9fD+XUAMnZoN08niaaflxZMZK12QgczACvdTyQvHl47K3uoBhC@vger.kernel.org
X-Gm-Message-State: AOJu0YxJyTUc6yUWQy0/SKOmlOyms36lMNrEgQ+L6fvjcnufyyshh0ib
	6w5EAwkxP4UpY6V3O4AybzMpLC3b8b2BDG05GHFGiy8M0dEL21HaIXAB/cUoWXpGzzj7+kn6CpR
	MYlmDtuAeT9bYYPshyleDP/xch1NiTD6rytt4fwDbutS6XCS+GZU1R3AdP3S2UBAVpB131Cz7FR
	IGT5w=
X-Gm-Gg: ASbGncv9EDrh0eCXGOzx/xdTQPXpbWYy86E+BXr9gI3xRXUB25CGOjj5ILx1KUImgzi
	ZPCq67badBLzOE0xoxJ8Z1bWXkEaeIv2wbK/4/7tb8mrchbXw1MnEhY0HbKufc6jKMs0OZ15o4Z
	jGVXICyXu3XPPMgTLKmpsQGZGLUgxtVsz7vinPZ1LK3Dzo0DDuCycwIFw+hftY6Je8suGecFtLM
	qsinMZNJ7LxEYCzbSC3aJG8aZWSAWwwaEWFbq9h9jREqTrlyqs0PTeqcaDgXhTZXTDmwH2DuaCh
	xxIaNxw8P8XeFWlB9qb/cE6aLwvFdwFXI+sjtbnSa3rVMQqr7mQ8Tiw5jatvHNjHpDu9ee021BA
	=
X-Received: by 2002:a05:620a:471e:b0:7cc:ffaf:60a5 with SMTP id af79cd13be357-7d21986ac45mr419131785a.3.1749042708159;
        Wed, 04 Jun 2025 06:11:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTQa9wd7fIpEVhtGaVsz15AkiRD0CT3Fr8ffve1pc6iUT2fQdSSm5Tp2fkdgwlgyGIAfpLLw==
X-Received: by 2002:a05:620a:3710:b0:7cd:31ca:d81 with SMTP id af79cd13be357-7d2198e92cdmr491537685a.27.1749042697421;
        Wed, 04 Jun 2025 06:11:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bd2a5dsm21439851fa.103.2025.06.04.06.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 06:11:36 -0700 (PDT)
Date: Wed, 4 Jun 2025 16:11:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Hermes Wu <Hermes.wu@ite.com.tw>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Message-ID: <ifj3ipdlxxv6dnste76q2wwmy4dcvshnfkqekdndg674rgsrdw@vgj2aahqqsdx>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
 <4E62D52FC6135E5B+a6b1634e-5c66-4db5-bb1e-bf64e2e8d8a2@radxa.com>
 <os3cmusf2nrdf3zq45s52a72x4osnd4thlgcgykcalyiuitcha@tnb576gj4m27>
 <712A2410D11E9A7E+27a43d64-1116-41ba-addc-83aa5f761a28@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <712A2410D11E9A7E+27a43d64-1116-41ba-addc-83aa5f761a28@radxa.com>
X-Proofpoint-ORIG-GUID: YyJiGO_Y96KI52NltBB-Iik_k8MosgGz
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=68404620 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=pUtLPF_adMnqGKIR7MYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YyJiGO_Y96KI52NltBB-Iik_k8MosgGz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwMCBTYWx0ZWRfXy0XgpeH8tEgW
 uzbGxVlknT9eCeIA3ywwXyaSHgWTldlal8l1Q3nvxb6uven83OKhFdUKSJCE58l+UhYKAKixnay
 ZU0IVd9zLgE9DwNuIcdUfr6mLHSoEb1pF9oJskiHbGperg6uDDrh7fDq2HtQBmfbTvJYDTX8Q1P
 Dz2TTYnOfRcSA4QuntGbvPZgQqdsm9x2UaQStS834/C1x8MdXLP8kL0gsVzeZauh0HGct9mFIB+
 kKYr9BOh8Ocke6xR7pF8x5ywboHL6Utrxfb00zV8sRWtSibhF+Q5QTcMuS82jj3PLeFUMQPLASB
 L+NGaIoqjLnDTvf2sddKt5CF0Q69a78l3WnVENy/Ty3vOPYFtCjmgxtcBXDWAlDgAc8jBKgMNiJ
 NuLnCUr2DWBBp54Ff0LTYi2L+2SRRPiYC9WxaElwL4U21y+9MUFXdsTcZbw7coJun220JbxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040100

On Tue, Jun 03, 2025 at 10:16:14PM +0800, Xilin Wu wrote:
> On 2025/6/3 22:06:36, Dmitry Baryshkov wrote:
> > On Thu, May 29, 2025 at 10:40:12AM +0800, Xilin Wu wrote:
> > > On 2025/4/24 01:52:45, Dmitry Baryshkov wrote:
> > > > From: Dmitry Baryshkov <lumag@kernel.org>
> > > > 
> > > > The MSM DisplayPort driver implements several HDMI codec functions
> > > > in the driver, e.g. it manually manages HDMI codec device registration,
> > > > returning ELD and plugged_cb support. In order to reduce code
> > > > duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> > > > integration.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > > A lot of DisplayPort bridges use HDMI Codec in order to provide audio
> > > > support. Present DRM HDMI Audio support has been written with the HDMI
> > > > and in particular DRM HDMI Connector framework support, however those
> > > > audio helpers can be easily reused for DisplayPort drivers too.
> > > > 
> > > > Patches by Hermes Wu that targeted implementing HDMI Audio support in
> > > > the iTE IT6506 driver pointed out the necessity of allowing one to use
> > > > generic audio helpers for DisplayPort drivers, as otherwise each driver
> > > > has to manually (and correctly) implement the get_eld() and plugged_cb
> > > > support.
> > > > 
> > > > Implement necessary integration in drm_bridge_connector and provide an
> > > > example implementation in the msm/dp driver.
> > > > ---
> > > > Changes in v7:
> > > > - Dropped applied patches
> > > > - Link to v6: https://lore.kernel.org/r/20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com
> > > > 
> > > > Changes in v6:
> > > > - Added DRM_BRIDGE_OP_DP_AUDIO and separate set of DisplayPort audio
> > > >     callbacks to the drm_bridge interface (Maxime)
> > > > - Link to v5: https://lore.kernel.org/r/20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org
> > > > 
> > > > Changes in v5:
> > > > - Rebased on top of linux-next, also handling HDMI audio piece of the
> > > >     MSM HDMI driver.
> > > > - Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org
> > > > 
> > > > Changes in v4:
> > > > - Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
> > > >     HDMI driver.
> > > > - Drop outdated comment regarding subconnector from the commit message.
> > > > - Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org
> > > > 
> > > > Changes in v3:
> > > > - Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
> > > >     (Laurent, Maxime)
> > > > - Dropped the subconnector patch (again)
> > > > - Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org
> > > > 
> > > > Changes in v2:
> > > > - Added drm_connector_attach_dp_subconnector_property() patches
> > > > - Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org
> > > > ---
> > > >    drivers/gpu/drm/msm/Kconfig         |   1 +
> > > >    drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
> > > >    drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
> > > >    drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
> > > >    drivers/gpu/drm/msm/dp/dp_display.h |   6 --
> > > >    drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
> > > >    6 files changed, 31 insertions(+), 170 deletions(-)
> > > > 
> > > 
> > > This change breaks DP audio on the qcs6490 platform, tested on kernel
> > > next-20250528.
> > 
> > I can not confirm this issue here (though I tested it on a different
> > hardware). Do you have any patches on top of linux-next?
> > 
> 
> I have this patch series applied, but I don't think it could be relevant:
> 
> [PATCH v4 0/8] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
> https://lore.kernel.org/all/20250527111227.2318021-1-quic_pkumpatl@quicinc.com/
> 
> > > 
> > > [    0.368035] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x70020000
> > > [    0.369359] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> > > dai_count 0
> > > [    0.369362] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> > > Missing hw_params
> > > [    0.369364] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> > > Invalid parameters
> > > [    0.369366] hdmi-audio-codec hdmi-audio-codec.0.auto: probe with driver
> > > hdmi-audio-codec failed with error -22
> > > [    0.370536] [drm] Initialized msm 1.12.0 for ae01000.display-controller
> > > on minor 0
> > > 
> > > Manually reverting this change solves the problem.
> > 
> > It is suspicious, since dai_count can not be 0. We set
> > hdmi_audio_max_i2s_playback_channels to 8, which in turn should set the
> > hdmi_codec_pdata.i2s to 1.
> > 
> 
> It suddenly comes to my mind that I'm using a kernel with everything
> compiled as builtin. Could that be a possible issue?

What kernel args are you using? Do you have any kernel debug options
enabled in the .config? I've tested the kernel on RB3 Gen2 and I still
can not confirm the issue (I'm also using an all-in kernel)

I've verified that on a running system I'm getting three HDMI audio
codecs (one from LT9611UXC and two from DP controllers). Each of them
binds immediately to the driver with no issues observed.

-- 
With best wishes
Dmitry

