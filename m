Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBB21074C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 16:27:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbfKVP1S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 10:27:18 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40484 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfKVP1S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 10:27:18 -0500
Received: by mail-wr1-f68.google.com with SMTP id 4so5772358wro.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2019 07:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uArUv8vdpySZgh7Lm5Xr7vRuWHgZ37E7MwLwkpMIDCE=;
        b=NaRspV1i9R/2DSgO46P3hMCkjk1YhaYl/30P0KnMRJ4U2uvFGg3fyz0Adr5Jvd2tOs
         eN0cW4S1Frgb4REXIEtg2D0LYumT1r8ky//58cBQQ3nZGGPeaxEo0lCTHngODV8isvfq
         W82UlSHKhkNGQOOq36treKn6APbHFSpLG+0dFlmrZZSujY7v8yE9lKTGkPRnL6nseJWm
         01BumRD7UQxFXWoLol0hM1dgiNFU9P+mFr3MudOfVmKMxprhxWd5tWk789FwO7mK6Igz
         lOJRq6RcGGB1vWLC8Blp6UdSHvoICayQN2/Iz4s7GX/jXbDRLUPGeLRU8uCjFc2ygEvF
         vIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uArUv8vdpySZgh7Lm5Xr7vRuWHgZ37E7MwLwkpMIDCE=;
        b=Hin95r0g4hXNdRyvQii2oFadgKm6BJjDBFjl4sbX3P6R1l9lLHgVvsUjwF/q5hhgZk
         b4nf1RmpdGvgE3JmVg9AemJnr2Bq8Z2k9zGHrOTbsHg3z2V+F1Qg7qUbuRi8Ehx+9Pec
         8PVTqkxTrV54epkeWCltTc9tooEh0GnW7uhZGdXkNOHW7XqonjPEUDIKf3NuPbYzm5IE
         yim0gLLGeUaAKGgjnUc6j9jZt4ouNpMxUnK6s1OMy3xEDFwZoJdpP4xoVKGA0dLhDUbp
         LUBTshhDmfckimaKGT4ombg88LHdkA8whrCbiylD/wOKfPDl8JsKf+DJWeuYe6H/W1uq
         VRuA==
X-Gm-Message-State: APjAAAXBoM6ZP/BTA/6y0y2A/zCkIo9a99o6ArzRbAElRxjKVgpYU3Xh
        I8nvk3X1NZk0Cm4lihjsd7qIUA==
X-Google-Smtp-Source: APXvYqxpsLMTp4Sdlls7Ue49+WvdlWM7+fPYuN826F9zWH2JGbW4mESQKUt8w3gc6nmveBI8y85HEg==
X-Received: by 2002:adf:fad1:: with SMTP id a17mr17735327wrs.328.1574436435728;
        Fri, 22 Nov 2019 07:27:15 -0800 (PST)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id a206sm4061081wmf.15.2019.11.22.07.27.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 22 Nov 2019 07:27:15 -0800 (PST)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     linux-pm@vger.kernel.org, rostedt@goodmis.org, mingo@redhat.com
Cc:     bjorn.andersson@linaro.org, vincent.guittot@linaro.org,
        daidavid1@codeaurora.org, okukatla@codeaurora.org,
        evgreen@chromium.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        georgi.djakov@linaro.org
Subject: [PATCH v3 1/3] interconnect: Move internal structs into a separate file
Date:   Fri, 22 Nov 2019 17:27:10 +0200
Message-Id: <20191122152712.19105-2-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191122152712.19105-1-georgi.djakov@linaro.org>
References: <20191122152712.19105-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the interconnect framework internal structs into a separate file,
so that it can be included and used by ftrace code. This will allow us
to expose some more useful information in the traces.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/interconnect/core.c     | 30 ++-----------------------
 drivers/interconnect/internal.h | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 28 deletions(-)
 create mode 100644 drivers/interconnect/internal.h

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index c498796adc07..b06ed180bae3 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -19,39 +19,13 @@
 #include <linux/of.h>
 #include <linux/overflow.h>
 
+#include "internal.h"
+
 static DEFINE_IDR(icc_idr);
 static LIST_HEAD(icc_providers);
 static DEFINE_MUTEX(icc_lock);
 static struct dentry *icc_debugfs_dir;
 
-/**
- * struct icc_req - constraints that are attached to each node
- * @req_node: entry in list of requests for the particular @node
- * @node: the interconnect node to which this constraint applies
- * @dev: reference to the device that sets the constraints
- * @tag: path tag (optional)
- * @avg_bw: an integer describing the average bandwidth in kBps
- * @peak_bw: an integer describing the peak bandwidth in kBps
- */
-struct icc_req {
-	struct hlist_node req_node;
-	struct icc_node *node;
-	struct device *dev;
-	u32 tag;
-	u32 avg_bw;
-	u32 peak_bw;
-};
-
-/**
- * struct icc_path - interconnect path structure
- * @num_nodes: number of hops (nodes)
- * @reqs: array of the requests applicable to this path of nodes
- */
-struct icc_path {
-	size_t num_nodes;
-	struct icc_req reqs[];
-};
-
 static void icc_summary_show_one(struct seq_file *s, struct icc_node *n)
 {
 	if (!n)
diff --git a/drivers/interconnect/internal.h b/drivers/interconnect/internal.h
new file mode 100644
index 000000000000..5853e8faf223
--- /dev/null
+++ b/drivers/interconnect/internal.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Interconnect framework internal structs
+ *
+ * Copyright (c) 2019, Linaro Ltd.
+ * Author: Georgi Djakov <georgi.djakov@linaro.org>
+ */
+
+#ifndef __DRIVERS_INTERCONNECT_INTERNAL_H
+#define __DRIVERS_INTERCONNECT_INTERNAL_H
+
+/**
+ * struct icc_req - constraints that are attached to each node
+ * @req_node: entry in list of requests for the particular @node
+ * @node: the interconnect node to which this constraint applies
+ * @dev: reference to the device that sets the constraints
+ * @tag: path tag (optional)
+ * @avg_bw: an integer describing the average bandwidth in kBps
+ * @peak_bw: an integer describing the peak bandwidth in kBps
+ */
+struct icc_req {
+	struct hlist_node req_node;
+	struct icc_node *node;
+	struct device *dev;
+	u32 tag;
+	u32 avg_bw;
+	u32 peak_bw;
+};
+
+/**
+ * struct icc_path - interconnect path structure
+ * @num_nodes: number of hops (nodes)
+ * @reqs: array of the requests applicable to this path of nodes
+ */
+struct icc_path {
+	size_t num_nodes;
+	struct icc_req reqs[];
+};
+
+#endif
