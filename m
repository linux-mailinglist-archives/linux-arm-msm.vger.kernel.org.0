Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0B9490E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 22:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbfFQUJi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 16:09:38 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:46580 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfFQUJi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 16:09:38 -0400
Received: by mail-qk1-f194.google.com with SMTP id x18so7011499qkn.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 13:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rnuYMa6vIBfYmE14DNuXdWYP2V9cYpPN1XP5Rkgp6fA=;
        b=IpQnUzLOlbu+Z8jGufVfx562/7WbHg41yXFqDIQIi/BDind+eo4DiBrXchQ5WX0KqX
         HEyXsjSljsaXbvdxgD4jW9j8AigGx1JbUhrbQUsTZkB+qPxKxCw8ryGoMYEjnkqcLq97
         Yy53/Ir6PneTDgVfMIHrUb7XbYotmhcfaxyxeYef2LS3RXeaM2fmVjMvAl838spPVeAJ
         Eaj5KkvdmS5lsvBNwM5JYTVgP9eXdfmVI3+cgtAhMVj9+j0dskQCbI4r70QX3UwtO+Mf
         LuQqvX0Rm4FcOt0rALKeSDiy1SwjGsiBXzPSxbBlarDBruZG1U/VAwHYDmtBDMGwzxBR
         nFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rnuYMa6vIBfYmE14DNuXdWYP2V9cYpPN1XP5Rkgp6fA=;
        b=U/VUJK8ZMWgaJ8V5Ok16KcN9R5awe9dwUJeYLH6iz9qDYm8/a8fC4ZFqdHLxfL0RW7
         6/dhhhvVn6tr8gnA050IcWQD0ZWxAiBwtsjIeZXcd9qQRtLcVOelSNlWirD2XbGNvbai
         0YAp9T1uxIcqbkEAZyAugH57LjgcbmNukVSgbGPuarhO85baxAUEWeeKtMDv5xhFSbfq
         KO5u1RSHx5okUW76uZ6Yzgq+0PTQvgQCv0JzlNK48l0tYYzTMQDjRpNPk5HyS53BY3Ui
         6Gm93EsiPLvzlSYN0f/EFDnFA04cLe2ZHENKV/R56JdqEwsJRRbY8i8xJonNkcD9fz9B
         mwkg==
X-Gm-Message-State: APjAAAXCB7Qf/mFkf5Bmxk15KE1pG+0wKsMtT1H7LV9p6SbFHBLCp1DA
        MKZDkaCyVoUjtUzQahSFHULDNA==
X-Google-Smtp-Source: APXvYqzsEntNgVAPgcjag9ZN8RYTpVZ7OhVksMaCG0wgtxyD8CuLCaHM1I/CD5xcFOVbil7MXHowtw==
X-Received: by 2002:a37:4d82:: with SMTP id a124mr19092881qkb.72.1560802177050;
        Mon, 17 Jun 2019 13:09:37 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
        by smtp.gmail.com with ESMTPSA id n5sm7962291qta.29.2019.06.17.13.09.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 13:09:36 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 03/13] drm/msm/phy/dsi_phy: Set pll to NULL in case initialization fails
Date:   Mon, 17 Jun 2019 16:09:17 -0400
Message-Id: <20190617200920.133104-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190617200405.131843-1-sean@poorly.run>
References: <20190617200405.131843-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

We have if (!phy->pll) checks scattered through the driver and if
phy->pll is an error pointer, those checks will pass and bad things will
happen :(

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 1760483b247e..6491b0ceab23 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -616,10 +616,12 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		goto fail;
 
 	phy->pll = msm_dsi_pll_init(pdev, phy->cfg->type, phy->id);
-	if (IS_ERR_OR_NULL(phy->pll))
+	if (IS_ERR_OR_NULL(phy->pll)) {
 		DRM_DEV_INFO(dev,
 			"%s: pll init failed: %ld, need separate pll clk driver\n",
 			__func__, PTR_ERR(phy->pll));
+		phy->pll = NULL;
+	}
 
 	dsi_phy_disable_resource(phy);
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

