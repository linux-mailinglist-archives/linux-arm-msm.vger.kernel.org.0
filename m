Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88F939F552
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 13:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbhFHLoi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 07:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232158AbhFHLoh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 07:44:37 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381F5C061789
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jun 2021 04:42:31 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id w21so24047628edv.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 04:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f6H94T+uU+WB+eDFyaDEtbp5loDIAeoS21OeowwkFpM=;
        b=QG/wJKFpRPzOEUjVnHHgCiipF5S/uZflN9CSbI/EZ499HxfDH2LyWhCQGMaRwX63GR
         cyZVrASsK+yDEOcb6wp3S/B9P0iGLsUrZoky7sjPviqNrBYbgozMFxG5Ygc9XRPKtKkB
         Blic0n4W89QaSKySvQcZr8ua9PBBk958JeicyM7MlddGuX7L0WtVpjvz09jsgPwQuQi+
         gU4u67SEkn01kb8FIRu4dDxlZiETFxTZ888peJK7suaY5tBf0nNkbgRDEBQA3aPD7cAZ
         EsWatH9P508SnFZpDc3aLzbNlJ7sObezxGWFlhf6kNrgiGo54VGYqZDmYUMHGncIdht/
         dHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f6H94T+uU+WB+eDFyaDEtbp5loDIAeoS21OeowwkFpM=;
        b=YwL12HPWuR4yrhaJhNQ5qtOR5HOAOPtCMqY68jqXydvu2Tul3nvfDvIZUz3wOMPNBW
         s1w2UyrVdBxvzYTppXqU/jUHrllUm/TU5WvNG16dMLub7k/eQ7Y47UhhW/Eu5zPSUm5z
         lRwLXtdq6X0CcbAazrmm7Qt+NHZz8fj5a/02ieds6lo56pb/9aq/Um+st1inhBAJcofP
         1AHqMtPmPbECaPJ7voCmCmKgqjQHPUi+qMd687ubS3zkdcMMa3QDvNyMOsNNK1/LZ4k8
         99QYhNripJAaC8EN1BKh1BinxkXr4k7NYVjRATY6svq/KD9CIbXLlJFCSlFksSkKJtrh
         yn/Q==
X-Gm-Message-State: AOAM533L5M/+aQ5ovZC4X1+vfu0UagL2I18us+NWTwuNpooECHwLWHLM
        CHjc4W4gh6a+kesh1pqJ39cqjw==
X-Google-Smtp-Source: ABdhPJyBfpIAhDrVqkuaOoJw+3WTk/udkxbSUmXfFxjapUZPAs45fsuajL7tw1HOAqRsnQO62kq3UA==
X-Received: by 2002:a05:6402:520b:: with SMTP id s11mr24744852edd.111.1623152549669;
        Tue, 08 Jun 2021 04:42:29 -0700 (PDT)
Received: from localhost.localdomain (hst-221-104.medicom.bg. [84.238.221.104])
        by smtp.gmail.com with ESMTPSA id x4sm8754740edq.23.2021.06.08.04.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 04:42:29 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 2/5] venus: Make sys_error flag an atomic bitops
Date:   Tue,  8 Jun 2021 14:41:53 +0300
Message-Id: <20210608114156.87018-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608114156.87018-1-stanimir.varbanov@linaro.org>
References: <20210608114156.87018-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make the sys_error flag an atomic bitops in order to avoid
locking in sys_error readers.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c    | 4 ++--
 drivers/media/platform/qcom/venus/core.h    | 3 ++-
 drivers/media/platform/qcom/venus/helpers.c | 2 +-
 drivers/media/platform/qcom/venus/hfi.c     | 2 +-
 drivers/media/platform/qcom/venus/vdec.c    | 2 +-
 5 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 91b15842c555..cc6195f2409c 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -65,7 +65,7 @@ static void venus_event_notify(struct venus_core *core, u32 event)
 	}
 
 	mutex_lock(&core->lock);
-	core->sys_error = true;
+	set_bit(0, &core->sys_error);
 	list_for_each_entry(inst, &core->instances, list)
 		inst->ops->event_notify(inst, EVT_SESSION_ERROR, NULL);
 	mutex_unlock(&core->lock);
@@ -161,7 +161,7 @@ static void venus_sys_error_handler(struct work_struct *work)
 	dev_warn(core->dev, "system error has occurred (recovered)\n");
 
 	mutex_lock(&core->lock);
-	core->sys_error = false;
+	clear_bit(0, &core->sys_error);
 	mutex_unlock(&core->lock);
 }
 
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 8df2d497d706..a625a8477f75 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -7,6 +7,7 @@
 #ifndef __VENUS_CORE_H_
 #define __VENUS_CORE_H_
 
+#include <linux/bitops.h>
 #include <linux/list.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-ctrls.h>
@@ -181,7 +182,7 @@ struct venus_core {
 	unsigned int state;
 	struct completion done;
 	unsigned int error;
-	bool sys_error;
+	unsigned long sys_error;
 	const struct hfi_core_ops *core_ops;
 	const struct venus_pm_ops *pm_ops;
 	struct mutex pm_lock;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 1fe6d463dc99..210c628ac8f4 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1477,7 +1477,7 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
 		ret |= venus_helper_intbufs_free(inst);
 		ret |= hfi_session_deinit(inst);
 
-		if (inst->session_error || core->sys_error)
+		if (inst->session_error || test_bit(0, &core->sys_error))
 			ret = -EIO;
 
 		if (ret)
diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index 0f2482367e06..179b1f8b2650 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -214,7 +214,7 @@ int hfi_session_init(struct venus_inst *inst, u32 pixfmt)
 	 * session_init() can't pass successfully
 	 */
 	mutex_lock(&core->lock);
-	if (!core->ops || core->sys_error) {
+	if (!core->ops || test_bit(0, &inst->core->sys_error)) {
 		mutex_unlock(&core->lock);
 		return -EIO;
 	}
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 198e47eb63f4..68736359fc2c 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1211,7 +1211,7 @@ static void vdec_session_release(struct venus_inst *inst)
 	ret = hfi_session_deinit(inst);
 	abort = (ret && ret != -EINVAL) ? 1 : 0;
 
-	if (inst->session_error || core->sys_error)
+	if (inst->session_error || test_bit(0, &core->sys_error))
 		abort = 1;
 
 	if (abort)
-- 
2.25.1

