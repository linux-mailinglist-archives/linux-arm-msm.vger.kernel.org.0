Return-Path: <linux-arm-msm+bounces-74669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDF0B9BD48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 22:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B709D1B27C61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 20:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EF6327A1A;
	Wed, 24 Sep 2025 20:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8/loSfS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71631327A14
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 20:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758745058; cv=none; b=luEJFOgKP83uEi0Bc8YaTN147IzseVJDu5SX1goXzqmPM+C1UVOi7nmDsTHvmZC3wJza6B+W99xGF4fxipWxOxcnl4GZTp6Ie24CSuoHILp0YGAVMOR0RC9KTmHvXddEfKQv172ICbqqB0HArl1Mjoye9HP+4iaX3nNRECI2SyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758745058; c=relaxed/simple;
	bh=o6NvGxbCbScKyYSzkKl7NvYCUEvgKeIRjGzob+GbanQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rB39HyRCnjj3GA1RoGwTnVWl2kkC5V217jQ/H2eGaYAbx1X0n91R1g//laQ6s5B6nqeuiYm6TNC/6Qt0zuYmbsxFmRntbwdzRwqflbKwjPAWc4VD3gh40bSPxBx9YZ4d4OipbOE618UP6jwxxdbjPkf5N9sreB+reAsX37/L3zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8/loSfS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCAs52002792
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 20:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rNscl5fXPcxVylZp5rvGQzAn
	4wkFIbURvBdkFv3nYKA=; b=H8/loSfSik35YsP20ovZE7rZYpmzfKcrfLqog1aw
	kXmw6xU3Xoa9owShkrAz+Xqv5GsUl9OZLMAN8sp83mUnjtDO6d/S+saLAphokrWG
	N8+fmmznGR8geaEXUtvJ+xhwR0CxkvB2FsoZXlH4grpmtB35mACqxuzNuXEAX4o9
	Pk7wuoprtLKWkU+eoBfdL/eQcITVXB/3DH+0hzLHHFxQqVW5oV938WXiF1sOF8dq
	tDFlUk8KAIqaHRuQUkUXjGoFJaFKpH+g938ZuMTUSxtqcqQ0SXEbdQm/JOfaP8+b
	ypFK+x7tpMkGd2Y7+MdoSHVErnqCLzwevtfLUY301Qz6BQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf07md-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 20:17:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d8b8c3591fso6211141cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 13:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758745054; x=1759349854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNscl5fXPcxVylZp5rvGQzAn4wkFIbURvBdkFv3nYKA=;
        b=amLdeIEm+qVeK/IQYjJcbqN208USdNtR51E4DbwJR9+tbxyANhsXYKUJwsbagsWv/3
         SWXdwKPTuaPNptOLT//r7PbAuM1rAnic5+E8YVimll+pxE3tWnofEyYo3iJ42/tQp5Xa
         SG6gKML7XXA/BCMuq4DItX5lxnRPDaR0XL7StA+8yo6L0VsDEdw36kM44UTUL8hvRcH3
         EnwnSPWtecFIOuCPMi0gHCFQlH+6Ua2C7h0qWF/CbMKKb2q9kAhvEUF0UdZXbwMQoBtk
         /j4WzZQdPnCUhdU40JTWksc89jy+8gm5sP5JTVGnAWx8zg8RnO7z7Sd5zqT6Aqu8w1CF
         6YBQ==
X-Gm-Message-State: AOJu0Yyve5UffXbcE1SkKKb9tn8Kn7OMr+/kWpPfrmDeK0DMtdK2ldUK
	oOzMY5s6EMgtMmTC4Fziq4d5GeZ+8oCBW38Smo+k9nLhnb8E3EwNiG+bmhC2VgF2D66o/sYSaqS
	hjKMTafVYyMDWB/ufvlBbXHDiH7BL7r0KPO04EgAzWEzIbgYiMfOBSYt2393EVpAh3rs+
