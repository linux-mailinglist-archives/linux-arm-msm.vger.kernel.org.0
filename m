Return-Path: <linux-arm-msm+bounces-103109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMynIcQV3mlBmwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:24:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC49C3F8A18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 294EB3021583
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A142E62B5;
	Tue, 14 Apr 2026 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3nExj+/Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD173909A6
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161921; cv=none; b=Vcmca2pozbNoX0K3/NZrF/WSQnhYAzLLj+wZ9EEbGXkUWYO2XlFaeheuWSIoP9j2UE+dZnWFzN34fAvgBJ/B88g1Cl6WF2VPrRYJ62tPbVmiOV5Qd3XK4+veQnWYK/nz/BrAADlFaukwkdzpfChXenfE6i3qQ/g0wY/aIWljexY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161921; c=relaxed/simple;
	bh=RiOWPVhGKUcK0PyE7pCAWWaPj9qliEjgqwM+GweWDg8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=n1iI5BSwJ+K12YSxrc30zZ7FAf0K69KQX6N4l2+veT0XWzg1GxUsRYTvUv+eRjeQyAwvmgtc4/oQjd4+KvqCTMc+sww/pqcZDEkrHve41kVLeWzSOPRl0fAKmTUQ4fEiKYk/2KUuCVZVxxdVSj0x6beLkd1oGbYJVDdURUFLe28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3nExj+/Z; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9c3e2cf3c0so844104566b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 03:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776161918; x=1776766718; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKsGUuq/AWrW0/a76gvihKykHQHBCYzLpfiJNxSSm1Y=;
        b=3nExj+/Z1GVHcoN0n2TPG1rq7XiuwGlE7rco0HAMIQFZkXT9/Y+V7nek0OAT2vjSQ6
         TDYzukiCExDoHtGEWxPT895Njh4CR6adby/yOia1k9WYghAJuYbWgmpdc1duQ7M8g5Li
         FUznIEIvTwF2UAEfNocduNcUQEJHNebCDdfx4LG+DWKZnUJALTyoO7L6zqBtmlHoG1Ve
         gM5N7PAI/PYgXY7QOLwIUQ3uYy9PLZEHhtvAhpksR6Dxk0UontoFiMNlMn+ikqA3i0LG
         HGMgRG4rZ6UpAKcejsmehQswS33VeMs1XFcqXWSBIGJIOSewWtgN2ny0ZPuNknm6zWQC
         QDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161918; x=1776766718;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKsGUuq/AWrW0/a76gvihKykHQHBCYzLpfiJNxSSm1Y=;
        b=eweaMR4fAjuO7Sw5nhcVrmzMw7hEfbsLTbOTT6wEtEuy6Tjm9qv65boiQEFBkPaMAo
         YexVYf8I9iYFE0ekeCWTg5+Qv475iIDIjEBuuzc8YPiYCARbGYiH0WJq6sjF7f/Nwyzi
         NC92kzyMVCuCTbNmzaJPNSD5BjEBVrI2V0Ne7zI3eWM/9OY9IjErg91NFXXc3r/myVcm
         71kOP8ZGX7kXL9pB2KrmQrwgLjniSJKGm2Af6r8jxr0MttiaCdTaM8mtFtmq5jUFFduh
         8OEtbxzufazyEhc1bLR8RAW6xOk25fF0pniEKbfGAV8nSbL588CETYTQJBj6sWCueZHw
         6Oug==
X-Forwarded-Encrypted: i=1; AFNElJ+1ePccNuJRQHxYlZ0joKKvlnP1J1WPwcMpwqBas9dJrDLIBtJbrQeHUG3RaFx9FPiD2MVjpnlz0oaH4UQd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4qK4U8B/fgMwGqjHva28CiTEFQquNHqt/Cxxjs5ieBhbiWBZZ
	v9RqI0p0HE7UAbWoDETkCazGfLWvU34p3KwFJmqyIrJg96vTM3paQiyN0b2w+0SCnAU=
