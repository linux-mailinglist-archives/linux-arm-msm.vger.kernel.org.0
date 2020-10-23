Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12CC0296FC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 14:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464146AbgJWM52 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 08:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S464124AbgJWM5Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 08:57:24 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 252DFC0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 05:57:23 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id k18so1422672wmj.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 05:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZFseCIKmd4AutdezcJJkL4SrWd2bZ1+/6MDl5tIHNnc=;
        b=YSUyy99Rkveptn5PzX5hv4IkjbPMMugLbvjuzfzkr96YHYPqTot2Ym3PIFQbNsDADW
         +LyYKNtpy9GHP3FWlcFzXQ2vJx+KwdYl8mYo3gYkugu4ORGpP8OsCspJQPQ2eV7S0zKo
         X8zh8zhobD0GBED+11SQDKq18CGTBwxos/NIalT6kmWUK/qk5gj59feAnpN3DQTa07gn
         3arL8KyFlaMixoJ1hmdn/ic95g348jXonXv3DZGxOolqBHnTpTNciXyiAzvu62ItqraW
         QehWjbwbom5rckpgGNfAiFRN0fwyOCk4umm8X0FzXUJfP9qGPurNsUNXbnEJhX2UZGh6
         d++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZFseCIKmd4AutdezcJJkL4SrWd2bZ1+/6MDl5tIHNnc=;
        b=TFYUW5ZoWJPUsQ6YGqdKF7nKz85J4PPc4K6WI0VICVgi23xybwI9KvLq2/B+415Tx/
         M5V+hALz9VsS//OluJDXroUypi92BftAVcl7tRFkQXHCQUMOBaBafe3gvStmWfvL+/fu
         0RBoiYZV3GOlgaJIE8/US0w7zys+IiroqTT1pmXNYEI2why6fGu/d0ZGOu7VlZBN9DIN
         cth855hK7oi1Cl24xWp1qq+u6MUFbMwiIcBdyVVTt2ZfHa+jOGmI6ucmQCwyZEhCdVA9
         h0N2ECoFKi+d4jOsOvXNCm7ARd6WB3ylZ6a3gDzR2/zgxLMhJgLVRM4eQsaUbb71pRKH
         d6Uw==
X-Gm-Message-State: AOAM532m/Ij9nijqEXmA4H+tB7LB+LwRn/w6l32PpsFyJ1n383JZq+JX
        /ECFpbjSlueDq0+V/t5Ttcqqxw==
X-Google-Smtp-Source: ABdhPJyeZZ9bzyZYKpr/fdm9hlTUGXOVfcvjpWFXRM7+3BGWOKN/dr4ppE4nP9V7lWvvdA17YpLJ0A==
X-Received: by 2002:a1c:383:: with SMTP id 125mr660940wmd.175.1603457841937;
        Fri, 23 Oct 2020 05:57:21 -0700 (PDT)
Received: from localhost.localdomain (hst-221-77.medicom.bg. [84.238.221.77])
        by smtp.gmail.com with ESMTPSA id s19sm3475873wmc.0.2020.10.23.05.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:57:21 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/4] venus: helpers: Add a new helper for buffer processing
Date:   Fri, 23 Oct 2020 15:57:02 +0300
Message-Id: <20201023125704.4984-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201023125704.4984-1-stanimir.varbanov@linaro.org>
References: <20201023125704.4984-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The new helper will be used from encoder and decoder drivers
to enqueue buffers for processing by firmware.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 20 ++++++++++++++++++++
 drivers/media/platform/qcom/venus/helpers.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 2b6925b6c274..8d0ca70d740d 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1369,6 +1369,26 @@ void venus_helper_vb2_buf_queue(struct vb2_buffer *vb)
 }
 EXPORT_SYMBOL_GPL(venus_helper_vb2_buf_queue);
 
+void venus_helper_process_buf(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+	int ret;
+
+	cache_payload(inst, vb);
+
+	if (vb2_start_streaming_called(vb->vb2_queue)) {
+		ret = is_buf_refed(inst, vbuf);
+		if (ret)
+			return;
+
+		ret = session_process_buf(inst, vbuf);
+		if (ret)
+			return_buf_error(inst, vbuf);
+	}
+}
+EXPORT_SYMBOL_GPL(venus_helper_process_buf);
+
 void venus_helper_buffers_done(struct venus_inst *inst, unsigned int type,
 			       enum vb2_buffer_state state)
 {
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index a4a0562bc83f..dca4794c05d9 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -19,6 +19,7 @@ void venus_helper_buffers_done(struct venus_inst *inst, unsigned int type,
 int venus_helper_vb2_buf_init(struct vb2_buffer *vb);
 int venus_helper_vb2_buf_prepare(struct vb2_buffer *vb);
 void venus_helper_vb2_buf_queue(struct vb2_buffer *vb);
+void venus_helper_process_buf(struct vb2_buffer *vb);
 void venus_helper_vb2_stop_streaming(struct vb2_queue *q);
 int venus_helper_vb2_start_streaming(struct venus_inst *inst);
 void venus_helper_m2m_device_run(void *priv);
-- 
2.17.1

