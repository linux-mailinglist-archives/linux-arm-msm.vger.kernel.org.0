Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44E305650DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 11:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233407AbiGDJcc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 05:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233787AbiGDJb5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 05:31:57 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA326DFC4
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 02:30:51 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id f85so4626352pfa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 02:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YZw35i4tD7dQYkHhZWLzGB0BrtXzLncPfNzT7OZ+gHQ=;
        b=zJLfFWR50xifb017AbS4VLlMX9D5KIZO7zGbryzvst11rcydT9/znH6sJj5AqXVOb5
         /nIgm3nUcfeWghxNPrldN9qyh7+8xfKW5d+PooJ/QDD2dkBHp55fMHlKVlaOSyiDoicN
         MtyUT3a2vrIwZYhdD/JpcKYfrLtg0G7P4QmNdaK3tD4JSje1eoGdU8Hj3hi6YPqWgyWi
         vxglTCiwSuzKdvvX2A5w/5eBhx3u8J8SNNkrd1/IE9WxR9h+UTbDb8Ez3uFcTvMKtqcm
         6u8Zk4kk4NMYRr/WlJeQN5eb8BhX1sZNu8japfKHad5YmwogJ+UurSBF2v+fOZQrH1/c
         T5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YZw35i4tD7dQYkHhZWLzGB0BrtXzLncPfNzT7OZ+gHQ=;
        b=oi6ZiNdGVpfX44mItGx/uj93pxeDarLM6XtsXzCAQ5sDkiW1rBaZ4U1d/qzmoV/fDL
         V3n6zy8oMmfDXAKVGtWhYU0KoKxC8XA+K2hP4b2ipaSHLIwNZyQFO9xdWYEe7CP5Nr72
         nB1sRhj2CzBrwsXcvzfTHkIbFUTLYhhFgh/Uuh1Pe7+2Qr3nxbDcGIb21kbOYvqM6wit
         10DSWHxZuXefzSyLmeWe6qrD/7uhMvWl1Ld34ECmDUrC4mi4pQr5I/lRggK5Quy3t9bz
         fca00V0DZYetfyAZsHL93b1x6IXlHpIqNeitGi084rYuY2VhSW04B/1okcghrVXQK3KU
         2bFQ==
X-Gm-Message-State: AJIora+7pBJFbPdC7z3TWZG1EOaG4mw6cV1kXrQMQLMX+9Bt4xnEevfC
        /GKvPGoU0Zw8BOvyvXUfH6FFoQ==
X-Google-Smtp-Source: AGRyM1scHocx0l8bITgGQYxRUu6bQxD8HFtyLboo6Uj6MK+WxTdK+yuP2/xv+Dhbg8EdtoH4ZbTfKA==
X-Received: by 2002:a63:481a:0:b0:411:7951:cbcd with SMTP id v26-20020a63481a000000b004117951cbcdmr24429313pga.66.1656927050901;
        Mon, 04 Jul 2022 02:30:50 -0700 (PDT)
Received: from leo-build-box.lan ([154.3.32.171])
        by smtp.gmail.com with ESMTPSA id ms16-20020a17090b235000b001ef81bac701sm2926177pjb.42.2022.07.04.02.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 02:30:50 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v3 4/5] interconnect: qcom: icc-rpm: Support multiple buckets
Date:   Mon,  4 Jul 2022 17:30:28 +0800
Message-Id: <20220704093029.1126609-5-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704093029.1126609-1-leo.yan@linaro.org>
References: <20220704093029.1126609-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current interconnect rpm driver uses a single aggregate bandwidth to
calculate the clock rates for both active and sleep clocks; therefore,
it has no chance to separate bandwidth requests for these two kinds of
clocks.

This patch studies the implementation from interconnect rpmh driver to
support multiple buckets.  The rpmh driver provides three buckets for
AMC, WAKE, and SLEEP; this driver only needs to use WAKE and SLEEP
buckets, but we keep the same way with rpmh driver, this can allow us to
reuse the DT binding and avoid to define duplicated data structures.

