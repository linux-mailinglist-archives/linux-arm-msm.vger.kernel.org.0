Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8930021AEB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 07:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbgGJF3g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 01:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726965AbgGJF3f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 01:29:35 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B456CC08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 22:29:34 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k5so1769049plk.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 22:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MSKivOm6p95vIF+xsCRXaxJ3RfMT5lkhjSXb8u6KQ/A=;
        b=AzRvCMObicHfAfSGOvZ/3ah30NFhC9vr98FBzkz4giER7xo0+6P8IUylJlSB5/iQOR
         1VvOmSZfn07xLWzFBVbYNkXjFg5/hEO4mAIjtWCjDZKYF0WBcXc5x8h2sdfAKITqM93m
         LUfaYqFINu/y79ulwbcZypq3lkFVnBCWH1l8ygT14B3kZ9YGTiHyprIxFwmU0k1l+HHd
         5RxkB4R1JoSG7iDSma0TeNvG6sLp9NzsoiJeSr+vlqkMS9EVRC0eRrWBRFv89p18uB+g
         nncHWKBmkoKK4W5ti6WZD3IBE+fVVtlKe4GcgJa2iBw6MKpBOP89QqIM4BZ/jnMg9dxq
         DdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MSKivOm6p95vIF+xsCRXaxJ3RfMT5lkhjSXb8u6KQ/A=;
        b=UCQHjoU8qDkAQKEvNx9kW6fYti28inJN57oOUlAv5AGsnhTpf9ZkcOyMjX4i0bIfhi
         V9bDvBGxfvQkWbm1xF5hUS+ymaBxEhEXYLmdlkUlQkun4yR1AKVsU4/QwZGTKVTiwlc9
         lrz3D9NCb1QgmgtWHoLSYM8Qe+dvMLUbLqlQOiVx7S2cKxWtRdCdTKlLXkApOJksXZbh
         3dMk6kXm538oxw5//5f5rB1fHNCBQTM4CGzGA0hzK+XNwxHTTn8jn0cdrLtvUq8qYHJf
         CEfgHCPf3rIDKWHvRdoR79aayJ8/b8EsisDUA0wsdJa0kZ4AkJP5z6R1EO6k9dRqrvr2
         Ryhw==
X-Gm-Message-State: AOAM533GL+nqu3mCEeci278/TbGWQ7RmJWBsaV8Tc9GHQJZwMmqVOqW/
        y38BPJWQOK6E0k4q6KXS0/TlxQ==
X-Google-Smtp-Source: ABdhPJxBqKnOiFN5zT4yMxUULpbvDRje/8up4OMyF5ylvIfzUsV3GPVWeC5YvCbNeZXYWmyPOLd9Bw==
X-Received: by 2002:a17:902:ab94:: with SMTP id f20mr15348562plr.232.1594358973974;
        Thu, 09 Jul 2020 22:29:33 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id j17sm4168320pgn.87.2020.07.09.22.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 22:29:33 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [RESEND: PATCH v5 1/4] regulator: Allow regulators to verify enabled during enable()
Date:   Fri, 10 Jul 2020 10:59:16 +0530
Message-Id: <20200710052919.2611-2-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710052919.2611-1-sumit.semwal@linaro.org>
References: <20200710052919.2611-1-sumit.semwal@linaro.org>
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

---
v3: addressed minor review comments, improved kernel doc
v2: Address review comments, including swapping enable_time and poll_enabled_time.
---
 drivers/regulator/core.c         | 63 +++++++++++++++++++++++++++++++-
 include/linux/regulator/driver.h |  5 +++
 2 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 03154f5b939f..538a2779986a 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2347,6 +2347,37 @@ static void _regulator_enable_delay(unsigned int delay)
 		udelay(us);
 }
 
+/**
+ * _regulator_check_status_enabled
+ *
+ * A helper function to check if the regulator status can be interpreted
+ * as 'regulator is enabled'.
+ * @rdev: the regulator device to check
+ *
+ * Return:
+ * * 1			- if status shows regulator is in enabled state
+ * * 0			- if not enabled state
+ * * Error Value	- as received from ops->get_status()
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
@@ -2407,7 +2438,37 @@ static int _regulator_do_enable(struct regulator_dev *rdev)
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
+			rdev_err(rdev, "Enabled check timed out\n");
+			return -ETIMEDOUT;
+		}
+	} else {
+		_regulator_enable_delay(delay);
+	}
 
 	trace_regulator_enable_complete(rdev_get_name(rdev));
 
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 7eb9fea8e482..436df3ba0b2a 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -305,6 +305,9 @@ enum regulator_type {
  * @enable_time: Time taken for initial enable of regulator (in uS).
  * @off_on_delay: guard time (in uS), before re-enabling a regulator
  *
+ * @poll_enabled_time: The polling interval (in uS) to use while checking that
+ *                     the regulator was actually enabled. Max upto enable_time.
+ *
  * @of_map_mode: Maps a hardware mode defined in a DeviceTree to a standard mode
  */
 struct regulator_desc {
@@ -372,6 +375,8 @@ struct regulator_desc {
 
 	unsigned int off_on_delay;
 
+	unsigned int poll_enabled_time;
+
 	unsigned int (*of_map_mode)(unsigned int mode);
 };
 
-- 
2.27.0

