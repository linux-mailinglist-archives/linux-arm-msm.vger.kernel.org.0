Return-Path: <linux-arm-msm+bounces-74569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 594ECB99022
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 10:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 821B1189FA96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 08:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1603A2D2382;
	Wed, 24 Sep 2025 08:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhfvUgDl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AC52D0C9F
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 08:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758704310; cv=none; b=N+qls09x+5tKglzzocSpWqjAjBsar7x5SRUsVj3Q/g1YIaBkxcM5D6XtpqrnCCbmHAJ+4jPn3UT50Ub6ik/lf0gESVliTFQi3/LPtk7t0VpeFM0oRfzA3YZNJfZE/jdS+lTothA4vChs46pOrzvGR88MLR0JvoauY87itG3prKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758704310; c=relaxed/simple;
	bh=TW61M5zdQ1lF5kvLURL6XpqXsOuc1JvYDM5XND98Vic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tb5PVJAtHlXvIb6dOT1A+AFhZvNcYVHqXDgxyY2iRL8GkGqkmKn8Fnb9zQdeNiIYop0yPf7sH1PKG3D5LJC22HZHOcrnBYD+YP9EkDe2Mkm8+twtobuCyYupFi7Vq4ZaCw8rgrLw8Sfvk9bs01k67W6fTmsXc/Ws2u3I4OT1t3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhfvUgDl; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2680ee37b21so8871875ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 01:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758704308; x=1759309108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BpxautfUhVRnZ8T33dUfTx1Y/3dEnu/6VVcMUyhFYd0=;
        b=JhfvUgDl7TGB4OdLDJ83xGj5rH8oQexpKuSwpN2QWFZwfAK9O4bT36xgl7G194fQ6I
         y2YeFCSWkl5g3L4mhQRQTii1W4xDz9pJn/9tvsvL+3vy9rsrkF5i2I/PODB6iuL8xSFX
         imkONn40g8orXI8qs3S4A4grXSe2xFFm8xsX0l1jC9efBMqE/eiwomY4HBPauPErqOYZ
         ++gbLN0h5IvM1m7vKKAjp6Pch/254U+E/BUV0Fu9Fk/ZzGZjvKXqaHaH+C+1Fz24hd9v
         7GcPidNug98kU5u9AquRECoZjJKy++Bj58KPTZCHR5Tb/AzCKbN6u76r6/wwxHB4By7r
         /J4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758704308; x=1759309108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpxautfUhVRnZ8T33dUfTx1Y/3dEnu/6VVcMUyhFYd0=;
        b=hmTi8WnybITSxb319TAQCrVihOhTV37QCHsojCCUH5Srk6YmBDj2GDhuMNcEBcwXhF
         HsWZCDdNN7Nz8dJSGufuXi+ledIJqugyPoc2FtilQhBYaP6NM7T2gq3VRLu1FEY0mICv
         pbsSp5f0MD22ht7XEYY1gL+d/a7Z1ls+wju7OW0x1XVqKdH7EvqKHp2YfO1UvyhImJor
         /XXDuMxvB/lR0LUcX9pBI1/qjXQeFOFcTcCbG0PBhr9E7JifDWHUJtoaa9m0eR6mdShe
         Il4eez7wTYkhMMwRNlXSrmxhWpV3hc3PPVSQJ3Mc3W/vIqffYvDAs47S/uBP9hna1ZSZ
         JYLg==
X-Gm-Message-State: AOJu0YxZPx7Suti2kpCXBK+3RM2ex2fMtKcHi1uQzxOg4wDm7+5cRE47
	v/fVQZHz7sfFNEB6sxFuR+cX3Jbu9v+U5+vu+qwfGdc2v/AJSKF9MjF09mLA2g==
X-Gm-Gg: ASbGncuyxyYwv/ybvjGp6942VIxVwOgIkmtoJuZ/nXlVDnpej28JwkMjFkf5BtGOmpQ
	1cuU7MRckcdEGDVe9IF9We3R6URlyx3iGv25/yvSfhFc7wi03QDZ3KpaNNv5SZh349PcPTbiLNX
	EMAE184OtlP9tO6czuxA2mQGx+Qgwb2LGlfNLT2Q+kJsuAY160itwyNOeLUHNJNhSuapSqLkBzw
	LEcpOWBa/NZ5GAvgkQIrii/MCQaR71nsdRWoWJAVlrTMfvukRoWZoASs4LAfolLr1O4bKKlZw3v
	991qe7VHdTY2w1pMcL6AL174QLBdeIQPa33N9axsL+WFC547JbKDoDwmv85OInUvjUXcPDX+Dxd
	0vBYUPIaIuLM0kE9rTOg+JgPzlzl42F2igQ==
X-Google-Smtp-Source: AGHT+IFIK5UmnbSxQTMbrW0b+kgVYDY9yAoSYqzhZLZMRlOtkVRe1ldf7XOAaAJVdmK+PgEzwcT/1Q==
X-Received: by 2002:a17:902:dac5:b0:272:2bf1:6a1f with SMTP id d9443c01a7336-27cc2d925a5mr36209745ad.4.1758704307558;
        Wed, 24 Sep 2025 01:58:27 -0700 (PDT)
Received: from rock-5b.. ([45.32.55.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980368fe3sm180399505ad.151.2025.09.24.01.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 01:58:27 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Xilin Wu <sophon@radxa.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/display: add hw_params callback function to drm_connector_hdmi_audio_ops
Date: Wed, 24 Sep 2025 16:57:43 +0800
Message-ID: <20250924085804.34183-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After reusing drm_hdmi_audio_* helpers and drm_bridge_connector
integration in drm/msm/dp, we have dropped msm_dp_audio_hw_params and
use msm_dp_audio_prepare instead. While userspace is still calling
hw_params to do audio initialization, and we get the following errors:

[ 784.904566] qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
[ 784.912185] qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
[ 784.918927] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
[ 784.929947] q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0

msm_dp_audio_prepare is not called because hdmi-codec driver only checks
and runs hw_params. This commit will add hw_params callback function
same as drm_connector_hdmi_audio_prepare, so that hdmi-codec driver can
work with userspace alsa.

Tested with Radxa Dragon Q6A.

Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
index 7d78b02c1446..6ca1c7ad0632 100644
--- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
@@ -130,6 +130,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
 
 static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
 	.audio_startup = drm_connector_hdmi_audio_startup,
+	.hw_params = drm_connector_hdmi_audio_prepare,
 	.prepare = drm_connector_hdmi_audio_prepare,
 	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
 	.mute_stream = drm_connector_hdmi_audio_mute_stream,
-- 
2.43.0


