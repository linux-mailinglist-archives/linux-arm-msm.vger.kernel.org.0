Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1F5B219F74
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 13:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgGIL7E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 07:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727849AbgGIL7D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 07:59:03 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 541ACC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 04:59:03 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id o8so1486142wmh.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 04:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zcfJN5PzuB9k5TgpYnzCkxNELSw0Z0tfL9cbkN0RIAE=;
        b=fJwRQNTMBNmDim0Hlmq+EPHYf0L4aBACOkST0gdSFrk5ErnIkYtEB6/X33rf5PshRF
         K0O3M6MDvxUYCzL+61sx+/KSk5FF0dFEaHzQI/xnr7d7KosigyuAyWaG7sVkscIdlCnC
         FqrRS/kRnZKMljSgJobQJZ89JG/r7secpKDZYPw8yajO9CImC8gR1il7ci9S9DScqS2x
         ndRlrzW2AlEqaZDjzM5QPReEe/KwiAqBw0LPGogK3gOV0+NkN70WXEvzuKB3TkRnOluy
         AS6abkq+IV2uTmwQw6OAHqOIqi0CUteOCManHQT660YL+U8z1J82XaykeEottgD5GG/u
         zAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zcfJN5PzuB9k5TgpYnzCkxNELSw0Z0tfL9cbkN0RIAE=;
        b=fufx8KNsG9fjPWMMrnzwImPzjTuItsvIlX+A/3QOLdtX1XIdGWJiwhw5duM1Ior5Ur
         65Peu2XLnXCrHwHdIOeGPeM9qYhbWgSEBVDIVoPxG02oX3NP6gP1blwwMsKdQwR3lDUX
         +vPHNAJ6PwpwZlcNjpwjOIU6QbQUfnIQ4mD3YSVFiwX7wKkVSUuz305N5otWTQ7L+kUe
         8dcZvIQ1T+1Cm3lslaeL+GgizzuXkDvf925Oo+4jgdzElrjfQpPF4biGS5ZpzUP+j/Lh
         rGeTtGqjlWo8t48GiJFEHVp7KvlYCnrXaDb1wHbCnoEk1lABpjJbcw6y5isJ1FjlTd+j
         J9IQ==
X-Gm-Message-State: AOAM531h+ywcRToMb5DCAJrEibzMqDWtpcTeGe+HJxuwML4tD7w0P1AE
        uFNT/xGCiZ4cqtLeVqqzA4aD6I4uy4tGnw==
X-Google-Smtp-Source: ABdhPJxU3M6MXPX7D0iPepfCyWsGPL+DqDWriB9veEsCLFC0X3m8qTWeyIx/dja2bs9QTgd6OmVe+A==
X-Received: by 2002:a1c:f407:: with SMTP id z7mr13705700wma.8.1594295941743;
        Thu, 09 Jul 2020 04:59:01 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-112.ip.btc-net.bg. [212.5.158.112])
        by smtp.gmail.com with ESMTPSA id v7sm5140737wrp.45.2020.07.09.04.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 04:59:01 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/2] venus: firmware: Set virtual address ranges
Date:   Thu,  9 Jul 2020 14:58:29 +0300
Message-Id: <20200709115829.8194-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709115829.8194-1-stanimir.varbanov@linaro.org>
References: <20200709115829.8194-1-stanimir.varbanov@linaro.org>
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

