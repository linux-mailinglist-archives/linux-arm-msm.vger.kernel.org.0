Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD8CC18305D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 13:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbgCLMh0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 08:37:26 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:51789 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbgCLMh0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 08:37:26 -0400
Received: by mail-pj1-f66.google.com with SMTP id y7so2513097pjn.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2020 05:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RIVo2jQNk3f40+HhgM8M/O0vAyPQsAG9OavWpiPKAi0=;
        b=H5nmRwPZj9tAsVVc0dRecTZP1AED6eMcPyMakQTydYixHziSB/Oi5mdvP4rpBcY385
         /4AmeiZImukSQAIYtCq99mgIvvlZGD1xogE9V4ZpMyuYhcTkL8Bci8gjR8c5bTCD9jpt
         Ss4P2gV1j0yU83wG75JdbW37txISIszleR+AT+RJ1nPMyTUglEoMivkkk+jOk4uxSaP/
         EHi7SK9kOZ3z3/gd2Uy1e8iW380ktoXyBa/3NQNEkooNMtdqSL3p8Elpsnhu8WIlnHJP
         R85SY2TCmPn/OJ/W6dLwG2soPk1TQpSY6BfEruEf9Bm9EltJ8wSTQLR1IdAt/l+thBJ2
         gPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RIVo2jQNk3f40+HhgM8M/O0vAyPQsAG9OavWpiPKAi0=;
        b=V4ZE4SKUex3Yoc5f/QsMHp2t8fF2ef5vp9OSuEwaJgGshKpgQ0cApSxfEDDL++1Vyu
         VZvJPPWWQP6ltDfj9qYvDgy1I2CdKLgcZayd+Z39haUnXJfp2zNocr05uvo55pJeQeUO
         fnnXsbRlOPWOikgStNu8KSuC1qdNF54Py2WCO2QO1QGYhcZdA2zVtmEpJNGuVcoWVyzQ
         dTd7sNpqaYAof7WUcpkztdsn8OzY+xEMRrh3d8z+XtKLosqbU7Ex3l3xPK3I/QSIm/P4
         mI4DmNFIoLu54CQyZDn2dhUWinmQQeReGO4hC4vI3NeBl8Sf6PpHMefIgWgwBzyKqP1p
         zqMQ==
X-Gm-Message-State: ANhLgQ2mpPrYXvOhF8iXT1y2wbn6kt3xkwv85jPwsORKkqLhdcJuvSwR
        rozMpZz5QhJ24K+C9M3ZbAMeOg==
X-Google-Smtp-Source: ADFU+vsYFzYqjdIUdVYcxttrtB3a1MUEYcKi10YAfF7LhxlO5T24tLurnTKnuTG82bRC+CLw8xBqtA==
X-Received: by 2002:a17:902:8c94:: with SMTP id t20mr7761649plo.170.1584016645028;
        Thu, 12 Mar 2020 05:37:25 -0700 (PDT)
Received: from localhost ([45.127.45.7])
        by smtp.gmail.com with ESMTPSA id 8sm3256212pfv.65.2020.03.12.05.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 05:37:24 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        swboyd@chromium.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
Subject: [PATCH v7 3/8] drivers: thermal: tsens: use simpler variables
Date:   Thu, 12 Mar 2020 18:07:00 +0530
Message-Id: <5dc4356edfb8dffa377fb561359bf41a6f1fdf17.1584015867.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1584015867.git.amit.kucheria@linaro.org>
References: <cover.1584015867.git.amit.kucheria@linaro.org>
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
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/thermal/qcom/tsens-common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
index 45e68f999bf61..f044788681c48 100644
--- a/drivers/thermal/qcom/tsens-common.c
+++ b/drivers/thermal/qcom/tsens-common.c
@@ -369,7 +369,7 @@ irqreturn_t tsens_irq_thread(int irq, void *data)
 			tsens_set_interrupt(priv, hw_id, UPPER, disable);
 			if (d.up_thresh > temp) {
 				dev_dbg(priv->dev, "[%u] %s: re-arm upper\n",
-					priv->sensor[i].hw_id, __func__);
+					hw_id, __func__);
 				tsens_set_interrupt(priv, hw_id, UPPER, enable);
 			} else {
 				trigger = true;
@@ -380,7 +380,7 @@ irqreturn_t tsens_irq_thread(int irq, void *data)
 			tsens_set_interrupt(priv, hw_id, LOWER, disable);
 			if (d.low_thresh < temp) {
 				dev_dbg(priv->dev, "[%u] %s: re-arm low\n",
-					priv->sensor[i].hw_id, __func__);
+					hw_id, __func__);
 				tsens_set_interrupt(priv, hw_id, LOWER, enable);
 			} else {
 				trigger = true;
@@ -393,7 +393,7 @@ irqreturn_t tsens_irq_thread(int irq, void *data)
 		if (trigger) {
 			dev_dbg(priv->dev, "[%u] %s: TZ update trigger (%d mC)\n",
 				hw_id, __func__, temp);
-			thermal_zone_device_update(priv->sensor[i].tzd,
+			thermal_zone_device_update(s->tzd,
 						   THERMAL_EVENT_UNSPECIFIED);
 		} else {
 			dev_dbg(priv->dev, "[%u] %s: no violation:  %d\n",
@@ -436,7 +436,7 @@ int tsens_set_trips(void *_sensor, int low, int high)
 	spin_unlock_irqrestore(&priv->ul_lock, flags);
 
 	dev_dbg(dev, "[%u] %s: (%d:%d)->(%d:%d)\n",
-		s->hw_id, __func__, d.low_thresh, d.up_thresh, cl_low, cl_high);
+		hw_id, __func__, d.low_thresh, d.up_thresh, cl_low, cl_high);
 
 	return 0;
 }
-- 
2.20.1

