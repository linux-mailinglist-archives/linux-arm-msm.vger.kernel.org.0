Return-Path: <linux-arm-msm+bounces-16185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD5089632C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 05:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 189131F233C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 03:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C6645038;
	Wed,  3 Apr 2024 03:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LxiMRQnB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EEE3F9E9
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 03:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712115843; cv=none; b=evaBXk/3/xILvz4iz2SwAW4qngiBTZuZ95URpZhp3Cw6SaCDEzgLB4CTposYOH60Rea5QJco2ahciY5+8tSs5Ms1njYwwS6tZmSZ0eePJVM1ThGsodZL9Bpwi3GsQCDuBb0l60dqdD2WtLyEktD2rl9IOBURyNksQWddBcfjjKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712115843; c=relaxed/simple;
	bh=Jn//Iw9esRD8TM8P085ElFyT7MDokBKCt93Vkd/VJlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YAkz/CHt9O4BKu5hcr1GotgrGWO9WbjhZfB+CEQle8tmIE7HkD2syy3xRS+eUFf6o63pOItzioIojrqoiCuqnmkw3DdDkn8PDwLHDJTlYltjD0eJ4vV75mwGZe16vZZq83eJ3kaKO+gQNlVk+g06vJBM0DuI7XrbnWjRhy6WYhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LxiMRQnB; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516a97b3139so2900194e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 20:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712115839; x=1712720639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=04Dqjw56oztOKjOx6AEdYJc7ELzz7GKlpOl6o5T2ns4=;
        b=LxiMRQnBMaywKtV7TuNklYs5XdBi1Dwe/JnlYhxkVvSmBuUg2A2zB8exXoH7o7f0Pr
         0pChjT87n2H0Q+Urml9ENvVPLS8e/zZOrv58b/fHyr4Vz/JDeqWAdyiAXdby8jMcuEkg
         iF1q4t8tC8HGhEcZSRBW6d5zkyhDH/dtgERj6oLs+qo3OOoB77pfACOmVW1RHSxxMxOn
         x6zAyrOvsSeonpO/eOeZ66O2YSTShZ3AbIZcxARMtI/md6E+9ZBGyCLm6m7I7UxUmmXT
         70pUYRyJiHN+cKL/t2Kdog0TPsgPfzYxiqM6ESOk42oB0hL+6RokYbR8llnFQSWoWq4d
         kP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712115839; x=1712720639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04Dqjw56oztOKjOx6AEdYJc7ELzz7GKlpOl6o5T2ns4=;
        b=HepH6Ba+D5tQejZkI9EaKFM8kNzgYdZ8/+c3HUqONPGTR3D9LUgIzDWW7avPMbfoby
         ipZDCMi/vKVknIfCn8YaCEAcaoFHOLnnpzuV+Y9QCp9OkdfUxnKbiyBGG1Timg0q4z8Y
         ptAZmJNR/1NBIDaSsV7Nvx8AajMmozmsyoKDNwdYuaS3uMnYvSjHHNDr3jhZfEz4d1qM
         C8bra/pFlIj26xLgJA0wkd44pKPNY1PDQqivTJDBelAgK4lPyqtOiJzJfPj/AC9IqGdU
         9wG0LQntHCjlrxcYh9orx4la+iF2QzFGzGOiXCc+88Ta7tr2GFJKREcEG2GIViNVB3+R
         eHrw==
X-Forwarded-Encrypted: i=1; AJvYcCXoDbsdAlCdjTHNW9EULJqJYJnM6M9s91uPDpOcRxI9++CgxINQC/9IZZuzgDij1kTP3kqCnhSK4j9hh7mxtsX/Kh0uUaQqTkJs0wFyDA==
X-Gm-Message-State: AOJu0YyziLKkDH3/GErQWDfun9qkxDm0VylIKdxaPb0D1vym51rljkro
	SKOVKny0RbzxkMRG620R1M1B5w8BvAjheumJofZufjXZJOJzBG8ssltHexTMpNU=
