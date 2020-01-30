Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C659314DBA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 14:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbgA3N11 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 08:27:27 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34485 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727415AbgA3N10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 08:27:26 -0500
Received: by mail-pl1-f195.google.com with SMTP id j7so1362516plt.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2020 05:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2g1a3kPECY0SwtktiXEAx2+VymT6TSEtxyFnQIHuwSE=;
        b=txZELydtFFsFB55rxkRprqW3ht7OJL/MlqUZGEJtK005fbHzSqcnEjuhGCorb3/vGq
         c01I7g4SyDSdysfxiM7DnQfUTrX9i9oeHOdcR8HzEBrl3Ym0l727/q6u5cto/fJtCXam
         uCN8wHxwhwvhygCuc0HWLCU6dvwXYtH79Y36BtrOaCgVWmrjTfskHbi51jMT3rge8LS+
         209ODeRnXtiMxSII/Y5vbrN+L3DQZPBp+R7p4xIPU3+QtOETyADzR/2HojJheq488jix
         2nlxhaS+v1WqhQRp8mnlJ+rLP6yJIJ2pLcVi7jt6gigJizZiXzgBAzd5CVXtspxD1wat
         EI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2g1a3kPECY0SwtktiXEAx2+VymT6TSEtxyFnQIHuwSE=;
        b=UVeWpLkIEFE6iQHJF1yi9daX3EkIDS/X+6beBf2OCdsJNlxYua43bda4di2MJTAdJu
         +TJfyQl/d8oWcOTK+IhFov9FqONmqPHYeHDGeQIGLuvhHhWOVhkLMTd9sD78woUMVEiz
         uhSqMw3eM5u7+u5OowdLBmhmyyQOCXkC0gh6kuw46X57oTPzUlk4HgPFnRcJdxn+U1h7
         A2dIkIpJaXgunlJcXBGBcWMG/794p8vILJxJ9TXbv6iXPsm8ISNGx6m8rR3dofkhPfs5
         mj6MvFqIdJeS5aMVuwMw22Ts1ssGR37HV1TqX7TjnFweLGo70keq4pjUaZ1utE/ChymF
         hGTw==
X-Gm-Message-State: APjAAAVnUud5CqQvVDkdvonChevIs+qtaYircJxJVZbOthJHJFRKsi5O
        8c8KnesLr2k/QvTaSLQaDR26JA==
X-Google-Smtp-Source: APXvYqzkmHgUz9k+LLvntHsWTWg32b7mu0+VvQlJ6waYNETjVLOUMbssbvTQ3r04DSN62sW1Zu3ygw==
X-Received: by 2002:a17:902:aa96:: with SMTP id d22mr4734088plr.204.1580390844678;
        Thu, 30 Jan 2020 05:27:24 -0800 (PST)
Received: from localhost ([45.127.45.97])
        by smtp.gmail.com with ESMTPSA id a19sm6318798pju.11.2020.01.30.05.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 05:27:23 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, swboyd@chromium.org,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
Subject: [PATCH v4 2/7] drivers: thermal: tsens: use simpler variables
Date:   Thu, 30 Jan 2020 18:57:05 +0530
Message-Id: <eefbe5fd8255182b77127a4eddbcbb5aba259ea7.1580390127.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1580390127.git.amit.kucheria@linaro.org>
References: <cover.1580390127.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We already dereference the sensor and save it into a variable. Use the
variable directly to make the code easier to read.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/thermal/qcom/tsens-common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
index c2df30a08b9e..1cbc5a6e5b4f 100644
--- a/drivers/thermal/qcom/tsens-common.c
+++ b/drivers/thermal/qcom/tsens-common.c
@@ -368,7 +368,7 @@ irqreturn_t tsens_irq_thread(int irq, void *data)
 			tsens_set_interrupt(priv, hw_id, UPPER, disable);
 			if (d.up_thresh > temp) {
 				dev_dbg(priv->dev, "[%u] %s: re-arm upper\n",
-					priv->sensor[i].hw_id, __func__);
+					hw_id, __func__);
 				tsens_set_interrupt(priv, hw_id, UPPER, enable);
 			} else {
 				trigger = true;
@@ -379,7 +379,7 @@ irqreturn_t tsens_irq_thread(int irq, void *data)
 			tsens_set_interrupt(priv, hw_id, LOWER, disable);
 			if (d.low_thresh < temp) {
 				dev_dbg(priv->dev, "[%u] %s: re-arm low\n",
-					priv->sensor[i].hw_id, __func__);
+					hw_id, __func__);
 				tsens_set_interrupt(priv, hw_id, LOWER, enable);
 			} else {
 				trigger = true;
@@ -392,7 +392,7 @@ irqreturn_t tsens_irq_thread(int irq, void *data)
 		if (trigger) {
 			dev_dbg(priv->dev, "[%u] %s: TZ update trigger (%d mC)\n",
 				hw_id, __func__, temp);
-			thermal_zone_device_update(priv->sensor[i].tzd,
+			thermal_zone_device_update(s->tzd,
 						   THERMAL_EVENT_UNSPECIFIED);
 		} else {
 			dev_dbg(priv->dev, "[%u] %s: no violation:  %d\n",
@@ -435,7 +435,7 @@ int tsens_set_trips(void *_sensor, int low, int high)
 	spin_unlock_irqrestore(&priv->ul_lock, flags);
 
 	dev_dbg(dev, "[%u] %s: (%d:%d)->(%d:%d)\n",
-		s->hw_id, __func__, d.low_thresh, d.up_thresh, cl_low, cl_high);
+		hw_id, __func__, d.low_thresh, d.up_thresh, cl_low, cl_high);
 
 	return 0;
 }
-- 
2.20.1

