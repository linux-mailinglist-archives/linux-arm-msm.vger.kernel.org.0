Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6287244C0DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 13:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbhKJMKk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 07:10:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbhKJMKg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 07:10:36 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14501C061767
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 04:07:49 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id b68so2447900pfg.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 04:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VyhuPuo3Dr6FLX90Yql2n8R2Vy9SBLHywkAT4A3YPD8=;
        b=eIW85C9CExtGE8flCJQCSN+XChabht7eH0U/OVjuA7BCE91EkfJ/CNS4qiPD+AfL2g
         ri18zagn1FlARjWtl8GyWJXyJmVs4gYrpfHTS2VkiHKNvrZJ0DHmLN+3WiBf2xt/xCIx
         Sa+JSTYVw1AsCyhrg/wuSWCIKNJjDJcuKyV1jZaC/qQg9R3Lrn3kNngVHQXWf3d6Eg56
         NNrEEC9XkgSzHjuJOT6F8917/4hYEX9tEm8xJ2TWD+8ksPvfih+b9QkxfWQvF75EaIC8
         mPbI0jaYop4g4pOPqm1Zq5/DYeLGmWqtC33EoDJiRbr3g6H7a27n9aWvsWdti3zi9aom
         Aq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VyhuPuo3Dr6FLX90Yql2n8R2Vy9SBLHywkAT4A3YPD8=;
        b=jIC1p2xj8yFzDdd4Ix/61F4QFejIGli4rTYKammPaKDmTpEw6IXdzYLhx/d4PStCwU
         e+EnqoTUCePoqV/xmV/Inu0n958HaiBbOWV9VpsgmoaRrn7UxhpqF8N74htkJZy0GZJl
         QpezbqhWTcWw4Wh/RADupAK7vFKiYOZ2EXjlU48Wrhb0ClV3gifOp/RwegFMN51pbyTw
         2RtF7y0vCRO1wo8auaAyplkjn0Vslm6CTcA1MoHToz69JFiLy4Df0eLWHtZoTAkovS0k
         fZnRS7WRS7KmPjJzIXXDlNoheaJVXnutNU2+ZumXqhOsX7kn/08ZxJB8bTorMNyfJHTJ
         hmZw==
X-Gm-Message-State: AOAM533VISrMW0bnFVsXMVVkFQW+BSdLNtERQYfdNQQ9ppBzkcjWKKc8
        NqYpWz1xjgqLd0CwDKP/AUChsQ==
X-Google-Smtp-Source: ABdhPJwl2igEQDtRk6LZOS0wqIGXPufuKhjraU6yInpduw/FGk4ICc9QuBLJeHKQBXmPzwAgvuHk/A==
X-Received: by 2002:a63:e755:: with SMTP id j21mr11565738pgk.235.1636546068584;
        Wed, 10 Nov 2021 04:07:48 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id g9sm8377914pfc.182.2021.11.10.04.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 04:07:47 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Georgi Djakov <djakov@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 3/6] interconnect: icc-rpm: Add QNOC type QoS support
Date:   Wed, 10 Nov 2021 20:07:13 +0800
Message-Id: <20211110120716.6401-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110120716.6401-1-shawn.guo@linaro.org>
References: <20211110120716.6401-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It adds QoS support for QNOC type device which can be found on QCM2290
platform.  The downstream driver[1] includes support for priority,
limiter, regulator and forwarding setup.  As QCM2290 support only
requires priority and forwarding configuration, limiter and regulator
support are omitted for this initial submission.

[1] https://source.codeaurora.org/quic/la/kernel/msm-4.19/tree/drivers/soc/qcom/msm_bus/msm_bus_qnoc_adhoc.c?h=kernel.lnx.4.19.r22-rel

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c | 38 ++++++++++++++++++++++++++---
 drivers/interconnect/qcom/icc-rpm.h |  3 +++
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 264a9399fb28..22a98c0b29af 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -17,6 +17,13 @@
 #include "smd-rpm.h"
 #include "icc-rpm.h"
 