X-Gm-Gg: ASbGncu7xSu6uokQ+MZL96mwgUtSmEiSxRAtC94CqOILpDpK53fJ+5I0aOXrrkn7mw3
	ZF63BVjIz7lpGGNH14TzGYG3Kp/E5o59vhtZG7EivBDS5d+6hw2NMJKTftRmgxSK4iiVgpz88Vr
	IEX+EC08kj2OXfvZvDBH86NFcoPT5A1ygu3xjTtlW9kL7Knu74hIOQzUqHxUyVVIV0N0XTpYljj
	cke73Mz/MbT5Q16oeButyZ6AUeZpU4u7A1TBaZL1YrNKMdP3UMoW9Gjjs3DgzzJMbjvzX7aiIiv
	aNx84Wmz7lrTkLrRnVB9nuHbxDgsRZP/bXypQRLy0zDCfFRBWIJKL+llft0m6V8qrY5FNBuYYiP
	50/x0DTWUGIrIvCV5PNUR5/awFLMVv1OPgqSCdZzZRbRDDe23YEn2
X-Received: by 2002:ac8:57c9:0:b0:4b5:da5f:d9b7 with SMTP id d75a77b69052e-4da4e09ba07mr14293411cf.78.1758745054111;
        Wed, 24 Sep 2025 13:17:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8fbq+QXzg7RxLwLK5HpzuaTx1WyIg89KWF8NF6iS/V7e/38Tey51cL9lzdyOFvS6uwyzg7Q==
X-Received: by 2002:ac8:57c9:0:b0:4b5:da5f:d9b7 with SMTP id d75a77b69052e-4da4e09ba07mr14293071cf.78.1758745053560;
        Wed, 24 Sep 2025 13:17:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57ef9b9bdf7sm2651004e87.146.2025.09.24.13.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 13:17:32 -0700 (PDT)
Date: Wed, 24 Sep 2025 23:17:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Xilin Wu <sophon@radxa.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
Message-ID: <zopgbudg67lygconkv3bl43xogzl6rncif7wdpclbyc4wblan2@n7v75dbnaqqd>
References: <20250924085804.34183-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924085804.34183-1-liujianfeng1994@gmail.com>
X-Proofpoint-GUID: GBNQYUDX3rlC9K-c0-1k1qzemkM_cbVk
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d451df cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=bYjh5Db1ZrtGeT73nCYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX2nP7ThqOrQJn
 dVzfcX32nsw31aqh9QLyifBnxXJ4FvSD8R9FZOXOYARr/IXXMBCMUOpkk4eGPw6/8CVEBXGXtqY
 BWtnuljXlGg/VdKfVUy7yBNU8Hf8MaE+iXf4bQCZpiSqmQ6rxHAOIVRsoos0CTlAsBCFG3J/F+F
 mKpZ+M8PzlioM7fbBG6VpJYbdsxxZe/J7mHQSEDFz5TNaND5BtfY2iyR7dUNsdbtOeiav2sVGIp
 7xxqiP1gzwyIKUvTs9wUyyFnajh6u/UGsG4sYZbEHOywLbRNvL+DRaOiYX/9AJz5D9+bAA+6ZZ6
 UzjkdH1h3ize3iBNGWObIoLGtezUiFhfF1Dwx9DoqdmBaHo7zV8yLS/8fbTkfvo5D0EYmMT85TB
 Pk7DTOXE
X-Proofpoint-ORIG-GUID: GBNQYUDX3rlC9K-c0-1k1qzemkM_cbVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_06,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

On Wed, Sep 24, 2025 at 04:57:43PM +0800, Jianfeng Liu wrote:
> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> use msm_dp_audio_prepare instead. While userspace is still calling
> hw_params to do audio initialization, and we get the following errors:
> 
> [ 784.904566] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> [ 784.912185] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> [ 784.918927] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
> [ 784.929947] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> 
> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> and runs hw_params. This commit will add hw_params callback function
> same as drm_connector_hdmi_audio_prepare, so that hdmi-codec driver can
> work with userspace alsa.

I think something is wrong here. The prepare callback also should be
called. Is it that the prepare callback is called too late?

> 
> Tested with Radxa Dragon Q6A.
> 
> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
> 
>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> index 7d78b02c1446..6ca1c7ad0632 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> @@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
>  
>  static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
>  	.audio_startup = drm_connector_hdmi_audio_startup,
> +	.hw_params = drm_connector_hdmi_audio_prepare,
>  	.prepare = drm_connector_hdmi_audio_prepare,
>  	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
>  	.mute_stream = drm_connector_hdmi_audio_mute_stream,
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

