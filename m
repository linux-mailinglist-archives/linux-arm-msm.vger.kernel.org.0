Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63BDC24B707
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Aug 2020 12:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731094AbgHTKqW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 06:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731890AbgHTKoh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 06:44:37 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2C7C061348
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2020 03:44:25 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id z23so699640plo.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2020 03:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DpgTiEjgRiD0zhPSebj/TpHieKoL8i50gdOLCJBlmJ4=;
        b=OSGUAITJhbJJ52/Uazu0MwC68AnxFTVFBm2nryW7rIRv2Iehs4ErKkFDB4CvW/yifJ
         ELaRK72bwMfqIokp6jb3YgnqZhSeHNDQzg025eNwaeahDVZfjtOHufpZEQ4EPZA58LRi
         wjwfNwQUwHsjcucCKoKS/aPzEGZSL86XD6dlQ/mSWuZKipvSC8SbXtbH0VffOwrmBBS9
         N+TkFN4uny2gtdDnktp1L5R0IDe52JqLCbLdiILjK+3LPgtibESdOcwz3gLKy5O87faY
         np1FWs1hsGNXwSzhURE1Okz9dQm9zvIw5pJ4DhKC7mK3BqIx6pBnupcYs8m0KuS4XwTF
         7ZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DpgTiEjgRiD0zhPSebj/TpHieKoL8i50gdOLCJBlmJ4=;
        b=gFSd5aYNCTiuobOnKOjvy183/1+mVqXu1mawEZGOF6ISj0oktvopPOO3i6ER2tT8WD
         52gw86KUoLvV7Qw1JFrLv4gvRx6OOT7TbDUTfQoPZm+MgMm4XLbA74sCCv3EHcFoJlHQ
         KZ2lOY341gQAsimdbdYxtzP8aXDbUK+NYIcSyU8MaW6oFhHenDvoiu32c48YaxArK0EP
         c7NUPzk2PGeMQsgQlp/2yzFYJndIWi80Bgh7JMEfBIQ1/g7Jtvu5HmQYZ+TmsCj4CIlr
         9hBGXqVBTZxvbzlm/guIAMqdE5OccvxlCv6vAEdD1BPWXhBBzVXKKeS0efawg9NhPixh
         HIsw==
X-Gm-Message-State: AOAM533WSCZnU0W0rU4iPmNqIvgV/XksyeRlAekCK0NxqCQjy8XoPqPq
        5/m2nYQLxUyzPVPbEdGPnUuUcg==
X-Google-Smtp-Source: ABdhPJxZdfH8zu/kawgBGn1ZD0k1zqJV1XqBEDc/6HZKKh1V4ywtw6ENVhC4nHHzRCocDlAUxfTj2w==
X-Received: by 2002:a17:90b:238d:: with SMTP id mr13mr1928786pjb.132.1597920264919;
        Thu, 20 Aug 2020 03:44:24 -0700 (PDT)
Received: from localhost ([122.172.43.13])
        by smtp.gmail.com with ESMTPSA id e7sm2145009pgn.64.2020.08.20.03.44.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 03:44:24 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     rnayak@codeaurora.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] drm/msm: Unconditionally call dev_pm_opp_of_remove_table()
Date:   Thu, 20 Aug 2020 16:13:52 +0530
Message-Id: <4ca1dd576f016d49e57b679d0921a268b4a7fa62.1597919647.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1597919647.git.viresh.kumar@linaro.org>
References: <cover.1597919647.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
find the OPP table with error -ENODEV (i.e. OPP table not present for
the device). And we can call dev_pm_opp_of_remove_table()
unconditionally here.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 10 +++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 -
 drivers/gpu/drm/msm/dsi/dsi_host.c      |  8 ++------
 3 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c0a4d4e16d82..1bd67ba1bf1f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1010,9 +1010,7 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(dpu_kms->opp_table);
 	/* OPP table is optional */
 	ret = dev_pm_opp_of_add_table(dev);
-	if (!ret) {
-		dpu_kms->has_opp_table = true;
-	} else if (ret != -ENODEV) {
+	if (ret != -ENODEV) {
 		dev_err(dev, "invalid OPP table in device tree\n");
 		dev_pm_opp_put_clkname(dpu_kms->opp_table);
 		return ret;
@@ -1037,8 +1035,7 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	priv->kms = &dpu_kms->base;
 	return ret;
 err:
-	if (dpu_kms->has_opp_table)
-		dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_of_remove_table(dev);
 	dev_pm_opp_put_clkname(dpu_kms->opp_table);
 	return ret;
 }
@@ -1056,8 +1053,7 @@ static void dpu_unbind(struct device *dev, struct device *master, void *data)
 	if (dpu_kms->rpm_enabled)
 		pm_runtime_disable(&pdev->dev);
 
-	if (dpu_kms->has_opp_table)
-		dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_of_remove_table(dev);
 	dev_pm_opp_put_clkname(dpu_kms->opp_table);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index e140cd633071..8295979a7165 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -129,7 +129,6 @@ struct dpu_kms {
 	bool rpm_enabled;
 
 	struct opp_table *opp_table;
-	bool has_opp_table;
 
 	struct dss_module_power mp;
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index b17ac6c27554..288f9df06ea2 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -113,7 +113,6 @@ struct msm_dsi_host {
 	struct clk *byte_intf_clk;
 
 	struct opp_table *opp_table;
-	bool has_opp_table;
 
 	u32 byte_clk_rate;
 	u32 pixel_clk_rate;
@@ -1891,9 +1890,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		return PTR_ERR(msm_host->opp_table);
 	/* OPP table is optional */
 	ret = dev_pm_opp_of_add_table(&pdev->dev);
-	if (!ret) {
-		msm_host->has_opp_table = true;
-	} else if (ret != -ENODEV) {
+	if (ret != -ENODEV) {
 		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
 		dev_pm_opp_put_clkname(msm_host->opp_table);
 		return ret;
@@ -1934,8 +1931,7 @@ void msm_dsi_host_destroy(struct mipi_dsi_host *host)
 	mutex_destroy(&msm_host->cmd_mutex);
 	mutex_destroy(&msm_host->dev_mutex);
 
-	if (msm_host->has_opp_table)
-		dev_pm_opp_of_remove_table(&msm_host->pdev->dev);
+	dev_pm_opp_of_remove_table(&msm_host->pdev->dev);
 	dev_pm_opp_put_clkname(msm_host->opp_table);
 	pm_runtime_disable(&msm_host->pdev->dev);
 }
-- 
2.25.0.rc1.19.g042ed3e048af

