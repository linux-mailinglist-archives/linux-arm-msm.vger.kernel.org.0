Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBEE45E5EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 16:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbfGCOBE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jul 2019 10:01:04 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:44667 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbfGCOBE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jul 2019 10:01:04 -0400
Received: by mail-qk1-f193.google.com with SMTP id p144so2751980qke.11;
        Wed, 03 Jul 2019 07:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pU+ulSQn+ZlhGldI6Scg4oHIBLfDs2QcuO3ZQ1cRwHY=;
        b=Ihp86dKNA7MEEJHwjJvi6sNNYe4VASlt7jK8NWr/vk4IOoT+8oKo6jowwy0cc0wJOx
         dpP4SmOcGyG22A364buKMVtSvKeyOKhX9PAbMZFC6yJW/Eay1fb6r3bFdoGMP0cjsM4u
         ODtJdCD0sR/Sn3Zf1xm5JbXvMNMUozI81ZUvlJY+mDRm64MMCQJYATMBm2h76T2LI6Ib
         j0R0UmKn6W4rtZQuHN08YhrG3q37U/v0wK76fVgpidbgYnxiu+0yGbCy4+hb5T0w3TEm
         uN4A8NEDE3nkfFmwIIsyZq6aREPfxWq8u769pI2LuKI4UBtp6mU5sBEOPQLCGHO5dQCz
         VVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pU+ulSQn+ZlhGldI6Scg4oHIBLfDs2QcuO3ZQ1cRwHY=;
        b=RJhKRqWFVaLGLmTy3GR0+HVR47ZFlEIa31dISuiT0RMGiUuuFpvup6442RubRqagYI
         hLO7Z5jXfFYNh7PHh9xCrjne8Uirld7LSJC0N6jG33uqC8Jozlpt06AM2RMT80iQVG2y
         gANRX4DXA84cx7MVQZlZd/wcLvBeP18p2OikWArQwwqSL2uU/SM7iOI8i2RHmKAZF2kI
         sJMlNPST0p5ucGR9FuJ+kpqAFVgtevXPX/1q7XN2Oen78fW349VrCu/TjrqGkjCHhKqp
         s/MKi1RWyOU/bj2ynEdfF8uZ0kf1lIkPE7zdEDYRCXEsbGo7ZJMHGgK7OD40xAM2HsG+
         BwpQ==
X-Gm-Message-State: APjAAAV5qtYyP7LyDEvaZvcS5wuXIx0iSn3pNQUrG8ywfgbtpm0cIuTV
        ZSStG0HJ0q6ZaSythpswH08=
X-Google-Smtp-Source: APXvYqw69wTmSRidwjuI0ULggx0yzPo/UQ16JgPUj0BHwSZYN571l1o3ZGv9uNg8v/sZRZ4QHk9J/g==
X-Received: by 2002:a37:8145:: with SMTP id c66mr29785590qkd.459.1562162463060;
        Wed, 03 Jul 2019 07:01:03 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id e8sm917213qkn.95.2019.07.03.07.01.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 07:01:02 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/a6xx: add missing MODULE_FIRMWARE()
Date:   Wed,  3 Jul 2019 07:00:35 -0700
Message-Id: <20190703140055.26300-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

For platforms that require the "zap shader" to take the GPU out of
secure mode at boot, we also need the zap fw to end up in the initrd.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index d9ac8c4cd866..aa64514afd5c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -174,6 +174,10 @@ MODULE_FIRMWARE("qcom/a530_zap.b01");
 MODULE_FIRMWARE("qcom/a530_zap.b02");
 MODULE_FIRMWARE("qcom/a630_sqe.fw");
 MODULE_FIRMWARE("qcom/a630_gmu.bin");
+MODULE_FIRMWARE("qcom/a630_zap.mdt");
+MODULE_FIRMWARE("qcom/a630_zap.b00");
+MODULE_FIRMWARE("qcom/a630_zap.b01");
+MODULE_FIRMWARE("qcom/a630_zap.b02");
 
 static inline bool _rev_match(uint8_t entry, uint8_t id)
 {
-- 
2.20.1

