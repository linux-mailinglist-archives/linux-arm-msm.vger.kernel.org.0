Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB0E3BC406
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 01:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhGEXUF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jul 2021 19:20:05 -0400
Received: from [94.230.151.217] ([94.230.151.217]:58586 "EHLO ixit.cz"
        rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S229709AbhGEXUF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jul 2021 19:20:05 -0400
Received: from newone.lan (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 0884923B1D;
        Tue,  6 Jul 2021 01:17:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1625527046;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=gyk7kasrAQJkpeGFr1uadWuuonZtZWAWX9oovWBerbs=;
        b=SiS6KmMiRUCT3z3hdouKAh4DKn4O+04IqhsYkbmLlEb5VJ4BsognyFfm3SZyppG8oljT/e
        2cS5eqfdV25B6ZAI0r7Q1FGrbwjlaDhJMSOSyzcyLjGRWuB4CdgUolq7Egk0wd17s2TmZw
        vAk24oDNJVCEQMbhlnVEornbvhcSJXc=
From:   David Heidelberg <david@ixit.cz>
To:     Jonathan Marek <jonathan@marek.ca>,
        robdclark <robdclark@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH 1/2] drm/msm/mdp4: refactor HW revision detection into read_mdp_hw_revision
Date:   Tue,  6 Jul 2021 01:16:40 +0200
Message-Id: <20210705231641.315804-1-david@ixit.cz>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Inspired by MDP5 code.
Also use DRM_DEV_INFO for MDP version as MDP5 does.

Cosmetic change: uint32_t -> u32 - checkpatch suggestion.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 ++++++++++++++++--------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 4a5b518288b0..3a7a01d801aa 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -19,20 +19,13 @@ static int mdp4_hw_init(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct drm_device *dev = mdp4_kms->dev;
-	uint32_t version, major, minor, dmap_cfg, vg_cfg;
+	u32 major, minor, dmap_cfg, vg_cfg;
 	unsigned long clk;
 	int ret = 0;
 
 	pm_runtime_get_sync(dev->dev);
 
-	mdp4_enable(mdp4_kms);
-	version = mdp4_read(mdp4_kms, REG_MDP4_VERSION);
-	mdp4_disable(mdp4_kms);
-
-	major = FIELD(version, MDP4_VERSION_MAJOR);
-	minor = FIELD(version, MDP4_VERSION_MINOR);
-
-	DBG("found MDP4 version v%d.%d", major, minor);
+	read_mdp_hw_revision(mdp4_kms, &major, &minor);
 
 	if (major != 4) {
 		DRM_DEV_ERROR(dev->dev, "unexpected MDP version: v%d.%d\n",
@@ -411,6 +404,22 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
 	return ret;
 }
 
+static void read_mdp_hw_revision(struct mdp4_kms *mdp4_kms,
+				 u32 *major, u32 *minor)
+{
+	struct drm_device *dev = mdp4_kms->dev;
+	u32 version;
+
+	mdp4_enable(mdp4_kms);
+	version = mdp4_read(mdp4_kms, REG_MDP4_VERSION);
+	mdp4_disable(mdp4_kms);
+
+	*major = FIELD(version, MDP4_VERSION_MAJOR);
+	*minor = FIELD(version, MDP4_VERSION_MINOR);
+
+	DRM_DEV_INFO(dev->dev, "MDP4 version v%d.%d", *major, *minor);
+}
+
 struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
-- 
2.30.2

