Return-Path: <linux-arm-msm+bounces-15893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 118EE8935E8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 22:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 791CDB21BCA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 20:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8BC14534F;
	Sun, 31 Mar 2024 20:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e0hcGdwP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C3C26AE1
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Mar 2024 20:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711917953; cv=none; b=MKh/rBHtDYlEyqOw1P+gJ5cHxFmolAcOux/5Vgas0+Fq7fTypxUvN/N3IQsl4VqJ/aAHn+kQIp4qilqbQ00J7SzYymH1ZZre8X5X3FCio4g7+WwS79F3Ark/gji/xihwCN42i7n2RSDOv4xIU6RmSZIfL/scXLeu0Cx+CaOxp/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711917953; c=relaxed/simple;
	bh=WxrAGCcX9y1DQjbk7j8vNeh8QM9ep0NwfvNj5+enTf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JM2UON1NgBTmefOX9RS69IXh55/Rc97DRgKkwnC8ei96iMLCzxZbWH9fvJhA63MBJdbrw2Ej+3znQTUEqZMTgF1bavN94G60Zfy9BqoSYO5BckseuadEILl/ifptSHIh7AIUFGyk+of44oK0ZLdc+k95+7/2u4tsMuDiaVpIlaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e0hcGdwP; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d48d75ab70so49909891fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Mar 2024 13:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711917950; x=1712522750; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1twafGTjkCxgep99iHCP909BFtwNP/9s0Y+i/DCt0V4=;
        b=e0hcGdwPgDrW1eEQN2d3mn8y7vZqJa6Q+90z3EhkzdxS882V7PjNf4oX77lYiRjio4
         nlyx/iU9QrOEeaqkVlz6jDvnasHZYQBdVRd+8c8guprIX3QtuoSLwnluDj5/G85rbzXr
         5uAsME7Q65BgDhdnsPnOEeWLNckuS4Whok99JZJgTG4W6HYrc9NDE6otc7vHyhy19an5
         LSUHllWkHci4Lja6ZgiT/2R1iwAms80DChW8bnMTXLWH7Hr6rdOClQFFpwnqJqFubF3e
         F6ENgWbbEmCkv4wj93KF2AnbVNgduEkOTXSVg/55Ub2AoFFcBHmooW4F9ZIHrbq3eMDW
         1TDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711917950; x=1712522750;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1twafGTjkCxgep99iHCP909BFtwNP/9s0Y+i/DCt0V4=;
        b=I/xXNTQ6Vb8VXFFjzHGtalkJw10bTjpnvsbITzoPq9Jj7tPW+5hhM1Qs6Dm8xBd3Pc
         +UX8vbMelaEXs511rmGQirjEqsPatWapKsKAHcfU6qJhkUUxO6tiDXaTGbYQ7vd4JH2+
         KvKziN38BiaZJvmWE53ankEJe8UHLa+fc+C8Zheh6J0p0JCKvvVwpGhoFHl+tQaiR2Iv
         78U3sD2DZ3uctZEQjXjZlbA5l8wkv8lcq3Wj5PTMAl/FMX5Y0gDIly+JtLlDtMaHP2tp
         7vE3wl31TAma84Gll94YWnJAZ0BWM4qC9ycsVs1OtpLC+x2sR3xKsF6yiL0umMgCXiQw
         B8vg==
X-Forwarded-Encrypted: i=1; AJvYcCXN7pLJj1D1CNtiP3b/M64/aEeugP1laTk5xztn9VxIRdPwbbyLXfpLN13YhqgcBV1t9xs0wd8Ms/9Ksa8uKgFW0lquLM6a3tDewSUm0w==
X-Gm-Message-State: AOJu0Yx3naVeNOtQocOuaemD29WEeuY2AtKwhSlqaQoCH1WtN9gRdYiv
	7BgE2gcH9TobAwZYPuC32+6xLrYadFmKwAtA/aEwL5wc88YpJ733y0etewfNJ0TA4lUiN+1/bxA
	7
