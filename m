Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A3436DA50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 17:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239833AbhD1OzU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 10:55:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:36352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240332AbhD1Oxj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DA0961628;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=wdynVwwhyvqKibF+xyVsNRL7Ix8YvvILE1Sgr+qtqMc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mCIGd0KUv3nX54i1wVXkXIAeO66691k6xUBfmNPBKNDmhWpJOQuj+wMEfVxioO1X5
         EC3NSjF2ZWgq5ZRPHaKMXJSHvN/sJuvSwrjLwP7b7BwX9gbpCO5K1JNOb33GgLLP/B
         ODlj/AnkKJzKNAdnkeXKKIwfwf2EqGvMsE4ck70qRDXgPrHzHw2crGt7Vwotx4QVh7
         DNyB3jAZkqW0tcDJ2A/XAcNgci2oOhY+BL9c1vW8eahsTJUz0KAyD8GiLWVVDzTPk2
         UDyrjfcFypRtSCufZwGn8zYN22XKLYhaUBgOYXHSk/jBBF8HOAiSB1DzA/8FEH6JB8
         z25CsXH8ihtjw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYR-001Dsj-F7; Wed, 28 Apr 2021 16:52:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v4 65/79] media: camss: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:26 +0200
Message-Id: <c7c0cb91cedfd12625f387b904e72a1457a3a7ba.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c   | 6 ++----
 drivers/media/platform/qcom/camss/camss-csiphy.c | 6 ++----
 drivers/media/platform/qcom/camss/camss-ispif.c  | 6 ++----
 drivers/media/platform/qcom/camss/camss-vfe.c    | 5 +++--
 4 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index cc11fbfdae13..d2a7f2a64f26 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -156,11 +156,9 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	int ret;
 
 	if (on) {
-		ret = pm_runtime_get_sync(dev);
-		if (ret < 0) {
-			pm_runtime_put_sync(dev);
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0)
 			return ret;
-		}
 
 		ret = regulator_enable(csid->vdda);
 		if (ret < 0) {
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index b3c3bf19e522..8e18b8e668cf 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -197,11 +197,9 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 	if (on) {
 		int ret;
 
-		ret = pm_runtime_get_sync(dev);
-		if (ret < 0) {
-			pm_runtime_put_sync(dev);
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0)
 			return ret;
-		}
 
 		ret = csiphy_set_clock_rates(csiphy);
 		if (ret < 0) {
diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index 37611c8861da..d9907742ba79 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -372,11 +372,9 @@ static int ispif_set_power(struct v4l2_subdev *sd, int on)
 			goto exit;
 		}
 
-		ret = pm_runtime_get_sync(dev);
-		if (ret < 0) {
-			pm_runtime_put_sync(dev);
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0)
 			goto exit;
-		}
 
 		ret = camss_enable_clocks(ispif->nclocks, ispif->clock, dev);
 		if (ret < 0) {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 15695fd466c4..cf743e61f798 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -584,9 +584,9 @@ static int vfe_get(struct vfe_device *vfe)
 		if (ret < 0)
 			goto error_pm_domain;
 
-		ret = pm_runtime_get_sync(vfe->camss->dev);
+		ret = pm_runtime_resume_and_get(vfe->camss->dev);
 		if (ret < 0)
-			goto error_pm_runtime_get;
+			goto error_domain_off;
 
 		ret = vfe_set_clock_rates(vfe);
 		if (ret < 0)
@@ -620,6 +620,7 @@ static int vfe_get(struct vfe_device *vfe)
 
 error_pm_runtime_get:
 	pm_runtime_put_sync(vfe->camss->dev);
+error_domain_off:
 	vfe->ops->pm_domain_off(vfe);
 
 error_pm_domain:
-- 
2.30.2

