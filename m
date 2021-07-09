Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D94B23C1D9C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 04:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbhGICvh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 22:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbhGICvh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 22:51:37 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F85FC061574;
        Thu,  8 Jul 2021 19:48:54 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id oj11-20020a17090b4d8bb029017338c124dcso2554898pjb.0;
        Thu, 08 Jul 2021 19:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FJGeec/dd9lZetObCCGFRZpLuvUGuLNWG/KPXHyD92w=;
        b=vInsEHdyDhDpupYzggzG618GasGXW1IymHK8a7YzD2/3K/iLzU+Ug0HiqzQUicH+e5
         WDpixPGBU1ZRi8VEkGg0zUaUoXrxkUuJX/pUaEsdMDTUOmtWPtJAnQ53l1suTqBFOGQE
         uNOhj1OjjNXecrW9dxXCXqLQItT6QovIiYLqHkZNAOwz37RsBrMRulgfrPsIw0Amx4y/
         Cr1uqYs0RbauPj6rvPEDkKjn9sr86KN4IzZ5cFeoh7VQkx109CdPS+Uwk31715t7VA9p
         2bjQLu5jzkh3ts8FCuaoTCyt+N0mE3m4r1+fGkErMkBcLcwn1N7VO2HX3auqul58VFmp
         1pCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FJGeec/dd9lZetObCCGFRZpLuvUGuLNWG/KPXHyD92w=;
        b=HuwbV5+inr6/M4dOeRlIF8kxdQGDOb0QuYY6/CgBS+cbb2OvNwLcAM8YVICZhcqzRC
         ZppHOhlrxDtCGUcRKPGM1t1l+brHZFnjuDK42NpKCq4pySvpAGc3eAy23bq3pcAk/Szo
         PvPwbB4D05xgZaJ/6JTz1ZbzKKQ5Opvz1n4G3f1TWc3uMAzX/PMea85bou4RvS9++BCU
         w9S00pvOFutaRstxMA9UE8JcT8ev6wGDDH+yCw6Q7e/kx9DquShG2J9sNaehlA0aFJRo
         v+R5TY1dHi99QgebYUp44hqXospqsWemkMstEVYKbEv61euC7ncLPMK3j6idKLgCipeR
         LAMA==
X-Gm-Message-State: AOAM5336/qQr7+xaiAD/Q7uf5TabYKG64gxEPifgUtGL1q7ROcJcBES9
        ACuLgZ6VCUa3uZaBOe0Jd6I=
X-Google-Smtp-Source: ABdhPJzppWn6OlM8ElvBqTOykcXyFL2SXYr+Y2O2KzabgIBpCXqWZ1tSI81I3VIk10TQtPA2h78kxw==
X-Received: by 2002:a17:90a:ee94:: with SMTP id i20mr8237957pjz.231.1625798933829;
        Thu, 08 Jul 2021 19:48:53 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9005:8001:f83b:3fe0:973b:4044])
        by smtp.gmail.com with ESMTPSA id 10sm4353844pfh.174.2021.07.08.19.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 19:48:48 -0700 (PDT)
From:   Souptick Joarder <jrdr.linux@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, khsieh@codeaurora.org, abhinavk@codeaurora.org,
        swboyd@chromium.org, dmitry.baryshkov@linaro.org,
        chandanu@codeaurora.org, tanmay@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Souptick Joarder <jrdr.linux@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/msm/dp: Remove unused variable
Date:   Fri,  9 Jul 2021 08:18:34 +0530
Message-Id: <20210709024834.29680-1-jrdr.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Kernel test roobot throws below warning ->

drivers/gpu/drm/msm/dp/dp_display.c:1017:21:
warning: variable 'drm' set but not used [-Wunused-but-set-variable]

Removed unused variable drm.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 051c1be1de7e..d42635a86d20 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1014,10 +1014,8 @@ int dp_display_get_test_bpp(struct msm_dp *dp)
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 {
 	struct dp_display_private *dp_display;
-	struct drm_device *drm;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
-	drm = dp->drm_dev;
 
 	/*
 	 * if we are reading registers we need the link clocks to be on
-- 
2.25.1

