Return-Path: <linux-arm-msm+bounces-43891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5201A009AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 14:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26BC63A4895
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 13:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3FE1FA244;
	Fri,  3 Jan 2025 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ikqd4528"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9431FBCA8
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 12:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735909140; cv=none; b=VTLoDm37+4b/NlaGGiRhq8YdY70yRA0r66MDjzXZFhCHNutCuHR5PO2UR/cFuJ0rTubEZV5b2u0UPVFjbKoIL5husXsTNNZi/fSanHIGdJbkkPgXn+l1kUsqiyekVP4oSlKNWky46CTgyKP6gpEH0TYdpZhR9/lM5bI7ppvTupk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735909140; c=relaxed/simple;
	bh=zhRY8lT1G9JeELkZ54ealjEatpcKTP9np6vn+j2kA9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G1LjIwtbVvjvLcwWHnJIrh8z867QQLXsuNOeERZEOgsI16CX7p1GEr50QGu5FHmwHwked0f93H3+eMwP2SKLD3sGBr01YsQCCLKSIuWNQo8S/krX4oAaLxGBmuNphaEl6PjUnPhTyT9kWd8ASXLCMfmh18CJp0nBWTPK8F3gEnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ikqd4528; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43675b1155bso110884675e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 04:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735909135; x=1736513935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VITqw/dBrN6Eh2YzRoSLvwchdbQ5DNjyYt5nkHrQ30o=;
        b=ikqd45288racRs98N5fdxsszjtQ3DxYTYVxBnLZLXIiV7qw4URbIlqpQtEzay1wgNd
         axLtCR7VkJosdcQPPANZjf6dIn4zvmNOVhN5aoYkY7nAiP9B90ZhFGjU5ralZjQdgnmt
         iryTBZ9d6daRe0rBMzMihk2pfnCc5007w1YJdwQI9YE1p+gbqWnZlhivxvYjyZvaonQ1
         v4+lSxhREfbGBVT96HBcX3bR+nERBOgLwBRKAw72DinKKusN4C/IBU9oUdzlVoMeqx7U
         LYFxEYUSGhWfkpCZVpxbIE/6NMgD2MrZfE8zJvfKa3V8xQotX0Nwxbf4Vt5XGLknoDpl
         qeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735909135; x=1736513935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VITqw/dBrN6Eh2YzRoSLvwchdbQ5DNjyYt5nkHrQ30o=;
        b=dqNkYVGI0zG8Ow3ADlNAbI+VtNpTW+Vh0YGNewkTEuOLm/sWzpJQFYQVAf1zf2vc8X
         x172tMV9T6gCqerz8NkW28AiqzqDMdgq6pS6emah8JfM0aqxVo7fR/ev4aOgQd5Lslnr
         GN4gL3MO12j+BzEvEOt/oShtUYcvZqzDYtuC/LCRVq7V4nfTSJsTMufiCuhA4tD+jSMr
         kp/0d0bQodbhpdYiLFJi92PqREuEv3Zj+1ccdQNxHrhOLUyvhEDcm6J1STtOahudixgz
         MrHwf/PhUDhPh9Xb37KHvgMDTc2Q7ixv5uqHB5AzjY5GUb9p/mjT+VGGti0pFzGNjtRe
         TG+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1Q0bdptMVICRUQ+ccm7G20k70HCjlcSI25ZfVc7Irl1HwFeO2r7YO05xKoG9h47T42Rwmrmb1Mi92KDC6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp+5/US03Hn64duFHf0FdrhbLgBiBC0GXxbVrE6G2DjBxocRPL
	WaBs77ObBjnP7kc2c+XYztE/Og9H+XWednWoEykDtuEHApwUMIBk7a7DhZeEeEI=
X-Gm-Gg: ASbGncu8H676VBmshxrsm+vEsoZdv4v1lH3sOWN0NUjT/kLAxbHWOMcarvzscc42QDP
	o/T/WknR9CUlv6+A80usWQbN3r39I+v+gO38HYwF0lNCJI7h9oSANRkhiwad2z1Vj+fTsSB18Rs
	QYH1AtIrSdDTUG/UuSxK9QJKugGYA+rXJ7jMspxRygUdc99tPAmGYY8WBgP5OFySzjvit1y1qiF
	1AOu8tus4H4lmU15nhaZmgVugJkmoxJjneCzrIxTm6cG+AJauKEtwfU
