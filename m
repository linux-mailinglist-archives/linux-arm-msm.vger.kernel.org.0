Return-Path: <linux-arm-msm+bounces-56834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CECCEAAA3A6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 01:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7794A1A85FA2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 23:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EEA2F664B;
	Mon,  5 May 2025 22:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UngfIZz5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC602F6648;
	Mon,  5 May 2025 22:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483898; cv=none; b=W+BAU8kY4uSSDfqisbhI21gk+5tSi7eFKYv1tk7D8d5fkqDReLjTDBq91va/kcbEIB4nsJXFYjHkYqlUBjLD+lG7oj5hHr6eF/J06R4meUzYtNuWeVuky+lGEU0FgHGMs6H0z+g0QqgAcGXf4cIORmJM4FLesn7xDz0RjQ69nyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483898; c=relaxed/simple;
	bh=EpvfOA+AkGS6tM3bdG+sQj3qVbOD4uG5pj05WyaXprA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LV79c8PCxNwZNnjwJj8bU2Fej/jC7kZCjcpzgKs0c5UpZArY9dBww1cOsFvIil/95DwiItWWpGfwmjc096EDNVby35Rc0DusZNI3zYF1Hrb6VwcK8gLcYoWlljLJaIrnBggwfbH8K8XhLuy7GOxnjlcmwYwUFXVkmYctw+YcN9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UngfIZz5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD06C4CEE4;
	Mon,  5 May 2025 22:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483898;
	bh=EpvfOA+AkGS6tM3bdG+sQj3qVbOD4uG5pj05WyaXprA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UngfIZz5i/I52/s44Isv15oGUPGcpGYm0IKztv1HIJ7QR3N3SdTelfzcStJYfX9LX
	 PTNXLSidr7grahFOZusnQwONuWhZ6sNHTPTzIJ6ufRMbEXK0UPM7qw6+Kplr39wR2k
	 rRjLCc1AE+S+Da5tV8VwhO77QI9Nr87gdiXRybAQD1o87Jq8RQxQANlVVZM0jfPYxW
	 h8u6dYYkt1fabZ9mvi000XbX6vlAk/al6WKUAomdkE99A3kWatPGUnTPWnny+3i1Py
	 FL+zp5rVKabEfaAlewdQDuAJp7ROFkJQaFDWsKeGQY+VsKdvxRLj/Oroqs/4rzDdR1
	 UgPMHfNn6fmRw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	robdclark@gmail.com,
	lumag@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	marijn.suijten@somainline.org,
	trabarni@gmail.com,
	konradybcio@kernel.org,
	arnd@arndb.de,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 260/642] drm/msm/dpu: Set possible clones for all encoders
Date: Mon,  5 May 2025 18:07:56 -0400
Message-Id: <20250505221419.2672473-260-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Jessica Zhang <quic_jesszhan@quicinc.com>

[ Upstream commit e8cd8224a30798b65e05b26de284e1702b22ba5e ]

Set writeback encoders as possible clones for DSI encoders and vice
versa.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Patchwork: https://patchwork.freedesktop.org/patch/637498/
Link: https://lore.kernel.org/r/20250214-concurrent-wb-v6-14-a44c293cf422@quicinc.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  7 +++--
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 7b56da24711e4..eca9c7d4ec6f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2539,6 +2539,38 @@ static int dpu_encoder_virt_add_phys_encs(
 	return 0;
 }
 
+/**
+ * dpu_encoder_get_clones - Calculate the possible_clones for DPU encoder
+ * @drm_enc:        DRM encoder pointer
+ * Returns:         possible_clones mask
+ */
+uint32_t dpu_encoder_get_clones(struct drm_encoder *drm_enc)
+{
+	struct drm_encoder *curr;
+	int type = drm_enc->encoder_type;
+	uint32_t clone_mask = drm_encoder_mask(drm_enc);
+
+	/*
+	 * Set writeback as possible clones of real-time DSI encoders and vice
+	 * versa
+	 *
+	 * Writeback encoders can't be clones of each other and DSI
+	 * encoders can't be clones of each other.
+	 *
+	 * TODO: Add DP encoders as valid possible clones for writeback encoders
+	 * (and vice versa) once concurrent writeback has been validated for DP
+	 */
+	drm_for_each_encoder(curr, drm_enc->dev) {
+		if ((type == DRM_MODE_ENCODER_VIRTUAL &&
+		    curr->encoder_type == DRM_MODE_ENCODER_DSI) ||
+		    (type == DRM_MODE_ENCODER_DSI &&
+		    curr->encoder_type == DRM_MODE_ENCODER_VIRTUAL))
+			clone_mask |= drm_encoder_mask(curr);
+	}
+
+	return clone_mask;
+}
+
 static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				 struct dpu_kms *dpu_kms,
 				 struct msm_display_info *disp_info)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index da133ee4701a3..751be231ee7b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -60,6 +60,8 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder);
 
 void dpu_encoder_virt_runtime_resume(struct drm_encoder *encoder);
 
+uint32_t dpu_encoder_get_clones(struct drm_encoder *drm_enc);
+
 struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 		int drm_enc_mode,
 		struct msm_display_info *disp_info);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 8741dc6fc8ddc..b8f4ebba8ac28 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2013 Red Hat
  * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  *
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -834,8 +834,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 		return ret;
 
 	num_encoders = 0;
-	drm_for_each_encoder(encoder, dev)
+	drm_for_each_encoder(encoder, dev) {
 		num_encoders++;
+		if (catalog->cwb_count > 0)
+			encoder->possible_clones = dpu_encoder_get_clones(encoder);
+	}
 
 	max_crtc_count = min(catalog->mixer_count, num_encoders);
 
-- 
2.39.5


