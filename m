Return-Path: <linux-arm-msm+bounces-21023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB16A8D41C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 01:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73344286F84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 23:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61581CB33A;
	Wed, 29 May 2024 23:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eTLttC16"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38771CB327
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 23:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717024352; cv=none; b=F2/5IRrHkV2oX02jaThcfGwR5dsYv5MPMrH5KMqc7CcL/hjAzNf4okvGMVdrRCKacxLl4FS8J3cbLZBSXdMONyXZkIlDMyJr9VCyTL1SseOgX8zE6BsLh2uPaFKF3UEKRDg4jB7Omq4+w4pSccLFNV2/VxtQV+8uXY69GhwmmeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717024352; c=relaxed/simple;
	bh=AXQkgT8bLCi+J4VLmDhYURPEkLAsLkNbwsYyTx65pa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mvhZX3jl46NECLQ1VdpEIGEhqvc0vmFiIqlYtJLSdW6AL2CjDUCBiwDusCPElMe6Cqb5UOGfkL5UQbfDeNTb85CHQWT4kNeZw96nSv6JjlPk2Hmw0eCnXvn6HaMY2o1R+g15Ft6osr9oLe4H6WC+9o9OS6sFmsyO7AfsI2WAtG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eTLttC16; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52b7b4812f3so238489e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 16:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717024349; x=1717629149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xsWyvZJ7smsYEwcJt3QXuB4RboSifhUzN4Y/+3fVgYs=;
        b=eTLttC16EBJNdIPG8cKd8aFAxJ9jmVxdKclGbafYQDAaSoMg0NVCqX2mfh44boeNZF
         QUG14PaoC4iiqZh/2IzzdqXvAeQAgHHH8HtZFcuDIhbPwGsUCbQkSXSuvdC66CrL+iiA
         kREjxD8MFngJtK7YLjWmbirZOc0R7XUtwfxoh8utRE1yfFBDnnlWsdN7RsabXg+uN5Xt
         ywjjTj4PG04UQOkUEtgJQ2l90beZRr4L6fK6qIvg22BLK2KmV8rLJ3mOZXDuBS/TxVxx
         80JvYGn5kZIUlIY1jApa4Zj5ee6vJJ9sGKqvcTLfriIphaUmfecIVt+tlKT8kcdsS121
         ABrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717024349; x=1717629149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsWyvZJ7smsYEwcJt3QXuB4RboSifhUzN4Y/+3fVgYs=;
        b=RcpYvyY2UAMmYq6Su+TYXSmMqo2whxlvrSo0xdnwM2LsU5TgNCM2/EAW4LrDbDDmRV
         yYXUzqAevnqZeSL9tTta1d2gv9wCc/QwKgveeFKTX4YDY2iWglzBqyGwy7XixNpnw8Bl
         O7Ks0HQ+pP+SNfjaXKnIszbfQZSEIrmoNDQwcuICWGKYHMaqZjpCouEIZxIFK/SUjsX3
         KBForx5BuXaBZw86wYGsITXps+y+DkKYjIfonUGGMZ4aqDOZc6LNqI+dbjQmMG8i22B6
         oQDhuIgjqutqQi6qCrC4zf9zWNU46dIegFCXi9PvS1q6EcbYBks73YfQ20iJtscZHcHZ
         Ohpg==
X-Forwarded-Encrypted: i=1; AJvYcCUtMSesqIy7kRCfeuhJr5LUYkJ2A15yPPcZ1ZmlQBWsfxnnVI8oQfThhQM0euGDjLzQ5VrAmR2jddJihCxkNXsAXK1QPO0bg+mR/U7+1w==
X-Gm-Message-State: AOJu0YxqpZhFjTWIIYQpGxOxA3Z+AmBlT5ObJ7hrLlu+6s1L4etDyaVQ
	sy+9DKUUSEJskiGUJkL3k1DPjnI87q622cYFVS5K817MpTMrTHqlo168U9WAxh4=
X-Google-Smtp-Source: AGHT+IGR2g9tEjUHRz3sWSg0237KZd0prRiZw5CS2OF0JFp0DTVGONPL8fJFqcllAiRPCR5tE1g7iQ==
X-Received: by 2002:ac2:41cb:0:b0:51e:e5cf:9940 with SMTP id 2adb3069b0e04-52b7e0ee8b0mr63089e87.4.1717024348995;
        Wed, 29 May 2024 16:12:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529acea1ea8sm1015998e87.276.2024.05.29.16.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 16:12:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 02:12:24 +0300
Subject: [PATCH v3 1/7] drm/connector: hdmi: accept NULL for Audio
 Infoframe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-bridge-hdmi-connector-v3-1-a1d184d68fe3@linaro.org>
References: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
In-Reply-To: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1693;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AXQkgT8bLCi+J4VLmDhYURPEkLAsLkNbwsYyTx65pa0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmV7ZadQQ/u477cay7r64S0rsMMdpYg2c8F9bsk
 HP74y9RpWGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZle2WgAKCRCLPIo+Aiko
 1Xz/CACBG8J88iFv44gK5ywM44/nLwAiT0D+h+PopLWugWuGXC0yuvOQ7sSZ/TiE8fpiOzXNghn
 LqQShLj2piBG17rpD08ku2ULumRjKSuGcbAMUkWy7Vr2hEKxIrHv48HEWd4jkWGWw2JtHE1QZR0
 q9ai2atyG3KlWWGVlIEgBSayjXD83ULC38kztI/L6E3YaG7aIITrdW9NfyoSKb0mRuJzLOIwdcj
 K2Q5n8BtQ0jKRJYqInW7Kx4EXVbYwOy160ewSLGEwZBTd0ka7ZcG4UBpIKZt51O2Aq6cpxhN4R7
 U8bkuwdlyNpvpdu4AunLtBCfChGuVdAAJb0UFFgN6lErZjPS
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Allow passing NULL as audio infoframe as a way to disable Audio
Infoframe generation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index ce96837eea65..5356723d21f5 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -681,7 +681,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_infoframes);
 /**
  * drm_atomic_helper_connector_hdmi_update_audio_infoframe - Update the Audio Infoframe
  * @connector: A pointer to the HDMI connector
- * @frame: A pointer to the audio infoframe to write
+ * @frame: A pointer to the audio infoframe to write or NULL to disable sending the frame
  *
  * This function is meant for HDMI connector drivers to update their
  * audio infoframe. It will typically be used in one of the ALSA hooks
@@ -704,10 +704,16 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 
 	mutex_lock(&connector->hdmi.infoframes.lock);
 
-	memcpy(&infoframe->data, frame, sizeof(infoframe->data));
-	infoframe->set = true;
+	if (frame) {
+		memcpy(&infoframe->data, frame, sizeof(infoframe->data));
+		infoframe->set = true;
+
+		ret = write_infoframe(connector, infoframe);
+	} else {
+		infoframe->set = false;
 
-	ret = write_infoframe(connector, infoframe);
+		ret = clear_infoframe(connector, infoframe);
+	}
 
 	mutex_unlock(&connector->hdmi.infoframes.lock);
 

-- 
2.39.2


