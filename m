Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E27339F54B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 13:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232084AbhFHLo0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 07:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbhFHLoZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 07:44:25 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9441EC061787
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jun 2021 04:42:32 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id ba2so22394146edb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 04:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tFrq06L55Y88t1UsTNBMVBuhf1oW5jJWDm/FwjGxUTg=;
        b=Jp3nTomJgkEhgEeyNwnrzndFq1i5o2nkzUWx/TjttTeXoFc+xDqbl/RePlnQ34/o83
         aqETP9FV1A5nviFpqiUOhI2WiaWjQQCMqjUKjA7UUHB8kzTqJIA/gnWnur/Sb5Ayux/Y
         +VNdJOZdweRnciUJCKJxa76D1XseXobydCW9A/ZXTNUK2RLxcJFjkV06DEyndn1U3aNN
         bEzQOZ1jG2C2ZqEw57GLBKOoRD5TIqcNe9HTaMWLorKiUiyHw3qxr/pvZRh3itKpaMXp
         UKXp2+v37eTFZ8u41Xlq1T7meq98CeBY5+/mBUbNCkhsPrEticL4nsfddP52mycsznqM
         GmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tFrq06L55Y88t1UsTNBMVBuhf1oW5jJWDm/FwjGxUTg=;
        b=dAKZ/CxO0oQ9aERF/Ce3wno7pQMTXNjnWTn0p556lzJUQ/BNP3+ucAKDN70qorKUIW
         YBLiYS2totvyfr8hX6CLwLGn6gcCVOKe/Wu9OuEDlPfjA1oCL7Ns+y/ilCcoBv2KeSTk
         HdAXxyHdXAFjwX3qOZE9hYlqQVd4MI2zPVy5RcMLnPCFJX00av7Eva6ka+j22RTge37O
         jOl7ySK77krlaKtyDC25S0kRhJ5vr3VW17dHfloKq0ZmI6PEixBEwAxtYRzHAJr2wUIw
         8dvsr9wg+hiz8WG36r0KVFnhjWvuQLFMJ2FvruaR0vR0ujyPAF6FTwM/UKSeLH0Hio3+
         G96w==
X-Gm-Message-State: AOAM531SHu0qzMePOTWmj0CsrJtMopMbcJA++5j7WCRdKjfmmyX/Dxx0
        c5ir9YrHmV2NdOZe2/yhVYoGWA==
X-Google-Smtp-Source: ABdhPJw+uZQIHhLXGaXT3Ui6sOHP3nHG5aE5HnbKkLgQyrNANYbcdjG1Cf5aIH/wLOQ8wn/6cXokpg==
X-Received: by 2002:aa7:c68f:: with SMTP id n15mr9554873edq.145.1623152551207;
        Tue, 08 Jun 2021 04:42:31 -0700 (PDT)
Received: from localhost.localdomain (hst-221-104.medicom.bg. [84.238.221.104])
        by smtp.gmail.com with ESMTPSA id x4sm8754740edq.23.2021.06.08.04.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 04:42:30 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 4/5] venus: helpers: Add helper to mark fatal vb2 error
Date:   Tue,  8 Jun 2021 14:41:55 +0300
Message-Id: <20210608114156.87018-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608114156.87018-1-stanimir.varbanov@linaro.org>
References: <20210608114156.87018-1-stanimir.varbanov@linaro.org>
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
index 210c628ac8f4..abd41ebf3c1b 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1505,6 +1505,18 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
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

