Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5F8D2B9F11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 01:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgKTAK4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 19:10:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbgKTAK4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 19:10:56 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13FEC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 16:10:55 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id o9so10498295ejg.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 16:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XHTQ09ms588+UpKY9R43+BC+T+D0Aapxn3qmLnckRdI=;
        b=XPlXiw46FSemcBKRoOKNNQnGUdTBhsiSyqgouYR1IbEKgCJYNMz/FXHvSq4dJ6P7Xj
         pkwE7cCegNift3rcuFCdN+ArxEv6b1PbvvBebtRSBAUovmlY2fKenivK7xDb+E3LZEcA
         MWil0sBIeGCBrewI6yZI9tKI/2QKqqZ9SrWQ/6cAuvT9PYGi9JlzxnlXxgOW60I/hdQb
         uuuOiPXikS11Vj5bZ1zV2HvqD+f+XSaCx+Pw3WCNcTh5ub/B9Z+CqZAnTnCqYm9AH/Yd
         wvvwkaR66lE33F1MLn7BLAMsNy+DsufZE3s8MdQ2eKrOItJBYn7Wnu4Lt47qpP8EGwKY
         j+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XHTQ09ms588+UpKY9R43+BC+T+D0Aapxn3qmLnckRdI=;
        b=IGHjOju/1+P3z3zeD7eOw27CO+16mWcPF9mSTzejfdDxkqIaKQDfnfRscch/60/Oct
         lHKzhzTEGFOOcpThfTgbl036BTjPzQioONUxqh0RtBI1wgUcyQW7Pix1QAB35u9xsN7x
         wXd8FiLheiUYIRT6+Mrfdya7jQKO436DHePuIYPxIHEwl8m9N0hCOIhFGC1n02zYyUnf
         QZakePfAKQDtrmwPW1TBs0ez6ZM4E8YiL351zrKOXoWy4k6AplyFEyK0Q773uMgm0ISr
         79DuiP22psurYLXL4L7roPkiJSiw+7o9EkWN84D1bKWj3bqu4pMl+LGKXLtIXE7ZWzZs
         2hng==
X-Gm-Message-State: AOAM53191OgDEjT5fV2G+2UkBtmvZkaHXbAA7/xDpFQEeZCahEzGB8Ra
        XhJPHqGMaQz+4DIn8Jd/Bd0now==
X-Google-Smtp-Source: ABdhPJzPi3Jx7MUnkqEKljskzOgWFThcO1Da5cfP8MZv//FMfGocVErt9cyG6x97pmaYOrtVcu2OwQ==
X-Received: by 2002:a17:906:1b04:: with SMTP id o4mr17902421ejg.531.1605831054650;
        Thu, 19 Nov 2020 16:10:54 -0800 (PST)
Received: from localhost.localdomain (hst-221-4.medicom.bg. [84.238.221.4])
        by smtp.gmail.com with ESMTPSA id k23sm383556edv.97.2020.11.19.16.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 16:10:54 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/3] venus: Limit HFI sessions to the maximum supported
Date:   Fri, 20 Nov 2020 02:10:36 +0200
Message-Id: <20201120001037.10032-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120001037.10032-1-stanimir.varbanov@linaro.org>
References: <20201120001037.10032-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently we rely on firmware to return error when we reach the maximum
supported number of sessions. But this errors are happened at reqbuf
time which is a bit later. The more reasonable way looks like is to
return the error on driver open.

To achieve that modify hfi_session_create to return error when we reach
maximum count of sessions and thus refuse open.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/hfi.c       | 19 +++++++++++++++----
 .../media/platform/qcom/venus/hfi_parser.c    |  3 +++
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index db0e6738281e..3a477fcdd3a8 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -96,6 +96,7 @@ struct venus_format {
 #define MAX_CAP_ENTRIES		32
 #define MAX_ALLOC_MODE_ENTRIES	16
 #define MAX_CODEC_NUM		32
+#define MAX_SESSIONS		16
 
 struct raw_formats {
 	u32 buftype;
diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index 638ed5cfe05e..8420be6d3991 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -175,6 +175,7 @@ static int wait_session_msg(struct venus_inst *inst)
 int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops)
 {
 	struct venus_core *core = inst->core;
+	int ret;
 
 	if (!ops)
 		return -EINVAL;
@@ -183,12 +184,22 @@ int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops)
 	init_completion(&inst->done);
 	inst->ops = ops;
 
-	mutex_lock(&core->lock);
-	list_add_tail(&inst->list, &core->instances);
-	atomic_inc(&core->insts_count);
+	ret = mutex_lock_interruptible(&core->lock);
+	if (ret)
+		return ret;
+
+	ret = atomic_read(&core->insts_count);
+	if (ret + 1 > core->max_sessions_supported) {
+		ret = -EAGAIN;
+	} else {
+		atomic_inc(&core->insts_count);
+		list_add_tail(&inst->list, &core->instances);
+		ret = 0;
+	}
+
 	mutex_unlock(&core->lock);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(hfi_session_create);
 
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 363ee2a65453..52898633a8e6 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -276,6 +276,9 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
 		words_count--;
 	}
 
+	if (!core->max_sessions_supported)
+		core->max_sessions_supported = MAX_SESSIONS;
+
 	parser_fini(inst, codecs, domain);
 
 	return HFI_ERR_NONE;
-- 
2.17.1

