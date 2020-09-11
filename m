Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A607266477
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 18:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgIKQjS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 12:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbgIKPL5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 11:11:57 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6832C0617BB
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 08:11:27 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id g72so10160415qke.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y1Mrrdltf8JkUiXBwhP12Bt7vHszc4a/D3llhrE39Xw=;
        b=MoQFwC4EpyX85Anny9UHuFER6SjCt3UBEclhiTbYlK6pZQX0savVZRI5+O66AjEdYB
         GkvL07kCmxDgGV50HIKI5UDum12f+xl3CM6YBNP2omwKP5H4AY8SMHm4GLP8osdK3sqz
         QnZTnE7CXyDfZurizKL/RI+DnHe5ClsIxPEzhi1xJrtZIeC89rUdjsVAbVJnmv2k+zhL
         mJkff3t7cJG0sU9LtjYI8YKbwHAurifS/1kxoV2H3BwoGRKOFn8kXHzT9jJocmzNqHvD
         DfcxQG14xV61pCVzEmhvBlve9OA4r8so+RG9W7qQtjjwHiU/TBntygFFvpROlUoP1WFF
         MgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y1Mrrdltf8JkUiXBwhP12Bt7vHszc4a/D3llhrE39Xw=;
        b=qu+a1+7TV2Al8LH2r2w3+PFsP/KF1yvjR1INjNTE3PIR+o/zLgmdi98fRChqpGBRPW
         o5uIimNeavjQEcDTe74KLIaKvf90Fxgv20XEeDYOIETNbFyJNPlKCOt+mr0pieOjq2Qd
         9D6/IRnG1CSmRfYlJ3y3aRVHrfifboaxsIZZvRGEwdc8dkvq4jbfo4dG0wmzbNb+AQHN
         PIvK6k+JFVjMvgOEo0YB3+rTF4Nc9Le8bFn6ZO6MntBaCrvknbPlMJ8djEcUEDas6rN0
         my06NtWRG5uQ1CmBvs7rmrhPETlF8mzk0+h6GFLX+QM5nGIzfcC/FYvp1HRwQesKOAyt
         NI8Q==
X-Gm-Message-State: AOAM531xcbjkxXXmB6ODUirKdjkTTAYk0MMF4IPsgpoHR/ZJg/YsgdXc
        /XEjG2xeDKbtfk2E0gcDzhIkhKBTPoPxi5xBZUs=
X-Google-Smtp-Source: ABdhPJx+zbL1tNt55Zil0iW3l1E7IHbR8fyL540rrDdm9l9Q2+9LzVozM7YcYAXK/ido+diJeIQm1g==
X-Received: by 2002:a37:aac5:: with SMTP id t188mr1746167qke.427.1599837086849;
        Fri, 11 Sep 2020 08:11:26 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 201sm3216429qkf.103.2020.09.11.08.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 08:11:26 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Krzysztof Wilczynski <kw@linux.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] drm/msm/dsi: add DSI config for sm8150 and sm8250
Date:   Fri, 11 Sep 2020 11:09:38 -0400
Message-Id: <20200911151001.13156-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200911151001.13156-1-jonathan@marek.ca>
References: <20200911151001.13156-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This allows DSI driver to work with sm8150 and sm8250. The sdm845 config
is re-used as the config is the same.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> (SM8250)
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

