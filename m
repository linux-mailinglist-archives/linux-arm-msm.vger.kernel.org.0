Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99648246002
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 10:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbgHQI2R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 04:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728179AbgHQI1w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 04:27:52 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C176C061347
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 01:27:52 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 184so13175887wmb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 01:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zcfJN5PzuB9k5TgpYnzCkxNELSw0Z0tfL9cbkN0RIAE=;
        b=fjZxmbWLVWfR0iLLGuf/88YpQ0F2ZWyj7hbPvHooli1oXIM6NFVLeWiKy4eFCCf3R6
         HlhMr6GJD25u01TrOyorJfS+sRXj3vuQWiTv92F6rd5H47VJ/+1GAel98ubeckHKxs8t
         +4n6xG+DWmYKXWf7C6skUSR5clsn/GzFBH9yij4am2tu+0Xh5G24UnQr2zAMgGsMA7po
         UVAN8vRgdfnxCppv2Kc8DQGr2XDlXVlPk7zTfFlM+8ZyHNOSVlaTLadlJKLuNi/Dbh/R
         cKOvVIiuiu12B1dFUu0ajdGrIXLIhK7OUW3asQ7OQklM/RwlNDmoYD8BQ9QfxUr5gEi9
         sfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zcfJN5PzuB9k5TgpYnzCkxNELSw0Z0tfL9cbkN0RIAE=;
        b=Z5X2vFCQpiVUvrjo0Xd+sV3BixK5V03nEqTBgPupNnCD16CcbefU7mR14oAXaTbJ02
         z7d+0tYD0sZbRdS2URLHyvYnDqoOuGfK3XfcZbfkRTJeJYyjiRlkVYDEl+S87jZuXb2P
         9yAXRosne0e4Pr0pvNjnw46uIB6Zxab9IeVHnN5BBoAmZHywiZlMnGefIfJq8Bj+Rrv4
         da3fM8tTsfOsnImk/HcB+WAmiTcWQRXcun9x1TaZY2XyTTEzd2mJz/xztm3M+hLcMVwK
         1H5Ekg8vQxX9wTCTttmgDTBI+fvN/IouTji1CsgNt8XSyOsIHytyt9+96gVr0fWcgiV6
         XOeg==
X-Gm-Message-State: AOAM5319QhJjgw64oEwhqHAjwHRMm0rGecLaA4IKU2CyuPHd0D/CoNiJ
        CoC15OlOvqdpwwf4tIPXcbrWzkeBC1FiCrOQ
X-Google-Smtp-Source: ABdhPJzV34MVYAoelp6tQN1LOFleejfdrtFuDVhwoh1mI+jgsHOmK2DcSd33CQUuR/lA5lLOwz1QDQ==
X-Received: by 2002:a1c:bcd6:: with SMTP id m205mr13252078wmf.47.1597652870880;
        Mon, 17 Aug 2020 01:27:50 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id h5sm33270888wrc.97.2020.08.17.01.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:27:50 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Elliot Berman <eberman@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 2/2] venus: firmware: Set virtual address ranges
Date:   Mon, 17 Aug 2020 11:27:23 +0300
Message-Id: <20200817082723.17458-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817082723.17458-1-stanimir.varbanov@linaro.org>
References: <20200817082723.17458-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to boot some of the new Venus firmware versions TZ call to set
virtual address ranges is needed. Add virtual address ranges for CP and
CP_NONPIX in resource structure and use them when loading and booting
the firmware on remote processor.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c     |  4 ++++
 drivers/media/platform/qcom/venus/core.h     |  4 ++++
 drivers/media/platform/qcom/venus/firmware.c | 18 +++++++++++++++++-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 203c6538044f..5f8f7b72731c 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -527,6 +527,10 @@ static const struct venus_resources sdm845_res_v2 = {
 	.vmem_size = 0,
 	.vmem_addr = 0,
 	.dma_mask = 0xe0000000 - 1,
+	.cp_start = 0,
+	.cp_size = 0x70800000,
+	.cp_nonpixel_start = 0x1000000,
+	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/venus-5.2/venus.mdt",
 };
 
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7118612673c9..8c88516e4694 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -68,6 +68,10 @@ struct venus_resources {
 	unsigned int vmem_id;
 	u32 vmem_size;
 	u32 vmem_addr;
+	u32 cp_start;
+	u32 cp_size;
+	u32 cp_nonpixel_start;
+	u32 cp_nonpixel_size;
 	const char *fwname;
 };
 
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 8801a6a7543d..ac906ffc608f 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -181,6 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
 int venus_boot(struct venus_core *core)
 {
 	struct device *dev = core->dev;
+	const struct venus_resources *res = core->res;
 	phys_addr_t mem_phys;
 	size_t mem_size;
 	int ret;
@@ -200,7 +201,22 @@ int venus_boot(struct venus_core *core)
 	else
 		ret = venus_boot_no_tz(core, mem_phys, mem_size);
 
-	return ret;
+	if (ret)
+		return ret;
+
+	if (core->use_tz && res->cp_size) {
+		ret = qcom_scm_mem_protect_video_var(res->cp_start,
+						     res->cp_size,
+						     res->cp_nonpixel_start,
+						     res->cp_nonpixel_size);
+		if (ret) {
+			dev_err(dev, "set virtual address ranges fail (%d)\n",
+				ret);
+			return ret;
+		}
+	}
+
+	return 0;
 }
 
 int venus_shutdown(struct venus_core *core)
-- 
2.17.1