X-Google-Smtp-Source: AGHT+IGlgUpLxGZ4IMDU22PvHtUiUcw9q544xvbLVNB/NIOVdBQC05kVxrUPyAPTwFbgqpUnP6n0mg==
X-Received: by 2002:a05:6512:2395:b0:516:a148:2f2 with SMTP id c21-20020a056512239500b00516a14802f2mr3343912lfv.38.1711917949956;
        Sun, 31 Mar 2024 13:45:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x21-20020a056512047500b00515cf449059sm907445lfd.166.2024.03.31.13.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 13:45:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:45:48 +0300
Subject: [PATCH v2] drm/bridge: adv7511: make it honour next bridge in DT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-adv7511-next-bridge-v2-1-7356d61dc7b2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHvLCWYC/32NSw7CMAxEr1J5TVCcNvxW3AN1kRC3tYQS5FRRU
 dW7E3oAlm8082aFTMKU4dasIFQ4c4oVzKGB5+TiSIpDZTDadLrVV+VCOVtEFWmZlRcOtYI6XLw
 nbbuOoC7fQgMvu/XRV544z0k++0nBX/rfV1ChCuiCNYaGk2nvL45O0jHJCP22bV+Hzav+twAAA
 A==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2494;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WxrAGCcX9y1DQjbk7j8vNeh8QM9ep0NwfvNj5+enTf0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxrn6do86d0p16N2qpopXnc5PcnV94P2+5/VXR+jtq/ep
 Sz4X92mk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT8fjJ/j/69wF9i7UnthZX
 ORmXdDguv5Em8enOwsneDRms5TUx90TvZS3b72olc/XTc2cTkZ6eaeHVlXqsRzbcnvhT935W1aI
 1GoLZld5KLPyRQZl7kzMYJfx9uXP//RGQazogdvmmU9OHqRveOl2YkRXoorBmz64yzh/cmz0CGe
 P4GKI3b9cTUmecuPqIjdW7PuvNApExZybvU204IKYnGGTvE1rhY9v09JipR5u2Pkt715obbJPen
 b/zLKdSNfl/Q97CvZEsBhHPvrKLTqsPrrZXD9h5XyVY5u19V6Yc9skbzqfJy784xDzvvfvneIns
 jfZ+81K37Fo4/2Wxofw179zn1inHDcIS9nMEHsz82ZoNAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

DT bindings for adv7511 and adv7533 bridges specify HDMI output to be
present at the port@1. This allows board DT to add e.g. HDMI connector
nodes or any other next chained bridge. Make adv7511 driver discover
that bridge and attach it to the chain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Fixed the absent next bridge usecase
- Link to v1: https://lore.kernel.org/r/20240309-adv7511-next-bridge-v1-1-d1ad522ef623@linaro.org
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index 39c9ece373b0..ea271f62b214 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -356,6 +356,7 @@ struct adv7511 {
 	enum drm_connector_status status;
 	bool powered;
 
+	struct drm_bridge *next_bridge;
 	struct drm_display_mode curr_mode;
 
 	unsigned int f_tmds;
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index b5518ff97165..c50d994a33b5 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -17,6 +17,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -946,6 +947,12 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 	int ret = 0;
 
+	if (adv->next_bridge) {
+		ret = drm_bridge_attach(bridge->encoder, adv->next_bridge, bridge, flags);
+		if (ret)
+			return ret;
+	}
+
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
 		ret = adv7511_connector_init(adv);
 		if (ret < 0)
@@ -1216,6 +1223,11 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	memset(&link_config, 0, sizeof(link_config));
 
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, NULL,
+					  &adv7511->next_bridge);
+	if (ret && ret != -ENODEV)
+		return ret;
+
 	if (adv7511->info->link_config)
 		ret = adv7511_parse_dt(dev->of_node, &link_config);
 	else

---
base-commit: 1843e16d2df9d98427ef8045589571749d627cf7
change-id: 20240309-adv7511-next-bridge-10d8bbe0544e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