X-Google-Smtp-Source: AGHT+IGWjIDbSyZJRqOkpGhZlooCe5NnYBuMRUeV2c5yMblMFkTUU4HlaVfv4n7ziLPnEJUP7Eo/zw==
X-Received: by 2002:a19:e00c:0:b0:516:9fd3:3c1d with SMTP id x12-20020a19e00c000000b005169fd33c1dmr929600lfg.0.1712115838864;
        Tue, 02 Apr 2024 20:43:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id br31-20020a056512401f00b00516a69b1dcbsm940985lfb.78.2024.04.02.20.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:43:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 03 Apr 2024 06:43:56 +0300
Subject: [PATCH v4 2/4] drm/mipi-dsi: use correct return type for the DSC
 functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-lg-sw43408-panel-v4-2-a386d5d3b0c6@linaro.org>
References: <20240403-lg-sw43408-panel-v4-0-a386d5d3b0c6@linaro.org>
In-Reply-To: <20240403-lg-sw43408-panel-v4-0-a386d5d3b0c6@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2601;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Jn//Iw9esRD8TM8P085ElFyT7MDokBKCt93Vkd/VJlo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmDNB7Bhmcj7xfEHeWJ0WZ4DiWndh5iFgjKTlwL
 wA+mXe8wL6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgzQewAKCRCLPIo+Aiko
 1cd9B/9+3SNd6QlJrt7Tyd0MDnt29gkictOc8nxcAOr3RPy53ENCneJWdxUygrws2cN9w7XqBM3
 PM4hzCvu0MbrQchwX+azhxlLAG4ImRHLqB0IUTpmqiCPFTQJlKHOPCCrTu1edMziS8zCA3iTV7z
 /3zJvtKy+QapVf9Q5Xzynz21TLGlmfbd/UVLj/Vx7rJUWqsKUgN/FHgn2MxPfHahO2xZIrhUdgV
 1+I2rAI3iKic+h2Jn/Wv9S1o91VmNa5PahaFrYPpE2oT+ZRyaJVQx0F1XhC8a4w99M9xxbBMR0G
 C/bPyJT8e/r9CQfNQlI00cUia1aY7YLaAti0LV1LTaG8QcX7
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The functions mipi_dsi_compression_mode() and
mipi_dsi_picture_parameter_set() return 0-or-error rather than a buffer
size. Follow example of other similar MIPI DSI functions and use int
return type instead of size_t.

Fixes: f4dea1aaa9a1 ("drm/dsi: add helpers for DSI compression mode and PPS packets")
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 6 +++---
 include/drm/drm_mipi_dsi.h     | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index ef6e416522f8..9874ff6d4718 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -654,7 +654,7 @@ EXPORT_SYMBOL(mipi_dsi_set_maximum_return_packet_size);
  *
  * Return: 0 on success or a negative error code on failure.
  */
-ssize_t mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
+int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
 {
 	/* Note: Needs updating for non-default PPS or algorithm */
 	u8 tx[2] = { enable << 0, 0 };
@@ -679,8 +679,8 @@ EXPORT_SYMBOL(mipi_dsi_compression_mode);
  *
  * Return: 0 on success or a negative error code on failure.
  */
-ssize_t mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
-				       const struct drm_dsc_picture_parameter_set *pps)
+int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
+				   const struct drm_dsc_picture_parameter_set *pps)
 {
 	struct mipi_dsi_msg msg = {
 		.channel = dsi->channel,
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index c0aec0d4d664..3011d33eccbd 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -241,9 +241,9 @@ int mipi_dsi_shutdown_peripheral(struct mipi_dsi_device *dsi);
 int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi);
 int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
 					    u16 value);
-ssize_t mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
-ssize_t mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
-				       const struct drm_dsc_picture_parameter_set *pps);
+int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
+int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
+				   const struct drm_dsc_picture_parameter_set *pps);
 
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);

-- 
2.39.2


