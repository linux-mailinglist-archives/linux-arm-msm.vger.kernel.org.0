Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F19DB25E983
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Sep 2020 19:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728585AbgIERkx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Sep 2020 13:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728405AbgIERkJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Sep 2020 13:40:09 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114CFC061249
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2020 10:40:08 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id 92so7170540qtb.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2020 10:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gCuchGSyeN1SA4c28kpGChZYxpEctYzHgQAHlgn61ZY=;
        b=jAX0shsQRBi8WwQiwWenimkMPM+JLgv8FYxLya1CKoQSuwc6jUwz9RwHz+pEnoIL2q
         9kGXSYgaDZrH0Wkkx+Ufc79W0ByqnBlqByqTcz+KZARiExXjzW4FhNK6Zvm/EvjZLf6+
         l2bti/wH7Uu64/ak9oJ288mcso3jkdCGH3b2IMyTPUj70J0LHTctw85xs82V0eiJRcKb
         E87tkV6eDeM/aTQOvzZ7+7SRkqIFqPX54w7qcAWsd44l+XyywcK48wgQh85prip1qOl0
         1K4ztZFzkJEXPRPHwpGzLUi2LMS2z8O3nh+gaG+uO1YmkxYvnHC4CZAnLNd5kCxuEsYo
         I4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gCuchGSyeN1SA4c28kpGChZYxpEctYzHgQAHlgn61ZY=;
        b=iFljJkAQfuBi/zff1LgJJBeQTwQ/sRYDaf7qZLkCnwZsMgG9VsnBagfdej+hzyh1Ff
         Q5oHrWnpgHRrBVUp3GQ1dhpS6/1aoAGx5l3CratzCRH3lXVAVbCEjJHFCohYWHGeL0EC
         CSd3KELwSkoKsxDb1yhemodRXOn8j8GB4rf8nBM1Zox5vQc37HoD/GPRZkD0ZiPiReyr
         9Mgf/9bFe3JNI9nEimUyI9NCEjiUj9OET9eIFXyAa7VKOZ85hxUBZtYluWMxHgB4D/Od
         Y8KxDrC+tGyhtoAH9v8fMylFSYJNw+hdj+cTfIi72jHkjJj95I4thjcYd6uhQDgn9dHq
         +WOA==
X-Gm-Message-State: AOAM530vKWg6tLm3k/7EOIqgUpBanvdudh+YcnFf49fX2bTRNrZlCUgU
        Upc7AsMNHawFannnGCIeJce/6yDSnCegZoIAto8=
X-Google-Smtp-Source: ABdhPJwuhACwry7xvRE2wBQ9naoMrPAAX6O0+ahqxxrxKUd9wiHRK3QwKSBHcf43LGWu25mqzk01FA==
X-Received: by 2002:ac8:4906:: with SMTP id e6mr7514712qtq.360.1599327607134;
        Sat, 05 Sep 2020 10:40:07 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id k22sm4612076qkk.13.2020.09.05.10.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 10:40:06 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        alsa-devel@alsa-project.org (moderated list:SOUNDWIRE SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/4] soundwire: qcom: avoid dependency on CONFIG_SLIMBUS
Date:   Sat,  5 Sep 2020 13:39:03 -0400
Message-Id: <20200905173905.16541-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200905173905.16541-1-jonathan@marek.ca>
References: <20200905173905.16541-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver may be used without slimbus, so don't depend on slimbus.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/soundwire/Kconfig | 2 +-
 drivers/soundwire/qcom.c  | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
index fa2b4ab92ed9..f83d02c9c60a 100644
--- a/drivers/soundwire/Kconfig
+++ b/drivers/soundwire/Kconfig
@@ -33,7 +33,7 @@ config SOUNDWIRE_INTEL
 
 config SOUNDWIRE_QCOM
 	tristate "Qualcomm SoundWire Master driver"
-	depends on SLIMBUS
+	imply SLIMBUS
 	depends on SND_SOC
 	help
 	  SoundWire Qualcomm Master driver.
diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index d1e33ef1afac..6401ad451eee 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -753,7 +753,11 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	if (!ctrl)
 		return -ENOMEM;
 
+#if IS_ENABLED(CONFIG_SLIBMUS)
 	if (dev->parent->bus == &slimbus_bus) {
+#else
+	if (false) {
+#endif
 		ctrl->reg_read = qcom_swrm_ahb_reg_read;
 		ctrl->reg_write = qcom_swrm_ahb_reg_write;
 		ctrl->regmap = dev_get_regmap(dev->parent, NULL);
-- 
2.26.1

