Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9816D158704
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 01:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbgBKAwe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 19:52:34 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40241 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727740AbgBKAwT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 19:52:19 -0500
Received: by mail-pg1-f194.google.com with SMTP id z7so4790827pgk.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 16:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VL9nzl13JbFlFI5aOpKHBIlRNrHP5XdfNTObBCxAwmM=;
        b=JsdDKXZg83El14Y+KO7R4dJ8Ux+zLngwyOQ9E8Xr/vgF278O/o+YOUlMivVMSxSyz6
         KdjF1kVdkSV/s78/LaHLL8i9pcK98CVtiaftdmgQD0OW2nB1DjSfT7Q4+ehI+VgxPazv
         wTEUd/05phFW0T0/V2uhM8oVi+rKJkYl2UIcv1RAgHxZbjaVssmGEPiuouiQBK8Ri3xB
         Vu8nQLRF7GAMalbw3I4lenhvjXMvRw7IEYTy+tBGZwzjwejo9JtIMpQdpyCP/5ybLmRT
         MwPovBVu4PJBO6EtHFf9S5YG2yrJ+ZKqtA7lBxRBg9B6P0YHEutD2AImaJLqtiY9GBs4
         2NKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VL9nzl13JbFlFI5aOpKHBIlRNrHP5XdfNTObBCxAwmM=;
        b=PJaDoHmywY0xWSV9/FyqgzUnkqLMzg5T/XE4J8gBEsdrelWbflXAvVCpiKflsPP8NI
         5CBl2H4VYraAUlrC/8j1XHF831aC/lhMirVkYIi1p+mdpni2/tpurK4NBNQdBWlxIxCl
         lJ/d8AmS7aFYet/7kJWvRRnoz6Wi223GWFsHp+26buL8JVTeDrpkJWUlelu0hAuIei33
         lFFz7uOvTEjTHE6QAQlKIVPw6TAGuzQmOaHRAYMdIWCh+HPrQvVu0pocZxcHmSWsfzKZ
         iAjG8v2rBPoGWdpsAm8+/a9lY151kVZ2Id+DGT9/ebYy/rN9PCbPUq/0ZW039r+y2mMG
         LSgg==
X-Gm-Message-State: APjAAAV1p8b7fEYUcozKioxTVoHrVy/5OMe0Vdvmb1vImS0HTiTtNdN/
        m9VDOgWJpsGIDU0xnbX0pGLm8Q==
X-Google-Smtp-Source: APXvYqxcdRYNV1rhar6shgYZDBGKPcIBa/X2p9rsfFfoCjyYkYM1zFHNbn0J6xNiVUAwIbwl77k/vQ==
X-Received: by 2002:a63:615:: with SMTP id 21mr4301621pgg.440.1581382338561;
        Mon, 10 Feb 2020 16:52:18 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q21sm1538480pff.105.2020.02.10.16.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 16:52:18 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 7/8] remoteproc: qcom: q6v5: Add common panic handler
Date:   Mon, 10 Feb 2020 16:50:58 -0800
Message-Id: <20200211005059.1377279-8-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a common panic handler that invokes a stop request and sleep enough
to let the remoteproc flush it's caches etc in order to aid post mortem
debugging. For now a hard coded 200ms is returned to the remoteproc
core, this value is taken from the downstream kernel.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Update return type and return the delay

 drivers/remoteproc/qcom_q6v5.c | 20 ++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index cb0f4a0be032..6bf660ad889c 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -15,6 +15,8 @@
 #include <linux/remoteproc.h>
 #include "qcom_q6v5.h"
 
+#define Q6V5_PANIC_DELAY_MS	200
+
 /**
  * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
  * @q6v5:	reference to qcom_q6v5 context to be reinitialized
@@ -162,6 +164,24 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_request_stop);
 
+/**
+ * qcom_q6v5_panic() - panic handler to invoke a stop on the remote
+ * @q6v5:	reference to qcom_q6v5 context
+ *
+ * Set the stop bit and sleep in order to allow the remote processor to flush
+ * its caches etc for post mortem debugging.
+ *
+ * Return: 200ms
+ */
+unsigned int qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
+{
+	qcom_smem_state_update_bits(q6v5->state,
+				    BIT(q6v5->stop_bit), BIT(q6v5->stop_bit));
+
+	return Q6V5_PANIC_DELAY_MS;
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
+
 /**
  * qcom_q6v5_init() - initializer of the q6v5 common struct
  * @q6v5:	handle to be initialized
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 7ac92c1e0f49..3bef8243b33b 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -42,5 +42,6 @@ int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
+unsigned int qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
 
 #endif
-- 
2.24.0

