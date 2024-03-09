Return-Path: <linux-arm-msm+bounces-13762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ACB8771F5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 16:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 512A9281A99
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 15:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C534437B;
	Sat,  9 Mar 2024 15:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JpYRtpRv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AD8446A1
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Mar 2024 15:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709998430; cv=none; b=H2uL9KD/wpgjesUW1/8CaFys/hXbg3WFMpU+URwNahNIXnLClFjDrlUzTOC30cqIkR0B+sLwsJZ2CD0h8lzACxyrdzKY95Lbm2Dsoqj5/4dxMBOMgcG94BpdHPfgNczGIchXMKtWWuNDKgPbFbSsjA9AFFR6ucLNhRtQgmOBGQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709998430; c=relaxed/simple;
	bh=4mGzFypORTGynrg8wYpr5ut5p6/LXbQy8IXBkSAmpaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O9LdeYS71zVQVmXqxzJvjW0bLL2r7YIKvprpjbYWcb25/oNDtM8Sml190BloLxBDKd0Tm1iVGnPA50YfAcSPQVLHNnu/zEiUipJRTZuSYKvA10x5gt4VOeHPaHV5Ky/guZalWDV0Qvr9lXwetGtw88dv4RonVRPm+nJHaieMiqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JpYRtpRv; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d4141c4438so38778251fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Mar 2024 07:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709998427; x=1710603227; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CTlALryim3QK0d1L28afhZUYtA/fjW4K8fRVAF6+04g=;
        b=JpYRtpRvR4w44OCPEUIqGjrrmhmacBhSszlwL6b8QpLgphq5oi8fgfMZ8aIMCeFJF+
         SehQYlnsavA30JrmdQYK3A7gVZQHyySj7ch4329BoYlcBduClJIqS20LXHAknR0w5+R4
         mbWFoPWwhjvnOI+f2VEoR3RFgyFL5Tqymx1kfuvpArWwt+Gep894OoA9D7Dge8JtV0Sk
         Kk1KMSBAuxZcPTUgVDMK6COJ9XKuO2f7grpOpflBEHHs5jwVq3GeVb8sUVPQj1c5SA3m
         4I0lNIm7FghhxsWMM1JFLHXZHVn0uq6XNno9N0vIM9hrjEwPm8yeJ08rcq07YUIAjhWG
         wkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709998427; x=1710603227;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTlALryim3QK0d1L28afhZUYtA/fjW4K8fRVAF6+04g=;
        b=TJyu/mzj8DUAs4VSOQK6Uw2xaGY3ChbfsIzrFW14iDMCyJCppp6xVm/oktTJssqCgQ
         0Bjl2thtsZ8/K+/CQOe1SJNJo8jjBencqVXEvF2Zf0LgV3McnonWft+ucRNMMsOA//DV
         FMDK9m3UmQR1ou0VgGRDu5BhPu9g7qPMD0AjPk8uaG+ILThruZVjBrYaJbw6uCiR6HWd
         bql919+avILm26J0o5JwkLEr/9Js0oQjt70WDTXBjoPCKrIW4B37guIccpTLxTh2UJQU
         KQob4GmrBmOSLOO+1yQuL/y++I5blAUo2btvqRFPVFZCLoWNlcBmEKnQOb1YzPsbMuRv
         MsWg==
X-Forwarded-Encrypted: i=1; AJvYcCWhCUT40hYupztAJZabQ9sbab3siuRorm6gXEiA8kK8jtXMzuis/yuocIuwZG2KjCVoCAj7r/uso0OXO8yDq8Ucdx8uKKh9KwRPcQDYkQ==
X-Gm-Message-State: AOJu0Yxc/WD0WhlFWUkQZENmm2yQjZWwSHCG43ApGKeR8ufv9ZRGYyvV
	gwZe2l7scrV00DdgKnJ5NwjCCajbxnOCbD2imKPEzDJYUYdHri227jiwNTrx2LM=
X-Google-Smtp-Source: AGHT+IHkBXCqsyP9FqRGgLCdLZCTy32OZ64wFp0Xc/J96iuSJwesc831sZl45Etsgnv4sgp7iW4lLA==
X-Received: by 2002:a19:641e:0:b0:513:82e2:4193 with SMTP id y30-20020a19641e000000b0051382e24193mr1306982lfb.10.1709998426910;
        Sat, 09 Mar 2024 07:33:46 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h4-20020a056512350400b005133bd3a682sm344871lfs.288.2024.03.09.07.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 07:33:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 17:33:45 +0200
Subject: [PATCH] drm/bridge: adv7511: make it honour next bridge in DT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-adv7511-next-bridge-v1-1-d1ad522ef623@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFiB7GUC/x2MywqAIBAAfyX23MJqRo9fiQ6ZW+3FQkOC8N+Tj
 gMz80LkIBxhrF4InCTK6QuouoL1WPzOKK4waNKGGhpwcalrlULPz402iCuKItdby9Qaw1DKK/A
 mz3+d5pw/K0NEQmUAAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2279;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4mGzFypORTGynrg8wYpr5ut5p6/LXbQy8IXBkSAmpaA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7IFZqvt2knHzTaApZ2lBIEOS+Xf4v59+ooHbL
 d4V/ITgOI2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZeyBWQAKCRCLPIo+Aiko
 1Vr9CACzfoftJlzIOuVypRe3B4/T8YkiqcZFN0zqGmzIbXgQcZxcSXNm6ypEjOUFMCJIBIlNYwW
 NsLeduq7NUCcZcc4xuoFJ6cD2Y+RiHiBgX9s3ih1OxQ4i96WQ/JH1iSMWyLE4wDDpz5ePn+GqEc
 VZrhMaYfSA9hj4Yzjev0bVfpkqMYRfwYjUUPXDLhKwZY66SajaMPQhgaJXCV2chdT+dSnbWWVeN
 etlNyCAkYbYhOxV7lDBtoH/vdjlGq4gEVfeOxiQKV/C69+clvUwfKSCFUblzKd0X55SXBc+Y9Gy
 nZPP9FRMZ5axInSSx3ctzz4EJ7zAQ8VKG3SVTHykof6RZ4yW
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

DT bindings for adv7511 and adv7533 bridges specify HDMI output to be
present at the port@1. This allows board DT to add e.g. HDMI connector
nodes or any other next chained bridge. Make adv7511 driver discover
that bridge and attach it to the chain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

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
index b5518ff97165..4eea9e8fb603 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -17,6 +17,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -946,6 +947,10 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 	int ret = 0;
 
+	ret = drm_bridge_attach(bridge->encoder, adv->next_bridge, bridge, flags);
+	if (ret)
+		return ret;
+
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
 		ret = adv7511_connector_init(adv);
 		if (ret < 0)
@@ -1216,6 +1221,11 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	memset(&link_config, 0, sizeof(link_config));
 
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, NULL,
+					  &adv7511->next_bridge);
+	if (ret)
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


