Return-Path: <linux-arm-msm+bounces-50736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6281AA5818B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 09:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F4B116C048
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 08:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780E419CD01;
	Sun,  9 Mar 2025 08:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qkv1Uhwp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CCF19CC33;
	Sun,  9 Mar 2025 08:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741508057; cv=none; b=WarIDxCWradBJJcc87mzO2MgG3anMGmb5GJL5bPtSqR6wE73IYxYiN9IXGGDtbTHhC8fREK1zzrOuBG/Fj/WVKRLDmJQnrZi93yDclfWQLT2HXnmXmzFI8tj+uokU8J5U/V88Q6lV+NMNnEP/lSL1rc03H/vdCV+ZVOnExByjpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741508057; c=relaxed/simple;
	bh=iKB2YBTN12itUfX2G/gBJMos1y7mn3/DCF/Ulyo0X7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eagLB4B/1h2SsrT0egfw7aV/gEJr5SKPPQ21UCffdNIx5hsgoNj4oew+oJEsJP5Fdn6d1/PfH6QMna+g3+8gSfsb1yZukL+FvI4r18hRfKVzaKE+2i/2lAcxgIqO2j9DsM1qonX2507titD6gcdtFbzeeztv8cZ4Ae0Hp8W/OQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qkv1Uhwp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E72C4CEEC;
	Sun,  9 Mar 2025 08:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741508056;
	bh=iKB2YBTN12itUfX2G/gBJMos1y7mn3/DCF/Ulyo0X7I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Qkv1UhwpVdIF/mpWjUCndDtzuaBw32F3c4molVWdZBfu/5pq6VrY5D7oO2XpWZDus
	 AymRUdLjPF08GGjit0GU9imow6SKUk7hw4nATiOLi5r8fyRV30rW5aEA9RPkngIppv
	 KLRKqqus1LbM7aKgw8MF29H7TClXXPeqOY0TSSZ4miHhbt7n2gQCF6QlKjAe7wIHEp
	 a/3jvoql9kiknW0HAyF+k2hD6ni/pW4x6R8JGCGEw9d/4lWlZ2uefdZmRC1CHTL8dj
	 TJO1itTPIIGn1pvtaOQRlcREXlwiCuiePJ0Owh8KNnyfz4+ILagipD4BvbyYP/eq9V
	 azkpCbDxCE4Rw==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sun, 09 Mar 2025 10:13:58 +0200
Subject: [PATCH 3/4] drm/vc4: use new helper to get ACR values
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250309-drm-hdmi-acr-v1-3-bb9c242f4d4b@linaro.org>
References: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
In-Reply-To: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2230;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=W6pWxFzbC0mPSPnJqUk170LFBYndwgytPiGUkUHjC54=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnzU3GrYcDRMq3W4ONCVGhBpUXl6k8lj2QsL7nl
 gdbA5U9/TyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ81NxgAKCRCLPIo+Aiko
 1dFKB/9JZWpbJ6y3a1WbkyYvqPJsufPOri+tur/kkqtnfjY8NYZEJBH/HZT9JHz9RRHAM6EFJtm
 gUL7PIDiHT1k4GT46QcRwQHgDipgj/auPslmS87JoUNdXfDX14abRUMRUb1W2sfaPSCar3YF4F5
 Vw8tOp+M82WiScIY5lGVlVo4Nrvl9aM30omD3AvMlt5V9zsgQgAkgEqHgoBWdICf8DU4Ih9Jadz
 +ccaUCMJML4c/gvDTcMTmObieduMt0iVZV+PeayvUgGCIr3h9XgaC/kajSpMqSrXyYczNH7G0XM
 cJXIJVPY8WeKbSfzv2bycJUTkfXz2NNZtK3OCWUYW9NTkkgh
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Use drm_hdmi_acr_get_n_cts() helper instead of calculating N and CTS
values in the VC4 driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++-------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 37238a12baa58a06a5d6f40d1ab64abc7fac60d7..f24bcc2f3a2ac39aaea061b809940978341472f4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1637,6 +1637,7 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 		      &crtc_state->adjusted_mode);
 	vc4_hdmi->output_bpc = conn_state->hdmi.output_bpc;
 	vc4_hdmi->output_format = conn_state->hdmi.output_format;
+	vc4_hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
@@ -1829,17 +1830,12 @@ static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi,
 
 static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi, unsigned int samplerate)
 {
-	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
-	u32 n, cts;
-	u64 tmp;
+	unsigned int n, cts;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 	lockdep_assert_held(&vc4_hdmi->hw_lock);
 
-	n = 128 * samplerate / 1000;
-	tmp = (u64)(mode->clock * 1000) * n;
-	do_div(tmp, 128 * samplerate);
-	cts = tmp;
+	drm_hdmi_acr_get_n_cts(vc4_hdmi->tmds_char_rate, samplerate, &n, &cts);
 
 	HDMI_WRITE(HDMI_CRP_CFG,
 		   VC4_HDMI_CRP_CFG_EXTERNAL_CTS_EN |
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index e3d989ca302b72533c374dfa3fd0d5bd7fe64a82..0a775dbfe99d45521f3d0a2016555aefa81d7934 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -211,6 +211,13 @@ struct vc4_hdmi {
 	 * KMS hooks. Protected by @mutex.
 	 */
 	enum hdmi_colorspace output_format;
+
+	/**
+	 * @tmds_char_rate: Copy of
+	 * @drm_connector_state.hdmi.tmds_char_rate for use outside of
+	 * KMS hooks. Protected by @mutex.
+	 */
+	unsigned long long tmds_char_rate;
 };
 
 #define connector_to_vc4_hdmi(_connector)				\

-- 
2.39.5


