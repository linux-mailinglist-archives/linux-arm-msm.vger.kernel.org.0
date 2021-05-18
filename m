Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3846387CBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 17:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345261AbhERPsB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 11:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350330AbhERPrW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 11:47:22 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB97C061343
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 08:45:28 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id k10so15310620ejj.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 08:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pBC9lAWMmdU2wypGRaqpn1YM7C+m/9LQ4eZFQOQwGaM=;
        b=V5vmq52b+rKzRQya3bt/2XugBvt5zZTXazpcMM91mDBR6xlKrEcXJUHCfPgP4cRTwu
         dJm+7hKTEeJAqdIPG7dlP8Ohpx+85+GSztuxIpRyh7kszcfUOUoVuwnz2oNuf5IUVP6R
         UNSf+CCPA5ZKrQRjobHJ+BFsCoKwKQxR2oh7r9rHoVlG3445qQRS1UPOqQbVdAVhGIty
         7YV+WONKc14E1ZT2UVM61zdboD8cGF+icAVxTuHyc9HAUrVFG8gsTZXDfF0VeuuPUZds
         hXKYP5/g+Qw7N67g2uZTfRMfdS9CIMCnuXe2LrKEXbMY8yScGXsqHCUA5Botle9q/SkN
         lVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pBC9lAWMmdU2wypGRaqpn1YM7C+m/9LQ4eZFQOQwGaM=;
        b=mfEaEA8wp+WsNBsmYPhFByoR378X6vyfrEpm/lWnMP64mo3f1bjhzR+yEe1wIw/Q5S
         bEiBoiC8IAtCJiDxo+TKqr33zDMb0T6keP+XE3Nt/rWbtZcCYYh/S/wTlZ+KR6Aa0cSJ
         OkqRRs7y8dYT0IbpKfdetZNE6W170zHyRnZKvm2V4u1tF20KabF0TWpPCHu0PwS2J9T8
         zp/tEgJ5BxOeahZmDE/w43cezppDFMFsOqfP8uEbxgnIOvCgspHY0qEg1LW3gFDi6IOE
         q9qDPizG80P24yDZ7lEJxtZMS1l71IOfJq+MjURQv2sWKMWP7KRaApp3F1ss6t6+Weev
         SkdA==
X-Gm-Message-State: AOAM532x/zBEHHJlUZoE1vOyLbbN7JgBA57ZtK9BoxA8M87BVRa2wvG4
        adJJK3xeLb/zn8EdSahd+O84VuLJnNWjjWMx
X-Google-Smtp-Source: ABdhPJyF0u5iCgHUOUf+Rga/dW7eHv6Htp7UVHdfG05mY3Ay4XOD/GtmnD+iTkFfo7hd386i1aoxkQ==
X-Received: by 2002:a17:906:3ed0:: with SMTP id d16mr6671002ejj.16.1621352727606;
        Tue, 18 May 2021 08:45:27 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id n17sm13016434eds.72.2021.05.18.08.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 08:45:27 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 4/5] venus: helpers: Add helper to mark fatal vb2 error
Date:   Tue, 18 May 2021 18:45:08 +0300
Message-Id: <20210518154509.602137-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518154509.602137-1-stanimir.varbanov@linaro.org>
References: <20210518154509.602137-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a helper to mark source and destination vb2 queues fatal
unrecoverable error.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 12 ++++++++++++
 drivers/media/platform/qcom/venus/helpers.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index de87f4c81a1c..6c4b64e995a1 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1506,6 +1506,18 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
 }
 EXPORT_SYMBOL_GPL(venus_helper_vb2_stop_streaming);
 
+void venus_helper_vb2_queue_error(struct venus_inst *inst)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct vb2_queue *q;
+
+	q = v4l2_m2m_get_src_vq(m2m_ctx);
+	vb2_queue_error(q);
+	q = v4l2_m2m_get_dst_vq(m2m_ctx);
+	vb2_queue_error(q);
+}
+EXPORT_SYMBOL_GPL(venus_helper_vb2_queue_error);
+
 int venus_helper_process_initial_cap_bufs(struct venus_inst *inst)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index e6269b4be3af..6a250c3d3cfe 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -21,6 +21,7 @@ int venus_helper_vb2_buf_prepare(struct vb2_buffer *vb);
 void venus_helper_vb2_buf_queue(struct vb2_buffer *vb);
 void venus_helper_vb2_stop_streaming(struct vb2_queue *q);
 int venus_helper_vb2_start_streaming(struct venus_inst *inst);
+void venus_helper_vb2_queue_error(struct venus_inst *inst);
 void venus_helper_m2m_device_run(void *priv);
 void venus_helper_m2m_job_abort(void *priv);
 int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
-- 
2.25.1

