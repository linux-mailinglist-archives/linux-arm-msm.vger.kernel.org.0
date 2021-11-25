Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF18945E066
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 19:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233355AbhKYSKm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 13:10:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232053AbhKYSIl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 13:08:41 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09A1C0613B6
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 10:01:19 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id j18so795636ljc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 10:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ynwG4NbHg4X5JMdO8pH96G9Wv988uerBIA+nf4r1wKk=;
        b=Lf9RQccj7htjEysn7T/OVOaVJzbpsW5S+bTEFkAP0QG/9NWtATiBqZrMDO/IiR015F
         9i0miGLPORiRxK99o9gKSdN0im3lgDvA9hQ3kGBEblbqVFCWpi9w+jDdO22YRbpCMosf
         OTixRIJi6ToshrNj1rvzy1hSXJpxD9wSIadcjsInu2GTW8U4zDwRFQNtAFGcRMCD9jx4
         ZffKjpWyHfPcNmtX2WzNT+f8DRpuSzwyoeLc0yq0ioZCrllK5V9+1MK7HG8CJ0mzxShU
         O2F/4pHshsN46wIgpjuJT3Wya0Wzc+OzaorXI6FnlQhZIsR081WQwhppgmC5AcZ9vMMD
         89ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ynwG4NbHg4X5JMdO8pH96G9Wv988uerBIA+nf4r1wKk=;
        b=SmF2wZGZvRT+b32CdmuxRGSY3sY7xmwZzAyAKAQ6/Scays91skaAnlp+4fot5mUv3o
         cAUxZzVBuzBV1ACSeAyRKqaG1km3W8cNAmyiIe8OOK/bIidP9UGgREJ7gmR69JcYDIqI
         kWBiG61POF8QrcG/vJlGwXMRp25lfKBwvA/PHtmnOKguIppMml3ScAzirna/pZqLoCeu
         cK7oLy6yj6KGWP3BgkNkNiX3BxMxjsbwpI2WKKhIrLW39aJoIjnvpbhsH+WSMJJxjkl3
         o7jj3ivM+o4uRlbyOXYNisD+0Suf6qebzOsaUBJZLVNkwQufs68ikg8/h6X5pTgQhcmY
         1RiA==
X-Gm-Message-State: AOAM531POtw8h/SJuqgvBoDQAuZPdlb1AxxfT5LkeujiwoRoEk+Ql4m8
        V4vwcqBH1cN9HJwuip9t8l6GtyQxRG8pTw==
X-Google-Smtp-Source: ABdhPJw33JWXItJy2u8lGIRYrValQuMuKOHbanYZyU2Kqt/vDbH8kCiuWvbT+NbEk54d3pP73ShV0Q==
X-Received: by 2002:a2e:9b4f:: with SMTP id o15mr17933127ljj.105.1637863276829;
        Thu, 25 Nov 2021 10:01:16 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l20sm318194lfj.36.2021.11.25.10.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 10:01:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi: fix initialization in the bonded DSI case
Date:   Thu, 25 Nov 2021 21:01:14 +0300
Message-Id: <20211125180114.561278-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit 739b4e7756d3 ("drm/msm/dsi: Fix an error code in
msm_dsi_modeset_init()") changed msm_dsi_modeset_init() to return an
error code in case msm_dsi_manager_validate_current_config() returns
false. However this is not an error case, but a slave DSI of the bonded
DSI link. In this case msm_dsi_modeset_init() should return 0, but just
skip connector and bridge initialization.

To reduce possible confusion, drop the
msm_dsi_manager_validate_current_config() function, and specif 'bonded
&& !master' condition directly in the msm_dsi_modeset_init().

Fixes: 739b4e7756d3 ("drm/msm/dsi: Fix an error code in msm_dsi_modeset_init()")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         | 10 +++++++---
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 -
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 17 -----------------
 3 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 75ae3008b68f..fc280cc43494 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -215,9 +215,13 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 		goto fail;
 	}
 
-	if (!msm_dsi_manager_validate_current_config(msm_dsi->id)) {
-		ret = -EINVAL;
-		goto fail;
+	if (msm_dsi_is_bonded_dsi(msm_dsi) &&
+	    !msm_dsi_is_master_dsi(msm_dsi)) {
+		/*
+		 * Do not return an eror here,
+		 * Just skip creating encoder/connector for the slave-DSI.
+		 */
+		return 0;
 	}
 
 	msm_dsi->encoder = encoder;
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 66443dc98500..ef8212990254 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -82,7 +82,6 @@ int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
 bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
-bool msm_dsi_manager_validate_current_config(u8 id);
 void msm_dsi_manager_tpg_enable(void);
 
 /* msm dsi */
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index a152dbf63038..a73cfeb93e90 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -645,23 +645,6 @@ struct drm_connector *msm_dsi_manager_connector_init(u8 id)
 	return ERR_PTR(ret);
 }
 
-bool msm_dsi_manager_validate_current_config(u8 id)
-{
-	bool is_bonded_dsi = IS_BONDED_DSI();
-
-	/*
-	 * For bonded DSI, we only have one drm panel. For this
-	 * use case, we register only one bridge/connector.
-	 * Skip bridge/connector initialisation if it is
-	 * slave-DSI for bonded DSI configuration.
-	 */
-	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id)) {
-		DBG("Skip bridge registration for slave DSI->id: %d\n", id);
-		return false;
-	}
-	return true;
-}
-
 /* initialize bridge */
 struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
 {
-- 
2.33.0

