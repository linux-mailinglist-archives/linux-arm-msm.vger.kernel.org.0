Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD7AC2AF3E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 15:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgKKOkZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 09:40:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbgKKOic (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 09:38:32 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F196C061A48
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 06:38:27 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id l1so2738509wrb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 06:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zbm0xMtaD/LBGoMU6CYy8HGE1zaoqwvW5S2bS4qwSZ8=;
        b=vcxHdqLGDJelSVhVlwwgQW4PNlodm6Kt9WQEYwxE0ELHbLx3s1pNqKNO2mYiE+lQet
         EbiYMzqjHd+xtRJyhR8GwAPxCbLvz00JQHjOKb4AdfU2T9P/SDoQsozaDXbhFIv51n2g
         nVhrafatWLIfWHbSYFEfb1p9G6Z6jSwizdMcTwuhKiOkPQnME3QhVF28bCdp0R3mXliS
         xEMANH+P6extWgHhkvFY8SkGGRrxlRzh86eG1xS8pb+Y8t85NS5J07uPclSYTsMghSB8
         gGBXjYLbROKdZ7ET5hAp+359+/t9T4si+NAzug9r4xVvdBWoLo3VLzx6JwXym3fk+fFi
         kUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zbm0xMtaD/LBGoMU6CYy8HGE1zaoqwvW5S2bS4qwSZ8=;
        b=gnmQUNBYY0+7Iq4DF7DTX0kh4H4F9yjcv9xV/SOUEK57EzD0V/8R6TwMt4NnrzHOzh
         5e5bxPY0fyUqicfvWrAc14SbmOJt0xMnqBCuGCxdxmwiXqhyfkT3SGcmRqF3aWNIEDeu
         xCQPxqlW3RLrEtVtP8UXUp7AKbQA52KmJRAdR3enpiK4E88QNGme2sHyKrd/CeLANNEV
         50KXnBmJUIgeNbGRskIFm6D7Fx8NmbgdFaUDl+P/CDRqoYQEudERwhBRqJChxFX0jafQ
         dqm1m51ALJEvLrgUykv+D0nE5DggHHXZNli/s+zvaP/nxASmZSFrSjd1l6DuXkNlbSmU
         N/eg==
X-Gm-Message-State: AOAM531fdsQvMgkcsWiFmTWysqYUtbQ79MOyD1bJdsu2qtx2omr4E1pH
        aPUvVkfjrF6vp3mdmQuL+fuPrw==
X-Google-Smtp-Source: ABdhPJxdzXy/ZsM+pI+WafdPtpTldiOKB3g52X0jJBAJajeZyDs1QAqpZ1FqrEcbwsIsOstirGpJhQ==
X-Received: by 2002:adf:9e08:: with SMTP id u8mr29366032wre.282.1605105506221;
        Wed, 11 Nov 2020 06:38:26 -0800 (PST)
Received: from localhost.localdomain (hst-221-89.medicom.bg. [84.238.221.89])
        by smtp.gmail.com with ESMTPSA id b8sm2991405wrv.57.2020.11.11.06.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 06:38:25 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 2/8] venus: helpers: Add a new helper for buffer processing
Date:   Wed, 11 Nov 2020 16:37:49 +0200
Message-Id: <20201111143755.24541-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
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
index efa2781d6f55..688e3e3e8362 100644
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
index f36c9f717798..231af29667e7 100644
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

