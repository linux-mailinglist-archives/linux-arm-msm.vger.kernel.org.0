Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58B992B9F10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 01:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgKTAKz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 19:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgKTAKy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 19:10:54 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59491C0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 16:10:54 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id y17so10409659ejh.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 16:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8BqZDLR1KTW64ATacSPyzowe3YEGiz4Vofe4t7uU5S0=;
        b=BG6u3FCSYsvXsxcLJ3ptCA3WefTMqhq4F6JIdT1lsuAQQhPqfvAAkEvbQe3onfAuoW
         wMH7DDBnJjrzUoXss2CRC7QQZGOSikeyGenriG7/sdwnF0sKG33tLSnZ5kFv9x82G4+w
         kakz+fMlJ0fxG8b2dccrlKymBPLL0uSF4Fm2ucan75d4I+vrvtRo52A2a23zM/ByAshP
         3CqNIEoXSTdKBb+fG1XKtd3ItgQ2foLUmmATksCcFPxgABepsgrpWo/hcwy1C3MuQ9Na
         omw7FxX3J0vYI/ba6yPSBBip9oc3EjTuQSsNZ1miu5YcZwZfdrXrUu8iYq1X/HjFuXfG
         UkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8BqZDLR1KTW64ATacSPyzowe3YEGiz4Vofe4t7uU5S0=;
        b=UjPDnO08r4oc2dX4q47cig75YA6OlM70D+vq5uF5hHnJArTv2kTiz2OR8IA42Dra0j
         B0LSkzRSfEqj8fiTjbnPz1R5rWLssiMaxyX+pLqNxGxpZjJwXrt3D1//qxVYAef6XHF5
         xUZGpsjIF13l9zjxuTWNQpuCjyLRQjkluYwpKfoDWKECLGKclwtLtrKPCjkg4l1XusAa
         iVhnEQ90VC0sVd7U25py/iLa3Ez9FT88V6BzJ0l3WVkfDUc8aPZLpa8JwqqCxiIUkhZt
         ivpPZqkAaFBBbSQbKoxt00m1oqOKvTgDw71qHFIanj0W7LActkKz5pN8yTDTF0UCoRBI
         pQPw==
X-Gm-Message-State: AOAM5329o+gVyoMYXfxUJ6gVvwyzyohKusnTZx75ISRIDBi9o7Yt2v1K
        SGolKqJenF3c2D0y+VZPi9ggFeqnxr4LniB1
X-Google-Smtp-Source: ABdhPJySGdxMCiEw1PCMYgfl2sn85f7JCahwv/WnSPRnJWpsx6luiM58/wrwOiOE5F3J6rw+be0eIQ==
X-Received: by 2002:a17:906:bc9a:: with SMTP id lv26mr29636980ejb.409.1605831053076;
        Thu, 19 Nov 2020 16:10:53 -0800 (PST)
Received: from localhost.localdomain (hst-221-4.medicom.bg. [84.238.221.4])
        by smtp.gmail.com with ESMTPSA id k23sm383556edv.97.2020.11.19.16.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 16:10:52 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/3] venus: venc: Init the session only once in queue_setup
Date:   Fri, 20 Nov 2020 02:10:35 +0200
Message-Id: <20201120001037.10032-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120001037.10032-1-stanimir.varbanov@linaro.org>
References: <20201120001037.10032-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Init the hfi session only once in queue_setup and also cover that
with inst->lock.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/venc.c | 98 ++++++++++++++++++------
 1 file changed, 73 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 4ecf78e30b59..3a2e449663d8 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -725,8 +725,10 @@ static int venc_init_session(struct venus_inst *inst)
 	int ret;
 
 	ret = hfi_session_init(inst, inst->fmt_cap->pixfmt);
-	if (ret)
-		return ret;
+	if (ret == -EINVAL)
+		return 0;
+	else if (ret)
+		goto deinit;
 
 	ret = venus_helper_set_input_resolution(inst, inst->width,
 						inst->height);
@@ -762,17 +764,13 @@ static int venc_out_num_buffers(struct venus_inst *inst, unsigned int *num)
 	struct hfi_buffer_requirements bufreq;
 	int ret;
 
-	ret = venc_init_session(inst);
+	ret = venus_helper_get_bufreq(inst, HFI_BUFFER_INPUT, &bufreq);
 	if (ret)
 		return ret;
 
