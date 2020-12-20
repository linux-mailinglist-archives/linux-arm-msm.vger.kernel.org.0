Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D392DF4AF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Dec 2020 10:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727472AbgLTJe1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Dec 2020 04:34:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727381AbgLTJeO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Dec 2020 04:34:14 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2EE7C0611CA
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Dec 2020 01:32:53 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id r5so6712046eda.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Dec 2020 01:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DEs1jlqfRpmRp1QgU14zLhiXveVi1mzRfOntspJCdks=;
        b=orl0kZnme9l+fSwfq5e9A2EEgrbjubKmvQbOTNY8CScosT9Xk5vgZWmBaHn1kkj5my
         9xFP52PSre+xRstUWHc7lghm5waUTIV+WnKSO7SoICuRuzYMHl5K316J3LNsCiY54wLU
         sZ7xd/0C0yVaZyEYVpBmNlsAuM4xF5SdwXY4GOdUHi1jzHB+W7V9TAhIZXeyzSb8SmG5
         vhM2Kix9934u3reP40/XW70vqV8/226ex5Wg/ElA6WBrCiJqHPZ+4OMlkspgnN9HbOP4
         JppWLFoek7j7nulrzeZhm9FkGLAZZpAIXmZZ54DP3FZ17YTJJ0Y9QGk3Or/8K93jVGFG
         F3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DEs1jlqfRpmRp1QgU14zLhiXveVi1mzRfOntspJCdks=;
        b=aBi/rc6gtGLJf7FgUmfKuOOg2LRcpe0HzrV/tv9tDSVJwSQlSzkuRPtXPx4tXKGhEC
         Ag2mIxDjjUDqyOKj36Qzlal5YFv6Eyj5OUUrkmU/+mo3xANT+HQUaV2QbIlWy/CzttID
         p5EWrsUOLEh1qa4tqX3lYhvlCFneXfQBuXQH28TXqMUV3HTW78jfzw06Vo/eLDSiBlK6
         jcFRyct/O7dsva5fhTTHcekKcwiM0RVFPEHsv7iwFgawdMZmV0JUygApGycOmGbY3duR
         vglFkuDI6QiY+C67CFUgYBLl55Z2ZfY8HOI4a5RxTcovZLmOL71eoHJwPVZQH2GwktrO
         7pQw==
X-Gm-Message-State: AOAM531X+0uY4nkgeCSQQDE+CbnAtfGobc5V9+Qy5XlKaCVDKpXiSfis
        DSUN4MpE/nC18UnzxFY9RWlLhQ==
X-Google-Smtp-Source: ABdhPJwKCJfuE5gPB9LQhweSaMJDe4afawS0kzSQhreFVyFx9S1EYlAUCVal/CwuGJ+f5r5H5x8SYg==
X-Received: by 2002:aa7:cac2:: with SMTP id l2mr11618071edt.141.1608456772331;
        Sun, 20 Dec 2020 01:32:52 -0800 (PST)
Received: from localhost.localdomain (hst-221-118.medicom.bg. [84.238.221.118])
        by smtp.gmail.com with ESMTPSA id z12sm7769814ejr.17.2020.12.20.01.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 01:32:51 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     vgarodia@codeaurora.org, acourbot@chromium.org,
        Fritz Koenig <frkoenig@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 2/5] venus: vdec: Make decoder return LAST flag for sufficient event
Date:   Sun, 20 Dec 2020 11:31:27 +0200
Message-Id: <20201220093130.10177-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201220093130.10177-1-stanimir.varbanov@linaro.org>
References: <20201220093130.10177-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This makes the decoder to behaives equally for sufficient and
insufficient events. After this change the LAST buffer flag will be set
when the new resolution (in dynamic-resolution-change state) is smaller
then the old bitstream resolution.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 41 ++++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index eb94e167e282..4ce23c2fc6eb 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -637,6 +637,7 @@ static int vdec_output_conf(struct venus_inst *inst)
 {
 	struct venus_core *core = inst->core;
 	struct hfi_enable en = { .enable = 1 };
+	struct hfi_buffer_requirements bufreq;
 	u32 width = inst->out_width;
 	u32 height = inst->out_height;
 	u32 out_fmt, out2_fmt;
@@ -712,6 +713,22 @@ static int vdec_output_conf(struct venus_inst *inst)
 	}
 
 	if (IS_V3(core) || IS_V4(core)) {
+		ret = venus_helper_get_bufreq(inst, HFI_BUFFER_OUTPUT, &bufreq);
+		if (ret)
+			return ret;
+
+		if (bufreq.size > inst->output_buf_size)
+			return -EINVAL;
+
+		if (inst->dpb_fmt) {
+			ret = venus_helper_get_bufreq(inst, HFI_BUFFER_OUTPUT2, &bufreq);
+			if (ret)
+				return ret;
+
+			if (bufreq.size > inst->output2_buf_size)
+				return -EINVAL;
+		}
+
 		if (inst->output2_buf_size) {
 			ret = venus_helper_set_bufsize(inst,
 						       inst->output2_buf_size,
@@ -1346,19 +1363,15 @@ static void vdec_event_change(struct venus_inst *inst,
 	dev_dbg(dev, VDBGM "event %s sufficient resources (%ux%u)\n",
 		sufficient ? "" : "not", ev_data->width, ev_data->height);
 
-	if (sufficient) {
-		hfi_session_continue(inst);
-	} else {
-		switch (inst->codec_state) {
-		case VENUS_DEC_STATE_INIT:
-			inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
-			break;
-		case VENUS_DEC_STATE_DECODING:
-			inst->codec_state = VENUS_DEC_STATE_DRC;
-			break;
-		default:
-			break;
-		}
+	switch (inst->codec_state) {
+	case VENUS_DEC_STATE_INIT:
+		inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
+		break;
+	case VENUS_DEC_STATE_DECODING:
+		inst->codec_state = VENUS_DEC_STATE_DRC;
+		break;
+	default:
+		break;
 	}
 
 	/*
@@ -1367,7 +1380,7 @@ static void vdec_event_change(struct venus_inst *inst,
 	 * itself doesn't mark the last decoder output buffer with HFI EOS flag.
 	 */
 
-	if (!sufficient && inst->codec_state == VENUS_DEC_STATE_DRC) {
+	if (inst->codec_state == VENUS_DEC_STATE_DRC) {
 		int ret;
 
 		inst->next_buf_last = true;
-- 
2.17.1