This patch introduces two callbacks: qcom_icc_pre_bw_aggregate() is used
to clean up bucket values before aggregate bandwidth requests, and
qcom_icc_bw_aggregate() is to aggregate bandwidth for buckets.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c | 51 ++++++++++++++++++++++++++++-
 drivers/interconnect/qcom/icc-rpm.h |  6 ++++
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 8c9d5cc7276c..b025fc6b97c9 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -254,6 +254,54 @@ static int __qcom_icc_set(struct icc_node *n, struct qcom_icc_node *qn,
 	return 0;
 }
 
+/**
+ * qcom_icc_rpm_pre_bw_aggregate - cleans up values before re-aggregate requests
+ * @node: icc node to operate on
+ */
+static void qcom_icc_pre_bw_aggregate(struct icc_node *node)
+{
+	struct qcom_icc_node *qn;
+	size_t i;
+
+	qn = node->data;
+	for (i = 0; i < QCOM_ICC_NUM_BUCKETS; i++) {
+		qn->sum_avg[i] = 0;
+		qn->max_peak[i] = 0;
+	}
+}
+
+/**
+ * qcom_icc_bw_aggregate - aggregate bw for buckets indicated by tag
+ * @node: node to aggregate
+ * @tag: tag to indicate which buckets to aggregate
+ * @avg_bw: new bw to sum aggregate
+ * @peak_bw: new bw to max aggregate
+ * @agg_avg: existing aggregate avg bw val
+ * @agg_peak: existing aggregate peak bw val
+ */
+static int qcom_icc_bw_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
+				 u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
+{
+	size_t i;
+	struct qcom_icc_node *qn;
+
+	qn = node->data;
+
+	if (!tag)
+		tag = QCOM_ICC_TAG_ALWAYS;
+
+	for (i = 0; i < QCOM_ICC_NUM_BUCKETS; i++) {
+		if (tag & BIT(i)) {
+			qn->sum_avg[i] += avg_bw;
+			qn->max_peak[i] = max_t(u32, qn->max_peak[i], peak_bw);
+		}
+	}
+
+	*agg_avg += avg_bw;
+	*agg_peak = max_t(u32, *agg_peak, peak_bw);
+	return 0;
+}
+
 static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 {
 	struct qcom_icc_provider *qp;
@@ -414,7 +462,8 @@ int qnoc_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&provider->nodes);
 	provider->dev = dev;
 	provider->set = qcom_icc_set;
-	provider->aggregate = icc_std_aggregate;
+	provider->pre_aggregate = qcom_icc_pre_bw_aggregate;
+	provider->aggregate = qcom_icc_bw_aggregate;
 	provider->xlate_extended = qcom_icc_xlate_extended;
 	provider->data = data;
 
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index ebee9009301e..a49af844ab13 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -6,6 +6,8 @@
 #ifndef __DRIVERS_INTERCONNECT_QCOM_ICC_RPM_H
 #define __DRIVERS_INTERCONNECT_QCOM_ICC_RPM_H
 
+#include <dt-bindings/interconnect/qcom,icc.h>
+
 #define RPM_BUS_MASTER_REQ	0x73616d62
 #define RPM_BUS_SLAVE_REQ	0x766c7362
 
@@ -65,6 +67,8 @@ struct qcom_icc_qos {
  * @links: an array of nodes where we can go next while traversing
  * @num_links: the total number of @links
  * @buswidth: width of the interconnect between a node and the bus (bytes)
+ * @sum_avg: current sum aggregate value of all avg bw requests
+ * @max_peak: current max aggregate value of all peak bw requests
  * @mas_rpm_id:	RPM id for devices that are bus masters
  * @slv_rpm_id:	RPM id for devices that are bus slaves
  * @qos: NoC QoS setting parameters
@@ -75,6 +79,8 @@ struct qcom_icc_node {
 	const u16 *links;
 	u16 num_links;
 	u16 buswidth;
+	u64 sum_avg[QCOM_ICC_NUM_BUCKETS];
+	u64 max_peak[QCOM_ICC_NUM_BUCKETS];
 	int mas_rpm_id;
 	int slv_rpm_id;
 	struct qcom_icc_qos qos;
-- 
2.25.1

