Return-Path: <linux-arm-msm+bounces-75918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A4868BB738F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 16:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 030B04ECBF6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 14:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C8826E706;
	Fri,  3 Oct 2025 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NPlkjwcZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD7926E6E8
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 14:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759502578; cv=none; b=XXP0tZuIDfcV6bPx8jMg0EbUK3UHQQyDt3pv1s+pswAq6y7icNdWdjZEf2W5KCHd4LII6Wb4uvlOt0CP/jPCgkXA7HzBwTndaWF+ti9z0/Bn2KDXt1cVlvPpUmV5ystxlAUfq3zBjpaq+9/9ADtvwpdKLNQIBWTWpvfniHutgPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759502578; c=relaxed/simple;
	bh=wDdmsNkWkPfZj44KlVzWvEle8GfWI+c12B+1GRbE7R8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=nROUZfr8h/0VfvPa2tL1iLqWSjVfzCoPY9XxPZ3zQoFPD/xkQwjhuJ0NS8FVYXJLoLLNGBbF7YqlxAHNAH9KEW2HUXSmgYZ2xYmeEk6CgDtN/9y3GCRyvmq2b69m4tovkMuGafqZu0+FAt+PVtMY+/MZdK7SnZd3uqlvHN4o4j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NPlkjwcZ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso5451410a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 07:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759502575; x=1760107375; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlNE36EJ5Kom/3DEY05rCkapMs77Y5jFnAKGd9Vbt6k=;
        b=NPlkjwcZ/vQCuKBuM3nDMNsF71AXGCNZFHyIYyrDn5LTrIphL+EvxEFYLgy0JfP1NH
         68GgdiHQsIkE+ifjzwtKeU6wBlHk4CONaxHw4cVlG1nx6L5aeivr+mBaCRXkELgLAijB
         vroxf/JqulAf4d5wPdxqeiVLH0dyt0Y46FZBf9PYKGFAKOoSKvPvND9Uv8dbPdQb5SoX
         kOB54XDuJbPG5Eg6jW0zXXQzUKu5bV0Ed7CDVlF3u+37pJKoSWu2+V2zKp4moVbFEXIF
         6Qg2k2DFpbDxVkzIUAOQsiz+tY9C/gdDHRyxc/GKSppsbhyiW+Ewhaz7YswfxZ0sr308
         mNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759502575; x=1760107375;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SlNE36EJ5Kom/3DEY05rCkapMs77Y5jFnAKGd9Vbt6k=;
        b=CErgQANr6Qz33N0mkOg6+SFtCGhgmmjYZMlemvAMKUxTl0NvOxYSzHyY1W4WtfdeqB
         CtF0VhXNT6gsjTHFBnmDdkla6CboVX9ufrmg6HkU1YO3O0BuaczmeSllmdNM1VlNsNyT
         U8S1IRGvzd7bJiEVsIkzH/lBfXzdDck2gbsEkV78K3oFTQcU+STXdi0MdnnXHuoTTHQ8
         po1R9ViobU3aTbjd6JWBV2m8fkL4T9uhb8waP9IfglFqoIkn8p3GmeuJyZVf/w3GhK+E
         yGozIuNctbIsz2YOl/DukqpShGAcLEpPp5m+C9pajN+4K2QzWgTE2qy9cu0v3254O1dq
         XuHg==
X-Forwarded-Encrypted: i=1; AJvYcCVOw5iWUJmZ81rncsm+RkI2SutISgUAjjEDOFMKt7Qj5ojmIe1NpNp3l29EQax+UJDI7NAOjdjw1ATyN7US@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8L0Kyh/liC1lKREwNgO9b0glHD493oGijHg52g7nZXUgRAMAL
	3m+CV21VEs270AprKC/W/FHmRqGiyDX/cGZj/k7BWU0g4u15f8rOvvNQCQSW6IcZe/U=
