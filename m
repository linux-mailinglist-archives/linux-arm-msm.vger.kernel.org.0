Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58273A1EA7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 23:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbhFIVOX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 17:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhFIVOX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 17:14:23 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21D4C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jun 2021 14:12:14 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id s22so1677927ljg.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jun 2021 14:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ts8DwiaDqPOs2OwdpZWZvH9efpSW/cfgQfXfr2VJnsY=;
        b=qB6efk8WElbeGE4xkHwIJoJRj6pWdF2CQRTPayPhe7XJlXaCsGpankVzP4BGpJ/kcH
         NJux/CPKhxHQ4qbPoVUClT6qO6qA9hid44j8x8MJu9bk6UvEqJg1c/j83GzyDeHo4TOz
         2frDpgoEU2XMktH5vaLeLPGv5Y+vs5nAZTJGqfE8q2YraucJNTgea/79IhX0L6KoINC5
         IiagOx74PxGjqwkH4YVjJu9tmOvDlTAi2dvQDZg9HrCSO3u5jf81lF7IGot/rFV1Y2qJ
         Di26JKunUoKcbdDOlILJFLWCK0Nx3oRrDZwgTDh4sR5ornwiProFxFbS5pR66cOAQ+40
         BUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ts8DwiaDqPOs2OwdpZWZvH9efpSW/cfgQfXfr2VJnsY=;
        b=EWqnH6qnMkRulISWzFkSOFOIxglSjvmFoedA1DS1cmuxtDXyUmUbaH+QAOlTJzHppi
         3x2Hn0m3AXI3+wVHd6Va4qPG1Ufn5tsUvUrKPT201V8cdvRFaUYQ+RMc5QF67TV4ts2i
         0MhPcr3vgUTrT79s3pK76TO9wqaxyvYax04rZdLZpdsOEYGv0eYjULf26JrOTKG6Mjen
         vaysw7ZJi7ciASW8qU0/QGttK/k6qdVWrifskVQctT5sXLXpYGKuU3cDUXQoIbIizyM4
         QO6TwDRLIY1fkBmSYAVmmTQfr8XzFHynEfv5DIqFZn6/s/olj3pXnPcPxXWZjf4tMEuZ
         PutA==
X-Gm-Message-State: AOAM531zNLPBoNf6yOwqNoSQz1ogQrf+kNvDesy2KFCSbSX8s5evIxQ6
        z9BE5jbby9wGeB83PxkkK3dOQA==
X-Google-Smtp-Source: ABdhPJxfRYXQjSzaFokCrJrThcfusHj/YwvYPxQ0C2/I6g+9g2UmLnKTBe+UUgUB8fatAO0nyvtKQg==
X-Received: by 2002:a05:651c:2113:: with SMTP id a19mr579037ljq.431.1623273133115;
        Wed, 09 Jun 2021 14:12:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k24sm93130lji.76.2021.06.09.14.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 14:12:12 -0700 (PDT)
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
Date:   Thu, 10 Jun 2021 00:12:11 +0300
Message-Id: <20210609211211.2561090-1-dmitry.baryshkov@linaro.org>
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
index cd016576e8c5..9243edada9ba 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -373,14 +373,14 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
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
 	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], is_dual_dsi);
 	if (ret) {
 		pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
-- 
2.30.2