-	ret = venus_helper_get_bufreq(inst, HFI_BUFFER_INPUT, &bufreq);
-
 	*num = bufreq.count_actual;
 
-	hfi_session_deinit(inst);
-
-	return ret;
+	return 0;
 }
 
 static int venc_queue_setup(struct vb2_queue *q,
@@ -781,7 +779,7 @@ static int venc_queue_setup(struct vb2_queue *q,
 {
 	struct venus_inst *inst = vb2_get_drv_priv(q);
 	unsigned int num, min = 4;
-	int ret = 0;
+	int ret;
 
 	if (*num_planes) {
 		if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
@@ -803,6 +801,17 @@ static int venc_queue_setup(struct vb2_queue *q,
 		return 0;
 	}
 
+	ret = mutex_lock_interruptible(&inst->lock);
+	if (ret)
+		return ret;
+
+	ret = venc_init_session(inst);
+
+	mutex_unlock(&inst->lock);
+
+	if (ret)
+		return ret;
+
 	switch (q->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		*num_planes = inst->fmt_out->num_planes;
@@ -838,6 +847,54 @@ static int venc_queue_setup(struct vb2_queue *q,
 	return ret;
 }
 
+static int venc_buf_init(struct vb2_buffer *vb)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+
+	inst->buf_count++;
+
+	return venus_helper_vb2_buf_init(vb);
+}
+
+static void venc_release_session(struct venus_inst *inst)
+{
+	int ret, abort = 0;
+
+	mutex_lock(&inst->lock);
+
+	ret = hfi_session_deinit(inst);
+	abort = (ret && ret != -EINVAL) ? 1 : 0;
+
+	if (inst->session_error)
+		abort = 1;
+
+	if (abort)
+		hfi_session_abort(inst);
+
+	mutex_unlock(&inst->lock);
+
+	venus_pm_load_scale(inst);
+	INIT_LIST_HEAD(&inst->registeredbufs);
+	venus_pm_release_core(inst);
+}
+
+static void venc_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct venus_buffer *buf = to_venus_buffer(vbuf);
+
+	mutex_lock(&inst->lock);
+	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		if (!list_empty(&inst->registeredbufs))
+			list_del_init(&buf->reg_list);
+	mutex_unlock(&inst->lock);
+
+	inst->buf_count--;
+	if (!inst->buf_count)
+		venc_release_session(inst);
+}
+
 static int venc_verify_conf(struct venus_inst *inst)
 {
 	enum hfi_version ver = inst->core->res->hfi_version;
@@ -888,38 +945,28 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	inst->sequence_cap = 0;
 	inst->sequence_out = 0;
 
-	ret = venc_init_session(inst);
-	if (ret)
-		goto bufs_done;
-
 	ret = venus_pm_acquire_core(inst);
 	if (ret)
-		goto deinit_sess;
-
-	ret = venc_set_properties(inst);
-	if (ret)
-		goto deinit_sess;
+		goto error;
 
 	ret = venc_verify_conf(inst);
 	if (ret)
-		goto deinit_sess;
+		goto error;
 
 	ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
 					inst->num_output_bufs, 0);
 	if (ret)
-		goto deinit_sess;
+		goto error;
 
 	ret = venus_helper_vb2_start_streaming(inst);
 	if (ret)
-		goto deinit_sess;
+		goto error;
 
 	mutex_unlock(&inst->lock);
 
 	return 0;
 
-deinit_sess:
-	hfi_session_deinit(inst);
-bufs_done:
+error:
 	venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_QUEUED);
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		inst->streamon_out = 0;
@@ -940,7 +987,8 @@ static void venc_vb2_buf_queue(struct vb2_buffer *vb)
 
 static const struct vb2_ops venc_vb2_ops = {
 	.queue_setup = venc_queue_setup,
-	.buf_init = venus_helper_vb2_buf_init,
+	.buf_init = venc_buf_init,
+	.buf_cleanup = venc_buf_cleanup,
 	.buf_prepare = venus_helper_vb2_buf_prepare,
 	.start_streaming = venc_start_streaming,
 	.stop_streaming = venus_helper_vb2_stop_streaming,
-- 
2.17.1