X-Google-Smtp-Source: AGHT+IGUnpXjnchYmTBFtUQ71LNCqNAU5Q0SOmAgi8sEQyivFL6wDbTXzLedPgyb7rzrtBvhgs98IA==
X-Received: by 2002:a05:600c:468a:b0:436:1b96:7072 with SMTP id 5b1f17b1804b1-4366854c062mr416478835e9.5.1735909135449;
        Fri, 03 Jan 2025 04:58:55 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acadcsm40225591f8f.105.2025.01.03.04.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 04:58:55 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 03 Jan 2025 14:58:18 +0200
Subject: [PATCH v3 4/4] drm/msm/dp: Add support for LTTPR handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-4-5c367f4b0763@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3291; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=zhRY8lT1G9JeELkZ54ealjEatpcKTP9np6vn+j2kA9w=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnd98D5vjbEpomMQ8dXV6RVZNIUGfQhGggxggBR
 Qdgu7UHk5eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ3ffAwAKCRAbX0TJAJUV
 Voh8D/9SfWx0sZ/dkeV5jYSYWRDoRArPfvo/DRVwDxLshqbRTU8todXxZViuaYxdh0+wz1yC/Tl
 QEgnwoaexcdVCEAq25zErdxGc4DeAW9RvqP/VVsiJug9NL1tl3wpnml4UY6A5JfU7ZB3/JOy9/F
 /ONMwxpcEqk7hKvuddzOaCg1m/haAPzk+i1foSK1pMOcFttgGGASktqORFxgTLVEfYY8cHB4yxM
 dvBYkfyMHeH4AHeDxpk08PfpDC7+kdjNESFHUjBbTQXdkT5tEu/AGxWOoyPQ/T84KwG/0izcapT
 mM2YxbX25qmTlAbYB7G6xo0nZs9IPz1lhpDnv49OF6A0Cji+YOfhvDdQizk4uDXrcS1rwEqNJja
 O82hu9RoIPEiXDGv3rYeLjA/4mkctvac/eWZv3CKxxxadOQfbX46cqUP5ax+8tvgzsY4GDpQ97M
 o0ZNmdt1dc09tsGlamOHx4vapCTX3qSXt9Oj8w0HWezaWJW0MHuDfoH+tZpHYbYZ5+J4i2DExJK
 6igXX5ziVN/sJVwhFYPYRdVp0T3ZkUkCpBTJRBAG/+6uS4hffPzIh+wWpkfNmHMhAatBd10ifQo
 SovAsasDDp0M8XgZ6QSM4qpqr2Z6a0qO6NY0DuXvyC5loIDA2uFCsYWFvBQe8y3+YQAOqdaq5ma
 Xl+1+4xOfJyy7zw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
1.4a specification. As the name suggests, these PHY repeaters are
capable of adjusting their output for link training purposes.

According to the DisplayPort standard, LTTPRs have two operating
modes:
 - non-transparent - it replies to DPCD LTTPR field specific AUX
   requests, while passes through all other AUX requests
 - transparent - it passes through all AUX requests.

Switching between this two modes is done by the DPTX by issuing
an AUX write to the DPCD PHY_REPEATER_MODE register.

The msm DP driver is currently lacking any handling of LTTPRs.
This means that if at least one LTTPR is found between DPTX and DPRX,
the link training would fail if that LTTPR was not already configured
in transparent mode.

The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
that before link training with the LTTPR is started, the DPTX may place
the LTTPR in non-transparent mode by first switching to transparent mode
and then to non-transparent mode. This operation seems to be needed only
on first link training and doesn't need to be done again until device is
unplugged.

It has been observed on a few X Elite-based platforms which have
such LTTPRs in their board design that the DPTX needs to follow the
procedure described above in order for the link training to be successful.

So add support for reading the LTTPR DPCD caps to figure out the number
of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
at least one such an LTTPR, set its operation mode to transparent mode
first and then to non-transparent, just like the mentioned section of
the specification mandates.

Tested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aff51bb973ebe0835c96420d16547ebae0c6c0f2..6ea8245284ab5b6068bfba64f01a960838f577b2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -107,6 +107,8 @@ struct msm_dp_display_private {
 	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
+	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
+
 	bool wide_bus_supported;
 
 	struct msm_dp_audio *audio;
@@ -367,12 +369,27 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 	return 0;
 }
 
+static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
+{
+	int rc;
+
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
+					  dp->lttpr_caps))
+		return;
+
+	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(dp->lttpr_caps));
+	if (rc)
+		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
 
+	msm_dp_display_lttpr_init(dp);
+
 	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
 	if (rc)
 		goto end;

-- 
2.34.1


