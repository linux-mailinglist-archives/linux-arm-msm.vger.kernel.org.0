Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C26492C24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jan 2022 18:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243610AbiARRTN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jan 2022 12:19:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232859AbiARRTM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jan 2022 12:19:12 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693C7C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jan 2022 09:19:12 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id q141-20020a1ca793000000b00347b48dfb53so9385306wme.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jan 2022 09:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=vGvnbxeNRIB3S31pWuMCSmiB84n9/DgEiMQTAdokJ2A=;
        b=yI/yw5virPuhFslSzUfs/a2QGuoL29nxuPsNYii8327f2x32lmsA5vlSaVyCoNExke
         61ZLyCwl+/wrM2nYMR4RJKA2LyRA8Cjt7CUq81c1gG+aF+V9bXEJWUJdfo8IzmtTFVys
         uY5FpPwMxMAtpiX5iOYofYXYsmW7bd8SkbSuujqWc/RWc3SnlVfofTy5iKaHjjtrp4W7
         CYfpiAWfjnIruC2GMYjgoVTaWVKytidX40gOE0Bii4AZXlJ+nzaA+rW+r+hSJkjW5hj9
         phz4ePZqchHunwrvujbaJtALtrPQXnXdfpxMsJhMKkm10JtS2p7z35DsESVVR4EEMbng
         QSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vGvnbxeNRIB3S31pWuMCSmiB84n9/DgEiMQTAdokJ2A=;
        b=P8dwFw202f4z7tEZfaEeg/GAgQw8hDVDCXquKBoNnx9OQWRFQ0/hFlGdTJl9Y/+pYJ
         gW2Gafb9LlelW5ZPR5QI/F++D7LavggntQKBqZthawvP8FnymuvMvQl3+Czvk7rQLVmW
         KWCPYKcGRmCoHEVi0iNWW9dhAz7Q7Zys1BE4B324Yzt4YSlTq6acrST8T7CW4op5Zad3
         KbNl4ULHwg6SXJyJ7KKqlX9md7S2V228DvlyFayv63M0T2iAGGQo/2UfTTMLX8ZngctB
         owsU4EU1I68MyNbgF2/z47cPcGZQBXjlWd97Zqy9+qMVhkKgEMhWz4Ts+wUm5+NOr2ud
         Pbkw==
X-Gm-Message-State: AOAM533h8MIjx3LqAbPJVnu+I9wyQPJdC1D8AfEZYKSCPGBk/TEM5YbX
        +KTg+LBMjyx8T2Sk/DFhAfhtyA==
X-Google-Smtp-Source: ABdhPJyDeP+FmCIq4KYZZeMOloMM6jTaZiE8LQnSZClu80cQJgrMhkBX9qbjMdKGYwPegnLC12xb3g==
X-Received: by 2002:a05:600c:4991:: with SMTP id h17mr26018779wmp.14.1642526350895;
        Tue, 18 Jan 2022 09:19:10 -0800 (PST)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id r7sm1081239wma.39.2022.01.18.09.19.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jan 2022 09:19:10 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     robdclark@gmail.com, sean@poorly.run
Cc:     linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 1/2] drm/msm/dsi: Add support for flexible DSI block mapping
Date:   Tue, 18 Jan 2022 18:31:27 +0100
Message-Id: <1642527088-13088-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The QCM2290 SoC integrates same DSI hardware as SC7180 but mapped
at a different address, 0x5e94000 vs 0xae94000. To support such
case, this change introduces an optional io_mask value that can
be used to match multiple mapped addresses. It's probably not the
more elegant solution, and could be revisited if necessary.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.h  | 2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 41e99a9..195ab2f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -36,6 +36,7 @@ struct msm_dsi_config {
 	const char * const *bus_clk_names;
 	const int num_bus_clks;
 	const resource_size_t io_start[DSI_MAX];
+	const u32 io_mask;
 	const int num_dsi;
 };
 
@@ -61,4 +62,3 @@ struct msm_dsi_cfg_handler {
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor);
 
 #endif /* __MSM_DSI_CFG_H__ */
-
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index f69a125f..428641e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1779,6 +1779,9 @@ static int dsi_host_get_id(struct msm_dsi_host *msm_host)
 	for (i = 0; i < cfg->num_dsi; i++) {
 		if (cfg->io_start[i] == res->start)
 			return i;
+		else if (cfg->io_mask &&
+			 (cfg->io_start[i] & cfg->io_mask) == (res->start & cfg->io_mask))
+			return i;
 	}
 
 	return -EINVAL;
-- 
2.7.4

