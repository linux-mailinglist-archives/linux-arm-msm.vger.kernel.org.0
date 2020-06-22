Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 507D42036FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 14:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728199AbgFVMl0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 08:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728192AbgFVMl0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 08:41:26 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23542C061795
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 05:41:25 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h22so8564054pjf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MSKivOm6p95vIF+xsCRXaxJ3RfMT5lkhjSXb8u6KQ/A=;
        b=NkDb2DIJjstzdPiJdgcoV7o5+9TSMEIkFBQ+LImKCcn68yw1O6jSJ0sJS3RUovdmvJ
         ZhrNk7JcomCIeopxGzxo/wiVYUYeX1Cv/kJoXZz0R+rpgvd1RWiMaOgaRJWIEzBK3n16
         N+dxNCqAhAqJJzL5AFAITBdwNUjof2bNxUUCX5X+7CNtXBmcdO3EgO4/uEsdOTb9oSEC
         pf2XsmG4GkSU2lshTb0Nw++svCUpbOFDqbHUDET+TwZVa4RGien0pdR6mLLpnm5zFKDX
         izayXw0yxcrHkDSDqLYe+aBdXmTfUgFMsjO6XBz5cR4Fbw16ziPdWjH+Z9f1cAnEozOh
         eI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MSKivOm6p95vIF+xsCRXaxJ3RfMT5lkhjSXb8u6KQ/A=;
        b=hFh8gJGjYwx6gXA6JszIXAFtBI65J2dkwsrzlNGmULTRFznfTlkjZ9ooTbCp2URjDE
         u0GDVp1+xfSBzJdf8jsiJDJS0pzf2UGiKzlsEIo5Tes0vBNqgdVANJez0PU3Ry0hXnAA
         BIGKtZ+17O2btMayBVOev2QpTp2aVZTctxZwi0etKJYk/Wc5u6ZHfMmeVBcYYfCafgt7
         scEurbkCDKkCurf/VjTBDDgftMNnHRsOO1rBpAA2DuDHCWXf6CrlX1VRUYLhAsVhHWFi
         WHnLuIZahs77zAr13D9lRTpz68GnZdN+jP9CwhfOBlEGAhu7ya8qG06zqd6YiC5v1BJq
         WtaA==
X-Gm-Message-State: AOAM530+jGNtoXNAEATrYLP5Huvur0C6PcF/LNflhzISp5kJFD9rhuz1
        HE2yZJguDjdMwz6i6s21dz+Stw==
X-Google-Smtp-Source: ABdhPJyG2/JwS7bC4HVB0uvJoH/UbZ7OpMiVe3Q06q9v0mo7oPqV1SK3siOBx609yancSdugVYIVTQ==
X-Received: by 2002:a17:902:8694:: with SMTP id g20mr19560597plo.332.1592829684630;
        Mon, 22 Jun 2020 05:41:24 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id i62sm14590581pfg.90.2020.06.22.05.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 05:41:24 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v5 1/4] regulator: Allow regulators to verify enabled during enable()
Date:   Mon, 22 Jun 2020 18:11:07 +0530
Message-Id: <20200622124110.20971-2-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622124110.20971-1-sumit.semwal@linaro.org>
References: <20200622124110.20971-1-sumit.semwal@linaro.org>
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

