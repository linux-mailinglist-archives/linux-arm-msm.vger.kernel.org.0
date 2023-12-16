Return-Path: <linux-arm-msm+bounces-5086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A1C815CA4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 00:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABBBC1C20F44
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Dec 2023 23:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F11533CE5;
	Sat, 16 Dec 2023 23:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VKxofzWf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8F2321B7
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Dec 2023 23:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e2ce4fb22so636582e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Dec 2023 15:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702771152; x=1703375952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EORJjch+kRHuve9tu+TzRixoDnkZ1DPCxZXBpooX2uA=;
        b=VKxofzWfIExeso+h/hYfK5UheL/nS3AXuoKeRyi7ck+f/iiQP3utCXSME3KQV5nTgq
         aaDcfWiqgUbteyRYCeX60IzD5OyeMyHFIbtGE3DplyTDxSCmfUWld74B3iYX4GfpS6vm
         a2K1o/QvhotEmEBq+qAHen1ho/IRRpzE18NMFA590mMFC5Wtbj0kYgEeRuWaZUQ9wTpK
         9aP64T8NfxU5YxtdVNQ89W5B3uNYP0xQhSOp/3GF4/hFDyauQtKvA13K9rZ50/pMwFJZ
         4rTJN46md0/vZstNWdkGi91iwfjtwgGsn8ZoKRzt6mHgS8jZkaaF60RyJPfIvmkd/fcV
         FmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702771152; x=1703375952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EORJjch+kRHuve9tu+TzRixoDnkZ1DPCxZXBpooX2uA=;
        b=Tbmgp5MLpKNWuvY3PWepOgYbRT+EabCFuKjJDtUFy36jim3v/wE52Ly+P4fcnEN9Bi
         CCuxBrlhy6iXfscK0kZbN3Po2p/X/HCiFq6dBJx0Kp4AKkNFvXGJ0ElR0O3J46hcFcu4
         hPwacfg/OPtCTY2DkWymbBoxDE3h466ngRW76+bQf2IVcxsjCojtble6blQcCmwHhkdO
         x9HyrJJGJnsLwWiJz1Vy5uUUoA2TwgbFqKI1ubz5gLFigyTDFiJwoq0AxrrMchjiOi+u
         5bfKADHkNpOQ6QSAuEH4xxSnw7LTJEF+l6Odc3clnjfadyObO8Qe3NRPsXZxjRfw+M2O
         vOqg==
X-Gm-Message-State: AOJu0YxWAEzEz5XjwBpH1cwH6vEGmx513uFgTOWITOcVnZPN0DqPg58T
	BjExccoGYc6KiVPlmgk0qjNa1w==
X-Google-Smtp-Source: AGHT+IEnQkmrsNJ9hVsfbCKkIsEeu+nZ5bTu4VgzAc0L6WjUXz9o6uCxqdywfG2uf/4EhzNmoYDb+Q==
X-Received: by 2002:a05:6512:ba8:b0:50c:d30:3a05 with SMTP id b40-20020a0565120ba800b0050c0d303a05mr8894366lfv.25.1702771152155;
        Sat, 16 Dec 2023 15:59:12 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v11-20020ac2592b000000b0050bfda10057sm2506647lfi.85.2023.12.16.15.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 15:59:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH] drm/bridge: properly refcount DT nodes in aux bridge drivers
Date: Sun, 17 Dec 2023 01:59:10 +0200
Message-Id: <20231216235910.911958-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The aux-bridge and aux-hpd-bridge drivers didn't call of_node_get() on
the device nodes further used for dev->of_node and platform data. When
bridge devices are released, the reference counts are decreased,
resulting in refcount underflow / use-after-free warnings. Get
corresponding refcounts during AUX bridge allocation.

Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Fixes: 2a04739139b2 ("drm/bridge: add transparent bridge helper")
Fixes: 26f4bac3d884 ("drm/bridge: aux-hpd: Replace of_device.h with explicit include")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/aux-bridge.c     | 2 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
index 49d7c2ab1ecc..54d721db0ea6 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -57,7 +57,7 @@ int drm_aux_bridge_register(struct device *parent)
 	adev->id = ret;
 	adev->name = "aux_bridge";
 	adev->dev.parent = parent;
-	adev->dev.of_node = parent->of_node;
+	adev->dev.of_node = of_node_get(parent->of_node);
 	adev->dev.release = drm_aux_bridge_release;
 
 	ret = auxiliary_device_init(adev);
diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index 1999a053d59b..bb55f697a181 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -68,9 +68,9 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	adev->id = ret;
 	adev->name = "dp_hpd_bridge";
 	adev->dev.parent = parent;
-	adev->dev.of_node = parent->of_node;
+	adev->dev.of_node = of_node_get(parent->of_node);
 	adev->dev.release = drm_aux_hpd_bridge_release;
-	adev->dev.platform_data = np;
+	adev->dev.platform_data = of_node_get(np);
 
 	ret = auxiliary_device_init(adev);
 	if (ret) {
-- 
2.39.2


