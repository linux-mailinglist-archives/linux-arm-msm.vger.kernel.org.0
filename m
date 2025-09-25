Return-Path: <linux-arm-msm+bounces-74910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 056CAB9D5D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E2364E1BB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C44221DB0;
	Thu, 25 Sep 2025 04:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ct1Hq1Vb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1151F4C85
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758773155; cv=none; b=SPNmGfykaK4+4JRI740csQgqmIfCpVCJnd6uANfNPT6l9FMMeXEzHQl2ty+t4lPCVxYYMuGsdolGyPbP1fqcMkbSC2+wgFLRvxyofafEdV1XeHRM5Ud7kSKs9aqRP25efS2gVAoLrNjShiA9ii22Zvy7XqpWuaL+ElrJnVbVX9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758773155; c=relaxed/simple;
	bh=gM869wqfg/cPNnr3+A3Zr5UmdmofsdcyZ+eZHm5ZaTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ctvN+cSLWlUGmARyE3klSs8z7yTJ79YgHabVnewmMCD/W0Nw5LR6R2c2uJ6+Bb2iwY/LsCATwdIkdHh9vGK7GOrShKUS2nzW2S4Q292N5x2STfqVff/gFm5Jn+J/pXoQ0P5RVoium+PSfC5xN/oh84g7JbDXAjTHOhSImDBIdVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ct1Hq1Vb; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32eb8144fecso76499a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 21:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758773153; x=1759377953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dG5OFuUhTzJArlzJLeHU0Z6lT0pnWQPiV+Gn+hR5Mck=;
        b=Ct1Hq1VbEFqy7oH8AR8NIlq8TdBlLvRt1df8EGpnXpABpuH0ZR+XxA80/TRdViJUbl
         DQ5g8SXfdSwnfXhzsfE4PcpOPIZJ8EVTYTIIKinUv2iIPxvOIZfCm0vq4vH6duplg0pG
         j0nLNipnvPGBHe4moTv8jG/0+A/yQnoyciCXA4LuuBH1NTH0sU/2P+C1V1Z9JzShpB+5
         pBi9b4XsCp2jF2EE1mJccg/tUB0dGTjDUunk7M+vxk+g3J6hpv841GwTaTE+1Yq2ZWfD
         lJKOUUESNt//Q0nNasJpYiUg0RQKDH1UHyk82AW2qybq2X5zywTMydYeSSc0o7TXkOLZ
         KLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758773153; x=1759377953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dG5OFuUhTzJArlzJLeHU0Z6lT0pnWQPiV+Gn+hR5Mck=;
        b=QjZTU7Js1AJNpN3PqkDyewvu6FcMBJlkxMsFl9AjltQpIvto+pGskng3DPRmYsYSWR
         Du0VyG6d7KD3hMtB+GmJznQUbMc4RqenG8DAkcLzzkDK3hv1rNOBAZOdf3m0YIGjpaqS
         38qKCFjQ9hNvxjbJW0fwAsuUHovQC2MJ12XXFzOW6k9TGnefDHMpiwNoYEjoiR7zj5wl
         hl1mcWJiv4lXe9aLtfvM8NFhFyb/InI6cCuTf00mJvdpjJkFY4nCunChw/wY6NhvlLfp
         UNjtvmtf23JK9bjiD5GkpERD1rVWFz+6cX4BHyUq83BCm5DMm6e0ib9sKvC0y+p+V7Ti
         1Ddw==
X-Gm-Message-State: AOJu0Yy/A0qpQf/SBi75kXnoDUtOh7wOlqfk1NI7y4ONl1i6pi4q0aiL
	a6O03c1R9IRnj2GgzJAxfgN7QZ2RQ1QHzdassfQdohIiO9cd+3lmpYoYz3yaKpyG
X-Gm-Gg: ASbGncuEG03jJuor0cuR8D6XB18qKdIscu/jbwFBTNrqAhdFRUCAnVCFHAqkNT7z766
	LfT8EywlUBFpIUUDZE/xTtn30zSGZee1xr6xY3jOc4RZveYBARGW4AoQuAH/vtf7Qlqvq2WU9Ct
	DwBL2hLu/37PUhIn00a2KEE4UzR7xCMuSJaAnSKBBidSoYq/RDp/CLeIUqKPw7n6FoJSmg9V7kX
	kBlHMZsNOmjd6Dm/Pju1G0T8QqyicYBLiRLpboOKpEZ31lF99AQKi6Y3HlxIsxDI/Nyz5N3Nht/
	+ng+I3ypTL4Aa3KPsVOG5fUoSzm+5dZb9WrfVrnTULUx8UtY0xZyjrn43TvA3d8+cMml8lncS3Z
	01G2mUOd/R7rqbEP2QrKlfyc=
X-Google-Smtp-Source: AGHT+IF2EgcFaR+V5r2laKG+fB7NOWuBnZAvcXdgYuPLY/fKj/+eq4e4iwbDLJlE07LtaXblbPtUpQ==
X-Received: by 2002:a05:6a21:6d89:b0:2df:b68d:f7e with SMTP id adf61e73a8af0-2e7cd4044a9mr1241172637.5.1758773152620;
        Wed, 24 Sep 2025 21:05:52 -0700 (PDT)
Received: from rock-5b.. ([45.32.55.39])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55bdefesm796568a12.49.2025.09.24.21.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 21:05:52 -0700 (PDT)
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
Subject: [PATCH v2] drm/display: add hw_params callback function to drm_connector_hdmi_audio_ops
Date: Thu, 25 Sep 2025 12:05:09 +0800
Message-ID: <20250925040530.20731-1-liujianfeng1994@gmail.com>
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

q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_hw_params() started
q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: q6apm_lpass_dai_prepare() started
qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to start APM port 104
q6apm-lpass-dais 3700000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
MultiMedia2 Playback: ASoC error (-22): at dpcm_run_update_startup() on MultiMedia2 Playback

msm_dp_audio_prepare is not called because hdmi-codec driver only checks
and runs hw_params before q6apm_lpass_dai_prepare(). This commit will
add hw_params callback same as drm_connector_hdmi_audio_prepare, so that
hdmi-codec driver can work with userspace alsa.

Tested with Radxa Dragon Q6A.

Fixes: 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec implementation")
Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

Changes in v2:
- Link to v1: https://lore.kernel.org/linux-arm-msm/20250924085804.34183-1-liujianfeng1994@gmail.com/
- Use more detailed trace log in commit message.
- Drop the empty line between Fixex and SoB.

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


