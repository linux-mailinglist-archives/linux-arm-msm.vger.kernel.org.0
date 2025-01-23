Return-Path: <linux-arm-msm+bounces-45985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F79A1A482
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 13:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A874616353F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8D120F972;
	Thu, 23 Jan 2025 12:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LnJ/Ihki"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FB720F976
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737636304; cv=none; b=hKdhU6tJHyp8HA8BnOvsDcQDWx6wAecQgj5azjjd8l386/+ssYKrepZSkh3DsGmH+UymUoPO2pBbykXbf5LL9uQmJkrwb9MuHn3rnCrd62/+VeD1+OjKb6XhmGSWmzyLBhJUZRSl67f9R9h6ZsoHLvnKLc32qpsWMmtxoGZtMPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737636304; c=relaxed/simple;
	bh=9zVeq6fbBs87RymcRg/e2kjiz2Fyvfkzu2Dc7p8G1oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LkEy9/ckfIDHlVCm5NnyXHDHfwXKOdy9ZxeNxYbBrRXA4dkxqQKsxKNW+SiC5I+K/j2yvnnI35HBH+jfoR6foP/bNQHWxGPhudCVvcYHKEa/Uc/YTuQWdi8UxXwFZBZgs3/fJ9YhJfAiUXu1nVqglUSJFOH0XsaUFqq5BroEXfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LnJ/Ihki; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401c52000fso728497e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 04:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737636301; x=1738241101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGG1s1S8D3eBzGHQyK9YTyucSj2Qt8yK2qJGvoIIk2c=;
        b=LnJ/IhkiuE6ZYKE3lwjXq3Iz9CEkRC2HxfTq57JfUtQM4VMOPitHh+iwCvW0inW78u
         81qy7nUpU2ZZwR6j8KrkJnSCT+m5FZaBS20ija0hgp5bT6ulHm/c9J49T9BTwknK4Lgs
         cfkVT9UBcSmqVAvM7x1b/9tfOkt+u9a3Rp3/uKMXZkeZX+9u4slki8asdtyhRAMSmVit
         /+WLV3xBjquLN0yiT8Jhn10cE0kXDqtYM3PW2h7PotctZVs25YMCvEy5H7dd7d79zcEw
         W7MIjOkKpemwR3vwwrooQM4YNuBI/1Ric6L8UABwByO96tSpEJclfKu2udWF8N5vom0U
         e2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737636301; x=1738241101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGG1s1S8D3eBzGHQyK9YTyucSj2Qt8yK2qJGvoIIk2c=;
        b=rykfkgY4eM0Qe6bDVswEhLk007QQx2HXZ8WxXekZcRDwuT8ZDv7usGWCfd+EiYq0Kn
         mkDv0x7FmyjEK+IpiYn3REU3tivmhhwqUMmPZVxY/rYArkZPsdVEI/6f/8DLWH+D1AMQ
         ThYbipRQ6n8Z9xnOPCGtSYnYWKQZgivT0dk5n/4pse7g1/HTLlUvO/XGllyAojVWzHmL
         +9dZmC3L77bxCz/MK61uLXlAd6BRzI1Aobi/GbX8KONBolTFzRG5Mp4NDQ+05AxWJZOb
         fMeTnsXY0CmCwUb0r9fKjfvZvQoZWaRFwR1woEdmg8QwWT8NGGnKw4J3lss9Ds5k4Gdl
         Xykg==
X-Forwarded-Encrypted: i=1; AJvYcCV1A/0GU5BU/bU/Qzv1rbeVD2650rqxRi48ETiNo7iu1eK47gMdpRp6xpDfBEEsX8ab0F2MkMgo5ftKElVt@vger.kernel.org
X-Gm-Message-State: AOJu0YyrMAM63qHX1+d59OPnUFYivR3c0WnMUK0o/fIRDurbYr1hWbj4
	r0edH8nK1/5e1oUl9kAO2/4W5Gmnz7p3/EEIKoe0y0JdRXFsZCJCH/6fl7QpZVE=
X-Gm-Gg: ASbGncthnTXAV1NlrBllN4NKo2v+ZlasodjV8o+5mLhvJgG5vm/N6UQaT8pCUUPp5B4
	u1g2DJmszbfFA3649HT6K0N1mubbAuHzu+S7h4z0Hq3gbIUYNNgs8Ln+nUlb1uhbvKgbrKhkAok
	pSz/6dbVQ8NLvy2muEN0Rhusu8g6bgXQUAQE5FvGJc/Xw+BQrj6+PNyoLziHd4a+bBWubDHSn0H
	D6tkqFXv4e06JwrpZ4GpOLDTetO21XBLHCymw/e1EAz1GE7iChShPuhGub7mizG/wSsfuqGMW9S
	tTuxPk0co1T/
