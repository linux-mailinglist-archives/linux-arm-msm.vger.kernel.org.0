Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1952138805
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2020 20:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387396AbgALTyW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Jan 2020 14:54:22 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41586 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732957AbgALTyU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Jan 2020 14:54:20 -0500
Received: by mail-pf1-f195.google.com with SMTP id w62so3819838pfw.8;
        Sun, 12 Jan 2020 11:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WSVqYNJUUS8Cz3ud3WlLWDQz1ieCxDDqWx8hZG4FPuM=;
        b=hlMWNnStz5gAnwaf/V6EMtEo7MjCQteKxKAJZfSQAPcf5p9JvFf3n1xjwJfXsd48yT
         pkLov7ZLYKS36FOc85Qrcls0iFvaiGGwbcHkf1grhXekPo+u/fECXDBKz0K+bp63Cped
         lAGjn6YJngWi9wcOptKyu9iVc/l2nT18dGrLeh7OzKeRBiu11mOUtift32WdzRKdeDlN
         kS5vbVPkCgUmkd94FqvSRayv2xMv8bB9V50hCgnaxOQn7M4BpIYmQxLe90YDGDhjD4IW
         xN/xOANiP9JFhsbin98ornwbxLDhljnfSQBORBYajis2LNUIXK1o2MyMQZ2Cu/MPV9GG
         DQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WSVqYNJUUS8Cz3ud3WlLWDQz1ieCxDDqWx8hZG4FPuM=;
        b=ic/CApTvgFBdteWrC/igu1kSIJQTcNwBpY/1QxDJbnnTkBode6NC9Hz47ykQYSi+IZ
         /xtyL5ZuoStn/ZqbgQfvcsKkyEnDUt2CkeuJa8Hz8FPH/6RQA74mZAmnu4zghKhO2TYB
         V948beHcZxmngBibfgLU6jzQCR1IkB6udS7XhBg2dK/qI18uGDA5S5sTs/XY5k4rSLwm
         YuspOd3QEyS29IMQ3lRDTSa7TsKQ4ZsYEQyERh83322UHNlTdf/znxdzawhrWXIK7V3n
         1P3p58gvqwZknJDI57UT8dPpPf99FSCYTSPq+whaOXEW4SKrNR13m3UhryQ6etupBIWQ
         +dBA==
X-Gm-Message-State: APjAAAVUDVfZiuEPWevHHS2CYNxbZNLErV49Uut2P40bGgrch+rJujBu
        oSkfLV4S0A5Ew5Lg6m0eL9I=
X-Google-Smtp-Source: APXvYqxqydVI8GozbDEUMd8efHH3OugcN/BFlYVdHRgY1xAKs9qkPMBBK5A8WNsg2suQai/ZbDr/8Q==
X-Received: by 2002:a63:9d85:: with SMTP id i127mr16526507pgd.186.1578858858941;
        Sun, 12 Jan 2020 11:54:18 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id o134sm11416105pfg.137.2020.01.12.11.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 11:54:18 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/4] drm/msm: allow zapfw to not be specified in gpulist
Date:   Sun, 12 Jan 2020 11:53:58 -0800
Message-Id: <20200112195405.1132288-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112195405.1132288-1-robdclark@gmail.com>
References: <20200112195405.1132288-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

For newer devices we want to require the path to come from the
firmware-name property in the zap-shader dt node.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 456bb5af1717..c146c3b8f52b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -79,9 +79,21 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		ret = request_firmware_direct(&fw, fwname, gpu->dev->dev);
 		if (ret)
 			fw = ERR_PTR(ret);
-	} else {
+	} else if (fwname) {
 		/* Request the MDT file from the default location: */
 		fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
+	} else {
+		/*
+		 * For new targets, we require the firmware-name property,
+		 * if a zap-shader is required, rather than falling back
+		 * to a firmware name specified in gpulist.
+		 *
+		 * Because the firmware is signed with a (potentially)
+		 * device specific key, having the name come from gpulist
+		 * was a bad idea, and is only provided for backwards
+		 * compatibility for older targets.
+		 */
+		return -ENODEV;
 	}
 
 	if (IS_ERR(fw)) {
@@ -170,14 +182,6 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
 		return -EPROBE_DEFER;
 	}
 
-	/* Each GPU has a target specific zap shader firmware name to use */
-	if (!adreno_gpu->info->zapfw) {
-		zap_available = false;
-		DRM_DEV_ERROR(&pdev->dev,
-			"Zap shader firmware file not specified for this target\n");
-		return -ENODEV;
-	}
-
 	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
 }
 
-- 
2.24.1

