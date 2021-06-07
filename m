Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26E3539E92D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 23:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbhFGVmV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 17:42:21 -0400
Received: from mail-lj1-f175.google.com ([209.85.208.175]:40514 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbhFGVmT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 17:42:19 -0400
Received: by mail-lj1-f175.google.com with SMTP id x14so9838145ljp.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 14:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u8CKvwSQLjjj+5EJDA8ATWx2yaOhMI1EEsNUtEuV8bk=;
        b=EE8BrWdnOfaSRktSGtAbHGRjUb/zfSuaXZNayvdpAMV6+DhBqv7HwiJZ0qtfYNTipo
         lUc1kkM4MrYxw1Unia3/QlQHLVsp7W2Ei8iqe4/yzsfmKBtaWgEabb57y5gDrGw2jm92
         hDCA6mfDG9VTnyL/IBIHWRuJRfu/0eL2bQUuypQ2OsMoh67O4c+Z1AdM9IDmn48oXrfS
         3ZH5HeNa1Qz1koFEd+YVMvYjQJEw5tToGmVQIOPYbDhABy0MtXqGMKcyfCeoxlI+uXBz
         f1ea1+X7+bWPSZla4TFXywzmTYkDMi1Sk/G4JkL44zsIi5c4+9Gtv/MVafOuGuA3DiU/
         5y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u8CKvwSQLjjj+5EJDA8ATWx2yaOhMI1EEsNUtEuV8bk=;
        b=eWaj1lUs5+RCs56tjv0h4SomkPB9qrKY387zYMyTwfOYsvbtHTwwOmLj4TO7pMemd5
         lG7Sw+v9XCQdEubKmxvCebZU3bx73TS4nvRJjjsyH/HurHEJVdhL2gsgN6Q2yBIx6DNS
         3KXQwc5EvmkQ3vyvPrPDUFiD2pYd6d+6UInmTSroEZoWwq+9fF7GYMRxu6dOrm6lXgpr
         wizemUfhY2flkGPmTyYJ7z8ntVwliyA4CMkZBrDMtPm20yHW+0jPE0+AQeUrzvCn6vSy
         rIh2bNRUHBq+mndK7GptzaXFEhkggICmi+BIkshbyoXz1HX6zwSmFL/HIG2AIsTuo53w
         ktpQ==
X-Gm-Message-State: AOAM532ef9iXteS3ID+kLkSlWL4RlnEz3ZXAsKAhzSNaosDcNDSt5y2v
        tAjRUVfxv9+f+2KG+SmT7tK0JQ==
X-Google-Smtp-Source: ABdhPJxopuAC3ib67JMkqaKVp9CX94BbYI9bARVwAKqMkZLRE+Amgp4fyqCYVPbLrcOGlFPzfAvW3Q==
X-Received: by 2002:a05:651c:38b:: with SMTP id e11mr15788576ljp.198.1623101950184;
        Mon, 07 Jun 2021 14:39:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h22sm688111ljk.133.2021.06.07.14.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 14:39:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi: do not enable PHYs when called for the slave DSI interface
Date:   Tue,  8 Jun 2021 00:39:09 +0300
Message-Id: <20210607213909.2186556-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the call to dsi_mgr_phy_enable after checking whether the DSI
interface is slave, so that PHY enablement happens together with the
host enablement.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index cc18ea2b244c..d77693904a15 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -374,14 +374,14 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (!msm_dsi_device_connected(msm_dsi))
 		return;
 
-	ret = dsi_mgr_phy_enable(id, phy_shared_timings);
-	if (ret)
-		goto phy_en_fail;
-
 	/* Do nothing with the host if it is slave-DSI in case of dual DSI */
 	if (is_dual_dsi && !IS_MASTER_DSI_LINK(id))
 		return;
 
+	ret = dsi_mgr_phy_enable(id, phy_shared_timings);
+	if (ret)
+		goto phy_en_fail;
+
 	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], is_dual_dsi, msm_dsi->phy);
 	if (ret) {
 		pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
-- 
2.30.2