X-Google-Smtp-Source: AGHT+IEc3fFogjnD5/4R2Bf8a7GwLgIkwuzc+D1oUKDeQls5NYh149P1sZOUsIA8lUqhtjnEtev08Q==
X-Received: by 2002:ac2:4570:0:b0:540:2542:d89a with SMTP id 2adb3069b0e04-5439c288152mr7747160e87.52.1737636300767;
        Thu, 23 Jan 2025 04:45:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a4ed6f3sm30351661fa.86.2025.01.23.04.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 04:45:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Jan 2025 14:43:34 +0200
Subject: [PATCH v2 2/4] drm/msm/dpu: move needs_cdm setting to
 dpu_encoder_get_topology()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-drm-dirty-modeset-v2-2-bbfd3a6cd1a4@linaro.org>
References: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
In-Reply-To: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3658;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9zVeq6fbBs87RymcRg/e2kjiz2Fyvfkzu2Dc7p8G1oo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnkjnGQQwX2/92m28UDkxPgHsjijqmj3l0C61CP
 AJaqUsuPNuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5I5xgAKCRCLPIo+Aiko
 1aPUB/wJz/4RT6wQtzDjjYlvwIs+lCHplpQm8SAQzmtOd0QvhldFakRolrA8jhX141F8kesTbWU
 69JPnlE8fSAql+i/0C+bUlttsx1rLhdm+Gfh9igYykbkhvNBzYjS3tiqZNKTjLJwTmcUcKtQ82d
 EVc8iyVdH6bxVVBjBK9ANniX+kooBCheFePAUIWpE7UMmO/zHDD7s/tjbhFKI9aVJqy0x6XsR+0
 dLFer5EfYXrvXHg43BqhnYcEqXg+pZ9I3OYk+NLLN8caFgz9MfnGc4cLFXXkt8TpNCsxsu5jleD
 Npo53pNQFkPsDdZVxsw/YlmzDSlbpUtiYT0Bjm0U+iHtWgwt
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As a preparation for calling dpu_encoder_get_topology() from different
places, move the code setting topology->needs_cdm to that function
(instead of patching topology separately).

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 ++++++++++++++++-------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9aacd3b5bcf808c5712bf797a48484e297386c1c..5dc2e0585de1337601a0426795d2c8f2806ccd10 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -652,8 +652,11 @@ static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_kms *dpu_kms,
 			struct drm_display_mode *mode,
 			struct drm_crtc_state *crtc_state,
+			struct drm_connector_state *conn_state,
 			struct drm_dsc_config *dsc)
 {
+	struct msm_drm_private *priv = dpu_enc->base.dev->dev_private;
+	struct msm_display_info *disp_info = &dpu_enc->disp_info;
 	struct msm_display_topology topology = {0};
 	int i, intf_count = 0;
 
@@ -696,6 +699,23 @@ static struct msm_display_topology dpu_encoder_get_topology(
 		topology.num_intf = 1;
 	}
 
+	/*
+	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
+	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
+	 * earlier.
+	 */
+	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
+		struct drm_framebuffer *fb;
+
+		fb = conn_state->writeback_job->fb;
+
+		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
+			topology.needs_cdm = true;
+	} else if (disp_info->intf_type == INTF_DP) {
+		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], mode))
+			topology.needs_cdm = true;
+	}
+
 	return topology;
 }
 
@@ -743,9 +763,7 @@ static int dpu_encoder_virt_atomic_check(
 	struct dpu_kms *dpu_kms;
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
-	struct msm_display_info *disp_info;
 	struct dpu_global_state *global_state;
-	struct drm_framebuffer *fb;
 	struct drm_dsc_config *dsc;
 	int ret = 0;
 
@@ -759,7 +777,6 @@ static int dpu_encoder_virt_atomic_check(
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
 	priv = drm_enc->dev->dev_private;
-	disp_info = &dpu_enc->disp_info;
 	dpu_kms = to_dpu_kms(priv->kms);
 	adj_mode = &crtc_state->adjusted_mode;
 	global_state = dpu_kms_get_global_state(crtc_state->state);
@@ -770,22 +787,8 @@ static int dpu_encoder_virt_atomic_check(
 
 	dsc = dpu_encoder_get_dsc_config(drm_enc);
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
-
-	/*
-	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
-	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
-	 * earlier.
-	 */
-	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
-		fb = conn_state->writeback_job->fb;
-
-		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
-			topology.needs_cdm = true;
-	} else if (disp_info->intf_type == INTF_DP) {
-		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
-			topology.needs_cdm = true;
-	}
+	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, conn_state,
+					    dsc);
 
 	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
 		crtc_state->mode_changed = true;

-- 
2.39.5