+/* QNOC QoS */
+#define QNOC_QOS_MCTL_LOWn_ADDR(n)	(0x8 + (n * 0x1000))
+#define QNOC_QOS_MCTL_DFLT_PRIO_MASK	0x70
+#define QNOC_QOS_MCTL_DFLT_PRIO_SHIFT	4
+#define QNOC_QOS_MCTL_URGFWD_EN_MASK	0x8
+#define QNOC_QOS_MCTL_URGFWD_EN_SHIFT	3
+
 /* BIMC QoS */
 #define M_BKE_REG_BASE(n)		(0x300 + (0x4000 * n))
 #define M_BKE_EN_ADDR(n)		(M_BKE_REG_BASE(n))
@@ -39,6 +46,27 @@
 #define NOC_QOS_MODEn_ADDR(n)		(0xc + (n * 0x1000))
 #define NOC_QOS_MODEn_MASK		0x3
 
+static int qcom_icc_set_qnoc_qos(struct icc_node *src, u64 max_bw)
+{
+	struct icc_provider *provider = src->provider;
+	struct qcom_icc_provider *qp = to_qcom_provider(provider);
+	struct qcom_icc_node *qn = src->data;
+	struct qcom_icc_qos *qos = &qn->qos;
+	int rc;
+
+	rc = regmap_update_bits(qp->regmap,
+			qp->qos_offset + QNOC_QOS_MCTL_LOWn_ADDR(qos->qos_port),
+			QNOC_QOS_MCTL_DFLT_PRIO_MASK,
+			qos->areq_prio << QNOC_QOS_MCTL_DFLT_PRIO_SHIFT);
+	if (rc)
+		return rc;
+
+	return regmap_update_bits(qp->regmap,
+			qp->qos_offset + QNOC_QOS_MCTL_LOWn_ADDR(qos->qos_port),
+			QNOC_QOS_MCTL_URGFWD_EN_MASK,
+			!!qos->urg_fwd_en << QNOC_QOS_MCTL_URGFWD_EN_SHIFT);
+}
+
 static int qcom_icc_bimc_set_qos_health(struct qcom_icc_provider *qp,
 					struct qcom_icc_qos *qos,
 					int regnum)
@@ -163,10 +191,14 @@ static int qcom_icc_qos_set(struct icc_node *node, u64 sum_bw)
 
 	dev_dbg(node->provider->dev, "Setting QoS for %s\n", qn->name);
 
-	if (qp->type == QCOM_ICC_BIMC)
+	switch (qp->type) {
+	case QCOM_ICC_BIMC:
 		return qcom_icc_set_bimc_qos(node, sum_bw);
-
-	return qcom_icc_set_noc_qos(node, sum_bw);
+	case QCOM_ICC_QNOC:
+		return qcom_icc_set_qnoc_qos(node, sum_bw);
+	default:
+		return qcom_icc_set_noc_qos(node, sum_bw);
+	}
 }
 
 static int qcom_icc_rpm_set(int mas_rpm_id, int slv_rpm_id, u64 sum_bw)
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index d8e77ce7fe06..66ce908a6e65 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -15,6 +15,7 @@
 enum qcom_icc_type {
 	QCOM_ICC_NOC,
 	QCOM_ICC_BIMC,
+	QCOM_ICC_QNOC,
 };
 
 /**
@@ -43,6 +44,7 @@ struct qcom_icc_provider {
  * @ap_owned: indicates if the node is owned by the AP or by the RPM
  * @qos_mode: default qos mode for this node
  * @qos_port: qos port number for finding qos registers of this node
+ * @urg_fwd_en: enable urgent forwarding
  */
 struct qcom_icc_qos {
 	u32 areq_prio;
@@ -51,6 +53,7 @@ struct qcom_icc_qos {
 	bool ap_owned;
 	int qos_mode;
 	int qos_port;
+	bool urg_fwd_en;
 };
 
 /**
-- 
2.17.1

