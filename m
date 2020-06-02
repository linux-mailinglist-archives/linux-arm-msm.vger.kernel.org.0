Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E5E1EB91E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 12:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgFBKJo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 06:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726831AbgFBKJm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 06:09:42 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CC1C061A0E
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2020 03:09:42 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x207so2946995pfc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2020 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ndmZINi8/nRwu7d+LAYbr+txyzlIO7v5ED11d9EW/5I=;
        b=bXg2bBWlRV/VWepPPKfUL4toFrac1pPv181g4AL+Z/4jvmKEoLiLV3a5TpS69Vhd7P
         SKvhE2QvgNyLVsfiu9dGHIwJNl7pgam0LrNGvv6n6gxUbVmVkNRs47rlUxTFL4IdUlzz
         /QAc7stsfcTiuRScjBBKFO1f8A+oOhK21xXbKiBK1eedA5Ca1PBNYgu6+9dNiHCjVZsu
         Bjm5NvTEsouS0VIss9B43BxK7ywxTAXPe1xEGQKD9FBRftSgykI7WE+kS9i2cAp65Vqi
         aEjbzs89tATVOyO6wZnJXiWM538d6Gu588wFJkgGUF/qNhCjPNN6l/fEqRNa632+zykf
         msXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ndmZINi8/nRwu7d+LAYbr+txyzlIO7v5ED11d9EW/5I=;
        b=MdolA5qOH04Q6y++/GguNS54iblqSU1ZeIsIwYs0HQYoXFn26RXbTCbm1DQjJG2iYa
         jJgl7sxqn2U42EpQM2MBqqai6BDrXfcDSRZRLz9nJxkeMaMeo75SG0ahIktXVe0S9DV/
         w82wmMyDnvBLojT7ariyz6S/iGuRAx1+Px5lS9sx5f1M4kV1wsnYdgOkCaaNUGf9igO9
         lLj/xIufwN0xLK+yoisbX3H3o7QJhEEyKX4fRECs8cwI1UK8BD35rP3slQfCkqcpOji1
         A8QHp7E1XPdVQg8luALN4LzL8Wga4BVQ8lwp56aCWbSKjxlF8UICbZfUJ9pDfsngggSK
         77Dg==
X-Gm-Message-State: AOAM531U8IyNl40tLN0kkRX4GYHmWfx87/dt8Fzik1Xk3dxxucuwrRiy
        saaSH1OlXWxgips488Fd0PjChA==
X-Google-Smtp-Source: ABdhPJzLb9+p6Kfdr2Mjf3AENxX8NVujOQmqmyksXLrgLUu63ML3k4MQnHadxEaOa+SqRKDPi9C5IA==
X-Received: by 2002:a63:cd0d:: with SMTP id i13mr23582221pgg.292.1591092582021;
        Tue, 02 Jun 2020 03:09:42 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id d8sm1931276pgb.42.2020.06.02.03.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 03:09:41 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v4 1/5] regulator: Allow regulators to verify enabled during enable()
Date:   Tue,  2 Jun 2020 15:39:20 +0530
Message-Id: <20200602100924.26256-2-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200602100924.26256-1-sumit.semwal@linaro.org>
References: <20200602100924.26256-1-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some regulators might need to verify that they have indeed been enabled
after the enable() call is made and enable_time delay has passed.

This is implemented by repeatedly checking is_enabled() upto
poll_enabled_time, waiting for the already calculated enable delay in
each iteration.

Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
--
v2: Address review comments, including swapping enable_time and poll_enabled_time.
---
 drivers/regulator/core.c         | 58 +++++++++++++++++++++++++++++++-
 include/linux/regulator/driver.h |  5 +++
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 7486f6e4e613..d9ab888da95f 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2347,6 +2347,32 @@ static void _regulator_enable_delay(unsigned int delay)
 		udelay(us);
 }
 
+/* _regulator_check_status_enabled
+ *
+ * returns:
+ *          1 if status shows regulator is in enabled state
+ *          0 if not enabled state
+ *          else, error value as received from ops->get_status()
+ */
+static inline int _regulator_check_status_enabled(struct regulator_dev *rdev)
+{
+	int ret = rdev->desc->ops->get_status(rdev);
+
+	if (ret < 0) {
+		rdev_info(rdev, "get_status returned error: %d\n", ret);
+		return ret;
+	}
+
+	switch (ret) {
+	case REGULATOR_STATUS_OFF:
+	case REGULATOR_STATUS_ERROR:
+	case REGULATOR_STATUS_UNDEFINED:
+		return 0;
+	default:
+		return 1;
+	}
+}
+
 static int _regulator_do_enable(struct regulator_dev *rdev)
 {
 	int ret, delay;
@@ -2407,7 +2433,37 @@ static int _regulator_do_enable(struct regulator_dev *rdev)
 	 * together.  */
 	trace_regulator_enable_delay(rdev_get_name(rdev));
 
-	_regulator_enable_delay(delay);
+	/* If poll_enabled_time is set, poll upto the delay calculated
+	 * above, delaying poll_enabled_time uS to check if the regulator
+	 * actually got enabled.
+	 * If the regulator isn't enabled after enable_delay has
+	 * expired, return -ETIMEDOUT.
+	 */
+	if (rdev->desc->poll_enabled_time) {
+		unsigned int time_remaining = delay;
+
+		while (time_remaining > 0) {
+			_regulator_enable_delay(rdev->desc->poll_enabled_time);
+
+			if (rdev->desc->ops->get_status) {
+				ret = _regulator_check_status_enabled(rdev);
+				if (ret < 0)
+					return ret;
+				else if (ret)
+					break;
+			} else if (rdev->desc->ops->is_enabled(rdev))
+				break;
+
+			time_remaining -= rdev->desc->poll_enabled_time;
+		}
+
+		if (time_remaining <= 0) {
+			rdev_err(rdev, "Enabled check failed.\n");
+			return -ETIMEDOUT;
+		}
+	} else {
+		_regulator_enable_delay(delay);
+	}
 
 	trace_regulator_enable_complete(rdev_get_name(rdev));
 
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 29d920516e0b..bb50e943010f 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -322,6 +322,9 @@ enum regulator_type {
  * @enable_time: Time taken for initial enable of regulator (in uS).
  * @off_on_delay: guard time (in uS), before re-enabling a regulator
  *
+ * @poll_enabled_time: Maximum time (in uS) to poll if the regulator is
+ *                          actually enabled, after enable() call
+ *
  * @of_map_mode: Maps a hardware mode defined in a DeviceTree to a standard mode
  */
 struct regulator_desc {
@@ -389,6 +392,8 @@ struct regulator_desc {
 
 	unsigned int off_on_delay;
 
+	unsigned int poll_enabled_time;
+
 	unsigned int (*of_map_mode)(unsigned int mode);
 };
 
-- 
2.26.2