X-Gm-Gg: AeBDieu4YclN1X+Oj8lWrhTqmZomz+tpVNRqDQhzvPXsJPp9oTihVaDHoOEn7MIKOIh
	26WgQlo8/gXOR1ay3w2M4G9+vrMf4o/cGzff1uhk5VZ5Eyz0CFNVX22j2VcskqX+PF3bCaSnC7K
	NI+tdehCptswrTCOeDdat+6AJBNZF3ie5mhuPJwDb2kflsnjF+7qC8x4RXCZ2Bhfz+kwnhU0j48
	I2sxi4UAtPcLTA28Xz1ESDyJkcsjm9CeBxitZKkHPU39CyOi3g94rAipIMHss0ETSKgpNoBqhiB
	Q/zjWS39HYRa6/YiL+7xAJL4ue19NQ1sCjRWR2ExuEAf28J56xr82MWmr+TwGARyTUsMwL+Wap5
	j40W/7Y5T1HyuFQNLWyDXYn983WxBLnqXlMWq8iEpkRuBLfAsRbHCMWT+0z800laygWgNHh4+OK
	q2KK2uS7xb9EwgMRzAIkT+H1JfXpMHjiyoWt3prn7jrJ4AT35td/E1XninlAQef8mmUBTK
X-Received: by 2002:a17:907:981:b0:b9c:9dcb:36e8 with SMTP id a640c23a62f3a-b9d7294f263mr933612066b.53.1776161917740;
        Tue, 14 Apr 2026 03:18:37 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd77dfsm387242166b.18.2026.04.14.03.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:18:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 12:18:36 +0200
Message-Id: <DHSSUO5USR6B.1767MF8GNTUEL@fairphone.com>
Cc: "Xilin Wu" <sophon@radxa.com>, "Abhinav Kumar"
 <quic_abhinavk@quicinc.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Mark Brown" <broonie@kernel.org>,
 "Maxime Ripard" <mripard@kernel.org>, "Simona Vetter" <simona@ffwll.ch>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/display: add hw_params callback function to
 drm_connector_hdmi_audio_ops
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Jianfeng Liu"
 <liujianfeng1994@gmail.com>, <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250925040530.20731-1-liujianfeng1994@gmail.com>
 <DD8RLVPWQQ7O.1B3E1P6VNMWV1@fairphone.com>
In-Reply-To: <DD8RLVPWQQ7O.1B3E1P6VNMWV1@fairphone.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103109-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[radxa.com,quicinc.com,gmail.com,kernel.org,linux.intel.com,ffwll.ch,suse.de,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[fairphone.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.4:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,0.0.0.1:email]
X-Rspamd-Queue-Id: EC49C3F8A18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

On Fri Oct 3, 2025 at 4:42 PM CEST, Luca Weiss wrote:
> Hi Jianfeng Liu,
>
> On Thu Sep 25, 2025 at 6:05 AM CEST, Jianfeng Liu wrote:
>> After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
>> integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
>> use msm_dp_audio_prepare instead. While userspace is still calling
>> hw_params to do audio initialization, and we get the following errors:
>>
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6a=
pm_lpass_dai_prepare() started
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6a=
pm_lpass_dai_prepare() started
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6a=
pm_lpass_dai_prepare() started
>> hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6a=
pm_lpass_dai_prepare() started
>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
>> qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Fai=
led to start APM port 104
>> q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASo=
C error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
>> MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on =
MultiMedia2 Playback
>>
>> msm_dp_audio_prepare is not called because hdmi-codec driver only checks
>> and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
>> add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
>> hdmi-codec driver can work with userspace alsa.
>
> This also fixes DP audio regression on qcm6490-fairphone-fp5 (using
> Elite audio architecture)
>
> [  133.986865] qcom-q6afe aprsvc:service:4:4: AFE enable for port 0x6020 =
failed -110
> [  133.986878] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais=
: fail to start AFE port 68
> [  133.986881] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais=
: ASoC error (-110): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> [  134.045112] qcom-q6afe aprsvc:service:4:4: cmd =3D 0x100e5 returned er=
ror =3D 0x9
> [  134.045192] qcom-q6afe aprsvc:service:4:4: DSP returned error[9]
> [  134.045214] qcom-q6afe aprsvc:service:4:4: AFE enable for port 0x6020 =
failed -22
> [  134.045231] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais=
: fail to start AFE port 68
> [  134.045243] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais=
: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
>
> Tested-by: Luca Weiss <luca.weiss@fairphone.com> # qcm6490-fairphone-fp5
>
> And I guess, even though I reported it after this patch was sent:
>
> Closes: https://lore.kernel.org/linux-arm-msm/DD8PK8AI24P7.YK0OGVYC0QFM@f=
airphone.com/

Is there any progress on resolving this issue? I'm still carrying this
patch in my tree.

Shall I send a revert of "drm/msm/dp: reuse generic HDMI codec
implementation" to at least temporarily get this working again until a
more proper fix can be made?

Regards
Luca