X-Gm-Gg: ASbGnct3gNiQDfY7dd3UNwljfvawDoJNps7adWZP5FclB1Fv7MgP9V/l4n57tqh/quA
	dTWn5AgKQt1iWvGkxQu20OgLpaljJjd1MHIkdmNfcA+3bt5GWHTTvbRri6Qe8ahGV+NdPBkEDcj
	fs9b4MU32wkKmTBDLtJW7u82I2jKNDohID//MWZdWaM9HH7q2WmWOXqnCD376p0AaPfkn3blO86
	PCMzgTg2Q/cNDp2Gmgunef7+SMDrdofMRerSs7CIRqgh45b/XWRMlvZKKYpapXC8CWHpDTSNn3J
	LtK5e7Bvef3K/4m6m7Z/B5Z2tSnfdAEELgqqxF9kl9Fg7gR3TC/OaaOTNbG056SZYS93ylPRoVA
	nnPqDtuX0CoYiz/vgYJmXkYItQJ5RLUZ2QR67tXGxDo8FArqy5QpGAuJ93acmqliXH9GvloNvfT
	PKL8DtcQl7Jlp5iyNct2V+R9Bmo40=
X-Google-Smtp-Source: AGHT+IGX8Mwauo0jMUzXRHaaKVWDDG9Q+j/DlBoCJbJpO1bZGiCPJWunCvR+Fi60aTitcRmnndjPYQ==
X-Received: by 2002:a05:6402:2230:b0:637:e361:f44b with SMTP id 4fb4d7f45d1cf-639348cce60mr2774437a12.12.1759502574735;
        Fri, 03 Oct 2025 07:42:54 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3abcd7sm4152122a12.2.2025.10.03.07.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 07:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Oct 2025 16:42:53 +0200
Message-Id: <DD8RLVPWQQ7O.1B3E1P6VNMWV1@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Jianfeng Liu" <liujianfeng1994@gmail.com>,
 <linux-arm-msm@vger.kernel.org>
Cc: "Xilin Wu" <sophon@radxa.com>, "Abhinav Kumar"
 <quic_abhinavk@quicinc.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Mark Brown" <broonie@kernel.org>,
 "Maxime Ripard" <mripard@kernel.org>, "Simona Vetter" <simona@ffwll.ch>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
In-Reply-To: <20250925040530.20731-1-liujianfeng1994@gmail.com>

Hi Jianfeng Liu,

On Thu Sep 25, 2025 at 6:05 AM CEST, Jianfeng Liu wrote:
> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
> use msm_dp_audio_prepare instead. While userspace is still calling
> hw_params to do audio initialization, and we get the following errors:
>
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6ap=
m_lpass_dai_prepare() started
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6ap=
m_lpass_dai_prepare() started
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6ap=
m_lpass_dai_prepare() started
> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6ap=
m_lpass_dai_prepare() started
> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Fail=
ed to start APM port 104
> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC=
 error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on M=
ultiMedia2 Playback
>
> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
> hdmi-codec driver can work with userspace alsa.

This also fixes DP audio regression on qcm6490-fairphone-fp5 (using
Elite audio architecture)

[  133.986865] qcom-q6afe aprsvc:service:4:4: AFE enable for port 0x6020 fa=
iled -110
[  133.986878] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: =
fail to start AFE port 68
[  133.986881] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: =
ASoC error (-110): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
[  134.045112] qcom-q6afe aprsvc:service:4:4: cmd =3D 0x100e5 returned erro=
r =3D 0x9
[  134.045192] qcom-q6afe aprsvc:service:4:4: DSP returned error[9]
[  134.045214] qcom-q6afe aprsvc:service:4:4: AFE enable for port 0x6020 fa=
iled -22
[  134.045231] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: =
fail to start AFE port 68
[  134.045243] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: =
ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # qcm6490-fairphone-fp5

And I guess, even though I reported it after this patch was sent:

Closes: https://lore.kernel.org/linux-arm-msm/DD8PK8AI24P7.YK0OGVYC0QFM@fai=
rphone.com/

Regards
Luca

>
> Tested with Radxa Dragon Q6A.
>
> Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation=
")
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
>
> Changes in v2:
> - Link to v1: https://lore.kernel.org/linux-arm-msm/20250924085804.34183-=
1-liujianfeng1994@gmail.com/
> - Use more detailed trace log in commit message.
> - Drop the empty line between Fixex and SoB.
>
>  drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_audio_helper.c
> index 7d78b02c1446..6ca1c7ad0632 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> @@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify=
);
> =20
>  static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops =3D {
>  	.audio_startup =3D drm_connector_hdmi_audio_startup,
> +	.hw_params =3D drm_connector_hdmi_audio_prepare,
>  	.prepare =3D drm_connector_hdmi_audio_prepare,
>  	.audio_shutdown =3D drm_connector_hdmi_audio_shutdown,
>  	.mute_stream =3D drm_connector_hdmi_audio_mute_stream,


