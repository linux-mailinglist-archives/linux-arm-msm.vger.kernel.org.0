Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8291E66B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 17:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404733AbgE1Pro (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 11:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404676AbgE1PrE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 11:47:04 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4CCC08C5C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 08:47:04 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t7so11694039plr.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 08:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KyQEzGyzaYw5IWn5g/75UMLFSkhlAAtyUxzYzVWL1hI=;
        b=B6fZFOPXlINNumfwCvb4M1+Lbl67pHh2jE6GhmJTySjRkf+DhDhRtqbsCH3uHuPArI
         NNdypH3hqwOSn3+AgnW7EdJU6gonFzCjQQeoDNGHRN8Y5zL9d+bjfozfI83PBjSIEiFh
         wcKk/G9OyoVmTtdVNO25Uyn5Ve2jHzU65xddhYSZT/ctnl72a3e3/mEhasjWD9Uj4yWa
         aBxGFqdpDceEnDm4mCrxmEQ3a1j2St1E6gQGtbVNT+RlXnU97aWAlEl0DGVosRGrImiZ
         du8WVebIRNthoE/I9ytP4vciOfDB/VyXzom+emikQzgl5LIk2rO9RRLh6Gy9o3N7fCGC
         js8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KyQEzGyzaYw5IWn5g/75UMLFSkhlAAtyUxzYzVWL1hI=;
        b=CgLhnqbqhkQJ7ZdWmpwMg4rJ3jfW9WAMFpOBxLKstCMVEWQWGx5QmDxWLd4p7Qo5Jb
         Kl8xHa5a9MbbyUPrk9cdNFxX8MbfG9qywQ6/13khNfJ6KKAwZMeEiB+iMe3GPJeGva8n
         rrFt8XFEYlSay/AixwqejEMUuELT1rolZKUyRb774+F/uwddKOUi5pqu6OuVYNnB0Dcj
         D3Rnz27TElznB47J4HgUeEkdI3hQQIvb2wE20ibwQKStXpeuIl45pkC8eBoCBXlU/vKH
         P9+XaCybqFeEyZDXSU09D2cT/wwgDx2c24yXomWnJFPeBPgEKjMjjCr4fS1nAMz7O8tk
         Bqqw==
X-Gm-Message-State: AOAM532yYzeszntNksib8F8Hht+GTf4LJxOtvXysAC5VBCIDT6efdX0Q
        /JyLytEZCA4t5En6xeJEJX0qtw==
X-Google-Smtp-Source: ABdhPJwuG1bZv/tBfujMCsmSXvQMl1Vfa8akWgxhHGSKy4wVvRhdiY4eDH3JPL7Kki/GZrRRFeyvyQ==
X-Received: by 2002:a17:90b:1482:: with SMTP id js2mr4611348pjb.54.1590680823540;
        Thu, 28 May 2020 08:47:03 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id y22sm5212551pfc.132.2020.05.28.08.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 08:47:02 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v3 1/5] regulator: Allow regulators to verify enabled during enable()
Date:   Thu, 28 May 2020 21:16:21 +0530
Message-Id: <20200528154625.17742-2-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528154625.17742-1-sumit.semwal@linaro.org>
References: <20200528154625.17742-1-sumit.semwal@linaro.org>
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
 drivers/regulator/core.c         | 28 ++++++++++++++++++++++++++++
 include/linux/regulator/driver.h |  5 +++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 7486f6e4e613..06199f182114 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2409,6 +2409,34 @@ static int _regulator_do_enable(struct regulator_dev *rdev)
 
 	_regulator_enable_delay(delay);
 
+	/* If set, poll upto poll_enabled_time uS to see if the regulator
+	 * actually got enabled.
+	 * For each iteration, wait for the enable_time delay calculated
+	 * above already.
+	 * If the regulator isn't enabled after poll_enabled_time has
+	 * expired, return -ETIMEDOUT.
+	 */
+	if (rdev->desc->poll_enabled_time) {
+		unsigned int time_remaining = rdev->desc->poll_enabled_time;
+
+		while (time_remaining > 0) {
+			/* We've already waited for enable_time above;
+			 * so we can start with immediate check of the
+			 * status of the regulator.
+			 */
+			if (rdev->desc->ops->is_enabled(rdev))
+				break;
+
+			_regulator_enable_delay(delay);
+			time_remaining -= delay;
+		}
+
+		if (time_remaining <= 0) {
+			rdev_err(rdev, "Enabled check failed.\n");
+			return -ETIMEDOUT;
+		}
+	}
+
 	trace_regulator_enable_complete(rdev_get_name(rdev));
 
 	return 0;
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

