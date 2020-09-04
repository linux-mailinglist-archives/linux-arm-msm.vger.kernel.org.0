Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F2F25E0CF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 19:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgIDRaP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 13:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727112AbgIDRaL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 13:30:11 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E42C061244
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 10:30:10 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id f2so7062201qkh.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 10:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+/ZP5kS5Rqe9m8HHOrySpxvpwfZsdKiW4+S2+xiaFZ4=;
        b=bzIEIgVCyUxB7ogqA2p4KhVMr9nk3rC+fPN6Hwvq0fBPGWQt5Mt4Z0cSFjryKkIzZj
         EsTgy7TNbDNNmA0+AahwO2952KkXEr/rn3BfHxyKf4S6sJEgWWkcIm7tO5qb5dy8GKDS
         aapkBfizEHQa2F4zPqs58/spHZoNA5JsRkDJSvhY/h1KQs32JU1W7OpJLLlM9Mq1wXuD
         /fA4dOoo/9xeE8tVZoZJRwKQaIt7xzusIqpXp+qzjR1z7rxpxD/VNiNlrEa47TGOfDFw
         Bhik7MJsMwS4Pz4lGMcbrgnm++nSQNY/PsJ7HQrEfHlZAiYp4Con5PdddQN58Zk16cy+
         CECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+/ZP5kS5Rqe9m8HHOrySpxvpwfZsdKiW4+S2+xiaFZ4=;
        b=DtJMblgAVPiHZrCnyJ7TmAs0vW2d2D+EplSpwIdvho/hoauuDwaNVHtTm1Cry+MT3N
         wqidSzff5VLNmRl3dPUsIWZNxaSGwFWJP+Qenq1DHDO0YoAMo2kITQPySeEjzXTNUIf1
         bGGO1mkePVgow4PmUjw8JMO8QULgDRS5/BzUBh3byvMBDURZYf/bA3aKteV2PVrhj6TV
         YLJarB/AqCyTaoYsia7/GY3wKBTtlpkKMHx0lWPENgctxiaWVeuWzleQJKsKi7mwrEGo
         k0nuGAB7c8Huh+o3XmwzWZOCYBp6TUtgOGw3kF1tK0zteiYIzfAEI8q3IrXMROuyiCMB
         GcCA==
X-Gm-Message-State: AOAM5314Xxp5A6RDjI6c+gGFUa4I3/KtISq9bGdVomIKx/YuR4rYmgGu
        7+SF/ab1rXV3GOknOWITLHcWzQ==
X-Google-Smtp-Source: ABdhPJxx6sG7dra6NCCtL26WdGX0WCmMtUJHQnCyrMj/OFxjA/iW+opYNKti5P1y9A5inKrckUcvvA==
X-Received: by 2002:a05:620a:545:: with SMTP id o5mr9093806qko.172.1599240609392;
        Fri, 04 Sep 2020 10:30:09 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id i66sm5103330qkc.63.2020.09.04.10.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 10:30:08 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Krzysztof Wilczynski <kw@linux.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] drm/msm/dsi: add DSI config for sm8150 and sm8250
Date:   Fri,  4 Sep 2020 13:28:37 -0400
Message-Id: <20200904172859.25633-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200904172859.25633-1-jonathan@marek.ca>
References: <20200904172859.25633-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This allows DSI driver to work with sm8150 and sm8250. The sdm845 config
is re-used as the config is the same.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 5 ++++-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index f892f2cbe8bb..b2ff68a15791 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -265,9 +265,12 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&msm8998_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_1,
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_0,
+		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
+		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
 		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
-
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index efd469d1db45..ade9b609c7d9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -21,6 +21,8 @@
 #define MSM_DSI_6G_VER_MINOR_V2_1_0	0x20010000
 #define MSM_DSI_6G_VER_MINOR_V2_2_0	0x20000000
 #define MSM_DSI_6G_VER_MINOR_V2_2_1	0x20020001
+#define MSM_DSI_6G_VER_MINOR_V2_3_0	0x20030000
+#define MSM_DSI_6G_VER_MINOR_V2_4_0	0x20040000
 #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
-- 
2.26.1

